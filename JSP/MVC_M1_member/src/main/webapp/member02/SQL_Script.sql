
use member;

create table member(
	userid varchar(16) not null primary key ,
	username varchar (12) not null,
	password varchar (12) not null,
	email varchar(50) ,
	zipcode varchar(7),
	address1 varchar(100),
	address2 varchar(100),
	phone varchar(13),
	regedit varchar(50)
	);
	
/* 명령 프롬프트 실행 */ 
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p member < c:\zipcode.sql                                    Enter password: ****    	
	








/*
CREATE TABLE `zipcode` (
  `SEQ` int NOT NULL PRIMARY KEY auto_increment,
  `ZIPCODE` varchar(7) DEFAULT NULL,
  `SIDO` varchar(4) DEFAULT NULL,
  `GUGUN` varchar(15) DEFAULT NULL,
  `DONG` varchar(52) DEFAULT NULL,
  `BUNJI` varchar(17) DEFAULT NULL
);

*/

select * from zipcode;
