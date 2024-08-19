<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(rgba(255, 255, 255, 0.6), rgba(255, 255, 255, 0.6)), url('images/signup.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .login-container {
            display: flex;
            max-width: 900px;
            width: 80%;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            background-color: rgba(255, 255, 255, 0.8);
        }
        .login-form {
            background-color: #ffffff;
            width: 50%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .login-image {
            background-color: #e0ebff;
            width: 50%;
            padding: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-image: url('images/login.jpg');
            background-size: cover;
            background-position: center;
        }
        .login-form h1 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        .login-form label {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }
        .login-form input[type="text"], .login-form input[type="password"], .login-form input[type="submit"] {
            width: 100%;
            padding: 15px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box; 
        }
        .login-form input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .login-form input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .login-form .forgot-password {
            margin-top: 10px;
            text-align: right;
        }
        .login-form .forgot-password a {
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }
        .login-form .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-form">
            <h1 align="center">Login</h1>
            <h4>Welcome to Online Medical Service</h4>
            <form action="LoginServlet" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <input type="submit" value="Login">

                <div align="center" class="signup">
                    If you don't have an account, please <a href="signup.jsp">Sign-Up</a>.
                </div>
            </form>
        </div>
        <div class="login-image"></div>
    </div>
</body>
</html>
