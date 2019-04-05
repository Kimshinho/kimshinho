drop table interpia;


create table interpia(

num number primary key,
kor_name varchar2(50),
eng_name varchar2(50),
hanja_name varchar2(50),
jumin_no varchar2(30),
photoname varchar2(100),
birth varchar2(50) ,
gender varchar2(30) ,
marriage varchar2(50) ,
thirdyear varchar2(50) ,
wagetype varchar2(50),
work varchar2(50),
sangtae varchar2(50),
addr varchar2(100),
phone varchar2(50),
email varchar2(50) ,
grade varchar2(50),
juryang varchar2(50),
original varchar2(50)
);
 
select * from interpia;
select count(21) from test;

delete from TEST
where num='1';


drop sequence interpia_sep;
create sequence interpia_sep;








