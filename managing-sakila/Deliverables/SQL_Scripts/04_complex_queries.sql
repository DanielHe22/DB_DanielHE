-- list all customers who have rented a film in the last 30 days
SELECT DISTINCT customer.customer_id, customer.first_name, customer.last_name
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
WHERE rental_date >= DATE_SUB(NOW(), INTERVAL 30 DAY);

-- identify the most rented film
SELECT film.film_id, film.title, COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY film.film_id, film.title
ORDER BY rental_count DESC
LIMIT 1;

-- display total revenue generated per store
SELECT store.store_id, SUM(payment.amount) AS total_revenue
FROM payment
JOIN staff ON payment.staff_id = staff.staff_id
JOIN store ON staff.store_id = store.store_id
GROUP BY store.store_id;