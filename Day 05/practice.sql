
-- DAY 5 - Continuation on SQL JOIN
/*
Types: 
- Inner Join
- Left Join
- Right Join
- Full outer Join
- Left Anti Join
- Right Anti Join
- Full Anti Join
- Cross Join
- Self Join
- Natural Join
*/

-- Left Anti Join
-- Get all customers who have not make any payment

select c.customer_id,
	   c.first_name,
	   p.amount
from customer as c
left join payment as p
on c.customer_id = p.customer_id
where c.customer_id != p.customer_id;


select c.customer_id,
	   c.first_name,
	   p.amount
from customer as c
left join payment as p
on c.customer_id = p.customer_id
where p.customer_id is null;

-- cross join
with first_table as (
	select first_name, last_name, email
	from customer
	limit 1),
second_table as (
	select payment_id, amount
	from payment
	limit 5)
select *
from first_table
cross join second_table;

-- Show total revenue generated per store.
-- payment (amount)
-- store (store_id, name)

select st.store_id, sum(p.amount) as total_amount
from payment as p
left join staff as s on p.staff_id = s.staff_id
left join store as st on st.store_id = s.store_id
group by st.store_id
order by total_amount desc;








