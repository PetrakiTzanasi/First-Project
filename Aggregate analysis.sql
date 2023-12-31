/* Utilize SQL's GROUP BY and HAVING clauses to perform aggregate analysis on our dataset */

/* Found the most number of payments per staff members */
select staff_id, count(payment_id) from payment
group by staff_id

/* Found the avarage replacment cost per movie ratings */
select rating, avg(replacement_cost) from film
group by rating

/* Top 5 customers by total spend */
select customer.first_name,customer.last_name,payment.customer_id, sum(payment.amount) as total_spend 
from payment
inner join customer on
payment.customer_id = customer.customer_id
group by payment.customer_id,customer.first_name,customer.last_name
order by total_spend desc
limit 5

/* Customer with 40 or more transaction payments */
select customer.first_name, customer.last_name,payment.customer_id,count(payment.payment_id)as nr_payment
from payment
inner join customer on
customer.customer_id = payment.customer_id
group by customer.first_name, customer.last_name,payment.customer_id
having count(payment.payment_id)>=40
order by nr_payment desc

/* Customers with spent more than 100$ with our staff_id member 2 */
select customer.first_name,customer.last_name, payment.customer_id, sum(payment.amount) as total_amount 
from payment
inner join customer on
customer.customer_id = payment.customer_id
where payment.staff_id = 2
group by customer.first_name,customer.last_name, payment.customer_id
having sum(payment.amount) >100

/* Customer with highest customer id whose name starts with 'E' and has adress_id lower than 500 */
select first_name,last_name,customer_id,address_id from customer
where first_name like 'E%' and address_id <500
order by customer_id desc
limit 1