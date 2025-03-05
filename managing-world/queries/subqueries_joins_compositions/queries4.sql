-- Part 4: Subqueries and Joins
-- Find countries with more than 5 cities having a population over 1M
SELECT country.Name FROM country
WHERE (SELECT COUNT(*) FROM city WHERE city.CountryCode = country.Code AND city.Population > 1000000) > 5;

-- Find countries with more than 3 official languages
SELECT country.Name FROM country
WHERE (SELECT COUNT(*) FROM countrylanguage WHERE countrylanguage.CountryCode = country.Code AND countrylanguage.IsOfficial = 'T') > 3;

-- Find cities where an official language is spoken, excluding English
SELECT DISTINCT city.Name, countrylanguage.Language
FROM city
JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T' AND countrylanguage.Language <> 'English';

-- Calculate total population per country by summing all city populations
SELECT country.Name, SUM(city.Population) AS TotalPopulation
FROM country
JOIN city ON country.Code = city.CountryCode
GROUP BY country.Name;
