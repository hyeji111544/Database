#날짜 : 2024/01/03
#이름 : 윤혜지
#내용 : 3장 제약조건

#실습 3-1
CREATE TABLE `User2`(
	`uid`	VARCHAR(10) primary key,
    `name`	VARCHAR(10),
    `birth`	CHAR(10),
    `addr`	VARCHAR(50)
    );
    
   DROP TABLE `User2`;
   
#실습 3-2
   insert INTO `User2` values ('A101', '김유신', '1968-05-09','경남 김해시');
   insert INTO `User2` values ('A102', '김춘추', '1972-11-23','경남 경주시');
   insert INTO `User2` values ('A103', '장보고', '1978-03-01','전남 완도군');
   insert INTO `User2` values ('A105', '강감찬', '1979-08-16','서울시 관악구');
   insert INTO `User2` values ('A106', '이순신', '1981-05-23','부산시 진구');
  
#실습 3-3
CREATE TABLE `User3`(
	`uid`	VARCHAR(10) Primary key,
    `name`	VARCHAR(10),
    `birth`	CHAR(10),
    `HP` 	CHAR(13) unique,
    `addr`	VARCHAR(50)
    );
    
    drop table `user3`;

#실습 3-4
    insert into `user3` values('A101', '김유신', '1968-05-09','010-1234-1111','경남 김해시');
    insert into `user3` values('A102', '김춘추', '1972-11-23','010-1234-2222','경남 경주시');
    insert into `user3` values('A103', '장보고', '1978-03-01','0101234-3333','전남 완도군');
    insert into `user3` values('A104', '강감찬', '1979-08-16','010-1234-4444','서울시 관악구');
    insert into `user3` values('A105', '이순신', '1981-05-23','010-1234-5555','부산시 진구');
    insert into `user3` values('A106', '안중근', '1981-05-21',null,'부산시 진구');
    
#실습 3-5
create table `Parent` (
	`pid`	varchar(10) primary key,
    `name`	varchar(10),
    `birth`	char(10),
    `addr`	varchar(100)
    );
create table `Child` (
	`cid`	varchar(10) primary key,
    `name`	varchar(10),
    `hp`	char(13) unique,
    `parent`varchar(10),
    foreign key(`parent`) references `parent`(`pid`)
    );
    
    drop table `Paent`;
    drop table `Child`;

    #실습 3-6
        
    insert into `Parent` values('p101','김유신','1968-05-09','경남 김해시');
    insert into `Parent` values('p102','김춘추','1972-11-23','경남 경주시');
    insert into `Parent` values('p103','장보고','1978-03-01','전남 완도시');
    insert into `Parent` values('p104','강감찬','1979-08-16','서울시 관악구');
    insert into `Parent` values('p105','이순신','1981-05-23','부산시 진구');
    
    insert into `Child` values('C101','김철수','010-1234-1001','p101');
    insert into `Child` values('C102','김영희','010-1234-1002','p101');
    insert into `Child` values('C103','강철수','010-1234-1003','p103');
    insert into `Child` values('C104','이철수','010-1234-1004','p107');
    
    #실습 3-7
create table `User4`(
	`uid`		varchar(10) primary key,
    `name`		varchar(10) not null,
    `gender`	char,
    `age`	 	int default 1,
    `hp`		char(13) unique,
    `addr`		varchar(20)
    );
    
    drop table `User4`;
    
    #실습 3-8
    insert into`User4` values('A101','김유신','M',25,'010-1234-1111','경남 김해시');
    insert into`User4` values('A102','김춘추','M',23,'010-1234-2222','경남 경주시');
    insert into`User4` values('A103','장보고','M',35,'010-1234-3333','전남 완도시');
    insert into`User4` values('A104','강감찬','M',42,'010-1234-4444','서울시 관악구');
    insert into`User4` 
					(`uid`, `name`, `gender`,`hp`,`addr`)
					values('A105','이순신','M','010-1234-5555','부산시 진구');
    insert into`User4` values('A106','신사임당','F',32,null,'강릉시');
    insert into`User4` values('A107','허난설헌','F',27,null,'경기도 광주시');
    #실습 3-9
create table `User5`(
	`seq`		int primary key auto_increment,
    `name`		varchar(10) NOT NULL,
    `gender`	char(1) check(`gender`In ('M', 'F')),
    `age`		int default 1 check (`age`>0 and `age`<100),
    `addr`		varchar(20)
    );
    
    drop table `User5`;
    
    #실습 3-10
    insert into `User5` (`name`, `gender`,`age`,`addr`) values ('김유신','M', 25, '경남 김해시');
    insert into `User5` (`name`, `gender`,`age`,`addr`) values ('김춘추','M', 23, '경남 경주시');
    insert into `User5` (`name`, `gender`,`age`,`addr`) values ('장보고','M', 35, '전남 완도시');
    insert into `User5` (`name`, `gender`,`age`,`addr`) values ('강감찬','M', 42, '서울시 관악구');
    insert into `User5` (`name`, `gender`,`age`,`addr`) values ('이순신','A', 51, '부산시');
    insert into `User5` (`name`, `gender`,`age`,`addr`) values ('신사임당','F', -1, '강릉시');