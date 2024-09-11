<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Medical Service - Admin Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f9ff;
        }

        header {
        	background-color: #ffffff;
        	padding: 10px 0;
        	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    	}

    	.container {
        	width: 80%;
        	margin: 0 auto;
        	text-align: center;
    	}

        .logo img {
        	height: 65px;
        	width: auto;
        	display: block;
    	}

        nav {
        	display: flex;
        	justify-content: space-between;
        	align-items: center;
    	}

    	nav a {
        	text-decoration: none;
        	color: #333333;
        	margin: 0 15px;
        	font-weight: bold;
    	}

    	nav .auth-buttons a {
        	color: #ffffff;
        	background-color: #007BFF;
        	padding: 8px 15px;
        	border-radius: 5px;
        	font-size: 14px;
    	}

    	nav .auth-buttons a.sign-in {
        	background-color: #555555;
        	margin-left: 10px;
    	}

        .dropbtn {
        	background-color: #555555;
        	color: white;
        	padding: 8px 15px;
        	border-radius: 5px;
        	font-size: 14px;
        	font-weight: bold;
        	text-decoration: none;
        	border: none;
    	}

    	.dropdown {
        	position: relative;
        	display: inline-block;
    	}

    	.dropdown-content {
        	display: none;
        	position: absolute;
        	background-color: #555555;
        	min-width: 150px;
        	margin-left: -35px;
        	border-radius: 5px;
        	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        	z-index: 1;
    	}

    	.dropdown-content a {
        	color: black;
        	padding: 12px 16px;
        	text-decoration: none;
        	display: block;
        	font-size: 14px;
        	font-weight: bold;
    	}

    	.dropdown-content a:hover {
        	background-color: none;
    	}

    	.dropdown:hover .dropdown-content {
        	display: block;
    	}

    	.dropdown:hover .dropbtn {
        	background-color: none;
    	}

        .form-container {
            width: 100%;
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .form-container h3 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            text-align: left;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group input:focus {
            border-color: #007BFF;
            outline: none;
        }

        .btn {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #218838;
        }

        .message {
            text-align: center;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .message.text-success {
            color: #28a745;
        }

        .message.text-danger {
            color: #dc3545;
        }
        
    </style>
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <div class="logo">
                    <img src="images/logo.png" alt="Online Medical System Logo">
                </div>
                
                <div class="auth-buttons">
                    <div class="dropdown">
                        <button class="dropbtn"><i class="fas fa-user"></i> Login</button>
                        <div class="dropdown-content"><br>
                            <a href="admin_login.jsp"><i class="fas fa-user-shield"></i> Admin</a><br>
                            <a href="doctor_login.jsp"><i class="fas fa-user-md"></i> Doctor</a><br>
                            <a href="user_login.jsp"><i class="fas fa-user"></i> User</a><br>
                        </div>
                    </div>
                    <a href="signup.jsp"><i class="fas fa-user-plus"></i> Sign-Up</a>
                </div>
            </nav>
        </div>
    </header>
    
    <div class="container">
        <div class="form-container">
            <h3>Admin Login</h3>
            
            <c:if test="${not empty succMsg}">
                <p class="message text-success">${succMsg}</p>
                <c:remove var="succMsg" scope="session"/>
            </c:if>

            <c:if test="${not empty errorMsg}">
                <p class="message text-danger">${errorMsg}</p>
                <c:remove var="errorMsg" scope="session"/>
            </c:if>
            
            <form action="adminLogin" method="post">
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" required class="form-control" placeholder="Enter your Email">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" required class="form-control" placeholder="Enter your Password">
                </div>
                <button type="submit" class="btn">Login</button>
            </form>
        </div>
    </div>
</body>
</html>
