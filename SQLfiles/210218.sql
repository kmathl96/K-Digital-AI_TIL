select * from t_member;
commit;

drop table account purge;
create table account (
    id      varchar2(10) constraint acc_id_pk primary key,
    name    varchar2(20) constraint acc_name_nn not null,
    balance number default 0,
    grade   varchar2(10)
);