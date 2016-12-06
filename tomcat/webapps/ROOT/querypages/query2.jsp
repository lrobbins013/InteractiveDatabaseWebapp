<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*,java.lang.StringBuffer,
    dbController.DatabaseController" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query 2</title>
</head>
<body>
<div id="searchresult">
<h4>
<%
	String name = request.getParameter("q2Info1");
	
	String option = request.getParameter("q2Info2");

	out.write("Name: " + name + "<br/> option: " + option);
%> 

</h4>
</div>
</body>
</html>
