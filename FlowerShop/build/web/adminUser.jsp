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
        <title>User Management</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <style>
            .container {
                width: 80%;
                margin: auto;
                margin-top: 30px;
            }
            h2 {
                margin-bottom: 20px;
            }
            .table {
                margin-top: 20px;
            }
            th, td {
                text-align: center;
                vertical-align: middle;
            }
            .action-buttons {
                display: flex;
                justify-content: center;
                gap: 10px;
            }

        </style>
    </head>
    <body>
        <jsp:include page="adminHeader.jsp" flush="true" />
        <div class="container">
            <h2 class="text-center">User Management</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Email</th>
                        <th>User Name</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
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
                            <div class="action-buttons">
                                <form action="AdminUserController" method="POST" style="margin: 0;">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="<%= user.getId() %>" type="hidden">
                                    <input type="submit" value="Delete" class="btn btn-danger">
                                </form>
                                <form action="editUser.jsp" method="POST" style="margin: 0;">
                                    <input type="hidden" name="id" value="<%= user.getId() %>">
                                    <input type="hidden" name="email" value="<%= user.getEmail() %>">
                                    <input type="hidden" name="username" value="<%= user.getUsername() %>">
                                    <input type="hidden" name="phone" value="<%= user.getPhone() %>">
                                    <input type="hidden" name="role" value="<%= user.getRole() %>">
                                    <input type="submit" value="Edit" class="btn btn-info">
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6" style="text-align:center;">No users available</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>
</html>
