package controllers;

import database.DonorDAO;
import model.OrganRegistration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class OrganRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DonorDAO donorDAO;

    @Override
    public void init() throws ServletException {
        donorDAO = new DonorDAO();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Collection of form data
        String donorName = request.getParameter("firstName") + " " + request.getParameter("lastName");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");
        String donationChoice = request.getParameter("donationChoice");

        // Creating OrganRegistration object and encapsulation
        OrganRegistration registration = new OrganRegistration();
        registration.setDonorName(donorName);
        registration.setAddress(address);
        registration.setEmail(email);
        registration.setPhoneNumber(phoneNumber);
        registration.setDonationChoice(donationChoice);

        // Inserting data into database using DAO
        boolean isSuccess = donorDAO.insertOrganRegistration(registration);

        // Redirecting pages based on success or error 
        if (isSuccess) {
            response.sendRedirect("Confirmation.jsp");
        } else {
            response.sendRedirect("register.jsp");
        }
    }
}
