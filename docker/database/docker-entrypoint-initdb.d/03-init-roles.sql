-- Create anonymous role
CREATE ROLE anonymous NOLOGIN;
GRANT USAGE ON SCHEMA ubeer_api TO anonymous;
GRANT SELECT ON ALL TABLES IN SCHEMA ubeer_api TO anonymous;

-- Create authenticated role
CREATE ROLE authenticated_user NOLOGIN;
GRANT USAGE ON SCHEMA ubeer_api TO authenticated_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ubeer_api TO authenticated_user;

-- Create specific authenticated role
CREATE ROLE "dev@ubeer.io";
GRANT authenticated_user TO "dev@ubeer.io";

-- Create user authenticator
CREATE ROLE authenticator NOINHERIT LOGIN PASSWORD 'postgres';
GRANT anonymous TO authenticator;
GRANT authenticated_user TO authenticator;
GRANT "dev@ubeer.io" TO authenticator
