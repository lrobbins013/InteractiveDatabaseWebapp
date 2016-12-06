DROP TABLE levihill.Procedure;

create table levihill.Procedure
( proID number(4) NOT NULL,
proName varchar2(30) NOT NULL,
labID number(4) NOT NULL,
cost number(4) NOT NULL );

INSERT INTO levihill.Procedure
( proID,proName,labID,cost )
VALUES
(2000,'Cleaning',3000,50 );


INSERT INTO levihill.Procedure
( proID,proName,labID,cost )
VALUES
(2001,'Floride_Treatment',3000,50 );


INSERT INTO levihill.Procedure
( proID,proName,labID,cost )
VALUES
(2002,'Filling',3000,100 );


INSERT INTO levihill.Procedure
( proID,proName,labID,cost )
VALUES
(2003,'Root_Canal',3000,300 );


INSERT INTO levihill.Procedure
( proID,proName,labID,cost )
VALUES
(2004,'Dental_Crown',3001,500 );


INSERT INTO levihill.Procedure
( proID,proName,labID,cost )
VALUES
(2005,'Tooth_Implant',3001,500 );


INSERT INTO levihill.Procedure
( proID,proName,labID,cost )
VALUES
(2006,'Tooth_Removal',3000,100 );


INSERT INTO levihill.Procedure
( proID,proName,labID,cost )
VALUES
(2007,'Teeth_Whitening',3000,100 );


INSERT INTO levihill.Procedure
( proID,proName,labID,cost )
VALUES
(2008,'Xray',3002,150 );


INSERT INTO levihill.Procedure
( proID,proName,labID,cost )
VALUES
(2009,'Retainer_',3003,250 );


GRANT SELECT ON levihill.Procedure TO PUBLIC;

