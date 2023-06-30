-- FreeBoard ----------------------------------------------------------------
select * from tab;

--freeboard 원문
select * from freeboard;
drop table freeboard CASCADE CONSTRAINTS purge;

CREATE TABLE freeboard (
   free_no          number          primary key, 
   free_nick        varchar2(100)   not null, 
   category_no      number          default 1 , 
   free_subject     varchar2(2000)  not null, 
   free_content     varchar2(2000)  not null, 
   free_regdate     date            not null, 
   free_readcount   number          default 0, 
   free_singo       number          default 0,   
   free_renum       number          default 0, 
   free_del         number          default 1, 
   constraint FK_free_nick foreign key (free_nick) references member (nick) ON DELETE CASCADE,
   constraint FK_category_no1 foreign key (category_no) references category (category_no)
   );

--freeboard 시퀀스
drop sequence freeboard_seq;

create sequence freeboard_seq
   start with 1
   increment by 1
   nocache;


--freeboard 댓글 게시판
select * from free_reply;
drop table free_reply purge;

CREATE TABLE free_reply (
   free_rno         number          primary key,
   free_no          number          not null,
   free_re_nick     varchar2(100)   not null,
   free_replytext   varchar2(2000)  not null,   
   free_regdate     date            not null,
   constraint FK_free_re_nick foreign key (free_re_nick) references member (nick) on delete cascade,
   constraint FK_free_no FOREIGN KEY (free_no) references freeboard (free_no) ON DELETE CASCADE
   );


--freeboard댓글 시퀀스
drop sequence free_reply_seq;

create sequence free_reply_seq
 start with 1
 increment by 1
 nocache;
