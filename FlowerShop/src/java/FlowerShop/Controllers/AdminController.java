/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FlowerShop.Controllers;

import FlowerShop.DAO.ProductDAO;
import FlowerShop.DAO.UserDAO;
import FlowerShop.DTO.ProductDTO;
import FlowerShop.DTO.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author tho02
 */
public class AdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        ProductDAO productDAO = new ProductDAO();
        if (action == null || action.equals("listProduct")) {
            int currentPage = 1;
            int recordsPerPage = 15;
            
            String page = request.getParameter("page");
            if (page != null) {
                currentPage = Integer.parseInt(page);
            }
            List<ProductDTO> productList = productDAO.list(currentPage, recordsPerPage);
            int totalRecords = productDAO.getTotalProducts();
            int totalPages = (int)Math.ceil((double)totalRecords/recordsPerPage);
            request.setAttribute("productListAll", productList);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminProduct.jsp");
            dispatcher.forward(request, response);
        }else if (action.equals("search")){
            String keyword = request.getParameter("keyword");
            List<ProductDTO> productList = productDAO.SearchByKeyword(keyword);
            request.setAttribute("productListAll", productList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminProduct.jsp");
            dispatcher.forward(request, response);
        }else if(action.equals("delete")){
            int productId = Integer.parseInt(request.getParameter("productId"));
            boolean result =  productDAO.delete(productId);
            if (result) {
                response.sendRedirect("AdminController?action=listProduct");
            }
        }else if (action.equals("edit")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            
            Part newImagePart = request.getPart("newImage");
            String newImageName = newImagePart.getSubmittedFileName();
            if (!newImageName.isEmpty()) {
                String imagePath = getServletContext().getRealPath("/images/") + newImageName;
                newImagePart.write(imagePath);
            } else {
                newImageName = request.getParameter("currentImage");
            }
            productDAO.update(productId, productName, description, price, quantity, categoryId, newImageName);
            response.sendRedirect("AdminController?action=listProduct");
        }else if ("create".equals(action)) {
                String productName = request.getParameter("productName");
                String description = request.getParameter("description");
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));


                Part newImagePart = request.getPart("newImage");
                String newImageName = newImagePart.getSubmittedFileName();
                String imagePath = getServletContext().getRealPath("/images/") + newImageName;

                if (newImagePart.getSize() > 0) {
                    newImagePart.write(imagePath);
                    System.out.println("Image saved successfully!");
                }
                productDAO.create(productName, description, price, quantity, categoryId, newImageName);
                response.sendRedirect("AdminController?action=listProduct");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action != null && action.equals("editProduct")) {
            Integer productId = Integer.parseInt(request.getParameter("productId"));
            ProductDAO dao = new ProductDAO();
            ProductDTO product = dao.load(productId);
            request.setAttribute("product", product);
            request.getRequestDispatcher("editProduct.jsp").forward(request, response);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
