<%@page import="FlowerShop.DTO.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flower Shop</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <style>
            body {
                padding-top: 50px;
            }
            .container-custom {
                width: 80%;
                margin: 0 auto;
            }
            .footer {
                background-color: #f8f8f8;
                text-align: center;
                padding: 20px 0;
                margin-top: 40px;
            }

        </style>
    </head>
    <body>
        <!-- Footer -->
        <hr>
        <div class="container-custom" id="about">
            <h2 class="text-center">About Us</h2>
            <p class="text-center">We provide the freshest and most beautiful flowers to brighten up your special moments.</p>
        </div>
        <div class="container-custom" id="contact">
            <h2 class="text-center">Contact Us</h2>
            <p class="text-center">Email: contact@flowershop.com | Phone: +123 456 789</p>
            
        </div>
        <div class="footer">
            <p>&copy; 2025 Flower Shop - All Rights Reserved.</p>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </body>
</html>
