use axum::extract::{Path, Query, State};
use axum::routing::get;
use axum::{Json, Router};
use axum_core::response::{IntoResponse, Response};
use eidash_id::markers::UserId;
use time::OffsetDateTime;

use crate::auth::AuthSession;
use crate::db::user::get_by_user_id;
use crate::error::{AxumResult, Error};
use crate::state::AppState;

pub fn router() -> Router<AppState> {
    Router::new().route("/users/:user_id/basic-save-v1", get(get_saves))
}

#[derive(Debug, Deserialize)]
struct GetSavesQueryParams {
    timestamp_gte: Option<u64>,
    timestamp_lt: Option<u64>,
    limit: Option<u64>,
}

#[tracing::instrument(skip_all)]
#[axum::debug_handler]
async fn get_saves(
    auth_session: AuthSession,
    State(state): State<AppState>,
    Path(user_id): Path<UserId>,
    Query(GetSavesQueryParams {
        timestamp_gte,
        timestamp_lt,
        limit,
    }): Query<GetSavesQueryParams>,
) -> AxumResult<Response> {
    let querying_self = user_id == "@me"
        || auth_session
            .user
            .as_ref()
            .map_or(false, |u| u.user_id == user_id);

    let user_id = if querying_self {
        // only authorized users can query themselves
        let Some(auth_user) = auth_session.user else {
            return Err(Error::Unauthorized);
        };

        auth_user.user_id
    } else {
        user_id
    };

    // check if the user has a public/private profile
    if !querying_self {
        let Some(queried_user_row) = get_by_user_id(&state.db, user_id.clone()).await? else {
            return Err(Error::NotFound);
        };

        if queried_user_row.profile_visibility == "private" {
            return Err(Error::Forbidden);
        }
    }

    let saves = sqlx::query!(
        "select * from basic_save_v1 where user_id = $1 and time >= $2 and time < $3 order by time asc limit $4",
        user_id.to_string(),
        timestamp_gte.map_or(0, |time| time / 1000),
        timestamp_lt.map_or(OffsetDateTime::now_utc().unix_timestamp() as u64, |time| time / 1000),
        limit.unwrap_or(1_000_000_000_000),
    );

    let saves = state
        .clickhouse
        .query("select * from basic_save_v1 where user_id = $1 and timestamp >= $2 and timestamp < $3 order by timestamp asc limit $4")
        .bind(user_id)
        .bind(timestamp_gte.map_or(0, |time| time / 1000))
        .bind(timestamp_lt.map_or(OffsetDateTime::now_utc().unix_timestamp() as u64, |time| time / 1000))
        .bind(limit.unwrap_or(1_000_000_000_000))
        .fetch_all::<BasicSaveV1Row>()
        .await
        .expect("failed to fetch saves");

    Ok(Json(saves).into_response())
}
