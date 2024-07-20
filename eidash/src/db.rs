use std::sync::Arc;
use std::time::Duration;

use sqlx::postgres::{PgConnectOptions, PgPoolOptions};
use sqlx::{ConnectOptions, PgPool};

pub mod types;

pub mod account;
pub mod basic_save_v1;
pub mod user;

pub async fn create_db(database_url: String) -> Arc<PgPool> {
    let pool = PgPoolOptions::new()
        .max_connections(100)
        .min_connections(5)
        .acquire_timeout(Duration::from_secs(8))
        .idle_timeout(Duration::from_secs(8))
        .max_lifetime(Duration::from_secs(60));

    tracing::info!("connecting to database {}", database_url);

    let mut opts: PgConnectOptions = database_url.parse().expect("failed to parse database url");
    opts = opts.log_statements(tracing::log::LevelFilter::Trace);

    let db = pool
        .connect_with(opts)
        .await
        .expect("Failed to connect to database");

    Arc::new(db)
}
