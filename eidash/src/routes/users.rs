use axum::extract::{Path, State};
use axum::routing::get;
use axum::{Json, Router};
use axum_core::response::{IntoResponse, Response};
use eidash_id::markers::UserId;

use crate::auth::AuthSession;
use crate::db::account;
use crate::db::user::get_by_user_id;
use crate::error::{AxumResult, Error};
use crate::models::api_user::APIUser;
use crate::state::AppState;

pub fn router() -> Router<AppState> {
    Router::new().route("/users/:user_id", get(get_user))
}

#[tracing::instrument(skip_all)]
#[axum::debug_handler]
async fn get_user(
    auth_session: AuthSession,
    State(state): State<AppState>,
    Path(user_id): Path<UserId>,
) -> AxumResult<Response> {
    let querying_self = user_id == "@me"
        || auth_session
            .user
            .as_ref()
            .map_or(false, |u| u.user_id == user_id);

    let user_id = if querying_self {
        // only authorized users can query @me
        let Some(auth_user) = auth_session.user else {
            return Err(Error::Unauthorized);
        };

        auth_user.user_id
    } else {
        user_id
    };

    let Some(user) = get_by_user_id(&state.db, &user_id).await? else {
        return Err(Error::NotFound);
    };

    let accounts = account::get_many_by_user_id(&state.db, user_id).await?;

    let user = if querying_self {
        APIUser::from_row_with_accounts(user, accounts)
    } else {
        APIUser::private_from_row_with_accounts(user, accounts)
    };

    Ok(Json(user).into_response())
}
