-- first excercise
-- list all first names and last names
show tables from sakila;
select first_name, last_name from sakila.actor;

-- second excercise
-- a (list names)
select concat(upper(first_name), ' ', upper(last_name)) as `Actor Name` from sakila.actor;

-- b (list actors that has Joe as a first name)
select actor_id, first_name, last_name from sakila.actor
where first_name = 'Joe';

-- c (list actors that has gen in a last name)
select * from sakila.actor
where last_name like '%gen%';

-- d (list actors that has li in a last name and order it)
select * from sakila.actor
where last_name like '%li%'
order by last_name, first_name;

-- third excercise (Distinct last names)
select count(distinct last_name) as `Number of distinct last names` from sakila.actor;

-- fourth excercise (Listing names that reoccurs multiple times)
select last_name, count(last_name) as count from sakila.actor
group by last_name
having count(last_name) > 1;

-- fifth excercise (List id and country thats in the list)
select country_id, country from sakila.country
where country in ('China', 'Afghanistan', 'Israel');

-- sixth excercise (Average length of films)
select avg(length) as `Average length` from sakila.film;


-- seventh excercise (Staff name and address)
use sakila;
select first_name, last_name, address from staff
join address on staff.address_id = address.address_id;

-- eight excercise (Total payments by cutomers)
use sakila;
select first_name, last_name, sum(payment.amount) as `Total payments` from customer
join payment using(customer_id)
group by customer.customer_id;
-- limit 10;

-- ninth excercise (actors and films)
use sakila;
select title, first_name, last_name from film
join film_actor using (film_id)
join actor using (actor_id);
-- limit 20;


