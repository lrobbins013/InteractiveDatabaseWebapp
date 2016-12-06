DROP TABLE levihill.ServiceLog;

create table levihill.ServiceLog
( servID number(4) NOT NULL,
patID number(4) NOT NULL,
proID number(4) NOT NULL,
empID number(4) NOT NULL );

INSERT INTO levihill.ServiceLog
( servID,patID,proID,empID )
VALUES
(5000,1000,2000,7001 );


GRANT SELECT ON levihill.ServiceLog TO PUBLIC;

