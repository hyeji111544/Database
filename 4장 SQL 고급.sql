#날짜 : 2024/01/03
#이름 : 윤혜지
#내용 : 4장 SQL고급

#실습 4-1
create table `직원테이블(Member)`(
	`컬럼명(한글)`	varchar(10),
    `영문명`		varchar(10),
    `데이터유형`	varchar(10),
    `길이`		varchar(10),
    `NULL허용`	char(1),
    `기본값`		varchar(20) default '없음'
    );

create table `부서 테이블(Department)`(
	`컬럼명(한글)`	varchar(10),
    `영문명`		varchar(10),
    `데이터유형`	varchar(10),
    `길이`		varchar(10),
    `NULL허용`	char(1),
    `기본값`		varchar(20) default '없음'
    );
    
create table `매출 테이블(Sales)`(
	`컬럼명(한글)`	varchar(10),
    `영문명`		varchar(10),
    `데이터유형`	varchar(10),
    `길이`		varchar(10),
    `NULL허용`	char(1),
    `기본값`		varchar(20) default '없음'
    );

drop table `직원테이블(Member)`;
drop table `부서 테이블(Department)`;
drop table `매출 테이블(Sales)`;

insert into `직원테이블(Member)`(`컬럼명(한글)`,`영문명`,`데이터유형`,`길이`,`NULL허용`) values ('아이디', 'uid', '문자열', 10, 'x');
insert into `직원테이블(Member)`(`컬럼명(한글)`,`영문명`,`데이터유형`,`길이`,`NULL허용`) values ('이름', 'name', '문자열', 10, 'x');
insert into `직원테이블(Member)`(`컬럼명(한글)`,`영문명`,`데이터유형`,`길이`,`NULL허용`) values ('휴대폰(UK)', 'hp', '문자열', 13, 'x');
insert into `직원테이블(Member)` values ('직급', 'pos', '문자열', 10, 'x', '사원');
insert into `직원테이블(Member)` values ('부서번호', 'dep', '숫자', '정수', 'O', NULL);
insert into `직원테이블(Member)`(`컬럼명(한글)`,`영문명`,`데이터유형`,`길이`,`NULL허용`) values ('입사일', 'rdate', '날짜시간', '날짜시간', 'x');

insert into `부서 테이블(Department)` (`컬럼명(한글)`,`영문명`,`데이터유형`,`길이`,`NULL허용`) values ('부서번호(PK)', 'depNo', '숫자', '정수', 'x');
insert into `부서 테이블(Department)` (`컬럼명(한글)`,`영문명`,`데이터유형`,`길이`,`NULL허용`) values ('부서명', 'name', '문자열', 10, 'x');
insert into `부서 테이블(Department)` (`컬럼명(한글)`,`영문명`,`데이터유형`,`길이`,`NULL허용`) values ('부서전화번호', 'tel', '문자열', 12, 'x');

insert into `매출 테이블(Sales)`  values ('번호(PK)', 'seq', '숫자', '정수', 'x', 'AUTO_INCREMENT');
insert into `매출 테이블(Sales)` (`컬럼명(한글)`,`영문명`,`데이터유형`,`길이`,`NULL허용`) values ('직원아이디', 'uid', '문자열', 10, 'x');
insert into `매출 테이블(Sales)` (`컬럼명(한글)`,`영문명`,`데이터유형`,`길이`,`NULL허용`) values ('매출연도', 'year', '년도', '년도', 'x');
insert into `매출 테이블(Sales)` (`컬럼명(한글)`,`영문명`,`데이터유형`,`길이`,`NULL허용`) values ('매출월', 'month', '숫자', '정수', 'x');
insert into `매출 테이블(Sales)` (`컬럼명(한글)`,`영문명`,`데이터유형`,`길이`,`NULL허용`) values ('매출액', 'sale', '숫자', '정수', 'x');



#실습 4-2
create table `Member`(
	`uid`		varchar(10) primary key,
    `name`		varchar(10),
    `hp`		varchar(13),
    `pos`		varchar(10),
    `dep`		int,
    `rdate`		varchar(30)
    );
    
create table `Sales`(
    `seq`		int primary key auto_increment,
    `uid`		varchar(10),
    `year`		year,
    `month`		int,
    `sale`		int
    );
    
create table `Department`(
    `depNo`		int primary key,
    `name`		varchar(10),
    `tel`		varchar(13)
    );
    
    drop table `Member`;
    drop table `Sales`;
    drop table `Department`;
    
    insert into `Member` value ('a101','박혁거세','010-1234-1001', '부장', 101, '2020-11-19 11:39:48');
    insert into `Member` value ('a102','김유신','010-1234-1002', '차장', 101, '2020-11-19 11:39:48');
    insert into `Member` value ('a103','김춘추','010-1234-1003', '사원', 101, '2020-11-19 11:39:48');
    insert into `Member` value ('a104','장보고','010-1234-1004', '대리', 102, '2020-11-19 11:39:48');
    insert into `Member` value ('a105','강감찬','010-1234-1005', '과장', 102, '2020-11-19 11:39:48');
    insert into `Member` value ('a106','이성계','010-1234-1006', '차장', 103, '2020-11-19 11:39:48');
    insert into `Member` value ('a107','정철','010-1234-1007', '차장', 103, '2020-11-19 11:39:48');
    insert into `Member` value ('a108','이순신','010-1234-1008', '부장', 104, '2020-11-19 11:39:48');
    insert into `Member` value ('a109','허균','010-1234-1009', '부장', 104, '2020-11-19 11:39:48');
    insert into `Member` value ('a110','정약용','010-1234-1010', '사장', 105, '2020-11-19 11:39:48');
    insert into `Member` value ('a111','박지원','010-1234-1011', '사장', 105, '2020-11-19 11:39:48');
  
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a101',2018, 1, 98100);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a102',2018, 1, 136000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a103',2018, 1, 80000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a104',2018, 1, 78000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a105',2018, 1, 93000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a101',2018, 2, 23500);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a102',2018, 2, 126000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a103',2018, 2, 18500);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a105',2018, 2, 19000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a106',2018, 2, 53000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a101',2019, 1, 24000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a102',2019, 1, 109000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a103',2019, 1, 101000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a104',2019, 1, 53500);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a107',2019, 1, 24000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a102', 2019, 2, 160000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a103', 2019, 2, 101000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a104', 2019, 2, 43000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a105', 2019, 2, 24000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a106', 2019, 2, 109000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a102',2020, 1, 201000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a104',2020, 1, 63000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a105',2020, 1, 74000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a106',2020, 1, 122000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a107',2020, 1, 111000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a102',2020, 2, 120000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a103',2020, 2, 93000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a104',2020, 2, 84000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a105',2020, 2, 180000);
	insert into `Sales` (`uid`, `year`, `month`, `sale`) value ('a108',2020, 2, 76000);
    
    insert into `Department` values (101, '영업1부', '051-512-1001');
    insert into `Department` values (102, '영업2부', '051-512-1002');
    insert into `Department` values (103, '영업3부', '051-512-1003');
    insert into `Department` values (104, '영업4부', '051-512-1004');
    insert into `Department` values (105, '영업5부', '051-512-1005');
    insert into `Department` values (106, '영업지원부', '051-512-1006');
    insert into `Department` values (107, '인사부', '051-512-1007');

    
    
    
#실습 4-3
#실습 4-4
#실습 4-5
#실습 4-6
#실습 4-7
#실습 4-8
#실습 4-9
#실습 4-10
#실습 4-11
#실습 4-12