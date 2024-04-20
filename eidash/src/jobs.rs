use std::{sync::Arc, time::Duration};

use anyhow::Result;
use clokwerk::{AsyncScheduler, TimeUnits};
use ei_proto::backup::Game;
use futures_util::TryStreamExt;
use time::OffsetDateTime;
use tokio::{
    sync::{mpsc, Semaphore},
    time::sleep,
};

use crate::{clickhouse::BasicSaveV1Row, ei::first_contact, state::AppState};

pub async fn start(state: AppState) {
    tracing::info!("Starting clokwerk");

    let mut scheduler = AsyncScheduler::new();

    let state_clone = state.clone();
    scheduler.every(10.minutes()).run(move || {
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

    let mut insert = state.clickhouse.insert::<BasicSaveV1Row>("basic_save_v1")?;
    let (insert_tx, mut insert_rx) = mpsc::channel(128);
    let insert_handle = tokio::spawn(async move {
        while let Some(row) = insert_rx.recv().await {
            insert.write(&row).await.unwrap();
        }

        insert.end().await.unwrap();
    });

    let sempahore = Arc::new(Semaphore::new(10));
    if let Some(user) = users.try_next().await? {
        tokio::spawn({
            let state = state.clone();
            let inserter = insert_tx.clone();
            let semaphore_clone = sempahore.clone();
            async move {
                let permit = semaphore_clone.acquire().await.unwrap();

                tracing::trace!(user = user.user_id, "fetching save");
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

                let Some(game) = backup.game else {
                    tracing::error!("No game found for user {}", user.user_id);
                    return;
                };

                let Some(backup_time) = backup
                    .settings
                    .map(|s| s.last_backup_time)
                    .flatten()
                    .map(|t| t as i64)
                else {
                    tracing::error!(user = user.user_id, "no backup_time found");
                    return;
                };
                let save_exists = state
                    .clickhouse
                    .query(
                        "select ?fields from basic_save_v1 where user_id = ? and backup_time = ?",
                    )
                    .bind(&user.user_id)
                    .bind(&backup_time)
                    .fetch_optional::<BasicSaveV1Row>()
                    .await
                    .expect("fetching previous save failed");

                if save_exists.is_some() {
                    tracing::trace!(
                        user = user.user_id,
                        ?backup_time,
                        "save already exists, skipping"
                    );
                    return;
                }

                // let last_save = state
                //     .clickhouse
                //     .query(
                //         "select ?fields from basic_save_v1 where user_id = ? order by backup_time desc limit 1",
                //     )
                //     .bind(&user.user_id)
                //     .fetch_optional::<BasicSaveV1Row>()
                //     .await
                //     .expect("fetching last save failed");

                let soul_eggs = game.soul_eggs_d();
                let eggs_of_prophecy = game.eggs_of_prophecy();
                let er_prophecy_bonus_level = get_epic_research_level(&game, "prophecy_bonus");
                let er_soul_food_level = get_epic_research_level(&game, "soul_eggs");

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

                let computed_earnings_bonus = calculate_earnings_bonus(&EarningsBonusData {
                    soul_eggs,
                    eggs_of_prophecy,
                    er_prophecy_bonus_level,
                    er_soul_food_level,
                });

                inserter
                    .send(BasicSaveV1Row {
                        user_id: user.user_id,
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
            }
        });
    }

    drop(insert_tx); // by dropping the insert_tx, the .recv() will yeet once the last user is processed
    insert_handle.await.unwrap();

    Ok(())
}

fn get_epic_research_level(game: &Game, id: &str) -> u32 {
    game.epic_research
        .iter()
        .find(|r| r.id == Some(id.to_string()))
        .map(|r| r.level.map_or(0, |l| l))
        .unwrap_or(0)
}

struct EarningsBonusData {
    soul_eggs: f64,
    eggs_of_prophecy: u64,
    er_prophecy_bonus_level: u32,
    er_soul_food_level: u32,
}

fn calculate_earnings_bonus(data: &EarningsBonusData) -> f64 {
    let soul_egg_bonus = 0.1 + (data.er_soul_food_level as f64) * 0.01;
    let prophecy_egg_bonus = 0.05 + (data.er_prophecy_bonus_level as f64) * 0.01;

    (data.soul_eggs * soul_egg_bonus)
        * (1.0 + prophecy_egg_bonus).powf(data.eggs_of_prophecy as f64)
}
