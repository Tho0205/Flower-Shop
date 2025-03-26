package FlowerShop.Controllers;

import FlowerShop.DAO.UserDAO;
import FlowerShop.DTO.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          String username = request.getParameter("username");
          String password = request.getParameter("password");
          String rememberMe = request.getParameter("rememberMe");

          UserDAO userDAO = new UserDAO();

          try {
               UserDTO user = userDAO.login(username, password);

               if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", user.getUsername());
                    session.setAttribute("role", user.getRole()); // Lưu role vào session

                    if ("on".equals(rememberMe)) {
                         Cookie userCookie = new Cookie("username", username);
                         userCookie.setMaxAge(60 * 60 * 24); 
                         response.addCookie(userCookie);

                         Cookie passwordCookie = new Cookie("password", password);
                         passwordCookie.setMaxAge(60 * 60 * 24); 
                         response.addCookie(passwordCookie);

                         Cookie rememberMeCookie = new Cookie("rememberMe", "on");
                         rememberMeCookie.setMaxAge(60 * 60 * 24); 
                         response.addCookie(rememberMeCookie);
                    } else {
                         Cookie userCookie = new Cookie("username", "");
                         userCookie.setMaxAge(0);
                         response.addCookie(userCookie);

                         Cookie passwordCookie = new Cookie("password", "");
                         passwordCookie.setMaxAge(0);
                         response.addCookie(passwordCookie);

                         Cookie rememberMeCookie = new Cookie("rememberMe", "");
                         rememberMeCookie.setMaxAge(0);
                         response.addCookie(rememberMeCookie);
                    }

                    if ("Owner".equals(user.getRole()) || "Staff".equals(user.getRole())) {
                         response.sendRedirect("AdminController?action=listProduct");
                    } else {
                         response.sendRedirect("ProductController?action=list");
                    }

               } else {
                    request.setAttribute("ERROR", "Incorrect Username or Password.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
               }
          } catch (Exception e) {
               e.printStackTrace();
               request.setAttribute("ERROR", "Login failed. Please try again.");
               request.getRequestDispatcher("login.jsp").forward(request, response);
          }
     }

     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          HttpSession session = request.getSession(false);
          if (session != null) {
               session.invalidate();
               System.out.println("User logged out successfully.");
          }
          response.sendRedirect("login.jsp");
     }
}
