DROP TRIGGER uponServiceLog;
DROP TRIGGER uponTransaction;
DROP TRIGGER uponPayment;


@sqlFiles/Account
@sqlFiles/Appointment
@sqlFiles/Employee
@sqlFiles/Laboratory
@sqlFiles/Patient
@sqlFiles/Payment
@sqlFiles/Procedure
@sqlFiles/proSup
@sqlFiles/ServiceLog
@sqlFiles/Supplies
@sqlFiles/Transaction

CREATE OR REPLACE TRIGGER uponServiceLog
AFTER INSERT ON Levihill.ServiceLog
REFERENCING NEW AS new
FOR EACH ROW
DECLARE
	vAmount NUMBER;
	vDiscription VARCHAR(30);
	
BEGIN
	SELECT proName INTO vDiscription FROM Levihill.Procedure WHERE proID = :new.proID;
	SELECT cost INTO vAmount FROM Levihill.Procedure WHERE proID = :new.proID;
	INSERT INTO Levihill.Transaction (transID, patID, description, amount) VALUES ((SELECT MAX(transID)+1 FROM Levihill.Transaction), :new.patID, vDiscription, (-1*vAmount));
	
	FOR s IN (SELECT supID FROM Levihill.proSup WHERE proID = :new.proID)
	LOOP
		UPDATE Levihill.Supplies 
		SET qnty = qnty - (SELECT amount FROM Levihill.proSup WHERE proID = :new.proID AND supID = s.supID)
		WHERE supID = s.supID;
		
	END LOOP;
END;	
/

CREATE OR REPLACE TRIGGER uponTransaction
AFTER INSERT ON Levihill.Transaction
REFERENCING NEW AS new
FOR EACH ROW
DECLARE
	vAmount NUMBER;
	
BEGIN
	UPDATE Levihill.Patient 
	SET balance = balance + :new.amount
	WHERE patID = :new.patID;

END;	
/

CREATE OR REPLACE TRIGGER uponPayment
AFTER INSERT ON Levihill.Payment 
REFERENCING NEW AS new
FOR EACH ROW
BEGIN
	INSERT INTO Levihill.Transaction (transID, patID, description, amount) VALUES ((SELECT MAX(transID)+1 FROM Levihill.Transaction), :new.patID, :new.description, :new.total);

END;	
/
