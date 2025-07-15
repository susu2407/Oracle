//교재 26페이지
select * from emp;

select * 
from emp;

//교재 29페이지
desc dept;
select * from tab; //35건

select empno, ename from emp;

//교재 30페이지
set pagesize 15
set linesize 200
select empno, ename from emp;

//교재 32
set pagesize 50
col name for a20

select name, 'good morning~~!' "Good Morning"
from professor;

//p.33
select dname, ',it''s deptno: ', deptno "DNAME AND DEPTNO"
FROM DEPT;

//P.34
SELECT PROFNO, NAME, PAY
FROM PROFESSOR;

SELECT PROFNO "prof's NO", name AS "prof's NAME", pay prof_pay
from professor;

//p.35
select deptno from emp;

select distinct deptno from emp;

//p.36
select job, ename from emp order by 1,2;

select distinct job, ename from emp order by 1,2;

//p.37
select job, distinct ename from emp order by 1,2;

select ename, job from emp;

select ename || job from emp;

//p.38
select ename || '-'||job from emp;

select ename || ' ''s job is ' || job "NAME AND JOB" FROM EMP;

//P.39~40 연습문제 일단 KEEP

// p.41
select empno, ename from emp where empno=7900;

select ename, sal from emp where sal < 900;

select empno, ename, sal from emp where ename =SMITH;

select empno, ename, sal from emp where ename = 'SMITH';

//p.42
select empno, ename, sal from emp where ename = 'smith';

select ename, hiredate from emp where ename = 'SMITH';

SELECT ename, hiredate from emp where ename = 'SMITH';

select empno, ename, sal from emp where hiredate = '80/12/17';

//p.43
select empno, ename, sal from emp whrer hiredate = 80/12/17 ;

//..p,44
select ename, sal from emp where deptno = 10;

select ename, sal+100 from emp where deptno = 10;

select ename, sal*1.1 from emp where deptno = 10;

//p.45
select empno, ename, sal from emp where sal >= 4000;

select empno, ename, sal from emp where ename >= 'W';

//p.46
select ename, hiredate from emp;

select ename, hiredate from  emp where hiredate >= '81/12/25';

//p.47

select ename, hiredate from emp;

select empno, ename, sal from emp where sal between 2000 and 3000;

//p.48
select empno, ename, sal from emp where sal >=2000 and sal <= 3000;

select ename from emp order by ename;
select ename from emp where ename between 'JAMES' and 'MARTIN' order by ename;

//p.49
select empno, ename, deptno from emp where deptno IN (10,20);

select empno, ename, sal from emp where sal like '1%';

select empno, ename, sal from emp where ename like 'A%';

//p.50
select empno, ename, hiredate from emp where hiredate like '%80'; //출력값 없음

select empno, ename, hiredate form emp where hiredate like %80;

select empno, ename, hiredate from emp where hiredate like '___DEC%';//출력값 없음

select empno, ename, hiredate from emp where hiredate like '___12%';

//p.52
select empno, ename, comm from emp where deptno IN (20,30);

select empno, ename, comm from emp where comm = NULL;

//p.53

select empno, ename, comm from emp where comm is NULL;

select empno, ename, comm from emp where comm is not NULL;

//p.54
select ename, hiredate, sal from emp where hiredate > '82/01/01' and sal >= 1300;//ORA-01858: 숫자가 있어야 하는 위치에서 숫자가 아닌 문자가 발견되었습니다.

select ename, hiredate, sal from emp where hiredate > '82/01/01' or sal >= 1300;

select ename, hiredate, sal, comm from emp where sal > 1000 and (comm < 1000 or comm is null);

select ename, hiredate, sal, comm from emp where sal > 1000 and comm < 1000 or comm is null;

//p.55
select empno, ename, sal from emp where empno = &empno;

set verify off
select empno, ename, sal from emp where empno = &empno;

//p.56
select empno, ename from emp where sal = 3000;



















