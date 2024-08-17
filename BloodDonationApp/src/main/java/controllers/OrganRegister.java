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
        // Collect form data
        String donorName = request.getParameter("firstName") + " " + request.getParameter("lastName");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");
        String donationChoice = request.getParameter("donationChoice");

        // Debugging info for server logs
        System.out.println("Donor Name: " + donorName);
        System.out.println("Donation Choice: " + donationChoice);

        // Create OrganRegistration object
        OrganRegistration registration = new OrganRegistration();
        registration.setDonorName(donorName);
        registration.setAddress(address);
        registration.setEmail(email);
        registration.setPhoneNumber(phoneNumber);
        registration.setDonationChoice(donationChoice);

        // Insert into database using DAO
        boolean isSuccess = donorDAO.insertOrganRegistration(registration);

        // Redirect based on success or failure
        if (isSuccess) {
            response.sendRedirect("Confirmation.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
