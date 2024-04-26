use axum::extract::{Path, Query, State};
use axum::routing::get;
use axum::{Json, Router};
use axum_core::response::{IntoResponse, Response};
use eidash_id::markers::UserId;
use time::OffsetDateTime;

use crate::auth::AuthSession;
use crate::clickhouse::BasicSaveV1Row;
use crate::error::{AxumResult, Error};
use crate::state::AppState;

pub fn router() -> Router<AppState> {
    Router::new().route("/users/:user_id/basic-save-v1", get(get_saves))
}

#[derive(Debug, Deserialize)]
struct GetSavesQueryParams {
    timestamp_gte: Option<u64>,
    timestamp_lt: Option<u64>,
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
    }): Query<GetSavesQueryParams>,
) -> AxumResult<Response> {
    // TODO: macro or extractor wrapped around AuthSession
    let user_id = if user_id == "@me" {
        let Some(auth_user) = auth_session.user else {
            return Err(Error::Unauthorized);
        };

        auth_user.user_id
    } else {
        return Err(Error::BadRequest(
            "You're not allowed to fetch other users".into(),
        ));
    };

    let saves = state
        .clickhouse
        .query("select * from basic_save_v1 where user_id = ? and timestamp >= ? and timestamp < ? order by timestamp asc")
        .bind(user_id)
        .bind(timestamp_gte.map_or(0, |time| time / 1000))
        .bind(timestamp_lt.map_or(OffsetDateTime::now_utc().unix_timestamp() as u64, |time| time / 1000))
        .fetch_all::<BasicSaveV1Row>()
        .await
        .expect("failed to fetch saves");

    Ok(Json(saves).into_response())
}
