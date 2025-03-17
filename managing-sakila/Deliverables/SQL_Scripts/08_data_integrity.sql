-- ensure foreign key constraints exist
ALTER TABLE rental
ADD CONSTRAINT fk_rental_customer
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
ON DELETE RESTRICT;

ALTER TABLE payment
ADD CONSTRAINT fk_payment_rental
FOREIGN KEY (rental_id) REFERENCES rental(rental_id)
ON DELETE RESTRICT;

-- check for orphaned records in the rental table
DELETE FROM rental
WHERE customer_id NOT IN (SELECT customer_id FROM customer);

-- check for orphaned records in the payment table
DELETE FROM payment
WHERE rental_id NOT IN (SELECT rental_id FROM rental);

-- trigger to prevent deleting a customer with active rentals
DELIMITER $$

CREATE TRIGGER prevent_customer_delete
BEFORE DELETE ON customer
FOR EACH ROW
BEGIN
    DECLARE rental_count INT;
    SELECT COUNT(*) INTO rental_count
    FROM rental
    WHERE customer_id = OLD.customer_id AND return_date IS NULL;

    IF rental_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete customer with active rentals.';
    END IF;
END$$

DELIMITER ;

-- trigger to ensure rental return date is after rental date
DELIMITER $$

CREATE TRIGGER validate_rental_dates
BEFORE INSERT ON rental
FOR EACH ROW
BEGIN
    IF NEW.return_date IS NOT NULL AND NEW.return_date < NEW.rental_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Return date must be after rental date.';
    END IF;
END$$

DELIMITER ;

-- trigger to ensure payment amount is positive
DELIMITER $$

CREATE TRIGGER validate_payment_amount
BEFORE INSERT ON payment
FOR EACH ROW
BEGIN
    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment amount must be positive.';
    END IF;
END$$

DELIMITER ;
