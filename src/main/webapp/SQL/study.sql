select * from tab;
select * from member;
select * from adminmember;
delete from STUDYREBOARD;
delete from STUDYBOARD;

-- 스터디 테이블
select * from studyBoard;
drop table studyBoard CASCADE CONSTRAINTS purge;
-- [CASCADE CONSTRAINTS]FK로 하위 테이블 까지 연결되었을 경우, 상위 테이블을 삭제하는 방법

create table studyBoard(
	study_no 			number 			primary key,
	study_nick 			varchar2(100) 	not null		references member(nick),
	category_no 		number 			default 3,
	study_subject 		varchar2(2000) 	not null,
	study_content		varchar2(2000) 	not null,
	study_register 		date 			not null,
	study_readcount 	number 			default 0,
	study_singo 		number 			default 0,
	study_renum 		number 			default 0, -- 삭제할 컬럼
	study_del 			number 			default 0,
	study_start_date   	varchar2(50)	not null,
	study_end_date		varchar2(50)	not null,
	study_term			number			default 0,
	study_mozip			number 			default 0
);

-- 스터디 테이블 시퀀스
drop sequence studyBoard_seq;
create sequence studyBoard_seq
	start with 1
	increment by 1
	nocache;

-- 스터디 댓글 테이블
select * from studyReBoard;	
drop table studyReBoard purge;

create table studyReBoard(
	study_rno 			number 			primary key,
	study_no 			number 			not null 		references studyBoard(study_no),
	study_re_nick 		varchar2(100) 	not null,
	study_replytext 	varchar2(2000) 	not null,
	study_regdate 		date 			not null
);

-- 스터디 댓글 시퀀스
drop sequence studyReBoard_seq;
create sequence studyReBoard_seq
	start with 1
	increment by 1
	nocache;

