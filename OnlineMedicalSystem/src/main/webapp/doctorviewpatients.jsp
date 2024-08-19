<%@ page import="java.util.ArrayList" %>
<%@ page import="com.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Patients</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
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
            margin-bottom: -50px;
        }
        .logo img {
            height: 75px; 
            width: auto;
            margin-bottom: 30px;
        }
        .sidebar h2 {
            margin-bottom: 20px;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
            width: 100%;
            text-align: left;
        }
        .sidebar ul li {
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
        .sidebar ul li a:hover {
            background-color: lightgray;
            color: #000000;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            height: 100vh;
            overflow-y: auto;
            background-color: #f8f9fa;
        }
        .content h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="sidebar">
       	<div class="logo">
        	<img src="images/logo.png" alt="Online Medical System Logo">
        </div>
        <h2>Doctor DashBoard</h2>
        <ul>
            <li><a href="doctorhome.jsp"><i class="fa fa-tachometer-alt"></i> DashBoard</a></li>
            <li><a href="doctorprofile.jsp"><i class="fa fa-user"></i> Profile</a></li>
            <li><a href="#"><i class="fa fa-lock"></i> Change Password</a></li>
            <li><a href="doctorviewpatients.jsp"><i class="fa fa-users"></i> View Patients</a></li>
            <li><a href="doctorviewappointments.jsp"><i class="fa fa-calendar-check"></i> View Appointments</a></li>
            <li><a href="login.jsp"><i class="fa fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>
    <div class="content">
        <h2>View Patients</h2>
        <br>
        <table>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Mobile Number</th>
                <th>Username</th>
            </tr>
            <%
                // Retrieve the user list from the request attribute
                ArrayList<User> userList = (ArrayList<User>) request.getAttribute("userList");
                
                if (userList != null && !userList.isEmpty()) {
                    // Loop through the user list and display each user's details
                    for (User user : userList) {
            %>
                        <tr>
                            <td><%= user.getId() %></td>
                            <td><%= user.getFullName() %></td>
                            <td><%= user.getEmail() %></td>
                            <td><%= user.getMobile() %></td>
                            <td><%= user.getUsername() %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="5" style="text-align:center;">No patients found.</td>
                </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
