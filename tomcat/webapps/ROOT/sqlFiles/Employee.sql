DROP TABLE levihill.Employee;

create table levihill.Employee
( empID number(4) NOT NULL,
empName varchar2(30) NOT NULL,
Job varchar2(30) NOT NULL,
yearsEmployed number(4) NOT NULL );

INSERT INTO levihill.Employee
( empID,empName,Job,yearsEmployed )
VALUES
(7000,'David_Wallis','Dentist',5 );


INSERT INTO levihill.Employee
( empID,empName,Job,yearsEmployed )
VALUES
(7001,'Jan_Levinson','Dental_Hygienist',3 );


INSERT INTO levihill.Employee
( empID,empName,Job,yearsEmployed )
VALUES
(7002,'Robert_California','Dental_Hygienist',1 );


GRANT SELECT ON levihill.Employee TO PUBLIC;

