use eidash_id::markers::UserId;

use crate::db::{types::Timestamptz, user::UserEntity};

#[derive(Serialize, Deserialize)]
pub struct APIUser {
    id: UserId,
    username: String,
    ei_id: Option<String>,
    email: String,
    created_at: Timestamptz,
}

impl APIUser {
    pub fn from_row(user: UserEntity) -> Self {
        Self {
            id: user.user_id,
            username: user.username,
            ei_id: user.ei_id,
            email: user.email,
            created_at: user.created_at,
        }
    }
}
