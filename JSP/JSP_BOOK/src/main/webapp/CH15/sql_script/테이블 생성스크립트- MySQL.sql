/* MySQL 에서 사용할 DB 생성 */ 
Create Database JSPBookDB;

use JSPBookDB;

drop table member;

/* member : 회원 테이블 */ 
Create Table member (	
    id varchar(100) not null,
    name varchar(100) not null,
    passwd varchar(50) not null,
    primary key (id)
);
/* 더미 데이터 입력 */ 
insert into member (id, name, passwd)
values('admin', '관리자', '1234');

INSERT INTO Member (id, passwd, name) 
Values ('admin2','1234','홍길동')

-- select * from member;


/* 상품 관리 테이블 생성 */ 
Create Table product (
	p_id varchar(10) not null, 
    p_name varchar(10), 
    p_unitPrice INTEGER, 
    p_description TEXT, 
    p_category Varchar(20), 
    p_manufacture varchar(20),
    p_unitsInStock Long, 
    p_condition varchar(20), 
    p_fileName varchar(20), 
    primary key (p_id)
)default CHARSET=utf8;

-- select * from product;
