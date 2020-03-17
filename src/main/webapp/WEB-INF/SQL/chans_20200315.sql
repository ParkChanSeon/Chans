use pro2sen;


create table user(

user_id varchar(50) primary key,
user_pw varchar (100) not null,
user_name varchar(50) not null,
user_mail varchar(100) not null

);


create table contents(

contents_no

);




create table test(

test01 varchar(10),
test02 varchar(20)

);

select * from test;

insert into test(
test01, test02
)values('chans','chans2');


use pro2sen;

drop table test;

drop table projects;

-- projects 테이블 
create table projects(

p_no int auto_increment primary key,
p_title varchar(50) not null,
p_start_date varchar(10) not null,
p_end_date varchar(10) not null,
p_summary varchar(100) not null,
p_detail text not null,


p_create_date varchar(10) not null,
p_create_time varchar(10) not null,

p_mod_date varchar(10),
p_mod_time varchar(10),

p_create_user varchar(20) not null,
p_mod_user varchar(20),
p_use_yn varchar(10) default 'Y' not null
);

select * from projects;


select p_no, p_title, p_start_date, p_end_date, p_create_date, p_create_time, p_use_yn
from projects;


select * from images;

drop table images;
-- 이미지 첨부 파일 테이블
create table images(

i_no int auto_increment primary key,
i_project_no int not null,
i_real_name varchar(200) not null,
i_extension varchar(10) not null,
i_size varchar(20) not null,
i_name varchar(200) not null,
i_create_date varchar(10) not null,
i_create_time varchar(10) not null,
i_mod_date varchar(10) ,
i_mod_time varchar(10) ,
i_type varchar(10),
i_path varchar(300) not null,

foreign key (i_project_no) references projects (p_no) 
);



-- 20200314
-- db암호화

use pro2sen;

show tables;

drop table tb_admin_password02;


-- 단방향 (암호화, 복호화가 가능한) SHA2 사용 
-- 전화번호, 주소 같은 개인정보 암호화때 주로 사용
/*
create table tb_admin_password(
ap_no int auto_increment primary key,
ap_id varchar(20) not null,
ap_pw blob not null
);




insert into tb_admin_password(
ap_id,ap_pw
) values (
'admin01', aes_encrypt('pw_test',SHA2('key_value',512))
);



select ap_no, ap_id, ap_pw , convert(aes_decrypt(ap_pw,sha2('key_value',512)) using utf8) as decrypt from tb_admin_password;



select * from tb_admin_password
where 
ap_id = 'admin01' 
and 
convert(aes_decrypt(ap_pw,sha2('key_value',512)) using utf8) = 'pw_test';




create table tb_admin_password02(
ap_no int auto_increment primary key,
ap_id varchar(20) not null,
ap_pw VARCHAR(50) not null
);



insert into tb_admin_password02(
ap_id,ap_pw
) values (
'admin01', hex(aes_encrypt('pw_test','key'))
);

select * from tb_admin_password02;


select ap_pw, convert(aes_decrypt(unhex(ap_pw),'key') using utf8 ) as decrypt from tb_admin_password02 ;

select * from tb_admin_password02
where 
ap_id = 'admin01'
and
convert(aes_decrypt(unhex(ap_pw),'key') using utf8 ) = 'pw_test';


*/
use pro2sen;
create table tb_admin_password(
ap_no int auto_increment primary key,
ap_id varchar(20) not null,
ap_pw varchar(50) not null
);

insert into tb_admin_password(
ap_id,ap_pw
) values (
'admin01', hex(aes_encrypt('qkrckstjs1828!','key'))
);

select * from tb_admin_password;


drop table tb_admin_password;


use pro2sen;

select * from projects;


select * from images;


select i_project_no, i_name, i_type, i_path from images where i_type='logo';


