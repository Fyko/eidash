use std::sync::Arc;
use std::time::Duration;

use sqlx::postgres::{PgConnectOptions, PgPoolOptions};
use sqlx::{ConnectOptions, PgPool};

use crate::config::CONFIG;

pub mod types;

pub mod user;

pub async fn create_db() -> Arc<PgPool> {
    let pool = PgPoolOptions::new()
        .max_connections(100)
        .min_connections(5)
        .acquire_timeout(Duration::from_secs(8))
        .idle_timeout(Duration::from_secs(8))
        .max_lifetime(Duration::from_secs(60));

    tracing::info!("connecting to database {}", CONFIG.database_url);

    let mut opts: PgConnectOptions = CONFIG
        .database_url
        .parse()
        .expect("failed to parse database url");
    opts = opts.log_statements(tracing::log::LevelFilter::Trace);

    let db = pool
        .connect_with(opts)
        .await
        .expect("Failed to connect to database");

    Arc::new(db)
}
