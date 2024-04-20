use once_cell::sync::Lazy;
use regex::Regex;

use super::Pksuid;

macro_rules! create_regex {
    ($name:ident, $prefix:literal) => {
        pub static $name: Lazy<Regex> = Lazy::new(|| {
            let str = concat!($prefix, "_", "[a-zA-Z0-9]{26}");
            Regex::new(str).expect(concat!("Unable to compile regex for prefix ", $prefix))
        });
    };
}

#[derive(Debug)]
#[non_exhaustive]
pub struct UserMarker;
pub type UserId = Pksuid<UserMarker>;
create_regex!(USER_ID_REGEX, "user");

#[derive(Debug)]
#[non_exhaustive]
pub struct GameMarker;
pub type GameId = Pksuid<GameMarker>;
create_regex!(GAME_ID_REGEX, "game");
