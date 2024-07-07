use std::{sync::Arc, time::Duration};

use anyhow::Result;
use clokwerk::{AsyncScheduler, TimeUnits};
use futures_util::TryStreamExt;
use num_bigint::BigInt;
use sqlx::types::BigDecimal;
use time::OffsetDateTime;
use tokio::{sync::Semaphore, time::sleep};

use crate::{
    db::basic_save_v1::BasicSaveV1Entity,
    ei::{
        calculate_clothed::deterministic_clothed_eb, calculate_earnings_bonus, first_contact,
        get_epic_research_level, EarningsBonusData,
    },
    state::AppState,
};

pub async fn start(state: AppState) {
    tracing::info!("Starting clokwerk");

    let mut scheduler = AsyncScheduler::new();

    let state_clone = state.clone();
    scheduler.every(5.minutes()).run(move || {
        let state = state_clone.clone();
        async move {
            fetch_saves(&state).await.unwrap();
        }
    });

    tokio::spawn(async move {
        fetch_saves(&state).await.unwrap();
    });

    loop {
        scheduler.run_pending().await;
        sleep(Duration::from_millis(500)).await;
    }
}

async fn fetch_saves(state: &AppState) -> Result<()> {
    let mut users = sqlx::query!(r#"select user_id, ei_id from "user" where ei_id is not null"#)
        .fetch(&*state.db);

    let sempahore = Arc::new(Semaphore::new(10));
    while let Some(user) = users.try_next().await? {
        tokio::spawn({
            let state = state.clone();
            let semaphore_clone = sempahore.clone();
            async move {
                let permit = semaphore_clone.acquire().await.unwrap();

                tracing::debug!(user = user.user_id, "fetching save");
                let save = match first_contact(&user.ei_id.expect("infallible")).await {
                    Ok(save) => save,
                    Err(e) => {
                        tracing::error!(user = user.user_id, "failed to fetch save {e:#?}");
                        return;
                    }
                };
                drop(permit);

                let Some(backup) = save.backup else {
                    tracing::error!(user = user.user_id, "no backup found");
                    return;
                };

                let Some(ref game) = backup.game else {
                    tracing::error!("No game found for user {}", user.user_id);
                    return;
                };

                let Some(Ok(backup_time)) = backup
                    .settings
                    .as_ref()
                    .and_then(|s| s.last_backup_time)
                    .map(|t| OffsetDateTime::from_unix_timestamp(t as i64))
                else {
                    tracing::error!(user = user.user_id, "no backup_time found");
                    return;
                };

                // let save_exists = sqlx::query_as!(
                //     BasicSaveV1Entity,
                //     "select * from basic_save_v1 where user_id = $1 and backup_time = $2",
                //     user.user_id,
                //     backup_time
                // )
                // .fetch_optional(&*state.db)
                // .await
                // .expect("fetching previous save failed");

                // if save_exists.is_some() {
                //     tracing::trace!(
                //         user = user.user_id,
                //         ?backup_time,
                //         "save already exists, skipping"
                //     );
                //     return;
                // }

                // let last_save = state
                //     .clickhouse
                //     .query(
                //         "select ?fields from basic_save_v1 where user_id = ? order by backup_time desc limit 1",
                //     )
                //     .bind(&user.user_id)
                //     .fetch_optional::<BasicSaveV1Row>()
                //     .await
                //     .expect("fetching last save failed");

                let soul_eggs = game.soul_eggs_d() as u128;
                let eggs_of_prophecy = game.eggs_of_prophecy() as i32;
                let er_prophecy_bonus_level =
                    get_epic_research_level(&game, "prophecy_bonus") as i32;
                let er_soul_food_level = get_epic_research_level(&game, "soul_eggs") as i32;

                // if let Some(last_save) = last_save {
                //     if last_save.soul_eggs == soul_eggs
                //         && last_save.eggs_of_prophecy == eggs_of_prophecy
                //         && last_save.er_prophecy_bonus_level == er_prophecy_bonus_level
                //         && last_save.er_soul_food_level == er_soul_food_level
                //     {
                //         tracing::trace!(user = user.user_id, "no changes, skipping");
                //         return;
                //     }
                // }

                let computed_earnings_bonus = calculate_earnings_bonus(
                    &EarningsBonusData {
                        soul_eggs: soul_eggs as f64,
                        eggs_of_prophecy,
                        er_prophecy_bonus_level,
                        er_soul_food_level,
                    },
                    None,
                );

                let best_clothed_eb = deterministic_clothed_eb(&backup);

                if let Err(e) = sqlx::query!(
                    r#"
                        insert into basic_save_v1 (
                            user_id,
                            computed_earnings_bonus,
                            soul_eggs,
                            eggs_of_prophecy,
                            er_prophecy_bonus_level,
                            er_soul_food_level,
                            clothed_earnings_bonus,
                            time,
                            backup_time
                        )
                        values ($1, $2, $3, $4, $5, $6, $7, $8, $9)
                    "#,
                    user.user_id,
                    computed_earnings_bonus,
                    BigDecimal::from(BigInt::from(soul_eggs)),
                    eggs_of_prophecy,
                    er_prophecy_bonus_level,
                    er_soul_food_level,
                    best_clothed_eb,
                    OffsetDateTime::now_utc(),
                    backup_time,
                )
                .execute(&*state.db)
                .await
                {
                    tracing::error!(user = user.user_id, "failed to insert save {e:#?}",);
                }
            }
        });
    }

    Ok(())
}
