use axum::extract::State;
use axum::routing::{get, post};
use axum::{Json, Router};
use axum_core::response::{IntoResponse, Response};
use time::OffsetDateTime;

use crate::auth::AuthSession;
use crate::clickhouse::BasicSaveV1Row;
use crate::db::user::{get_by_user_id, UserEntity};
use crate::ei::{
    calculate_earnings_bonus, first_contact, get_epic_research_level, EarningsBonusData,
};
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
        return Err(Error::Unauthorized);
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
        return Err(Error::Unauthorized);
    };
    let user_id = auth_user.user_id;

    let save = match first_contact(&ei_id).await {
        Ok(save) => match save.error_message {
            Some(message) => return Err(Error::BadRequest(message)),
            None => save,
        },
        Err(e) => return Err(Error::BadRequest(e.to_string())),
    };

    let user = sqlx::query_as!(
        UserEntity,
        r#"update "user" set ei_id = $1 where user_id = $2 returning *"#,
        ei_id,
        user_id.to_string(),
    )
    .fetch_one(&*state.db)
    .await?;

    let Some(backup) = save.backup else {
        tracing::error!(user = user.user_id.to_string(), "no backup found");
        return Ok(Json(APIUser::from_row(user)).into_response());
    };

    let Some(game) = backup.game else {
        tracing::error!(user = user.user_id.to_string(), "no game found");
        return Ok(Json(APIUser::from_row(user)).into_response());
    };

    let Some(backup_time) = backup
        .settings
        .and_then(|s| s.last_backup_time)
        .map(|t| t as i64)
    else {
        tracing::error!(user = user.user_id.to_string(), "no backup_time found");
        return Ok(Json(APIUser::from_row(user)).into_response());
    };

    let soul_eggs = game.soul_eggs_d();
    let eggs_of_prophecy = game.eggs_of_prophecy();
    let er_prophecy_bonus_level = get_epic_research_level(&game, "prophecy_bonus");
    let er_soul_food_level = get_epic_research_level(&game, "soul_eggs");

    let computed_earnings_bonus = calculate_earnings_bonus(&EarningsBonusData {
        soul_eggs,
        eggs_of_prophecy,
        er_prophecy_bonus_level,
        er_soul_food_level,
    });

    state
        .clickhouse
        .insert("basic_save_v1")
        .unwrap()
        .write(&BasicSaveV1Row {
            user_id: user.user_id.to_string(),
            computed_earnings_bonus,
            soul_eggs,
            eggs_of_prophecy,
            er_prophecy_bonus_level,
            er_soul_food_level,
            timestamp: OffsetDateTime::now_utc(),
            backup_time: OffsetDateTime::from_unix_timestamp(backup_time)
                .expect("failed to convert backup_time"),
        })
        .await
        .unwrap();

    Ok(Json(APIUser::from_row(user)).into_response())
}
