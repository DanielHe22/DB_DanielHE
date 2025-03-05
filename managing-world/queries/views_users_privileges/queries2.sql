-- Part 2: Views, Users, and Privileges
-- Views
CREATE VIEW high_population_cities AS
SELECT name, countrycode, population FROM city WHERE population > 1000000;

CREATE VIEW countries_with_languages AS
SELECT country.Name, countrylanguage.Language 
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language <> 'English';

-- User Management
CREATE USER 'db_user'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON world.city TO 'db_user'@'localhost';
GRANT SELECT ON world.country TO 'db_user'@'localhost';
GRANT INSERT, UPDATE ON world.city TO 'db_user'@'localhost';
REVOKE INSERT, UPDATE, DELETE ON world.country FROM 'db_user'@'localhost';
GRANT SELECT ON world.high_population_cities TO 'db_user'@'localhost';
