<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Appointments</title>
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
            flex-direction: column;
        }
        
        .appointments-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .appointments-table th, .appointments-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .appointments-table th {
            background-color: #34495e;
            color: white;
        }
        .appointments-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .appointments-table tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">
            <img src="images/logo.png" alt="Logo">
        </div>
        <br>
        <h2>Admin Dashboard</h2>
        <ul>
            <li><a href="adminhome.jsp"><i class="fa fa-tachometer-alt"></i>Dashboard</a></li>
            <li><a href="adddoctor.jsp"><i class="fa fa-user-md"></i>Add Doctor</a></li>
            <li><a href="viewdoctor.jsp"><i class="fa fa-users"></i>View Doctors</a></li>
            <li><a href="#"><i class="fa fa-map-marker-alt"></i>Mapping Doctor</a></li>
            <li><a href="viewpatients.jsp"><i class="fa fa-users"></i>View Patients</a></li>
            <li><a href="viewappointments.jsp"><i class="fa fa-calendar-check"></i>View Appointments</a></li>
            <li><a href="login.jsp"><i class="fa fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="header">
            <h2 align="center">View Appointments</h2>
        </div>
        <table class="appointments-table">
            <thead>
                <tr>
                    <th>Full Name</th>
                    <th>Gender</th>
                    <th>Age</th>
                    <th>Appointment Date</th>
                    <th>Email</th>
                    <th>Phone No</th>
                    <th>Diseases</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinemedicalsystem", "root", "");
                        String sql = "SELECT * FROM user_appointments";
                        PreparedStatement stmt = conn.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                            String fullName = rs.getString("full_name");
                            String gender = rs.getString("gender");
                            int age = rs.getInt("age");
                            java.sql.Date appointmentDate = rs.getDate("appointment_date"); 
                            String email = rs.getString("email");
                            String phoneNo = rs.getString("phone_no");
                            String diseases = rs.getString("diseases");
                            String address = rs.getString("address");
                %>
                <tr>
                    <td><%= fullName %></td>
                    <td><%= gender %></td>
                    <td><%= age %></td>
                    <td><%= appointmentDate.toLocalDate().toString() %></td> 
                    <td><%= email %></td>
                    <td><%= phoneNo %></td>
                    <td><%= diseases %></td>
                    <td><%= address %></td>
                </tr>
                <% 
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (SQLException | ClassNotFoundException e) {
                        e.printStackTrace();
                %>
                <tr>
                    <td colspan="8" style="text-align: center;">Error fetching data</td>
                </tr>
                <% 
                    } 
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
