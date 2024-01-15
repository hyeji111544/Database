
insert into `students` values (20101001,10,'p10101','정우성','760121-1234567','010-1011-7601',null,'서울');
insert into `students` values (20101002,10,'p10101','이정재','750611-1234567','010-1102-7506',null,'서울');
insert into `students` values (20111011,11,'p11103','전지현','890530-1234567','010-1103-8905','jjh@naver.com','대전');
insert into `students` values (20111013,11,'p11103','이나영','790413-1234567','010-2101-7904','lee@naver.com','대전');
insert into `students` values (20111014,11,'p11104','원빈','660912-1234567','010-2104-6609','one@daum.net','대전');
insert into `students` values (21221010,22,'p22110','장동건','790728-1234567','010-3101-7907','jang@naver.com','대구');
insert into `students` values (21231002,23,'p23102','고소영','840615-1234567','010-4101-8406','goso@daum.net','대구');
insert into `students` values (22311011,31,'p31104','김연아','651021-1234567','010-5101-6510','yuna@daum.net','대구');
insert into `students` values (22311014,31,'p31104','유재석','721128-1234567','010-6101-7211',null,'부산');
insert into `students` values (22401001,40,'p40101','강호동','920907-1234567','010-7103-9209',null,'부산');
insert into `students` values (22401002,40,'p40101','조인성','891209-1234567','010-7104-8912','join@gmail.com','광주');
insert into `students` values (22421003,42,'p42103','강동원','770314-1234567','010-8101-7703','dong@naver.com','광주');

insert into `Professors`values ('p10101',10, '김유신','750120-1234567','010-1101-1976','kimys@hg.ac.kr','서울');
insert into `Professors`values ('p10102',10, '계백','740610-1234567','010-1102-1975','gaeback@hg.ac.kr','서울');
insert into `Professors`values ('p11101',11, '김관창','880529-1234567','010-1103-1989','kwanch@hg.ac.kr','대전');
insert into `Professors`values ('p11103',11, '김춘추','780412-1234567','010-2101-1979','kimcc@hg.ac.kr','대전');
insert into `Professors`values ('p11104',11, '이사부','650911-1234567','010-2104-1966','leesabu@hg.ac.kr','대전');
insert into `Professors`values ('p22110',22, '장보고','780727-1234567','010-3101-1979','jangbg@hg.ac.kr','대구');
insert into `Professors`values ('p23102',23, '선덕여왕','830614-1234567','010-4101-1984','gueen@hg.ac.kr','대구');
insert into `Professors`values ('p31101',31, '강감찬','641020-1234567','010-5101-1965','kang@hg.ac.kr','대구');
insert into `Professors`values ('p31104',31, '신사임당','711127-1234567','010-6101-1973','sinsa@hg.ac.kr','부산');
insert into `Professors`values ('p40101',40, '이이','910906-1234567','010-7103-1992','leelee@hg.ac.kr','부산');
insert into `Professors`values ('p40102',40, '이황','881208-1234567','010-7104-1989','hwang@hg.ac.kr','광주');
insert into `Professors`values ('p42103',42, '송상현','760313-1234567','010-8101-1977','ssh@hg.ac.kr','광주');

insert into `departments` values (10,'국어국문학과','051-510-1010');
insert into `departments` values (11,'영어영문학과','051-510-1011');
insert into `departments` values (20,'경영학과','051-510-1020');
insert into `departments` values (21,'경제학과','051-510-1011');
insert into `departments` values (22,'정치외교학과','051-510-1022');
insert into `departments` values (23,'사회복지학과','051-510-1023');
insert into `departments` values (30,'수학과','051-510-1030');
insert into `departments` values (31,'통계학과','051-510-1031');
insert into `departments` values (32,'생명과학과','051-510-1032');
insert into `departments` values (40,'기계공학과','051-510-1040');
insert into `departments` values (41,'전자공학과','051-510-1041');
insert into `departments` values (42,'컴퓨터공학과','051-510-1042');

insert into `Lectures` values (101001, 'p10101','대학 글쓰기', 2, 10, '본102');
insert into `Lectures` values (101002, 'p10102','한국어음운론', 3, 30, '본102');
insert into `Lectures` values (101003, 'p10102','한국현대문학사', 3, 30, '본103');
insert into `Lectures` values (111011, 'p11103','중세영문학', 3, 25, '본201');
insert into `Lectures` values (111012, 'p11104','영미시', 3, 25, '본201');
insert into `Lectures` values (231110, 'p23102','사회복지학개론', 1, 8, '별관303');
insert into `Lectures` values (311002, 'p31101','통계학의 이해', 2, 16, '별관303');
insert into `Lectures` values (311003, 'p31104','기초 통계학', 3, 26, '별관303');
insert into `Lectures` values (401019, 'p40101','기계역학', 3, 36, '공학관 102');
insert into `Lectures` values (421012, 'p42103','데이터베이스', 3, 32, '공학관 103');

insert into `Register` (`stdNo`,`lecNo`,`proNo`) values(20101001, 101001, 'p10101');
insert into `Register` (`stdNo`,`lecNo`,`proNo`) values(20101001, 101002, 'p10102');
insert into `Register` (`stdNo`,`lecNo`,`proNo`) values(20111013, 111011, 'p11103');
insert into `Register` (`stdNo`,`lecNo`,`proNo`) values(21231002, 231110, 'p23102');
insert into `Register` (`stdNo`,`lecNo`,`proNo`) values(22401001, 401019, 'p40101');
insert into `Register` (`stdNo`,`lecNo`,`proNo`) values(22401001, 421012, 'p42103');
insert into `Register` (`stdNo`,`lecNo`,`proNo`) values(20101001, 101003, 'p10102');
insert into `Register` (`stdNo`,`lecNo`,`proNo`) values(22421003, 311003, 'p31104');
insert into `Register` (`stdNo`,`lecNo`,`proNo`) values(22421003, 421012, 'p42103');
insert into `Register` (`stdNo`,`lecNo`,`proNo`) values(20111013, 111012, 'p11104');

#문제 5-1 모든 학생의 학생번호, 이름, 휴대폰 학과번호 학과명
select `stdNo`,`stdName`,`stdHp`,`depNo`,`depName` from `Students` as a
join `Departments` as b using (`depNo`);
#문제 5-2 모든 교수의 학생번호, 이름, 휴대폰 학과번호 학과명 ?
select `proNo`,`proName`,`proHp`,a.depNo,`depName` from `professors` as a
join `departments` as b on a.depNo=b.depNo;

#문제 5-3 모든 강좌의 강좌번호, 강좌명, 담당교수명, 휴대폰 조회
select `lecNo`,`lecName`,`proName`,`proHp` from `lectures` 
join `professors` using(proNo);

select `lecNo`,`lecName`,`proName`,`proHp` 
	from `lectures` as a,
		`professors` as b
where a.`proNo`=b.`proNo`;

#문제 5-4 모든 강좌의 강좌번호, 강좌명, 담당교수 번호, 담당교수명, 휴대폰, 학과번호, 학과명 조회
select `lecNo`,`lecName`,a.proNo,`proName`,`proHp`,b.depNo,`depName` from `lectures` as a
left join `professors` as b on a.proNo=b.proNo
join `departments` as c on b.depNo=c.depNo;

select `lecNo`,`lecName`,a.proNo,`proName`,`proHp`,b.depNo,`depName`
	from `lectures` as a,
		`professors` as b,
        `departments` as c
where 
	a.`proNo` = b.`proNo` and
    b.`depNo` = c.`depNo`;

#문제 5-5 모든 수강 내역에서 학생번호, 학생명, 강좌번호, 강좌명, 교수번호, 교수명을 조회하시오
select 
	a.`stdNo`,
    b.`stdName`,
    a.`lecNo`, 
    c.`lecName`, 
    a.`proNo`,
    d.`proName` 
    from `register` as a
join `lectures` as b on a.lecNo=b.lecNo
join `professors` as c on b.proNo=c.proNo
join `students` as d on a.stdNo=d.stdNo;

#문제 5-6 수강테이블에 출석점수, 중간고사 점수, 기말고사 점수를 임의로 입력(1~100사이)
update `Register` set `regAttenScore`=34, `regMidScore`=56, `regFinalScore`=78 where `stdNo`=20101001 and `lecNo`=101001; 
update `Register` set `regAttenScore`=55, `regMidScore`=80, `regFinalScore`=99 where `stdNo`=20101001 and `lecNo`=101002; 
update `Register` set `regAttenScore`=70, `regMidScore`=90, `regFinalScore`=54 where `stdNo`=20111013 and `lecNo`=111011; 
update `Register` set `regAttenScore`=75, `regMidScore`=88, `regFinalScore`=65 where `stdNo`=21231002 and `lecNo`=201110; 
update `Register` set `regAttenScore`=64, `regMidScore`=86, `regFinalScore`=78 where `stdNo`=22401001 and `lecNo`=401019; 
update `Register` set `regAttenScore`=98, `regMidScore`=84, `regFinalScore`=56 where `stdNo`=22401001 and `lecNo`=421012; 
update `Register` set `regAttenScore`=87, `regMidScore`=83, `regFinalScore`=88 where `stdNo`=20101001 and `lecNo`=101003; 
update `Register` set `regAttenScore`=97, `regMidScore`=82, `regFinalScore`=76 where `stdNo`=22421003 and `lecNo`=311003; 
update `Register` set `regAttenScore`=67, `regMidScore`=77, `regFinalScore`=97 where `stdNo`=22421003 and `lecNo`=421012; 
update `Register` set `regAttenScore`=88, `regMidScore`=76, `regFinalScore`=56 where `stdNo`=20111013 and `lecNo`=111012; 

update `register` set
				`regAttenScore` = ceil(rand()*100),
				`regMidscore` = ceil(rand()*100),
				`regFinalScore` = ceil(rand()*100);

#문제 5-7 수강 테이블에 출석점수, 중간고사 점수, 기말고사 점수를 모두 더한 평균을 구해 총점에 입력
select avg(regAttenScore+regMidScore+regFinalScore) as `regTotal` from `register`  where `stdNo`=20101001 and `lecNo`=101001; 
update `Register` set `regTotal` = (select avg(`regAttenScore`+`regMidScore`+`regFinalScore`) from `register`)
where `stdNo`=20101001 and `lecNo`=101001;


update `Register` set 
			`regTotal`= (`regAttenScore`+`regMidScore`+`regFinalScore`)/3;
#문제 5-8 수강 테이블에 총점을 기준으로 A~F등급을 입력
update `Register` set `regGrade` = 
					if(`regTotal`>=90, 'A',
					if(`regTotal`>=80, 'B',
                    if(`regTotal`>=70, 'C',
                    if(`regTotal`>=60, 'D','F'))));
#문제 5-9 수강 테이블에서 총점이 가장 큰 점수를 조회
select * from `Register` order by `regTotal` desc limit 1; 
#문제 5-10 수강 테이블에서 정우성 학생의 총점의 평균
select avg(`regTotal`)as `총점 평균` from `Register` as a
join `Students` as b on a.stdNo = b.stdNo
where `stdName` = '정우성';


