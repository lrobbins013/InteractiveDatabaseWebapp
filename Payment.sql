DROP TABLE levihill.Payment;

create table levihill.Payment
( patID number(4) NOT NULL,
billingInfo varchar2(30) NOT NULL,
cardNum number(4) NOT NULL );

GRANT SELECT ON levihill.Payment TO PUBLIC;

