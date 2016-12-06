<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*,java.lang.StringBuffer,
    java.sql.Connection,java.sql.DriverManager, 
    java.sql.SQLException,java.sql.Statement,
    java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Patient Homepage</title>
</head>
<body>
<div id="searchresult">
<h4>
<%
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");

	//out.write("Patient: " + firstName + " " + lastName);

	//A handle to the connection to the DBMS.

	Connection connection;

	//A handle to the statement.

	Statement statement;

	String username = "lrobbins013";
	String password = "a1106";
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
		out.write("Patient \"" + firstName + " " + lastName + "\" not found.");
	}
	else {
		out.write("Patient: " + qFName + " " + qLName + " <br/> Balance: " + qBalance + " <br/> ");
	}

%> 

</h4>
</div>
</body>
</html>