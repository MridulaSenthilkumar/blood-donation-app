package controllers;

import com.google.gson.Gson;
import database.DonorDAO;
import model.Donor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/donorAPI/*")
public class DonorAPI extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DonorDAO dao = new DonorDAO();
    private Gson gson = new Gson();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            // Return all donors
            ArrayList<Donor> donors = dao.getAllDonors();
            String donorsJson = gson.toJson(donors);
            response.setContentType("application/json");
            response.getWriter().write(donorsJson);
        } else {
            // Get donor by ID
            int sno = Integer.parseInt(pathInfo.substring(1));
            Donor donor = dao.getDonorByID(sno);
            String donorJson = gson.toJson(donor);
            response.setContentType("application/json");
            response.getWriter().write(donorJson);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        Donor newDonor = gson.fromJson(reader, Donor.class);
        dao.insertDonor(newDonor);
        response.setStatus(HttpServletResponse.SC_CREATED);
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo != null && !pathInfo.equals("/")) {
            int sno = Integer.parseInt(pathInfo.substring(1));
            BufferedReader reader = request.getReader();
            Donor updatedDonor = gson.fromJson(reader, Donor.class);
            updatedDonor.setSno(sno);  // Ensure the donor's ID is set
            dao.updateDonor(updatedDonor);
            response.setStatus(HttpServletResponse.SC_OK);
        }
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo != null && !pathInfo.equals("/")) {
            int sno = Integer.parseInt(pathInfo.substring(1));
            dao.deleteDonor(sno);
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        }
    }
}
