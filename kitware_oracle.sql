

-- 회원 관련
======================================================================

create table member(
member_id varchar2(20) primary key,
member_pw varchar2(20) not null,
member_name varchar2(10) not null,
member_birth varchar2(10) not null,
member_email varchar2(50) not null,
member_address1 varchar2(10),
member_address2 varchar2(100) not null,
member_address3 varchar2(100),
member_phone number(15),
member_department number(3),
member_rank number(2),
member_indate date default sysdate,
member_modidate date,
member_gender varchar2(6) default '남' not null,
member_img varchar2(100),
member_sign varchar2(100),
member_status number(1) default 0 not null,
member_vacation number(3,1) default 0,
constraint member_rank_fk foreign key(member_rank)
references rank(rank_id) on delete cascade,
constraint member_department_fk foreign key (member_department)
references department(department_id) on delete cascade
);




create table rank(
rank_id number(2) primary key,
rank_name varchar2(30) not null
);




create table department(
department_id number(3) primary key,
department_name varchar2(30) not null
);



======================================================================

insert into rank values(1, '사원');
insert into rank values(2, '주임');

insert into department values(1,'인사팀');
insert into department values(2,'비서실');

insert into member values(1,1234,'관리자','birth','email','adress1','adress2','adress3',01012341234,1,1,sysdate,null,'남',null,null,9,15);
insert into member values(2,1234,'일반인','birth','email','adress1','adress2','adress3',01012341234,1,1,sysdate,null,'남',null,null,9,15);
insert into member values(3,1234,'슈퍼맨','birth','email','adress1','adress2','adress3',01012341234,1,1,sysdate,null,'남',null,null,9,15);
insert into member values(99999,1234,'company','birth','email','adress1','adress2','adress3',01012341234,1,1,sysdate,null,'남',null,null,9,15);


alter table member modify(member_vacation number(3,1) DEFAULT 0);

UPDATE MEMBER SET MEMBER_VACATION = 14.5 WHERE MEMBER_ID = 19000004;


commit;

select A.SID, A.SERIAL#
FROM V$SESSION A, V$LOCK B, DBA_OBJECTS C
WHERE A.SID=B.SID AND B.ID1=C.OBJECT_ID AND B.TYPE='TM' AND C.OBJECT_NAME='MEMBER';

ALTER SYSTEM KILL SESSION '14, 6273';



--게시판
======================================================================


  CREATE TABLE TBL_BOARD(
  BGNO NUMBER(11,0), 
	BRDNO NUMBER(11,0) PRIMARY KEY, 
	BRDTITLE VARCHAR2(255 BYTE), 
	BRDWRITER VARCHAR2(20 BYTE), 
	BRDMEMO VARCHAR2(4000 BYTE), 
	BRDDATE DATE, 
	BRDHIT NUMBER, 
	BRDDELETEFLAG CHAR(1 BYTE)
	);


  CREATE TABLE TBL_BOARDFILE(
  FILENO NUMBER(11,0) PRIMARY KEY, 
	BRDNO NUMBER(11,0), 
	FILENAME VARCHAR2(100 BYTE), 
	REALNAME VARCHAR2(30 BYTE), 
	FILESIZE NUMBER
	);
	
		  CREATE TABLE TBL_BOARDREPLY(
  BRDNO NUMBER(11,0) NOT NULL ENABLE, 
	RENO NUMBER(11,0) PRIMARY KEY, 
	REWRITER VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	REMEMO VARCHAR2(500 BYTE), 
	REDATE DATE, 
	REDELETEFLAG VARCHAR2(1 BYTE) NOT NULL ENABLE, 
	REPARENT NUMBER(11,0), 
	REDEPTH NUMBER, 
	REORDER NUMBER
	);


======================================================================







--전자결재
======================================================================

create table approval_cate(
apv_cate_id number(3) primary key,
apv_cate_name varchar2(50) not null
);

create sequence seq_apv_cate;

insert into approval_cate values(seq_apv_cate.nextval, '일반결재');
insert into approval_cate values(seq_apv_cate.nextval, '휴가결재');
insert into approval_cate values(seq_apv_cate.nextval, '지출결재');

create table approval_auth(
apv_auth_id number(1) primary key,
apv_auth_name varchar2(30) not null
);

insert into approval_auth values(0, '');
insert into approval_auth values(1, '승인');
insert into approval_auth values(2, '반려');
insert into approval_auth values(3, '예결');
insert into approval_auth values( 4 , '-');


create sequence seq_approval_id;

create table approval(
approval_id number primary key,
approval_cate number(3) not null,
approval_member_id varchar2(20) not null,
approval_mem1 varchar2(20),
approval_mem2 varchar2(20),
approval_mem3 varchar2(20),
approval_auth1 number(1),
approval_auth2 number(1),
approval_auth3 number(1),
approval_title varchar2(500) not null,
approval_content clob not null,
approval_filepath varchar2(1000),
approval_filename varchar2(1000),
approval_return varchar2(1000),
approval_indate date default sysdate,
approval_enddate date,
approval_cc varchar2(1000),
approval_auth_date1 date,
approval_auth_date2 date,
approval_auth_date3 date,
approval_startdate date,
constraint approval_cate_fk foreign key (approval_cate)
references approval_cate(apv_cate_id) on delete cascade,
constraint approval_auth1_fk foreign key (approval_auth1)
references approval_auth(apv_auth_id) on delete cascade,
constraint approval_auth2_fk foreign key (approval_auth2)
references approval_auth(apv_auth_id) on delete cascade,
constraint approval_auth3_fk foreign key (approval_auth3)
references approval_auth(apv_auth_id) on delete cascade,
constraint approval_member_id_fk foreign key (approval_member_id)
references member(member_id) on delete cascade
);








======================================================================






--일정
======================================================================

create table calendar_cate(
cal_cate_id number primary key,
cal_cate_name varchar2(100) not null,
cal_cate_color varchar2(10) not null
);


insert into calendar_cate values(seq_cal_cate_id.nextval, '미팅', '#AB0404');
insert into calendar_cate values(seq_cal_cate_id.nextval, '외근', '#AB0078');
insert into calendar_cate values(seq_cal_cate_id.nextval, '병가', '#7200AB');
insert into calendar_cate values(seq_cal_cate_id.nextval, '연차', '#4854FF');
insert into calendar_cate values(seq_cal_cate_id.nextval, '출장', '#00AB50');
insert into calendar_cate values(seq_cal_cate_id.nextval, '반차', '#0B6BAB');
insert into calendar_cate values(seq_cal_cate_id.nextval, '교육', 'gray');

insert into calendar_cate values(0, '직접입력', 'a');



create sequence seq_cal_cate_id;


  create table calendar(
  calendar_id number primary key,
  calendar_cate number,
  calendar_cateSelf varchar2(50),
  calendar_member_id varchar2(20) not null,
  calendar_start varchar2(100) not null,	
  calendar_end varchar2(100) not null,
  calendar_title varchar2(100) not null,
  calendar_content varchar2(3000) not null,
  calendar_color varchar2(10),
  calendar_allDay number(1) constraint calendar_allDay_ck check(calendar_allDay = 0 or calendar_allDay = 1),
  calendar_indate Date default sysdate,
  constraint calendar_member_id_fk foreign key (calendar_member_id)
  references member(member_id) on delete cascade,
  constraint calendar_cate_fk foreign key (calendar_cate)
  references calendar_cate(cal_cate_id) on delete cascade
  );

  create sequence seq_calendar_id;

======================================================================

update calendar
set
calendar_cate = #{calendar_cate},
calendar_cateSelf = #{calendar_cateSelf},
calendar_member_id = #{calendar_member_id},
calendar_start = #{calendar_start},
calendar_end = #{calendar_end},
calendar_title = #{calendar_title},
calendar_content = #{calendar_content},
calendar_color = #{calendar_color},
calendar_allDay = #{calendar_allDay}
calendar_indate = #{calendar_indate}
where calendar_id = #{calendar_id}

update calendar set calendar_cate = #{calendar_cate}, calendar_cateSelf = #{calendar_cateSelf}, calendar_member_id = #{calendar_member_id}, calendar_start = #{calendar_start}, calendar_end = #{calendar_end}, calendar_title = #{calendar_title}, calendar_content = #{calendar_content}, calendar_color = #{calendar_color}, calendar_allDay = #{calendar_allDay} where calendar_id = #{calendar_id}
update calendar
set
calendar_title = '수정',
calendar_content = '호잇'
where calendar_id = 135


-- 출퇴근
======================================================================

create table commuting(
commuting_id number primary key,
commuting_member_id varchar2(20) not null,
commuting_arrive date default null,
commuting_leave date default null,
commuting_comment varchar2(500),
commuting_status varchar2(100),
commuting_status_date date default null,
constraint commuting_member_id_fk foreign key (commuting_member_id)
references member(member_id) on delete cascade
);

create sequence seq_commutting_id;



======================================================================


create table EMAIL(
email_id number primary key,
sender_id varchar2(50) not null,
sender varchar2(50) not null,
receiver_id varchar2(50) not null,
receiver varchar2(50) not null,
title varchar2(100) not null,
content clob not null,
send_date date,
email_status number(1) default 0,
type number(1) default 0
);

create sequence seq_email_id;

create table email_account(
member_id  varchar2(20),
email_account varchar(50) unique,-- unique,
email_pw varchar2(20) not null,
constraint email_account_fk foreign key (member_id)
references member(member_id) on delete cascade
);


======================================================================


create table apv_payment(
pay_id number primary key,
approval_id number not null,
pay_date date not null,
pay_title number(2) not null,
pay_cash number not null,
pay_bank number(1) not null,
pay_deposit number not null,
pay_dpowner varchar2(10) not null,
pay_comment varchar2(500),
constraint payment_apvid_fk foreign key (approval_id)
references approval(approval_id) on delete cascade
);

create sequence apv_payment_seq;


======================================================================


create table member_deposit(
depo_member_id varchar2(20) primary key,
depo_bank_id number(1) not null,
depo_number varchar2(100) not null,
constraint deposit_memId_fk foreign key (depo_member_id)
references member(member_id) on delete cascade
);

insert into member_deposit values(1, 3, 1002338724382);




insert into rank values(0, '사장');
insert into rank values(1, '부사장');
insert into rank values(2, '전무');
insert into rank values(3, '상무');
insert into rank values(4, '이사');
insert into rank values(5, '부장');
insert into rank values(6, '차장');
insert into rank values(7, '과장');
insert into rank values(8, '대리');
insert into rank values(9, '주임');
insert into rank values(10, '사원');

commit;

insert into department values(0, '비서실');
insert into department values(1, '인사부');
insert into department values(2, '총무부');
insert into department values(3, '생산부');
insert into department values(4, '홍보부');
insert into department values(5, '관리부');





