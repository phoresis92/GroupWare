

-- 회원 관련
======================================================================

create table member(
member_id int(20) primary key,
member_pw varchar(20) not null,
member_name varchar(10) not null,
member_birth varchar(10) not null,
member_email varchar(20) not null,
member_address1 varchar(10),
member_address2 varchar(100) not null,
member_address3 varchar(100),
member_phone int(15),
member_department int(3),
member_rank int(2),
member_indate date,
member_modidate date,
constraint member_rank_fk foreign key(member_rank)
references rank(rank_id) on delete cascade,
constraint member_department_fk foreign key (member_department)
references department(department_id) on delete cascade
);

drop table member;



create table rank(
rank_id int(2) primary key,
rank_name varchar(30) not null
);

drop table rank;



create table department(
department_id int(3) primary key,
department_name varchar(30) not null
);

drop table department;

======================================================================







--게시판
======================================================================

create table board_section(
b_section_id int(3) primary key,
b_section_name varchar(30) not null
);

drop table section;



create table board(
board_id int auto_increment primary key,
board_section int(3) not null,
board_member_id int(20) not null,
board_title varchar(500) not null,
board_content varchar(10000) not null,
board_indate timestamp default current_timestamp,
board_hits int default 0,
constraint board_section_fk foreign key (board_section)
references board_section(b_section_id) on delete cascade,
constraint board_member_id_fk foreign key (board_member_id)
references member(member_id) on delete cascade
);

drop table board;



create table reply(
reply_id int auto_increment primary key,
reply_board_id int not null,
reply_member_id int(20) not null,
reply_content varchar(5000) not null,
reply_indate timestamp default current_timestamp,
reply_modidate date,
constraint reply_board_id_fk foreign key (reply_board_id)
references board(board_id) on delete cascade,
constraint reply_member_id_fk foreign key (reply_member_id)
references member(member_id) on delete cascade
);

drop table reply;

======================================================================







--전자결재
======================================================================

create table approval_cate(
apv_cate_id int(3) primary key,
apv_cate_name varchar(50) not null
);

create table approval_auth(
apv_auth_id int(1) primary key,
apv_auth_name varchar(30) not null
);

create table approval(
approval_id int auto_increment primary key,
approval_cate int(3) not null,
approval_member_id int(20) not null,
approval_mem1 int(20),
approval_mem2 int(20),
approval_mem3 int(20),
approval_auth1 int(1),
approval_auth2 int(1),
approval_auth3 int(1),
approval_title varchar(500) not null,
approval_content varchar(5000) not null,
approval_filepath varchar(1000),
approval_filename varchar(1000),
approval_return varchar(1000),
approval_indate timestamp default current_timestamp,
approval_enddate date,
approval_cc varchar(1000),
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
cal_cate_id int auto_increment primary key,
cal_cate_name varchar(100) not null
);

create table calendar(
calendar_id int auto_increment primary key,
calendar_cate int not null,
calendar_member_id int(20) not null,
calendar_start timestamp not null default CURRENT_TIMESTAMP,
calendar_end timestamp not null default CURRENT_TIMESTAMP,
calendar_title varchar(100) not null,
calendar_content varchar(3000) not null,
calendar_color varchar(10),
constraint calendar_member_id_fk foreign key (calendar_member_id)
references member(member_id) on delete cascade,
constraint calendar_cate_fk foreign key (calendar_cate)
references calendar_cate(cal_cate_id) on delete cascade
);

======================================================================






-- 출퇴근
======================================================================

create table commuting(
commuting_id int auto_increment primary key,
commuting_member_id int(20) not null,
commuting_arrive timestamp not null default CURRENT_TIMESTAMP,
commuting_leave timestamp not null default CURRENT_TIMESTAMP,
constraint commuting_member_id_fk foreign key (commuting_member_id)
references member(member_id) on delete cascade
);
