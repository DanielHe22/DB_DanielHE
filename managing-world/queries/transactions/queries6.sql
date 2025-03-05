-- Part 6: Transactions
-- Start a transaction, insert a city, verify it, then rollback
START TRANSACTION;
INSERT INTO city (Name, CountryCode, District, Population) VALUES ('NewCity', 'USA', 'California', 500000);
SELECT * FROM city WHERE Name = 'NewCity';
ROLLBACK;

-- Insert a city and update country population. Commit only if both succeed
START TRANSACTION;
INSERT INTO city (Name, CountryCode, District, Population) VALUES ('AnotherCity', 'USA', 'Texas', 800000);
UPDATE country SET Population = Population + 800000 WHERE Code = 'USA';
COMMIT;

-- Use SAVEPOINT to allow partial rollback in case of an error
START TRANSACTION;
INSERT INTO city (Name, CountryCode, District, Population) VALUES ('TempCity', 'USA', 'Florida', 600000);
SAVEPOINT sp1;
UPDATE country SET Population = Population / 0 WHERE Code = 'USA'; -- Simulated error
ROLLBACK TO SAVEPOINT sp1;
COMMIT;
