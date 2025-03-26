<%@page import="FlowerShop.DTO.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flower Shop</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        
        <!-- Custom CSS -->
        <style>
            body {
                padding-top: 50px;
            }
            .navbar {
                background-color: white !important;
                border-bottom: 1px solid #ddd; 
            }

            .navbar a {
                color: #333 !important; 
            }

        </style>
    </head>
    <body>

        <!-- Navbar -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-main">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="navbar-main">
                    <ul class="nav navbar-nav">
                        <a class="navbar-brand" href="ProductController?action=list">Flower Shop</a>
                        <li><a href="AdminController?action=listProduct">Product</a></li>
                        <li><a href="AdminController">Order</a></li>
                        <li><a href="AdminUserController?action=listUser">Account</a></li>

                    </ul>

                </div>
            </div>
        </nav>

        <!-- Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </body>
</html>
