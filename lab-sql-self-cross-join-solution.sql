use sakila;

## 1. Get all pairs of actors that worked together.
select * from film_actor;

select fa1.actor_id as actor1_id, fa2.actor_id as actor2_id, fa1.film_id
from film_actor fa1
join film_actor fa2 on fa1.film_id = fa2.film_id and fa1.actor_id < fa2.actor_id
order by fa1.film_id;

## 2. Get all pairs of customers that have rented the same film more than 3 times.
select * from customer;
select * from rental;

select distinct r1.customer_id as customer1, r2.customer_id as customer2, r1.inventory_id as film_id
from rental r1
join rental r2 on r1.inventory_id = r2.inventory_id and r1.customer_id < r2.customer_id
group by r1.customer_id, r2.customer_id, r1.inventory_id
having count(*) > 3;

## 3. Get all possible pairs of actors and films.
select * from actor;
select * from film;

select * from 
(select distinct actor_id from actor) sub1
cross join 
(select distinct film_id from film) sub2;


