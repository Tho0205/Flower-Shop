<%-- 
    Document   : editUser
    Created on : Mar 26, 2025, 10:01:25 AM
    Author     : tho02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
        <style>
            form {
                max-width: 400px;
                margin: 0 auto;
            }

            label {
                display: block;
                margin-bottom: 8px;
            }

            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 16px;
                box-sizing: border-box;
            }

            button {
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <jsp:include page="adminHeader.jsp" flush="true" />
        <h2 style="text-align: center">Update User</h2>
        <form action="AdminUserController" method="POST">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="${param.id}">

            <label for="Email">Email:</label>
            <input type="text" name="email" value="${param.email}">

            <label for="Username">Username:</label>
            <input type="text" name="username" value="${param.username}">

            <label for="Phone">Phone:</label>
            <input type="text" name="phone" value="${param.phone}">

            <label for="Role">Role:</label>
            <select name="role">
                <option value="Owner" ${param.role == "Owner" ? "selected" : ""}>Owner</option>
                <option value="Staff" ${param.role == "Staff" ? "selected" : ""}>Staff</option>
                <option value="Customer" ${param.role == "Customer" ? "selected" : ""}>Customer</option>
            </select>

            <button type="submit">Save</button>
        </form>

    </body>
</html>
