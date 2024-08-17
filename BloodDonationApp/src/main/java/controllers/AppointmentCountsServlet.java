package controllers;

import database.DonorDAO;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet("/Counts")
public class AppointmentCountsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final DonorDAO dao = new DonorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("Fetching appointment counts...");

            int bloodDonationCount = dao.getBloodDonationCount();
            int plasmaDonationCount = dao.getPlasmaDonationCount();
            int plateletDonationCount = dao.getPlateletDonationCount();
            int organDonationCount = dao.getOrganDonationCount();

            // Print the counts
            System.out.println("Blood Donation Count: " + bloodDonationCount);
            System.out.println("Plasma Donation Count: " + plasmaDonationCount);
            System.out.println("Platelet Donation Count: " + plateletDonationCount);
            System.out.println("Organ Donation Count: " + organDonationCount);

            JSONObject json = new JSONObject();
            json.put("bloodDonationCount", bloodDonationCount);
            json.put("plasmaDonationCount", plasmaDonationCount);
            json.put("plateletDonationCount", plateletDonationCount);
            json.put("organDonationCount", organDonationCount);

            response.setContentType("application/json");
            response.getWriter().write(json.toString());
            System.out.println("Data sent: " + json.toString());
        } catch (Exception e) {
            System.err.println("Error fetching appointment counts: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error fetching appointment counts: " + e.getMessage());
        }
    }
}

