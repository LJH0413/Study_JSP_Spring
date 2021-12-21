
/*
기존의 테이블이 존재할 경우 삭제후 새로 생성 
    member : 회원 테이블 : 회원의 정보 저장
    board : MVC Model 1을 이용한 게시판 테이블  
*/

drop table member; 
drop table board;
drop sequence seq_board_num;

/* 회원 테이블 생성 */
Create Table member (
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regdate date default sysdate not null,
    primary Key (id)
    );
    
-- select * from member;

/* MVC Model 1 방식의 게시판 테이블 생성 */ 
create table board (
    num number primary key , 
    title varchar2(200) not null, 
    content varchar2(2000) not null,
    id varchar2(10) not null, 
    postdate date default sysdate not null,
    visitcount number(6)
    );
/* 외래키 설정 */ 
alter table board 
    add constraint board_mem_fk foreign key (id)
    references member(id);

/* 시퀀스 생성(자동으로 값을 증가), 초기값1, 1씩증가 : board(num) 에 매칭 */
Create sequence seq_board_num 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
 
 /* 더미 데이터(테스트 목적으로 값입력 )  입력 */ 
 insert into member (id, pass, name) values ('admin', '1234', '관리자');
 insert into board (num, title, content, id, postdate,visitcount)
    values(seq_board_num.nextval, '제목: 1 입니다.', '내용: 1 입니다.' , 'admin', sysdate,0);  
 commit;   
 
 select * from member;
 select * from board;


    



