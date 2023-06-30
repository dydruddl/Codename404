drop table reportreason_board purge;
select * from reportreason_board;
select * from seq;
delete from REPORTREASON_BOARD;

insert into reportreason_board(report_no,singo_no,category_no,report_nick,report_reason,
report_content,report_date,report_board_no)
values(reportreason_seq.nextval,3,2,'admin','욕설','테스트입니다',sysdate,1)

create table reportreason_board(
   report_no number(20) primary key,
   singo_no number(20),
   category_no number(20),
   report_nick VARCHAR2(20) not null,			--신고한사람--
   report_reason varchar2(20) not null,
   report_content varchar2(2000) not null,
   report_date date not null,
   report_board_no number(20)not null,
   constraint FK_rr_board_singo_board foreign key(singo_no) references singo_board(singo_no) on delete cascade,
   constraint FK_rr_board_category foreign key(category_no) references category(category_no)
);

create sequence reportreason_seq
increment by 1 start with 1 nocache;

drop sequence reportreason_seq;
drop table reportreason_board purge;