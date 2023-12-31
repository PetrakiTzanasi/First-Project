/* These fundamental SQL statements will be applied to the DVD store database to answer various questions and gain insights into the data */

/* Will send promotion email to all existing customer with first name order */
SELECT first_name,email FROM customer
ORDER BY first_name ASC

/* Showing the types of ratings we have in our database*/
SELECT DISTINCT rating FROM film

/* The first 10 paying customers*/
SELECT 
payment.customer_id, customer.first_name,customer.last_name,payment.payment_date 
FROM payment
INNER JOIN customer on
customer.customer_id = payment.customer_id
ORDER BY payment_date ASC
LIMIT 10

/* The 10 shortest film in our database */
select title, length from film
order by length asc
limit 10

/* Film under 60 min in our database */
select title, length from film
where length < 60
order by length asc

/* How many films under 60 min */
select count(*) from film
where length < 60

/* How many unique districts we have */
select count(distinct(district)) from address

/* Which films have a rating of R and a replacement cost between $5 and $15 */
select title, replacement_cost,rating from film
where rating = 'R' and replacement_cost between 5 and 15

/* How many films have 'the' on the title */
select count(*) from film
where title like '%the%'