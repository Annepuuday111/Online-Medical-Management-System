package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/onlinemedicalsystem";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "admin123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", "admin");
            response.sendRedirect("adminhome.jsp");
            return;
        }

        // Check for doctor login
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmtDoctor = conn.prepareStatement("SELECT * FROM doctor WHERE username = ? AND password = ?")) {

            stmtDoctor.setString(1, username);
            stmtDoctor.setString(2, password);

            try (ResultSet rsDoctor = stmtDoctor.executeQuery()) {
                if (rsDoctor.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("role", "doctor");
                    response.sendRedirect("doctorhome.jsp");
                    return;
                } else {
                    System.out.println("No doctor found with the provided credentials.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=An error occurred, please try again.");
            return;
        }

        // Check for regular user login
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmtUser = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?")) {

            stmtUser.setString(1, username);
            stmtUser.setString(2, password);

            try (ResultSet rsUser = stmtUser.executeQuery()) {
                if (rsUser.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("role", "user");
                    response.sendRedirect("userhome.jsp");
                } else {
                    response.sendRedirect("login.jsp?error=Invalid username or password.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=An error occurred, please try again.");
        }
    }
}
