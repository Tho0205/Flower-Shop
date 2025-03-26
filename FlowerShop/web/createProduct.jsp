<%-- 
    Document   : createNewProduct
    Created on : Mar 26, 2025
    Author     : tho02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Product</title>
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
        <h2 style="text-align: center">Create New Product</h2>
        <form action="AdminController" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" value="create">

            <label for="Name">Name:</label>
            <input type="text" name="productName" required>

            <label for="Description">Description:</label>
            <input type="text" name="description" required>

            <label for="Price">Price:</label>
            <input type="text" name="price" required>

            <label for="Quantity">Quantity:</label>
            <input type="text" name="quantity" required>

            <label for="Category">Category:</label>
            <input type="text" name="categoryId" required>

            <label for="Image">Upload Image:</label>
            <input type="file" name="newImage" accept="image/*" required>

            <button type="submit">Create</button>
        </form>
    </body>
</html>
