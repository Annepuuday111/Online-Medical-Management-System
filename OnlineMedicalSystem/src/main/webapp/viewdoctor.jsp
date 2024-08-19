<%@ page import="java.sql.*, javax.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Doctors</title>
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
            height: 100vh;
            overflow-y: auto;
        }
        .content h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        .actions {
            display: flex;
            gap: 10px;
        }
        .actions button {
            padding: 5px 10px;
            font-size: 14px;
            cursor: pointer;
            border: none;
            border-radius: 3px;
            transition: background-color 0.3s ease;
        }
        .edit-btn {
            background-color: #f0ad4e;
            color: white;
        }
        .edit-btn:hover {
            background-color: #ec971f;
        }
        .delete-btn {
            background-color: #d9534f;
            color: white;
        }
        .delete-btn:hover {
            background-color: #c9302c;
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
        <h2>View Doctors</h2>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Date of Birth</th>
                        <th>Qualification</th>
                        <th>Email</th>
                        <th>Mobile No</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        // Fetch doctor details from the database
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinemedicalsystem", "root", "");
                            String sql = "SELECT * FROM doctor";
                            stmt = conn.prepareStatement(sql);
                            rs = stmt.executeQuery();
                            
                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String fullName = rs.getString("fullname");
                                String dob = rs.getDate("dob").toString();
                                String qualification = rs.getString("qualification");
                                String email = rs.getString("email");
                                String mobile = rs.getString("mobile");
                                String username = rs.getString("username");
                                String password = rs.getString("password");
                    %>
                                <tr>
                                    <td><%= id %></td>
                                    <td><%= fullName %></td>
                                    <td><%= dob %></td>
                                    <td><%= qualification %></td>
                                    <td><%= email %></td>
                                    <td><%= mobile %></td>
                                    <td><%= username %></td>
                                    <td><%= password %></td>
                                    <td class="actions">
                                        <a href="editdoctor.jsp?id=<%= id %>"><button class="edit-btn">Edit</button></a>
                                        <a href="deleteDoctor?id=<%= id %>"><button class="delete-btn">Delete</button></a>
                                    </td>
                                </tr>
                    <% 
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                    %>
                            <tr>
                                <td colspan="9">Error retrieving data</td>
                            </tr>
                    <% 
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
