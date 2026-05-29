-- 1. display all customer details who have made more than 5 payments.

select * from customer;
select * from Payment ; 
use sakila;
SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING COUNT(payment_id) > 5
);
-- 2. Find the names of actors who have acted in more than 10 films.
 select * from actor
 select * from film_actor
 
 
 
 select first_name , last_name
 from actor 
 where actor_id in (
	select actor_id 
    from film_actor 
    group by actor_id
    having count(film_id) > 10
    );
    
    -- Find the names of customers who never made a payment.
    select * from customer;
    select * from payment ;
    
     select first_name , last_name
     from customer
     where customer_id in (
				select customer_id 
                from payment 
                group by customer_id
                having count(payment_id) = 0
                );
                
-- List all films whose rental rate is higher than the average rental rate of all films.
select * from film;  
select * from rental;



SELECT title, rental_rate
FROM film
WHERE rental_rate > (
    SELECT AVG(rental_rate)
    FROM film
);

-- 5. List the titles of films that were never rented.
select * from rental;
select * from film;
select * from inventory;

select title from film where film_id in
        (
			select film_id from inventory where inventory_id in
            (
				select inventory_id, count(rental_id) as cnt 
                from rental
                group by inventory_id
                having cnt = 0 
			)
		);
	
SELECT title
FROM film
WHERE film_id IN (
    SELECT film_id
    FROM inventory
    WHERE inventory_id NOT IN (
        SELECT inventory_id
        FROM rental
    )
);

-- 6. Display the customers who rented films in the same month as customer with ID 5.




SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM rental
    WHERE MONTH(rental_date) IN (
        SELECT MONTH(rental_date)
        FROM rental
        WHERE customer_id = 5
    )
);

	
    -- . Find all staff members who handled a payment greater than the average payment amount.
    select * from staff;
    select * from payment;
    
    SELECT
    staff_id,
    first_name,
    last_name
FROM staff
WHERE staff_id IN (
    SELECT staff_id
    FROM payment
    WHERE amount > (
        SELECT AVG(amount)
        FROM payment
    )
);
   
   -- 8. Show the title and rental duration of films whose rental duration is greater than the average.
   
select * from rental ; 
select * from film;

SELECT 
    title,
    rental_duration
FROM film
WHERE rental_duration > (
    SELECT AVG(rental_duration)
    FROM film
);

-- 9. Find all customers who have the same address as customer with ID 1.
select * from customer;
select * from address;

SELECT 
    customer_id,
    first_name,
    last_name,
    address_id
FROM customer
WHERE address_id = (
    SELECT address_id
    FROM customer
    WHERE customer_id = 1
);

-- 10. List all payments that are greater than the average of all payments.
SELECT
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE amount > (
    SELECT AVG(amount)
    FROM payment
);

    
    