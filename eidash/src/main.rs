use std::net::SocketAddr;
use std::sync::Arc;

use clickhouse::Client as ClickHouseClient;
use eidash::auth::create_oidc_client;
use eidash::config::{get_config, CONFIG};
use eidash::create_router;
use eidash::db::create_db;
use eidash::state::InnerAppState;
use tokio::net::TcpListener;
use tracing_subscriber::prelude::*;
use tracing_subscriber::{fmt, EnvFilter, Registry};

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    #[cfg(debug_assertions)]
    dotenvy::dotenv().ok();

    let _ = get_config();

    Registry::default()
        .with(
            EnvFilter::try_from_default_env()
                .unwrap_or_else(|_| "debug,tower_http=debug,axum::rejection=trace".into()),
        )
        .with(fmt::layer())
        .init();

    let db = create_db(CONFIG.database_url.clone()).await;
    sqlx::migrate!("../migrations").run(&*db).await?;

    let timescale = create_db(CONFIG.timescale_url.clone()).await;
    sqlx::migrate!("../timescale-migrations")
        .run(&*timescale)
        .await?;

    let oidc_client = Arc::from(
        create_oidc_client(
            CONFIG.oidc_issuer.clone(),
            CONFIG.oidc_client_id.clone(),
            Some(CONFIG.oidc_client_secret.clone()),
            CONFIG.oidc_redirect_url.clone(),
        )
        .await?,
    );

    let clickhouse_client = ClickHouseClient::default().with_url(CONFIG.clickhouse_url.clone());

    let state = Arc::new(InnerAppState {
        db,
        timescale,
        oidc_client,
        api_healthy: Arc::new(false.into()),
        clickhouse: Arc::new(clickhouse_client),
    });

    tokio::spawn({
        let state = state.clone();
        async move { eidash::jobs::start(state).await }
    });

    let app = create_router(state).await?;

    let addr = SocketAddr::from(([0, 0, 0, 0], CONFIG.api_port));
    let listener = TcpListener::bind(addr).await.unwrap();
    tracing::info!("Listening on http://{addr:?}");

    axum::serve(listener, app)
        .with_graceful_shutdown(shutdown_signal())
        .await?;

    Ok(())
}

async fn shutdown_signal() {
    let ctrl_c = async {
        tokio::signal::ctrl_c()
            .await
            .expect("failed to install Ctrl+C handler");
    };

    #[cfg(unix)]
    let terminate = async {
        tokio::signal::unix::signal(tokio::signal::unix::SignalKind::terminate())
            .expect("failed to install signal handler")
            .recv()
            .await;
    };

    #[cfg(not(unix))]
    let terminate = std::future::pending::<()>();

    tokio::select! {
        _ = ctrl_c => {},
        _ = terminate => {},
    }

    tracing::info!("signal received, starting graceful shutdown");
}
