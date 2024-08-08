package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.DonorDAO;
import model.Donor;
/**
 * Servlet implementation class DisplayDonor
 */
@WebServlet("/DisplayDonor")
public class DisplayDonor extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DonorDAO dao = new DonorDAO();
	
	
    public DisplayDonor() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    ArrayList<Donor> donor = dao.getAllDonors();                  // Fetch all movies from the database
		    request.setAttribute("donor", donor);                      // Set the list of movies as an attribute in the request
		    RequestDispatcher rds = request.getRequestDispatcher("home.jsp");   // Forward the request to the "home.jsp" page to display the list
		    rds.include(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
