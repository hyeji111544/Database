#날짜 : 2024/01/02
#이름 : 윤혜지
#내용 : 2장 SQL 기초

#실습 2-1
CREATE TABLE `User1`(
`uid` VARCHAR(10),
`name` VARCHAR(10),
`hp` CHAR(13),
`age` INT
);

DROP TABLE `User1`;

#실습 2-2
INSERT INTO `user1` VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `user1` VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO `user1` VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO `user1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', 45);
INSERT INTO `user1` SET `uid`='A105', `name`='이순신', `hp`='010-1234-5555';

#실습 2-3
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30;
SELECT `uid`, `name`,`age` FROM `user1`;

#실습 2-4
UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid`='A104';
UPDATE `User1` SET `age`=51 WHERE `uid`='A105';
UPDATE `User1` SET `hp`='010-1234-1001', `age`=27 WHERE `uid`='A101';

#실습 2-5
DELETE FROM `User1` WHERE `uid`='A101';
DELETE FROM `User1` WHERE `uid`='A102' AND `age`=25;
DELETE FROM `User1` WHERE `age`>= 30;

#실습 2-6
ALTER TABLE `User1` ADD `gender` TINYINT;
ALTER TABLE `User1` ADD `birth` CHAR(10) AFTER `name`;
ALTER TABLE `User1` MODIFY `gender` CHAR(1);
ALTER TABLE `User1` MODIFY `age` TINYINT;
ALTER TABLE `User1` DROP `gender`;

#실습 2-7
CREATE TABLE `User1Copy` LIKE `User1`;
INSERT INTO `User1Copy` SELECT * FROM `User1`;

#실습 2-8
CREATE TABLE `TblUser`(
`user_id`  VARCHAR(10),
`user_name` VARCHAR(10),
`user_hp` CHAR(13),
`user_age` TINYINT,
`user_addr` VARCHAR(20)
);

DROP TABLE `TblUser`;

INSERT INTO `TblUser` VALUES ('p101', '김유신', '010-1234-1001', 25 , '경남 김해시');
INSERT INTO `TblUser` VALUES ('p102', '김춘추', '010-1234-1002', 23 , '경남 경주시');
INSERT INTO `TblUser` (`user_id`, `user_name`, `user_age`, `user_addr`) VALUES ('p103', '장보고', 31 , '전남 완도군');
INSERT INTO `TblUser` SET `user_id`='p104', `user_name`='강감찬', `user_addr`='서울시 중구';
INSERT INTO `TblUser` (`user_id`, `user_name`, `user_hp`, `user_age`) VALUES ('p103', '장보고', '010-1234-1005' , 50);

CREATE TABLE `TblProduct`(
`prod_no`		int,
`prod_name` 	varchar(10),
`prod_price`	int,
`prod_stock`	int,
`prod_company`	varchar(10),
`prod_date`		date
);

drop table `TblProduct`;

insert into `TblProduct` value (1001, '냉장고', 800000, 25, 'LG전자', '2022-01-06');
insert into `TblProduct` value (1002,'노트북', 1200000, 120, '삼성전자', '2022-01-07');
insert into `TblProduct` value (1003,'모니터', 350000, 35, 'LG전자', '2023-01-13');
insert into `TblProduct` value (1004,'세탁기', 1000000, 80, '삼성전자', '2021-01-01');
insert into `TblProduct` value (1005,'컴퓨터', 1500000, 20, '삼성전자', '2023-10-01');
insert into `TblProduct` (`prod_no`, `prod_name`, `prod_price`,`prod_stock`) values (1006, '휴대폰', 950000, 102);

#실습 2-9

select*from `Tbluser`;
select `user_name` From `Tbluser`;
select `user_name`, `user_hp` from `TblUser`;
select * from `Tbluser` where `user_id`='p102';
select * from `Tbluser` where `user_id`='p104' or `user_id`='p105';
select * from `Tbluser` where `user_addr`='부산시 금정구';
select * from `Tbluser` where `user_age` >30;
select * from `Tbluser` where `user_hp` IS NULL;
update  `Tbluser`



