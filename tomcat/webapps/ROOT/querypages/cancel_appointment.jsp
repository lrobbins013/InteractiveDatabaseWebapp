<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*,java.lang.StringBuffer,
    java.sql.Connection,java.sql.DriverManager, 
    java.sql.SQLException,java.sql.Statement,
    java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cancellation</title>
</head>
<body>
<div id="searchresult">
<h4>
<%
	/*******************************************************************************
	 * Cancels an appointment for the patient if they are booked for that day/time *
         *******************************************************************************/


	String patID = request.getParameter("patID");
	String date = request.getParameter("date");
	String time = request.getParameter("time");


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

	ResultSet rs = statement.executeQuery("select APPID from levihill.appointment where DAY=\'" + date +"\' " +
					         "and TIME=\'" + time +"\' " +
                                                 "and PATID=\'" + patID + "\'");

	
	if (!rs.next()) {
		out.write("Could not find an appointment scheduled at that day and time. <br/>");
	}
	else {
			//Insert new appointment
		statement.executeQuery("delete from levihill.appointment " +
					"where PATID=\'" + patID + "\' " +
					  "and DAY=\'" + date + "\' " +
					  "and TIME=\'" + time + "\' ");

		out.write("Procedure successfully cancelled. <br/> " + 
			  "<form action=\"/login.jsp\">" +
			  "<input type=\"hidden\" name=\"patID\" value=\"" + patID +"\"/>" +
			  "<input type=\"submit\" value=\"Return to patient home\"/>"+
			  "</form>");

	}

	statement.close();
	connection.close();
	
%> 
</h4>
</div>
</body>
</html>