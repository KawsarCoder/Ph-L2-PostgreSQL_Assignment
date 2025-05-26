-- Active: 1711131542791@@127.0.0.1@5432@conservation_db
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL
);

INSERT INTO rangers (name, region)
VALUES
('Alice Green','Northern Hills' ),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

SELECT * FROM rangers;

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(255) NOT NULL,
    scientific_name VARCHAR(255) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(255) NOT NULL DEFAULT 'Endangered'
);

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)
VALUES
('Snow Leopard', 'Panthera uncia','1775-01-01', 'Endangered'),
('Bengal Tiger','Panthera tigris tigris','1758-01-01','Endangered'),
('Red Panda','Ailurus fulgens','1825-01-01','Vulnerable'),
('Asiatic Elephant','Elephas maximus indicus','1758-01-01','Endangered');

DROP TABLE species;
SELECT * FROM species;

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    location VARCHAR(255),
    sighting_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    notes VARCHAR(255)
);


INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes)
VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

DROP TABLE sightings;
SELECT * FROM sightings;

-- Problem One
INSERT INTO rangers (name, region)
VALUES
('Derek Fox', 'Coastal PlainsCoastal Plains');

-- Problem Two
SELECT COUNT(DISTINCT species_id) as unique_species_count
FROM sightings
WHERE species_id IS NOT NULL;

-- Problem Three
SELECT * FROM sightings
WHERE location LIKE '%Pass%';

--Problem Four
SELECT name, COUNT(*) as total_sightings
FROM sightings
INNER JOIN rangers ON sightings.ranger_id = rangers.ranger_id
GROUP BY name
ORDER BY name;

-- Problem Five
SELECT * FROM species
WHERE species.species_id NOT IN(
    SELECT species_id FROM sightings WHERE species_id IS NOT NULL
);

-- Problem Six
SELECT common_name, sighting_time, name FROM sightings
INNER JOIN rangers ON sightings.ranger_id = rangers.ranger_id
INNER JOIN species ON sightings.species_id = species.species_id
ORDER BY sighting_time DESC LIMIT 2;

-- Problem Seven
Update species
SET conservation_status = 'Historic'
WHERE EXTRACT(YEAR FROM discovery_date) < 1800;

SELECT * FROM species;

-- Problem Eight
SELECT 
  sighting_id,
  CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 5 AND 11 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;
