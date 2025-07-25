-- 실습 1
ALTER SESSION Set "_ORACLE_SCRIPT"=true;
CREATE USER library IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO library;
exit

-- 실습 2
CREATE TABLE Member (
    MEMBER_ID   NUMBER(4) PRIMARY KEY,
    NAME        VARCHAR2(40) NOT NULL,
    ADDRESS     VARCHAR2(100) DEFAULT NULL,
    HP          CHAR(13) DEFAULT NULL UNIQUE,
    JOIN_DATE   DATE NOT NULL
);

create table Book (
    BOOK_ID     NUMBER(5) PRIMARY KEY,
    TITLE       VARCHAR2(50) NOT NULL,
    AUTHOR      VARCHAR2(40) NOT NULL,
    PUBLISHER    VARCHAR2(40) NOT NULL,
    AVAILABLE   CHAR(1) DEFAULT NULL,
    REG_DATE    DATE NOT NULL
);
DROP TABLE BOOK;

create table Loan (
    LOAN_ID     NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    MEMBER_ID   NUMBER(4) NOT NULL,
    BOOK_ID     NUMBER(5) NOT NULL,
    LOAN_DATE   DATE DEFAULT NULL,
    RETURN_DATE DATE DEFAULT NULL,
    ACTUAL_DATE DATE DEFAULT NULL,
    FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOK (BOOK_ID)
);
DROP TABLE LOAN;

-- 실습 3
INSERT INTO MEMBER VALUES (1001, '김유신', '서울특별시 강남구 역삼동', '010-1234-1001', '2024-01-10 09:15:00');
INSERT INTO MEMBER VALUES (1002, '김춘추', '대전광역시 유성구 장대동', '010-1234-1002', '2024-02-14 14:30:45');
INSERT INTO MEMBER VALUES (1003, '장보고', '대구광역시 수성구 반월동', '010-1234-1003', '2024-03-01 11:05:20');
INSERT INTO MEMBER VALUES (1004, '강감찬', '부산광역시 금정구 부곡동', '010-1234-1004', '2024-03-22 16:40:00');
INSERT INTO MEMBER VALUES (1005, '이순신', '광주광역시 광산구 우산동', '010-1234-1005', '2024-04-10 08:50:10');

INSERT INTO BOOK VALUES (10001, '태백산맥', '조정래', '문학수첩', 'Y', '2014-01-10 09:15:00');
INSERT INTO BOOK VALUES (10002, '데미안', '헤르만 헤세', '민음사', 'N', '2014-02-14 14:30:45');
INSERT INTO BOOK VALUES (10003, '토지', '박경리', '문학사상사', 'Y', '2014-03-01 11:05:20');
INSERT INTO BOOK VALUES (10004, '명품 자바 프로그래밍', '제임스 고슬링', '한빛출판사', 'Y', '2014-03-22 16:40:00');
INSERT INTO BOOK VALUES (10005, '로미오와 줄리엣', '세익스피어', '열린책들', 'N', '2014-04-10 08:50:10');
INSERT INTO BOOK VALUES (10006, '삼국지', '나관중', '민음사', 'Y', '2014-04-05 09:12:02');
INSERT INTO BOOK VALUES (10007, '칼의 노래', '김훈', '문학동네', 'Y', '2014-06-10 12:53:17');
INSERT INTO BOOK VALUES (10008, '데이터베이스', '래리 엘리슨', '한빛출판사', 'N', '2014-05-23 10:13:09');
INSERT INTO BOOK VALUES (10009, 'Linux 운영체제', '리누스 토발즈', '한빛출판사', 'Y', '2014-03-11 11:23:43');
INSERT INTO BOOK VALUES (10010, '어린 왕자', '생텍쥐베리', '열린책들', 'Y', '2014-01-03 15:27:21');

INSERT INTO LOAN VALUES (1, 1001, 10002, '2024-03-01 10:02:31', '2024-03-15 10:02:31', '2024-03-13 09:44:19');
INSERT INTO LOAN VALUES (2, 1002, 10004, '2024-03-05 15:10:02', '2024-03-19 15:10:02', '2024-03-12 17:12:30');
INSERT INTO LOAN VALUES (3, 1003, 10008, '2024-04-01 11:01:12', '2024-04-15 11:01:12', NULL);
INSERT INTO LOAN VALUES (4, 1002, 10001, '2024-04-10 14:32:01', '2024-04-24 14:32:01', '2024-04-22 13:56:32');
INSERT INTO LOAN VALUES (5, 1005, 10004, '2024-04-15 16:24:21', '2024-04-29 16:24:21', NULL);
INSERT INTO LOAN VALUES (6, 1004, 10006, '2024-05-01 09:12:09', '2024-05-15 09:12:09', '2024-05-14 09:21:27');
INSERT INTO LOAN VALUES (7, 1001, 10007, '2024-05-03 13:51:07', '2024-05-17 13:51:07', '2024-05-16 14:05:10');
INSERT INTO LOAN VALUES (8, 1003, 10009, '2024-06-01 11:15:43', '2024-06-15 11:15:43', NULL);
INSERT INTO LOAN VALUES (9, 1004, 10004, '2024-06-02 12:30:52', '2024-06-16 12:30:52', NULL);
INSERT INTO LOAN VALUES (10, 1002, 10008, '2024-06-05 10:06:17', '2024-06-19 10:06:17', NULL);

-- 실습 4
SELECT 
    MEMBER_ID,
    NAME,
    HP,
    ADDRESS
FROM MEMBER;

-- 실습 5
SELECT
    TITLE,
    AUTHOR
FROM BOOK;

-- 실습 6
SELECT
    NAME,
    ADDRESS
FROM MEMBER
WHERE ADDRESS LIKE '부산%';

-- 실습 7
SELECT
    TITLE
FROM BOOK
WHERE AVAILABLE = 'Y';

-- 실습 8
SELECT * FROM BOOK WHERE BOOK_ID = '10005';

-- 실습 9
SELECT
    MEMBER_ID,
    NAME,
    HP
FROM MEMBER WHERE MEMBER_ID = '1002';

-- 실습 10
SELECT * FROM BOOK;
UPDATE BOOK SET PULISHER = '민음사' WHERE PULISHER = '헤세 민음사';
UPDATE BOOK SET AUTHOR = '헤르만 헤세' WHERE AUTHOR = '헤르만';

SELECT TITLE FROM BOOK WHERE REG_DATE LIKE '%-03-%';

-- 실습 11
SELECT 
    TITLE,
    AUTHOR,
    PUBLISHER
FROM BOOK 
WHERE PUBLISHER = '민음사';

-- 실습 12
SELECT
loan_id, member_id, book_id
FROM LOAN;

-- 실습 13
SELECT * FROM MEMBER WHERE NAME LIKE '김%';

-- 실습 14
SELECT * FROM MEMBER WHERE ADDRESS LIKE '부산%' OR ADDRESS LIKE'대구%';
-- 실습 14의 또다른 정답!!
SELECT * FROM MEMBER WHERE SUBSTR(ADDRESS, 1, 2) IN ('대구', '부산');

-- 실습 15
SELECT
    BOOK_ID,
    TITLE
FROM BOOK b
WHERE BOOK_ID = '10003' OR BOOK_ID = '10006';
-- 실습 15 또 다른 정답
SELECT BOOK_ID, TITLE FROM BOOK WHERE BOOK_ID IN (10003, 10006);

-- 실습 16
SELECT TITLE, AUTHOR FROM BOOK WHERE AUTHOR = '조정래' OR AUTHOR = '박경리';

-- 실습 17
SELECT NAME, JOIN_DATE FROM MEMBER WHERE JOIN_DATE < '2024-04-02';

-- 실습 18
SELECT LOAN_ID, MEMBER_ID, BOOK_ID, LOAN_DATE FROM LOAN WHERE LOAN_DATE > '2024-05-01';

-- 실습 19
SELECT TITLE, AUTHOR, PUBLISHER FROM BOOK WHERE AVAILABLE = 'N';

-- 실습 20
SELECT * FROM BOOK WHERE TITL   E LIKE '%자바%' ;

-- 실습 21
SELECT
    NAME,
    HP
FROM MEMBER WHERE HP !='010-1234-1003';

-- 실습 22
SELECT
    LOAN_ID,
    MEMBER_ID,
    BOOK_ID
FROM LOAN WHERE RETURN_DATE < '2024-03-20';

-- 실습 23
SELECT * FROM MEMBER ORDER BY NAME ASC;

-- 실습 24
UPDATE BOOK SET REG_DATE='2014-05-03 15:27:21' WHERE REG_DATE='2014-01-03 15:27:21';
SELECT * FROM BOOK ORDER BY REG_DATE DESC;

-- 실습 25
SELECT * FROM BOOK ORDER BY TITLE ASC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

-- 실습 26
SELECT * FROM MEMBER ORDER BY JOIN_DATE DESC OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY ;

-- 실습 27
SELECT
    LOAN_ID,
    LOAN_DATE
FROM LOAN ORDER BY LOAN_DATE ASC OFFSET 0 ROWS FETCH NEXT 2 ROWS ONLY;

-- 실습 28
SELECT COUNT(*) AS "COUNT(*)" FROM MEMBER;

-- 실습 29
SELECT COUNT(*) AS "COUNT(*)" FROM BOOK;

-- 실습 30
SELECT COUNT(*) AS "COUNT(*)" FROM BOOK WHERE AVAILABLE = 'Y';

-- 실습 31
SELECT
    PUBLISHER,
    COUNT(*) AS 출판_도서수
FROM BOOK
GROUP BY PUBLISHER;

-- 실습 32
SELECT COUNT(*) FROM LOAN WHERE LOAN_DATE LIKE '2024%';

-- 실습 33
SELECT MEMBER_ID, COUNT(*) AS 대출_도서수 FROM LOAN GROUP BY MEMBER_ID;

-- 실습 34
SELECT BOOK_ID, COUNT(*) AS 대출횟수 FROM LOAN GROUP BY BOOK_ID;

-- 실습 35
SELECT 
    MEMBER_ID, 
    COUNT(*) AS 회원_대출건수 
FROM LOAN 
GROUP BY MEMBER_ID
HAVING COUNT(*) >= 2;

-- 실습 36
SELECT
    BOOK_ID,
    COUNT(*) AS 도서_대출건수
FROM LOAN 
GROUP BY BOOK_ID HAVING COUNT(*) >= 2;

-- 실습 37
SELECT
    l.MEMBER_ID,
    m.NAME,
    l.BOOK_ID,
    b.TITLE,
    l.LOAN_DATE
FROM LOAN l
JOIN BOOK b ON l.BOOK_ID = b.BOOK_ID
JOIN MEMBER m ON l.MEMBER_ID = m.MEMBER_ID;

-- 실습 38
SELECT NAME, COUNT(*) AS "대출건수" FROM LOAN l
JOIN MEMBER m ON l.MEMBER_ID = m.MEMBER_ID
GROUP BY NAME
HAVING COUNT(*) >= 3;

-- 실습 39
SELECT
    LOAN_ID,
    NAME,
    TITLE,
    LOAN_DATE
FROM LOAN l
JOIN BOOK b ON l.BOOK_ID = b.BOOK_ID
JOIN MEMBER m ON l.MEMBER_ID = m.MEMBER_ID
WHERE LOAN_DATE < '2024-05-01';

-- 실습 40
SELECT
    TITLE
FROM LOAN l
JOIN BOOK b ON l.BOOK_ID = b.BOOK_ID 
JOIN MEMBER m ON l.MEMBER_ID = m.MEMBER_ID
WHERE NAME = '김유신';

-- 실습 41
SELECT
    NAME
FROM LOAN l
JOIN BOOK b ON l.BOOK_ID = b.BOOK_ID 
JOIN MEMBER m ON l.MEMBER_ID = m.MEMBER_ID
WHERE b.TITLE = '태백산맥';

-- 실습 42
SELECT
    NAME,
    TITLE
FROM LOAN l
JOIN BOOK b ON l.BOOK_ID = b.BOOK_ID 
JOIN MEMBER m ON l.MEMBER_ID = m.MEMBER_ID
WHERE NAME = '김춘추'
ORDER BY TITLE ASC;

-- 실습 43
SELECT
    TITLE,
    NAME
FROM LOAN l
JOIN BOOK b ON l.BOOK_ID = b.BOOK_ID 
JOIN MEMBER m ON l.MEMBER_ID = m.MEMBER_ID
WHERE LOAN_DATE LIKE '2024-04-%';

-- 실습 44
SELECT
    NAME,
    TITLE
FROM LOAN l
JOIN BOOK b ON l.BOOK_ID = b.BOOK_ID 
JOIN MEMBER m ON l.MEMBER_ID = m.MEMBER_ID
WHERE actual_date IS NULL;

-- 실습 45
SELECT
    NAME,
    TITLE
FROM LOAN l
JOIN BOOK b ON l.BOOK_ID = b.BOOK_ID 
JOIN MEMBER m ON l.MEMBER_ID = m.MEMBER_ID
WHERE AUTHOR = '조정래';

-- 실습 46 --  X --설명_주요 키워드 : 'LEFT', 'IS NULL'
SELECT
B.BOOK_ID, TITLE
FROM BOOK b
LEFT JOIN LOAN L ON l.BOOK_ID = b.BOOK_ID 
WHERE LOAN_ID IS NULL;

-- 실습 47
SELECT
    NAME,
    COUNT(*) AS 총_건수
FROM LOAN l
JOIN MEMBER m ON l.MEMBER_ID = m.MEMBER_ID
GROUP BY NAME
ORDER BY COUNT(*) DESC, NAME DESC;

-- 실습 48 -- ?? 서브쿼리가 뭐지..?
SELECT
    NAME
FROM MEMBER
WHERE MEMBER_ID = (
    SELECT 
        MEMBER_ID
    FROM LOAN
    GROUP BY MEMBER_ID
    ORDER BY COUNT(*) DESC
    FETCH FIRST 1 ROWS ONLY
);

-- 실습 49 -- ?? 서브쿼리가 뭐지..?
SELECT
    TITLE
FROM BOOK
WHERE PUBLISHER = (
    SELECT PUBLISHER FROM BOOK WHERE TITLE = '데이터베이스'
) AND TITLE <> '데이터베이스';



-- 실습 50 -- ?? 서브쿼리가 뭐지..?
SELECT NAME FROM MEMBER WHERE MEMBER_ID IN (
    SELECT MEMBER_ID FROM LOAN WHERE BOOK_ID = 10004
);

