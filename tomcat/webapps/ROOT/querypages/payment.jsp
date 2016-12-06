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
<h2>Make a payment<h2/>
<h4>
<div id="searchresult">
  <form action="update_balance.jsp">
    Payment amount ($): 
    <input type="text" name="amount"/> <br/>
    <%
      out.write("<input type=\"hidden\" name=\"patID\" value=\"" + request.getParameter("patID") + "\"/>");
    %>
    <input type="submit" value="Submit"/>
  </form>
</div>
<h4/>
</body>
</html>