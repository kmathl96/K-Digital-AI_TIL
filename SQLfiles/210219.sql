-- ���̺� ����
create table temp2 (
    pname   char(20) primary key,
    price   number(10,2) default 0
);

-- ������ ����
-- ���ڿ��� ����ǥ ���
insert into temp2 values ('computer',100);
insert into temp2 values ('notebook',100.5);

-- ������ ����
update temp2 set price=200.3 where pname='notebook';

-- ������ ��ȸ
select price from temp2 where pname='notebook';

-- ������ ����
delete from temp2 where pname='computer';
delete from temp2 where price > 200;