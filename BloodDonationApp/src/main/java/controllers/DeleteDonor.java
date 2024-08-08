package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.*;

/**
 * Servlet implementation class DeleteDonor
 */
@WebServlet("/DeleteDonor")
public class DeleteDonor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDonor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DonorDAO dao = new DonorDAO();
		String sno = request.getParameter("sno");
		int oneid = Integer.parseInt(sno.trim());
	     // Retrieve the film by ID before deleting
	    
	    dao.deleteDonor(oneid); // Delete the retrieved film
	  response.sendRedirect("./DisplayDonor");
	}
		
	
}
