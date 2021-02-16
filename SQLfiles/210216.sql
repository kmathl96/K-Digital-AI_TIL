select sysdate from dual;
alter session set NLS_DATE_FORMAT='RRRR-MM-DD:HH24:MI:SS';
alter session set NLS_DATE_FORMAT='RR/MM/DD';

select name, round(MONTHS_BETWEEN(SYSDATE,birthday)) "Months"
from student;

select sysdate, NEXT_DAY(sysdate, '월') "NEXT DAY" from dual;
select sysdate, LAST_DAY(sysdate) "Days Left" from dual;
select sysdate, ADD_MONTHS(sysdate,2) from dual;

select sysdate, ROUND(sysdate) from dual;

select 2+'2' from dual;

select studno, name, TO_CHAR(birthday, 'RR/MM/DD') "Birthday"
from student;

select empno, ename, TO_CHAR(hiredate, 'RR/MM/DD') "Hiredate"
from emp
where TO_CHAR(hiredate,'MM') in (1,2,3);

select empno, ename, to_char(hiredate,'RRRR-MM-DD') "HIREDATE",
to_char(sal*12+comm,'$99,999') "SAL", to_char((sal*12+comm)*1.15,'$99,999') "15% UP"
from emp
where comm is not null;

select empno, ename, to_char(hiredate,'RRRR-MM-DD') "HIREDATE", sal*12+nvl(comm,0) "SALARY"
from emp;

select name, pay, bonus, pay+nvl(bonus,20) total
from professor;

select empno, ename, sal, comm, nvl2(comm,sal+comm,sal) TOTAL
from emp;

select empno, ename, comm, nvl2(comm,'Exist','NULL') "NVL2"
from emp
where deptno=30;

select name, jumin, DECODE(substr(jumin,7,1),1,'남자',2,'여자') "Gender"
from student
where deptno1 = 101;

select name, tel, DECODE(substr(tel,1,instr(tel,')',1)-1),
                        '02','SEOUL',
                        '031','GYEONGGI',
                        '051','BUSAN',
                        '052','ULSAN',
                        '055','GYEONGNAM') "LOC"
from student
where deptno1=101;

select empno, ename, sal,
        case when sal between 1 and 1000 then 'Level 1'
             when sal between 1001 and 2000 then 'Level 2'
             when sal between 2001 and 3000 then 'Level 3'
             when sal between 3001 and 4000 then 'Level 4'
             else 'Level 5'
        end "LEVEL"
from emp
order by sal desc;

-- chap 3 --
select avg(nvl(comm,0)) from emp;

select deptno, position, round(avg(pay),2)
from professor
group by deptno, position
order by deptno, position;

select deptno, job, count(*)
from emp
group by deptno, job
order by 1,3 desc;

select deptno, position, avg(pay)
from professor
group by deptno, position
having avg(pay)>=300;

select max(sal+nvl(comm,0)) MAX,min(sal+nvl(comm,0)) MIN, round(avg(sal+nvl(comm,0)),1) AVG
from emp;

select grade, avg(weight)
from student
group by grade;

select deptno, job, round(avg(sal),1)
from emp
group by rollup(deptno, job);

select deptno, job, round(avg(sal),1)
from emp
group by deptno, rollup(job);

select deptno, job, round(avg(sal),1)
from emp
group by rollup(deptno), job;

select deptno, job, round(avg(sal),1)
from emp
group by cube(deptno, job);

select deptno, position, round(avg(pay),2) "AVG_PAY"
from professor
group by grouping sets(deptno, position);

-- chap 4 --
select ename, dname
from emp e, dept d
where e.deptno=d.deptno;

select e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno=d.deptno;

-- ANSI Join
select e.ename, e.deptno, d.dname
from emp e inner join dept d
on e.deptno=d.deptno;

select s.name Student, p.name Professor
from student s, professor p
where s.profno=p.profno;

select s.name "학생명", d.dname "과명", p.name "교수명"
from student s, department d, professor p
where s.deptno1=d.deptno and s.profno=p.profno;

select e1.empno "직원번호", e1.ename "직원명", e2.empno "상사번호", e2.ename "상사명"
from emp e1, emp e2
where e1.mgr=e2.empno;

select s.name Student, p.name Professor
from student s, professor p
where s.profno=p.profno(+);


create table customer
(gno  number(8) ,
 gname varchar2(30) ,
 jumin char(13) ,
 point number) ;

insert into customer values (20010001,'James Seo','7510231369824',980000);
insert into customer values (20010002,'Mel Gibson','7502241128467',73000);
insert into customer values (20010003,'Bruce Willis','7506152123648',320000);
insert into customer values (20010004,'Bill Pullman','7512251063421',65000);
insert into customer values (20010005,'Liam Neeson','7503031639826',180000);
insert into customer values (20010006,'Samuel Jackson','7601232186327',153000);
insert into customer values (20010007,'Ahnjihye','7604212298371',273000);
insert into customer values (20010008,'Jim Carrey','7609112118379',315000);
insert into customer values (20010009,'Morgan Freeman','7601202378641',542000);
insert into customer values (20010010,'Arnold Scharz','7610122196482',265000);
insert into customer values (20010011,'Brad Pitt','7711291186223',110000);
insert into customer values (20010012,'Michael Douglas','7704021358674',99000);
create table gift
( gno  number ,
  gname varchar2(30) ,
  g_start  number ,
  g_end  number );

insert into gift values(1,'Tuna Set',1,100000);
insert into gift values(2,'Shampoo Set',100001,200000);
insert into gift values(3,'Car wash Set',200001,300000);
insert into gift values(4,'Kitchen Supplies Set',300001,400000);
insert into gift values(5,'Mountain bike',400001,500000);
insert into gift values(6,'LCD Monitor',500001,600000);
insert into gift values(7,'Notebook',600001,700000);
insert into gift values(8,'Wall-Mountable TV',700001,800000);
insert into gift values(9,'Drum Washing Machine',800001,900000);
insert into gift values(10,'Refrigerator',900001,1000000);
commit ;


select c.gname CUSTOMER_NAME, c.point POINT, g.gname GIFT_NAME
from customer c, gift g
where c.point between g.g_start and g.g_end;

select s.studno "학번", s.name "학생명", e.total "점수", h.grade
from student s, exam_01 e, hakjum h
where s.studno=e.studno and e.total between h.min_point and h.max_point;

select s.name "학생", p.name "교수"
from student s full outer join professor p
on s.profno=p.profno;

select s.name, d1.dname, d2.dname
from student s, department d1, department d2
where s.deptno1=d1.deptno and s.deptno2=d2.deptno(+);

select s.name STU_NAME, s.deptno1, d.dname DEPT_NAME
from student s, department d
where s.deptno1=d.deptno;

select e.name, e.position, e.pay, p.s_pay LOW_PAY, p.e_pay HIGH_PAY
from emp2 e, p_grade p
where e.position=p.position;

select e.name "이름", trunc((sysdate-e.birthday)/365) "나이", e.position "현재 직급", p.position "예상 직급" 
from emp2 e, p_grade p
where trunc((sysdate-e.birthday)/365) between p.s_age and p.e_age;

select c.gname "고객명", c.point "포인트", g.gname "상품명"
from customer c, gift g
where c.point >= g.g_start and g.gname='Notebook';

select p1.profno, p1.name, to_char(p1.hiredate,'RRRR/MM/DD') HIREDATE, count(p2.profno) COUNT
from professor p1, professor p2
where p1.hiredate > p2.hiredate(+)
group by p1.profno, p1.name, to_char(p1.hiredate,'RRRR/MM/DD')
order by 4;

select e1.empno, e1.ename, e1.hiredate, count(e2.empno)
from emp e1, emp e2
where e1.hiredate > e2.hiredate(+)
group by e1.empno, e1.ename, e1.hiredate
order by 4;


-- chap 5 --
create table account
(   id      varchar2(10),
    name    varchar2(20),
    balance number(10) default 0,
    grade   varchar2(10) default null
);

insert into account (id,name) values('1001','홍길동');
insert into account values('1002','고길동',100000,'VIP'); -- 모든 컬럼값을 넣을 땐 컬럼명 생략 가능
commit;

create table dept3
as
    select dcode,dname,pdept from dept2 where area like '서울%';
drop table dept3;

create table dept3
as
    select dcode,dname,pdept from dept2 where 1=2;

alter table dept3
add (location varchar2(30));

alter table dept3 rename column location to loc;
rename dept3 to dept3_1;
rename dept3_1 to dept3;
alter table dept3
modify (loc varchar2(20));

alter table dept3
drop column loc;

truncate table account;
drop table account;

drop table dept3;
create table dept3
as
    select * from dept2;
delete from dept3;