package com;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DBUtil;

public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();

            String queryDoctors = "SELECT COUNT(*) AS totalDoctors FROM doctor";
            stmt = conn.prepareStatement(queryDoctors);
            rs = stmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("totalDoctors", rs.getInt("totalDoctors"));
            }

            String queryPatients = "SELECT COUNT(*) AS totalPatients FROM users";
            stmt = conn.prepareStatement(queryPatients);
            rs = stmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("totalPatients", rs.getInt("totalPatients"));
            }

            String queryAppointments = "SELECT COUNT(*) AS totalAppointments FROM user_appointments";
            stmt = conn.prepareStatement(queryAppointments);
            rs = stmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("totalAppointments", rs.getInt("totalAppointments"));
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("adminhome.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            log("Database access error", e);
            throw new ServletException("Database access error occurred.", e);
        } finally {
            closeResources(conn, stmt, rs);
        }
    }

    private void closeResources(Connection conn, PreparedStatement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            log("Error closing resources", e);
        }
    }
}
