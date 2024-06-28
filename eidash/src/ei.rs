use ei_proto::{
    backup::Game, grpc_request, BasicRequestInfo, BoxDynError, EggIncFirstContactRequest,
    EggIncFirstContactResponse,
};

/// Performs the first contact with the EI server.
pub async fn first_contact(ei_id: &str) -> Result<EggIncFirstContactResponse, BoxDynError> {
    let request = EggIncFirstContactRequest {
        user_id: None,
        client_version: Some(64),
        platform: Some(1),
        ei_user_id: Some(ei_id.to_owned()),
        device_id: Some("github.com/fyko/eidash".to_string()),
        username: None,
        game_services_id: None,
        rinfo: Some(BasicRequestInfo {
            ei_user_id: Some(ei_id.to_owned()),
            client_version: Some(64),
            version: Some("1.31".to_string()),
            build: Some("111284".to_string()),
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

pub struct EarningsBonusData {
    pub soul_eggs: f64,
    pub eggs_of_prophecy: i32,
    pub er_prophecy_bonus_level: i32,
    pub er_soul_food_level: i32,
}

pub fn calculate_earnings_bonus(data: &EarningsBonusData) -> f64 {
    let soul_egg_bonus = 0.1 + (data.er_soul_food_level as f64) * 0.01;
    let prophecy_egg_bonus = 0.05 + (data.er_prophecy_bonus_level as f64) * 0.01;

    (data.soul_eggs * soul_egg_bonus)
        * (1.0 + prophecy_egg_bonus).powf(data.eggs_of_prophecy as f64)
}
