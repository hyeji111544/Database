drop database if exists `naver_db`;
create database `naver_db`;

use `naver_db`;
drop table if exists `member`;
create table `member`(
	mem_id		char(8) not null primary key,
    mem_name	varchar(10) not null,
    mem_number	tinyint not null,
    addr		char(2) not null,
    phone1		char(3) null,
    phone2		char(8) null,
    height		tinyint unsigned null,
    debut_date	date null
);

drop table if exists `buy`;
create table `buy`(
	num			int auto_increment not null primary key,
    mem_id		char(8) not null,
    prod_name	char(6) not null,
    group_name	char(4) null,
    price		int unsigned not null,
    amount		smallint unsigned not null,
    foreign key(mem_id) references member(mem_id)
);

insert into `member` values ('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015-10-19');
insert into `member` values ('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016-8-8');
insert into `member` values ('WMN', '여자친구', 6, '경기', '031', '22222222', 166, '2015-1-15');

insert into `buy` values (null, 'BLK', '지갑', null, 30, 2);
insert into `buy` values (null, 'BLK', '맥북프로', '디지털', 1000, 1);
insert into `buy` values (null, 'APN', '아이폰', '디지털', 200, 1);

#손코딩 238
drop table if exists `member`;
create table `member`(
	mem_id		char(8) not null,
    mem_name	varchar(10) not null,
    height		tinyint unsigned null,
    primary key (mem_id)
);

drop table if exists `member`;
create table `member`(
	mem_id		char(8) not null ,
    mem_name	varchar(10) not null,
    height		tinyint unsigned null
);
alter table `member`
	add constraint
    primary key(mem_id);
    

#손코딩 240 create 테이블에서 외래키 설정하는 방법
drop table if exists buy, `member`;
create table member(
	mem_id		char(8) not null primary key,
    mem_name	varchar(10) not null,
    height		tinyint unsigned null
);
create table buy(
	num		int auto_increment not null primary key,
    mem_id	char(8) not null,
    prod_name	char(6) not null,
    foreign key(mem_id) references member(mem_id)
    );
    
#손코딩 242 alter table 에서 설정하는 외래 키 제약조건
drop table if exists `buy`;
create table buy(
	num		int auto_increment not null primary key,
    mem_id	char(8) not null,
    prod_name	char(6) not null
    );
    alter table `buy`
		add constraint
        foreign key(mem_id)
        references member(mem_id);
        
#손코딩 243 

insert into `member` values ('blk', '블랙핑크', 163);
insert into `buy` values (null,'blk','지갑');
insert into `buy` values (null,'blk','맥북');

select M.mem_id, M.mem_name, B.prod_name
from buy B
inner join member M
on B.mem_id = M.mem_id;

update member set mem_id = 'Pink' where mem_id='blk';
delete from member where mem_id = 'blk';

#손코딩 245
drop table if exists `buy`;
create table buy(
	num		int auto_increment not null primary key,
    mem_id	char(8) not null,
    prod_name	char(6) not null
    );
    alter table `buy`
		add constraint
        foreign key(mem_id)
        references member(mem_id)
	on update cascade
    on delete cascade;
    
insert into `buy` values (null,'blk','지갑');
insert into `buy` values (null,'blk','맥북');

update member set mem_id = 'Pink' where mem_id='blk';

select M.mem_id, M.mem_name, B.prod_name
from buy B
inner join member M
on B.mem_id = M.mem_id;

delete from member where mem_id = 'Pink';
select * from buy;