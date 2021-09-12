--user2

BEGIN;
SELECT * FROM records;
commit;

BEGIN;
insert into records values ('9');
commit;