package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBUtil;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));
        String appointmentDate = request.getParameter("appointmentDate");
        String email = request.getParameter("email");
        String phoneNo = request.getParameter("phoneNo");
        String diseases = request.getParameter("diseases");
        String address = request.getParameter("address");

        String message;
        String page = "bookappointment.jsp";

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO user_appointments (full_name, gender, age, appointment_date, email, phone_no, diseases, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullName);
            stmt.setString(2, gender);
            stmt.setInt(3, age);
            stmt.setString(4, appointmentDate);
            stmt.setString(5, email);
            stmt.setString(6, phoneNo);
            stmt.setString(7, diseases);
            stmt.setString(8, address);
            stmt.executeUpdate();

            message = "Appointment booked successfully!";
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Error booking appointment: " + e.getMessage();
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher(page).forward(request, response);
    }
}
