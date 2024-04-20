use std::any;
use std::cmp::Ordering;
use std::fmt::{Debug, Display, Formatter, Result as FmtResult};
use std::hash::{Hash, Hasher};
use std::marker::PhantomData;

use serde::de::{Deserialize, Deserializer};
use serde::ser::{Serialize, Serializer};
use sqlx::encode::IsNull;
use sqlx::postgres::PgArgumentBuffer;
use sqlx::{postgres::PgTypeInfo, Encode, Postgres, Type};

pub mod markers;

/// Represents a Prefixed K-Sortable Unique Identifier
///
/// ```rust,no_run
/// pub struct GameMarker;
/// pub type GameId = Pksuid<GameMarker>;
/// ```
#[repr(transparent)]
pub struct Pksuid<T> {
    phantom: PhantomData<fn(T) -> T>,
    value: String,
}

impl<T> Pksuid<T> {
    pub fn new(value: String) -> Self {
        Self {
            phantom: PhantomData,
            value,
        }
    }

    pub fn get(self) -> String {
        self.value
    }
}

impl<T> Clone for Pksuid<T> {
    fn clone(&self) -> Self {
        Self {
            phantom: PhantomData,
            value: self.value.clone(),
        }
    }
}

impl<T> Default for Pksuid<T> {
    fn default() -> Self {
        Self::new(String::new())
    }
}

impl<T> From<String> for Pksuid<T> {
    fn from(value: String) -> Self {
        Self::new(value)
    }
}

impl<T> PartialEq for Pksuid<T> {
    fn eq(&self, other: &Self) -> bool {
        self.value == other.value
    }
}

impl<T> PartialEq<&'static str> for Pksuid<T> {
    fn eq(&self, other: &&'static str) -> bool {
        self.value == *other
    }
}

impl<T> PartialEq<String> for Pksuid<T> {
    fn eq(&self, other: &String) -> bool {
        self.value == *other
    }
}

impl<T> Eq for Pksuid<T> {}

impl<T> Ord for Pksuid<T> {
    fn cmp(&self, other: &Self) -> std::cmp::Ordering {
        self.value.cmp(&other.value)
    }
}

impl<T> PartialOrd for Pksuid<T> {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

impl<T> Hash for Pksuid<T> {
    fn hash<H: Hasher>(&self, state: &mut H) {
        self.value.hash(state);
    }
}

impl<T> Debug for Pksuid<T> {
    fn fmt(&self, f: &mut Formatter<'_>) -> FmtResult {
        f.write_str("Id")?;
        let type_name = any::type_name::<T>();

        if let Some(position) = type_name.rfind("::") {
            if let Some(slice) = type_name.get(position + 2..) {
                f.write_str("<")?;
                f.write_str(slice)?;
                f.write_str(">")?;
            }
        }

        f.write_str("(")?;
        Debug::fmt(&self.value, f)?;

        f.write_str(")")
    }
}

impl<T> AsRef<str> for Pksuid<T> {
    fn as_ref(&self) -> &str {
        self.value.as_ref()
    }
}

impl<T> AsRef<String> for Pksuid<T> {
    fn as_ref(&self) -> &String {
        &self.value
    }
}

impl<T> Display for Pksuid<T> {
    fn fmt(&self, f: &mut Formatter<'_>) -> FmtResult {
        Display::fmt(&self.value, f)
    }
}

impl<T> Type<sqlx::Postgres> for Pksuid<T> {
    fn type_info() -> PgTypeInfo {
        <String as Type<Postgres>>::type_info()
    }

    fn compatible(ty: &PgTypeInfo) -> bool {
        <String as Type<Postgres>>::compatible(ty)
    }
}

impl<T> Encode<'_, Postgres> for Pksuid<T> {
    fn encode_by_ref(&self, buf: &mut PgArgumentBuffer) -> IsNull {
        <String as Encode<Postgres>>::encode_by_ref(self.as_ref(), buf)
    }
}

impl<T> Serialize for Pksuid<T> {
    fn serialize<S: Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        self.value.serialize(serializer)
    }
}

impl<'de, T> Deserialize<'de> for Pksuid<T> {
    fn deserialize<D: Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;

        Ok(Self {
            phantom: PhantomData,
            value,
        })
    }
}
