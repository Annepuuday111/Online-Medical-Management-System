package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBUtil;

@WebServlet("/ViewAppointmentsServlet")
public class ViewAppointmentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Appointment> appointments = new ArrayList<>();
        
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM user_appointments";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setId(rs.getInt("id"));
                appointment.setFullName(rs.getString("full_name"));
                appointment.setGender(rs.getString("gender"));
                appointment.setAge(rs.getInt("age"));
                appointment.setAppointmentDate(rs.getDate("appointment_date"));
                appointment.setEmail(rs.getString("email"));
                appointment.setPhoneNo(rs.getString("phone_no"));
                appointment.setDiseases(rs.getString("diseases"));
                appointment.setAddress(rs.getString("address"));
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error fetching appointments: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response); 
            return;
        }
        
        request.setAttribute("appointments", appointments);
        request.getRequestDispatcher("viewappointments.jsp").forward(request, response);
    }

    public static class Appointment { 
        private int id;
        private String fullName;
        private String gender;
        private int age;
        private java.sql.Date appointmentDate;
        private String email;
        private String phoneNo;
        private String diseases;
        private String address;

       
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getFullName() {
            return fullName;
        }

        public void setFullName(String fullName) {
            this.fullName = fullName;
        }

        public String getGender() {
            return gender;
        }

        public void setGender(String gender) {
            this.gender = gender;
        }

        public int getAge() {
            return age;
        }

        public void setAge(int age) {
            this.age = age;
        }

        public java.sql.Date getAppointmentDate() {
            return appointmentDate;
        }

        public void setAppointmentDate(java.sql.Date appointmentDate) {
            this.appointmentDate = appointmentDate;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getPhoneNo() {
            return phoneNo;
        }

        public void setPhoneNo(String phoneNo) {
            this.phoneNo = phoneNo;
        }

        public String getDiseases() {
            return diseases;
        }

        public void setDiseases(String diseases) {
            this.diseases = diseases;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }
    }
}
