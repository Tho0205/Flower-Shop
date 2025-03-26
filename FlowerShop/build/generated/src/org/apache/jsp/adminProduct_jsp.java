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
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
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
      out.write("            .product-image {\n");
      out.write("                width: 50px;\n");
      out.write("                height: 50px;\n");
      out.write("                object-fit: cover;\n");
      out.write("                border: 1px solid #ddd;\n");
      out.write("                border-radius: 5px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "adminHeader.jsp", out, true);
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h2 class=\"text-center\">Product Management</h2>\n");
      out.write("            <div style=\"display: flex; justify-content: flex-start; align-items: center;\">\n");
      out.write("                <form action=\"AdminController\" method=\"GET\" style=\"margin-right: 10px; display: flex; align-items: center;\">\n");
      out.write("                    <input type=\"hidden\" name=\"action\" value=\"search\" />\n");
      out.write("                    <label for=\"keyword\" style=\"margin-right: 5px;\">Name:</label>\n");
      out.write("                    <input type=\"text\" name=\"keyword\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.keyword}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" style=\"margin-right: 5px;\" />\n");
      out.write("                    <button type=\"submit\">Search</button>\n");
      out.write("                </form>  \n");
      out.write("                <form action=\"createProduct.jsp\" method=\"GET\" style=\"display: flex; align-items: center;\">\n");
      out.write("                    <input type=\"hidden\" name=\"action\" value=\"create\" />\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-link\">Create</button>\n");
      out.write("                </form> \n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                \n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-12\">\n");
      out.write("                    <table class=\"table table-bordered\">\n");
      out.write("                        <tr>\n");
      out.write("                            <th>ID</th>\n");
      out.write("                            <th>Image</th>\n");
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
      out.write("                            <td><img class=\"product-image\" src=\"images/");
      out.print( product.getImage() );
      out.write("\" alt=\"");
      out.print( product.getProductName() );
      out.write("\"></td>\n");
      out.write("                            <td>");
      out.print( product.getProductName() );
      out.write("</td>\n");
      out.write("                            <td>\n");
      out.write("                                ");

                                    String description = product.getDescription();
                                    int maxLength = 100;
                                    if (description.length() > maxLength) {
                                        description = description.substring(0, maxLength) + "...";
                                    }
                                
      out.write("\n");
      out.write("                                ");
      out.print( description );
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                            <td>");
      out.print( product.getPrice() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( product.getQuantity() );
      out.write("</td>\n");
      out.write("                            <td>\n");
      out.write("                                ");
 
                                    if (product.getCategory() == 1) { 
                                
      out.write("\n");
      out.write("                                    Hoa chúc mừng\n");
      out.write("                                ");
 
                                    } else if (product.getCategory() == 2) { 
                                
      out.write("\n");
      out.write("                                    Hoa cưới\n");
      out.write("                                ");
 
                                    } else if (product.getCategory() == 3) { 
                                
      out.write("\n");
      out.write("                                    Hoa dịp lễ tình yêu\n");
      out.write("                                ");
 
                                    } else if (product.getCategory() == 4) { 
                                
      out.write("\n");
      out.write("                                    Hoa sự kiện, sinh nhật\n");
      out.write("                                ");
 
                                    } else if (product.getCategory() == 5) { 
                                
      out.write("\n");
      out.write("                                    Hoa tang lễ\n");
      out.write("                                ");
 
                                    } else if (product.getCategory() == 6) { 
                                
      out.write("\n");
      out.write("                                    Hoa tết\n");
      out.write("                                ");
 
                                    } else if (product.getCategory() == 7) { 
                                
      out.write("\n");
      out.write("                                    Hoa trang trí\n");
      out.write("                                ");
 
                                    } else { 
                                
      out.write("\n");
      out.write("                                    Unknown\n");
      out.write("                                ");
 
                                    } 
                                
      out.write("\n");
      out.write("                            </td>\n");
      out.write(" \n");
      out.write("                            <td>\n");
      out.write("                                <div style=\"display: flex; gap: 10px;\">\n");
      out.write("                                    <form action=\"AdminController\" method=\"POST\" style=\"margin: 0;\">\n");
      out.write("                                        <input name=\"action\" value=\"delete\" type=\"hidden\">\n");
      out.write("                                        <input name=\"productId\" value=\"");
      out.print( product.getProductId() );
      out.write("\" type=\"hidden\">\n");
      out.write("                                        <input type=\"submit\" value=\"Delete\" class=\"btn btn-danger\">\n");
      out.write("                                    </form>\n");
      out.write("                                    <form action=\"editProduct.jsp\" method=\"POST\" style=\"margin: 0;\">\n");
      out.write("                                        <input type=\"hidden\" name=\"productId\" value=\"");
      out.print( product.getProductId() );
      out.write("\">\n");
      out.write("                                        <input type=\"hidden\" name=\"productName\" value=\"");
      out.print( product.getProductName() );
      out.write("\">\n");
      out.write("                                        <input type=\"hidden\" name=\"description\" value=\"");
      out.print( product.getDescription() );
      out.write("\">\n");
      out.write("                                        <input type=\"hidden\" name=\"price\" value=\"");
      out.print( product.getPrice() );
      out.write("\">\n");
      out.write("                                        <input type=\"hidden\" name=\"quantity\" value=\"");
      out.print( product.getQuantity() );
      out.write("\">\n");
      out.write("                                        <input type=\"hidden\" name=\"categoryId\" value=\"");
      out.print( product.getCategory() );
      out.write("\">\n");
      out.write("                                        <input type=\"hidden\" name=\"image\" value=\"");
      out.print( product.getImage() );
      out.write("\">\n");
      out.write("                                        <input type=\"submit\" value=\"Edit\" class=\"btn btn-info\">\n");
      out.write("                                    </form>\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </td>\n");
      out.write("\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                                }
                            } else {
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"8\" style=\"text-align:center;\">No products available</td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div>   \n");
      out.write("                <div class=\"col-md-12 text-center\">\n");
      out.write("                    <nav arial-label=\"Page navigation\">\n");
      out.write("                        <ul class=\"pagination\">\n");
      out.write("                            ");

                                int currentPage = (int) request.getAttribute("currentPage");
                                int totalPages = (int) request.getAttribute("totalPages");
                                if (currentPage > 1) {
                            
      out.write("\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"AdminController?action=listProduct&page=");
      out.print( currentPage - 1 );
      out.write("\" aria-label=\"Previous\">\n");
      out.write("                                    <span aria-hidden=\"true\">&laquo; Previous</span>\n");
      out.write("                                </a>\n");
      out.write("                            </li>\n");
      out.write("                            ");

                                }
                                for (int i = 1; i <= totalPages; i++) {
                            
      out.write("\n");
      out.write("                            <li class=\"");
      out.print( (i == currentPage) ? "active" : "" );
      out.write("\">\n");
      out.write("                                <a href=\"AdminController?action=listProduct&page=");
      out.print( i );
      out.write('"');
      out.write('>');
      out.print( i );
      out.write("</a>\n");
      out.write("                            </li>\n");
      out.write("                            ");

                                }
                                if (currentPage < totalPages) {
                            
      out.write("\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"AdminController?action=listProduct&page=");
      out.print( currentPage + 1 );
      out.write("\" aria-label=\"Next\">\n");
      out.write("                                    <span aria-hidden=\"true\">Next &raquo;</span>\n");
      out.write("                                </a>\n");
      out.write("                            </li>\n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("                        </ul>\n");
      out.write("                    </nav>\n");
      out.write("                    \n");
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
