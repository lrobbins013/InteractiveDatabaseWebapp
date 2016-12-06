DROP TABLE levihill.Appointment;

create table levihill.Appointment
( appID number(4) NOT NULL,
patID number(4) NOT NULL,
day number(4) NOT NULL,
time number(4) NOT NULL );

INSERT INTO levihill.Appointment
( appID,patID,day,time )
VALUES
(6000,1000,1206,12 );


INSERT INTO levihill.Appointment
( appID,patID,day,time )
VALUES
(6001,1001,1206,2 );


INSERT INTO levihill.Appointment
( appID,patID,day,time )
VALUES
(6002,1002,1207,10 );


GRANT SELECT ON levihill.Appointment TO PUBLIC;

