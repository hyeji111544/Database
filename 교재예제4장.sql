#날짜 : 2024/01/08
#이름 : 윤혜지
#내용 : 교재 ch04장 SQL 고급 문법

#손코딩 p159
use `market_db`;
create table `hongong4` (
	`tinyint_col`	tinyint,
    `smallint_col`	smallint,
    `int_col`		int,
    `bigint_col`	bigint );

#손코딩 p160
insert into `hongong4` values(127, 32767, 2147483647, 9000000000000000000);
#out of range 는 입력값의 범위를 벗어났다는 의미.
insert into `hongong4` values(128, 32768, 2147483648, 90000000000000000000);

#손코딩 p164
create table `big_table` (
	data1	char(256),
    date2	varchar(16384) ); #varchar는 16383자 까지 지정 가능.
    
#손코딩 p167
use `market_db`;
set @myVar1 = 5;
set @myVar2 = 4.25;

select @myVar1 ;
select @myVar1 + @myVar2 ;

set @txt = '가수 이름==> ';
set @height = 166;
select @txt, `mem_name` from `member` where `height` > @height ;

#손코딩 p168
set @count = 3;
# select `mem_name`, `hight` from `member` order by `height` limit @count; (limit 에는 변수를 사용할 수 없음)
prepare mySQL from 'select `mem_name`,`height` from `member` order by `height` limit ?';
execute mySQL using @count;

#손코딩 p169 (데이터 형 변환)
select avg(`price`) as '평균 가격' from `buy`;

select cast(avg(`price`) as signed) '평균 가격' from `buy`;
select convert(avg(`price`) ,signed) '평균 가격' from `buy`;

#손코딩 p170
select cast('2022$12$12' as date);
select cast('2022/12/12' as date);
select cast('2022%12%12' as date);
select cast('2022@12@12' as date);

select `num`, concat(cast(`price` as char), 'X', cast(`amount` as char), '=')
	'가격x수량', `price`*`amount` '구매액'
from buy;

#손코딩 p171
select '100' + '200';
select concat('100','200');

select concat(100, '200');
select 100+ '200';
#손코딩 p177
use `marKet_db`;
select *
	from `buy`
    inner join `member`
    on buy.mem_id = member.mem_id
where buy.mem_id = 'GRL';
#손코딩 p179
select *
	from `buy`
    inner join `member`
    on buy.mem_id = member.mem_id;
    
#손코딩 p180
select buy.`mem_id`, `mem_name`, `prod_name`, `addr`, concat(phone1, phone2) '연락처'
	from buy inner join `member`
    on buy.mem_id = member.mem_id;

#손코딩 p181
select buy.`mem_id`, member.`mem_name`, buy.`prod_name`, member.`addr`, concat(member.phone1, member.phone2) '연락처'
	from buy inner join `member`
    on buy.mem_id = member.mem_id;
select B.`mem_id`, M.`mem_name`, B.`prod_name`, M.`addr`, concat(M.phone1, M.phone2)'연락처'
	from buy B
		inner join member M
		on B.mem_id = M.mem_id;
select B.`mem_id`, M.`mem_name`, B.`prod_name`, M.`addr`
	from buy B
		inner join member M
		on B.mem_id = M.mem_id
	order by M.mem_id;
#손코딩 p183
select distinct M.`mem_id`, M.`mem_name`, M.`addr`
	from buy B
		inner join member M
		on B.mem_id = M.mem_id
	order by M.mem_id;
#손코딩 p184
select B.`mem_id`, M.`mem_name`, B.`prod_name`, M.`addr`
	from member M
		left outer join buy B
		on B.mem_id = M.mem_id
	order by M.mem_id;
#손코딩 p185
select B.`mem_id`, M.`mem_name`, B.`prod_name`, M.`addr`
	from buy B
		right outer join member M
		on B.mem_id = M.mem_id
	order by M.mem_id;

select M.`mem_id`, B.`prod_name`, M.`mem_name`,  M.`addr`
	from member M
		left outer join buy B
		on M.mem_id = B.mem_id
	where B.prod_name is null
	order by M.mem_id;

#손코딩 p187
select * from `buy` cross join `member`;
#손코딩 p188
select count(*) '데이터 개수'
	from sakila.inventory
		cross join world.city;
create table `cross_table`
	select*from sakila.actor
		cross join world.country;
drop table `cross_table`;
select*from `cross_table` limit 5;

#손코딩 p191
use market_db;
create table `emp_table`(
	emp		char(4),
    manager	char(4),
    phone	varchar(8)
    );
INSERT INTO emp_table VALUES('대표', NULL, '0000');
INSERT INTO emp_table VALUES('영업이사', '대표', '1111');
INSERT INTO emp_table VALUES('관리이사', '대표', '2222');
INSERT INTO emp_table VALUES('정보이사', '대표', '3333');
INSERT INTO emp_table VALUES('영업과장', '영업이사', '1111-1');
INSERT INTO emp_table VALUES('경리부장', '관리이사', '2222-1');
INSERT INTO emp_table VALUES('인사부장', '관리이사', '2222-2');
INSERT INTO emp_table VALUES('개발팀장', '정보이사', '3333-1');
INSERT INTO emp_table VALUES('개발주임', '정보이사', '3333-1-1');

select A.emp '직원', B.emp '직속상관', B.phone '직속상관연락처'
	from `emp_table` A
		inner join `emp_table` B
        on A.manager = B.emp
	where A.emp = '경리부장';
#손코딩 p197
drop procedure if exists ifproc1;
delimiter $$
create procedure ifProc1()
begin
	if 100 = 100 then
		select '100은 100과 같습니다.';
	end if;
end $$
delimiter ;
call ifProc1();

#손코딩 p199
drop procedure if exists ifproc2;
delimiter $$
create procedure ifProc2()
begin
	Declare myNum Int;
    set myNum = 200;
	if myNum = 100 then
		select '100 입니다.';
	else
		select '100이 아닙니다.';
	end if;
end $$
delimiter ;
call ifProc2();
#손코딩 p200
drop procedure if exists ifProc3;
delimiter $$
create procedure ifproc3()
begin
	declare debutDate date;
    declare curDate	date;
    declare days int;
    
    select `debut_date` into `debutDate`
		from market_db.member
        where `mem_id`='APN';
        
	set curDATE = current_date();
    set days = datediff(curDATE, debutDate);
    
    If(days/ 365) >=5 then
		select concat('데뷔한 지', days, '일이나 지났습니다. 핑순이들 축하합니다!');
	else
		select'데뷔한 지' + days + '일밖에 안되었네요. 핑순이들 화이팅~';
        end if;
	end $$
    delimiter ;
    call ifProc3
#손코딩 p201

    
