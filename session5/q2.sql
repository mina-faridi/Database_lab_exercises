drop function filmsWithin;
create or replace function filmsWithin(in fromDate date, in toDate date)
returns table (rental_id integer, film_title character varying, customer_id smallint, 
			   rental_date timestamp, return_date timestamp)
language 'plpgsql'
as
$$
begin
	return query 
	select rental.rental_id as rental_id, film.title as film_title,
	rental.customer_id as cumstomer_id, rental.rental_date as rental_date, 
	rental.return_date as return_date
	from rental inner join inventory on rental.inventory_id=inventory.inventory_id
	inner join film on film.film_id=inventory.film_id
	where rental.rental_date>fromDate
	and rental.rental_date < toDate;
end
$$


