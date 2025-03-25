<%-- 
    Document   : editProduct
    Created on : Mar 26, 2025, 3:19:27 AM
    Author     : tho02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
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
        <h2 style="text-align: center">Update Currency Rate</h2>
        <form action="AdminController" method="POST">
            <input type="hidden" name="action" value="edit">

            <label for="Name">Name:</label>
            <input type="text" name="productName" value="${param.productName}" readonly>

            <label for="Description">Description:</label>
            <input type="text" name="description" value="${param.description}">

            <label for="Price">Price:</label>
            <input type="text" name="price" value="${param.price}">

            <label for="Quantity">Quantity:</label>
            <input type="text" name="quantity" value="${param.quantity}">
            
            <label for="Category">Category:</label>
            <input type="text" name="categoryId" value="${param.categoryId}">
            
            

            <button type="submit">Save</button>
        </form>

    </body>
</html>
