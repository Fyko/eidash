-- Add up migration script here
alter table "user"
add column profile_visibility text not null default 'private';
