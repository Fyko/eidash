use std::sync::atomic::AtomicBool;
use std::sync::Arc;

use sqlx::PgPool;

use crate::auth::{EmptyAdditionalClaims, OidcClient};

#[derive(Clone)]
pub struct InnerAppState {
    pub db: Arc<PgPool>,
    pub api_healthy: Arc<AtomicBool>,
    pub oidc_client: Arc<OidcClient<EmptyAdditionalClaims>>,
}

pub type AppState = Arc<InnerAppState>;
