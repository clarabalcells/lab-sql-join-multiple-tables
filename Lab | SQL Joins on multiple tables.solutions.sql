#Write a query to display for each store its store ID, city, and country.

SELECT s.store_id AS 'Store ID', c.city AS 'City', cy.country AS 'Country'
	FROM store AS s
	JOIN address as a on a.address_id = s.address_id
	JOIN city as c on c.city_id = a.city_id
	JOIN country as cy on cy.country_id = c.country_id
	ORDER BY s.store_id;
    
    
#Write a query to display how much business, in dollars, each store brought in.

SELECT store AS 'Store', total_sales AS 'Total Sales' FROM sales_by_store;

	SELECT concat(c.city,', ',cy.country) as `Store`, s.store_id as 'Store ID', sum(p.amount) as `Total Sales` 
	FROM payment as p
	JOIN rental as r on r.rental_id = p.rental_id
	JOIN inventory as i on i.inventory_id = r.inventory_id
	JOIN store as s on s.store_id = i.store_id
	JOIN address as a on a.address_id = s.address_id
	JOIN city as c on c.city_id = a.city_id
	JOIN country as cy on cy.country_id = c.country_id
	GROUP by s.store_id;
    
#What is the average running time of films by category?

SELECT category.name, avg(length)
FROM film join film_category using (film_id) join category using (category_id)
group by category.name
order by avg(length) desc;

#Which film categories are longest?

SELECT category.name (length)
FROM film join film_category using (film_id) join category using (category_id)
group by category.name
order by length desc;


#List the top five genres in gross revenue in descending order.
#Is "Academy Dinosaur" available for rent from Store 1?

SELECT film.film_id, film.title, store.store_id, inventory.inventory_id
FROM inventory join store using (store_id) join film USING (film_id)
WHERE film.title = 'Academy Dinosaur' AND store.store_id = 1;
