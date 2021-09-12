drop function if exists increase_rental_duration;
create function increase_rental_duration(in inc_amount smallint)
returns table(filmId integer, film_title varchar, rentalduration smallint)
language 'plpgsql'
as
$$
begin
	update film
	set rental_duration = rental_duration + inc_amount;
	
	return query select film_id, title, rental_duration from film order by film_id;
end
$$

select film_id, title, rental_duration from film order by film_id;

select* from increase_rental_duration(3::smallint);
