/*
    날짜 : 2025/07/17
    이름 : 이수연
    내용 : 5장 데이터베이스 객체
*/

-- 워크북 p13
-- 실습하기 3-1

SELECT * from dictionary;

select table_name from user_tables;
select owner, table_name from all_tables;
select * from dba_tables;
select * from dba_users;
-- 'dba'명령어는 최고 사용자만 가능

select instance_name, status, database_status, host_name from v$instance;

-- 실습하기 3-2
select * from user_indexes;
SELECT * FROM USER_IND_COLUMNS;


-- 실습하기 3-3
CREATE INDEX IDX_USER1_ID ON USER1(USER_ID);
SELECT * FROM USER_IND_COLUMNS;

-- 실습하기 3-4



-- 실습하기3-6
CREATE VIEW VW_USER1 AS (SELECT NAME, HP, AGE FROM USER1);
CREATE VIEW VW_USER2_AGE_UNDER30 AS (SELECT * FROM USER2 WHERE AGE < 30);
select * from user_views;

-- 실습하기 3-7 뷰 조회
select * from vw_user1;
select * from vw_user2_age_under30;

-- 실습하기 3-8 뷰 삭제
drop view vw_user1;
drop view vw_user2_age_under30;


-- 실습하기 3-9 시퀀스 적용 테이블 생성
CREATE TABLE USER6 (
    SEQ NUMBER PRIMARY KEY,
    NAME VARCHAR2(20),
    GENDER CHAR(1),
    AGE NUMBER,
    ADDR VARCHAR2(255)
    );

-- 실습하기 3-10 시퀀스 생성
CREATE SEQUENCE SEQ_USER6 INCREMENT BY 1 START WITH 1;


-- 실습하기 3-11 시퀀스값 입력
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '김유신', 'M', 25, '김해시');
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '김춘추', 'M', 23, '경주시');
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '신사임당', 'F', 27, '강릉시');






















