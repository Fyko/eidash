use once_cell::sync::Lazy;
use serde::Deserialize;

pub static CONFIG: Lazy<Config> = Lazy::new(|| Config::new().expect("Unable to retrieve config"));

#[derive(Debug, Deserialize, Clone, Copy, Eq, PartialEq)]
pub enum Environment {
    #[serde(rename = "development")]
    Development,
    #[serde(rename = "production")]
    Production,
}

/// Application Config
#[derive(Debug, Deserialize, Clone)]
pub struct Config {
    pub environment: Environment,
    /// The port to listen on
    #[serde(default = "default_port")]
    pub api_port: u16,
    /// The database URL
    pub database_url: String,
    /// The redis url for sessions
    pub redis_url: String,
    /// The domain for sessions
    pub domain: String,
    /// Allowed CORS origins
    pub cors_allowed_origins: Vec<String>,

    /// The clickhouse URL
    pub clickhouse_url: String,
    /// The timescale URL
    pub timescale_url: String,

    /// The frontend URL (http(s)://...)
    pub frontend_url: String,

    pub oidc_uri: String,
    pub oidc_client_id: String,
    pub oidc_client_secret: String,
    pub oidc_issuer: String,
    pub oidc_redirect_url: String,
    pub oidc_scopes: Vec<String>,
}

fn default_port() -> u16 {
    33939
}

impl Config {
    /// Create a new `Config`
    pub fn new() -> anyhow::Result<Self> {
        let config = envy::from_env::<Self>()?;

        Ok(config)
    }

    pub fn is_dev(&self) -> bool {
        self.environment == Environment::Development
    }
}

/// Get the default static `Config`
pub fn get_config() -> &'static Config {
    &CONFIG
}
