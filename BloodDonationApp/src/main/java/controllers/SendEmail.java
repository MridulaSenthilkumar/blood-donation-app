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
        String[] selectedDonors = request.getParameter("selectedDonors").split(",");
        String emailSubject = request.getParameter("emailSubject");
        String emailMessage = request.getParameter("emailMessage");

        if (selectedDonors != null && selectedDonors.length > 0 && emailSubject != null && emailMessage != null) {
            try {
                sendEmail(selectedDonors, emailSubject, emailMessage);
                response.getWriter().println("Emails sent successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Error in sending emails: " + e.getMessage());
            }
        } else {
            response.getWriter().println("No donors selected or email subject/message missing.");
        }
    }
   
    private void sendEmail(String[] recipients, String subject, String messageText) throws MessagingException {
        String host = "smtp.gmail.com";
        final String user = "blooddonateinfo@gmail.com";
        final String password = "kilw cwas ocye evav"; // Use an app-specific password instead

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));
        message.setSubject(subject);
        message.setText(messageText);

        for (String recipient : recipients) {
            try {
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            } catch (AddressException e) {
                System.err.println("Invalid email address: " + recipient);
                continue;
            }
        }

        if (message.getAllRecipients() != null && message.getAllRecipients().length > 0) {
            Transport.send(message);
            System.out.println("Emails sent successfully.");
        } else {
            System.err.println("No valid recipients found. No emails were sent.");
        }
    }
}
