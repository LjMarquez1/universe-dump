CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    description TEXT,
    has_life BOOLEAN,
    distance_from_earth NUMERIC
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    age_in_millions_of_years INT NOT NULL,
    is_spherical BOOLEAN
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    star_id INT REFERENCES star(star_id),
    age_in_millions_of_years INT NOT NULL,
    is_spherical BOOLEAN,
    distance_from_star NUMERIC
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    planet_id INT REFERENCES planet(planet_id),
    has_life BOOLEAN,
    is_spherical BOOLEAN
);

CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    perihelion_distance NUMERIC,
    aphelion_distance NUMERIC,
    has_tail BOOLEAN
);

INSERT INTO galaxy (name, description, has_life, distance_from_earth)
VALUES
('Milky Way', 'galaxy', true, 0),
('Andromeda', 'galaxy1', false, 2.537),
('Triangulum', 'galaxy2', false, 3.0),
('Whirlpool', 'galaxy3', false, 27.3),
('Messier 87', 'galaxy4', false, 55.0),
('Sombrero', 'galaxy5', false, 28.9);

INSERT INTO star (name, galaxy_id, age_in_millions_of_years, is_spherical)
VALUES
('Sun', 1, 4600, true),
('Alpha Centauri', 1, 4500, true),
('Betelgeuse', 2, 900, false),
('Sirius', 3, 200, true),
('Proxima Centauri', 1, 4000, true),
('Rigel', 4, 800, true);

INSERT INTO planet (name, star_id, age_in_millions_of_years, is_spherical, distance_from_star)
VALUES
('Earth', 1, 4600, true, 1.0),
('Mars', 1, 4600, true, 1.5),
('Venus', 1, 4600, true, 0.7),
('Jupiter', 1, 4600, true, 5.2),
('Saturn', 1, 4600, true, 9.5),
('Uranus', 1, 4600, true, 19.2),
('Neptune', 1, 4600, true, 30.1),
('Mercury', 1, 4600, true, 0.4),
('Pluto', 1, 4600, false, 39.5),
('Kepler-22b', 2, 100, true, 620.0),
('HD 209458 b', 2, 100, true, 0.04),
('Kepler-186f', 3, 100, true, 1.1);

INSERT INTO moon (name, planet_id, has_life, is_spherical)
VALUES
('Moon', 1, false, true),
('Phobos', 2, false, true),
('Deimos', 2, false, true),
('Europa', 4, true, true),
('Ganymede', 4, false, true),
('Io', 4, false, true),
('Callisto', 4, false, true),
('Titan', 5, false, true),
('Rhea', 5, false, true),
('Iapetus', 5, false, true),
('Triton', 6, false, true),
('Nereid', 6, false, true),
('Charon', 9, false, true),
('Titania', 7, false, true),
('Oberon', 7, false, true),
('Umbriel', 7, false, true),
('Miranda', 7, false, true),
('Miranda II', 8, false, true),
('Enceladus', 5, true, true),
('Mimas', 5, false, true);

INSERT INTO comet (name, perihelion_distance, aphelion_distance, has_tail)
VALUES
('Halley', 0.09, 35.1, true),
('Hale-Bopp', 0.91, 6.4, true),
('NEOWISE', 0.29, 2.5, true),
('Encke', 0.34, 4.7, false),
('Borrelly', 1.36, 3.6, false);
