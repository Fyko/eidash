-- -- Add up migration script here
-- create table basic_save_v1 (
-- 	user_id String,
-- 	computed_earnings_bonus Float64,
-- 	soul_eggs Float64,
-- 	eggs_of_prophecy UInt64,
-- 	er_soul_food_level UInt32,
-- 	er_prophecy_bonus_level UInt32,
-- 	timestamp DateTime,
-- 	backup_time DateTime
-- ) engine = MergeTree() primary key (user_id, timestamp);
-- create unique index if not exists idx_sensor_data_time_mac_address_idx on sensor_data (mac_address, time);
-- select create_hypertable('sensor_data', by_range('time'));
-- select add_dimension('sensor_data', by_hash('mac_address', 4));
create extension if not exists timescaledb;
create table if not exists basic_save_v1 (
	time timestamptz not null default now(),
	user_id text not null,
	computed_earnings_bonus double precision not null,
	soul_eggs numeric not null,
	eggs_of_prophecy integer not null,
	er_soul_food_level integer not null,
	er_prophecy_bonus_level integer not null,
	backup_time timestamptz not null
);
create unique index if not exists basic_save_v1_time on basic_save_v1 (user_id, time desc);
select create_hypertable('basic_save_v1', by_range('time'));
select add_dimension('basic_save_v1', by_hash('user_id', 4));
