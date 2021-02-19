-- 테이블 생성
create table temp2 (
    pname   char(20) primary key,
    price   number(10,2) default 0
);

-- 데이터 삽입
-- 문자열은 따옴표 사용
insert into temp2 values ('computer',100);
insert into temp2 values ('notebook',100.5);

-- 데이터 갱신
update temp2 set price=200.3 where pname='notebook';

-- 데이터 조회
select price from temp2 where pname='notebook';

-- 데이터 삭제
delete from temp2 where pname='computer';
delete from temp2 where price > 200;