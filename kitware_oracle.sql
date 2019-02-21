

-- 회원 관련
======================================================================

create table member(
member_id number(20) primary key,
member_pw varchar2(20) not null,
member_name varchar2(10) not null,
member_birth varchar2(10) not null,
member_email varchar2(20) not null,
member_address1 varchar2(10),
member_address2 varchar2(100) not null,
member_address3 varchar2(100),
member_phone number(15),
member_department number(3),
member_rank number(2),
member_indate date,
member_modidate date,
constraint member_rank_fk foreign key(member_rank)
references rank(rank_id) on delete cascade,
constraint member_department_fk foreign key (member_department)
references department(department_id) on delete cascade
);

drop table member;



create table rank(
rank_id number(2) primary key,
rank_name varchar2(30) not null
);

drop table rank;



create table department(
department_id number(3) primary key,
department_name varchar2(30) not null
);

drop table department;

======================================================================



alter table member modify(member_vacation number(3,1) DEFAULT 0);

UPDATE MEMBER SET MEMBER_VACATION = 14.5 WHERE MEMBER_ID = 19000004;


commit;

select A.SID, A.SERIAL#
FROM V$SESSION A, V$LOCK B, DBA_OBJECTS C
WHERE A.SID=B.SID AND B.ID1=C.OBJECT_ID AND B.TYPE='TM' AND C.OBJECT_NAME='MEMBER';

ALTER SYSTEM KILL SESSION '14, 6273';



--게시판
======================================================================

create table board_section(
b_section_id number(3) primary key,
b_section_name varchar2(30) not null
);

drop table section;



create table board(
board_id number primary key,
board_section number(3) not null,
board_member_id number(20) not null,
board_title varchar2(500) not null,
board_content varchar2(4000) not null,
board_indate date default sysdate,
board_hits number default 0,
constraint board_section_fk foreign key (board_section)
references board_section(b_section_id) on delete cascade,
constraint board_member_id_fk foreign key (board_member_id)
references member(member_id) on delete cascade
);

create sequence seq_board_id ;

drop table board;



create table reply(
reply_id number primary key,
reply_board_id number not null,
reply_member_id number(20) not null,
reply_content varchar2(4000) not null,
reply_indate date default sysdate,
reply_modidate date,
constraint reply_board_id_fk foreign key (reply_board_id)
references board(board_id) on delete cascade,
constraint reply_member_id_fk foreign key (reply_member_id)
references member(member_id) on delete cascade
);

create sequence seq_reply_id;

drop table reply;

======================================================================







--전자결재
======================================================================

create table approval_cate(
apv_cate_id number(3) primary key,
apv_cate_name varchar2(50) not null
);

create sequence seq_apv_cate;

insert into approval_cate values(seq_apv_cate.nextval, '기안서');
insert into approval_cate values(seq_apv_cate.nextval, '업무일지');
insert into approval_cate values(seq_apv_cate.nextval, '계약확인서');

create table approval_auth(
apv_auth_id number(1) primary key,
apv_auth_name varchar2(30) not null
);

create table approval(
approval_id number auto_increment primary key,
approval_cate number(3) not null,
approval_member_id number(20) not null,
approval_mem1 number(20),
approval_mem2 number(20),
approval_mem3 number(20),
approval_auth1 number(1),
approval_auth2 number(1),
approval_auth3 number(1),
approval_auth_date1 date,
approval_auth_date2 date,
approval_auth_date3 date,
approval_title varchar2(500) not null,
approval_content varchar2(5000) not null,
approval_filepath varchar2(1000),
approval_filename varchar2(1000),
approval_return varchar2(1000),
approval_indate date default sysdate,
approval_enddate date,
approval_cc varchar2(1000),
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

insert into approval_auth values(0, '');
insert into approval_auth values(1, '승인');
insert into approval_auth values(2, '반려');
insert into approval_auth values(3, '예결');
insert into approval_auth values( 4 , '-');



create sequence seq_approval_id;


======================================================================






--일정
======================================================================

create table calendar_cate(
cal_cate_id number primary key,
cal_cate_name varchar2(100) not null,
cal_cate_color varchar2(10) not null
);

		if(sList[i].scd_nm== "미팅"){ //미팅, 파랑
			scolor= "#3399ff";
		} else if(sList[i].scd_nm== "외근"){ //외근, 주황
			scolor= "#ff9900";
		} else if(sList[i].scd_nm== "출장"){ //출장, 노랑
			scolor= "#efc050";
		} else if(sList[i].scd_nm== "병가"){ //병가, 하늘
			scolor= "#33ccff";
		} else if(sList[i].scd_nm== "연차"){ //연차, 초록
			scolor= "#006600";
		} else if(sList[i].scd_nm== "반차"){ //반차, 연두
			scolor= "#33ff00";
		} else {//7, 교육, 회색
			scolor= "gray";
		}
		

insert into calendar_cate values(seq_cal_cate_id.nextval, '미팅', '#AB0404');
insert into calendar_cate values(seq_cal_cate_id.nextval, '외근', '#AB0078');
insert into calendar_cate values(seq_cal_cate_id.nextval, '병가', '#7200AB');
insert into calendar_cate values(seq_cal_cate_id.nextval, '연차', '#4854FF');
insert into calendar_cate values(seq_cal_cate_id.nextval, '출장', '#00AB50');
insert into calendar_cate values(seq_cal_cate_id.nextval, '반차', '#0B6BAB');
insert into calendar_cate values(seq_cal_cate_id.nextval, '교육', 'gray');

create sequence seq_cal_cate_id;

  create table calendar(
  calendar_id number primary key,
  calendar_cate number not null,
  calendar_member_id number(20) not null,
  calendar_start varchar2(100) not null,
  calendar_end varchar2(100) not null,
  calendar_title varchar2(100) not null,
  calendar_content varchar2(3000) not null,
  calendar_color varchar2(10),
  calendar_allDay number(1) constraint calendar_allDay_ck check(calendar_allDay = 0 or calendar_allDay = 1),
  constraint calendar_member_id_fk foreign key (calendar_member_id)
  references member(member_id) on delete cascade,
  constraint calendar_cate_fk foreign key (calendar_cate)
  references calendar_cate(cal_cate_id) on delete cascade
  );

  create table calendar(
  calendar_id number primary key,
  calendar_cate number,
  calendar_cateSelf varchar2(50),
  calendar_member_id number(20) not null,
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
commuting_member_id number(20) not null,
commuting_arrive date default sysdate,
commuting_leave date default sysdate,
constraint commuting_member_id_fk foreign key (commuting_member_id)
references member(member_id) on delete cascade
);

create sequence seq_commutting_id;
