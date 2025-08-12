/*
    날짜 : 2025/08/12
    이름 : 이수연
    내용 : 9장 트랜잭션 실습
*/

-- 실습 8-1
select * from account;

update account set 
                acc_balance = acc_balance - 10000 
                where acc_no = '101-11-1001';
    
update account set 
                acc_balance = acc_balance + 10000 
                where acc_no = '101-11-1003';
                
select * from account;
 
 -- 작업확정
 commit;
 
 -- 실습 8-2
update account set 
                acc_balance = acc_balance - 10000 
                where acc_no = '101-11-1001';
    
update account set 
                acc_balance = acc_balance + 10000 
                where acc_no = '101-11-1003';

select * from account;

-- 작업 취소
rollback;

-- 실습 8-3
show autocommit;

set autocommit off;

select * from account;
update account set 
                acc_balance = acc_balance - 10000 
                where acc_no = '101-11-1001';
    
update account set 
                acc_balance = acc_balance + 10000 
                where acc_no = '101-11-1003';












