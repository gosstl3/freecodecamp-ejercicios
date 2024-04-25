-- Create the database "universe"
CREATE DATABASE universe;

-- Connect to the database "universe"
\c universe;

-- Create the table "galaxy"
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    type TEXT NOT NULL,
    age_in_millions_of_years INT,
    is_spiral BOOLEAN NOT NULL,
    distance_from_earth NUMERIC
);

-- Create the table "star"
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    temperature INT NOT NULL,
    has_life BOOLEAN,
    is_binary BOOLEAN NOT NULL
);

-- Create the table "planet"
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    star_id INT REFERENCES star(star_id),
    planet_type TEXT NOT NULL,
    distance_from_star NUMERIC NOT NULL,
    has_atmosphere BOOLEAN NOT NULL
);

-- Create the table "moon"
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    planet_id INT REFERENCES planet(planet_id),
    radius INT NOT NULL,
    has_water BOOLEAN NOT NULL,
    is_inhabited BOOLEAN
);

-- Create the table "spaceship"
CREATE TABLE spaceship (spaceship_id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL UNIQUE, capacity INT);

-- Insert data into the "spaceship" table
INSERT INTO spaceship(name, capacity) 
VALUES
('OSK',4),
('BLOP',4),
('DRAGON', 2),
('GARROBO',1),
('SAYA',2),
('DRAK', 9);

-- Insert data into the "galaxy" table
INSERT INTO galaxy (name, type, age_in_millions_of_years, is_spiral, distance_from_earth)
VALUES
('Milky Way', 'Spiral', 13000, true, 0),
('Andromeda', 'Spiral', 12000, true, 2540000),
('Triangulum', 'Spiral', 3000, true, 3000000),
('Messier 87', 'Elliptical', 21000, false, 54900000),
('Whirlpool', 'Spiral', 12000, true, 31000000),
('Sombrero', 'Spiral', 11000, true, 29000000);

-- Insert data into the "star" table
INSERT INTO star (name, galaxy_id, temperature, has_life, is_binary)
VALUES
('Sun', 1, 5778, true, false),
('Alpha Centauri A', 1, 5790, false, false),
('Alpha Centauri B', 1, 5260, false, false),
('Sirius', 1, 9940, false, false),
('Betelgeuse', 1, 3600, false, false),
('Proxima Centauri', 1, 3042, false, false),
('Vega', 1, 9602, false, false);

-- Insert data into the "planet" table
INSERT INTO planet (name, star_id, planet_type, distance_from_star, has_atmosphere)
VALUES
('Mercury', 1, 'Terrestrial', 0.39, false),
('Venus', 1, 'Terrestrial', 0.72, true),
('Earth', 1, 'Terrestrial', 1, true),
('Mars', 1, 'Terrestrial', 1.52, true),
('Jupiter', 1, 'Gas Giant', 5.2, false),
('Saturn', 1, 'Gas Giant', 9.58, false),
('Uranus', 1, 'Ice Giant', 19.22, false),
('Neptune', 1, 'Ice Giant', 30.05, false),
('Kepler-22b', 2, 'Terrestrial', 0.85, true),
('Gliese 581c', 2, 'Terrestrial', 0.073, true),
('HD 189733b', 2, 'Gas Giant', 0.031, true),
('51 Pegasi b', 2, 'Gas Giant', 0.052, false);

-- Insert data into the "moon" table
INSERT INTO moon (name, planet_id, radius, has_water, is_inhabited)
VALUES
('Moon', 3, 1738, true, false),
('Phobos', 4, 11.1, false, false),
('Deimos', 4, 6.2, false, false),
('Europa', 9, 1560.8, true, false),
('Titan', 10, 2575, true, false),
('Ganymede', 9, 2631.2, true, false),
('Triton', 8, 1353.4, true, false),
('Callisto', 9, 2410.3, false, false),
('Enceladus', 10, 252.1, true, false),
('Io', 9, 1821.6, false, false),
('Tethys', 11, 531.1, false, false),
('Rhea', 11, 764.5, false, false),
('Dione', 11, 561.4, false, false),
('Mimas', 11, 198.2, false, false),
('Iapetus', 11, 734.5, false, false),
('Miranda', 9, 235.8, false, false),
('Ariel', 12, 578.9, false, false),
('Umbriel', 12, 584.7, false, false),
('Titania', 12, 788.4, false, false),
('Oberon', 12, 761.4, false, false);
