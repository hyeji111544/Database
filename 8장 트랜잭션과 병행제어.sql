#날짜 : 2024/01/18
#이름 : 윤혜지
#내용 : 8장 트랜잭션과 병행 제어

#실습 8-1
-- 트랜잭션 시작
start transaction;

select * from `bank_account`;
update `bank_account` set
	`a_balance` = `a_balance`-10000
    where
    `a_no` = '101-11-1001';
    
update `bank_account` set
	`a_balance` = `a_balance`+10000
    where
    `a_no` = '101-11-1002';
-- 트랜잭션 작업 완료
commit;

#실습 8-2
-- 트랜잭션 시작
start transaction;

select * from `bank_account`;
update `bank_account` set
	`a_balance` = `a_balance`-10000
    where
    `a_no` = '101-11-1001';
    
update `bank_account` set
	`a_balance` = `a_balance`+10000
    where
    `a_no` = '101-11-1002';
    
-- 트랜잭션 작업 실패 처리
rollback;

#실습 8-3
select @@autocommit; # sql 연산들이 하나하나가 트랜잭션 처리가 되었다는 뜻. 1= true 153
set Autocommit = 0;

update `bank_account` set
	`a_balance` = `a_balance`-10000
    where
    `a_no` = '101-11-1001'; 
    #테이블에선 -10000된 금액으로 보여도 commit 되지 않은 상태인것. Autocommit을 껏기 때문에. rollback하면 원래 금액으로 돌아감.
    #Autocommit= 1일때는 실행하면 자동으로 commit 되고 rollback 해도 돌아가지 않음.
rollback;

select * from `bank_account`;

#실습 8-4
select * from `bank_account` where `a_no` = '101-11-1001';

start transaction;

update `bank_account`
	set `a_balance` = `a_balance` - 10000
    where `a_no` = '101-11-1001';
    
commit;






