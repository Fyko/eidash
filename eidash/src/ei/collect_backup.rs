use ei_proto::Backup;
use num_bigint::BigInt;
use sqlx::{types::BigDecimal, PgPool};
use time::OffsetDateTime;

use crate::db::user::UserEntity;

use super::{
    calculate_clothed::deterministic_clothed_eb, calculate_earnings_bonus, get_epic_research_level,
    EarningsBonusData,
};

pub async fn collect_backup(db: &PgPool, user: &UserEntity, backup: &Backup) -> anyhow::Result<()> {
    let Some(ref game) = backup.game else {
        return Err(anyhow::anyhow!("No game found for user {}", user.user_id));
    };

    let Some(Ok(backup_time)) = backup
        .settings
        .as_ref()
        .and_then(|s| s.last_backup_time)
        .map(|t| OffsetDateTime::from_unix_timestamp(t as i64))
    else {
        return Err(anyhow::anyhow!("no backup_time found"));
    };

    let soul_eggs = game.soul_eggs_d() as u128;
    let eggs_of_prophecy = game.eggs_of_prophecy() as i32;
    let er_prophecy_bonus_level = get_epic_research_level(game, "prophecy_bonus") as i32;
    let er_soul_food_level = get_epic_research_level(game, "soul_eggs") as i32;

    let computed_earnings_bonus = calculate_earnings_bonus(
        &EarningsBonusData {
            soul_eggs: soul_eggs as f64,
            eggs_of_prophecy,
            er_prophecy_bonus_level,
            er_soul_food_level,
        },
        None,
    );

    let best_clothed_eb = deterministic_clothed_eb(backup);
    let prestige_count = backup
        .stats
        .as_ref()
        .map_or(0, |s| s.num_prestiges() as i32);

    if sqlx::query!(
        r#"
			insert into basic_save_v1 (
				user_id,
				computed_earnings_bonus,
				soul_eggs,
				eggs_of_prophecy,
				er_prophecy_bonus_level,
				er_soul_food_level,
				clothed_earnings_bonus,
                prestige_count,
				time,
				backup_time
			)
			values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
		"#,
        user.user_id.to_string(),
        computed_earnings_bonus,
        BigDecimal::from(BigInt::from(soul_eggs)),
        eggs_of_prophecy,
        er_prophecy_bonus_level,
        er_soul_food_level,
        best_clothed_eb,
        Some(prestige_count),
        OffsetDateTime::now_utc(),
        backup_time,
    )
    .execute(db)
    .await
    .is_err()
    {
        return Err(anyhow::anyhow!("failed to insert save"));
    }

    Ok(())
}
