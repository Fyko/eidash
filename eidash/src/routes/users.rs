use axum::extract::{Path, State};
use axum::routing::{get, post};
use axum::{Json, Router};
use axum_core::response::{IntoResponse, Response};
use eidash_id::markers::UserId;

use crate::auth::AuthSession;
use crate::db::user::{get_by_user_id, UserEntity};
use crate::ei::first_contact;
use crate::error::{AxumResult, Error};
use crate::models::api_user::APIUser;
use crate::state::AppState;

pub fn router() -> Router<AppState> {
    Router::new()
        .route("/users/@me", get(get_user))
        .route("/users/@me/submit_eid", post(submit_eid))
}

#[tracing::instrument(skip_all)]
#[axum::debug_handler]
async fn get_user(
    auth_session: AuthSession,
    State(state): State<AppState>,
) -> AxumResult<Response> {
    let Some(auth_user) = auth_session.user else {
        return Err(Error::BadRequest("No user id in session".into()));
    };
    let user_id = auth_user.user_id;

    let Some(user) = get_by_user_id(&state.db, user_id).await? else {
        return Err(Error::NotFound);
    };

    Ok(Json(APIUser::from_row(user)).into_response())
}

#[derive(serde::Deserialize)]
struct SubmitEID {
    ei_id: String,
}

#[tracing::instrument(skip_all)]
#[axum::debug_handler]
async fn submit_eid(
    auth_session: AuthSession,
    State(state): State<AppState>,
    Json(SubmitEID { ei_id }): Json<SubmitEID>,
) -> AxumResult<Response> {
    let Some(auth_user) = auth_session.user else {
        return Err(Error::BadRequest("No user id in session".into()));
    };
    let user_id = auth_user.user_id;

    match first_contact(&ei_id).await {
        Ok(save) => match save.error_message {
            Some(message) => return Err(Error::BadRequest(message)),
            None => save,
        },
        Err(e) => return Err(Error::BadRequest(e.to_string())),
    };

    let new_user = sqlx::query_as!(
        UserEntity,
        r#"update "user" set ei_id = $1 where user_id = $2 returning *"#,
        ei_id,
        user_id.to_string(),
    )
    .fetch_one(&*state.db)
    .await?;

    Ok(Json(APIUser::from_row(new_user)).into_response())
}
