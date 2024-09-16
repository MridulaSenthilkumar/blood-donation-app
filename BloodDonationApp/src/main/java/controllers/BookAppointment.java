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
        String donationType = request.getParameter("donationType");
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

        if ("blood".equals(donationType)) {
            dao.saveAppointment(appointment); // Save to blood donation table
        } else if ("plasma".equals(donationType)) {
            dao.saveplasmaAppointment(appointment); // Save to plasma donation table
        }
        else if ("platelet".equals(donationType)) {
            dao.saveplateletAppointment(appointment); //Save to plasma donation table
        }

        response.sendRedirect("Confirmation.jsp");
    }
}
