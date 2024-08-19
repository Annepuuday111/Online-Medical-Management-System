<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, rgba(0, 123, 255, 0.5), rgba(255, 255, 255, 0.5)), url('images/signup.jpg');
            background-size: cover;
            background-position: center;
        }
        .container {
            display: flex;
            max-width: 900px;
            width: 80%;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            background-color: rgba(255, 255, 255, 0.8);
        }
        .image-card {
            width: 70%;
            background-image: url('images/signup1.jpg');
            background-size: cover;
            background-position: center;
        }
        .form-card {
            width: 50%;
            padding: 40px;
            background-color: #ffffff;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .form-card h1 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
        }
        .form-group label {
            margin-bottom: 2px;
            font-size: 14px;
            color: #555;
        }
        .form-group input {
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            padding: 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            
            box-sizing: border-box;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
        .success-message {
            display: none;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
        }
    </style>
    <script>
        function validateForm() {
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var errorMessage = "";

            if (name === "" || email === "" || username === "" || password === "") {
                errorMessage = "All fields are required.";
            } else if (!validateEmail(email)) {
                errorMessage = "Invalid email format.";
            } else if (password.length < 6) {
                errorMessage = "Password must be at least 6 characters long.";
            }

            if (errorMessage) {
                document.getElementById("errorMessage").innerText = errorMessage;
                return false;
            } else {
                showSuccessMessage();
                return true;
            }
        }

        function validateEmail(email) {
            var re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            return re.test(email);
        }

        function showSuccessMessage() {
            var message = document.getElementById("successMessage");
            message.style.display = "block";
            setTimeout(function() {
                message.style.display = "none";
            }, 3000); 
        }

        window.onload = function() {
            var urlParams = new URLSearchParams(window.location.search);
            var error = urlParams.get('error');
            if (error) {
                document.getElementById('errorMessage').innerText = error;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="image-card"></div>
        <div class="form-card">
            <h1 align="center">Register</h1>
            <form action="registerServlet" method="post" onsubmit="return validateForm()">
                <div class="error-message" id="errorMessage"></div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" placeholder="Enter your Name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" placeholder="Enter your Email" required>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" placeholder="Choose a Username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" placeholder="Choose a Password" required>
                </div>
                <input type="submit" value="Register">
                
                <div align="center" class="login">
                    If you have an account, please <a href="login.jsp">Login</a>.
                </div>
            </form>
            <div id="successMessage" class="success-message">
                Registration successful! Redirecting to login page...
            </div>
        </div>
    </div>
</body>
</html>
