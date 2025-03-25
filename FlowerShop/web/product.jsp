<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="FlowerShop.DTO.ProductDTO" %>
<%
    ProductDTO product = (ProductDTO) request.getAttribute("product");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= product.getProductName() %></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        .product-detail {
            margin-top: 20px;
        }
        .product-image {
            object-fit: fill;
            
            text-align: center;
        }
        .product-info {
            padding-left: 20px;
            padding-right: 20px;
        }
        .product-title {    
            font-size: 36px;
            margin-bottom: 10px;
        }
        .product-price {
            font-size: 24px;
            color: #d9534f;
        }
        .product-description {
            margin-top: 20px;
            font-size: 16px;
        }
        .btn-add-to-cart {
            background-color: #e28685;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
        }
        .btn-add-to-cart:hover {
            background-color: #d06564;
        }
        .quantity-wrapper {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }
        .quantity-wrapper input {
            width: 60px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="/header.jsp" flush="true" />
    <div class="container" style="width: 80%; margin: 0 auto;">
        <div class="row product-detail">

            <div class="col-md-4">
                <div class="product-image">
                    <img src="images/<%= product.getImage() %>" alt="<%= product.getProductName() %>" class="img-responsive" style=" height: 400px; width: 400px; border: 1px solid #ddd; border-radius: 5px;">
                </div>
            </div>


            <div class="col-md-8">
                <div class="product-info">
                    <h1 class="product-title"><%= product.getProductName() %></h1>
                    <p class="product-price">Price: <span><%= product.getPrice() %></span> Vnđ</p>
                    <p class="product-description">Description: <br>
                        <%= product.getDescription() %></p>
                    <div class="quantity-wrapper">
                        <label for="quantity">Quantity:</label>
                        <input type="number" id="quantity" name="quantity" value="1" min="1" class="form-control" style="width: 60px; height: 40px">
                    </div>
                    <form action="addToCart" method="post">
                        <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                        <button type="submit" class="btn-add-to-cart">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
                        
                        
    <jsp:include page="/footer.jsp" flush="true" />
    <!-- Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
