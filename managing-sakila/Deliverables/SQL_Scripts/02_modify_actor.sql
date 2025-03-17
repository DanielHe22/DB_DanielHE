-- insert a new record into the actor table
INSERT INTO actor (first_name, last_name, last_update)
VALUES ('John', 'Doe', NOW());

-- update an existing record by changing the last name of an actor
UPDATE actor
SET last_name = 'Smith'
WHERE first_name = 'John' AND last_name = 'Doe';

-- delete an actor from the table
DELETE FROM actor
WHERE first_name = 'John' AND last_name = 'Smith';