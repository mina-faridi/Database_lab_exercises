drop function returnedRentalsWithin;
create or replace function returnedRentalsWithin(in fromDate date, in toDate date)
returns table (customer_id integer, first_Name character varying, last_Name character varying, 
			  rental_id integer, return_date timestamp)
language 'plpgsql'
as
$$
begin
	return query
	select customer.customer_id, customer.first_Name, customer.last_Name,
	rentalsWithin.rental_id, rentalsWithin.return_date 
	from filmsWithin(fromDate,toDate) rentalsWithin inner join customer 
	on customer.customer_id= rentalsWithin.customer_id
	where rentalsWithin.return_date<toDate;
end
$$

