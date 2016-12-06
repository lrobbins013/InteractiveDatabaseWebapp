DROP TABLE levihill.Supplies;

create table levihill.Supplies
( supID number(4) NOT NULL,
labID number(4) NOT NULL,
supName varchar2(30) NOT NULL,
qnty number(4) NOT NULL );

INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4000,3000,'Tooth_Brush',50 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4001,3000,'Floss',50 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4002,3000,'Disposable_Water_Spout',50 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4003,3000,'Disposable_Air_Spout',50 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4004,3000,'Tooth_Paste_',50 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4005,3000,'Floride',30 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4006,3000,'ToothFilling',30 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4007,3000,'Numbing_Paste',30 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4008,3000,'Tooth_Glue',30 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4009,3000,'Tooth_Cap',30 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4010,3000,'Tooth_Pliers',10 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4011,3000,'Tooth_Drill_Bit',10 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4012,3000,'Tooth_Smoother',10 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4013,3000,'Tooth_Whitening__Gel',5 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4014,3000,'Tooth_Mold_Paste',10 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4015,3001,'Fabricated_Tooth',5 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4016,3001,'Fabricated_Crown',10 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4017,3002,'X-Ray_Film',20 );


INSERT INTO levihill.Supplies
( supID,labID,supName,qnty )
VALUES
(4018,3003,'Retainer',10 );


GRANT SELECT ON levihill.Supplies TO PUBLIC;

