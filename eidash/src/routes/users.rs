use axum::extract::{Path, State};
use axum::routing::{get, post};
use axum::{Json, Router};
use axum_core::response::{IntoResponse, Response};
use eidash_id::markers::UserId;
use num_bigint::BigInt;
use sqlx::types::BigDecimal;
use time::OffsetDateTime;

use crate::auth::AuthSession;
use crate::db::user::{get_by_user_id, UserEntity};
use crate::ei::{
    calculate_earnings_bonus, first_contact, get_epic_research_level, EarningsBonusData,
};
use crate::error::{AxumResult, Error};
use crate::models::api_user::APIUser;
use crate::state::AppState;

pub fn router() -> Router<AppState> {
    Router::new()
        .route("/users/:user_id", get(get_user))
        .route("/users/@me/submit_eid", post(submit_eid))
        .route("/users/@me/toggle_visibility", post(toggle_visibility))
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
        // only authorized users can query themselves
        let Some(auth_user) = auth_session.user else {
            return Err(Error::Unauthorized);
        };

        auth_user.user_id
    } else {
        user_id
    };

    let Some(user) = get_by_user_id(&state.db, user_id).await? else {
        return Err(Error::NotFound);
    };

    let user = if querying_self {
        APIUser::from_row(user)
    } else {
        APIUser::private(user)
    };

    Ok(Json(user).into_response())
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

    let soul_eggs = game.soul_eggs_d() as u128;
    let eggs_of_prophecy = game.eggs_of_prophecy() as i32;
    let er_prophecy_bonus_level = get_epic_research_level(&game, "prophecy_bonus") as i32;
    let er_soul_food_level = get_epic_research_level(&game, "soul_eggs") as i32;

    let computed_earnings_bonus = calculate_earnings_bonus(
        &EarningsBonusData {
            soul_eggs: soul_eggs as f64,
            eggs_of_prophecy,
            er_prophecy_bonus_level,
            er_soul_food_level,
        },
        None,
    );

    let backup_time =
        OffsetDateTime::from_unix_timestamp(backup_time).expect("failed to parse backuptime");
    if let Err(e) = sqlx::query!(
        r#"
            insert into basic_save_v1 (
                user_id,
                computed_earnings_bonus,
                soul_eggs,
                eggs_of_prophecy,
                er_prophecy_bonus_level,
                er_soul_food_level,
                time,
                backup_time
            )
            values ($1, $2, $3, $4, $5, $6, $7, $8)
        "#,
        user.user_id.to_string(),
        computed_earnings_bonus,
        BigDecimal::from(BigInt::from(soul_eggs)),
        eggs_of_prophecy,
        er_prophecy_bonus_level,
        er_soul_food_level,
        OffsetDateTime::now_utc(),
        backup_time,
    )
    .execute(&*state.db)
    .await
    {
        tracing::error!(
            user = user.user_id.to_string(),
            "failed to insert save {e:#?}",
        );
    }

    Ok(Json(APIUser::from_row(user)).into_response())
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
