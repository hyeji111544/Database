#날짜 : 2024/01/05
#이름 : 윤혜지
#SQL 연습문제1.

#실습 1-1
create database `Shop`;
create user 'shop'@'%' identified by '1234';
grant all privileges on Shop.*To 'shop'@'%';
flush privileges;

#실습 1-2
create table `Customer`(
`custId` varchar (10) primary key,
`name`	varchar (10) not null,
`hp`	varchar (13) ,
`addr`	varchar (100),
`rdate`	date not Null
);
drop table `customer`;

create table `Product` (
`prodNo` 	int primary key,
`prodName`	varchar (10) not null,
`stock`		int not null default'0',
`price`		int ,
`company`	varchar	(20) not null
);
drop table `product`;

create table `Order` (
`orderNo`	int primary key auto_increment ,
`orderId`	varchar (10),
`orderProduct`	int default '1' ,
`orderCount`	int,
`orderDate`	datetime
);
drop table `order`;



#실습 1-3
insert into `Customer` value ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `Customer` value ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into `Customer` value ('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03');
insert into `Customer` value ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into `Customer` (`custId`, `name`, `rdate`) value ('c105', '이성계', '2022-01-05');
insert into `Customer` value ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
insert into `Customer` (`custId`, `name`, `rdate`) value ('c107', '허준', '2022-01-07');
insert into `Customer` value ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into `Customer` value ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into `Customer` value ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

insert into `Product` value (1, '새우깡', 5000, 1500, '농심');
insert into `Product` value (2, '초코파이', 2500, 2500, '오리온');
insert into `Product` value (3, '포카칩', 3600, 1700, '오리온');
insert into `Product` value (4, '양파링', 1250, 1800, '농심');
insert into `Product` (`prodNo`, `prodName`, `stock`, `company`) value (5, '죠리퐁', 2200, '크라운');
insert into `Product` value (6, '마가렛트', 3500, 3500, '롯데');
insert into `Product` value (7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) value ('c102', 3, 2, '2022-07-01 13:15:10');
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) value ('c101', 4, 1, '2022-07-01 14:16:11');
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) value ('c108', 1, 1, '2022-07-01 17:23:18');
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) value ('c109', 6, 5, '2022-07-02 10:46:36');
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) value ('c102', 2, 1, '2022-07-03 09:15:37');
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) value ('c101', 7, 3, '2022-07-03 12:35:12');
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) value ('c110', 1, 2, '2022-07-03 16:55:36');
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) value ('c104', 2, 4, '2022-07-04 14:23:23');
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) value ('c102', 1, 3, '2022-07-04 21:54:34');
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) value ('c107', 6, 1, '2022-07-05 14:21:03');


#실습 1-4
select * from `Customer`;
#실습 1-5
select `custId`, `name`, `hp` from`Customer`;
#실습 1-6
select * from `product`;
#실습 1-7
select `company` from `product`;
#실습 1-8 제조업체를 중복 없이 조회하시오
select distinct `company` from `product`;
#실습 1-9
select `prodname`, `price` from `product`;
#실습 1-10 제품 테이블에서 제품명과 단가를 조회하되, 단가에 500원을 더해  '조정단가'로 출력하시오
select `prodname`, `price`+500 as `합계` from `product`; 
#실습 1-11
select `prodName`, `stock`, `price` From `product` where `company`='오리온';
#실습 1-12
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102';
#실습 1-13 주문 테이블에서 'c102' 고객이 2개이상 주문한 주문제품, 수량, 주문일자를 조회하시요
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102'
and `orderCount`>='2';
#실습 1-14
select*from `product` where `price`>=1000 and `price`<=2000;
select*from `product` where `price` between 1000 and 2000;
#실습 1-15
select `custId`, `name`, `hp`, `addr` from `customer` where `name` like'김%';
#실습 1-16
select `custId`, `name`, `hp`, `addr` from `customer` where `name` like'__';
#실습 1-17 휴대폰 번호가 입력되지 않은 고객을 조회하시오
select * from `customer` where `hp` is null;
#실습 1-18 주소가 입력된 고객을 조회하시요
select * from `Customer` where `addr` is not null;
#실습 1-19
select * from `Customer` where `rdate` order by `rdate`desc;
#실습 1-20 
select * from `Order` where `orderCount`>=3 
order by `ordercount`desc, `orderproduct` asc;

#실습 1-21
select avg(`price`) from `product`;
#실습 1-22
select sum(`stock`) as `재고량 합계` from `product` where `company`='농심';
#실습 1-23 고객 테이블에 고객이 몇 명 들록되어 있는지 조회하시오.
select count(`custid`) as `고객수` from `customer`;
#실습 1-24 제품 테이블에서 제조업체의 수를 조회하시고 (중복 없이 조회하기)
select count(distinct `company`) as `제조업체 수` from `product`;
#실습 1-25 주문제품별 수량의 합계를 조사
select `orderproduct` As `주문상품번호`, sum(`orderCount`) as `총 주문수량` from `Order` 
group by `orderproduct`order by `주문상품번호`;

#실습 1-26 제조업체별 제조한 제품의 개수와 제품 중 가장 비싼 단가를 조회하시오.
select `company` as `제조업체`, 
count(*)as `제품수`, max(`price`)as `최고가` 
from `product` group by `company` order by `company`;

#실습 1-27 group by 다음에 where은 못나옴
select `company` as `제조업체`, 
count(*)as `제품수`, max(`price`)as `최고가` 
from `product` Group by `company` having `제품수` >= 2;

#실습 1-28
select `orderproduct`, `orderId`, sum(`ordercount`) as `총 주문수량`
from `order` group by `orderProduct`, `orderId`
order by `orderproduct`;

#실습 1-29
select a.orderId, b.prodName From `Order` as a
join `product` as b
on a.orderProduct = b.prodNo
where `orderId` = 'c102';

select `orderid`, `name`, `prodname`, `orderDate` from `order` as a
join `customer` as b
on a.orderid = b.custId
join `product` as c
on a. orderProduct = c.prodNo
where left (`orderdate`, 10) = '2022-07-03';