package controllers;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.io.IOException;

@WebServlet("/Login")
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idToken = request.getParameter("id_token");

        // Check if the token is missing and redirect back to the login page with an error
        if (idToken == null) {
            response.sendRedirect("./index.jsp?error=missing_token");
            return;
        }

        try {
            // Decode the JWT to extract user information
            DecodedJWT jwt = JWT.decode(idToken); // Use Auth0 Java SDK for full verification in production

            // Extract user claims from the token
            String username = jwt.getClaim("name").asString();
            String email = jwt.getClaim("email").asString();

            // Create an HTTP session and store user details
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("email", email);

            // Redirect the user to the main user page after successful authentication
            response.sendRedirect("./peoplelogin.jsp");
        } catch (Exception e) {
            // Handle any exceptions during the decoding process and redirect with an error
            e.printStackTrace();
            response.sendRedirect("./index.jsp?error=invalid_token");
        }
    }
}
