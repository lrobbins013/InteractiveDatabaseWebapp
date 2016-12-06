DROP TABLE levihill.Account;

create table levihill.Account
( acctID number(4) NOT NULL,
patID number(4) NOT NULL,
balance number(4) NOT NULL );

INSERT INTO levihill.Account
( acctID,patID,balance )
VALUES
(5000,1000,0 );


INSERT INTO levihill.Account
( acctID,patID,balance )
VALUES
(5001,1002,0 );


INSERT INTO levihill.Account
( acctID,patID,balance )
VALUES
(5001,1003,0 );


INSERT INTO levihill.Account
( acctID,patID,balance )
VALUES
(5002,1001,0 );


INSERT INTO levihill.Account
( acctID,patID,balance )
VALUES
(5003,1004,0 );


INSERT INTO levihill.Account
( acctID,patID,balance )
VALUES
(5004,1008,0 );


INSERT INTO levihill.Account
( acctID,patID,balance )
VALUES
(5005,1009,0 );


INSERT INTO levihill.Account
( acctID,patID,balance )
VALUES
(5006,1005,0 );


INSERT INTO levihill.Account
( acctID,patID,balance )
VALUES
(5007,1006,0 );


INSERT INTO levihill.Account
( acctID,patID,balance )
VALUES
(5008,1010,0 );


INSERT INTO levihill.Account
( acctID,patID,balance )
VALUES
(5009,1007,0 );


INSERT INTO levihill.Account
( acctID,patID,balance )
VALUES
(5010,1011,-1000 );


GRANT SELECT ON levihill.Account TO PUBLIC;

