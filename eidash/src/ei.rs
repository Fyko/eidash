use ei_proto::{
    grpc_request, BasicRequestInfo, BoxDynError, EggIncFirstContactRequest,
    EggIncFirstContactResponse,
};

/// Performs the first contact with the EI server.
pub async fn first_contact(ei_id: &String) -> Result<EggIncFirstContactResponse, BoxDynError> {
    let request = EggIncFirstContactRequest {
        user_id: None,
        client_version: Some(64),
        platform: Some(1),
        ei_user_id: Some(ei_id.clone()),
        device_id: Some("github.com/fyko/eidash".to_string()),
        username: None,
        game_services_id: None,
        rinfo: Some(BasicRequestInfo {
            ei_user_id: Some(ei_id.clone()),
            client_version: Some(64),
            version: Some("1.31".to_string()),
            build: Some("111284".to_string()),
            platform: Some("IOS".to_string()),
            country: None,
            language: None,
            debug: Some(false),
        }),
        ..Default::default()
    };

    grpc_request("/ei/bot_first_contact", request).await
}
