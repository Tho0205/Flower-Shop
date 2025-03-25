<%@page import="java.util.Arrays"%>
<%@page import="FlowerShop.DTO.CategoryDTO"%>
<%@page import="FlowerShop.DAO.CategoryDAO"%>
<%@page import="java.util.List" %>
<%@page import="FlowerShop.DAO.ProductDAO" %>
<%@page import="FlowerShop.DTO.ProductDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat, java.util.Locale" %>

<%
     int curentPage = 1;
     int recordsPerPage = 8;
     if (request.getParameter("page") != null) {
          curentPage = Integer.parseInt(request.getParameter("page"));
     }

     double minPrice = 0, maxPrice = 1000000;
     if (request.getParameter("minPrice") != null && request.getParameter("maxPrice") != null) {
          minPrice = Double.parseDouble(request.getParameter("minPrice"));
          maxPrice = Double.parseDouble(request.getParameter("maxPrice"));
     }

     int categoryId = 0;

     try {
          if (request.getParameter("categoryId") != null) {
               categoryId = Integer.parseInt(request.getParameter("categoryId"));
          }
     } catch (NumberFormatException e) {
          e.printStackTrace();
     }

     String sort = "asc";
     if (request.getParameter("sort") != null) {
          sort = request.getParameter("sort");
     }

     ProductDAO productDAO = new ProductDAO();
     List<ProductDTO> products = productDAO.listFiltered(minPrice, maxPrice, categoryId, recordsPerPage, (curentPage - 1) * recordsPerPage, sort);
     int totalProducts = productDAO.getTotalProducts();
     int totalPages = (int) Math.ceil((double) totalProducts / recordsPerPage);
      NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
%>
<html>
     <head>
          <title>Danh sách sản phẩm</title>
          <style>
               body {
                    padding: 50px 0px 0px 20px;
               }
               .product-container {
                    display: grid;
                    grid-template-columns: repeat(4, 1fr);
                    gap: 20px;
                    padding: 20px;
               }
               .product {
                    width: 250px;
                    border: 1px solid #ccc;
                    padding: 10px;
                    text-align: center;
                    background: #f9f9f9;
                    border-radius: 20px;
                    transition: transform 0.1s ease-in-out;
               }
               .product:hover {
                    transform: scale(1.05);
               }
               .pagination {
                    margin-top: 20px;
                    text-align: center;
               }
               .pagination a {
                    margin: 0 5px;
                    padding: 5px 10px;
                    border: 1px solid #000;
                    text-decoration: none;
               }
               .filter-container {
                    width: 250px;                    
                    text-align: center;
               }
               .title-category {
                    font-size: 25px;
                    font-weight: bold;
                    display: flex;
                    align-self: flex-start;
                    margin-bottom: 10px;
               }

               .category-list {
                    display: flex;
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 8px;
               }

               /* Từng mục danh mục */
               .category-item {
                    display: flex;
                    align-items: center;
                    gap: 25px; 
                    width: 100%;
               }
               /* Ẩn checkbox mặc định */
               input[type="checkbox"] {
                    appearance: none; 
                    -webkit-appearance: none;
                    -moz-appearance: none;
                    width: 15px;
                    height: 15px;
                    border: 2px solid #000000;
                    border-radius: 50%; /* Làm tròn */
                    display: inline-block;
                    position: relative;
                    cursor: pointer;
                    transition: all 0.3s ease-in-out;
               }

               /* Khi checkbox được chọn */
               input[type="checkbox"]:checked {
                    border: 2px solid #007bff;
               }

               ul {
                    padding-inline-start: 0px;
               }
               /* Hiệu ứng dấu chấm bên trong khi chọn */
               input[type="checkbox"]:checked::before {
                    content: "";
                    width: 10px;
                    height: 10px;
                    background: aqua;
                    border-radius: 50%;
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
               }
               .layout {
                    display: flex;
               }
               .price {
                    display: flex;
                    font-size: 20px;
                    align-content: flex-start;
                    margin-bottom: 10;
               }
               input.price {
                    width:240px;
                    border-radius: 10px;
                    padding-left: 10px;
                    border: 1px solid black;
               }
               button {
                    background-color: greenyellow;
                    width: 150px;
                    height: 50px;
                    border-radius: 50px;
                    border: 2px solid #000;
                    font-size: 16px;
                    font-weight: bold;
                    cursor: pointer;
                    transition: background-color 0.3s;
               }

               button:hover {
                    background-color: limegreen;
               }
               
               
          </style>
     </head>
     <body>
          <div class="container">
               <form class="layout" action="productsList.jsp" method="GET">
                    <div class="filter-container" style="border:2px solid black; padding:10px; padding-top:52px; height: 500px; border-radius: 25px;">
                         <label class="price" for="minPrice">Giá tối thiểu:</label>
                         <input class="price" type="number" name="minPrice" value="<%= request.getParameter("minPrice") != null ? request.getParameter("minPrice") : 0%>" step="1000">

                         <div class="price" for="maxPrice">Giá tối đa:</div>
                         <input class="price" type="number" name="maxPrice" value="<%= request.getParameter("maxPrice") != null ? request.getParameter("maxPrice") : 10000000%>" step="1000">

                         <div for="category" class="title-category">Lọc theo danh mục:</div>
                         <ul class="category-list">
                              <li class="category-item">
                                   <input type="radio" name="categoryId" value="0" <%= categoryId == 0 ? "checked" : ""%>>
                                   Tất cả
                              </li>
                              <%
                                   CategoryDAO categoryDAO = new CategoryDAO();
                                   List<CategoryDTO> categories = categoryDAO.list();
                                   for (CategoryDTO category : categories) {
                                        boolean checked = categoryId == category.getCategoryId();
                              %>
                              <li class="category-item">
                                   <input type="radio" name="categoryId" value="<%= category.getCategoryId()%>" <%= checked ? "checked" : ""%>>
                                   <%= category.getCategoryName()%>
                              </li>
                              <%
                                   }
                              %>
                         </ul>
                         <button type="submit">Lọc</button>
                    </div>
                    <div>
                         <div style="padding-right:20px; padding-left: 900px; gap:10px; display: flex; align-items: center; margin-top: 20px;">                         
                         <label for="sort" style="font-size: 20px; width: 80px;">Sắp xếp:</label>
                         <select name="sort" style="width:150px; height: 30px; border-radius:25px; padding-left: 20px;">
                              <option value="asc" <%= "asc".equals(request.getParameter("sort")) ? "selected" : ""%>>Giá tăng dần</option>
                              <option value="desc" <%= "desc".equals(request.getParameter("sort")) ? "selected" : ""%>>Giá giảm dần</option>
                         </select>                         
                         </div>
                         <div class="product-container">
                              <% for (ProductDTO product : products) {%>
                              <div class="product">
                                   <img src="images/<%= product.getImage()%>" width="250" height="250" style="border-radius: 10px;">
                                   <h3 style="height: 50px;"><%= product.getProductName()%></h3>
                                   <p style="color: red; font-weight: bolder; font-size: 30">
                                        <%
  
                                             String formattedPrice = currencyFormat.format(product.getPrice());
                                        %>
                                        <%= formattedPrice%>
                                   </p>
                                   <p><a href="#" style="font-size: 20px; ">Thêm vào giỏ</a></p>
                              </div>
                              <% } %>
                         </div>
                    </div>

               </form>
               <div class="pagination">
                    <% for (int i = 1; i <= totalPages; i++) {%>
                    <a href="productsList.jsp?page=<%= i%>&minPrice=<%= minPrice%>&maxPrice=<%= maxPrice%>&categoryId=<%= categoryId%>&sort=<%= sort%>"><%= i%></a>
                    <% }%>
               </div>
          </div>

     </body>
</html>