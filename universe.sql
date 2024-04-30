-- Faça login no PostgreSQL
psql --username=freecodecamp --dbname=postgres

-- Crie um banco de dados chamado universe
CREATE DATABASE universe;

-- Conecte-se ao seu banco de dados
\c universe

-- Crie a tabela galaxy
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    age_in_millions_of_years INT,
    is_spherical BOOLEAN,
    distance_from_earth NUMERIC
);

-- Crie a tabela star
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    has_life BOOLEAN,
    age_in_millions_of_years INT
);

-- Crie a tabela planet
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    has_life BOOLEAN,
    is_spherical BOOLEAN
);

-- Crie a tabela moon
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    has_life BOOLEAN
);

-- Crie a quinta tabela, por exemplo, asteroid
CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    has_life BOOLEAN,
    is_spherical BOOLEAN
);
-- Insira dados na tabela galaxy
INSERT INTO galaxy (name, description, age_in_millions_of_years, is_spherical, distance_from_earth) VALUES
('Galaxy 1', 'Description 1', 1000, true, 2.2),
('Galaxy 2', 'Description 2', 2000, false, 3.3),
('Galaxy 3', 'Description 3', 3000, true, 4.4),
('Galaxy 4', 'Description 4', 4000, false, 5.5),
('Galaxy 5', 'Description 5', 5000, true, 6.6),
('Galaxy 6', 'Description 6', 6000, false, 7.7);

-- Insira dados na tabela star
INSERT INTO star (name, galaxy_id, has_life, age_in_millions_of_years) VALUES
('Star 1', 1, true, 100),
('Star 2', 2, false, 200),
('Star 3', 3, true, 300),
('Star 4', 4, false, 400),
('Star 5', 5, true, 500),
('Star 6', 6, false, 600);

-- Insira dados na tabela planet
INSERT INTO planet (name, star_id, has_life, is_spherical) VALUES
('Planet 1', 1, true, true),
('Planet 2', 2, false, false),
('Planet 3', 3, true, true),
('Planet 4', 4, false, false),
('Planet 5', 5, true, true),
('Planet 6', 6, false, false),
('Planet 7', 1, true, true),
('Planet 8', 2, false, false),
('Planet 9', 3, true, true),
('Planet 10', 4, false, false),
('Planet 11', 5, true, true),
('Planet 12', 6, false, false);

-- Insira dados na tabela moon
INSERT INTO moon (name, planet_id, has_life) VALUES
('Moon 1', 1, true),
('Moon 2', 2, false),
('Moon 3', 3, true),
('Moon 4', 4, false),
('Moon 5', 5, true),
('Moon 6', 6, false),
('Moon 7', 7, true),
('Moon 8', 8, false),
('Moon 9', 9, true),
('Moon 10', 10, false),
('Moon 11', 11, true),
('Moon 12', 12, false),
('Moon 13', 1, true),
('Moon 14', 2, false),
('Moon 15', 3, true),
('Moon 16', 4, false),
('Moon 17', 5, true),
('Moon 18', 6, false),
('Moon 19', 7, true),
('Moon 20', 8, false);
-- Crie a tabela asteroid
CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    has_life BOOLEAN,
    is_spherical BOOLEAN
);

-- Insira dados na tabela asteroid
INSERT INTO asteroid (name, galaxy_id, has_life, is_spherical) VALUES
('Asteroid 1', 1, false, true),
('Asteroid 2', 2, false, false),
('Asteroid 3', 3, false, true);
-- Modifique a tabela galaxy
ALTER TABLE galaxy
ADD COLUMN planet_types TEXT,
ADD COLUMN galaxy_types TEXT;

-- Modifique a tabela star
ALTER TABLE star
ADD COLUMN star_types TEXT,
ADD COLUMN star_size INT;

-- Modifique a tabela planet
ALTER TABLE planet
ADD COLUMN planet_types TEXT,
ADD COLUMN planet_size INT;

-- Modifique a tabela moon
ALTER TABLE moon
ADD COLUMN moon_types TEXT,
ADD COLUMN moon_size INT;
