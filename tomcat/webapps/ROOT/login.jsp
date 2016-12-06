<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*,java.lang.StringBuffer,
    dbController.DatabaseController" %>
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

	out.write("Patient: " + firstName + " " + lastName);
%> 

</h4>
</div>
</body>
</html>