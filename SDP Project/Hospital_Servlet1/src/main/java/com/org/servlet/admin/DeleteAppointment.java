package com.org.servlet.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.org.dao.AppointmentDao;

@WebServlet("/delete_appointment")
public class DeleteAppointment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String appointmentId = request.getParameter("appointmentId");

        if (appointmentId != null) {
            int id = Integer.parseInt(appointmentId);

            AppointmentDao dao = new AppointmentDao();
            boolean isDeleted = dao.deleteAppointmentById(id);

            if (isDeleted) {
                response.sendRedirect("view_appointments.jsp?deleteSuccess=true");
            } else {
                response.sendRedirect("view_appointments.jsp?deleteError=true");
            }
        }
    }
}
