-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-12 12:19:14 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE chart (
    chart_id   CHAR(8 BYTE) NOT NULL,
    treat_no   NUMBER(7) NOT NULL,
    doc_id     CHAR(7 BYTE) NOT NULL,
    pat_id     CHAR(7 BYTE) NOT NULL,
    chart_desc VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE chart ADD CONSTRAINT chart_pk PRIMARY KEY ( chart_id );

CREATE TABLE department (
    dep_no      CHAR(3 BYTE) NOT NULL,
    dep_name    VARCHAR2(20 BYTE) NOT NULL,
    dep_manager VARCHAR2(20) NOT NULL,
    dep_tel     VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY ( dep_no );

CREATE TABLE doctor (
    doc_id    CHAR(7 BYTE) NOT NULL,
    dep_no    CHAR(3 BYTE),
    doc_name  VARCHAR2(45 BYTE) NOT NULL,
    doc_birth CHAR(10 BYTE) NOT NULL,
    doc_gen   CHAR(1 BYTE) NOT NULL,
    doc_pos   VARCHAR2(45 BYTE) NOT NULL,
    doc_phone VARCHAR2(20 BYTE) NOT NULL,
    doc_email VARCHAR2(45 BYTE) NOT NULL
);

ALTER TABLE doctor ADD CONSTRAINT doctor_pk PRIMARY KEY ( doc_id );

CREATE TABLE nurse (
    nur_id     CHAR(7 BYTE) NOT NULL,
    dep_no     CHAR(3 BYTE),
    nur_name   VARCHAR2(50 BYTE) NOT NULL,
    nur_birth  CHAR(10 BYTE) NOT NULL,
    nur_gender CHAR(1 BYTE) NOT NULL,
    nur_pos    VARCHAR2(50 BYTE) NOT NULL,
    nur_phone  CHAR(13 BYTE) NOT NULL,
    nur_email  VARCHAR2(50)
);

ALTER TABLE nurse ADD CONSTRAINT nurse_pk PRIMARY KEY ( nur_id );

ALTER TABLE nurse ADD CONSTRAINT nur_phone_uk UNIQUE ( nur_phone );

ALTER TABLE nurse ADD CONSTRAINT nur_email_uk UNIQUE ( nur_email );

CREATE TABLE patient (
    pat_id    CHAR(7 BYTE) NOT NULL,
    doc_id    CHAR(7 BYTE),
    nur_id    CHAR(7 BYTE),
    pat_name  VARCHAR2(45 BYTE) NOT NULL,
    pat_jumin CHAR(14 BYTE) NOT NULL,
    pat_gen   CHAR(1 BYTE) NOT NULL,
    pat_addr  VARCHAR2(100 BYTE) NOT NULL,
    pat_phone VARCHAR2(45 BYTE) NOT NULL,
    pat_email VARCHAR2(45 BYTE),
    pat_job   VARCHAR2(45 BYTE)
);

ALTER TABLE patient ADD CONSTRAINT patient_pk PRIMARY KEY ( pat_id );

ALTER TABLE patient ADD CONSTRAINT pat_phone_uk UNIQUE ( pat_phone );

ALTER TABLE patient ADD CONSTRAINT pat_email_uk UNIQUE ( pat_email );

CREATE TABLE treatment (
    treat_no       NUMBER(7) NOT NULL,
    doc_id         CHAR(7 BYTE) NOT NULL,
    pat_id         CHAR(7 BYTE) NOT NULL,
    treat_desc     VARCHAR2(100 BYTE) NOT NULL,
    treat_datetime DATE NOT NULL
);

ALTER TABLE treatment
    ADD CONSTRAINT treatment_pk PRIMARY KEY ( treat_no,
                                              doc_id,
                                              pat_id );

ALTER TABLE chart
    ADD CONSTRAINT chart_treatment_fkv3
        FOREIGN KEY ( treat_no,
                      doc_id,
                      pat_id )
            REFERENCES treatment ( treat_no,
                                   doc_id,
                                   pat_id );

ALTER TABLE doctor
    ADD CONSTRAINT doctor_department_fk FOREIGN KEY ( dep_no )
        REFERENCES department ( dep_no );

ALTER TABLE nurse
    ADD CONSTRAINT nurse_department_fk FOREIGN KEY ( dep_no )
        REFERENCES department ( dep_no );

ALTER TABLE patient
    ADD CONSTRAINT patient_doctor_fk FOREIGN KEY ( doc_id )
        REFERENCES doctor ( doc_id );

ALTER TABLE patient
    ADD CONSTRAINT patient_nurse_fk FOREIGN KEY ( nur_id )
        REFERENCES nurse ( nur_id );

ALTER TABLE treatment
    ADD CONSTRAINT treatment_doctor_fk FOREIGN KEY ( doc_id )
        REFERENCES doctor ( doc_id );

ALTER TABLE treatment
    ADD CONSTRAINT treatment_patient_fk FOREIGN KEY ( pat_id )
        REFERENCES patient ( pat_id );



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
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
-- CREATE SEQUENCE                          0
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
insert into department values ('101', '소아과', '김유신', '051-123-0101');
insert into department values ('102', '내과', '김춘추', '051-123-0102');
insert into department values ('103', '외과', '장보고', '051-123-0103');
insert into department values ('104', '피부과', '선덕여왕', '051-123-0104');
insert into department values ('105', '이비인후과', '강감찬', '051-123-0105');
insert into department values ('106', '산부인과', '신사임당', '051-123-0106');
insert into department values ('107', '흉부외과', '류성룡', '051-123-0107');
insert into department values ('108', '정형외과', '송상현', '051-123-0108');
insert into department values ('109', '신경외과', '이순신', '051-123-0109');
insert into department values ('110', '비뇨기과', '정약용', '051-123-0110');
insert into department values ('111', '안과', '박지원', '051-123-0111');
insert into department values ('112', '치과', '전봉준', '051-123-0112');

INSERT INTO Doctor VALUES ('D101101', '101', '김유신', '1976-01-21', 'M', '과장', '010-1101-1976', 'kimys@bw.com');
INSERT INTO Doctor VALUES ('D101102', '101', '계백', '1975-06-11', 'M', '전문의', '010-1102-1975', 'gaeback@bw.com');
INSERT INTO Doctor VALUES ('D101103', '101', '김관창', '1989-05-30', 'M', '전문의', '010-1103-1989', 'kwanch@bw.com');
INSERT INTO Doctor VALUES ('D102101', '102', '김춘추', '1979-04-13', 'M', '과장', '010-2101-1979', 'kimcc@bw.com');
INSERT INTO Doctor VALUES ('D102104', '102', '이사부', '1966-09-12', 'M', '전문의', '010-2104-1966', 'leesabu@bw.com');
INSERT INTO Doctor VALUES ('D103101', '103', '장보고', '1979-07-28', 'M', '과장', '010-3101-1979', 'jangbg@bw.com');
INSERT INTO Doctor VALUES ('D104101', '104', '선덕여왕', '1984-06-15', 'F', '과장', '010-4101-1984', 'gueen@bw.com');
INSERT INTO Doctor VALUES ('D105101', '105', '강감찬', '1965-10-21', 'M', '과장', '010-5101-1965', 'kang@bw.com');
INSERT INTO Doctor VALUES ('D106101', '106', '신사임당', '1972-11-28', 'F', '과장', '010-6101-1972', 'sinsa@bw.com');
INSERT INTO Doctor VALUES ('D107103', '107', '이이', '1992-09-07', 'M', '전문의', '010-7103-1992', 'leelee@bw.com');
INSERT INTO Doctor VALUES ('D107104', '107', '이황', '1989-12-09', 'M', '전문의', '010-7104-1989', 'hwang@bw.com');
INSERT INTO Doctor VALUES ('D108101', '108', '송상현', '1977-03-14', 'M', '과장', '010-8101-1977', 'ssh@bw.com');

INSERT INTO nurse VALUES ('N101101','101','송승헌','1976-02-21','M','수간호사','010-1101-7602','ssh@bw.com');
INSERT INTO nurse VALUES ('N102101','102','이영애','1975-07-11','F','수간호사','010-1102-7507','yung@bw.com');
INSERT INTO nurse VALUES ('N102102','102','엄정화','1989-06-30','F','주임','010-1103-8906','um@bw.com');
INSERT INTO nurse VALUES ('N102103','102','박명수','1979-05-13','M','주임','010-2101-7905','park@bw.com');
INSERT INTO nurse VALUES ('N103101','103','정준하','1966-10-12','M','주임','010-2104-6610','jung@bw.com');
INSERT INTO nurse VALUES ('N104101','104','김태희','1979-08-28','F','주임','010-3101-7908','taeh@bw.com');
INSERT INTO nurse VALUES ('N105101','105','송혜교','1984-07-15','F','주임','010-4101-8407','song@bw.com');
INSERT INTO nurse VALUES ('N106101','106','공유','1965-11-21','M','간호사','010-5101-6511','gong@bw.com');
INSERT INTO nurse VALUES ('N107101','107','이병헌','1972-12-28','M','간호사','010-6101-7212','byung@bw.com');
INSERT INTO nurse VALUES ('N108101','108','송중기','1992-10-07','M','간호사','010-7103-9210','jungi@bw.com');


insert into patient values ('P102101','D102101','N102101','정우성', '760121-1234567', 'M', '서울', '010-1101-7601', null, '배우');    
insert into patient values ('P103101','D103101','N103101','이정재','750611-1234567','M','서울','010-1102-7506',null,'배우');
insert into patient values ('P102102','D102104','N102103','전지현','890503-1234567','F','대전','010-1103-8905','jjh@naver.com','자영업');
insert into patient values ('P104101','D104101','N104101','이나영','790413-1234567','F','대전','010-2101-7904','lee@naver.com','회사원');
insert into patient values ('P105101','D105101','N105101','원빈','660912-1234567','M','대전','010-2104-6609','one@naver.com','배우');
insert into patient values ('P103102','D103101','N103101','장동건','790728-1234567','M','대구','010-3101-7907','jang@naver.com','배우');
insert into patient values ('P104102','D104101','N104101','고소영','840615-1234567','F','대구','010-4101-8406','goso@naver.com','회사원');
insert into patient values ('P108101','D108101','N108101','김연아','651021-1234567','F','대구','010-5101-6510','yuna@naver.com','운동선수');
insert into patient values ('P102103','D102104','N102102','유재석','721128-1234567','M','부산','010-6101-7211',null,'개그맨');
insert into patient values ('P107101','D107104','N107101','강호동','920907-1234567','M','부산','010-7103-9209',null,'개그맨');
insert into patient values ('P105102','D105101','N105101','조인성','891209-1234567','M','광주','010-7104-8912','join@naver.com','배우');
insert into patient values ('P104103','D104101','N104101','강동원','770314-1234567','M','광주','010-8101-7703','dong@naver.com','배우');

insert into treatment values (1021001,'D102101','P102101','감기,몸살','2022-01-10 10:50:12');
insert into treatment values (1031002,'D103101','P103101','교통사고 외상','2022-01-10 10:50:12');
insert into treatment values (1021003,'D102104','P102102','위염,장염','2022-01-10 10:50:12');
insert into treatment values (1041004,'D104101','P104101','피부 트러블','2022-01-10 10:50:12');
insert into treatment values (1051005,'D105101','P105101','코막힘 및 비염','2022-01-10 10:50:12');
insert into treatment values (1031006,'D103101','P103102','목 디스크','2022-01-10 10:50:12');
insert into treatment values (1041007,'D104101','P104102','여드름','2022-01-10 10:50:12');
insert into treatment values (1081008,'D108101','P108101','오른쪽 발목 뼈 골절','2022-01-10 10:50:12');
insert into treatment values (1021009,'D102104','P102103','소화불량','2022-01-10 10:50:12');
insert into treatment values (1071010,'D107104','P107101','가슴 통증','2022-01-10 10:50:12');
insert into treatment values (1051011,'D105101','P105102','귀 이명','2022-01-10 10:50:12');
insert into treatment values (1041012,'D104101','P104103','팔목 화상','2022-01-10 10:50:12');

insert into chart values ('C1021001',1021001,'D102101','P102101','감기 주사 및 약 처방');
insert into chart values ('C1031002',1031002,'D103101','P103101','입원 치료');
insert into chart values ('C1021003',1021003,'D102104','P102102','위내시경');
insert into chart values ('C1041004',1041004,'D104101','P104101','피부 감염 방지 주사');
insert into chart values ('C1051005',1051005,'D105101','P105101','비염 치료');
insert into chart values ('C1031006',1031006,'D103101','P103102','목 견인치료');
insert into chart values ('C1041007',1041007,'D104101','P104102','여드름 치료약 처방');
insert into chart values ('C1081008',1081008,'D108101','P108101','발목 깁스');
insert into chart values ('C1021009',1021009,'D102104','P102103','주사 처방');
insert into chart values ('C1071010',1071010,'D107104','P107101','MRI 검사');
insert into chart values ('C1051011',1051011,'D105101','P105102','귀 청소 및 약 처방');
insert into chart values ('C1041012',1041012,'D104101','P104103','화상 크림약 처방');

-- 문제1. 모든 의사의 의사ID, 이름, 생년월일, 전공의과 번호, 전공의과 이름을 조회하시오.
select
    a.doc_id,
    a.doc_name,
    a.doc_birth,
    a.dep_no,
    b.dep_name
from doctor a join department b on a.dep_no = b.dep_no;

-- 문제2. 모든 간호사의 간호사ID, 이름, 생년월일, 전공의과 번호, 전공의과 이름을 조회하시오.
select
    a.nur_id,
    a.nur_name,
    a.nur_birth,
    a.dep_no,
    b.dep_name
from nurse a join department b on a.dep_no = b.dep_no;

-- 문제3. 모든 환자의 환자ID, 이름, 주민번호, 휴대폰, 담당의사 이름, 담당 간호사 이름을 조회하시오.
select
    pat_id,
    pat_name,
    pat_jumin,
    pat_phone,
    doc_id,
    nur_id
from patient;

-- 문제4. 모든 진료내역에서 환자 이름, 담당의사 이름, 진료내용, 처방내용, 진료날짜를 조회하시오.
select
    b.pat_name,
    d.doc_name,
    a.treat_desc,
    c.chart_desc,
    a.treat_datetime
from treatment a 
join patient b on a.pat_id = b.pat_id 
join chart c on a.pat_id = c.pat_id
join doctor d on b.doc_id = d.doc_id;

-- 문제5. 모든 진료내역에서 '외과'에서 진료한 내역 가운데 진료번호, 환자이름, 담당의사명, 진료내용, 처방내용, 진료날짜를 조회하시오. 
select
    a.treat_no
from treatment a
join doctor b on a.doc_id = b.doc_id
join department c on b.dep_no = c.dep_no
join patient d on b.doc_id = b.doc_id
where dep_name = '외과';

-- 문제6. 모든 진료내역에서 '화상'으로 진료한 내역 가운데 진료번호, 환자이름, 담당의사명, 진료내용,처방내용, 진료날짜를 조회하시오. 


-- 문제7. 현재 날짜를 기준으로 30세 이상 ~ 40세 미만 환자를 조회하시오. 


-- 문제8. 모든 전공부서에서 아직 의사ID가 부여되지 않은 의사의 이름과 부서명을 조회하시오. 


-- 문제9. 김태희 간호사가 맡고 있는 모든 환자의 이름을 구분자 ^으로 해서 '강동원^고소영^이나영'과 같이 조회하시오. 


-- 문제10. 가장 많은 환자 수를 담당하는 간호사ID, 간호사 이름, 담당환자수를 조회 하시오.

