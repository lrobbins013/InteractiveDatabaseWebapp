<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*,java.lang.StringBuffer,
    java.sql.Connection,java.sql.DriverManager, 
    java.sql.SQLException,java.sql.Statement,
    java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Current Appointments</title>
</head>
<body>
<div id="searchresult">
<%
	/**********************************************************************
	 * Returns a table representation of the patients booked appointments.*
         **********************************************************************/

	String patID = request.getParameter("patID");

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
	ResultSet rs = statement.executeQuery("select APPID, DAY, TIME from levihill.appointment where PATID=\'" + patID +"\'");

	out.write("<table><tr><th>Appointment ID</th><th>Day</th><th>Time</th></tr>");

	int i = 0;	

	while(rs.next()) {
		out.write("<tr id=\"tablerow_" + i + "\"> "+
			  "<td>" + rs.getString("APPID") + "</b></a></td> "+
			  "<td>" + rs.getString("DAY") + "</b></a></td> "+
			  "<td>" + rs.getString("TIME") + "</td> "+
			  "</tr>");
		i++;
	}

	statement.close();
	connection.close();
%>
</div>
</body>
</html>