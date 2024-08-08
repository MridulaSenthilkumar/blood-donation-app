package controllers;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.security.interfaces.RSAPublicKey;
import java.util.Date;
import java.util.Map;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;
import com.auth0.jwt.interfaces.Claim;

import model.Utils;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final String DOMAIN = "dev-h42pkcp3clbxcoh5.us.auth0.com";
    private static final long CLOCK_SKEW = 60 * 1000; // Allow 1 minute clock skew

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idToken = request.getParameter("id_token");

        System.out.println("Received id_token: " + idToken);

        if (idToken == null) {
            System.err.println("No id_token found in request.");
            response.sendRedirect("./index.jsp?error=missing_token");
            return;
        }

        try {
            RSAPublicKey publicKey = Utils.getPublicKey();
            Algorithm algorithm = Algorithm.RSA256(publicKey, null);
            JWTVerifier verifier = JWT.require(algorithm)
                    .withIssuer("https://" + DOMAIN + "/")
                    .acceptLeeway(CLOCK_SKEW / 1000) // Allow clock skew in seconds
                    .build();

            DecodedJWT jwt = verifier.verify(idToken);

            String userType = jwt.getClaim("userType").asString();
            String username = jwt.getClaim("name").asString();
            String email = jwt.getClaim("email").asString();

            System.out.println("JWT verified. UserType: " + userType + ", Username: " + username + ", Email: " + email);

            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("email", email);
            session.setAttribute("userType", userType);

            if ("admin".equalsIgnoreCase(userType)) {
                System.out.println("Redirecting admin to DisplayDonor");
                response.sendRedirect("./DisplayDonor");
            } else {
                System.out.println("Redirecting user to peoplelogin.jsp");
                response.sendRedirect("./peoplelogin.jsp");
            }
        } catch (JWTVerificationException exception) {
            System.err.println("JWT verification failed: " + exception.getMessage());

            // Print the token's claims for debugging
            DecodedJWT decodedJWT = JWT.decode(idToken);
            Map<String, Claim> claims = decodedJWT.getClaims();
            claims.forEach((key, value) -> {
                if (value.asString() != null) {
                    System.out.println(key + ": " + value.asString());
                } else if (value.asDate() != null) {
                    System.out.println(key + ": " + value.asDate());
                } else if (value.asBoolean() != null) {
                    System.out.println(key + ": " + value.asBoolean());
                } else if (value.asInt() != null) {
                    System.out.println(key + ": " + value.asInt());
                } else if (value.asLong() != null) {
                    System.out.println(key + ": " + value.asLong());
                } else {
                    System.out.println(key + ": " + value.toString());
                }
            });

            Date notBefore = decodedJWT.getNotBefore();
            Date currentTime = new Date();
            System.err.println("Token not before (nbf) time: " + notBefore);
            System.err.println("Current server time: " + currentTime);

            response.sendRedirect("./index.jsp?error=invalid_token");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("./index.jsp?error=unknown_error");
        }
    }
}
