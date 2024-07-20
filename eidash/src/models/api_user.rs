use eidash_id::markers::UserId;

use crate::db::{account::AccountEntity, types::Timestamptz, user::UserEntity};

use super::api_account::APIAccount;

#[derive(Serialize, Deserialize)]
pub struct APIUser {
    id: UserId,
    username: String,
    profile_visibility: String,
    ei_id: Option<String>,
    email: Option<String>,
    accounts: Vec<APIAccount>,
    created_at: Timestamptz,
}

impl APIUser {
    pub fn from_row(user: UserEntity) -> Self {
        Self {
            id: user.user_id,
            username: user.username,
            profile_visibility: user.profile_visibility,
            ei_id: None,
            email: Some(user.email),
            created_at: user.created_at,
            accounts: vec![],
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
            accounts: vec![],
        }
    }

    pub fn from_row_with_accounts(user: UserEntity, accounts: Vec<AccountEntity>) -> Self {
        Self {
            id: user.user_id,
            username: user.username,
            profile_visibility: user.profile_visibility,
            ei_id: None,
            email: Some(user.email),
            created_at: user.created_at,
            accounts: accounts.into_iter().map(APIAccount::from_row).collect(),
        }
    }

    pub fn private_from_row_with_accounts(user: UserEntity, accounts: Vec<AccountEntity>) -> Self {
        let accounts = accounts
            .into_iter()
            .filter(|acct| acct.account_visibility == "public")
            .map(APIAccount::from_row)
            .collect();

        Self {
            id: user.user_id,
            username: user.username,
            profile_visibility: user.profile_visibility,
            ei_id: None,
            email: None,
            created_at: user.created_at,
            accounts,
        }
    }
}
