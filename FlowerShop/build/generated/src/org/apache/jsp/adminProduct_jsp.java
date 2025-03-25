package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import FlowerShop.DTO.ProductDTO;
import java.util.List;

public final class adminProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"vi\">\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Product Manager</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n");
      out.write("        <style>\n");
      out.write("            .container {\n");
      out.write("                width: 80%;\n");
      out.write("                margin: auto;\n");
      out.write("            }\n");
      out.write("            .table {\n");
      out.write("                margin-top: 20px;\n");
      out.write("            }\n");
      out.write("            th, td {\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            .action-btn {\n");
      out.write("                background-color: #d9534f;\n");
      out.write("                color: white;\n");
      out.write("                border: none;\n");
      out.write("                padding: 5px 10px;\n");
      out.write("                cursor: pointer;\n");
      out.write("                border-radius: 5px;\n");
      out.write("            }\n");
      out.write("            .row {\n");
      out.write("                margin-right: -10px;\n");
      out.write("                margin-left: -10px;\n");
      out.write("            }\n");
      out.write("            .col {\n");
      out.write("                padding-right: 10px;\n");
      out.write("                padding-left: 10px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "adminHeader.jsp", out, true);
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h2 class=\"text-center\">Product Management</h2>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-12\">\n");
      out.write("                    <table class=\"table table-bordered\">\n");
      out.write("                        <tr>\n");
      out.write("                            <th>ID</th>\n");
      out.write("                            <th>Name</th>\n");
      out.write("                            <th>Description</th>\n");
      out.write("                            <th>Price</th>\n");
      out.write("                            <th>Quantity</th>\n");
      out.write("                            <th>Category</th>\n");
      out.write("                            <th>Action</th>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                            List<ProductDTO> list = (List<ProductDTO>) request.getAttribute("productListAll");
                            if (list != null && !list.isEmpty()) {
                                for (ProductDTO product : list) {
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>");
      out.print( product.getProductId() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( product.getProductName() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( product.getDescription() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( product.getPrice() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( product.getQuantity() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( product.getCategory() );
      out.write("</td> \n");
      out.write("                            <td>\n");
      out.write("                                <form action=\"\" method=\"POST\">\n");
      out.write("                                    <input name=\"action\" value=\"delete\" type=\"hidden\">\n");
      out.write("                                    <input name=\"id\" value=\"");
      out.print( product.getProductId() );
      out.write("\" type=\"hidden\">\n");
      out.write("                                    <input type=\"submit\" value=\"Delete\" class=\"action-btn\">\n");
      out.write("                                </form>\n");
      out.write("                                <form action=\"\" method=\"POST\">\n");
      out.write("                                    <input name=\"action\" value=\"edit\" type=\"hidden\">\n");
      out.write("                                    <input name=\"id\" value=\"");
      out.print( product.getProductId() );
      out.write("\" type=\"hidden\">\n");
      out.write("                                    <input type=\"submit\" value=\"Edit\" class=\"action-btn\">\n");
      out.write("                                </form>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                                }
                            } else {
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"7\" style=\"text-align:center;\">No products available</td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\n");
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
