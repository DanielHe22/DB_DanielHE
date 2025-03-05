-- Part 5: Query Optimization
-- Retrieve the top 10 most populated cities
SELECT Name, Population FROM city ORDER BY Population DESC LIMIT 10;

-- Examine performance using EXPLAIN
EXPLAIN SELECT Name, Population FROM city ORDER BY Population DESC LIMIT 10;

-- Ensure index on city name for optimized search
CREATE INDEX idx_city_name ON city(name);

-- Optimized search for cities with population over 1M and name starting with 'A'
SELECT Name, Population FROM city WHERE Population > 1000000 AND Name LIKE 'A%';
