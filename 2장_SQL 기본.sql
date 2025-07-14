/*
    날짜 : 2025/07/14
    이름 : 이수연
    내용 : 2장 SQL 기본
*/

-- 실습 1-2 NUMBER 자료형 이해
CREATE TABLE TYPE_TEST_NUMBER (
    num1 NUMBER,
    num2 NUMBER(2),
    num3 NUMBER(3, 1),
    num4 NUMBER(4, 2),
    num5 NUMBER(5, 6),
    num6 NUMBER(6, -1)
);
    
//테이블 데이터 삭제
DELETE FROM type_test_number;

//num1 Number
insert into type_test_number (num1) values (1);         //1
insert into type_test_number (num1) values (123);       //123
insert into type_test_number (num1) values (123.74);    //123.74
insert into type_test_number (num1) values (123.12345); //123.12345


//num2 NUMBER(2)
insert into type_test_number (num2) values (12);        //12
insert into type_test_number (num2) values (123);       //오류
insert into type_test_number (num2) values (123.74);    //오류
insert into TYPE_TEST_NUMBER (num2) values (12.34567);  //12
insert into TYPE_TEST_NUMBER (num2) values (12.56789);  //13 _소수첫째자리에서 반올림.
insert into TYPE_TEST_NUMBER (num2) values (123.56789); //오류

//num3 NUMBER(3,1)
insert into TYPE_TEST_NUMBER (num3) values (12);        //12
insert into TYPE_TEST_NUMBER (num3) values (123);       //오류
insert into TYPE_TEST_NUMBER (num3) values (12.1);      //12.1
insert into TYPE_TEST_NUMBER (num3) values (12.1234);   //12.1
insert into TYPE_TEST_NUMBER (num3) values (12.56789);  //12.6 _소수둘째자리에서 반올림. 첫째자기까지 나타내짐.
insert into TYPE_TEST_NUMBER (num3) values (123.56789); //오류

------------------------------------------------------------
--실습하기 1-3 문자형 자료형 이해
CREATE TABLE TYPE_TEST_CHAR (
    char1 CHAR(1),
    char2 CHAR(2),
    char3 CHAR(3),
    vchar1 VARCHAR2(1),
    vchar2 VARCHAR2(2),
    vchar3 VARCHAR2(3),
    nvchar1 VARCHAR2(1),
    nvchar2 VARCHAR2(2),
    nvchar3 VARCHAR2(3)    
);

//CHAR
INSERT INTO type_test_char (char1) VALUES ('A');    //A
insert into type_test_char (char1) values ('가');   //오류 : 값이 너무 큼 (실제: 3, 최대값: 1)

//VARCHAR2
insert into TYPE_TEST_CHAR (vchar1) values ('A');   //A
insert into type_test_char (vchar2) values ('AB');  //AB
insert into type_test_char (vchar3) values ('가');   //가

//NVARCHAR2
INSERT INTO TYPE_TEST_CHAR (nvchar1) values ('A');  //A
insert into type_test_char (nvchar2) values ('AB'); //AB
insert into type_test_char (nvchar3) values ('가나다');    //오류(실제: 9, 최대값: 3) 

------------------------------------------------------
--실습하기 1-4. 테이블 생성
create table user1 (
    user_id     varchar2(20),
    name        varchar2(20),
    hp          char(13),
    age         number
);

//테이블 삭제
drop table user1;

--실습하기 1-5 데이터 추가
insert into user1 values ('a101', '김유신', '010-1234-1111', 25);
insert into user1 values ('a102', '김춘추', '010-1234-2222', 23);
insert into user1 values ('a103', '장보고', '010-1234-3333', 32);
insert into user1 (user_id, name, age) values ('a104', '강감찬', 45); //hp가 null
insert into user1 (user_id, name, hp) values ('a105', '이순신', '010-1234-5555'); //age 가 null 

--실습하기 1-6. 데이터 조회하기
select * from user1; //질의 결과 창에 테이블의 데이터가 출력됨.
select * from user1 where user_id = 'a101'; //a101	김유신	010-1234-1111	25
select * from user1 where name = '김춘추';
select * from user1 where age > 30;
select user_id, name, age from user1; // 찾고자 하는 열 form 테이블명->찾고자 하는 열 입력 순으로 정보 정리해줌.


--실습하기 1-7. 데이터 수정
update user1 set hp = '010-1234-4444' where user_id = 'a104'; //null->010-1234-4444
update user1 set age = 51 where user_id = 'a105'; //null->51
update user1 set hp = '010-1234-1001', 
                 age = 27 where user_id = 'a101';

--실습하기 1-8. 데이터 삭제
delete from user1 where user_id = 'a101';
delete from user1 where user_id = 'a102' and age =25;
delete from user1 where age >= 30;

---------------------------------------------------------
--실습하기 2-1. 기본키(Primary Key)
create table user2 (
    user_id     varchar2(20) primary key,
    name        varchar2(20),
    hp          char(13),
    age         number(2)
    );
    
--실습하기 2-2. 고유키(Unique Key)
create table user3 (
    user_id     varchar2(20) primary key,
    name        varchar2(20),
    hp          char(13) unique,
    age         number(3)
    );
    
--실습하기 2-3. 외래키(Foreign key)
create table parent (
    pid     varchar2(20) primary key,
    name    varchar2(20),
    hp      char(13) unique
    );

create table child (
    cid     varchar2(20)    primary key,
    name    varchar2(20),
    hp      char(13)        unique,
    parent  varchar(20),
    foreign key (parent) references parent (pid)
    );
    

insert into parent values ('p101', '김서현', '010-1234-1001');
insert into parent values ('p102', '이성계', '010-1234-1002');
insert into parent values ('p103', '신사임당', '010-1234-1003');

insert into child values ('c101', '김유신', '010-1234-2001', 'p101');
insert into child values ('c102', '이방우', '010-1234-2002', 'p102');
insert into child values ('c103', '이방원', '010-1234-2003', 'p102');
insert into child values ('c104', '이이', '010-1234-2004', 'p103');


---------------------------------------------------------------
--실습하기 2-4. DEAULT와 NOT NULL
CREATE TABLE USER4 (
    NAME    varchar2(20) not null,
    gender  char(1) not null,
    age     int default 1,
    addr    varchar2(255)
    );

insert into user4 values ('김유신', 'M', 23, '김해시');
insert into user4 values ('김춘추', 'M', 21, '경주시');
insert into user4 (name, gender, addr) values ('신사임당', 'F', '강릉시');
insert into user4 (name, gender) values ('이순신', 'M');
insert into user4 (name, age) values ('정약용', 33); //오류. gender 안에 null 삽입 안됨.

--실습하기 2-4. CHECK 제약조건은 컬럼에 저장할 수 있는 값의 범위 또는 범주를 정의
create table user5(
    name    varchar2(20) not null,
    gender  char(1) not null check(gender in('M', 'F')),
    age     int default 1 check(age > 0 and age <100),
    addr    varchar2(255)
    );
SELECT *FROM USER5 where name = '이순신';
insert into user5 values ('김유신', 'M', 23, '김해시');
insert into user5 values ('김춘추', 'M', 21, '경주시');
insert into user5 (name, gender, addr) values ('신사임당', 'F', '강릉시');
insert into user5 (name, gender) values ('이순신', 'M');
insert into user5 (name, age) values ('정약용', 33); //gender에 null 삽입 불가능.'not null'때문.

commit;