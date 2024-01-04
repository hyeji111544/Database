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
select * from `Member` where `name`='김유신';
select * from `Member` where `pos`='차장' and dep=101;
select * from `Member` where `pos`='차장' or	dep=101;
select * from `Member` where `name` != '김춘추';
select * from `Member` where `name` <> '김춘추';
select * from `Member` where `pos`='사원' or `pos`='대리';
select * from `Member` where `pos` in('사원','대리');
select * from `Member` where `dep` IN(101, 102, 103);
select * from `Member` where `name` like '%신'; #`%`자리에 아무거나 와도 된다는뜻 ->0신
select * from `Member` where `name` like '김%';
select * from `Member` where `name` like `김__`;
select * from `Member` where `name` like `_성_`;
select * from `Member` where `name` like '정_'; #정_는 글자수 표현, 만약 정%였으면 정약용도 나옴.
select * from `Sales` where `sale` > 50000;
select * from `Sales` where `sale` >=50000 and `sale`<100000 and `month`=1;
select * from `Sales` where `sale` between 50000 and 100000;
select * from `Sales` where `sale` not between 50000 and 10000;
select * from `Sales` where `year` in(2020); 
select * from `Sales` where `month` in(1, 2);
#실습 4-4
select * from `sales` order by `sale`;
select * from `sales` order by `sale` ASC;
select * from `sales` order by `sale` DESC;
select * from `member` order by `name`;
select * from `member` order by `name` DESC;
select * from `member` order by `name` ASC;
select * from `Sales` where `sale` > 50000 order by `sale` desc;
select * from `Sales`
where `sale` > 50000
order by `year`,`month`,`sale` DESC;

#실습 4-5
select * from `Sales` Limit 3;
select * from `Sales` Limit 0, 3;
select * from `Sales` Limit 1, 2;
select * from `Sales` Limit 5, 3;
select * from `Sales` order by `sale` DESC Limit 3, 5;
select * from `Sales` where `sale` < 50000 order by `sale` desc Limit 3;
select * from `Sales` 
where `sale` > 50000
order by `year` DESC, `month`, `sale` DESC
Limit 5;

#실습 4-6
select sum(`sale`) as `합계` from `Sales`;
select AVG(`sale`) as `평균` from `Sales`;
select max(`sale`) as `최대값` from `Sales`;
select min(`sale`) as `최소값` from `Sales`;
select ceiling(1.2);#(=ceil)
select ceiling(1.8);
select floor(1.2);
select floor(1.8);
select round(1.2);
select round(1.8);
select rand();
select ceil(rand() * 10);
select count(`sale`) as `갯수` from `sales`;
select count(*) as `갯수` from `Sales`;

select left('HelloWorld', 5);
select right ('HelloWorld', 5);
select substring('HelloWorld', 6, 5);
select concat('Hello','World');
select concat(`uid`, `name`, `hp`) from `member` where `uid`= 'a108';
select curdate();
select curtime();
select now();
insert into `member` values ('a112', '유관순', '010-1234-1012', '대리', 107, now());
select * from `member` where `uid`='a112';

#실습 4-7 2018년 매출의 총합을 구하시오
select `uid`, count(*) from `Sales` group by `uid`;
select Sum(`sale`) as `합계` from `sales` where `year`=2018;

#실습 4-8 2019년 2월에 5만원 이상 매출에 대한 총합과 평균을 구하시오.
select sum(`sale`) as `합계`, avg(`sale`) as `평균` 
from `sales` where `month` = 2 and `sale`>= 50000;


#실습 4-9 2020년 전체 매출 가운데 최저, 최고, 매출을 구하시오.
select * from `Sales` where `year` = 2020 order by `sale` asc limit 1;
select * from `Sales` where `year` = 2020 order by `sale` desc limit 1;

#실습 4-10
select * from `Sales` group by `uid`;
select * from `Sales` group by `year()`;
select * from `Sales` group by `uid`, `year()`;
select`uid`, count(*) as`건수` from `sales` group by `uid`;
select`uid`, sum(sale) as`합계` from `sales` group by `uid`;
select`uid`, avg(sale) as`평균` from `sales` group by `uid`;

select`uid`, `year`, SUM(sale) AS `합계`
from `Sales`
group by `uid`, `year`;

select`uid`, `year`, SUM(sale) AS `합계`
from `Sales`
group by `uid`, `year`
ORDER by `year`ASC, `합계`DESC;


#실습 4-11
select `uid`, sum(sale) as `합계` from `Sales`
group by `uid`
having `합계` >= 200000;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
where `sale`>= 100000
group by `uid`, `year`
having `합계` >= 200000
order by `합계` desc;

#실습 4-12
create table `Sales2` like `Sales`;
insert into `sales2` select * from `sales`;
update `Sales2` SET `year` = `year` + 3;

select * from `Sales` union select * from `Sales2`;
select * from `Sales` where `sale`>=100000 
union select * from `Sales2` where `sale`>=100000;

select `uid`, `year`, `sale` from `Sales`
union select `uid`, `year`, `sale` from `Sales2`;

select `uid`, `year`, sum(sale) as `합계`
from `Sales`
group by `uid`, `year`
union
select `uid`, `year`, sum(sale) as `합계`
from `Sales2`
group by `uid`, `year`
order by `year` asc, `합계` desc;

#실습 4-13
select * from `Sales` inner join `Member` on `Sales`.uid = `member`.uid;
select * from `Member` inner join `department` on `member`.dep = `department`.depNo;

select * from `Sales` as a join `Member` as b on a.uid = b.uid;
select * from `member` as a join `department` as b on a.dep = b.depNo;

select * from `Sales` as a, `Member` as b where a.uid = b.uid;
select * from `member` as a, `department` as b where a.dep = b.depNo;

select a.`seq`, a.`uid`, `sale`, `name`, `pos` from `Sales` as a
join `member` as b on a. `uid` = b.`uid`;

select a.`seq`, a.`uid`, `sale`, `name`, `pos` from `sales` as a
join `member` as b on a.`uid` = b.`uid`
where `sale`>= 100000;  #where 을 사용하여 테이블 결합에 조건을 더함.

select a. `seq`, a.`uid`, b.`name`, b.`pos`, `year`, sum(`sale`) as `합계` from `sales` as a
join `member` as b on a.uid = b.uid
group by a.`uid`, a.`year` having `합계` >= 100000
order by a.`year` ASC, `합계` DESC;

select * from `Sales` as a
join `Member` as b USING (`uid`); #세일즈와 멤버의 이름이 같아서 USING 사용함.

select 
	a.`uid`,
    a.`year`,
    a.`month`,
    a.`sale`,
    b.`name`,
    b.`hp`,
    c.`name`
from `Sales` as a
join `Member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNo;

 
#실습 4-14
select * from `Sales` as a inner join `Member` as b on a.uid = b.uid; #교집합만 나온다.
select * from `Sales` as a left	 join `Member` as b on a.uid = b.uid; #왼쪽 테이블이 기준 즉 왼쪽 데이터는 전부 나온다.
select * from `Sales` as a right join `Member` as b on a.uid = b.uid; 
#실습 4-15 