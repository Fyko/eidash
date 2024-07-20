use sqlx::{FromRow, PgPool};

use super::types::Timestamptz;
use eidash_id::markers::{AccountId, UserId};

#[derive(Debug, Clone, Deserialize, FromRow)]
pub struct AccountEntity {
    pub account_id: AccountId,
    pub user_id: UserId,

    pub game_username: String,
    pub game_id: String,
    pub account_visibility: String,
    /// position on the sidebar
    pub position: i32,

    pub created_at: Timestamptz,
    pub updated_at: Timestamptz,
}

#[tracing::instrument(skip(pool))]
pub async fn get_many_by_user_id(
    pool: &PgPool,
    user_id: UserId,
) -> Result<Vec<AccountEntity>, sqlx::Error> {
    let accounts = sqlx::query_as!(
        AccountEntity,
        r#"
            select * from account where user_id = $1;
        "#,
        user_id.to_string()
    )
    .fetch_all(pool)
    .await?;

    Ok(accounts)
}
