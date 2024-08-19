<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Home</title>
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
            margin-bottom: 30px;
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
            display: flex;
            align-items: center;
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
            flex-direction: column;
        }
        .header {
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        .dashboard-content {
            display: flex;
            flex-wrap: wrap;
            margin-top: 20px;
        }
        .card {
            flex: 1 1 30%;
            margin: 10px;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .card h4 {
            margin-bottom: 20px;
            font-size: 18px;
            color: #333;
        }
        .card p {
            font-size: 16px;
            color: #666;
        }
        .card a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }
        .card a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">
            <img src="images/logo.png" alt="Online Medical System Logo">
        </div>
        <h2>Doctor Dashboard</h2>
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
        <div class="header">
            <h2>Welcome to the Doctor Dashboard</h2>
        </div>
        <div class="dashboard-content">
            <div class="card">
                <i class="fa fa-users fa-3x" style="color: #3498db;"></i>
                <h4>Total Patients</h4>
                <p>Number of patients: <span id="totalPatients">--</span></p>
                <a href="doctorviewpatients.jsp">View Patients</a>
            </div>
            <div class="card">
                <i class="fa fa-calendar-check fa-3x" style="color: #e67e22;"></i>
                <h4>Upcoming Appointments</h4>
                <p>Number of upcoming appointments: <span id="totalAppointments">--</span></p>
                <a href="doctorviewappointments.jsp">View Appointments</a>
            </div>
            <div class="card">
                <i class="fa fa-bell fa-3x" style="color: #e74c3c;"></i>
                <h4>Notifications</h4>
                <p>Check your latest notifications here.</p>
                <a href="#">View Notifications</a>
            </div>
        </div>
    </div>
</body>
</html>
