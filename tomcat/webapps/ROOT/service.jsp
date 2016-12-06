<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Service Information</title>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
</head>
<body>
<div align="left">
  <h2>Service Information</h2> 

  <form action="querypages/supplies.jsp">
    <input type="submit" value="Supplies list">
    <%
      out.write("<input type=\"hidden\" name=\"patID\" value=\"" + request.getParameter("patID") + "\"/>");
    %>
  </form>
  <br>

  <form action="querypages/procedure.jsp">
    <input type="submit" value="Available Procedures">
    <%
      out.write("<input type=\"hidden\" name=\"patID\" value=\"" + request.getParameter("patID") + "\"/>");
    %>
  </form>
  <br/>

  <form action="querypages/service_event.jsp">
    <input type="submit" value="Submit Service Event">
    <%
      out.write("<input type=\"hidden\" name=\"patID\" value=\"" + request.getParameter("patID") + "\"/>");
    %>
  </form>
</div>
</body>
</html>