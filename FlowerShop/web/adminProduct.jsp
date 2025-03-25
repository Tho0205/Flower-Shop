
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="FlowerShop.DTO.ProductDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="vi">
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Manager</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <style>
            .container {
                width: 80%;
                margin: auto;
            }
            .table {
                margin-top: 20px;
            }
            th, td {
                text-align: center;
            }
            .action-btn {
                background-color: #d9534f;
                color: white;
                border: none;
                padding: 5px 10px;
                cursor: pointer;
                border-radius: 5px;
            }
            .row {
                margin-right: -10px;
                margin-left: -10px;
            }
            .col {
                padding-right: 10px;
                padding-left: 10px;
            }
            .product-image {
                width: 50px;
                height: 50px;
                object-fit: cover;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="adminHeader.jsp" flush="true" />
        <div class="container">
            <h2 class="text-center">Product Management</h2>
            <form action="AdminController" method="GET">
                
                <label for="name">Name: </label>
                <input type="text" name="keyword" value="${param.keyword}">

                <input type="submit" name="action" value="search" >
            </form>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-bordered">
                        <tr>
                            <th>ID</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Category</th>
                            <th>Action</th>
                        </tr>
                        <%
                            List<ProductDTO> list = (List<ProductDTO>) request.getAttribute("productListAll");
                            if (list != null && !list.isEmpty()) {
                                for (ProductDTO product : list) {
                        %>
                        <tr>
                            <td><%= product.getProductId() %></td>
                            <td><img class="product-image" src="images/<%= product.getImage() %>" alt="<%= product.getProductName() %>"></td>
                            <td><%= product.getProductName() %></td>
                            <td>
                                <%
                                    String description = product.getDescription();
                                    int maxLength = 100; // Số ký tự tối đa bạn muốn hiển thị
                                    if (description.length() > maxLength) {
                                        description = description.substring(0, maxLength) + "...";
                                    }
                                %>
                                <%= description %>
                            </td>
                            <td><%= product.getPrice() %></td>
                            <td><%= product.getQuantity() %></td>
                            <td>
                                <% 
                                    if (product.getCategory() == 1) { 
                                %>
                                    Hoa chúc mừng
                                <% 
                                    } else if (product.getCategory() == 2) { 
                                %>
                                    Hoa cưới
                                <% 
                                    } else if (product.getCategory() == 3) { 
                                %>
                                    Hoa dịp lễ tình yêu
                                <% 
                                    } else if (product.getCategory() == 4) { 
                                %>
                                    Hoa sự kiện, sinh nhật
                                <% 
                                    } else if (product.getCategory() == 5) { 
                                %>
                                    Hoa tang lễ
                                <% 
                                    } else if (product.getCategory() == 6) { 
                                %>
                                    Hoa tết
                                <% 
                                    } else if (product.getCategory() == 7) { 
                                %>
                                    Hoa trang trí
                                <% 
                                    } else { 
                                %>
                                    Unknown
                                <% 
                                    } 
                                %>
                            </td>
 
                            <td>
                                <form action="" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="<%= product.getProductId() %>" type="hidden">
                                    <input type="submit" value="Delete" class="action-btn">
                                </form>
                                <form action="" method="POST">
                                    <input name="action" value="edit" type="hidden">
                                    <input name="id" value="<%= product.getProductId() %>" type="hidden">
                                    <input type="submit" value="Edit" class="action-btn">
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="8" style="text-align:center;">No products available</td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
            <div>
                <div class="col-md-12 text-center">
                    <nav arial-label="Page navigation">
                        <ul class="pagination">
                            <%
                                int currentPage = (int) request.getAttribute("currentPage");
                                int totalPages = (int) request.getAttribute("totalPages");
                                if (currentPage > 1) {
                            %>
                            <li>
                                <a href="AdminController?action=listProduct&page=<%= currentPage - 1 %>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo; Previous</span>
                                </a>
                            </li>
                            <%
                                }
                                for (int i = 1; i <= totalPages; i++) {
                            %>
                            <li class="<%= (i == currentPage) ? "active" : "" %>">
                                <a href="AdminController?action=listProduct&page=<%= i %>"><%= i %></a>
                            </li>
                            <%
                                }
                                if (currentPage < totalPages) {
                            %>
                            <li>
                                <a href="AdminController?action=listProduct&page=<%= currentPage + 1 %>" aria-label="Next">
                                    <span aria-hidden="true">Next &raquo;</span>
                                </a>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </nav>
                    
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>
</html>
