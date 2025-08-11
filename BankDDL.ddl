-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 11:52:34 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE bank_account (
    a_no        CHAR(11) NOT NULL,
    a_item_dist CHAR(2) NOT NULL,
    a_item_name VARCHAR2(20) NOT NULL,
    a_c_no      VARCHAR2(14) NOT NULL,
    a_balance   NUMBER NOT NULL,
    a_open_date DATE NOT NULL
);

ALTER TABLE bank_account ADD CONSTRAINT bank_account_pk PRIMARY KEY ( a_no );

CREATE TABLE bank_customer (
    c_no    VARCHAR2(14 BYTE) NOT NULL,
    c_name  VARCHAR2(20 BYTE) NOT NULL,
    c_dist  NUMBER NOT NULL,
    c_phone CHAR(13) NOT NULL,
    c_addr  VARCHAR2(50)
);

ALTER TABLE bank_customer ADD CONSTRAINT bank_customer_pk PRIMARY KEY ( c_no );

CREATE TABLE bank_transaction (
    t_no       NUMBER NOT NULL,
    t_a_no     CHAR(11) NOT NULL,
    t_dist     NUMBER NOT NULL,
    t_amount   NUMBER NOT NULL,
    t_datetime DATE NOT NULL
);

ALTER TABLE bank_transaction ADD CONSTRAINT bank_transaction_pk PRIMARY KEY ( t_no );

ALTER TABLE bank_account
    ADD CONSTRAINT bank_account_bank_customer_fk FOREIGN KEY ( a_c_no )
        REFERENCES bank_customer ( c_no );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE bank_transaction
    ADD CONSTRAINT bank_transaction_bank_account_fk FOREIGN KEY ( t_a_no )
        REFERENCES bank_account ( a_no );

CREATE SEQUENCE bank_transaction_t_no_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER bank_transaction_t_no_trg BEFORE
    INSERT ON bank_transaction
    FOR EACH ROW
    WHEN ( new.t_no IS NULL )
BEGIN
    :new.t_no := bank_transaction_t_no_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
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
-- ERRORS                                   1
-- WARNINGS                                 0

INSERT INTO bank_customer VALUES ('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시');
INSERT INTO bank_customer VALUES ('730423-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시');
INSERT INTO bank_customer VALUES ('750423-1000003', '장보고', 1, '010-1234-1003', '전남 완도군');
INSERT INTO bank_customer VALUES ('102-12-51094', '(주)정보산업', 2, '051-500-1004', '부산시 부산진구');
INSERT INTO bank_customer VALUES ('930423-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');

INSERT INTO bank_account VALUES ('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 1550000, '2011-04-11');
INSERT INTO bank_account VALUES ('101-11-1002', 'S1', '자유저축예금', '930423-1000005', 260000, '2011-05-12');
INSERT INTO bank_account VALUES ('101-11-1003', 'S1', '자유저축예금', '750423-1000003', 75000, '2011-06-13');
INSERT INTO bank_account VALUES ('101-12-1001', 'S2', '기업전용예금', '102-12-51094', 15000000, '2011-07-14');
INSERT INTO bank_account VALUES ('101-13-1001', 'S3', '정기저축예금', '730423-1000002', 1200000, '2011-08-15');

-- t_dist - 1:입금, 2:출금, 3:잔액조회
INSERT INTO bank_transaction VALUES (1, '101-11-1001', 1, 50000, '2023-01-01 13:15:10');
INSERT INTO bank_transaction VALUES (2, '101-12-1001', 2, 1000000, '2023-01-02 13:15:12');
INSERT INTO bank_transaction VALUES (3, '101-11-1002', 3, 260000, '2023-01-03 13:15:14');
INSERT INTO bank_transaction VALUES (4, '101-11-1002', 2, 100000, '2023-01-04 13:15:16');
INSERT INTO bank_transaction VALUES (5, '101-11-1003', 3, 75000, '2023-01-05 13:15:18');
INSERT INTO bank_transaction VALUES (6, '101-11-1001', 1, 150000, '2023-01-05 13:15:28');

-- 실습 6-6. 다음 데이터를 조회 하시오.
-- 모든 고객의 고객번호, 이름, 연락처, 계좌번호, 계좌상품명, 현재잔액을 조회하시오.
SELECT 
    c_no AS 고객번호,
    c_name AS 이름,
    c_phone AS 연락처,
    a_no AS 계좌번호,
    a_item_name AS 계좌상품명,
    a_balance AS 현재잔액
FROM bank_customer a
JOIN bank_account b ON a.c_no = b.a_c_no;

-- 이순신 고객명으로 모든 거래내역 중 거래구분, 거래금액, 거래날짜를 조회하시오.
SELECT 
    t_dist AS 거래구분,
    t_amount AS 거래금액,
    t_datetime AS 거래날짜
FROM bank_customer a
JOIN bank_account b ON a.c_no = b.a_c_no
JOIN bank_transaction c ON b.a_no = c.t_a_no
WHERE c_name = '이순신';

-- 개인고객 중 현재잔액이 가장 큰 고객의 주민번호, 고객명, 계좌번호, 현재잔액, 계좌개설일을 조회하시오
SELECT 
    c_no AS 주민번호,
    c_name AS 고객명,
    a_no AS 계좌번호,
    a_balance AS 현재잔액,
    a_open_date AS 계좌개설일
FROM bank_customer a
JOIN bank_account b ON a.c_no = b.a_c_no
WHERE c_dist=1
ORDER BY a_balance DESC
FETCH FIRST 1 ROWS ONLY;

