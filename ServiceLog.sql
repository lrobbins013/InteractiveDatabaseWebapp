DROP TABLE levihill.ServiceLog;

create table levihill.ServiceLog
( patID number(4) NOT NULL,
proID number(4) NOT NULL,
empID number(4) NOT NULL );

GRANT SELECT ON levihill.ServiceLog TO PUBLIC;

