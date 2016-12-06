DROP TABLE levihill.Transaction;

create table levihill.Transaction
( transID number(4) NOT NULL,
patID number(4) NOT NULL,
description varchar2(30) NOT NULL,
amount number(4) NOT NULL );

INSERT INTO levihill.Transaction
( transID,patID,description,amount )
VALUES
(8000,1000,'Cleaning',-50 );


GRANT SELECT ON levihill.Transaction TO PUBLIC;

