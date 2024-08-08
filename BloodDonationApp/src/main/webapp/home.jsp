<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manchester Blood Donation</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: url('https://media.wired.com/photos/5926eed2cefba457b079b9ac/master/w_2560%2Cc_limit/STORY-155149909-grey.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }
        .header-section {
            text-align: center;
            padding: 30px 0;
        }
        .header-section h1 {
            color: #d9534f;
            font-weight: 700;
        }
        .btn-add {
            margin-bottom: 20px;
        }
        .films-main {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
        }
        .custom-table thead {
            background-color: #d9534f;
            color: #fff;
        }
        .custom-table tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }
        .custom-table tbody tr:nth-child(even) {
            background-color: #ffffff;
        }
        .btn-primary {
            background-color: #d9534f;
            border-color: #d9534f;
        }
        .btn-primary:hover {
            background-color: #c9302c;
            border-color: #ac2925;
        }
        .btn-danger {
            background-color: #c9302c;
            border-color: #ac2925;
        }
        .btn-danger:hover {
            background-color: #ac2925;
            border-color: #941f24;
        }
        .search-icon {
            display: flex;
            align-items: center;
        }
        .search-icon i {
            margin-left: 5px;
        }
        .modal-header {
            background-color: #d9534f;
            color: #fff;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header-section">
        <h1 class="mt-5 mb-4 animate__animated animate__bounce">Manchester Blood Donors Details</h1>
        <form id="searchForm" class="form-inline float-md-right">
            <input id="searchInput" type="text" class="form-control mr-sm-2" placeholder="Search Here...">
            <button id="searchButton" type="submit" class="btn btn-primary search-icon">
                <i class="fas fa-search"></i>Search
            </button>
            <a href="ViewAppointment.jsp" class="button">View Appointments</a>
        </form>
        <div class="form-inline">
            <label for="filterBloodGroup" class="mr-2">Filter by Blood Group</label>
            <select id="filterBloodGroup" class="form-control">
                <option value="">Select Blood Group</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
            </select>
        </div>
    </div>
    <div class="films-main animate__animated animate__fadeInUp">
        <form id="donorForm" method="post">
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="selectAll">
                <label class="form-check-label" for="selectAll">Select All</label>
            </div>
            <table id="filmsTable" class="table table-bordered table-hover custom-table">
                <thead class="thead-dark">
                    <tr>
                        <th>Select</th>
                        <th>S.NO</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Blood Group</th>
                        <th>Email ID</th>
                        <th>Phone Number</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${donor}" var="donor">
                        <tr>
                            <td><input type="checkbox" name="selectedDonors" value="${donor.email}"></td>
                            <td>${donor.sno}</td>
                            <td>${donor.donorName}</td>
                            <td>${donor.address}</td>
                            <td>${donor.bloodgrp}</td>
                            <td>${donor.email}</td>
                            <td>${donor.phoneNumber}</td>
                            <td>
                                <a href="./UpdateDonor?sno=${donor.sno}" class="btn btn-sm btn-primary">Edit</a>
                                <a href="./DeleteDonor?sno=${donor.sno}" class="btn btn-sm btn-danger ml-1">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#emailModal">Send Email</button>
        </form>
    </div>
</div>

<!-- Modal HTML -->
<div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="emailModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="emailModalLabel">Send Email</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="emailForm">
                    <div class="form-group">
                        <label for="emailSubject">Subject</label>
                        <input type="text" class="form-control" id="emailSubject" name="emailSubject" required>
                    </div>
                    <div class="form-group">
                        <label for="emailMessage">Message</label>
                        <textarea class="form-control" id="emailMessage" name="emailMessage" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Recipients:</label>
                        <div id="recipientList">
                            <!-- Dynamically generated donor checkboxes will be inserted here -->
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Send Email</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Include Popper.js, Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="script.js"></script>
</body>
</html>

