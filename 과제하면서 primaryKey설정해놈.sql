SELECT sequence_name FROM user_sequences;
INSERT INTO USER6 VALUES (user6_seq.NEXTVAL, '김유신', 'M', 25, '김해시');


CREATE SEQUENCE user6_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;
    
SELECT sequence_name FROM user_sequences;

DROP SEQUENCE user6_seq;

SELECT MAX(SEQ) FROM USER6;

CREATE SEQUENCE user6_seq
  START WITH 4
  INCREMENT BY 1
  NOCACHE;