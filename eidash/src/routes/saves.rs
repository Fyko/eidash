use axum::extract::{Path, Query, State};
use axum::routing::get;
use axum::{Json, Router};
use axum_core::response::{IntoResponse, Response};
use eidash_id::markers::AccountId;
use time::OffsetDateTime;

use crate::auth::AuthSession;
use crate::db::account::AccountEntity;
use crate::db::basic_save_v1::{APIBasicSaveV1, BasicSaveV1Entity};
use crate::error::{AxumResult, Error};
use crate::state::AppState;

pub fn router() -> Router<AppState> {
    Router::new().route("/accounts/:account_id/basic-save-v1", get(get_saves))
}

#[derive(Debug, Deserialize)]
struct GetSavesQueryParams {
    timestamp_gte: Option<i64>,
    timestamp_lt: Option<i64>,
    limit: Option<i64>,
}

// FIXME: allow @me query on accounts to fallback to only one account?
#[tracing::instrument(skip_all)]
#[axum::debug_handler]
async fn get_saves(
    auth_session: AuthSession,
    State(state): State<AppState>,
    Path(account_id): Path<AccountId>,
    Query(GetSavesQueryParams {
        timestamp_gte,
        timestamp_lt,
        limit,
    }): Query<GetSavesQueryParams>,
) -> AxumResult<Response> {
    let auth_user = auth_session.user;

    let Some(account) = sqlx::query_as!(
        AccountEntity,
        r#"select * from account where account_id = $1"#,
        account_id.to_string(),
    )
    .fetch_optional(&*state.db)
    .await?
    else {
        return Err(Error::NotFound);
    };

    let querying_self = if let Some(user) = auth_user {
        user.user_id == account.user_id
    } else {
        false
    };

    // check if the user has a public/private profile
    if !querying_self && account.account_visibility == "private" {
        return Err(Error::Unauthorized);
    }

    let gte = timestamp_gte.map_or(OffsetDateTime::UNIX_EPOCH, |time| {
        OffsetDateTime::from_unix_timestamp(time).unwrap_or(OffsetDateTime::UNIX_EPOCH)
    });
    let lt = timestamp_lt.map_or(OffsetDateTime::now_utc(), |time| {
        OffsetDateTime::from_unix_timestamp(time).unwrap_or(OffsetDateTime::now_utc())
    });
    let lim: i64 = limit.unwrap_or(1_000_000_000_000);

    let saves = sqlx::query_as!(
        BasicSaveV1Entity,
        "select * from basic_save_v1 where account_id = $1 and time >= $2 and time < $3 order by time asc limit $4",
        account_id.to_string(),
        gte,
        lt,
        lim
    )
    .fetch_all(&*state.db)
    .await
    .map_err(Error::from)?;

    Ok(Json(
        saves
            .into_iter()
            .map(APIBasicSaveV1::from)
            .collect::<Vec<_>>(),
    )
    .into_response())
}
