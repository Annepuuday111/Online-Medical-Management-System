package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBUtil;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DBUtil.getConnection()) {
        	
            PreparedStatement checkUserStmt = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
            checkUserStmt.setString(1, username);
            ResultSet rs = checkUserStmt.executeQuery();

            if (rs.next()) {
            	
                response.sendRedirect("register.jsp?error=Username already taken, please choose another one.");
            } else {
            	
                String hashedPassword = hashPassword(password);

                PreparedStatement stmt = conn.prepareStatement("INSERT INTO users (name, email, username, password) VALUES (?, ?, ?, ?)");
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, username);
                stmt.setString(4, hashedPassword);
                stmt.executeUpdate();

                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=An error occurred, please try again.");
        }
    }

    private String hashPassword(String password) {
        
        return password; 
    }
}
