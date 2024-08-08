package controllers;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://mudfoot.doc.stu.mmu.ac.uk:6306/ + DB_USER";
    private static final String DB_USER = "senthilm"; 
    private static final String DB_PASSWORD = "seNtrile9"; 
    private static final String ADMIN_EMAIL = "blooddonateinfo@gmail.com"; 
    private static final String ADMIN_PASSWORD_HASH = "$2a$10$HI.Dy5ZWNNK3bNJB1P7ZcuvpMeHut/K26/5Zi31J0qiG8FhSn8Weq"; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("adminEmail");
        String password = request.getParameter("adminPassword");

        System.out.println("Admin login attempt with email: " + email);

        
        if (ADMIN_EMAIL.equals(email)) {
            System.out.println("Email matches. Verifying password...");
            if (verifyPassword(password, ADMIN_PASSWORD_HASH)) {
                System.out.println("Admin login successful");
                HttpSession session = request.getSession();
                session.setAttribute("userType", "admin");
                response.sendRedirect("./DisplayDonor");
            } else {
                System.err.println("Password verification failed");
                response.sendRedirect("./index.jsp?error=invalid");
            }
        } else {
            System.err.println("Email does not match");
            response.sendRedirect("./index.jsp?error=invalid");
        }
    }

    private boolean verifyPassword(String password, String hashedPassword) {
        System.out.println("Verifying password with bcrypt...");
        try {
            boolean isPasswordCorrect = org.mindrot.jbcrypt.BCrypt.checkpw(password, hashedPassword);
            System.out.println("Password verification result: " + isPasswordCorrect);
            return isPasswordCorrect;
        } catch (Exception e) {
            System.err.println("Error during password verification: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("JDBC Driver loaded.");
        } catch (ClassNotFoundException e) {
            throw new ServletException("Failed to load JDBC driver", e);
        }
    }
}
