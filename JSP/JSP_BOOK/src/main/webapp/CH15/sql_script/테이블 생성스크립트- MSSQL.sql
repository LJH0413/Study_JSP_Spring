
Create Database myDB;

use myDB;

Create Table member (
	id varchar(100) not null primary key, 
	passwd varchar(100) not null, 
	name varchar(100) not null
);

insert into member (id, passwd, name) 
values ('admin', '1234', '°ü¸®ÀÚ');

select * from member;