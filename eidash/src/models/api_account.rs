use eidash_id::markers::AccountId;

use crate::db::account::AccountEntity;

#[derive(Serialize, Deserialize)]
pub struct APIAccount {
    pub id: AccountId,
    pub username: String,
    pub visibility: String,
    pub position: i32,
}

impl APIAccount {
    pub fn from_row(user: AccountEntity) -> Self {
        Self {
            id: user.account_id,
            username: user.game_username,
            visibility: user.account_visibility,
            position: user.position,
        }
    }
}
