-- Add up migration script here
create table basic_save_v1 (
	user_id String,
	computed_earnings_bonus Float64,
	soul_eggs Float64,
	eggs_of_prophecy UInt64,
	er_soul_food_level UInt32,
	er_prophecy_bonus_level UInt32,
	timestamp DateTime
) engine = MergeTree() primary key (user_id, timestamp);
