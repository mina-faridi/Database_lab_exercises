drop trigger if exists delay_checker on rental;
drop function if exists delay_checker_function;
create function delay_checker_function()
returns trigger
language plpgsql
as
$$
begin
	if date_part('day', current_date - new.rental_date)>
	(
		select f.rental_duration
		from rental r inner join inventory i 
		on r.inventory_id = i.inventory_id
		inner join film f 
		on f.film_id = i.film_id
		where r.rental_id = new.rental_id
		limit 1
	)
	then 
		insert into logs(customer_id, days)
		values(new.customer_id, Date_Part('day', current_date-new.rental_date));
	end if;
	return new;
end
$$


create trigger delay_checker
before update
on rental 
for each row
execute procedure delay_checker_function();




create table logs(
	customer_id integer,
	days integer
);