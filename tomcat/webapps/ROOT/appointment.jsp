<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Appointment Scheduling</title>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
</head>
<body>
<div align="left">
  <h2>Schedule an Appointment</h2> 
   
  <form action="querypages/schedule_appointment.jsp"> 

    Date(mmdd): <input type="text" name="date"/> <br/>
    Time(hh): <input type="text" name="time"/> <br/>

    <%
      String patID = request.getParameter("patID");
      out.write("<input type=\"hidden\" name=\"patID\" value=\"" + patID + "\"/>");
    %>

    <input type="submit" value="Submit"/>
  </form>
</div>
</body>
</html>