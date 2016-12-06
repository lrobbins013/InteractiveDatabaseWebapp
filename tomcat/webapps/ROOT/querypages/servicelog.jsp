<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*,java.lang.StringBuffer,
    java.sql.Connection,java.sql.DriverManager, 
    java.sql.SQLException,java.sql.Statement,
    java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Appointment Scheduling</title>
</head>
<body>
<div id="searchresult">
<h4>
<%
	/*********************************************************************
	 * Submits a service event (a patient came in for their appointment) *
         *********************************************************************/

	String patID = request.getParameter("patID");
	String empID = request.getParameter("empID");
	String proID = request.getParameter("proID");

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
	ResultSet rs = null;

		//Insert new serviceLog entry
	statement.executeQuery("INSERT INTO levihill.ServiceLog (SERVID, PATID, PROID, EMPID) " +
				"VALUES ((Select MAX(SERVID)+1  FROM Levihill.ServiceLog), \'" + patID + "\', " +
					"\'" + proID + "\', \'" + empID + "\')");

	out.write("Service event successfully logged. <br/> " + 
			"<form action=\"/login.jsp\">" +
			"<input type=\"hidden\" name=\"patID\" value=\"" + patID +"\"/>" +
			"<input type=\"submit\" value=\"Return to patient home\"/>"+
			"</form>");


	statement.close();
	connection.close();
	
%> 
</h4>
</div>
</body>
</html>