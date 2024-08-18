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


        if (idToken == null) {
            response.sendRedirect("./index.jsp?error=missing_token");
            return;
        }

        try {
            // Verify and decode the token using the Auth0 Java SDK or manually if needed
            DecodedJWT jwt = JWT.decode(idToken);  // Simplified example. Use Auth0 Java SDK for full verification

            String username = jwt.getClaim("name").asString();
            String email = jwt.getClaim("email").asString();
            String userType = jwt.getClaim("userType").asString();

            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("email", email);
            session.setAttribute("userType", userType);

            if ("admin".equalsIgnoreCase(userType)) {
                response.sendRedirect("./DisplayDonor");
            } else {
                response.sendRedirect("./peoplelogin.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("./index.jsp?error=invalid_token");
        }
    }
}
