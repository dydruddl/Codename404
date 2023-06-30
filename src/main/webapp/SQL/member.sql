select * from MEMBER;
select * from NOTICE_REPLY;

delete from MEMBER;

insert into MEMBER (id,nick,passwd,register) 
values('ps@20naver.com','찬근20','123',sysdate);

insert into MEMBER (id,nick,passwd,register) 
values('gka5631@naver.com','용경이','123',sysdate);

update MEMBER set state = 1 where state = 2;