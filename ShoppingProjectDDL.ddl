-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 16:11:02 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cart (
    cartno        NUMBER NOT NULL,
    userid        VARCHAR2(20 BYTE) NOT NULL,
    prodno        NUMBER(6) NOT NULL,
    cartprodcount NUMBER DEFAULT 1,
    cartproddate  DATE NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT cart_pk PRIMARY KEY ( cartno );

CREATE TABLE category (
    cateno   NUMBER(2) NOT NULL,
    catename VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( cateno );

CREATE TABLE orders (
    orderno         CHAR(11 BYTE) NOT NULL,
    userid          VARCHAR2(20 BYTE) NOT NULL,
    ordertotalprice NUMBER NOT NULL,
    orderaddress    VARCHAR2(200 BYTE) NOT NULL,
    orderstatus     NUMBER DEFAULT 0,
    orderdate       DATE NOT NULL
);

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( orderno );

CREATE TABLE ordersitem (
    itemno       NUMBER NOT NULL,
    orderno      CHAR(11 BYTE) NOT NULL,
    prodno       NUMBER(6) NOT NULL,
    itemprice    NUMBER NOT NULL,
    itemdiscount NUMBER NOT NULL,
    itemcount    NUMBER DEFAULT 1
);

ALTER TABLE ordersitem ADD CONSTRAINT ordersitem_pk PRIMARY KEY ( itemno );

CREATE TABLE point (
    pointno   NUMBER NOT NULL,
    userid    VARCHAR2(20 BYTE) NOT NULL,
    point     NUMBER NOT NULL,
    "desc"    VARCHAR2(100 BYTE) NOT NULL,
    pointdate DATE NOT NULL
);

ALTER TABLE point ADD CONSTRAINT point_pk PRIMARY KEY ( pointno );

CREATE TABLE product (
    prodno       NUMBER(6) NOT NULL,
    cateno       NUMBER(2) NOT NULL,
    sellerno     NUMBER(5) NOT NULL,
    prodname     VARCHAR2(20 BYTE) NOT NULL,
    prodprice    NUMBER NOT NULL,
    prodstock    NUMBER DEFAULT 0,
    prodsold     NUMBER DEFAULT 0,
    proddiscount NUMBER DEFAULT 0
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prodno );

CREATE TABLE seller (
    sellerno NUMBER(5) NOT NULL,
    company  VARCHAR2(100 BYTE) NOT NULL,
    tel      VARCHAR2(20 BYTE) NOT NULL,
    manager  VARCHAR2(20 BYTE) NOT NULL,
    address  VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE seller ADD CONSTRAINT seller_pk PRIMARY KEY ( sellerno );

CREATE TABLE "User" (
    userid  VARCHAR2(20 BYTE) NOT NULL,
    name    VARCHAR2(20 BYTE) NOT NULL,
    birth   CHAR(10 BYTE) NOT NULL,
    gender  CHAR(1 BYTE) NOT NULL,
    hp      CHAR(13 BYTE) NOT NULL,
    email   VARCHAR2(100 BYTE),
    point   NUMBER DEFAULT 0 NOT NULL,
    "level" NUMBER DEFAULT 1,
    address VARCHAR2(100 BYTE),
    regdate DATE NOT NULL
);

ALTER TABLE "User" ADD CONSTRAINT user_pk PRIMARY KEY ( userid );

ALTER TABLE cart
    ADD CONSTRAINT cart_product_fk FOREIGN KEY ( prodno )
        REFERENCES product ( prodno );

ALTER TABLE cart
    ADD CONSTRAINT cart_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE orders
    ADD CONSTRAINT orders_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE ordersitem
    ADD CONSTRAINT ordersitem_orders_fk FOREIGN KEY ( orderno )
        REFERENCES orders ( orderno );

ALTER TABLE ordersitem
    ADD CONSTRAINT ordersitem_product_fk FOREIGN KEY ( prodno )
        REFERENCES product ( prodno );

ALTER TABLE point
    ADD CONSTRAINT point_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE product
    ADD CONSTRAINT product_category_fk FOREIGN KEY ( cateno )
        REFERENCES category ( cateno );

ALTER TABLE product
    ADD CONSTRAINT product_seller_fk FOREIGN KEY ( sellerno )
        REFERENCES seller ( sellerno );

CREATE SEQUENCE cart_cartno_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cart_cartno_trg BEFORE
    INSERT ON cart
    FOR EACH ROW
    WHEN ( new.cartno IS NULL )
BEGIN
    :new.cartno := cart_cartno_seq.nextval;
END;
/

CREATE SEQUENCE ordersitem_itemno_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ordersitem_itemno_trg BEFORE
    INSERT ON ordersitem
    FOR EACH ROW
    WHEN ( new.itemno IS NULL )
BEGIN
    :new.itemno := ordersitem_itemno_seq.nextval;
END;
/

CREATE SEQUENCE point_pointno_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER point_pointno_trg BEFORE
    INSERT ON point
    FOR EACH ROW
    WHEN ( new.pointno IS NULL )
BEGIN
    :new.pointno := point_pointno_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           3
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
-- CREATE SEQUENCE                          3
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

INSERT INTO "User" VALUES ('user1', '김유신', '1976-01-21', 'M', '010-1101-1976', 'kimys@naver.com', 7000, 1, '서울', '2022-01-10 10:50:12');
INSERT INTO "User" VALUES ('user2', '계백', '1975-06-11', 'M', '010-1102-1975', NULL, 5650, 1, '서울' , '2022-01-10 10:50:12');
INSERT INTO "User" VALUES ('user3', '김춘추', '1989-05-30', 'M', '010-1103-1989', NULL, 4320, 2, '서울', '2022-01-1010:50:12');
INSERT INTO "User" VALUES ('user4', '이사부', '1979-04-13', 'M', '010-2101-1979', 'leesabu@gmail.com', 0, 1, '서울', '2022-01-10 10:50:12');
INSERT INTO "User" VALUES ('user5', '장보고', '1966-09-12', 'M', '010-2104-1966', 'jangbg@naver.com', 3000, 4, '대전', '2022-01-10 10:50:12');
INSERT INTO "User" VALUES ('user6', '선덕여왕', '1979-07-28', 'M', '010-3101-1979', 'gueen@naver.com', 15840, 2, '대전', '2022-01-10 10:50:12');
INSERT INTO "User" VALUES ('user7', '강감찬', '1984-06-15', 'F', '010-4101-1984', 'kang@daum.net', 3610, 0, '대구', '2022-01-10 10:50:12');
INSERT INTO "User" VALUES ('user8', '신사임당', '1965-10-21', 'M', '010-5101-1965', 'sinsa@gmail.com', 0, 1, '대구', '2022-01-10 10:50:12');
INSERT INTO "User" VALUES ('user9', '이이', '1972-11-28', 'F', '010-6101-1972', 'leelee@nate.com', 0, 3, '부산', '2022-01-10 10:50:12');
INSERT INTO "User" VALUES ('user10', '허난설헌', '1992-09-07', 'F', '010-7103-1992', NULL, 0, 3, '광주', '2022-01-10 10:50:12');

INSERT INTO point VALUES (1, 'user1', 1000, '회원가입 1000 적립', '2022-01-10 10:50:12');
INSERT INTO point VALUES (2, 'user1', 6000, '상품구매 5% 적립', '2022-01-10 10:50:12');
INSERT INTO point VALUES (3, 'user3', 2820, '상품구매 5% 적립', '2022-01-10 10:50:12');
INSERT INTO point VALUES (4, 'user7', 3610, '상품구매 5% 적립', '2022-01-10 10:50:12');
INSERT INTO point VALUES (5, 'user5', 3000, '이벤트 응모 3000 적립', '2022-01-10 10:50:12');
INSERT INTO point VALUES (6, 'user2', 1000, '회원가입 1000 적립', '2022-01-10 10:50:12');
INSERT INTO point VALUES (7, 'user2', 2000, '이벤트 응모 2000 적립', '2022-01-10 10:50:12');
INSERT INTO point VALUES (8, 'user2', 2650, '상품구매 5% 적립', '2022-01-10 10:50:12');
INSERT INTO point VALUES (9, 'user3', 1500, '이벤트 응모 1500 적립', '2022-01-10 10:50:12');
INSERT INTO point VALUES (10, 'user6', 15840, '상품구매 2% 적립', '2022-01-10 10:50:12');

INSERT INTO seller VALUES (10001, '(주)다팔아', '02-201-1976', '정우성', '서울');
INSERT INTO seller VALUES (10002, '판매의민족', '02-102-1975', '이정재', '서울');
INSERT INTO seller VALUES (10003, '멋남', '031-103-1989', '원빈', '경기');
INSERT INTO seller VALUES (10004, '스타일살아', '032-201-1979', '이나영', '경기');
INSERT INTO seller VALUES (10005, '(주)삼성전자', '02-214-1966', '장동건', '서울');
INSERT INTO seller VALUES (10006, '복실이옷짱', '051-301-1979', '고소영', '부산');
INSERT INTO seller VALUES (10007, '컴퓨존(주)', '055-401-1984', '유재석', '대구');
INSERT INTO seller VALUES (10008, '(주)LG전자', '02-511-1965', '강호동', '서울');
INSERT INTO seller VALUES (10009, '굿바디스포츠', '070-6101-1972', '조인성', '부산');
INSERT INTO seller VALUES (10010, '누리푸드', '051-710-1992', '강동원', '부산');

INSERT INTO category VALUES (10, '여성의류패션');
INSERT INTO category VALUES (11, '남성의류패션');
INSERT INTO category VALUES (12, '식품·생필품');
INSERT INTO category VALUES (13, '취미·반려견');
INSERT INTO category VALUES (14, '홈·문구');
INSERT INTO category VALUES (15, '자동차·공구');
INSERT INTO category VALUES (16, '스포츠·건강');
INSERT INTO category VALUES (17, '컴퓨터·가전·디지털');
INSERT INTO category VALUES (18, '여행');
INSERT INTO category VALUES (19, '도서');

ALTER TABLE Product MODIFY prodName VARCHAR2(100);

-- UPDATE product
--    SET prodstock = (SELECT prodprice FROM product WHERE prodNo = '100101'),
--        prodprice = (SELECT prodstock FROM product WHERE prodNo = '100101')
--    WHERE prodNo = '100101';

INSERT INTO product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount)
    VALUES (100101, 11, 10003, '반팔티 L~2XL', 869, 25000, 132, 20);
INSERT INTO product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount)
    VALUES (100110, 10, 10004, '트레이닝 통바지', 1602, 38000, 398, 15);
INSERT INTO product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount)
    VALUES (110101, 10, 10003, '신상 여성운동화', 160, 76000, 40, 5);
INSERT INTO product (prodNo, cateNo, sellerNo, prodName,  prodPrice, prodSold, prodDiscount)
    VALUES (120101, 12, 10010, '암소 1등급 구이셋트 1.2kg',  150000, 87, 15);
INSERT INTO product (prodNo, cateNo, sellerNo, prodName,  prodPrice, prodSold, prodDiscount)
    VALUES (120103, 12, 10010, '바로구이 부채살 250g',  21000, 61, 10);
INSERT INTO product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount)
    VALUES (130101, 13, 10006, '[ANF] 식스프리 강아지 사료', 58, 56000, 142, 0);
INSERT INTO product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount)
    VALUES (130112, 13, 10006, '중대형 사계절 강아지옷', 120, 15000, 80, 0);
INSERT INTO product (prodNo, cateNo, sellerNo, prodName,  prodPrice, prodSold, prodDiscount)
    VALUES (141001, 14, 10001, '라떼 2인 소파/방수 패브릭',  320000, 42, 0);
INSERT INTO product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount)
    VALUES (170115, 17, 10007, '지포스 3080 그래픽카드', 28, 900000, 12, 12);
INSERT INTO product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount)
    VALUES (160103, 16, 10009, '치닝디핑 33BR 철봉', 32, 12000, 28, 0);

INSERT INTO orders VALUES ('22010210001', 'user2', 52300, '서울시 마포구 121', 1, '2022-01-10 10:50:12');
INSERT INTO orders VALUES ('22010210002', 'user3', 56700, '서울시 강남구 21-1', 1, '2022-01-10 10:50:12');
INSERT INTO orders VALUES ('22010210010', 'user4', 72200, '서울시 강서구 큰대로 38', 2, '2022-01-10 10:50:12');
INSERT INTO orders VALUES ('22010310001', 'user5', 127000, '경기도 광주시 초월로 21', 1, '2022-01-10 10:50:12');
INSERT INTO orders VALUES ('22010310100', 'user1', 120000, '경기도 수원시 120번지', 0, '2022-01-10 10:50:12');
INSERT INTO orders VALUES ('22010410101', 'user6', 792000, '부산시 남구 21-1', 2, '2022-01-10 10:50:12');
INSERT INTO orders VALUES ('22010510021', 'user7', 92200, '부산시 부산진구 56 10층', 4, '2022-01-10 10:50:12');
INSERT INTO orders VALUES ('22010510027', 'user8', 112000, '대구시 팔달로 19', 3, '2022-01-10 10:50:12');
INSERT INTO orders VALUES ('22010510031', 'user10', 792000, '대전시 한밭로 24-1', 2, '2022-01-10 10:50:12');
INSERT INTO orders VALUES ('22010710110', 'user9', 94500, '광주시 충열로 11', 1, '2022-01-10 10:50:12');

INSERT INTO ordersitem VALUES (1, '22010210001', 100110, 38000, 15, 1);
INSERT INTO ordersitem VALUES (2, '22010210001', 100101, 25000, 20, 1);
INSERT INTO ordersitem VALUES (3, '22010210002', 120103, 21000, 10, 3);
INSERT INTO ordersitem VALUES (4, '22010310001', 130112, 15000, 0, 1);
INSERT INTO ordersitem VALUES (5, '22010310001', 130101, 56000, 0, 2);
INSERT INTO ordersitem VALUES (6, '22010210010', 110101, 76000, 5, 1);
INSERT INTO ordersitem VALUES (7, '22010310100', 160103, 120000, 0, 1);
INSERT INTO ordersitem VALUES (8, '22010410101', 170115, 900000, 12, 1);
INSERT INTO ordersitem VALUES (9, '22010510021', 110101, 76000, 5, 1);
INSERT INTO ordersitem VALUES (10, '22010510027', 130101, 56000, 0, 2);
INSERT INTO ordersitem VALUES (11, '22010510021', 100101, 25000, 20, 1);
INSERT INTO ordersitem VALUES (12, '22010510031', 170115, 900000, 12, 1);
INSERT INTO ordersitem VALUES (13, '22010710110', 120103, 21000, 10, 5);

INSERT INTO cart VALUES (1, 'user1', 100101, 1, '2022-01-10 10:50:12');
INSERT INTO cart VALUES (2, 'user1', 100110, 2, '2022-01-10 10:50:12');
INSERT INTO cart VALUES (3, 'user3', 120103, 1, '2022-01-10 10:50:12');
INSERT INTO cart VALUES (4, 'user4', 130112, 1, '2022-01-10 10:50:12');
INSERT INTO cart VALUES (5, 'user5', 130101, 1, '2022-01-10 10:50:12');
INSERT INTO cart VALUES (6, 'user2', 110101, 3, '2022-01-10 10:50:12');
INSERT INTO cart VALUES (7, 'user2', 160103, 1, '2022-01-10 10:50:12');
INSERT INTO cart VALUES (8, 'user2', 170115, 1, '2022-01-10 10:50:12');
INSERT INTO cart VALUES (9, 'user3', 110101, 1, '2022-01-10 10:50:12');
INSERT INTO cart VALUES (10, 'user6', 130101, 1, '2022-01-10 10:50:12');

-- 문제1. 모든 장바구니 내역에서 고객명, 상품명, 상품수량을 조회하시오. 단 상품수량 2건이상만 조회 할 것
SELECT
    u.name AS 고객명,
    p.prodname AS 상품명,
    c.cartprodcount AS 상품수량    
FROM CART c
JOIN "User" u ON u.userId = c.userid
JOIN PRODUCT p ON p.prodNo = c.prodNo
WHERE cartProdCount >= 2;


-- 문제2. 모든 상품내역에서 상품번호, 상품카테고리명, 상품명, 상품가격, 판매자이름, 판매자 연락처를 조회하시오. 
SELECT
    p.prodNo AS 상품번호,
    g.cateName AS 상품카테고리명,
    p.prodName AS 상품명,
    p.prodPrice AS 상품가격,
    s.manager AS 판매자이름,
    s.tel  AS "판매자 연락처"
FROM Product p 
JOIN Seller s ON p.sellerNo = s.sellerNo
JOIN Category g On g.cateNo = p.cateNo; 

-- 문제3. 모든 고객의 아이디, 이름, 휴대폰, 현재포인트, 적립포인트 총합을 조회하시오. 단 적립포인트 내역이 없으면 0으로 출력
SELECT
    a.userId,
    a.name,
    a.hp,
    a.point,
    NVL(SUM(b.point) ,0) AS "적립포인트 총합"
FROM POINT b 
JOIN "User" a ON a.userId = b.userId
GROUP BY a.userId, a.name, a.hp, a.point;

-- 문제4. 모든 주문의 주문번호, 주문자 아이디, 고객명, 주문가격, 주문일자를 조회하시오. 
--       단 주문금액에 10만원 이상, 큰 금액순으로 조회, 금액이 같으면 이름이 사전순으로 될것
SELECT
    b.orderNo AS 주문번호,
    a.userId AS "주문자 아이디",
    a.name AS 고객명,
    b.orderTotalPrice AS 주문가격,
    b.orderDate AS 주문일자
FROM "User" a 
JOIN orders b ON a.userId = b.userID
WHERE orderTotalPrice >= 100000 
ORDER BY orderTotalPrice ASC, name ASC;

-- 문제5. 모든 주문의 주문번호, 주문자 아이디, 고객명, 상품명, 주문일자를 조회하시오. 
--       주문번호는 중복 없이 상품명은 구분자 ,로 나열할것
SELECT
    b.orderNo AS 주문번호,
    a.userId AS "주문자 아이디",
    a.name AS 고객명,
    LISTAGG(d.prodName, ',') WITHIN GROUP (ORDER BY d.prodName) AS 상품명,
    b.orderDate AS 주문일자
FROM "User" a
JOIN Orders b ON a.userId = b.userId
JOIN OrdersItem c ON b.orderNo = c.orderNo
JOIN Product d ON c.prodNo = d.prodNo
GROUP BY b.orderNo, a.userId, a.name, b.orderDate
ORDER BY b.orderNo;
-- 선생님 답
SELECT
    a.orderNo,
    MAX(c.userId) AS userId,
    MAX(c.name) AS userName,
    LISTAGG(d.prodName, ',') WITHIN GROUP (ORDER BY d.prodName) AS 상품명,
    MAX(a.orderDate) AS orderDate
FROM Orders a
JOIN OrdersItem b ON a.orderNo = b.orderNo
JOIN "User" c ON a.userId = c.userId
JOIN Product d ON b.prodNo = d.prodNo
GROUP BY a.orderNo;

-- 문제6. 모든 상품의 상품번호, 상품명, 상품가격, 할인율, 할인된 가격을 조회하시오. 
SELECT
    prodNo AS 상품번호,
    prodName AS 상품명,
    prodPrice AS 상품가격,
    prodDiscount AS 할인율,
    FLOOR(prodPrice * (1 - prodDiscount / 100)) AS "할인된 가격"
FROM Product;

-- 문제7. 고소영이 판매하는 모든 상품의 상품번호, 상품명, 상품가격, 재고수량, 판매자이름을 조회하시오. 
SELECT
    a.prodNo AS 상품번호,
    a.prodName AS 상품명,
    a.prodPrice AS 상품가격,
    a.prodStock AS 재고수량,
    b.manager AS 판매자이름
FROM Seller b
JOIN Product a ON a.sellerNo = b.sellerNo
WHERE manager = '고소영';

-- 문제8. 아직 상품을 판매하지 않은 판매자의 판매자번호, 판매자상호, 판매자 이름, 판매자 연락처를 조회 하시오. 
-- 선생님 답
SELECT 
	a.sellerNo,
	a.company,
	a.manager,
	a.tel
FROM Seller a
LEFT JOIN Product b ON a.sellerNo = b.sellerNo
WHERE prodNo IS NULL;

-- GPT
SELECT
    a.sellerNo,
    a.company,
    a.manager,
    a.tel
FROM SELLER a
WHERE NOT EXISTS (
    SELECT 1
    FROM PRODUCT b
    JOIN OrdersItem c ON b.prodNo = c.prodNo
    WHERE a.sellerNo = b.sellerNo
);

-- 또는
SELECT 
    a.sellerNo,
    a.company,
    a.manager,
    a.tel
FROM SELLER a
LEFT JOIN PRODUCT b
    ON a.sellerNo = b.sellerNo
LEFT JOIN OrdersItem c
    ON b.prodNo = c.prodNo
WHERE c.prodNo IS NULL;


-- 문제9. 모든 주문상세내역 중 개별 상품 가격과 개수 그리고 할인율이 적용된 가격을 구하고
-- 그 가격으로 주문별 총합을 구해서
-- 주문별 총합이 10만원이상 그리고 큰 금액 순으로 `주문번호`, `최종총합`을 조회하시오. 
SELECT
    orderNo,
    SUM(할인가 * itemCount) AS 최종총합
FROM(
    SELECT
        orderNo,
        itemPrice,
        itemCount,
        FLOOR(itemPrice * (1 - itemDiscount / 100)) AS 할인가
    FROM OrdersItem
)
GROUP BY orderNo
HAVING SUM(할인가 * itemCount) >= 100000
ORDER BY SUM(할인가 * itemCount) DESC;

-- 문제10. 장보고 고객이 주문했던 모든 상품명을 `고객명`, `상품명`으로 조회하시오.
-- 단 상품명은 중복 안됨, 상품명은 구분자 , 로 나열
SELECT
    u.name AS 고객명,
    LISTAGG(p.prodName, ', ') WITHIN GROUP (ORDER BY p.prodName) AS 상품명
FROM Orders o
JOIN OrdersItem i ON o.orderNo = i.orderNo
JOIN "User" u ON o.userId = u.userId
JOIN Product p ON i.prodNo = p.prodNo
GROUP BY u.name;
