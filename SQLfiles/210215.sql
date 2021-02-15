-- chap 1 --
select * from employees;

select empno,ename from emp;

desc emp;

select * from tab;
desc tab;

select ename,hiredate,deptno from emp;

select * from dept;

select ename,'님 좋은 아침입니다.' from emp;

select ename,'님 좋은 아침입니다.' as "인 사" from emp;
select ename,'님 좋은 아침입니다.' "인 사" from emp;

select ename, '''s department number is', deptno from emp;
select ename||'''s department number is '||deptno "부서정보" from emp;

select profno "Prop's No", name "Prof's Name" from professor;

select distinct deptno from emp;
select deptno from emp;

select name||'''s ID : '||id||', WHIGHT is '||weight||'kg' "ID AND WEIGHT" from student;
select ename||'('||job||'), '||ename||''''||job||'''' "NAME AND JOB" from emp;
select ename||'''s sal is $'|| sal "Name and Sal" from emp;

select empno, ename, deptno from emp where deptno=10;
select * from emp where empno=7900;
select * from emp where ename='JAMES';

select ename, hiredate from emp where hiredate>='80/01/01';

select ename,sal from emp where sal>=2000 and sal<=3000;
select ename,sal from emp where sal between 2000 and 3000;

select ename, sal, comm from emp where comm is null;

select ename, deptno from emp where deptno=10 or deptno=20;
select ename, deptno from emp where deptno in (10,20);

select name from professor where name like '김%';

select name, email from professor where email like '%naver.com';

select name from professor where name not like '김%';

select name,birthday from student where birthday like '_____02%';

select ename, job, sal from emp where empno=&id;

select empno, ename from emp order by ename;
select empno, ename, deptno from emp order by 3,2;

select ename from emp
union all
select name from professor;

select studno, name from student where deptno1=101
intersect
select studno, name from student where deptno2=201;

select studno, name from student where deptno1=101
minus
select studno, name from student where deptno2=201;

-- chap 2 --
select ename, initcap(ename), lower(ename), upper(ename) from emp;
select ename, length(ename), lengthb(ename) from emp;
select name, length(name), lengthb(name) from professor;

select concat(empno, ename) from emp;
select empno||ename from emp;

select name, substr(birthday,6,2) from student;
select name, birthday from student where substr(birthday,6,2)='02';

select name, substr(jumin,3,4) "Birthday" from student where deptno1=101;

select name, tel, instr(tel,')',1,1) from student where deptno1=101;
select name, tel, substr(tel,1,instr(tel,')',1,1)-1) "Area code" from student where deptno1=201;

select name, tel, instr(tel,'3',1) from student where deptno1=101;
select name, tel, substr(tel,instr(tel,')',1)+1, instr(tel,'-',1)-instr(tel,')',1)-1)
from student
where deptno1=201;

select rpad(ename, 9, substr('123456789', lengthb(ename)+1)) "RPAD"
from emp
where deptno=10;

select ltrim('   ABC') from dual;

select ename, replace(ename, substr(ename,1,2),'**') "REPLACE"
from emp
where deptno=10;

select name, replace(jumin, substr(jumin,7,7),'*******') "jumin" from student;

select ename, replace(ename, substr(ename,3,2),'--') "REPLACE"
from emp
where deptno=20;

select name, tel, replace(tel,substr(tel,-4,4),'****') "REPLACE"
from student
where deptno1=101;