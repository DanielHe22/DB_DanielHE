-- start transaction
START TRANSACTION;

-- attempt to rent a movie that is out of stock
INSERT INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES (NOW(), 9999, 3, NULL, 2, NOW());

-- check if inventory exists
SELECT * FROM inventory WHERE inventory_id = 9999;

-- if no inventory exists, rollback the transaction
ROLLBACK;