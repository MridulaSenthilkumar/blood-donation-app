package controllers;

import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SendEmail() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the selected donors, subject, and message from the request
        String selectedDonorsParam = request.getParameter("selectedDonors");
        String emailSubject = request.getParameter("emailSubject");
        String emailMessage = request.getParameter("emailMessage");

        // Validate the input
        if (selectedDonorsParam == null || emailSubject == null || emailMessage == null) {
            response.getWriter().println("No donors selected or email subject/message missing.");
            return;
        }

        String[] selectedDonors = selectedDonorsParam.split(",");
        if (selectedDonors.length == 0) {
            response.getWriter().println("No donors selected.");
            return;
        }

        try {
            sendEmail(selectedDonors, emailSubject, emailMessage);
            response.getWriter().println("Emails sent successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error in sending emails: " + e.getMessage());
        }
    }

    private void sendEmail(String[] recipients, String subject, String messageText) throws MessagingException {
        // SMTP configurations
        String host = "smtp.gmail.com";
        final String user = "give your user email";
        final String password = "Give your app specfic password"; // App-specific password for Gmail

        // Setting up properties for the email session
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Create a session with an authenticator
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        // Create a new email message
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));
        message.setSubject(subject);
        message.setText(messageText);

        // Add recipients
        for (String recipient : recipients) {
            try {
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            } catch (AddressException e) {
                System.err.println("Invalid email address: " + recipient);
                // Continue with the next recipient
            }
        }

        // Send the email only if there are valid recipients
        if (message.getAllRecipients() != null && message.getAllRecipients().length > 0) {
            Transport.send(message);
            System.out.println("Emails sent successfully.");
        } else {
            System.err.println("No valid recipients found. No emails were sent.");
        }
    }
}
