DROP TABLE levihill.Patient;

create table levihill.Patient
( patID number(4) NOT NULL,
firstName varchar2(30) NOT NULL,
lastName varchar2(30) NOT NULL,
balance number(4) NOT NULL );

INSERT INTO levihill.Patient
( patID,firstName,lastName,balance )
VALUES
(1000,'Michael','Scott',0 );


INSERT INTO levihill.Patient
( patID,firstName,lastName,balance )
VALUES
(1001,'Dwight','Schrute',0 );


INSERT INTO levihill.Patient
( patID,firstName,lastName,balance )
VALUES
(1002,'Jim','Halpert',0 );


INSERT INTO levihill.Patient
( patID,firstName,lastName,balance )
VALUES
(1003,'Pam','Halpert',0 );


INSERT INTO levihill.Patient
( patID,firstName,lastName,balance )
VALUES
(1004,'Ryan','Howard',0 );


INSERT INTO levihill.Patient
( patID,firstName,lastName,balance )
VALUES
(1005,'Standley','Hudson',0 );


INSERT INTO levihill.Patient
( patID,firstName,lastName,balance )
VALUES
(1006,'Kevin','Malone',0 );


INSERT INTO levihill.Patient
( patID,firstName,lastName,balance )
VALUES
(1007,'Meredith','Palmer',0 );


INSERT INTO levihill.Patient
( patID,firstName,lastName,balance )
VALUES
(1008,'Angela','Martin',0 );


INSERT INTO levihill.Patient
( patID,firstName,lastName,balance )
VALUES
(1009,'Oscar','Martinez',0 );


INSERT INTO levihill.Patient
( patID,firstName,lastName,balance )
VALUES
(1010,'Phyllis','Vance',0 );


INSERT INTO levihill.Patient
( patID,firstName,lastName,balance )
VALUES
(1011,'Toby','Flenderson',-1000 );


GRANT SELECT ON levihill.Patient TO PUBLIC;

