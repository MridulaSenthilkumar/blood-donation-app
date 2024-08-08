package controllers;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import model.Appointment;
import database.DonorDAO;

@WebServlet("/BookAppointment")
public class BookAppointment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String bloodGroup = request.getParameter("bloodGroup");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String appointmentDate = request.getParameter("appointmentDate");

        Appointment appointment = new Appointment();
        appointment.setDonorName(name);
        appointment.setAddress(address);
        appointment.setBloodgrp(bloodGroup);
        appointment.setEmail(email);
        appointment.setPhoneNumber(phoneNumber);
        appointment.setAppointmentDate(appointmentDate);

        DonorDAO dao = new DonorDAO();
        dao.saveAppointment(appointment);

        response.sendRedirect("Confirmation.jsp");
    }
}
