-- 생성하는 방법 해당하는 범위를 정하고 F5버튼을 눌러준다


CREATE TABLE member0530(
midx int not null PRIMARY key AUTO_INCREMENT,
memberid VARCHAR(20) not null,
memberpwd VARCHAR(20) not null,
membername VARCHAR(50) not null,
membergender CHAR(1) not null,
memberaddr VARCHAR(10) null,
delyn char(1) DEFAULT 'n',
writeday datetime DEFAULT NOW(),
ip VARCHAR(30)
);


-- 테이블 member0530 변경하기 (alter)
-- add 키워드로 추가하고 싶은 데이터를 넣을 수 있다.
alter table member0530
add membermail VARCHAR(50) null;

alter table member0530
add memberbirth VARCHAR(10) null;

-- modify 키워드로 데이터의 값을 수정할 수 있다.
alter table member0530
MODIFY ip VARCHAR(20) null;

ALTER TABLE member0530
MODIFY membername VARCHAR(20) null;

--테이블 member0530 삭제하기 (drop)

delete from member0530  WHERE midx ="2";

--2. DML(데이터 조작언어)
--2.1 insert 구문(데이터 입력하기)
--형식
INSERT into 테이블(컬럼1,컬럼2) values('값',값);

insert into member0530(memberid,memberpwd,membername,membergender,memberaddr,ip,membermail,memberbirth)
values('test1','1111','홍길동','F','전주','111.222.333.444','hhh@naver.com','20010101');
insert into member0530(memberid,memberpwd,membername,membergender,memberaddr,ip,membermail,memberbirth)
values('test2','2222','심청이','M','임당수','221.222.333.444','sim@naver.com','20010101');
insert into member0530(memberid,memberpwd,membername,membergender,memberaddr,ip,membermail,memberbirth)
values('test3','3333','이강인','F','파리','331.222.333.444','gogo@naver.com','20010219');
insert into member0530(memberid,memberpwd,membername,membergender,memberaddr,ip,membermail,memberbirth)
values('test4','4444','홀란','M','맨시티','411.222.333.444','1ff2@naver.com','20000721');
insert into member0530(memberid,memberpwd,membername,membergender,memberaddr,ip,membermail,memberbirth)
values('test5','5555','레반','F','바셀','151.222.333.444','gosu@naver.com','19880821');
insert into member0530(memberid,memberpwd,membername,membergender,memberaddr,ip,membermail,memberbirth)
values('test6','6666','호날두','M','사우디','171.222.333.444','seeeeu@naver.com','19850205');
insert into member0530(memberid,memberpwd,membername,membergender,memberaddr,ip,membermail,memberbirth)
values('test7','7777','메시','F','뉴욕','111.111.111.555','annkara@naver.com','19870624');
insert into member0530(memberid,memberpwd,membername,membergender,memberaddr,ip,membermail,memberbirth)
values('test8','8888','뎀벨레','F','바셀','531.222.323.444','demm@naver.com','19970515');
insert into member0530(memberid,memberpwd,membername,membergender,memberaddr,ip,membermail,memberbirth)
values('test9','9999','네이마르','F','파리','115.222.333.444','neima@naver.com','19920205');
insert into member0530(memberid,memberpwd,membername,membergender,memberaddr,ip,membermail,memberbirth)
values('test10','0000','고지섭','M','서울','111.522.333.444','gogityon@naver.com','20230529');
insert into member0530(memberid,memberpwd,membername,membergender,memberaddr,ip,membermail,memberbirth)
values('test10','0000','김지섭','M','서울','111.522.333.444','kim@naver.com','20000529');

update member0530 set memberaddr='부산' where memberaddr='임당수';
update member0530 set memberaddr='전주' where memberaddr='사우디';
update member0530 set membermail='hhh@nate.com' where membermail='hhh@naver.com';
--2.2 테이블 조회하기(select)

--형식

SELECT 칼럼1, 칼럼2 from 테이블 where조건 group그룹절 order순서절;

-- member0530 회원테이블에서 모든 컬럼을 출력하시오
SELECT * from member0530;

--회원테이블에서 성별이 여성인 사람만 출력하시오
SELECT * from member0530 WHERE membergender='F';

--회원 테이블에서 성별이 여성이고 전주에 사는 사람의 이름 데이타를 출력하시오
SELECT membername from member0530 WHERE membergender='F' AND
memberaddr='전주';

-- 회원테이블에서 전주, 서울,파리,맨시티에 사는 사람의 이름을 출력하세요
-- 여러 조건을 사용할때는 in(값,값,값)으로 활용
SELECT membername from member0530 WHERE memberaddr in('전주','서울','파리','맨시티');

--성별이 남성인 사람들을 이름순으로 정렬하시오

SELECT * from member0530 WHERE membergender='M' ORDER by membername ASC;

--성별이 남성인 사람들의 이름을 역순으로(내림차순) 정렬하시오
SELECT * from member0530 WHERE membergender='M' ORDER by membername DESC;

-- 회원번호가 3번인 사람의 이름과 지역을 출력하세요
SELECT membername,memberaddrr from member0530 WHERE midx='3';

--범위조건
--회원번호가 2보다 큰 사람을 출력하세요
SELECT memberid from member0530 where midx >2;
--회원번호가 3보다 크고 5보다 작은 사람을 출력하세요
SELECT memberid from member0530 where midx >3 and midx<5;

--회원번호 3부터 5까지의 사람을 출력하세요
SELECT memberid from member0530 where midx BETWEEN 3 and 5;

-- 회원번호가 4보다 크고 9보다 작은 사람들의 이름과 지역을 회원번호 내림차순으로 정렬하시오
SELECT membername,memberaddr FROM member0530 WHERE midx between 5 and 8 ORDER by membername DESC;

-- 회원테이블에서 모든 데이터를 지역 오름차순, 이름 내림차순으로 정렬하시오
select * from member0530 order by memberaddr asc, membername desc;

-- like 구문 ( 포함하는 데이터를 찾기)
-- 형식 like '%검색어%' '검색어%' '%검색어' concat('%',검색어,'%')

-- 성이 홍씨인 사람들의 데이터를 출력하시오
select * from member0530 where membername like '홍%';
select * from member0530 where membername like concat('','홍','%');

-- 메일 주소중에 네이버를 사용하는 회원들의 명단을 출력하시오
select * from member0530 where membermail like '%naver.com';
-- 회원 아이디중에 t가 포함되어 있는 회원들의 명단을 출력하시오
select * from member0530 where memberid like '%t%';

-- 문자열 자르기 SUBSTR() 필요한 문자의 글자를 자르는 함수
-- 성이 홍씨인 데이터를 출력하시오
select * from member0530 where substr(membername,1,1) = '홍';

-- 이름중에 마지막 글자가 동으로 끝나는 사람을 출력하시오
select * from member0530 where substr(membername,-1) = '동';

-- 이름중에 첫자리를 제외한 나머지 글자가 강인인 모든 데이터를 출력하시오
select * from member0530 where substr(membername,2) = '강인';

-- 이름의 두번째 글자가 '날'인 사람의 나이를 출력하시오
select memeberbirth from member0530 where substr(membername,2,1) = '날';
select year(now())-substr(memberbirth,1,4) as age from member0530 where substr(membername,2,1) = '강';
select substr(now(),1,4)-substr(memberbirth,1,4) as age from member0530 where substr(membername,2,1) = '강';

-- 서울에 살고 성이 김씨인 사람들의 명단을 회원번호 내림차순으로 출력하시오
select membername from member0530 where substr(membername,1,1)='김' and memberaddr='서울'  order by midx desc;

-- F9 가독성 높일 수 있음
SELECT   membername
FROM     member0530
WHERE    membername LIKE '김%'
AND      memberaddr    ='서울'
ORDER BY midx DESC;

delete from member0530 where membername='레반';

-- 집계함수 count() sum() avg() max() min()

-- count 개수
-- 외원의 총 인원수를 출력하시오
select count(*) as cnt from member0530;

-- 회원번호의 총 합을 출력하시오
select sum(midx) as '합' from member0530;

-- 회원번호의 가장 큰수 및 가장 작은 수를 출력하시오
select max(midx) as '최대값', min(midx) as '최소값' from member0530;

-- 평균
select avg(midx) as '평균' from member0530;

-- group by 그룹절 사용
각 지역별 사람들의 인원수를 출력하시오
select memberaddr from member0530 group by memberaddr;


SELECT   memberaddr AS 지역,
         COUNT(*)   AS '인원수'
FROM     member0530
GROUP BY memberaddr;

-- 각 지역별 성별 인원수를 출력하시오
select memberaddr,membergender from member0530 group by memberaddr,membergender;



SELECT   memberaddr   AS '지역',
         membergender AS '성별',
         COUNT(*)     AS cnt
FROM     member0530
GROUP BY memberaddr,
         membergender
ORDER BY memberaddr;



-- 회원테이블에서 각 지역별 사람들의 나이의 평균을 구하시오



SELECT   memberaddr                        AS region,
         AVG(2023-SUBSTR(memberbirth,1,4)) AS age
FROM     member0530
GROUP BY memberaddr
ORDER BY memberaddr;


-- 이메일별로 사람들의 인원수를 출력하세요
-- instr() 문자열 중에 특정 문자의 자리번호를 반환하는 함수
select instr(membermail,'@') from member0530;

--

SELECT   SUBSTR(membermail,instr(membermail,'@')) as email, COUNT(*) as  cnt
FROM     member0530
GROUP BY SUBSTR(membermail,instr(membermail,'@'));

select * from member0530;

-- 남자이면서 naver를 사용하는 사용자 수 구하기
select substr(membermail,instr(membermail,'@')), count(*) from member0530 group by substr(membermail,instr(membermail,'@'));

select substr(membermail,instr(membermail,'@')), membergender, count(*) from member0530 group by substr(membermail,instr(membermail,'@')), membergender;

select count(*) as '남자 네이버 회원 수' from member0530 where substr(membermail,instr(membermail,'@'))='@naver.com' and membergender='M';

-- 서브쿼리
--1.쿼리안에 쿼리 (위치는 where조건 from절 select절 다양)
--회원번호가 회원번호 평균이하인 사람들의 이름을 출력하시오
SELECT membername
FROM   member0530
WHERE  midx <
       (SELECT AVG(midx)
       FROM    member0530
       );

--다중행 값
--회원번호 중에 회원번호가 홀수인 사람의 데이터를 서브쿼리를 사용하여 출력하세요
SELECT *
FROM   member0530
WHERE  midx IN
       (SELECT midx
       FROM    member0530
       WHERE   mod(midx,2) =1
       );

-- 스칼라 서브쿼리(SELECT절 안에 SELECT구문)
-- 회원정보 리스트에서 스칼라 서브쿼리 사용해서 회원성별을 출력하시오
SELECT midx,
       (SELECT membergender
       FROM    member0530 b
       WHERE   a.midx =b.midx
       )
FROM   member0530 a;

--인라인 뷰
--회원번호 및 아이디,이름만 있는 테이블에서 회원이름을 출력하시오
SELECT A.membername
FROM   (SELECT midx,
               memberid,
               membername
       FROM    member0530
       )
       A;

--회원 중 여성인 사람들의 지역별 인원 수를 서브쿼리를 활용하여 출력하시오
SELECT   memberaddr,
         COUNT(*)
FROM     member0530
WHERE    membergender=
         (SELECT DISTINCT membergender
         FROM             member0530
         WHERE            membergender='F'
         )
GROUP BY memberaddr;

--조건식 (case WHEN ~ then ~ else ~ end)
-- 회원 성별이 M이면 남성, F면 여성이라고 출력하시오
SELECT midx,
       CASE membergender
              WHEN 'M'
              THEN '남성'
              WHEN 'F'
              THEN '여성'
              ELSE '모름'
       END AS '성별'
FROM   member0530;

--DECODE() if문 함수
-- 회원 성별이 M이면 남성, F면 여성이라고 출력하시오
SELECT midx,
       IF(membergender='M','남성',IF(membergender='F','여성','모름')) AS'성별'
FROM   member0530;

--회원정보 컬럼중에 delyn 값이 Y이면 회원탈퇴 N이면 정상회원이라고 출력하세요
--case문과 IF문을 둘다 사용해서 각각 만들어보세요
SELECT midx,
       CASE delyn
              WHEN 'Y'
              THEN '탈퇴회원'
              WHEN 'N'
              THEN '정상회원'
              ELSE '비정상회원'
       END AS '회원상태'
FROM   member0530;

SELECT midx,
       IF(delyn='Y','탈퇴회원',IF(delyn='N','정상회원','비정상회원'))
FROM   member0530;

SELECT midx,
       CASE SUBSTR(memberbirth,5,2)
              WHEN '01'
              THEN '물병자리'
              WHEN '02'
              THEN '물고기자리'
              WHEN '03'
              THEN '양자리'
              WHEN '04'
              THEN '황소자리'
              WHEN '05'
              THEN '쌍둥이자리'
              WHEN '06'
              THEN '게자리'
              WHEN '07'
              THEN '사자자리'
              WHEN '08'
              THEN '처녀자리'
              WHEN '09'
              THEN '천칭자리'
              WHEN '10'
              THEN '전갈자리'
              WHEN '11'
              THEN '사수자리'
              WHEN '12'
              THEN '염소자리'
       END AS '별자리'
FROM   member0530;

--날짜 함수
--오늘 날짜를 출력하세요
SELECT now()
FROM   dual;

--오늘 날짜를 yyyy-mm-dd형식으로 출력하세요
SELECT date_format(now(),'%Y-%m-%d')
FROM   dual;

--문자열을 날짜타입으로 변환
SELECT str_to_date('2017,10,02','%Y,%m,%d');

--특정일에 달수를 더할때
SELECT date_add(now(),INTERVAL 1 MONTH);

--해당날짜의 초기 그달의 시작값을 뽑을때
SELECT LAST_DAY(now()+INTEGER 1 MONTH) DAY
FROM   dual;

-- nvl함수(null체크 함수)
-- IFNULL()
--

-- update 구문 (수정)
update 테이블 set 컬럼='값',컬럼='값' where 컬럼='값';

-- 회원번호 1, 3, 5인 사람들의 ip를 null 처리하시오
update member0530 set ip=null where midx in(1,3,6);
select * from member0530;

-- 회원의 아이피가 null이면 아이피없음, 있으면 아이피있음이라고 출력하시오
select ifnull(ip,'아이피있음') from member0530;
select if(ip is null, '아이피없음','아이피있음') from member0530;

-- 데이터 베이스 정규화

-- board0530 테이블 생성하기
create table board0530(
    bidx int not null primary key auto_increment,
    subject varchar(50) not null,
    contents varchar(2000) null,
    writer varchar(50) null,
    viewcnt int default 0,
    ip varchar(20) null,
    writeday datetime default now(),
    delyn char(1) default 'N',
    midx int not null,
    constraint midx_fk foreign key(midx) REFERENCES member0530(midx)
);

insert into board0530(subject, contents, writer, midx) values('첫글','1내용','1작성자',2);
insert into board0530(subject, contents, writer, midx) values('2글','2내용','2작성자',3);
insert into board0530(subject, contents, writer, midx) values('3글','3내용','3작성자',4);
insert into board0530(subject, contents, writer, midx) values('4글','4내용','4작성자',4);
insert into board0530(subject, contents, writer, midx) values('5글','5내용','5작성자',2);
insert into board0530(subject, contents, writer, midx) values('6글','6내용','6작성자',6);
insert into board0530(subject, contents, writer, midx) values('7글','7내용','7작성자',7);
insert into board0530(subject, contents, writer, midx) values('8글','8내용','8작성자',8);
insert into board0530(subject, contents, writer, midx) values('9글','9내용','9작성자',9);
insert into board0530(subject, contents, writer, midx) values('10글','10첫내용','10작성자',10);

select * from board0530;
select * from member0530;
-- join (두 테이블 이상에서 pk와 fk로 묶어서 하나의 데이터 테이블로 만드는 작업)
-- 형식
-- select * from tableA a, tableB b where a.pk가진컬럼 = b.fk가진컬럼;
-- select * from tableA a inner join tableB b on a.pk가진컬럼 = b.fk가진컬럼;

-- 회원중에 홀란 회원이 쓴 글을 모두 찾아서 출력하시오


SELECT a.membername,
       b.subject
FROM   member0530 a
       INNER JOIN board0530 b
       ON     a.midx = b.midx
WHERE  a.membername  ='홀란';

-- 6번째 게시글을 쓴 사람의 이름과 연락처를 출력하세요

SELECT a.membername,
       a.membermail,
       a.ip
FROM   member0530 a
       INNER JOIN board0530 b
       ON     a.midx = b.midx
WHERE  b.bidx        =6;

-- 1. 회원이 내용중에 '첫'이라는 단어가 포함되어 있는 데이터를 출력하고 그 사람의 아이디를 출력하시오

SELECT b.contents as '내용',
       a.memberid as '아이디'
FROM   member0530 a
       INNER JOIN board0530 b
       ON     a.midx = b.midx
WHERE  b.contents LIKE '%첫%';


-- 2. 게시글을 쓴 사람들의 남성비를 여성비율을 출력하시오

SELECT   a.membergender AS '성별',
         COUNT(membergender)/
         (SELECT COUNT(*)
         FROM    board0530
         ) AS '비율'
FROM     member0530 a
         INNER JOIN board0530 b
         ON       a.midx = b.midx
GROUP BY a.membergender;


SELECT
COUNT(IF(membergender = 'M',1,NULL))/10,
COUNT(IF(membergender = 'F',1,NULL))/10
FROM member0530 a
       INNER JOIN board0530 b
       ON     a.midx = b.midx;

-- 3. 게시글을 쓴 사람들의 지역별 인원수를 출력하시오

SELECT   a.memberaddr AS '지역',
         COUNT(memberaddr)     AS '인원수'
FROM     member0530 a
         INNER JOIN board0530 b
         ON       a.midx = b.midx
GROUP BY a.memberaddr;

-- 조건에 맞는 도서와 저자 리스트 출력하기
SELECT * FROM BOOK;
SELECT BOOK_ID, B.AUTHOR_NAME, SUBSTR(A.PUBLISHED_DATE,1,10) AS PUBLISHED_DATE
FROM BOOK A JOIN AUTHOR B ON A.AUTHOR_ID = B.AUTHOR_ID
WHERE A.CATEGORY = '경제'
ORDER BY A.PUBLISHED_DATE;

-- 있었는데요 없었습니다
SELECT  A.ANIMAL_ID, A.NAME
FROM ANIMAL_INS A
JOIN ANIMAL_OUTS B ON A.ANIMAL_ID = B.ANIMAL_ID
WHERE B.DATETIME < A.DATETIME
ORDER BY A.DATETIME;

-- 보호소에서 중성화한 동물
SELECT A.ANIMAL_ID, A.ANIMAL_TYPE, A.NAME
FROM ANIMAL_INS A
JOIN ANIMAL_OUTS B ON A.ANIMAL_ID = B.ANIMAL_ID
WHERE A.SEX_UPON_INTAKE LIKE '%Intact%' AND (B.SEX_UPON_OUTCOME LIKE '%Spayed%' OR B.SEX_UPON_OUTCOME LIKE '%Neutered%')
ORDER BY ANIMAL_ID;

select * from board0530;
select * from member0530;

-- left outer join (공통된 데이터중에 왼쪽에 있는 모든 데이터)
-- 회원들 중에 게시글을 쓴 개수를 출력하시오
select * from member0530 a left outer join board0530 b on a.midx = b.midx;

select a.membername,count(bidx) from member0530 a left outer join board0530 b on a.midx = b.midx group by a.membername;

-- 회원정보 테이블과 게시판 테이블에서 나이별(10대~50대 그외 )로 게시물을 쓴 사람들의 인원수를 출력하시오

select * from member0530 a left join board0530 b on a.midx = b.midx;

select year(now())-substr(a.memberbirth,1,4) from member0530 a left join board0530 b on a.midx = b.midx;

SELECT   SUBSTR(YEAR(now())-SUBSTR(a.memberbirth,1,4),1,1),
         COUNT(bidx)
FROM     member0530 a
         LEFT JOIN board0530 b
         ON       a.midx = b.midx
GROUP BY SUBSTR(YEAR(now())-SUBSTR(a.memberbirth,1,4),1,1);

SELECT
         CASE(SUBSTR(YEAR(now())-SUBSTR(a.memberbirth,1,4),1,1))
                  WHEN 2
                  THEN '20대'
                  WHEN 3
                  THEN '30대'
                  ELSE '그외'
         END ,
         COUNT(bidx)
FROM     member0530 a
         LEFT JOIN board0530 b
         ON       a.midx = b.midx
GROUP BY
         CASE(SUBSTR(YEAR(now())-SUBSTR(a.memberbirth,1,4),1,1))
                  WHEN 2
                  THEN '20대'
                  WHEN 3
                  THEN '30대'
                  ELSE '그외'
         END;

-- 게시글을 쓴 사람들중에 성별 비율을 나타내서 출력하시오
select * from member0530 a left join board0530 b on a.midx = b.midx;
SELECT
         CASE a.membergender
                  WHEN 'F'
                  THEN '여성'
                  WHEN 'M'
                  THEN '남성'
         END AS '성별',
         COUNT(a.membergender)/
         (SELECT COUNT(*)
         FROM board0530
         )
         AS '비율'
FROM     member0530 a
         inner JOIN board0530 b
         ON       a.midx = b.midx
GROUP BY
         CASE a.membergender
                  WHEN 'F'
                  THEN '여성'
                  WHEN 'M'
                  THEN '남성'
         END;

SELECT
COUNT(IF(membergender = 'M',1,NULL))/10,
COUNT(IF(membergender = 'F',1,NULL))/10
FROM member0530 a
       left JOIN board0530 b
       ON     a.midx = b.midx;

select
sum(if(a.membergender='M',1,0))/count(a.midx),
sum(if(a.membergender='F',1,0))/count(a.midx)
from member0530 a inner join board0530 b on a.midx=b.midx;

-- 임시테이블 사용 with
with memberCnt as(
select count(midx) as cnt from member0530
)
select
sum(if(a.membergender='M',1,0))/(select cnt from memberCnt),
sum(if(a.membergender='F',1,0))/(select cnt from memberCnt)
from member0530 a inner join board0530 b on a.midx=b.midx;

-- 가상테이블 view / union all

-- update delete

-- 계층형 게시판 테이블 형식