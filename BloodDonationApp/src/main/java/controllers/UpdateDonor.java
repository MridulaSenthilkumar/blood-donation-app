package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.*;
import model.*;

@WebServlet("/UpdateDonor")
public class UpdateDonor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    DonorDAO dao = new DonorDAO();

    public UpdateDonor() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sno = request.getParameter("sno");
        int intsno = Integer.parseInt(sno.trim());
        Donor donor = dao.getDonorByID(intsno);
        request.setAttribute("donor", donor);
        request.getRequestDispatcher("./update.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sno = request.getParameter("sno");
        int intsno = Integer.parseInt(sno.trim());

        String donorName = request.getParameter("name");
        String address = request.getParameter("address");
        String blgrp = request.getParameter("bloodgroup");
        String email = request.getParameter("email");
        String ph = request.getParameter("phonenumber");

        Donor updatedDonor = new Donor(intsno, donorName, address, blgrp, email, ph);

        dao.updateDonor(updatedDonor);

        response.sendRedirect("./DisplayDonor");
    }
}
