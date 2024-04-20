// axum::debug_handler is angry without allowing diverging_sub_expression
#![allow(clippy::diverging_sub_expression)]

#[macro_use]
extern crate serde;

use std::time::Duration;

use auth::OidcBackend;
use axum::body::Body;
use axum::error_handling::HandleErrorLayer;
use axum::extract::{DefaultBodyLimit, MatchedPath};
use axum::http::Request;
use axum::{BoxError, Router};
use axum_login::AuthManagerLayerBuilder;
use config::CONFIG;
use error::Error;
use http::StatusCode;
use middleware::request_id;
use state::AppState;
use tower::timeout::error::Elapsed;
use tower::timeout::TimeoutLayer;
use tower::ServiceBuilder;
use tower_http::compression::CompressionLayer;
use tower_http::cors::CorsLayer;
use tower_http::trace::TraceLayer;
use tower_sessions::cookie::SameSite;
use tower_sessions::fred::clients::RedisClient;
use tower_sessions::fred::interfaces::ClientLike;
use tower_sessions::fred::types::{PerformanceConfig, ReconnectPolicy, RedisConfig};
use tower_sessions::{CachingSessionStore, Expiry, MokaStore, RedisStore, SessionManagerLayer};
use tracing::info_span;

pub type Result<T, E = Error> = anyhow::Result<T, E>;

pub mod auth;
pub mod clickhouse;
pub mod config;
pub mod db;
pub mod ei;
pub mod error;
pub mod jobs;
pub mod middleware;
pub mod models;
pub mod routes;
pub mod state;

pub async fn create_session_layer(
) -> anyhow::Result<SessionManagerLayer<CachingSessionStore<MokaStore, RedisStore>>> {
    let config = RedisConfig::from_url(&CONFIG.redis_url)?;
    let perf = PerformanceConfig::default();
    let policy = ReconnectPolicy::default();
    let client = RedisClient::new(config, Some(perf), None, Some(policy));

    let redis_conn = client.connect();
    tokio::spawn(async move {
        redis_conn.await.unwrap().expect("redis died");
    });
    client.wait_for_connect().await?;

    let moka_store = MokaStore::new(Some(1000));
    let redis_store = RedisStore::new(client);
    let caching_store = CachingSessionStore::new(moka_store, redis_store);
    let session_expiry = Expiry::OnInactivity(time::Duration::days(21));

    let layer = SessionManagerLayer::new(caching_store)
        .with_secure(!CONFIG.is_dev())
        .with_name("__eidash_session")
        .with_domain(CONFIG.domain.clone())
        .with_same_site(SameSite::Lax)
        .with_expiry(session_expiry);

    Ok(layer)
}

pub async fn create_router(state: AppState) -> anyhow::Result<Router<()>> {
    // session layer
    let session_layer = create_session_layer().await?;

    // auth layer
    let auth_backend = OidcBackend::new(state.clone(), CONFIG.oidc_scopes.clone()).await?;
    let auth_service = ServiceBuilder::new()
        .layer(HandleErrorLayer::new(|_: BoxError| async {
            StatusCode::BAD_REQUEST
        }))
        .layer(AuthManagerLayerBuilder::new(auth_backend, session_layer).build());

    let trace_layer = TraceLayer::new_for_http().make_span_with(|request: &Request<Body>| {
        let matched_path = request
            .extensions()
            .get::<MatchedPath>()
            .map(MatchedPath::as_str);

        info_span!(
          "http_request",
          method = ?request.method(),
          matched_path,
        )
    });

    let timeout_layer = ServiceBuilder::new()
        .layer(HandleErrorLayer::new(|e: BoxError| async move {
            if e.is::<Elapsed>() {
                (StatusCode::REQUEST_TIMEOUT, e.to_string())
            } else {
                (StatusCode::INTERNAL_SERVER_ERROR, e.to_string())
            }
        }))
        .layer(TimeoutLayer::new(Duration::from_secs(10)));

    // let origins = CONFIG
    //     .cors_allowed_origins
    //     .iter()
    //     .map(|origin| {
    //         origin
    //             .parse::<HeaderValue>()
    //             .expect("invalid cors_allowed_origins")
    //     })
    //     .collect::<Vec<HeaderValue>>();
    // tracing::debug!("allowed origins: {origins:#?}");

    // let cors_layer = CorsLayer::new()
    //     .allow_methods([Method::GET, Method::POST, Method::PUT])
    //     .allow_headers([ACCEPT, ACCEPT_ENCODING, AUTHORIZATION, CONTENT_TYPE, COOKIE])
    //     .allow_origin(origins)
    //     .allow_credentials(true)
    //     .allow_headers([CONTENT_TYPE]);
    let cors_layer = CorsLayer::very_permissive();

    let middleware = ServiceBuilder::new()
        .layer(request_id::layer())
        .layer(trace_layer)
        .layer(cors_layer)
        .layer(auth_service)
        .layer(DefaultBodyLimit::max(1024 * 1024 * 16)) // 16 MiB
        .layer(CompressionLayer::new().gzip(true).br(true))
        .layer(timeout_layer);

    Ok(routes(state).layer(middleware))
}

fn routes(state: AppState) -> Router<()> {
    let routers = vec![
        routes::oidc::router,
        routes::saves::router,
        routes::status::router,
        routes::users::router,
    ];

    Router::new()
        .merge(routes::status::router())
        .nest(
            "/api",
            routers
                .into_iter()
                .fold(Router::new(), |router, r| router.merge(r())),
        )
        .with_state(state)
}
