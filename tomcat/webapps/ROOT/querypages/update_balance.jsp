<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*,java.lang.StringBuffer,
    java.sql.Connection,java.sql.DriverManager, 
    java.sql.SQLException,java.sql.Statement,
    java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Payment</title>
</head>
<body>
<div id="searchresult">
<%
	/*****************************************************************
	 * Updates a patient's balance when a payment is being processed *
         *****************************************************************/

	String patID = request.getParameter("patID");
	String amount = request.getParameter("amount");

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

	ResultSet rs = statement.executeQuery("select BALANCE from levihill.patient where PATID=\'" + patID +"\'");
	rs.next();
	int tempBalance = Integer.parseInt(rs.getString("BALANCE"));
	tempBalance -= Integer.parseInt(amount);

	statement.executeQuery("update patient set BALANCE = \'" + tempBalance + "\' where PATID=\'" + patID + "\'");

	out.write("Payment successful. <br/>");
	out.write("<form action=\"/login.jsp\">" +
		  "<input type=\"hidden\" name=\"patID\" value=\"" + patID +"\"/>" +
	          "<input type=\"submit\" value=\"Return to patient home\"/>"+
		  "</form>");

	statement.close();
	connection.close();
%>
</div>
</body>
</html>