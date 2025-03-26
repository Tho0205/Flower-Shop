<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.Cookie" %>
<html lang="vi">

<head>
    <title>Login</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #000;
        }

        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 80%;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.1);
            height: 70vh; /* Điều chỉnh chiều cao */
        }

        .image-container {
            flex: 7;
            background-image: url('img/login-img.png');
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            border-radius: 15px 0 0 15px;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .login-container {
            flex: 3;
            padding: 40px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .login-container:hover {
            transform: translateY(-10px);
            box-shadow: 0px 15px 30px rgba(0, 0, 0, 0.2);
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
            font-weight: 600;
            font-size: 24px;
        }

        label {
            display: block;
            text-align: left;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
            font-size: 14px;
        }

        /* Thiết lập grid layout cho form */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr; /* 2 cột */
            gap: 20px; /* Khoảng cách giữa các ô */
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
        }

        input[type="submit"],
        input[type="reset"] {
            flex: 1;
            min-width: 100px;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s ease;
            font-weight: 600;
            letter-spacing: 1px;
        }

        input[type="submit"] {
            margin-top: 20px;
            background-color: #28a745;
            color: white;
        }

        input[type="submit"]:hover {
            background-color: #218838;
            transform: translateY(-3px);
        }

        input[type="reset"] {
            background-color: #dc3545;
            color: white;
            margin-top: 20px;
        }

        input[type="reset"]:hover {
            background-color: #c82333;
            transform: translateY(-3px);
        }

        input[type="checkbox"] {
            margin-top: 10px;
        }

        .link {
            color: #007bff;
            text-decoration: none;
            font-weight: 600;
        }

        .link:hover {
            text-decoration: underline;
            color: #0056b3;
        }

        p.error {
            color: red;
            font-weight: bold;
        }

        .layout-button {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            margin-top: 10px;
        }
    </style>
</head>

<body>
    <div class="container">
        <img class="image-container" src="img/login-img.png" alt="" />
        <div class="login-container">
            <h2>Register</h2>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="Register">

                <div class="form-grid">
                    <div>
                        <label for="usernamne">Username:</label>
                        <input type="text" name="username" required>
                    </div>
                    <div>
                        <label for="email">Email:</label>
                        <input type="text" name="email" required>
                    </div>
                    <div>
                        <label for="phone">Phone:</label>
                        <input type="text" name="phone" required>
                    </div>
                    <div>
                        <label for="password">Password:</label>
                        <input type="password" name="password" required>
                    </div>
                </div>

                <input type="submit" value="Register">
                <input type="reset" value="Reset">
            </form>

            <p>Already have an account? <a class="link" href="login.jsp">Login now</a></p>

            <%
                String error = (String) request.getAttribute("ERROR");
                if (error != null) {
            %>
            <p class="error"><%= error %></p>
            <%
                }
            %>
        </div>
    </div>
</body>

</html>
