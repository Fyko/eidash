use axum::extract::Query;
use axum::response::Redirect;
use axum::routing::get;
use axum::Router;
use axum_core::response::IntoResponse;
use axum_login::tower_sessions::Session;
use http::StatusCode;

use crate::auth::{AuthSession, Credentials, OidcLoginState, OidcQuery, AUTHENTICATION_STATE_KEY};
use crate::state::AppState;

const NEXT_URL_KEY: &str = "auth.next-url";

pub fn router() -> Router<AppState> {
    Router::new()
        .route("/oidc/login", get(login))
        .route("/oidc/callback", get(callback))
}

#[derive(Serialize, Deserialize)]
struct StatusResponse {
    status: String,
}

/// Handles redirection to our authentication provider.
#[tracing::instrument(skip_all)]
#[axum::debug_handler]
async fn callback(
    mut auth_session: AuthSession,
    session: Session,
    Query(OidcQuery { code, state, .. }): Query<OidcQuery>,
) -> impl IntoResponse {
    let Ok(Some(auth_state)) = session.get::<OidcLoginState>(AUTHENTICATION_STATE_KEY) else {
        return (StatusCode::BAD_REQUEST, "No authentication state found.").into_response();
    };

    let creds = Credentials {
        code,
        auth_state,
        state,
    };

    let user = match auth_session.authenticate(creds).await {
        Ok(Some(user)) => user,
        Ok(None) => return (StatusCode::UNAUTHORIZED, "Invalid CSRF state.").into_response(),
        Err(_) => return StatusCode::INTERNAL_SERVER_ERROR.into_response(),
    };

    if auth_session.login(&user).await.is_err() {
        return StatusCode::INTERNAL_SERVER_ERROR.into_response();
    }

    if let Ok(Some(next)) = session.remove::<String>(NEXT_URL_KEY) {
        Redirect::to(&next).into_response()
    } else {
        Redirect::to("/").into_response()
    }
}

#[derive(Debug, Deserialize)]
pub struct LoginQuery {
    pub redirect_to: Option<String>,
}

#[tracing::instrument(skip_all)]
#[axum::debug_handler]
async fn login(
    auth_session: AuthSession,
    session: Session,
    Query(LoginQuery { redirect_to }): Query<LoginQuery>,
) -> impl IntoResponse {
    let (auth_url, auth_state) = auth_session.backend.authorize_url();

    session
        .insert(AUTHENTICATION_STATE_KEY, auth_state)
        .unwrap();
    session
        .insert(NEXT_URL_KEY, redirect_to.unwrap_or("/".to_string()))
        .unwrap();

    Redirect::temporary(auth_url.as_str()).into_response()
}
