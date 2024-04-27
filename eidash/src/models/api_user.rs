use eidash_id::markers::UserId;

use crate::db::{types::Timestamptz, user::UserEntity};

#[derive(Serialize, Deserialize)]
pub struct APIUser {
    id: UserId,
    username: String,
    profile_visibility: String,
    ei_id: Option<String>,
    email: Option<String>,
    created_at: Timestamptz,
}

impl APIUser {
    pub fn from_row(user: UserEntity) -> Self {
        Self {
            id: user.user_id,
            username: user.username,
            profile_visibility: user.profile_visibility,
            ei_id: user.ei_id,
            email: Some(user.email),
            created_at: user.created_at,
        }
    }

    pub fn private(user: UserEntity) -> Self {
        Self {
            id: user.user_id,
            username: user.username,
            profile_visibility: user.profile_visibility,
            ei_id: None,
            email: None,
            created_at: user.created_at,
        }
    }
}
