#날짜 : 2024/01/08
#이름 : 윤혜지
#내용 : 제5장 데이터베이스 개체

###############################
#인덱스
###############################

#실습 5-1
show index from `User1`;
show index from `user2`;
show index from `user3`;

#실습 5-2 인덱스 설정하기
create index `idx_user1_uid` on `User1`(`uid`);
analyze table `User1`;


#실습 5-3 인덱스 삭제
drop index `idx_user1_uid` on `User1`;
####################


#뷰
#실습 5-4
create view `vw_user1` as (Select `name`, `hp`, `age` from `User1`);
create view `vw_user4_age_under30` as (select * from `User4` where `age` < 30);
create view `vw_member_whit_sales` As(
select
a. `uid` as `직원아이디`,
b. `name` as `직원 이름`,
b. `pos` as `직급`,
c. `name` as `부서명`,
a. `year` as `매출년도`,
a. `month` as `월`,
a. `sale` as `매출액`
from `Sales` as a
join `member` as b on a.uid = b.uid
join `Department` as c On b.dep = c.depno
);

#실습 5-5
select*from `vw_user1`;
select*from `vw_user4_age_under30`;

#실습 5-6
drop view `vw_user1`;
drop view `vw_user4_age_under30`;
drop view `vw_member_whit_sales`;

#실습 5-7
delimiter $$
CREATE PROCEDURE proc_test1()
	begin
	select*from `Member`;
	select*from `Department`;
    End $$
    delimiter;
    
    call proc_test1();
    drop view proc_test1();
    
#실습 5-8
Delimiter $$
create procedure proc_test2(in _userName varchar(10))
begin
	select* from `Member` where `name`= _userName;
End$$
Delimiter;

Call proc_test2('김유신');
    
Delimiter $$
 create procedure proc_test3 (in_pos varchar(10), in dep tinyint)
 begin
	select*from `Member` where `pos`=_pos And `dep` =_dep;
end$$
Delimiter ;

call proc_test3('차장', 101);

Delimiter $$
create procedure proc_test4(in _pos varchar(10), out _count int)
begin
	select count(*) into _count from `Member` where `pos` =_pos;
end $$
Delimiter ;

call proc_test4('대리', @_count);
select concat('_count :', @_count)


#실습 5-9
delimiter $$
	create procedure proc_test5(In_name varchar(10))
    begin
		declare userId varchar(10);
        select `uid` into userId from `Member` where `name`=_name ;
        select * from `Sales` where `uid`=userId ;
	end $$
    delimiter ;

call proc_test5('김유신');

delimiter $$
	create procedure proc_test6()
    begin
		declare num1 int;
		declare num2 int;
        
        set num1 = 1;
        set num2 = 2;
        
        if (num1 > num2) THEN
			select 'num1이 num2보다 크다.' as `결과2`;
		else
			select 'num1이 num2보다 작다.' as `결과2`;
		end if;
	end $$
    delimiter ;
    
    call proc_test6();
    
    delimiter $$
		create procedure proc_test7()
        begin
			declare sum Int;
			declare num Int;
            
            set sum = 0;
            set num = 1;
            
            while (num<=10) do
				set sum = sum + num;
                set num = num + 1;
			end while;
            
            select sum As '1부터 10까지 합계';
		end $$
        delimiter ;
        
	call proc_test7();
    
    #5-10
     delimiter $$
		create procedure proc_test8()
        begin
			#변수 선언
            declare total int default 0;
            declare price int;
            declare endOfRow boolean default false;
            
            #커서 선언
            declare salesCursor cursor for
				select `sale` from `sales`;
			
            #반복 조건
			declare continue handler 
				for not found set endOfRow = true;
            

            #커서 열기
            open salesCursor;
            
            cursor_loop: loop #커서 루프라고 임의로 이름지음
				fetch salesCursor into price;
				
                if endOfRow then
					leave cursor_loop;
				end if;
                
                set total = total + price;
            end loop;
            
            select total As '전체 합계';
            
            close salesCursor;
		end $$
        delimiter ;
        
        Call proc_test8();
        DROP PROCEDURE IF EXISTS proc_test8;
    
    #################################################
    # 저장함수
    #################################################
    
	#5-11 
	delimiter $$
    create function func_test1(_userid varchar(10)) returns int
    begin
		declare total int;
        
        select sum(`sale`) into total from `sales` where `uid`=_userid;
        
        return total;
	end $$
    delimiter ;
    
    select func_test1('a101');
    delimiter $$
		create function func_test2(_sale int) returns double
        begin
			declare bonus double;
            
            if (_sale >= 10000) then
				set bonus = _sale * 0.1;
			else
				set bonus = _sale*0.05;
			end if;
            
		return bonus;
        end $$
        delimiter ;
        
	select
		`uid`,
        `year`,
        `month`,
        `sale`,
        func_test2(`sale`) as `bonus`
	from `sales`;
