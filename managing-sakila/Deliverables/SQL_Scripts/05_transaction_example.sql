-- start transaction
START TRANSACTION;

-- insert a new rental record
INSERT INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES (NOW(), 5, 2, NULL, 1, NOW());

-- update inventory to reflect the rental
UPDATE inventory
SET last_update = NOW()
WHERE inventory_id = 5;

-- commit the transaction
COMMIT;