use std::collections::HashMap;
#[allow(clippy::all)]
use std::error::Error as StdError;

use base64::engine::general_purpose::STANDARD;
use base64::Engine;
use prost::Message;
use reqwest::Client;

#[rustfmt::skip] // tonic uses `prettyplease` to format its output
mod ei;

pub use crate::ei::*;

pub type BoxDynError = Box<dyn StdError + Send + Sync + 'static>;

/// Sends a gRPC request to the EI server.
pub async fn grpc_request<Req: Message, Res: Message + Default>(
    path: &'static str,
    request: Req,
) -> Result<Res, BoxDynError> {
    let body = STANDARD.encode(request.encode_to_vec());
    let mut form = HashMap::new();
    form.insert("data", body);

    let response = Client::new()
        .post(format!("https://www.auxbrain.com{path}"))
        .form(&form)
        .send()
        .await?
        .bytes()
        .await?;

    let decoded = STANDARD.decode(response)?;

    let response = Res::decode(&mut decoded.as_slice())?;

    Ok(response)
}
