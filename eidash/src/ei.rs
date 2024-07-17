use std::fmt::Display;

use ei_proto::{
    backup::Game, grpc_request, BasicRequestInfo, BoxDynError, EggIncFirstContactRequest,
    EggIncFirstContactResponse,
};

pub mod calculate_clothed;
pub mod collect_backup;

/// Performs the first contact with the EI server.
pub async fn first_contact(ei_id: &str) -> Result<EggIncFirstContactResponse, BoxDynError> {
    let request = EggIncFirstContactRequest {
        user_id: None,
        client_version: Some(67),
        platform: Some(1),
        ei_user_id: Some(ei_id.to_owned()),
        device_id: Some("github.com/fyko/eidash".to_string()),
        username: None,
        game_services_id: None,
        rinfo: Some(BasicRequestInfo {
            ei_user_id: Some(ei_id.to_owned()),
            client_version: Some(64),
            version: Some("1.33".to_string()),
            build: Some("111290".to_string()),
            platform: Some("IOS".to_string()),
            country: None,
            language: None,
            debug: Some(false),
        }),
    };

    grpc_request("/ei/bot_first_contact", request).await
}

pub fn get_epic_research_level(game: &Game, id: &str) -> u32 {
    game.epic_research
        .iter()
        .find(|r| r.id == Some(id.to_string()))
        .map_or(0, |r| r.level.map_or(0, |l| l))
}

#[derive(Debug)]
pub struct EarningsBonusData {
    pub soul_eggs: f64,
    pub eggs_of_prophecy: i32,
    pub er_prophecy_bonus_level: i32,
    pub er_soul_food_level: i32,
}

#[derive(Debug)]
pub struct ArtifactBonus {
    pub soul_egg_bonus: f64,
    pub prophecy_egg_bonus: f64,
}

impl Display for ArtifactBonus {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "Soul Egg Bonus: {}, Prophecy Egg Bonus: {}",
            self.soul_egg_bonus, self.prophecy_egg_bonus,
        )
    }
}

/// Calculates the Earnings Bonus for a user given their soul eggs, prophecy eggs, and epic
/// research levels.
///
/// Optionally provide the bonus from artifact sets.
pub fn calculate_earnings_bonus(
    data: &EarningsBonusData,
    artifact_bonus: Option<&mut ArtifactBonus>,
) -> f64 {
    let soul_egg_bonus = 0.1
        + ((data.er_soul_food_level as f64) * 0.01)
        + artifact_bonus.as_ref().map_or(0.0, |b| b.soul_egg_bonus);

    let prophecy_egg_bonus = 0.05
        + ((data.er_prophecy_bonus_level as f64) * 0.01)
        + artifact_bonus
            .as_ref()
            .map_or(0.0, |b| b.prophecy_egg_bonus);

    (data.soul_eggs * soul_egg_bonus)
        * (1.0 + prophecy_egg_bonus).powf(data.eggs_of_prophecy as f64)
}

#[cfg(test)]
mod tests {
    use std::env;

    use super::*;

    #[tokio::test]
    async fn test_clothed_eb() {
        let id = env::var("EI_ID").expect("EI_ID must be set");
        let response = first_contact(&id).await.unwrap();
        let backup = response.backup.unwrap();

        let highest = calculate_clothed::deterministic_clothed_eb(&backup);

        println!("Highest EB: {:.2}%", highest * 100.0);
    }
}
