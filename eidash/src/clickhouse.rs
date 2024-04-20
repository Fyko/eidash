use clickhouse::Row;
use serde::Deserialize;
use time::OffsetDateTime;

#[derive(Debug, Row, Deserialize, Serialize)]
pub struct BasicSaveV1Row {
    pub user_id: String,
    pub computed_earnings_bonus: f64,
    pub soul_eggs: f64,
    pub eggs_of_prophecy: u64,
    pub er_soul_food_level: u32,
    pub er_prophecy_bonus_level: u32,
    #[serde(with = "clickhouse::serde::time::datetime")]
    pub backup_time: OffsetDateTime,
    #[serde(with = "clickhouse::serde::time::datetime")]
    pub timestamp: OffsetDateTime,
}
