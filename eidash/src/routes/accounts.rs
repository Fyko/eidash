use axum::extract::{Path, State};
use axum::routing::{delete, post};
use axum::{Json, Router};
use axum_core::response::{IntoResponse, Response};
use http::StatusCode;

use crate::auth::AuthSession;
use crate::db::account::AccountEntity;
use crate::ei::collect_backup::collect_backup;
use crate::ei::first_contact;
use crate::error::{AxumResult, Error};
use crate::models::api_account::APIAccount;
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
    if sqlx::query_as!(
        AccountEntity,
        r#"select * from account where game_id = $1"#,
        eid,
    )
    .fetch_optional(&*state.db)
    .await?
    .is_some()
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
    Path(account_id): Path<String>,
) -> AxumResult<Response> {
    let Some(auth_user) = auth_session.user else {
        return Err(Error::Unauthorized);
    };
    let user_id = auth_user.user_id;

    let Some(account) = sqlx::query_as!(
        AccountEntity,
        r#"select * from account where account_id = $1"#,
        account_id,
    )
    .fetch_optional(&*state.db)
    .await?
    else {
        return Err(Error::NotFound);
    };

    if account.user_id != user_id {
        return Err(Error::Unauthorized);
    }

    let new_visibility = match account.account_visibility.as_str() {
        "public" => "private",
        "private" => "public",
        _ => return Err(Error::BadRequest("invalid profile_visibility".to_string())),
    };

    let account = sqlx::query_as!(
        AccountEntity,
        r#"update account set account_visibility = $1 where account_id = $2 returning *"#,
        new_visibility,
        account_id,
    )
    .fetch_one(&*state.db)
    .await?;

    Ok(Json(APIAccount::from_row(account)).into_response())
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

    if sqlx::query!(
        r#"select account_id from account where account_id = $1 and user_id = $2"#,
        account_id,
        user_id.to_string(),
    )
    .fetch_optional(&*state.db)
    .await?
    .is_none()
    {
        return Err(Error::NotFound);
    };

    sqlx::query!(r#"delete from account where account_id = $1"#, account_id)
        .execute(&*state.db)
        .await?;

    // todo: delete timeseries data

    Ok(StatusCode::NO_CONTENT.into_response())
}
