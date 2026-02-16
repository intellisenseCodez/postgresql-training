-- =====================================================
-- DAY 05: SUBQUERY (PRACTICE FILE)
-- =====================================================


-- Query all films whose rental_rate is above the avg rental_rate of all films

-- main query /outer query
select title, rental_rate
from film
where rental_rate > (-- sub query
					select avg(rental_rate)
					from film);


-- scalar sub query: one value
select avg(rental_rate)
from film;

-- row subquery: 1 column, multiple rows
select title
from film;

-- table subqery: multiple cols, multiple rows
select film_id, title
from film;


-- Highest Paying Customer

-- using join
select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_payments
from customer as c
inner join payment as p on c.customer_id = p.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_payments desc
limit 1;

-- total payment of every customer (sub query)
-- identify the customer with highest amount (main query



-- using. a scalar subquery
select customer_id, first_name, last_name
from customer
where customer_id = (
					select customer_id
					from payment
					group by customer_id
					order by sum(amount) desc
					limit 1);


-- using table subquery
select c.customer_id, c.first_name, c.last_name
from customer as c
inner join
		(select customer_id,sum(amount)
		from payment
		group by customer_id
		order by sum(amount) desc
		limit 1) as ha  on c.customer_id = ha.customer_id;




-- Indentify the movie with the longest length
-- 1. determing the longest lenght
-- 2. which moview has the value as above

select title, length
from film
where length = (
			select max(length)
			from film);


-- select t1.title, 
--        t1.length,
-- 	   t2.max
-- from film as t1
-- full join (select max(length) as max from film) as t2 on t1.length = t2.max;



-- Actors Who Never Acted in Horror (category)
select actor_id, first_name, last_name
from actor
where actor_id not in (
		select actor_id
		from film_actor as fa
		inner join film_category as fc on fa.film_id = fc.film_id
		inner join category as c on c.category_id = fc.category_id
		where c.name = 'Horror');


-- Assignment
-- 1. Query the total rentals per each film
-- 2. Identify the Top 5 customers by spending
-- 3. Categorize every customers by the number of rents:
--        if rent_counts is greater than 50, the customer is VIP,
--		else if rent_counts is between 20 and  40, the customer is valuable,
--		else regular 


-- 1. Query the total rentals per each film

-- 1. list of films (sub)
-- 2. num of rent of each film (main)

-- main query
select f.film_id, f.title, cf.total_rentals
from film as f
inner join ( -- inner query
		select i.film_id, count(r.rental_id) as total_rentals
		from rental as r
		inner join inventory as i on i.inventory_id = r.inventory_id
		group by i.film_id) as cf on cf.film_id = f.film_id;



-- Method 2 (Not prefarrable)
select f.film_id, f.title,
		(select count(r.rental_id)
		from rental as r
		inner join inventory as i on i.inventory_id = r.inventory_id
		where i.film_id = f.film_id) as total_rentals
from film as f;


-- 2. Identify the Top 5 customers by spending

-- table involve: customer, payement table
-- output: first_name, last_name, email, total_sepending

-- 1. deteremine the taotal sepnding of every customers
-- 2. look for the top 5

select c.first_name, c.last_name, c.email, spending.total_spending
from customer as c
inner join (
	select customer_id, sum(amount) as total_spending
	from payment
	group by customer_id) as spending on c.customer_id = spending.customer_id
order by spending.total_spending desc
limit 5;


-- 3. Categorize every customers by the number of rents:
--        if rent_counts is greater than 50, the customer is VIP,
--		else if rent_counts is between 20 and  40, the customer is valuable,
--		else regular 

-- table: customer, rental,

-- 1. determine total rent of every customers (sub)
-- 2. classify them base on the rental (main)

select *,
		case
			when rental_stats.rental_count > 50 then 'VIP'
			when rental_stats.rental_count between 20 and 40 then 'Valuable'
			else 'Regular'
		end as "customer_rank"
from (select c.first_name, c.last_name, count(r.rental_id) as rental_count
		from customer as c
		inner join rental as r on c.customer_id = r.customer_id
		group by c.first_name, c.last_name) as rental_stats;


-- Identify customers who haven't rented a film in the last 6 months

-- 1. identify all customers who have rentend movie in last 6 monts (sub)
-- 2.  filter all customer that are not in 1 (main)

-- main query
select c.customer_id, concat(c.first_name, ' ', c.last_name) as full_name 
from customer as c
-- sub query
left join (
			select customer_id, rental_date
			from rental
			where rental_date >= (select max(rental_date) - interval '2 months' from rental)
			) as last_6_month_customers
on c.customer_id = last_6_month_customers.customer_id
where last_6_month_customers.customer_id is null;



select customer_id
from customer 
where customer_id not in(
	select customer_id
	from rental
	where rental_date >= (select max(rental_date) - interval '2 months' from rental));
	





