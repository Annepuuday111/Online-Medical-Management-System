<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Profile</title>
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
            margin-bottom: -50px;
        }
        .logo img {
            height: 75px;
            width: auto;
            margin-bottom: 40px;
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
            border-top: 1px solid #34495e;
            border-bottom: 1px solid #34495e;
        }
        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            width: 100%;
            padding: 15px 20px;
            box-sizing: border-box;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .sidebar ul li a .fa {
            margin-right: 10px;
            font-size: 18px;
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
            flex-direction: column;
        }
        .dashboard-content {
            display: flex;
            flex-direction: column;
            margin-top: 20px;
        }
        .card {
            margin: 10px;
            padding: 20px;
            background-color: white;
            background-image: url("images/doctorprofile.png");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left;
            min-height: 300px;
            color: #333;
        }
        .card h1 {
            margin-bottom: 15px;
            font-size: 2em;
            color: #333;
            margin-left: 9%;
        }
        .card h2 {
            font-size: 1.5em;
            margin-bottom: 5px;
            margin-left: 9%;
            margin-top: 50px;
        }
        .card h3, .card h4 {
            font-size: 16px;
            color: #666;
            margin: 10px 0;
            margin-left: 9%;
        }
        .card .fa {
            font-size: 30px;
            color: #007BFF;
            vertical-align: middle;
            margin-right: 10px;
        }
        .card .fa-calendar-day {
            color: #28a745;
        }
        .card .fa-procedures {
            color: #dc3545;
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
            <li><a href="doctorhome.jsp"><i class="fa fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="doctorprofile.jsp"><i class="fa fa-user"></i> Profile</a></li>
            <li><a href="#"><i class="fa fa-lock"></i> Change Password</a></li>
            <li><a href="doctorviewpatients.jsp"><i class="fa fa-users"></i> View Patients</a></li>
            <li><a href="doctorviewappointments.jsp"><i class="fa fa-calendar-check"></i> View Appointments</a></li>
            <li><a href="login.jsp"><i class="fa fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="dashboard-content">
            <div class="card">
                <h2>
                    <% 
                    int hour = new java.util.Date().getHours(); 
                    String greeting = "Good Evening";
                    if (hour < 12) {
                        greeting = "Good Morning";
                    } else if (hour < 18) {
                        greeting = "Good Afternoon";
                    }
                    %>
                    <%= greeting %>
                </h2>
                <h1>
                     <%= request.getAttribute("fullname") != null ? request.getAttribute("fullname") : "Doctor" %>
                </h1>
                <h3 style="color: green;">Your Schedule Today:</h3>
                <div style="display: flex; align-items: center;">
                    <h3>
                        <i class="fas fa-calendar-day fa-2x"></i> 
                        Appointments: <%= request.getAttribute("totalAppointmentsToday") != null ? request.getAttribute("totalAppointmentsToday") : "0" %>
                    </h3>
                    <h3 style="margin-left: 20px;">
                        <i class="fas fa-procedures fa-2x"></i> 
                        Surgeries: <%= request.getAttribute("totalSurgeriesToday") != null ? request.getAttribute("totalSurgeriesToday") : "0" %>
                    </h3>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
