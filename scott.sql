--p26
select * from emp;

--27
select * 
from emp;

--select * fr
--om emp;

--select *
--from em
--p;

--select em
--pno from emp;

--28
DESC dept;

--29
SELECT * FROM tab;

SELECT empno, ename FROM emp;
    --SET PAGESIZE : 세로 줄(행 개수)길이, 15줄마다 제목 재출력
SET PAGESIZE 15
    --SET LINESIZE : 가로 너비(문자 수) 길이, 한 줄에 최대20문자까지 출력(초과 시 줄바꿈)
SET LINESIZE 20
SELECT empno, ename
FROM emp;

--31
    --데이터가 숫자일 경우. empno라는 컬럼의 길이를 숫자 4자리까지 들어가게 설정
COL deptno FOR 9999
    --데이가 문자일 경우. ename이란 컬럼의 길이를 15바이트까지 들어가게 설정
COL dname FOR a15;
    --한 화면에 출력 가능한 줄 길이 설정(가로 길이 설정). 한 화면을 가로로 200바이트까지 출력
SET LINESIZE 200
    --한 페이지에 출력 가능한 줄 수 설정(세로 길이 설정). 한 페이지에 50줄까지 출력
SET PAGESIZE 50
COL loc FOR a15
SELECT depto, dname, loc;
/

--32
SET PAGESIZE 50
COL name FOR a30
SELECT name, 'good morning~~!' "Good Morning"
FROM professor;

--33
SELECT dname, ',it''s deptno: ', deptno "DNAME AND DEPTNO"
FROM dept;

SELECT dname, q'[, it's deptno : ]', deptno "DANCE AND DEPTNO"
FROM dept;


--34
SELECT profno, name, pay FROM professor;

SELECT profno "Pfor's NO", name AS "Prof's NAME", pay Prof_Pay 
FROM professor;

--35
SELECT deptno FROM emp;

SELECT DISTINCT deptno FROM emp;

--36
SELECT job, ename FROM emp ORDER BY 1,2;

SELECT DISTINCT job, ename FROM emp ORDER BY 1,2;

--37
--SELECT job, DISTINCT ename FROM emp ORDER BY 1,2;
-- DISTINCT는 반드시 SELECT 뒤에 와야 함.

SELECT ename, job FROM emp;

SELECT ename || job FROM emp;

SELECT ename ||'-'|| job FROM emp;

SELECT ename ||'''s job is '|| job "NAME AND JOB" FROM emp;

--39 
--연습문제1
SELECT NAME || '''S ID: '||ID||' , WEIGTH is '||WEIGHT||'kg' AS "ID AND EIGHT" FROM student;

--연습문제2
SELECT ename ||'('||job||'), '|| ename ||''''||job||'''' FROM emp;

--40
--연습문제3
SELECT ename||'''s sal is $'||SAL FROM emp;

--41
SELECT empno, ename
    FROM emp
    WHERE empno=7900;

SELECT ename, sal FROM emp WHERE sal<900;

--SELECT empno, ename, sal FROM emp WHERE ename=SMITH;

SELECT empno, ename, sal FROM emp WHERE ename='SMITH';

--42
SELECT empno, ename, sal FROM emp WHERE ename = 'smith';

SELECT ename, hiredate FROM emp WHERE ename = 'SMITH';

SELECT empno, ename, sal FROM emp WHERE hiredate = '80/12/17';










