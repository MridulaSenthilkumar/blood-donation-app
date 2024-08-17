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
import java.util.List;

@WebServlet("/donorAPI/*")
public class DonorAPI extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final DonorDAO dao = new DonorDAO();
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            // Handle query parameters for search and blood group filtering
            String searchTerm = request.getParameter("search");
            String bloodGroup = request.getParameter("bloodGroup");

            List<Donor> donors = dao.getAllDonors();

            // Filter donors by search term if provided
            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                String lowerCaseSearchTerm = searchTerm.toLowerCase();
                donors = donors.stream()
                        .filter(donor -> donor.getDonorName().toLowerCase().contains(lowerCaseSearchTerm))
                        .toList();
            }

            // Filter donors by blood group if provided
            if (bloodGroup != null && !bloodGroup.trim().isEmpty()) {
                donors = donors.stream()
                        .filter(donor -> donor.getbloodgrp().equalsIgnoreCase(bloodGroup))
                        .toList();
            }

            String donorsJson = gson.toJson(donors);
            response.setContentType("application/json");
            response.getWriter().write(donorsJson);
        } else {
            // Handle request for specific donor by ID
            try {
                int sno = Integer.parseInt(pathInfo.substring(1));
                Donor donor = dao.getDonorByID(sno);
                if (donor != null) {
                    String donorJson = gson.toJson(donor);
                    response.setContentType("application/json");
                    response.getWriter().write(donorJson);
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    response.getWriter().write("Donor not found");
                }
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Invalid donor ID");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (BufferedReader reader = request.getReader()) {
            Donor newDonor = gson.fromJson(reader, Donor.class);
            dao.insertDonor(newDonor);
            response.setStatus(HttpServletResponse.SC_CREATED);
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid donor data: " + e.getMessage());
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo != null && !pathInfo.equals("/")) {
            try {
                int sno = Integer.parseInt(pathInfo.substring(1));
                try (BufferedReader reader = request.getReader()) {
                    Donor updatedDonor = gson.fromJson(reader, Donor.class);
                    updatedDonor.setSno(sno);  // Ensure the donor's ID is set
                    dao.updateDonor(updatedDonor);
                    response.setStatus(HttpServletResponse.SC_OK);
                }
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Invalid donor ID: " + e.getMessage());
            } catch (Exception e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Invalid donor data: " + e.getMessage());
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Donor ID is required");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo != null && !pathInfo.equals("/")) {
            try {
                int sno = Integer.parseInt(pathInfo.substring(1));
                dao.deleteDonor(sno);
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Invalid donor ID: " + e.getMessage());
            } catch (Exception e) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Error deleting donor: " + e.getMessage());
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Donor ID is required");
        }
    }
}
