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

	//Parameter given if returning from appointment scheduling
	String patID = request.getParameter("patID");

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
	ResultSet rs = null;

	if (firstName != null) {
		rs = statement.executeQuery("select * from levihill.Patient where  FIRSTNAME=\'" + firstName + "\' " + 
                                                      "and  LASTNAME=\'" + lastName + "\'");
	}
	else {
		rs = statement.executeQuery("select * from levihill.Patient where  PATID=\'" + patID + "\'");
	}

	String qPatID=null, qFName=null, qLName=null, qBalance=null;
	
	while(rs.next()) {
		qPatID = rs.getString("PATID");
		qFName = rs.getString("FIRSTNAME");
		qLName = rs.getString("LASTNAME");
		qBalance = rs.getString("BALANCE");
	}

	if (qFName == null) {
		out.write("Patient \"" + firstName + " " + lastName + "\" not found.");
	}
	else {
		out.write("Patient: " + qFName + " " + qLName + " <br/> Balance: $" + qBalance + " <br/> ");
	}

	statement.close();
	connection.close();
	
%> 
<br>
<%
	if (qFName != null) {
		out.write("<form action=\"appointment.jsp\">"+
				"<input type=\"hidden\" name=\"patID\" value=\"" + qPatID + "\"/>" +
			   	"<input type=\"submit\" value=\"Schedule an appointment\"/>"+
			   "</form>");
		out.write("<form action=\"/querypages/current_appointments.jsp\">"+
				"<input type=\"hidden\" name=\"patID\" value=\"" + qPatID + "\"/>" +
			   	"<input type=\"submit\" value=\"Check current appointments\"/>"+
			   "</form>");
		out.write("<form action=\"/querypages/cancellation.jsp\">"+
				"<input type=\"hidden\" name=\"patID\" value=\"" + qPatID + "\"/>" +
			   	"<input type=\"submit\" value=\"Cancel an appointment\"/>"+
			   "</form>");
		out.write("<form action=\"/querypages/payment.jsp\">"+
				"<input type=\"hidden\" name=\"patID\" value=\"" + qPatID + "\"/>" +
			   	"<input type=\"submit\" value=\"Make a payment\"/>"+
			   "</form>");
		out.write("<form action=\"/querypages/transaction_history.jsp\">"+
				"<input type=\"hidden\" name=\"patID\" value=\"" + qPatID + "\"/>" +
			   	"<input type=\"submit\" value=\"View Transaction History\"/>"+
			   "</form>");
		out.write("<form action=\"service.jsp\">"+
				"<input type=\"hidden\" name=\"patID\" value=\"" + qPatID + "\"/>" +
			   	"<input type=\"submit\" value=\"Service information\"/>"+
			   "</form>");
		out.write("<form action=\"index.html\">"+
			   	"<input type=\"submit\" value=\"Logout\"/>"+
			   "</form>");
	}
%>
</h4>
</div>
</body>
</html>