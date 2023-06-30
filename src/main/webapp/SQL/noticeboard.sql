insert into notice_board(notice_no,admin_nick,notice_subject,notice_content,
                  notice_date)
values(notice_board_num_seq.nextval,'관리자', '테스트입니다', '테스트입니다', sysdate);

select * from notice_board;

INSERT INTO notice_board (notice_no,admin_nick,notice_subject,notice_content,
                  notice_date)
SELECT notice_board_num_seq.nextval,'nick'||level, '제목'||level, '내용'||level, SYSDATE
FROM dual
CONNECT BY level <= 65;

select * from notice_board;
select * from notice_reply;
select * from seq;

create table notice_board(
   notice_no number(20) primary key,
   admin_nick VARCHAR2(20) not null,
   notice_subject VARCHAR2(20) not null,
   notice_content VARCHAR2(20) not null,
   notice_date date,
   notice_readcount number default 0
)
drop table notice_board purge;

create sequence notice_board_num_seq
increment by 1 start with 1 nocache;


-- 댓글테이블

select * from notice_reply;
drop table notice_reply purge;
create table notice_reply(
	notice_rno number(20) primary key,
	notice_no number(20),
	notice_renick varchar2(20) not null,
	notice_replycontent varchar2(2000) not null,
	notice_regdate date,
	CONSTRAINT fk_notice_board_notice_no
      FOREIGN KEY (notice_no)
      REFERENCES notice_board(notice_no)
      ON DELETE CASCADE
	
);

insert into NOTICE_REPLY 
values(notice_replynum_seq.nextval,21,'admin@naver.com','왜안돼..',sysdate);

create sequence notice_replynum_seq
increment by 1 start with 1 nocache;