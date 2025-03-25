package FlowerShop.Controllers;

import FlowerShop.DAO.UserDAO;
import FlowerShop.DTO.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        UserDTO user = new UserDTO();
        user.setUsername(username);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        user.setRole("Customer");

        UserDAO userDAO = new UserDAO();

        try {
            int isRegistered = userDAO.insert(user);

            if (isRegistered>0) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("ERROR", "Register Failed");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Registration failed by exception. Please try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
