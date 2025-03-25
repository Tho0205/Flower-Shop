<%-- 
    Document   : adminUser
    Created on : Mar 21, 2025, 8:15:44 AM
    Author     : tho02
--%>

<%@page import="java.util.List"%>
<%@page import="FlowerShop.DTO.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        </style>
    </head>
    <body>
        <jsp:include page="adminHeader.jsp" flush="true" />
        <div class="container">
            <h2 class="text-center">User Management</h2>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-bordered">
                        <tr>
                            <th>ID</th>
                            <th>Email</th>
                            <th>User Name</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Action</th>
                        </tr>
                        <%
                            List<UserDTO> list = (List<UserDTO>) request.getAttribute("userListAll");
                            if (list != null && !list.isEmpty()) {
                                for (UserDTO user : list) {
                        %>
                        <tr>
                            <td><%= user.getId() %></td>
                            <td><%= user.getEmail() %></td>
                            <td><%= user.getUsername() %></td>
                            <td><%= user.getPhone() %></td>
                            <td><%= user.getRole() %></td>
                            <td>
                                <form action="" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="<%= user.getId() %>" type="hidden">
                                    <input type="submit" value="Delete" class="action-btn">
                                </form>
                                <form action="" method="POST">
                                    <input name="action" value="edit" type="hidden">
                                    <input name="id" value="<%= user.getId() %>" type="hidden">
                                    <input type="submit" value="Edit" class="action-btn">
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="7" style="text-align:center;">No products available</td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>
</html>

