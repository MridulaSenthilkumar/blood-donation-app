package database;

import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import model.Appointment;
import model.Donor;

public class DonorDAO {
    private String user = "senthilm";
    private String password = "seNtrile9";
    private String url = "jdbc:mysql://mudfoot.doc.stu.mmu.ac.uk:6306/" + user;

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            return DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            throw new SQLException("Unable to connect to database", e);
        }
    }

    private Donor getNextDonor(ResultSet rs) throws SQLException {
        Donor thisDonor = new Donor();
        thisDonor.setSno(rs.getInt("sno"));
        thisDonor.setDonorName(rs.getString("donorName"));
        thisDonor.setAddress(rs.getString("address"));
        thisDonor.setbloodgrp(rs.getString("blgrp"));
        thisDonor.setEmail(rs.getString("email"));
        thisDonor.setPhoneNumber(rs.getString("ph"));
        return thisDonor;
    }

    public ArrayList<Donor> getAllDonors() {
        ArrayList<Donor> allDonors = new ArrayList<>();
        String query = "SELECT * FROM blood";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Donor oneDonor = getNextDonor(rs);
                allDonors.add(oneDonor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allDonors;
    }

    public Donor getDonorByID(int sno) {
        Donor oneDonor = null;
        String query = "SELECT * FROM blood WHERE sno = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, sno);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    oneDonor = getNextDonor(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return oneDonor;
    }

    public boolean insertDonor(Donor d) {
        String query = "INSERT INTO blood (donorName, address, blgrp, email, ph) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, d.getDonorName());
            pstmt.setString(2, d.getAddress());
            pstmt.setString(3, d.getbloodgrp());
            pstmt.setString(4, d.getEmail());
            pstmt.setString(5, d.getPhoneNumber());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateDonor(Donor d) {
        String query = "UPDATE blood SET donorName = ?, address = ?, blgrp = ?, email = ?, ph = ? WHERE sno = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, d.getDonorName());
            pstmt.setString(2, d.getAddress());
            pstmt.setString(3, d.getbloodgrp());
            pstmt.setString(4, d.getEmail());
            pstmt.setString(5, d.getPhoneNumber());
            pstmt.setInt(6, d.getSno());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void deleteDonor(int sno) {
        String query = "DELETE FROM blood WHERE sno = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, sno);
            if (pstmt.executeUpdate() <= 0) {
                throw new SQLException("Donor not deleted");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void saveAppointment(Appointment appointment) {
        String query = "INSERT INTO appointments (donorName, address, bloodGroup, email, phoneNumber, appointmentDate) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, appointment.getDonorName());
            pstmt.setString(2, appointment.getAddress());
            pstmt.setString(3, appointment.getBloodgrp());
            pstmt.setString(4, appointment.getEmail());
            pstmt.setString(5, appointment.getPhoneNumber());
            pstmt.setString(6, appointment.getAppointmentDate());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Appointment> getAppointmentsSortedByDate() {
        ArrayList<Appointment> appointments = new ArrayList<>();
        String query = "SELECT * FROM appointments ORDER BY appointmentDate";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setDonorName(rs.getString("donorName"));
                appointment.setAddress(rs.getString("address"));
                appointment.setBloodgrp(rs.getString("bloodGroup"));
                appointment.setEmail(rs.getString("email"));
                appointment.setPhoneNumber(rs.getString("phoneNumber"));
                appointment.setAppointmentDate(rs.getString("appointmentDate"));
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }

}
