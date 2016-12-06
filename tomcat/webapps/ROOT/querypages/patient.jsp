<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*,java.lang.StringBuffer,
    java.sql.Connection,java.sql.DriverManager, 
    java.sql.SQLException,java.sql.Statement,
    java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Patient List</title>
</head>
<body>
<div id="searchresult">
<%
	/**********************************************************
	 * Returns a table representation of the patient relation *
         **********************************************************/

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
	ResultSet rs = statement.executeQuery("select * from levihill.Patient");

	out.write("<table><tr><th>PATID</th><th>FirstName</th><th>LastName</th>" +
   		  "<th>Balance</th></tr>");

	String qFName=null, qLName=null, qBalance=null;
	int i = 0;	

	while(rs.next()) {
		out.write("<tr id=\"tablerow_" + i + "\"> "+
			  "<td>" + rs.getString("PATID") + "</b></a></td> "+
			  "<td>" + rs.getString("FIRSTNAME") + "</b></a></td> "+
			  "<td>" + rs.getString("LASTNAME") + "</td> "+
			  "<td>" + rs.getString("BALANCE") + "</td> "+
			  "</tr>");
		i++;
	}

	statement.close();
	connection.close();
%>
</div>
</body>
</html>