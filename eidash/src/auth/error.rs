use axum_core::response::IntoResponse;
use http::StatusCode;
use openidconnect::{core::CoreErrorResponseType, StandardErrorResponse};
use thiserror::Error;

#[derive(Debug, Error)]
pub enum AuthenticateError {
    #[error("an internal error occurred")]
    Internal,

    #[error("refresh token missing")]
    RefreshTokenMissing,

    #[error("access token hash invalid")]
    AccessTokenHashInvalid,

    #[error("csrf token invalid")]
    CsrfTokenInvalid,

    #[error("id token missing")]
    IdTokenMissing,

    #[error("signing: {0:?}")]
    Signing(#[from] openidconnect::SigningError),

    #[error("claims verification: {0:?}")]
    ClaimsVerification(#[from] openidconnect::ClaimsVerificationError),

    #[error("request token: {0:?}")]
    RequestToken(
        #[from]
        openidconnect::RequestTokenError<
            openidconnect::reqwest::Error<reqwest::Error>,
            StandardErrorResponse<CoreErrorResponseType>,
        >,
    ),

    #[error("sqlx error: {0:?}")]
    Sqlx(#[from] sqlx::Error),
}

#[derive(Debug, Error)]
pub enum OidcError {
    #[error("url parsing: {0:?}")]
    UrlParsing(#[from] openidconnect::url::ParseError),

    #[error("discovery: {0:?}")]
    Discovery(#[from] openidconnect::DiscoveryError<openidconnect::reqwest::Error<reqwest::Error>>),

    #[error("an authentication error occurred: {0:?}")]
    Authentication(#[from] AuthenticateError),
}

impl IntoResponse for OidcError {
    fn into_response(self) -> axum_core::response::Response {
        (StatusCode::INTERNAL_SERVER_ERROR, "internal server error").into_response()
    }
}

impl IntoResponse for AuthenticateError {
    fn into_response(self) -> axum_core::response::Response {
        (StatusCode::INTERNAL_SERVER_ERROR, "internal server error").into_response()
    }
}
