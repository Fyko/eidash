use axum_login::AuthUser;
use secrecy::{ExposeSecret, Secret};
use sqlx::{FromRow, PgPool};

use super::types::Timestamptz;
use eidash_id::markers::UserId;

#[derive(Debug, Clone, Deserialize, FromRow)]
pub struct UserEntity {
    pub user_id: UserId,
    pub ei_id: Option<String>,
    pub profile_visibility: String,

    pub openid: String,
    pub email: String,
    pub username: String,
    pub points: i32,
    pub access_token: Secret<String>,
    pub refresh_token: Secret<String>,
    pub token_type: String,

    pub expires_at: Timestamptz,
    pub created_at: Timestamptz,
    pub updated_at: Timestamptz,
}

#[tracing::instrument(skip(pool))]
pub async fn get_by_user_id(
    pool: &PgPool,
    user_id: UserId,
) -> Result<Option<UserEntity>, sqlx::Error> {
    let user = sqlx::query_as!(
        UserEntity,
        r#"
            select * from "user" where user_id = $1;
        "#,
        user_id.to_string()
    )
    .fetch_optional(pool)
    .await?;

    Ok(user)
}

impl AuthUser for UserEntity {
    type Id = UserId;

    fn id(&self) -> Self::Id {
        self.user_id.clone() // ouch
    }

    fn session_auth_hash(&self) -> &[u8] {
        self.access_token.expose_secret().as_bytes()
    }
}
