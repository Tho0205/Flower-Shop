package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import FlowerShop.DTO.ProductDTO;

public final class product_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');

    ProductDTO product = (ProductDTO) request.getAttribute("product");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"vi\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>");
      out.print( product.getProductName() );
      out.write(" - Chi Tiết Sản Phẩm</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n");
      out.write("    <style>\n");
      out.write("        .product-detail {\n");
      out.write("            margin-top: 20px;\n");
      out.write("        }\n");
      out.write("        .product-image {\n");
      out.write("            object-fit: fill;\n");
      out.write("            \n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("        .product-info {\n");
      out.write("            padding-left: 20px;\n");
      out.write("            padding-right: 20px;\n");
      out.write("        }\n");
      out.write("        .product-title {    \n");
      out.write("            font-size: 36px;\n");
      out.write("            margin-bottom: 10px;\n");
      out.write("        }\n");
      out.write("        .product-price {\n");
      out.write("            font-size: 24px;\n");
      out.write("            color: #d9534f;\n");
      out.write("        }\n");
      out.write("        .product-description {\n");
      out.write("            margin-top: 20px;\n");
      out.write("            font-size: 16px;\n");
      out.write("        }\n");
      out.write("        .btn-add-to-cart {\n");
      out.write("            background-color: #e28685;\n");
      out.write("            color: white;\n");
      out.write("            border: none;\n");
      out.write("            padding: 10px 20px;\n");
      out.write("            margin-top: 10px;\n");
      out.write("        }\n");
      out.write("        .btn-add-to-cart:hover {\n");
      out.write("            background-color: #d06564;\n");
      out.write("        }\n");
      out.write("        .quantity-wrapper {\n");
      out.write("            display: flex;\n");
      out.write("            align-items: center;\n");
      out.write("            margin-top: 10px;\n");
      out.write("        }\n");
      out.write("        .quantity-wrapper input {\n");
      out.write("            width: 60px;\n");
      out.write("            margin-right: 10px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/header.jsp", out, true);
      out.write("\n");
      out.write("    <div class=\"container\" style=\"width: 80%; margin: 0 auto;\">\n");
      out.write("        <div class=\"row product-detail\">\n");
      out.write("\n");
      out.write("            <div class=\"col-md-4\">\n");
      out.write("                <div class=\"product-image\">\n");
      out.write("                    <img src=\"images/");
      out.print( product.getImage() );
      out.write("\" alt=\"");
      out.print( product.getProductName() );
      out.write("\" class=\"img-responsive\" style=\" height: 400px; width: 400px; border: 1px solid #ddd; border-radius: 5px;\">\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"col-md-8\">\n");
      out.write("                <div class=\"product-info\">\n");
      out.write("                    <h1 class=\"product-title\">");
      out.print( product.getProductName() );
      out.write("</h1>\n");
      out.write("                    <p class=\"product-price\">Giá: <span>");
      out.print( product.getPrice() );
      out.write("</span> Vnđ</p>\n");
      out.write("                    <p class=\"product-description\">Mô tả sản phẩm <br>\n");
      out.write("                        ");
      out.print( product.getDescription() );
      out.write("</p>\n");
      out.write("                    <div class=\"quantity-wrapper\">\n");
      out.write("                        <label for=\"quantity\">Số lượng:</label>\n");
      out.write("                        <input type=\"number\" id=\"quantity\" name=\"quantity\" value=\"1\" min=\"1\" class=\"form-control\" style=\"width: 60px; height: 40px\">\n");
      out.write("                    </div>\n");
      out.write("                    <form action=\"addToCart\" method=\"post\">\n");
      out.write("                        <input type=\"hidden\" name=\"productId\" value=\"");
      out.print( product.getProductId() );
      out.write("\">\n");
      out.write("                        <button type=\"submit\" class=\"btn-add-to-cart\">Thêm vào giỏ hàng</button>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/footer.jsp", out, true);
      out.write("\n");
      out.write("    <!-- Bootstrap JS -->\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js\"></script>\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\n");
      out.write("</body>\n");
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
