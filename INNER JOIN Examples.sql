/* Email address of customer in California */
select first_name,last_name, district, email from address
inner join customer on
address.address_id = customer.address_id
where district = 'California'

/* List of all movies 'Nick Wahlberg' has been in */
select title,first_name,last_name from actor
inner join film_actor
on actor.actor_id = film_actor.actor_id
inner join film 
on film_actor.film_id = film.film_id
where first_name = 'Nick' and 
last_name = 'Wahlberg'

/* List of all movies 'Nick Wahlberg' has been in and the category */
select title,first_name,last_name, name as category from actor
inner join film_actor
on actor.actor_id = film_actor.actor_id
inner join film 
on film_actor.film_id = film.film_id
inner join film_category
on film_category.film_id = film.film_id
inner join category
on category.category_id = film_category.category_id
where first_name = 'Nick' and 
last_name = 'Wahlberg'

/* All cities from Spain included in the database */
select city,country from city
inner join country
on country.country_id = city.country_id
where country = 'Spain'