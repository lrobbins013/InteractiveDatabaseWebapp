<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*,java.lang.StringBuffer,
    java.sql.Connection,java.sql.DriverManager, 
    java.sql.SQLException,java.sql.Statement,
    java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Patient Registration</title>
</head>
<body>
<div id="searchresult">
<h4>
<%
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");

	//A handle to the connection to the DBMS.

	Connection connection;

	//A handle to the statement.

	Statement statement;

	String username = "levihill";
	String password = "a3012";
	String connectString = "jdbc:oracle:thin:@aloe.cs.arizona.edu:1521:oracle";


	Class.forName("oracle.jdbc.OracleDriver");
	connection = DriverManager.getConnection(connectString, username, password);
	statement = connection.createStatement();
	ResultSet rs = statement.executeQuery("select * from levihill.Patient where  FIRSTNAME=\'" + firstName + "\'and  LASTNAME=\'" + lastName + "\'");

	String qFName=null, qLName=null, qBalance=null;
	
	while(rs.next()) {
		qFName = rs.getString("FIRSTNAME");
		qLName = rs.getString("LASTNAME");
		qBalance = rs.getString("BALANCE");
	}

	if (qFName == null) {
		statement.executeQuery("INSERT INTO Levihill.Patient (patID, firstName, lastName, balance) " +
                                        "VALUES ((Select MAX(patID)+1  FROM Levihill.Patient), \'" + firstName + "\', \'" + lastName + "\', 0)");
		out.write("Patient \"" + firstName + " " + lastName + "\" successfully registered. <br> ");
	}
	else {
		out.write("Patient \"" + qFName + " " + qLName + "\" already exists. <br> ");
	}

	statement.close();
	connection.close();

%> 

<br>
  <form action="login.html">
    <input type="submit" value="Return to login"/>
  </form>

</h4>
</div>
</body>
</html>