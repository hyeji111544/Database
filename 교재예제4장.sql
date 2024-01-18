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
	declare debutDate date; -- 데뷔일자
    declare curDate	date;	-- 오늘
    declare days int;		-- 활동한 일수 
    
    select `debut_date` into `debutDate` -- APN의 데뷔 일자를 추출해 into 를 사용하여 debutDate 에 저장.
		from market_db.member
        where `mem_id`='APN';
        
	set curDATE = current_date();	-- 현재날짜
    set days = datediff(curDATE, debutDate); -- dateiff 를 사용해 데뷔날짜부터 현재 날짜 까지의 일수를 저장.(데뷔한지 얼마나 지났는지)
    
    If(days/ 365) >=5 then
		select concat('데뷔한 지', days, '일이나 지났습니다. 핑순이들 축하합니다!');
	else
		select'데뷔한 지' + days + '일밖에 안되었네요. 핑순이들 화이팅~';
        end if;
	end $$
    delimiter ;
    call ifProc3();
    
#손코딩 p202
drop procedure if exists `caseProc`;
Delimiter $$
create procedure caseProc()
begin
	declare point Int;
    declare credit char(1);
    set point = 88;
    
    case
		when `point` >= 90 then
			set credit = 'A';
		when `point` >= 80 then
			set credit = 'B';
		when `point` >= 70 then
			set credit = 'C';
		when `point` >= 60 then
			set credit = 'D';
		else
			set credit = 'F';
	end case;
    select concat('취득점수==>', `point`)as '취득점수' , concat('학점==>', `credit`)as '학점';
    end $$
    Delimiter ;
    call caseProc();
    
#손코딩 p204

select mem_id, sum(price*amount) "총구매액" -- 회원 별로 총 구매액 조회
	from `buy`
    group by `mem_id`;
    
select `mem_id`, sum(price*amount) "총구매액" -- 구매액이 많은 순서로 정렬
	from `buy`
    group by `mem_id`
    order by sum(price*amount) desc;

select B.mem_id, M.mem_name, sum(price*amount) "총구매액" -- 회원 이름도 출력, 회원 테이블과 조인.
	from buy B
    inner join member M
    on B.mem_id = M.mem_id
    group by B.mem_id
    order by sum(price*amount) desc;
    
select M.mem_id, M.mem_name, sum(price*amount) "총구매액" -- 구매하지 않은 나머지의 id 는 구매테이블에 없기 때문에 M에 있는 id 조회.
	from buy B
    right outer join member M
    on B.mem_id = M.mem_id
    group by M.mem_id
    order by sum(price*amount) desc;
    

#손코딩 p206

select M.mem_id, M.mem_name, sum(price*amount) "총구매액",
	case
		when (sum(price*amount) >= 1500) then '최우수고객'
		when (sum(price*amount) >= 1000) then '우수고객'
		when (sum(price*amount) >= 1) then '일반고객'
        else '유령고객'
	end "회원등급" -- 회원등급 열 추가
    
	from buy B
    right outer join member M
    on B.mem_id = M.mem_id
    group by M.mem_id
    order by sum(price*amount) desc;


#손코딩 p207 1에서 100까지 값을 모두 더하는 기능.
drop procedure if exists whileProc;
delimiter $$
create procedure whileProc()
begin
	declare i int;
    declare hap int;
    set i = 1;
    set hap = 0;
    
    while (i<=100) do
		set hap = hap + i;
        set i = i + 1;
	end while;
		select '1부터 100까지의 합 ==>', hap;
end $$
delimiter ;
call whileProc();

#손코딩 p209
drop procedure if exists whileProc2;
delimiter $$
create procedure whileProc2()
begin
	declare i int;
    declare hap int;
    set i = 1;
    set hap = 0;
    
    mywhile: -- while문을 mywhile 이라는 레이블로 지정.
    while (i <= 100) do
		if (i%4 = 0) then -- i가 4의 배수라면 1을 증가시키고 iterate를 만나 mywhile로 올라감.
			set i = i + 1;
            iterate mywhile;
		end if;
        set hap = hap + i; -- i가 4의 배수가 아니라면 hap 에 누적시킴.
        if(hap > 1000) then
			leave mywhile;
		end if;
        set i = i + 1;
	end while;
    
    select '1부터 100까지의 합(4의 배수 제외), 1000넘으면 종료 ==>', hap;
end $$
delimiter ;
call whileProc2();
#손코딩 p210
use market_db;
prepare myQuery from 'select * from member where mem_id = "BLK"';
execute myQuery;
deallocate prepare myQuery;
#손코딩 p211
drop table if Exists gate_table;
create table gate_table (id int auto_increment primary key, entry_time datetime);

set @curDate = current_timestamp(); -- 현재 날짜와 시간

prepare myQuery from 'insert into gate_table values(null, ?)'; -- ?를 사용해서 entry_time 에 입력할 값을 비워놈
execute myQuery Using @curDate; -- using 문으로 앞서 준비한 @curDate 변수를 넣은 후 실행됨. 이 SQL을 실행한 시점의 날짜와 시간 입력.
deallocate prepare myQuery;

select * from gate_table;






