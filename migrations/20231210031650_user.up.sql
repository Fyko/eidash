create table if not exists "user" (
	user_id text primary key default generate_prefixed_ksuid('user'),
	ei_id text unique,
	openid text not null unique,
	email varchar(254) not null unique,
	username text not null unique check (
		length(username) >= 2
		and length(username) <= 32
	),
	points integer not null default 0,
	token_type text not null,
	access_token text not null,
	refresh_token text not null,
	expires_at timestamptz not null,
	created_at timestamptz not null default current_timestamp,
	updated_at timestamptz not null default current_timestamp
);
select trigger_updated_at('"user"');
create index if not exists idx_user_ei_id on "user" (ei_id);
