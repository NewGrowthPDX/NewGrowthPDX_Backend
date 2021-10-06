DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS plants CASCADE;
DROP TABLE IF EXISTS greenhouse CASCADE;
DROP TABLE IF EXISTS categories CASCADE;

CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username VARCHAR(256) NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL
);

CREATE TABLE plants (
    plant_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    plant_name  VARCHAR(256) NOT NULL,
    plant_desc  VARCHAR(256)NOT NULL,
    sci_name VARCHAR(256),
    plant_img TEXT NOT NULL
);

CREATE TABLE greenhouse (
    user_plant_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    users_id BIGINT REFERENCES users(id),
    plant_id BIGINT REFERENCES plants(plant_id),
    on_market BOOLEAN NOT NULL
);

CREATE TABLE categories (
    name TEXT NOT NULL
)

