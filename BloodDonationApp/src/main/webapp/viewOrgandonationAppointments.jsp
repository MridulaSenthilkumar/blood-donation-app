<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.OrganRegistration" %>
<%@ page import="database.DonorDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Organ Donation Registrations</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f2f2f2;
            padding-top: 40px;
            background: url('https://media.wired.com/photos/5926eed2cefba457b079b9ac/master/w_2560%2Cc_limit/STORY-155149909-grey.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            margin: auto;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-family: 'Arial Black', sans-serif;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #333;
        }
        .table {
            margin-top: 20px;
        }
        .table th {
            background-color: #5cb85c;
            color: #fff;
            border: none;
        }
        .table td {
            vertical-align: middle;
            color: #555;
        }
        .btn-back {
            margin-top: 20px;
            background-color: #5cb85c;
            border-color: #5cb85c;
            color: #fff;
            font-weight: bold;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }
        .btn-back:hover {
            background-color: #4cae4c;
            border-color: #4cae4c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Organ Donation Registrations</h2>
        <table class="table table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Donor Name</th>
                    <th>Address</th>
                    <th>Blood Group</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Donation Choice</th>
                </tr>
            </thead>
            <tbody>
                <%
                    DonorDAO dao = new DonorDAO();
                    ArrayList<OrganRegistration> registrations = dao.getAllOrganRegistrations();

                    for (OrganRegistration registration : registrations) {
                %>
                    <tr>
                        <td><%= registration.getDonorName() %></td>
                        <td><%= registration.getAddress() %></td>
                        <td><%= registration.getBloodGroup() %></td>
                        <td><%= registration.getEmail() %></td>
                        <td><%= registration.getPhoneNumber() %></td>
                        <td><%= registration.getDonationChoice() %></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="AdminOpen.jsp" class="btn btn-back btn-block">Back to Options</a>
    </div>