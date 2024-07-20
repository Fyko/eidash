use axum::extract::{Path, State};
use axum::routing::{delete, get, post};
use axum::{Json, Router};
use axum_core::response::{IntoResponse, Response};
use eidash_id::markers::UserId;
use http::StatusCode;

use crate::auth::AuthSession;
use crate::db::account::{self, AccountEntity};
use crate::db::user::{get_by_user_id, UserEntity};
use crate::ei::collect_backup::collect_backup;
use crate::ei::first_contact;
use crate::error::{AxumResult, Error};
use crate::models::api_account::APIAccount;
use crate::models::api_user::APIUser;
use crate::state::AppState;

pub fn router() -> Router<AppState> {
    Router::new()
        .route("/accounts", post(create_account))
        .route(
            "/accounts/:account_id/toggle_visibility",
            post(toggle_visibility),
        )
        .route("/accounts/:account_id", delete(delete_account))
}

#[derive(serde::Deserialize)]
struct SubmitEID {
    eid: String,
}

#[tracing::instrument(skip_all)]
#[axum::debug_handler]
async fn create_account(
    auth_session: AuthSession,
    State(state): State<AppState>,
    Json(SubmitEID { eid }): Json<SubmitEID>,
) -> AxumResult<Response> {
    let Some(auth_user) = auth_session.user else {
        return Err(Error::Unauthorized);
    };
    let user_id = auth_user.user_id;

    let save = match first_contact(&eid).await {
        Ok(save) => match save.error_message {
            Some(message) => return Err(Error::BadRequest(message)),
            None => save,
        },
        Err(e) => return Err(Error::BadRequest(e.to_string())),
    };

    let game_username = save
        .backup
        .as_ref()
        .map_or("unknown", |bak| bak.user_name());

    // see if any accounts exist for this eid
    if let Some(_) = sqlx::query_as!(
        AccountEntity,
        r#"select * from account where game_id = $1"#,
        eid,
    )
    .fetch_optional(&*state.db)
    .await?
    {
        // if it exists, throw a conflict
        return Ok((StatusCode::CONFLICT, "account already exists").into_response());
    }

    let count = sqlx::query!(
        "select count(*) from account where user_id = $1",
        user_id.to_string()
    )
    .fetch_one(&*state.db)
    .await?
    .count
    .unwrap_or(0) as i32;

    let account = sqlx::query_as!(
        AccountEntity,
        r#"insert into account(user_id, game_id, game_username, position) values ($1, $2, $3, $4) returning *"#,
        user_id.to_string(),
		eid,
		game_username,
		count, // zero-based
    )
    .fetch_one(&*state.db)
    .await?;

    let Some(backup) = save.backup else {
        tracing::error!(account = account.account_id.to_string(), "no backup found");
        return Ok(Json(APIAccount::from_row(account)).into_response());
    };

    collect_backup(&state.db, &account, &backup).await?;

    Ok(Json(APIAccount::from_row(account)).into_response())
}

#[tracing::instrument(skip_all)]
#[axum::debug_handler]
async fn toggle_visibility(
    auth_session: AuthSession,
    State(state): State<AppState>,
) -> AxumResult<Response> {
    let Some(auth_user) = auth_session.user else {
        return Err(Error::Unauthorized);
    };
    let user_id = auth_user.user_id;

    let new_visibility = match auth_user.profile_visibility.as_str() {
        "public" => "private",
        "private" => "public",
        _ => return Err(Error::BadRequest("invalid profile_visibility".to_string())),
    };

    let user = sqlx::query_as!(
        UserEntity,
        r#"update "user" set profile_visibility = $1 where user_id = $2 returning *"#,
        new_visibility,
        user_id.to_string(),
    )
    .fetch_one(&*state.db)
    .await?;

    Ok(Json(APIUser::from_row(user)).into_response())
}

#[derive(serde::Deserialize)]
struct DeleteAccount {
    account_id: String,
}

#[tracing::instrument(skip_all)]
#[axum::debug_handler]
async fn delete_account(
    auth_session: AuthSession,
    State(state): State<AppState>,
    Path(account_id): Path<String>,
) -> AxumResult<Response> {
    let Some(auth_user) = auth_session.user else {
        return Err(Error::Unauthorized);
    };
    let user_id = auth_user.user_id;

    if let None = sqlx::query!(
        r#"select account_id from account where account_id = $1 and user_id = $2"#,
        account_id,
        user_id.to_string(),
    )
    .fetch_optional(&*state.db)
    .await?
    {
        return Err(Error::NotFound);
    };

    sqlx::query!(r#"delete from account where account_id = $1"#, account_id)
        .execute(&*state.db)
        .await?;

    // todo: delete timeseries data

    Ok(StatusCode::NO_CONTENT.into_response())
}
