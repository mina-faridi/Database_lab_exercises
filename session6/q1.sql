begin; 

savepoint save_1;
insert into records values(1);

savepoint save_2;
insert into records values(2);
rollback transaction to savepoint save_2;

savepoint save_3;
insert into records values(3);

savepoint save_4;
insert into records values(4);
rollback transaction to savepoint save_4;

savepoint save_5;
insert into records values(5);

commit;


select * from records;
delete from records;
