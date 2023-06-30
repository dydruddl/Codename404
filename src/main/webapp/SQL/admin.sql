create table adminmember(
admin_id varchar2(30) unique,
admin_nick varchar2(20) primary key,
admin_passwd varchar2(20) not null
);
delete from ADMINMEMBER;
drop table adminmember purge;
select * from adminmember;
insert into adminmember values('kimsung1017@naver.com','관리자','admin');

ALTER TABLE adminmember MODIFY admin_id varchar2(30);
delete from adminmember;
