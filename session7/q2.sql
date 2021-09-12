create table account (userid integer, fullName varchar(50), userName varchar(50) );
insert into account values(1, 'mina' , 'asdfadf' );
insert into account values(2, 'blue' , 'fgsfg' );
insert into account values(3, 'fateme' , 'hfgh' );
insert into account values(4, 'ali' , 'asdfa' );
insert into account values(5, 'hasan' , 'zxvz' );

select * from account;

create role superrole login password 'superpass';



create group grouprole with createrole valid until '20300302';

create role testrole1 with login; 
create role testrole2 with login;

grant "grouprole" to testrole1;
grant "grouprole" to testrole2;


alter role "testrole1" with INHERIT ;
alter role "testrole1" with CREATEDB ;

alter role "testrole2" rename to "newtstrole2";
alter role "newtstrole2" with password 'afadf';

drop role newtstrole2