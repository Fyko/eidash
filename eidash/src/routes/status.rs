use axum::extract::State;
use axum::routing::any;
use axum::{Json, Router};
use http::StatusCode;

use crate::auth::AuthSession;
use crate::state::AppState;
use crate::Result;

pub fn router() -> Router<AppState> {
    Router::new()
        .route("/healthz", any(status))
        .route("/ready", any(ready))
        // TODO: REMOVE ME
        .route("/", any(status))
}

#[derive(Serialize, Deserialize)]
struct StatusResponse {
    status: String,
}

#[tracing::instrument(skip_all)]
#[axum::debug_handler]
async fn status(
    auth_session: AuthSession,
    State(_state): State<AppState>,
) -> Result<Json<StatusResponse>> {
    tracing::info!("auth_session: {:#?}", auth_session.user);

    Ok(Json(StatusResponse {
        status: "Hello, world!".into(),
    }))
}

#[tracing::instrument(skip_all)]
#[axum::debug_handler]
async fn ready(State(state): State<AppState>) -> StatusCode {
    if state.api_healthy.load(std::sync::atomic::Ordering::SeqCst) {
        StatusCode::OK
    } else {
        StatusCode::SERVICE_UNAVAILABLE
    }
}
