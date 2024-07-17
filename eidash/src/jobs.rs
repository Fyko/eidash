use std::{sync::Arc, time::Duration};

use anyhow::Result;
use clokwerk::{AsyncScheduler, TimeUnits};
use futures_util::TryStreamExt;
use tokio::{sync::Semaphore, time::sleep};

use crate::{
    db::user::UserEntity,
    ei::{collect_backup::collect_backup, first_contact},
    state::AppState,
};

pub async fn start(state: AppState) {
    tracing::info!("Starting jobs");

    let mut scheduler = AsyncScheduler::new();

    scheduler.every(5.minutes()).run({
        let state_clone = state.clone();

        move || {
            let state = state_clone.clone();
            async move {
                fetch_saves(&state).await.unwrap();
            }
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
    let mut users = sqlx::query_as!(
        UserEntity,
        r#"select * from "user" where ei_id is not null"#
    )
    .fetch(&*state.db);

    // limit to 10 users at a time
    let sempahore = Arc::new(Semaphore::new(10));
    while let Some(user) = users.try_next().await? {
        tokio::spawn({
            let state = state.clone();
            let semaphore_clone = sempahore.clone();
            async move {
                let permit = semaphore_clone.acquire().await.unwrap();
                let user_id = user.user_id.to_string();

                tracing::debug!(user = user_id, "fetching save");
                let save = match first_contact(user.ei_id.as_ref().expect("infallible")).await {
                    Ok(save) => save,
                    Err(e) => {
                        tracing::error!(user = user_id, "failed to fetch save {e:#?}");
                        return;
                    }
                };
                drop(permit);

                let Some(backup) = save.backup else {
                    tracing::error!(user = user_id, "no backup found");
                    return;
                };

                match collect_backup(&state.db, &user, &backup).await {
                    Ok(_) => {}
                    Err(e) => {
                        tracing::error!(user = user_id, "failed to collect backup {e:#?}");
                    }
                }
            }
        });
    }

    Ok(())
}
