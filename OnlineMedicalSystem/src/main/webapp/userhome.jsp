<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
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
        .card i {
            font-size: 50px;
            margin-bottom: 10px;
            color: #007BFF;
        }
        .card-appointments i {
            color: #e67e22;
        }
        .card-profile i {
            color: #27ae60;
        }
        .card-bookings i {
            color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">
            <img src="images/logo.png" alt="Online Medical System Logo">
        </div>
        <h2>User Dashboard</h2>
        <ul>
            <li><a href="userhome.jsp"><i class="fa fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
            <li><a href="#"><i class="fa fa-key"></i> Change Password</a></li>
            <li><a href="bookappointment.jsp"><i class="fa fa-calendar-plus"></i> Book Appointment</a></li>
            <li><a href="login.jsp"><i class="fa fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="header">
            <h2>Welcome to User Dashboard</h2>
        </div>
        <div class="dashboard-content">
            <div class="card card-profile">
                <i class="fas fa-user"></i>
                <h4>Your Profile</h4>
                <p><a href="#">View Profile</a></p>
            </div>
            <div class="card card-bookings">
                <i class="fas fa-calendar-day"></i>
                <h4>Upcoming Appointments</h4>
                <p><a href="viewappointments.jsp">View Appointments</a></p>
            </div>
            <div class="card card-appointments">
                <i class="fas fa-calendar-plus"></i>
                <h4>Book New Appointment</h4>
                <p><a href="bookappointment.jsp">Book Now</a></p>
            </div>
        </div>
    </div>
</body>
</html>
