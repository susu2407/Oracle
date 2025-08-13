-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-13 10:09:21 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE account (
    acc_id            CHAR(14 BYTE) NOT NULL,
    cust_jumin        CHAR(14 BYTE),
    acc_type          VARCHAR2(20 BYTE) NOT NULL,
    acc_balance       NUMBER NOT NULL,
    acc_card          CHAR(1 BYTE) NOT NULL,
    acc_register_date DATE
);

ALTER TABLE account ADD CONSTRAINT account_pk PRIMARY KEY ( acc_id );

CREATE TABLE card (
    card_no            CHAR(14 BYTE) NOT NULL,
    cust_jumin         CHAR(14 BYTE),
    acc_id             CHAR(14 BYTE),
    card_register_date DATE,
    card_limit         NUMBER,
    card_approve_date  DATE,
    card_type          VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE card ADD CONSTRAINT card_pk PRIMARY KEY ( card_no );

CREATE TABLE customer (
    cust_jumin CHAR(14 BYTE) NOT NULL,
    name       VARCHAR2(20 BYTE) NOT NULL,
    address    VARCHAR2(100) NOT NULL,
    birth      CHAR(10 BYTE) NOT NULL,
    email      VARCHAR2(100 BYTE),
    hp         VARCHAR2(20 BYTE) NOT NULL,
    job        VARCHAR2(20 BYTE)
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_jumin );

CREATE TABLE transaction (
    trans_id      NUMBER NOT NULL,
    trans_acc_id  CHAR(14 BYTE) NOT NULL,
    trans_type    VARCHAR2(20 BYTE),
    trans_message VARCHAR2(20 BYTE),
    trans_money   NUMBER,
    trans_date    DATE NOT NULL
);

ALTER TABLE transaction ADD CONSTRAINT transaction_pk PRIMARY KEY ( trans_id );

ALTER TABLE account
    ADD CONSTRAINT account_customer_fk FOREIGN KEY ( cust_jumin )
        REFERENCES customer ( cust_jumin );

ALTER TABLE card
    ADD CONSTRAINT card_account_fk FOREIGN KEY ( acc_id )
        REFERENCES account ( acc_id );

ALTER TABLE card
    ADD CONSTRAINT card_customer_fk FOREIGN KEY ( cust_jumin )
        REFERENCES customer ( cust_jumin );

ALTER TABLE transaction
    ADD CONSTRAINT transaction_account_fk FOREIGN KEY ( trans_acc_id )
        REFERENCES account ( acc_id );

CREATE SEQUENCE transaction_trans_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER transaction_trans_id_trg BEFORE
    INSERT ON transaction
    FOR EACH ROW
    WHEN ( new.trans_id IS NULL )
BEGIN
    :new.trans_id := transaction_trans_id_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0




  -- 데이터 입력
insert into customer VALUES ('760121-1234567', '정우성', '서울', '1976-01-21', null, '010-1101-7601', '배우');
insert into customer VALUES ('750611-1234567', '이정재', '서울', '1975-06-11', null,'010-1102-7506', '배우');
insert into customer VALUES ('890530-1234567', '전지현', '대전', '1989-05-30', 'jjh@naver.com', '010-1103-8905', '자영업');
insert into customer VALUES ('790413-1234567', '이나영', '대전', '1979-04-14', 'lee@naver.com', '010-2101-7904', '회사원');
insert into customer VALUES ('660912-1234567', '원빈', '대전', '1966-09-12', 'one@daum.net', '010-2104-6609', '배우');

insert into account VALUES ('1011-1001-1001', '760121-1234567', '자유입출금', 4160000,'Y','2020-01-21 13:00:02');
insert into account VALUES ('1011-1001-1002', '890530-1234567', '자유입출금', 376000,'Y','2020-06-11 13:00:02');
insert into account VALUES ('1011-1001-1003', '790413-1234567', '자유입출금', 1200000, 'Y', '2020-05-30 13:00:02');
insert into account VALUES ('1011-1001-1004', '660912-1234567', '자유입출금', 1000000,'N','2020-04-13 13:00:02');
insert into account VALUES ('1011-1001-1005', '750611-1234567', '자유입출금', 820000,'Y','2020-09-12 13:00:02');

insert into card values ('2111-1001-1001', '760121-1234567', '1011-1001-1001', '2020-01-21', 1000000,'2020-02-10', 'check');
insert into card values ('2041-1001-1002', '890530-1234567', '1011-1001-1002', '2020-06-11',3000000, '2020-06-15', 'check');
insert into card values ('2011-1001-1003', '790413-1234567', '1011-1001-1003', '2020-05-30',5000000, '2020-06-25', 'check');
insert into card values ('2611-1001-1005', '750611-1234567', '1011-1001-1005', '2020-09-12',1500000, '2020-10-10', 'check');

insert into transaction VALUES (1, '1011-1001-1001', '입금', '2월 정기급여', 3500000, '2020-02-10 12:36:12');
insert into transaction VALUES (2, '1011-1001-1003', '출금', 'ATM 출금', 300000, '2020-02-10 12:37:12'); 
insert into transaction VALUES (3, '1011-1001-1002', '입금', '2월 급여', 2800000, '2020-02-10 12:38:12');
insert into transaction VALUES (4, '1011-1001-1001', '출금', '2월 공과금', 116200, '2020-02-10 12:39:12');
insert into transaction VALUES (5, '1011-1001-1005', '출금', 'ATM 출금', 50000, '2020-02-10 12:40:12');

--1.
select * from customer;

--2.
select * from card;

--3.
select * from account;

--4.
select * 
from transaction
order by trans_date
fetch first 3 row ONLY;

--5.
select
    b.name as 고객이름,
    a.card_type as 카드종류
from card a
join customer b on a.cust_jumin = b.cust_jumin
where card_limit >= 2000000;

-- 6.
select
    a.acc_id as 예금계좌,
    count(trans_acc_id) as "거래 건수"
from account a
join transaction b on a.acc_id = b.trans_acc_id
group by a.acc_id;

--7.
SELECT * 
from transaction 
where trans_money >= 1000000
order by trans_date;

--8.
SELECT
    a.acc_id as 계좌ID,
    b.card_no as 카드ID,
    b.card_type as 카드종류
from account a 
join card b on a.acc_id = b.acc_id;

--9.
SELECT 
    sum(trans_money)as "입금 거래의 총합" 
from transaction 
where trans_type = '입금';

--10.
SELECT
    a.name as 고객명,
    a.cust_jumin as 주민번호,
    a.hp as 전화번호,
    a.address as 주소
from customer a 
join account b on a.cust_jumin = b.cust_jumin
where b.acc_balance >= 4000000;
