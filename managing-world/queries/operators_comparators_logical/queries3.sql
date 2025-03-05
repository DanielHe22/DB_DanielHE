
-- Part 3: Operators, Comparators, and Logical Operators
-- Find countries with populations between 50 million and 200 million
SELECT Name, Population FROM country WHERE Population BETWEEN 50000000 AND 200000000;

-- Find countries with specific population values
SELECT Name, Population FROM country WHERE Population IN (20000000, 30000000, 40000000, 50000000);

-- Retrieve cities with population between 1M and 10M, excluding those in Asia
SELECT city.Name, city.Population 
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE city.Population BETWEEN 1000000 AND 10000000
AND country.Continent <> 'Asia';

-- Find countries where population is over 100M or region is Europe
SELECT Name FROM country WHERE Population > 100000000 OR Region = 'Europe';

-- Find cities starting with 'A' but not ending with 'n'
SELECT Name FROM city WHERE Name LIKE 'A%' AND Name NOT LIKE '%n';
