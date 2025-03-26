package FlowerShop.Controllers;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class MainController extends HttpServlet {

     private static final String LOGIN = "Login";
     private static final String LOGIN_CONTROLLER = "LoginController";
     private static final String LOGOUT = "Logout";
     private static final String REGISTER = "Register";
     private static final String REGISTER_CONTROLLER = "RegisterController";
     private static final String PRODUCT = "Product";
     private static final String PRODUCT_CONTROLLER = "ProductController";
;

     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
          response.setContentType("text/html;charset=UTF-8");
          String url = "login.jsp";

          try {
               String action = request.getParameter("action");

               if (LOGIN.equals(action)) {
                    url = LOGIN_CONTROLLER;
               } else if (LOGOUT.equals(action)) {
                    url = LOGIN_CONTROLLER;
               } else if (REGISTER.equals(action)) {
                    url = REGISTER_CONTROLLER;
               } else {
                    request.setAttribute("ERROR", "Action not supported.");
               }
          } catch (Exception e) {
               log("Error at MainController: " + e.toString());
          } finally {
               request.getRequestDispatcher(url).forward(request, response);
          }
     }

     @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
          processRequest(request, response);
     }

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
          processRequest(request, response);
     }

     @Override
     public String getServletInfo() {
          return "Main Controller for Cosmetic Ecommerce Management Application";
     }
}
