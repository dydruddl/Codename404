-- 카테고리테이블
create table category(
category_no number(20) primary key,
boardname varchar2(20)
);
insert into CATEGORY(category_no,boardname)
values(1,'자유게시판')
insert into CATEGORY(category_no,boardname)
values(2,'Q&A게시판')
insert into CATEGORY(category_no,boardname)
values(3,'스터디게시판')

insert into singo_board(singo_no,category_no,singo_subject,
singo_board_no,singo_nick,singoboard_date,singo_board_count)
values(singo_board_seq.nextval,2,'글제목입니다',23,'admin',sysdate,1)

alter table singo_board add singo_subject varchar2(20);
alter table singo_board modify(singo_subject varchar2(20) not null);
select * from singo_board;

INSERT INTO singo_board (singo_no,category_no,singo_nick,singo_subject,singo_board_no,
						 singo_board_count,singoboard_date)
SELECT singo_board_seq.nextval, 2, 'nick'||level, '제목'||level, 111, 1, SYSDATE 
FROM dual
CONNECT BY level <= 65;

-- 신고테이블
delete from SINGO_BOARD;

create table singo_board(
   singo_no number(20) primary key,
   category_no number(20),
   singo_subject varchar2(20) not null,
   singo_board_no number(20) not null,
   singo_nick VARCHAR2(20) not null,				--신고받은사람--
   singoboard_date date not null,
   singo_board_count number not null,
   constraint FK_singo_board_category foreign key(category_no) references category(category_no)
);

drop table singo_board purge;

create sequence singo_board_seq
increment by 1 start with 1 nocache;

drop sequence singo_board_seq;


select * from member;
select * from singo_board;
select * from seq;
select * from tab;
select * from category;