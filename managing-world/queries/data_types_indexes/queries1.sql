-- Part 1: Data Types, Validation Restrictions & Indexes
-- Listing all tables
SHOW TABLES;

-- Describe table structures
DESCRIBE country;
DESCRIBE city;
DESCRIBE countrylanguage;

-- Modify Data Types
ALTER TABLE city ADD COLUMN is_population_large BOOLEAN GENERATED ALWAYS AS (population > 1000000) STORED;
ALTER TABLE country ADD COLUMN region_code CHAR(3) DEFAULT 'NA';

-- Add Constraints
ALTER TABLE city ADD CONSTRAINT chk_population CHECK (population >= 0);
ALTER TABLE country ADD CONSTRAINT unique_code UNIQUE (Code);

-- Indexes
CREATE INDEX idx_city_name ON city(name);
EXPLAIN ANALYZE SELECT * FROM city WHERE name = 'Paris';
