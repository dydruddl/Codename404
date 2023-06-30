drop table qnaboard CASCADE CONSTRAINTS purge;

create table qnaBoard (
   qna_no number primary key,
   qna_nick varchar2(100) not null,
   category_no number default 2,
   qna_subject varchar2(2000) not null,
   qna_content varchar2(2000) not null,
   qna_register date not null,
   qna_readcount number default 0,
   qna_singo number default 0,
   qna_renum number default 0,
   qna_del number default 0,
   qna_sol number default 0
);
   
drop sequence qnaBoard_seq;
  
create sequence qnaBoard_seq
   start with 1
   increment by 1
   nocache;

drop table qnaReBoard purge;
   
create table qnaReBoard(
qna_rno number primary key,
qna_bno number not null references qnaBoard(qna_no),
qna_re_nick varchar2(100) not null,
qna_replytext varchar2(2000) not null,
qna_regdate date not null,
qna_re_sol number default 0);

drop sequence qnaReBoard_seq;

create sequence qnaReBoard_seq
   start with 1
   increment by 1
   nocache;
   
select * from qnaboard;
delete from QNABOARD;
delete from QNAREBOARD;


	update qnaBoard set qna_sol=1 where  (select count(qna_re_sol) from qnaReBoard where qna_re_sol=1 and qna_bno = 1 )  >=1

