
/*
������ ���̺��� ������ ��� ������ ���� ���� 
    member : ȸ�� ���̺� : ȸ���� ���� ����
    board : MVC Model 1�� �̿��� �Խ��� ���̺�  
*/

drop table member; 
drop table board;
drop sequence seq_board_num;

/* ȸ�� ���̺� ���� */
Create Table member (
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regdate date default sysdate not null,
    primary Key (id)
    );
    
-- select * from member;

/* MVC Model 1 ����� �Խ��� ���̺� ���� */ 
create table board (
    num number primary key , 
    title varchar2(200) not null, 
    content varchar2(2000) not null,
    id varchar2(10) not null, 
    postdate date default sysdate not null,
    visitcount number(6)
    );
/* �ܷ�Ű ���� */ 
alter table board 
    add constraint board_mem_fk foreign key (id)
    references member(id);

/* ������ ����(�ڵ����� ���� ����), �ʱⰪ1, 1������ : board(num) �� ��Ī */
Create sequence seq_board_num 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
 
 /* ���� ������(�׽�Ʈ �������� ���Է� )  �Է� */ 
 insert into member (id, pass, name) values ('admin', '1234', '������');
 insert into board (num, title, content, id, postdate,visitcount)
    values(seq_board_num.nextval, '����: 1 �Դϴ�.', '����: 1 �Դϴ�.' , 'admin', sysdate,0);  
 commit;   
 
 select * from member;
 select * from board;


    



