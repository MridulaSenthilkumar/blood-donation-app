<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Appointment" %>
<%@ page import="database.DonorDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Appointments</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            text-align: center;
        }
        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">View Appointments</h2>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Donor Name</th>
                    <th>Address</th>
                    <th>Blood Group</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Appointment Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    DonorDAO dao = new DonorDAO();
                    ArrayList<Appointment> appointments = dao.getAppointmentsSortedByDate();

                    for (Appointment app : appointments) {
                %>
                    <tr>
                        <td><%= app.getDonorName() %></td>
                        <td><%= app.getAddress() %></td>
                        <td><%= app.getBloodgrp() %></td>
                        <td><%= app.getEmail() %></td>
                        <td><%= app.getPhoneNumber() %></td>
                        <td><%= app.getAppointmentDate() %></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="./DisplayDonor" class="btn btn-primary btn-back">Back to Home</a>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
