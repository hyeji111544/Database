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
#손코딩 p17
#손코딩 p17
