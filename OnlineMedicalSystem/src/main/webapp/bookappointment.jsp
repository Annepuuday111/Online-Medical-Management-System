<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Appointment Booking</title>
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
            margin-top: 60px;
        }
        .appointment-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 450px;
        }
        .appointment-form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }
        .form-group {
            display: flex;
            flex-direction: column;
        }
        .form-group label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        .form-group input,
        .form-group select,
        .form-group textarea {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
            width: 100%;
            box-sizing: border-box;
        }
        .form-group:nth-child(odd) {
            grid-column: span 1;
        }
        .form-group:nth-child(even) {
            grid-column: span 1;
        }
        .form-group textarea {
            resize: vertical;
        }
        .submit-btn {
            grid-column: span 2;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #5bc0de;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background-color: #31b0d5;
        }
        .message {
            padding: 10px;
            border-radius: 5px;
            margin-top: 20px;
            text-align: center;
        }
        .message.success {
            background-color: #dff0d8;
            color: #3c763d;
        }
        .message.error {
            background-color: #f2dede;
            color: #a94442;
        }
        @media (max-width: 480px) {
            .appointment-container {
                width: 100%;
                margin: 0 20px;
            }
            .appointment-form {
                grid-template-columns: 1fr;
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
        <h2 style="margin-bottom: 20px;">User DashBoard</h2>
        <ul>
            <li><a href="userhome.jsp"><i class="fa fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
            <li><a href="#"><i class="fa fa-key"></i> Change Password</a></li>
            <li><a href="bookappointment.jsp"><i class="fa fa-calendar-plus"></i> Book Appointment</a></li>
            <li><a href="login.jsp"><i class="fa fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="appointment-container">
            <h2 align="center">Appointment Booking</h2>
            <br>
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
            <form class="appointment-form" action="AppointmentServlet" method="post">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName" aria-label="Full Name" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" aria-label="Gender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="age">Age</label>
                    <input type="number" id="age" name="age" aria-label="Age" required>
                </div>
                <div class="form-group">
                    <label for="appointmentDate">Appointment Date</label>
                    <input type="date" id="appointmentDate" name="appointmentDate" aria-label="Appointment Date" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" aria-label="Email" required>
                </div>
                <div class="form-group">
                    <label for="phoneNo">Phone No</label>
                    <input type="text" id="phoneNo" name="phoneNo" aria-label="Phone No" required>
                </div>
                <div class="form-group">
                    <label for="diseases">Diseases</label>
                    <input type="text" id="diseases" name="diseases" aria-label="Diseases">
                </div>
                <div class="form-group">
                    <label for="address">Full Address</label>
                    <textarea id="address" name="address" aria-label="Address" rows="3"></textarea>
                </div>
                <button type="submit" class="submit-btn">Book Appointment</button>
            </form>
        </div>
    </div>
</body>
</html>
