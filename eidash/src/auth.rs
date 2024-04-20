use crate::{db::user::UserEntity, state::AppState};
use async_trait::async_trait;
use axum_login::{AuthnBackend, UserId};
use openidconnect::{
    core::{
        CoreAuthDisplay, CoreAuthPrompt, CoreAuthenticationFlow, CoreErrorResponseType,
        CoreGenderClaim, CoreJsonWebKey, CoreJsonWebKeyType, CoreJsonWebKeyUse,
        CoreJweContentEncryptionAlgorithm, CoreJwsSigningAlgorithm, CoreProviderMetadata,
        CoreRevocableToken, CoreRevocationErrorResponse, CoreTokenIntrospectionResponse,
        CoreTokenType,
    },
    reqwest::async_http_client,
    AccessTokenHash, AuthorizationCode, ClientId, ClientSecret, CsrfToken, EmptyExtraTokenFields,
    IdTokenFields, IssuerUrl, Nonce, OAuth2TokenResponse, PkceCodeChallenge, PkceCodeVerifier,
    RedirectUrl, Scope, StandardErrorResponse, StandardTokenResponse, TokenResponse,
};
use time::{Duration, OffsetDateTime};

use self::error::{AuthenticateError, OidcError};

pub mod error;

pub const AUTHENTICATION_STATE_KEY: &str = "authentication.state";

pub trait AdditionalClaims: openidconnect::AdditionalClaims + Clone + Sync + Send {}

type OidcTokenResponse<AC> = StandardTokenResponse<
    IdTokenFields<
        AC,
        EmptyExtraTokenFields,
        CoreGenderClaim,
        CoreJweContentEncryptionAlgorithm,
        CoreJwsSigningAlgorithm,
        CoreJsonWebKeyType,
    >,
    CoreTokenType,
>;

pub type IdToken<AZ> = openidconnect::IdToken<
    AZ,
    CoreGenderClaim,
    CoreJweContentEncryptionAlgorithm,
    CoreJwsSigningAlgorithm,
    CoreJsonWebKeyType,
>;

pub type OidcClient<AC> = openidconnect::Client<
    AC,
    CoreAuthDisplay,
    CoreGenderClaim,
    CoreJweContentEncryptionAlgorithm,
    CoreJwsSigningAlgorithm,
    CoreJsonWebKeyType,
    CoreJsonWebKeyUse,
    CoreJsonWebKey,
    CoreAuthPrompt,
    StandardErrorResponse<CoreErrorResponseType>,
    OidcTokenResponse<AC>,
    CoreTokenType,
    CoreTokenIntrospectionResponse,
    CoreRevocableToken,
    CoreRevocationErrorResponse,
>;

#[derive(Clone)]
pub struct OidcBackend {
    scopes: Vec<String>,
    state: AppState,
}

pub async fn create_oidc_client(
    issuer: String,
    client_id: String,
    client_secret: Option<String>,
    redirect_url: String,
) -> Result<OidcClient<EmptyAdditionalClaims>, OidcError> {
    let provider_metadata =
        CoreProviderMetadata::discover_async(IssuerUrl::new(issuer)?, async_http_client).await?;

    let client = OidcClient::from_provider_metadata(
        provider_metadata,
        ClientId::new(client_id),
        client_secret.map(ClientSecret::new),
    )
    .set_redirect_uri(RedirectUrl::new(redirect_url)?)
    .disable_openid_scope();

    Ok(client)
}

impl OidcBackend {
    pub async fn new(state: AppState, scopes: Vec<String>) -> Result<Self, OidcError> {
        Ok(Self { scopes, state })
    }

    pub fn authorize_url(&self) -> (reqwest::Url, OidcLoginState) {
        let (pkce_challenge, pkce_verifier) = PkceCodeChallenge::new_random_sha256();
        let (auth_url, csrf_token, nonce) = {
            let mut auth = self.state.oidc_client.authorize_url(
                CoreAuthenticationFlow::AuthorizationCode,
                CsrfToken::new_random,
                Nonce::new_random,
            );

            for scope in self.scopes.iter() {
                auth = auth.add_scope(Scope::new(scope.to_string()));
            }

            auth.set_pkce_challenge(pkce_challenge).url()
        };

        let oidc_session = OidcLoginState {
            nonce,
            csrf_token,
            pkce_verifier: pkce_verifier.secret().to_string(),
        };

        (auth_url, oidc_session)
    }
}

#[derive(Clone, Debug, Deserialize)]
pub struct Credentials {
    pub code: String,
    pub state: CsrfToken,
    pub auth_state: OidcLoginState,
}

#[async_trait]
impl AuthnBackend for OidcBackend {
    type User = UserEntity;
    type Credentials = Credentials;
    type Error = AuthenticateError;

    async fn authenticate(
        &self,
        Self::Credentials {
            code,
            auth_state,
            state,
        }: Self::Credentials,
    ) -> Result<Option<Self::User>, Self::Error> {
        if auth_state.csrf_token.secret() != state.secret() {
            return Err(AuthenticateError::CsrfTokenInvalid);
        }

        let token_response = self
            .state
            .oidc_client
            .exchange_code(AuthorizationCode::new(code))
            // Set the PKCE code verifier.
            .set_pkce_verifier(PkceCodeVerifier::new(auth_state.pkce_verifier))
            .request_async(async_http_client)
            .await?;

        let id_token = token_response
            .id_token()
            .ok_or(AuthenticateError::IdTokenMissing)?;

        let claims = id_token.claims(
            &self.state.oidc_client.id_token_verifier(),
            &auth_state.nonce,
        )?;

        if let Some(expected_access_token_hash) = claims.access_token_hash() {
            let actual_access_token_hash = AccessTokenHash::from_token(
                token_response.access_token(),
                &id_token.signing_alg()?,
            )?;
            if actual_access_token_hash != *expected_access_token_hash {
                return Err(AuthenticateError::AccessTokenHashInvalid);
            }
        }

        // now do refresh token stuff
        let refresh_token = token_response
            .refresh_token()
            .ok_or(AuthenticateError::RefreshTokenMissing)?;
        let refresh_token = refresh_token.secret().to_string();

        let now = OffsetDateTime::now_utc();
        let expires_at =
            now + Duration::seconds(token_response.expires_in().map_or(0, |x| x.as_secs()) as i64);

        let user = sqlx::query_as!(
            UserEntity,
            r#"
                insert into "user"(
                    openid, email, username,
                    token_type, access_token,
                    refresh_token, expires_at
                )
                values($1, $2, $3, $4, $5, $6, $7)
                on conflict(openid) do update set
                    email = excluded.email,
                    username = excluded.username,
                    token_type = excluded.token_type,
                    access_token = excluded.access_token,
                    refresh_token = excluded.refresh_token,
                    expires_at = excluded.expires_at
                returning *;
            "#,
            claims.subject().to_string(),
            claims.email().map(|e| e.to_string()),
            claims
                .preferred_username()
                // TODO: handle this
                .map_or("user69".to_string(), |un| un.to_string()),
            token_response.token_type().as_ref(),
            token_response.access_token().secret().to_string(),
            refresh_token,
            expires_at,
        )
        .fetch_one(&*self.state.db)
        .await?;

        tracing::info!("user logged in: {user:#?}");

        Ok(Some(user))
    }

    async fn get_user(&self, user_id: &UserId<Self>) -> Result<Option<Self::User>, Self::Error> {
        let user = sqlx::query_as!(
            UserEntity,
            r#"
				select * from "user" where user_id = $1;
			"#,
            user_id.to_string()
        )
        .fetch_optional(&*self.state.db)
        .await?;

        Ok(user)
    }
}

pub type AuthSession = axum_login::AuthSession<OidcBackend>;

/// an empty struct to be used as the default type for the additional claims generic
#[derive(Deserialize, Serialize, Debug, Clone, Copy, Default)]
pub struct EmptyAdditionalClaims {}
impl AdditionalClaims for EmptyAdditionalClaims {}
impl openidconnect::AdditionalClaims for EmptyAdditionalClaims {}

/// response data of the openid issuer after login
#[derive(Debug, Deserialize)]
pub struct OidcQuery {
    pub code: String,
    pub state: CsrfToken,
    #[allow(dead_code)]
    session_state: Option<CsrfToken>,
}

/// oidc session
#[derive(Clone, Serialize, Deserialize, Debug)]
pub struct OidcLoginState {
    pub nonce: Nonce,
    pub csrf_token: CsrfToken,
    pub pkce_verifier: String,
}
