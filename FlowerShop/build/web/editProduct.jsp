
<%@page import="FlowerShop.DTO.ProductDTO"%>
<%@page import="FlowerShop.DAO.ProductDAO"%>
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
        <%
            Integer productId = Integer.parseInt(request.getParameter("productId"));
            ProductDAO dao = new ProductDAO();
            ProductDTO product = dao.load(productId);
        %>
    </head>
    <body>
        <jsp:include page="adminHeader.jsp" flush="true" />
        <h2 style="text-align: center">Update Product</h2>
        <form action="AdminController" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="productId" value="${product.productId}">

            <label for="Name">Name:</label>
            <input type="text" name="productName" value="${product.productName}">

            <label for="Description">Description:</label>
            <input type="text" name="description" value="${product.description}">

            <label for="Price">Price:</label>
            <input type="text" name="price" value="${product.price}">

            <label for="Quantity">Quantity:</label>
            <input type="text" name="quantity" value="${product.quantity}">

            <label for="Category">Category:</label>
            <input type="text" name="categoryId" value="${product.category}">

            <label for="Current Image">Current Image:</label>
            <img src="images/${product.image}" alt="Current Image" style="width: 100%; max-width: 200px; margin-bottom: 16px;">

            <label for="New Image">Upload New Image:</label>
            <input type="file" name="newImage" accept="image/*">

            <button type="submit">Save</button>
        </form>

    </body>
</html>
