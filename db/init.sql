-- Run on a fresh PostgreSQL instance as the postgres administrator.
-- Set the application password interactively with: \password ml_app
CREATE ROLE ml_app WITH LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE NOREPLICATION;
CREATE DATABASE ml_predictions OWNER postgres;
REVOKE ALL ON DATABASE ml_predictions FROM PUBLIC;
GRANT CONNECT ON DATABASE ml_predictions TO ml_app;
\connect ml_predictions
REVOKE CREATE ON SCHEMA public FROM PUBLIC;
GRANT USAGE ON SCHEMA public TO ml_app;
CREATE TABLE public.predictions (
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    input_data JSONB NOT NULL,
    prediction JSONB NOT NULL,
    model_version VARCHAR(50) NOT NULL
);
GRANT SELECT, INSERT ON TABLE public.predictions TO ml_app;
GRANT USAGE, SELECT ON SEQUENCE public.predictions_id_seq TO ml_app;
