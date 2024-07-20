-- create the account table, which is a many to one relationship with the user table
create table if not exists account (
	account_id text primary key default generate_prefixed_ksuid('acct'),
	user_id text not null references "user"(user_id) on delete cascade,
	game_username text not null default 'unknown',
	game_id text not null,
	account_visibility text not null default 'private',
	position integer not null,
	created_at timestamptz not null default current_timestamp,
	updated_at timestamptz not null default current_timestamp
);
select trigger_updated_at('account');
-- to migrate, run poetry run migrate-alt-accounts
alter table basic_save_v1
	rename column user_id to account_id;
