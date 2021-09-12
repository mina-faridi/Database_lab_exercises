--user1
SELECT locktype, relation::regclass, mode, pid
 FROM pg_locks;-- WHERE pid != pg_backend_pid();--We used the pg_backend_pid() to filter out all locks that are created by this session
 
 BEGIN;
SELECT * FROM records;
commit;

BEGIN;
insert into records values ('9');
commit;

begin;
 ALTER TABLE records ADD age int;
 commit;
 