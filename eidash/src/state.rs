use std::sync::atomic::AtomicBool;
use std::sync::Arc;

use sqlx::PgPool;

use crate::auth::{EmptyAdditionalClaims, OidcClient};

pub struct AppState {
    pub db: Arc<PgPool>,
    pub api_healthy: Arc<AtomicBool>,
    pub oidc_client: Arc<OidcClient<EmptyAdditionalClaims>>,
}

impl Clone for AppState {
    fn clone(&self) -> Self {
        Self {
            db: Arc::clone(&self.db),
            api_healthy: Arc::clone(&self.api_healthy),
            oidc_client: Arc::clone(&self.oidc_client),
        }
    }
}
