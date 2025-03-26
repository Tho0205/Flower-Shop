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
            .container-custom {
                width: 80%;
                margin: 0 auto;
            }
            .row {
                margin-left: -10px;
                margin-right: -10px;
            }
            .col-custom {
                padding-left: 10px;
                padding-right: 10px;
            }
            .banner {
                background: url('banner.jpg') center/cover no-repeat;
                height: 300px;
                display: flex;
                justify-content: center;
                align-items: center;
                color: white;
                text-align: center;
                font-size: 2em;
                font-weight: bold;
            }
            .footer {
                background-color: #f8f8f8;
                text-align: center;
                padding: 20px 0;
                margin-top: 40px;
            }
            .navbar {
                background-color: white !important;
                border-bottom: 1px solid #ddd; 
            }

            .navbar a {
                color: #333 !important; 
            }
            .caption p {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .thumbnail img {
                height: 250px;
                width: 250px;
                object-fit: cover;
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
                    <a class="navbar-brand" href="ProductController?action=list">Flower Shop</a>
                </div>
                <div class="collapse navbar-collapse" id="navbar-main">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="ProductController?action=list">Home</a></li>
                        <li><a href="productsList.jsp">Products</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                Categories <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Roses</a></li>
                                <li><a href="#">Lilies</a></li>
                                <li><a href="#">Sunflowers</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="productsList.jsp">All Categories</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search...">
                        </div>
                        <button type="submit" class="btn btn-default">Search</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp">Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>


        <!-- Page Content -->
        <div class="container-custom">
            <h1 class="text-center">Welcome to Flower Shop</h1>
            <img src="images/background.jpg" alt="Beautiful Flowers" class="img-responsive center-block">
        </div>
        
        <div class="container">
            <h2 class="text-center">New Arrivals</h2>

            <div class="row">
            <%
                List<ProductDTO> list = (List<ProductDTO>) request.getAttribute("productList"); 
                if (list != null && !list.isEmpty()) {
                    int count = 0;
                    for (ProductDTO product : list) {
                        if (count >= 8) break; 
                        count++;
            %>
                <div class="col-sm-6 col-md-3 text-center"> 
                    <div class="thumbnail">
                        <img src="images/<%= product.getImage() %>" alt="<%= product.getProductName() %>" class="img-responsive">
                        <div class="caption">
                            <p>
                                <a href="ProductController?action=details&id=<%= product.getProductId()%>">
                                    <strong><%= product.getProductName() %></strong>
                                </a>
                            </p>
                            <p><strong><%= product.getPrice() %> Vnđ</strong></p>
                            <p>
                                <a href="#" class="btn btn-default" role="button">Add to Cart</a>
                            </p>
                        </div>
                    </div>
                </div>
            <%
                    }
            %>

            <%
                }
            %>

            </div>
        </div>

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