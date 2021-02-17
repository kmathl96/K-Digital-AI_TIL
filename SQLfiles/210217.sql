create table Temp (
no number
);

insert into temp values(100);
alter table temp read only;
alter table temp read write;
alter table temp
add (name varchar2(10));

-- 가상 컬럼
create table vt1
(   col1 number,
    col2 number,
    col3 number generated always as (col1+col2) virtual);

insert into vt1 values(10,20,30); -- error
insert into vt1 values(10,20); -- error
insert into vt1 (col1, col2) values(10,20);
insert into vt1 (col2, col1) values(40,30);

alter table vt1
add ( col4 generated always as (col1*col2) virtual);

create table sales10
(   no      number,
    pcode   char(4),
    pdate   char(8),
    pqty    number,
    bpungi  number(1) generated always as (
        case when substr(pdate,5,2) in ('01','02','03') then 1
             when substr(pdate,5,2) in ('04','05','06') then 2
             when substr(pdate,5,2) in ('07','08','09') then 3
             when substr(pdate,5,2) in ('10','11','12') then 4
        end) virtual);

insert into sales10 (no,pcode,pdate,pqty) values(100,'1001','20210217',5);

create table new_emp (
    no          number(5),
    name        varchar2(20),
    hiredate    date,
    bonus       number(6,2));

create table new_emp2
as select no,name,hiredate from new_emp;

create table new_emp3
as select * from new_emp2 where 1=2;

alter table new_emp2
add (birthday date default sysdate);

alter table new_emp2 rename column birthday to birth;

alter table new_emp2
modify (no number(7));

alter table new_emp2
drop column birth;

truncate table new_emp2;

drop table new_emp2 purge; -- 완전 삭제
drop table new_emp purge;
drop table new_emp3 purge;
drop table sales10 purge;

-- chap 6 --
insert into dept2 (dcode, dname, pdept, area)
values('9000','temp_1','1006','temp_area');

insert into dept2 values('9001','temp_2','1006','temp_area');

insert into dept2 (dcode,dname,pdept)
values('9002','temp_3','1006');

insert into dept2 (dname,pdept)
values('temp_3','1006'); -- error

insert into dept2 (dcode,pdept)
values('9002','1006'); -- error

drop table temp purge;
create table temp (
    no      number constraint temp_py primary key,
    name    varchar2(20) not null,
    addr    varchar2(30),
    joindate    date default sysdate);

insert into temp (addr) values ('seoul'); -- error
insert into temp (no,name,addr) values (100,'hong','seoul');

insert into professor (profno, name, id, position, pay, hiredate)
values (5001,'James Bond','Love_me','a full professor',500,'2014/10/23');

insert into temp (no,name,addr) values (102,'park',null);
insert into temp values (103,'song',null,'2021/02/17');

create table professor2
as select * from professor where 1=2;
insert into professor2
select * from professor where position='정교수';
truncate table professor2;

create table professor3
as select profno,name,pay from professor where 1=2;
insert into professor3
select profno,name,pay from professor where profno>4000;

create table prof_3
(   profno  number,
    name    varchar2(35));

create table prof_4
(   profno  number,
    name    varchar2(35));

insert all
when profno between 1000 and 1999 then into prof_3 values (profno,name)
when profno between 2000 and 2999 then into prof_4 values (profno,name)
select profno, name
from professor;

insert all
    into prof_3 values(profno,name)
    into prof_4 values(profno,name)
select profno,name from professor where profno between 3000 and 3999;

update professor
set bonus = bonus+200
where position='조교수';
rollback;
commit;

select name,position,pay from professor
where pay<250;

update professor
set pay=pay*1.15
where pay<250 and position=(select position from professor where name='김현정');

delete from dept2
where dcode>=9000;

create table charge_01 (
    u_date  varchar2(6),
    cust_no number,
    u_time  number,
    charge  number);
insert into charge_01 values ('141001',1000,2,1000);
insert into charge_01 values ('141002',1001,2,1000);
insert into charge_01 values ('141003',1002,1,500);

create table charge_02 (
    u_date  varchar2(6),
    cust_no number,
    u_time  number,
    charge  number);
insert into charge_02 values ('141001',1001,3,1500);
insert into charge_02 values ('141004',1001,4,2000);
insert into charge_02 values ('141005',1003,1,500);

drop table charge_01 purge;
drop table charge_02 purge;

truncate table charge_01;
truncate table charge_02;

merge into charge_01 ch01
using charge_02 ch02
on (ch01.u_date=ch02.u_date)
when matched then
    update set ch01.cust_no=ch02.cust_no
when not matched then
    insert values (ch02.u_date,ch02.cust_no,ch02.u_time,ch02.charge);

insert into dept2 values ('9010','temp_10','1006','temp area');
insert into dept2 (dcode,dname,pdept) values ('9020','temp_20','1006');

create table professor4
as select * from professor3 where 1=2;
insert into professor4
    select profno,name,pay
    from professor
    where profno<=3000;
update professor
set bonus = 100
where name='김현정';

create table member1 (
    id      char(20)        primary key,
    height  number(10,2)    default 0.00
);
insert into member1 values ('hong',173.5);
update member1
set height=180
where id='hong';
select height from member1 where id='hong';
delete from member1 where height=180;

-- chap 7 --
create table new_emp1 (
    no NUMBER(4) CONSTRAINT emp1_no_pk PRIMARY KEY,
    name VARCHAR2(20) CONSTRAINT emp1_name_nn NOT NULL,
    jumin VARCHAR2(13) CONSTRAINT emp1_jumin_nn NOT NULL
                      CONSTRAINT emp1_jumin_uk UNIQUE,
    loc_code NUMBER(1) CONSTRAINT emp1_loc_code_ck CHECK (loc_code < 5),
    deptno VARCHAR2(6) CONSTRAINT emp1_deptno_fk REFERENCES dept2(dcode)
);
insert into new_emp1 values(100,'hong','1111111111111',3,'9020');
delete from dept2 where dcode='9010';

create table new_emp2 (
    no NUMBER(4) PRIMARY KEY,
    name VARCHAR2(20) NOT NULL,
    jumin VARCHAR2(13) NOT NULL UNIQUE,
    loc_code NUMBER(1) CHECK (loc_code < 5),
    deptno VARCHAR2(6) REFERENCES dept2(dcode)
);

alter table new_emp2
add constraint emp2_name_uk unique(name);

alter table new_emp2
modify (loc_code constraint emp2_area_nn not null); -- not null은 modify로 변경

alter table emp2
add constraint emp_name_uk unique(name);

alter table new_emp2
add constraint emp2_name_fk foreign key(name) references emp2(name);

insert into new_emp2 values (100,'천만득','1111111111111',1,9020);

delete from emp2 where name='천만득'; -- error : 다른 테이블에서 참조하고 있음

alter table new_emp2
drop constraint emp2_name_fk;

alter table new_emp2
add constraint emp2_name_fk foreign key(name) references emp2(name)
on delete cascade; -- 참조되는 데이터가 삭제되면 그것을 참조하는 데이터들도 삭제됨

delete from emp2 where name='천만득';

insert into new_emp2 values (100,'일지매','1111111111111',1,9020);

alter table new_emp2
add constraint emp2_name_fk foreign key(name) references emp2(name)
on delete set null;

alter table new_emp2
drop constraint emp2_name_fk;

alter table new_emp2
drop constraint SYS_C007134;

delete from emp2 where name='일지매';
rollback;

select owner, table_name, constraint_name, constraint_type, statue
from user_constraints
where table_name='NEW_EMP2';

select owner, constraint_name, table_name, column_name
from user_cons_columns
where table_name='EMP';

create table tcons (
    no      number(5)       constraint tcons_no_pk primary key,
    name    varchar2(20)    constraint tcons_name_nn not null,
    jumin   varchar2(13)    constraint tcons_jumin_nn not null
                            constraint tcons_jumin_uk unique,
    area    number(1)       constraint tcons_area_ck check (area between 1 and 4),
    deptno  varchar2(6)     constraint tcons_deptno_fk references dept2(dcode)
);

alter table tcons
add constraint tcons_name_fk foreign key(name) references emp2(name);

select s.name "학생이름", d.dname "학과명"
from student s, department d
where s.deptno1=d.deptno and
    s.deptno1 = (select deptno1 from student where name='안은수');

select p.name, p.hiredate, d.dname
from professor p, department d
where p.deptno=d.deptno and
    p.hiredate > (select hiredate from professor where name='송도권');

select s.name, s.weight
from student s
where s.weight>(select avg(weight) from student where deptno1=201);

select e.empno, e.name, e.deptno
from emp2 e
where e.deptno in (select dcode from dept2 where area like '포항%');

select * from dept
where exists (select deptno from dept where deptno=&dno);

select name, position, to_char(pay,'$999,999,999')
from emp2
where pay > any (select pay from emp2 where position='대리');

select name, grade, weight
from student
where weight < all (select weight from student where grade=2);

select d.dname, e.name, to_char(e.pay,'$999,999,999') salary
from emp2 e, dept2 d
where e.deptno=d.dcode and
pay < all (select avg(pay)
            from emp2
            group by deptno)
order by 3;

select grade, name, weight
from student
where (grade, weight) in (select grade, max(weight)
                        from student
                        group by grade)
order by 1;

select deptno, dname
from dept d
where exists (select 1 from emp e where e.deptno=d.deptno);

select p.profno, p.name, to_char(p.hiredate, 'RRRR-YY-DD'), d.dname
from professor p, department d
where p.deptno=d.deptno and
    (p.deptno, p.hiredate) in (select deptno, min(hiredate)
                                from professor
                                group by deptno)
order by 3;

select name, position, to_char(pay, '$999,999,999') SALARY
from emp2
where (position, pay) in (select position, max(pay) from emp2 group by position)
order by 3;

select name, (select dname from dept2 d where d.dcode=e.deptno) DEPT_NAME
from emp2 e;

select name, no, pay, dname
from (select e.name NAME, e.deptno NO, e.pay PAY, d.dname DNAME
        from emp2 e, dept2 d
        where e.deptno=d.dcode);