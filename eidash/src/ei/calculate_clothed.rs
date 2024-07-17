use std::collections::HashMap;

use ei_proto::{
    artifact_spec::{Level, Name, Rarity},
    Backup,
};

use crate::ei::ArtifactBonus;

use super::{calculate_earnings_bonus, get_epic_research_level, EarningsBonusData};

/// Determines the highest Clothed Earnings Bonus value for a given user.
///
/// This function takes a backup and iteratrs through all saved artifact sets, calculating the
/// EB for each set, returning the highest one.
pub fn deterministic_clothed_eb(backup: &Backup) -> f64 {
    let artifact_db = backup.artifacts_db.as_ref().unwrap();
    let saved_sets = &artifact_db.saved_artifact_sets;
    let inventory = &artifact_db.inventory_items;

    let game = backup.game.as_ref().unwrap();
    let soul_eggs = game.soul_eggs_d() as u128;
    let eggs_of_prophecy = game.eggs_of_prophecy() as i32;
    let er_prophecy_bonus_level = get_epic_research_level(game, "prophecy_bonus") as i32;
    let er_soul_food_level = get_epic_research_level(game, "soul_eggs") as i32;

    let mut ebs = HashMap::<usize, f64>::new();

    for (set_idx, set) in saved_sets.iter().enumerate() {
        // if all the item_ids in the slots are 0, then skip it. its a reset set
        if set.slots.iter().all(|s| s.item_id == Some(0)) {
            continue;
        }

        let artifact_bonus = &mut ArtifactBonus {
            soul_egg_bonus: 0.0,
            prophecy_egg_bonus: 0.0,
        };
        for item in &set.slots {
            let item_id = item.item_id();
            if item_id == 0 {
                continue;
            }

            let item = inventory.iter().find(|i| i.item_id() == item_id).unwrap();
            let artifact = item.artifact.as_ref().unwrap();
            let item_spec = artifact.spec.as_ref().unwrap();
            // Level::Inferior => "INFERIOR", T1
            // Level::Lesser => "LESSER", T2
            // Level::Normal => "NORMAL", T3
            // Level::Greater => "GREATER", T4

            let item_name = item_spec.name();
            // name = BookOFBasan, T1C, +0.25% Prophecy Egg Bonus
            // name = BookOFBasan, T2C, +0.50% Prophecy Egg Bonus
            // name = BookOFBasan, T3C, +0.75% Prophecy Egg Bonus
            // name = BookOFBasan, T3E, +0.80% Prophecy Egg Bonus
            // name = BookOFBasan, T4C, +1% Prophecy Egg Bonus
            // name = BookOFBasan, T4E, +1.10% Prophecy Egg Bonus
            // name = BookOFBasan, T4L, +1.20% Prophecy Egg Bonus
            if item_name == Name::BookOfBasan {
                let rarity = item_spec.rarity();
                let boost = match item_spec.level() {
                    Level::Inferior => 0.0025,
                    Level::Lesser => 0.005,
                    Level::Normal => match rarity {
                        Rarity::Common => 0.0075,
                        Rarity::Epic => 0.0080,
                        _ => 0.0, // theoreically unreeachable
                    },
                    Level::Greater => match rarity {
                        Rarity::Common => 0.010,
                        Rarity::Epic => 0.011,
                        Rarity::Legendary => 0.012,
                        Rarity::Rare => 0.0, // theoreically unreeachable
                    },
                    Level::Superior => 0.0, // theoretically unreachable
                };
                artifact_bonus.prophecy_egg_bonus += boost;
            };

            // let item_name = item_name.as_str_name();
            // let level = item_spec.level.unwrap() + 1;
            // let rarity = match item_spec.rarity() {
            //     Rarity::Common => "C",
            //     Rarity::Rare => "R",
            //     Rarity::Epic => "E",
            //     Rarity::Legendary => "L",
            // };

            let mut stones = vec![];
            for stone in &artifact.stones {
                let stone_name = stone.name();

                match stone_name {
                    // name = SoulStone, T2, +5% Soul Egg Bonus
                    // name = SoulStone, T3, +10% Soul Egg Bonus
                    // name = SoulStone, T4, +25% Soul Egg Bonus
                    Name::SoulStone => {
                        let stone_level = stone.level.unwrap() + 2;
                        let boost = match stone_level {
                            2 => 0.05,
                            3 => 0.10,
                            4 => 0.25,
                            _ => 0.0, // theoretically unreachable
                        };
                        artifact_bonus.soul_egg_bonus += boost;
                    }
                    // name = ProphecyStone, T2, +0.05% Prophecy Egg Bonus
                    // name = ProphecyStone, T3, +0.1% Prophecy Egg Bonus
                    // name = ProphecyStone, T4, +0.15% Prophecy Egg Bonus
                    Name::ProphecyStone => {
                        let stone_level = stone.level.unwrap() + 2;
                        let boost = match stone_level {
                            2 => 0.0005,
                            3 => 0.0010,
                            4 => 0.0015,
                            _ => 0.0, // theoretically unreachable
                        };

                        artifact_bonus.prophecy_egg_bonus += boost;
                    }
                    _ => {}
                };

                let stone_name = stone.name().as_str_name();
                let stone_level = stone.level.unwrap() + 2;
                stones.push(format!("T{stone_level} {stone_name}"));
            }
            // println!(
            //     "[{item_idx}] T{level}{rarity} {item_name} ({})",
            //     stones.join(", ")
            // );
        }

        let earnings_bonus = calculate_earnings_bonus(
            &EarningsBonusData {
                soul_eggs: soul_eggs as f64,
                eggs_of_prophecy,
                er_prophecy_bonus_level,
                er_soul_food_level,
            },
            Some(artifact_bonus),
        );
        // println!("[{set_idx}] calculated eb: {}\n", earnings_bonus);

        ebs.insert(set_idx, earnings_bonus);
    }

    // return the greatest value
    ebs.values().cloned().fold(0.0, f64::max)
}
