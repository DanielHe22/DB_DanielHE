-- 1. Retrieve all country names and their official languages
SELECT country.Name AS Country, countrylanguage.Language 
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T';

-- 2. List all cities in Germany along with their population.
SELECT city.Name AS City, city.Population
FROM city
WHERE city.CountryCode = (SELECT country.Code FROM country WHERE country.Name = 'Germany');

-- 3. Find the five smallest countries by surface area
SELECT country.Name AS Country, country.SurfaceArea
FROM country
ORDER BY country.SurfaceArea ASC
LIMIT 5;

-- 4. Find all countries with a population greater than 50 million and sort them in descending order of population
SELECT country.Name AS Country, country.Population
FROM country
WHERE country.Population > 50000000
ORDER BY country.Population DESC;

-- 5. Retrieve the average life expectancy per continent
SELECT country.Continent, AVG(country.LifeExpectancy) AS Average_Life_Expectancy
FROM country
GROUP BY country.Continent;

-- 6. Calculate the total population per region
SELECT country.Region, SUM(country.Population) AS Total_Population
FROM country
GROUP BY country.Region;

-- 7. Count the number of cities in each country and sort by the highest count
SELECT country.Name AS Country, COUNT(city.ID) AS Number_Of_Cities
FROM country
JOIN city ON country.Code = city.CountryCode
GROUP BY country.Name
ORDER BY Number_Of_Cities DESC;

-- 8. Display the top 10 largest cities along with their country name
SELECT city.Name AS City, country.Name AS Country, city.Population
FROM city
JOIN country ON city.CountryCode = country.Code
ORDER BY city.Population DESC
LIMIT 10;

-- 9. Retrieve the names of all countries that have an official language of French
SELECT DISTINCT country.Name AS Country
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

-- 10. Find all countries where English is spoken, but it is not the official language
SELECT DISTINCT country.Name AS Country
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'F';

-- 11. Find countries where the population tripled in the past 50 years (if historical data is available) --> (We dont have enough data)
SELECT Name AS Country, Population, Population / Population_50_Years_Ago AS GrowthFactor
FROM country
WHERE Population / Population_50_Years_Ago >= 3;

-- 12. List the richest and poorest countries in each continent based on Gross National Product (GNP)
SELECT country.Continent, 
       MAX(country.Name) AS Richest_Country, MAX(country.GNP) AS Highest_GNP,
       MIN(country.Name) AS Poorest_Country, MIN(country.GNP) AS Lowest_GNP
FROM country
GROUP BY country.Continent;

-- 13. Identify countries with a life expectancy below the global average
SELECT country.Name AS Country, country.LifeExpectancy
FROM country
WHERE country.LifeExpectancy < (SELECT AVG(LifeExpectancy) FROM country);

-- 14. Retrieve the capital cities of countries with a population above 100 million
SELECT country.Name AS Country, city.Name AS Capital_City
FROM country
JOIN city ON country.Capital = city.ID
WHERE country.Population > 100000000;

-- 15. Find the continent with the highest number of countries
SELECT country.Continent, COUNT(country.Name) AS Number_Of_Countries
FROM country
GROUP BY country.Continent
ORDER BY Number_Of_Countries DESC
LIMIT 1;
















