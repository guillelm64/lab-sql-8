-- 1 Write a query to display for each store its store ID, city, and country.
USE sakila;
SELECT s.store_id, ct.city, cy.country FROM store as s
JOIN address as a
ON a.address_id = s.address_id 
JOIN city as ct
ON ct.city_id = a.city_id
JOIN country as cy
ON ct.country_id = cy.country_id;

-- 2 Write a query to display how much business, in dollars, each store brought in
SELECT c.store_id, sum(p.amount) FROM payment AS p
JOIN customer as c
ON p.customer_id = c.customer_id
GROUP BY c.store_id;

-- 3 Which film categories are longest?
SELECT c.name, avg(length) AS duration FROM film as f
JOIN film_category as fc
ON f.film_id = fc.film_id
JOIN category as c
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY duration DESC;

-- 4 Display the most frequently rented movies in descending order
SELECT f.title AS Title, count(i.film_id) AS Most_Rented FROM rental AS r
JOIN inventory as i
ON r.inventory_id = i.inventory_id
JOIN film as f
ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY Most_Rented DESC;

-- 5 List the top five genres in gross revenue in descending order

SELECT distinct c.name AS Title, sum(p.amount) AS Revenue FROM payment as p
	JOIN rental as r
    ON p.rental_id = r.rental_id
		JOIN inventory as i
        ON i.inventory_id = r.inventory_id
			JOIN film as f
            ON f.film_id = i.film_id
				JOIN film_category as fc
                ON fc.film_id = f.film_id
					JOIN category as c
                    ON c.category_id = fc.category_id
                    GROUP BY c.name
                    ORDER BY Revenue DESC 
					LIMIT 5;
                    
-- 6 Is "Academy Dinosaur" available for rent from Store 1?

SELECT count(f.film_id) AS Total_of_copies  FROM rental AS r
JOIN inventory as i
ON r.inventory_id = i.inventory_id
JOIN film as f
ON f.film_id = i.film_id
WHERE i.store_id = 1 AND f.title = "Academy Dinosaur";
				
-- 7 Get all pairs of actors that worked together.

SELECT a.last_name, ac.last_name, fs.film_id FROM film_actor as fs
JOIN actor as a
ON a.actor_id = fs.actor_id
JOIN actor as ac
ON a.actor_id = ac.actor_id
ORDER BY fs.film_id;

-- 8 Get all pairs of customers that have rented the same film more than 3 times




-- 






