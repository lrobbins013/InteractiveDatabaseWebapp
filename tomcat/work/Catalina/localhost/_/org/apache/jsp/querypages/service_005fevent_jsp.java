package org.apache.jsp.querypages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class service_005fevent_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n");
      out.write("    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("<title>Appointment Scheduling</title>\n");
      out.write("<meta http-equiv=\"Content-type\" content=\"text/html;charset=UTF-8\" />\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div align=\"left\">\n");
      out.write("  <h2>Submit a Service Event</h2> \n");
      out.write("   \n");
      out.write("  <form action=\"servicelog.jsp\"> \n");
      out.write("    Procedure:\n");
      out.write("    <select name=\"proID\">\n");
      out.write("      <option value=\"2000\">Cleaning</option>\n");
      out.write("      <option value=\"2001\">Floride Treatment</option>\n");
      out.write("      <option value=\"2002\">Filling</option>\n");
      out.write("      <option value=\"2003\">Root Canal</option>\n");
      out.write("      <option value=\"2004\">Dental Crown</option>\n");
      out.write("      <option value=\"2005\">Tooth Implant</option>\n");
      out.write("      <option value=\"2006\">Tooth Removal</option>\n");
      out.write("      <option value=\"2007\">Teeth Whitening</option>\n");
      out.write("      <option value=\"2008\">Xray</option>\n");
      out.write("      <option value=\"2009\">Retainer</option>\n");
      out.write("    </select>\n");
      out.write("    <br/>\n");
      out.write("\n");
      out.write("    Employee:\n");
      out.write("    <select name=\"empID\">\n");
      out.write("      <option value=\"7000\">David Wallis</option>\n");
      out.write("      <option value=\"7001\">Jan Levinson</option>\n");
      out.write("      <option value=\"7002\">Robert California</option>\n");
      out.write("    </select> \n");
      out.write("    <br/>\n");
      out.write("\n");
      out.write("    ");

      out.write("<input type=\"hidden\" name=\"patID\" value=\"" + request.getParameter("patID") + "\"/>");
    
      out.write("\n");
      out.write("    <input type=\"submit\" value=\"Submit\"/>\n");
      out.write("  </form>\n");
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
