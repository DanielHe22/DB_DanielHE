-- create a new table to store recent films
CREATE TABLE recent_films AS
SELECT * FROM film WHERE release_year > 2005;