<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Doctor</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            display: flex;
        }
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 20px;
        }
        .logo {
            margin-bottom: -40px;
        }
        .logo img {
            height: 75px; 
            width: auto;
            margin-bottom: 30px;
        }
        .sidebar img {
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .sidebar h2 {
            margin: 10px 0;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
            width: 100%;
            text-align: left;
        }
        .sidebar ul li {
            padding: 0;
            border-top: 1px solid #34495e;
            border-bottom: 1px solid #34495e;
        }
        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: block;
            width: 100%;
            padding: 15px 20px;
            box-sizing: border-box;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .sidebar ul li a .fa {
            margin-right: 10px;
        }
        .sidebar ul li a:hover {
            background-color: lightgray;
            color: #000000;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .form-container form {
            display: flex;
            flex-direction: column;
        }
        .form-container form label {
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-container form input,
        .form-container form select {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
        .form-container form button {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-container form button:hover {
            background-color: #0056b3;
        }
        .message {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
        }
        .message.success {
            background-color: #d4edda;
            color: #155724;
        }
        .message.error {
            background-color: #f8d7da;
            color: #721c24;
        }
        @media (max-width: 480px) {
            .form-container {
                width: 100%;
                margin: 0 20px;
            }
            .sidebar {
                width: 100%;
                height: auto;
                flex-direction: row;
                padding: 10px 0;
                position: static;
            }
            .content {
                margin-left: 0;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">
            <img src="images/logo.png" alt="Online Medical System Logo">
        </div>
        <br>
        <h2>Admin DashBoard</h2>
        <ul>
            <li><a href="adminhome.jsp"><i class="fa fa-home"></i>Dashboard</a></li>
            <li><a href="adddoctor.jsp"><i class="fa fa-user-md"></i>Add Doctor</a></li>
            <li><a href="viewdoctor.jsp"><i class="fa fa-users"></i>View Doctors</a></li>
            <li><a href="#"><i class="fa fa-map-marker-alt"></i>Mapping Doctor</a></li>
            <li><a href="viewpatients.jsp"><i class="fa fa-users"></i>View Patients</a></li>
            <li><a href="viewappointments.jsp"><i class="fa fa-calendar-check"></i>View Appointments</a></li>
            <li><a href="login.jsp"><i class="fa fa-sign-out-alt"></i>Logout</a></li>
        </ul><a href="login.jsp">Logout</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="form-container">
            <h2 align="center">Add Doctor</h2>
            <% 
                String message = (String) request.getAttribute("message");
                if (message != null) {
                    String messageType = message.contains("successfully") ? "success" : "error";
            %>
                <div class="message <%= messageType %>">
                    <%= message %>
                </div>
            <% 
                } 
            %>
            <form action="addDoctor" method="post">
                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" name="fullname" required>

                <label for="dob">Date Of Birth</label>
                <input type="date" id="dob" name="dob" required>

                <label for="qualification">Qualification</label>
                <input type="text" id="qualification" name="qualification" required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>

                <label for="mobile">Mobile Number</label>
                <input type="tel" id="mobile" name="mobile" required>

                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
