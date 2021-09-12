import psycopg2 as pg;

conn = pg.connect(host="localhost", port=5432, user="postgres", password="database", database="session6")

cur = conn.cursor()
# cur.execute('create table accounts (	user_id serial PRIMARY KEY,	username VARCHAR ( 50 ))')
# conn.commit();

cur.execute('insert into accounts values(1,\'mina\')')
cur.execute('select * from accounts')

conn.commit();

print(cur.fetchone());
