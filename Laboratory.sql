DROP TABLE levihill.Laboratory;

create table levihill.Laboratory
( labID number(4) NOT NULL,
labName varchar2(30) NOT NULL,
proDelay number(4) NOT NULL );

INSERT INTO levihill.Laboratory
( labID,labName,proDelay )
VALUES
(3000,'Dentist_Office',0 );


INSERT INTO levihill.Laboratory
( labID,labName,proDelay )
VALUES
(3001,'Tooth_Construction',5 );


INSERT INTO levihill.Laboratory
( labID,labName,proDelay )
VALUES
(3002,'X-Ray_Development',1 );


INSERT INTO levihill.Laboratory
( labID,labName,proDelay )
VALUES
(3003,'Retainer_Designer',10 );


GRANT SELECT ON levihill.Laboratory TO PUBLIC;

