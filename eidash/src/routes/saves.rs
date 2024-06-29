use axum::extract::{Path, Query, State};
use axum::routing::get;
use axum::{Json, Router};
use axum_core::response::{IntoResponse, Response};
use eidash_id::markers::UserId;
use time::OffsetDateTime;

use crate::auth::AuthSession;
use crate::db::basic_save_v1::{APIBasicSaveV1, BasicSaveV1Entity};
use crate::db::user::get_by_user_id;
use crate::error::{AxumResult, Error};
use crate::state::AppState;

pub fn router() -> Router<AppState> {
    Router::new().route("/users/:user_id/basic-save-v1", get(get_saves))
}

#[derive(Debug, Deserialize)]
struct GetSavesQueryParams {
    timestamp_gte: Option<i64>,
    timestamp_lt: Option<i64>,
    limit: Option<i64>,
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

    let gte = timestamp_gte.map_or(OffsetDateTime::UNIX_EPOCH, |time| {
        OffsetDateTime::from_unix_timestamp(time).unwrap_or(OffsetDateTime::UNIX_EPOCH)
    });
    let lt = timestamp_lt.map_or(OffsetDateTime::now_utc(), |time| {
        OffsetDateTime::from_unix_timestamp(time).unwrap_or(OffsetDateTime::now_utc())
    });
    let lim: i64 = limit.unwrap_or(1_000_000_000_000);

    let saves = sqlx::query_as!(
        BasicSaveV1Entity,
        "select * from basic_save_v1 where user_id = $1 and time >= $2 and time < $3 order by time asc limit $4",
        user_id.to_string(),
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
