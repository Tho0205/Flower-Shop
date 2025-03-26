package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class createProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Create New Product</title>\n");
      out.write("        <style>\n");
      out.write("            form {\n");
      out.write("                max-width: 400px;\n");
      out.write("                margin: 0 auto;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            label {\n");
      out.write("                display: block;\n");
      out.write("                margin-bottom: 8px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input {\n");
      out.write("                width: 100%;\n");
      out.write("                padding: 10px;\n");
      out.write("                margin-bottom: 16px;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            button {\n");
      out.write("                padding: 10px 15px;\n");
      out.write("                border: none;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "adminHeader.jsp", out, true);
      out.write("\n");
      out.write("        <h2 style=\"text-align: center\">Create New Product</h2>\n");
      out.write("        <form action=\"AdminController\" method=\"POST\" enctype=\"multipart/form-data\">\n");
      out.write("            <input type=\"hidden\" name=\"action\" value=\"create\">\n");
      out.write("\n");
      out.write("            <label for=\"Name\">Name:</label>\n");
      out.write("            <input type=\"text\" name=\"productName\" required>\n");
      out.write("\n");
      out.write("            <label for=\"Description\">Description:</label>\n");
      out.write("            <input type=\"text\" name=\"description\" required>\n");
      out.write("\n");
      out.write("            <label for=\"Price\">Price:</label>\n");
      out.write("            <input type=\"number\" step=\"0.01\" name=\"price\" required>\n");
      out.write("\n");
      out.write("            <label for=\"Quantity\">Quantity:</label>\n");
      out.write("            <input type=\"number\" name=\"quantity\" required>\n");
      out.write("\n");
      out.write("            <label for=\"Category\">Category:</label>\n");
      out.write("            <input type=\"number\" name=\"categoryId\" required>\n");
      out.write("\n");
      out.write("            <label for=\"Image\">Upload Image:</label>\n");
      out.write("            <input type=\"file\" name=\"newImage\" accept=\"image/*\" required>\n");
      out.write("\n");
      out.write("            <button type=\"submit\">Create</button>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
