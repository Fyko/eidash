use std::{sync::Arc, time::Duration};

use anyhow::Result;
use clokwerk::{AsyncScheduler, TimeUnits};
use futures_util::TryStreamExt;
use tokio::{sync::Semaphore, time::sleep};

use crate::{
    db::account::AccountEntity,
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
    let mut accounts = sqlx::query_as!(
        AccountEntity,
        r#"select * from account where game_id is not null"#
    )
    .fetch(&*state.db);

    // limit to 10 users at a time
    let sempahore = Arc::new(Semaphore::new(10));
    while let Some(account) = accounts.try_next().await? {
        tokio::spawn({
            let state = state.clone();
            let semaphore_clone = sempahore.clone();
            async move {
                let permit = semaphore_clone.acquire().await.unwrap();
                let account_id = account.account_id.to_string();

                tracing::debug!(account = account_id, "fetching save");
                let save = match first_contact(&account.game_id).await {
                    Ok(save) => save,
                    Err(e) => {
                        tracing::error!(account = account_id, "failed to fetch save {e:#?}");
                        return;
                    }
                };
                drop(permit);

                let Some(backup) = save.backup else {
                    tracing::error!(account = account_id, "no backup found");
                    return;
                };

                // if username is different, update the account record
                if account.game_username != backup.user_name() {
                    if let Err(e) = sqlx::query!(
                        "update account set game_username = $1 where account_id = $2",
                        backup.user_name(),
                        account.account_id.to_string(),
                    )
                    .execute(&*state.db)
                    .await
                    {
                        tracing::error!(
                            account = account_id,
                            "failed to update account username {e:#?}"
                        );
                    }
                }

                match collect_backup(&state.db, &account, &backup).await {
                    Ok(_) => {}
                    Err(e) => {
                        tracing::error!(account = account_id, "failed to collect backup {e:#?}");
                    }
                }
            }
        });
    }

    Ok(())
}
