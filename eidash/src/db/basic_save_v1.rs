use ei_proto::backup::Game;
use sqlx::{types::BigDecimal, FromRow, PgPool};

use super::types::Timestamptz;

#[derive(Debug, Clone, FromRow)]
pub struct BasicSaveV1Entity {
    pub account_id: String,
    pub computed_earnings_bonus: f64,
    pub soul_eggs: BigDecimal,
    pub eggs_of_prophecy: i32,
    pub er_soul_food_level: i32,
    pub er_prophecy_bonus_level: i32,
    pub clothed_earnings_bonus: Option<f64>,
    pub prestige_count: Option<i32>,
    pub backup_time: Timestamptz,
    pub time: Timestamptz,
}

pub async fn write_backup(_db: &PgPool, _game: Game) -> anyhow::Result<()> {
    Ok(())
}

#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct APIBasicSaveV1 {
    pub account_id: String,
    pub computed_earnings_bonus: f64,
    pub soul_eggs: String,
    pub eggs_of_prophecy: i32,
    pub er_soul_food_level: i32,
    pub er_prophecy_bonus_level: i32,
    pub clothed_earnings_bonus: Option<f64>,
    pub prestige_count: Option<i32>,
    pub backup_time: Timestamptz,
    pub time: Timestamptz,
}

impl From<BasicSaveV1Entity> for APIBasicSaveV1 {
    fn from(entity: BasicSaveV1Entity) -> Self {
        Self {
            account_id: entity.account_id,
            computed_earnings_bonus: entity.computed_earnings_bonus,
            soul_eggs: entity.soul_eggs.to_string(),
            eggs_of_prophecy: entity.eggs_of_prophecy,
            er_soul_food_level: entity.er_soul_food_level,
            er_prophecy_bonus_level: entity.er_prophecy_bonus_level,
            clothed_earnings_bonus: entity.clothed_earnings_bonus,
            prestige_count: entity.prestige_count,
            backup_time: entity.backup_time,
            time: entity.time,
        }
    }
}
