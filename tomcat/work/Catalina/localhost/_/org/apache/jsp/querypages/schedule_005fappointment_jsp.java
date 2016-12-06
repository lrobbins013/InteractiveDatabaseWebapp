package org.apache.jsp.querypages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.StringBuffer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public final class schedule_005fappointment_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = JspFactory.getDefaultFactory().getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<title>Appointment Scheduling</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div id=\"searchresult\">\n");
      out.write("<h4>\n");

	/***************************************************************************************
	 * Books an appointment for the patient if they are not already book for that day/time *
         ***************************************************************************************/


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

	
	if (rs.next()) {
		out.write("Patient already scheduled for an appointment at that time. <br/>");
	}
	else {
			//Insert new appointment
		statement.executeQuery("INSERT INTO levihill.appointment (APPID, PATID, DAY, TIME) " +
					"VALUES ((Select MAX(APPID)+1  FROM Levihill.appointment), \'" + patID + "\', " +
							"\'" + date + "\', \'" + time + "\')");

		out.write("Procedure successfully scheduled. <br/> " + 
			  "<form action=\"/login.jsp\">" +
			  "<input type=\"hidden\" name=\"patID\" value=\"" + patID +"\"/>" +
			  "<input type=\"submit\" value=\"Return to patient home\"/>"+
			  "</form>");

	}

	statement.close();
	connection.close();
	

      out.write(" \n");
      out.write("</h4>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
