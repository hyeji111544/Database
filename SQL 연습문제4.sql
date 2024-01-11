#날짜 : 2024/01/11
#이름 : 윤혜지
#내용 : SQL 연습문제4

#실습 4-1
create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.* to 'bookstore'@'%';
grant all privileges on `BookStore`.* to 'hyeji'@'%';
flush privileges;

#실습 4-2
create table `Customer`(
	`custId` int auto_increment primary key,
    `name`	varchar(10) not null,
    `address` varchar(20),
    `phone`	varchar(13)
    );
    
create table `Book`(
	`bookId`	int primary key,
    `bookName`	varchar(20),
    `publisher`	varchar(20),
    `price`		int
);

create table `Order`(
	`orderId`	int auto_increment primary key,
    `custId`	int,
    `bookId`	int,
    `salePrice`	int,
    `orderDate`	date
);

drop table `Customer`;
drop table `Book`;
drop table `Order`;

#실습 4-3
insert into `Customer` values (null, '박지성', '영국 맨체스타', '000-5000-0001');
insert into `Customer` values (null, '김연아', '대한민국 서울', '000-6000-0001');
insert into `Customer` values (null, '장미란', '대한민국 강원도', '000-7000-0001');
insert into `Customer` values (null, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into `Customer` values (null, '박세리', '대한민국 대전', null);

insert into `Book` values (1, '축구의 역사', '굿스포츠', 7000);
insert into `Book` values (2, '축구아는 여자', '나무수', 13000);
insert into `Book` values (3, '축구의 이해', '대한미디어', 22000);
insert into `Book` values (4, '골프 바이블', '대한미디어', 35000);
insert into `Book` values (5, '피겨교본', '굿스포츠', 8000);
insert into `Book` values (6, '역도 단계벌 기술', '굿스포츠', 6000);
insert into `Book` values (7, '야구의 추억', '이상미디어', 20000);
insert into `Book` values (8, '야구를 부탁해', '이상미디어', 13000);
insert into `Book` values (9, '올림픽 이야기', '삼성당', 7500);
insert into `Book` values (10, 'Olympic Champions', 'Pearson', 13000);

insert into `Order` values (null, 1, 1, 6000, '2014-07-01');
insert into `Order` values (null, 1, 3, 21000, '2014-07-03');
insert into `Order` values (null, 2, 5, 8000, '2014-07-03');
insert into `Order` values (null, 3, 6, 6000, '2014-07-04');
insert into `Order` values (null, 4, 7, 20000, '2014-07-05');
insert into `Order` values (null, 1, 2, 12000, '2014-07-07');
insert into `Order` values (null, 4, 8, 13000, '2014-07-07');
insert into `Order` values (null, 3, 10, 12000, '2014-07-08');
insert into `Order` values (null, 2, 10, 7000, '2014-07-09');
insert into `Order` values (null, 3, 8, 13000, '2014-07-10');

#실습 4-4
select `custId`, `name`, `address` from `Customer`;
#실습 4-5
select `bookName`, `price` from `Book`;
#실습 4-6
select `price`, `bookName` from `Book`;
#실습 4-7
select*from `Book`;
#실습 4-8
select `publisher` from `Book`;
#실습 4-9
select distinct`publisher` from `Book`;
select `publisher` from `Book` group by `publisher`;
#실습 4-10
select * from `Book` where `price`>=20000;
#실습 4-11
select * from `Book` where `price`<20000;
#실습 4-12
select * from `Book` where `price`>=10000 and `price`<=20000; 
select * from `Book` where `price`between 10000 and 20000; 
#실습 4-13
select `bookID`, `bookName`, `price` from `Book` where `price`>=15000 and `price`<=30000; 
#실습 4-14
select * from `Book` where `bookId`= 2 or`bookId`= 3 or `bookId`=5;
select * from `Book` where `bookId` in(2,3,5);
#실습 4-15
select * from `Book` where `bookId`%2=0;
select * from `Book` where mod(`bookId`,2)=0;
#실습 4-16
select * from `Customer` where `name` like '박%';
#실습 4-17
select * from `Customer` where `address` like '대한민국%';
#실습 4-18
select * from `Customer` where `phone` is not null;
#실습 4-19
select * from `Book` where `publisher`='굿스포츠' or `publisher`='대한미디어';
select * from `Book` where `publisher` in ('굿스포츠', '대한미디어');
#실습 4-20
select `publisher` from `Book` where `bookName`='축구의 역사';
#실습 4-21
select `publisher` from `Book` where `bookName` like '%축구%';
#실습 4-22
select * from `Book` where `bookName` like '_구%';
#실습 4-23
select * from `Book` where `bookName` like '%축구%' and `price`>=20000;
#실습 4-24
select * from `Book` order by `bookName` asc;
#실습 4-25
select * from `Book` order by `Price` asc, `bookName` asc;
#실습 4-26
select * from `Book` order by `price` desc, `publisher` asc;
#실습 4-27
select * from `Book` order by `price` desc limit 3;
#실습 4-28
select * from `Book` order by `price` asc limit 3;
#실습 4-29
select sum(`saleprice`) as `총판매액` from `Book`as a join `Order`;

#실습 4-30
select sum(`saleprice`) as `총판매액`,
	avg(`saleprice`) as `평균값`,
    min(`saleprice`) as `최저가`,
    max(`saleprice`) as `최고가` from `order`;
    
#실습 4-31 도서 판매 건수
select count(*) as `판매건수` from `Order` ;

#실습 4-32 야구가 포함된 도서를 농구로 변경 후 조회
select
	`bookId`,
    replace (`bookName`, '야구', '농구') as `bookName`,
    `publisher`, `price` from `Book`;

#실습 4-33 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문도서의 총 수량을 조회하시오. 단, 두 권 이상 구매한 고객만 조회할 것.
select `custId`, count(*) as `수량`
 from `Order` where `salePrice` >=8000
 group by `custId` having `수량` >=2 order by `custId`;
#실습 4-34. 고객과 고객의 주문에 관한 데이터를 모두 조회하시오.
select * from `Customer` as a join `Order` as b on a.custId = b.custId;

select * from `Customer` join `Order` using(`custId`);

select * from 
	`Customer` as a, 
    `Order`    as b 
WHERE 
	a.`custId` = b.`custId`;


#실습 4-35
select * from `Customer` as a 
join `Order` as b on a.custId = b.custId 
order by a.`custId` asc;

#실습 4-36
select `name`, `saleprice` from `Customer` as a 
join `Order` as b 
on a.custId = b.custId
order by a.`custId`;

#실습 4-37고객별로 주문한 모든도서의 총 판매액 조회, 고객별로 정렬
select 
	`name`, 
    sum(`saleprice`) 
from `Customer` as a 
join `Order` as b on a.custId = b.custId 
group by `name`
order by `name`;
#실습 4-38
select `name`, `bookName` from `Customer` as a 
join `Order` as b on a.custId=b.custId
join `Book` as c on b.bookId = c.bookId;
#실습 4-39
select `name`, `bookName` from `Customer` as a 
join `Order` as b on a.custId=b.custId
join `Book` as c on b.bookId = c.bookId
where c.price=20000;
#실습 4-40
select `name`, `saleprice` from `Customer` as a 
left join `Order` as b on a.custId= b.custId;

#실습 4-41
select sum(`saleprice`) as '총매출' from `Customer` as a 
left join `Order` as b on a.custId= b.custId
where a.name='김연아';

#실습 4-42
select `bookName` from `Book` order by `price` desc limit 1 ;
select `bookName` from `Book` order by `price`= (select Max(`price`) from `book`);
#실습 4-43 도서를 주문하지 않은 고객의 이름을 조회하시오
SELECT `name` FROM `Customer` AS a 
LEFT JOIN `Order` AS b ON a.custId = b.custId
WHERE `orderId` IS NULL;


SELECT 
	`name` 
FROM `Customer` 
	WHERE `custId` NOT IN (SELECT DISTINCT `custId` FROM `Order`);
    
#실습 4-44. Book테이블에 새로운 도서 삽입하기.
insert into `Book` values (11, '스포츠 의학', '한솔의학서적', null);

INSERT INTO `Book` SET
					`bookId` = 11, 
					`bookName` = '스포츠의학',
					`publisher` = '한솔의학서적';
#실습 4-45
update `Customer` set `address` = '대한민국 부산' where `custId`=5; 
#실습 4-46. Customer 테이블에서 고객번호가 5인 고객을 삭제
DELETE FROM `Customer` WHERE `custId`=5;




