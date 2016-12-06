<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*,java.lang.StringBuffer,
    java.sql.Connection,java.sql.DriverManager, 
    java.sql.SQLException,java.sql.Statement,
    java.sql.ResultSet,java.sql.ResultSetMetaData"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query</title>
</head>
<body>
<div id="searchresult">
<%
	/*********************************************
	 * Executes an inputed query on the database *
         *********************************************/

	String queryStr = request.getParameter("queryStr");

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

	ResultSet rs = statement.executeQuery(queryStr);
	ResultSetMetaData rsmd = rs.getMetaData();

	out.write("<table><tr>");
	for (int i=1; i <= rsmd.getColumnCount(); i++) {
		out.write("<th>" + rsmd.getColumnName(i) + "</th>");
	}
	out.write("</tr>");

	for(int i=0; rs.next(); i++) {

		out.write("<tr id=\"tablerow_" + i + "\"> ");

		for (int j=1; j <= rsmd.getColumnCount(); j++) {
			out.write("<td>" + rs.getString(rsmd.getColumnName(j)) + "</td> ");
		}
		out.write("</tr>");
	}


	statement.close();
	connection.close();
%>
</div>
</body>
</html>