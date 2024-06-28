use ei_proto::backup::Game;
use sqlx::{types::BigDecimal, FromRow, PgPool};

use super::types::Timestamptz;

// create table if not exists basic_save_v1 (
// 	time timestamptz not null default now(),
// 	user_id text not null,
// 	computed_earnings_bonus double precision not null,
// 	soul_eggs double precision not null,
// 	eggs_of_prophecy integer not null,
// 	er_soul_food_level integer not null,
// 	er_prophecy_bonus_level integer not null,
// 	backup_time timestamptz not null
// );

#[derive(Debug, Clone, FromRow)]
pub struct BasicSaveV1Entity {
    pub user_id: String,
    pub computed_earnings_bonus: f64,
    pub soul_eggs: BigDecimal,
    pub eggs_of_prophecy: i32,
    pub er_soul_food_level: i32,
    pub er_prophecy_bonus_level: i32,
    pub backup_time: Timestamptz,
    pub time: Timestamptz,
}

pub async fn write_backup(db: &PgPool, game: Game) -> anyhow::Result<()> {
    Ok(())
}
