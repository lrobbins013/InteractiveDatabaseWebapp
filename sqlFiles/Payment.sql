DROP TABLE levihill.Payment;

create table levihill.Payment
( patID number(4) NOT NULL,
description varchar2(30) NOT NULL,
total number(4) NOT NULL );

INSERT INTO levihill.Payment
( patID,description,total )
VALUES
(1000,'Credit_Card',50 );


GRANT SELECT ON levihill.Payment TO PUBLIC;

