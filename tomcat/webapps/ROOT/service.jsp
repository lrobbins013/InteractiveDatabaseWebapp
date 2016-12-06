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

  <form action="querypages/servicelog.jsp">
    Procedure:
    <select name="proID">
      <option value="2000">Cleaning</option>
      <option value="2001">Floride Treatment</option>
      <option value="2002">Filling</option>
      <option value="2003">Root Canal</option>
      <option value="2004">Dental Crown</option>
      <option value="2005">Tooth Implant</option>
      <option value="2006">Tooth Removal</option>
      <option value="2007">Teeth Whitening</option>
      <option value="2008">Xray</option>
      <option value="2009">Retainer</option>
    </select>
    <br/>

    Employee:
    <select name="empID">
      <option value="7000">David Wallis</option>
      <option value="7001">Jan Levinson</option>
      <option value="7002">Robert California</option>
    </select> 
    <br/>
    <%
      out.write("<input type=\"hidden\" name=\"patID\" value=\"" + request.getParameter("patID") + "\"/>");
    %>
    <input type="submit" value="Submit Service Event">
  </form>
</div>
</body>
</html>