SELECT *
FROM customer
WHERE first_name LIKE '%J%'
AND active = 1;

--- 2 Find all films where the title contains the word 'ACTION' or the description contains 'WAR'.
SELECT *
FROM film
WHERE title LIKE '%ACTION%'
OR description LIKE '%WAR%';

--- 3 List all customers whose last name is not 'SMITH' and whose first name ends with 'a'.
select *
from customer
where first_name != 'SMITH'
and  first_name like '%a'

--- 4 Get all films where the rental rate is greater than 3.0 and the replacement cost is not null.
select *
from film 
where rental_rate > 3.0
and replacement_cost is not null

--- 5  Count how many customers exist in each store who have active status = 1. // took chatgpt help //
SELECT store_id, COUNT(*) AS total_active_customers
FROM customer
WHERE active = 1
GROUP BY store_id

--- 6 Show distinct film ratings available in the film table.
select distinct rating
from film 

--- 7 Find the number of films for each rental duration where the average length is more than 100 minutes.
SELECT rental_duration, COUNT(*) AS total_films, AVG(length) AS average_length
FROM film
GROUP BY rental_duration
HAVING AVG(length) > 100;

--- 8 List payment dates and total amount paid per date, but only include days where more than 100 payments were made.
SELECT payment_date, SUM(amount) AS total_amount, COUNT(*) AS total_payments
FROM payment
GROUP BY payment_date
HAVING COUNT(*) > 100;

---9 Find customers whose email address is null or ends with '.org'.
SELECT *
FROM customer
WHERE email IS NULL
OR email LIKE '%.org';

---10 List all films with rating 'PG' or 'G', and order them by rental rate in descending order.
SELECT *
FROM film
WHERE rating = 'PG'
OR rating = 'G'
ORDER BY rental_rate DESC;

--- 11. Count how many films exist for each length where the film title starts with 'T' and the count is more than 5.// chatgpt//
SELECT length, COUNT(*) AS total_films
FROM film
WHERE title LIKE 'T%'
GROUP BY length
HAVING COUNT(*) > 5;

--- 12 List all actors who have appeared in more than 10 films.
SELECT actor_id, COUNT(*) AS total_films
FROM film_actor
GROUP BY actor_id
HAVING COUNT(*) > 10;

--- 13 Find the top 5 films with the highest rental rates and longest lengths combined, ordering by rental rate first and length second.
SELECT title, rental_rate, length
FROM film
ORDER BY rental_rate DESC, length DESC
LIMIT 5;

--- 14 Show all customers along with the total number of rentals they have made, ordered from most to least rentals.// chatgpt//
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rentals DESC;

--- 15  List the film titles that have never been rented // chat gpt //

SELECT f.title
FROM film f
LEFT JOIN inventory i
ON f.film_id = i.film_id
LEFT JOIN rental r
ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;


