<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Donor Details</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link href="styles.css" rel="stylesheet">
</head>
<body class="background-container">

<div class="container mt-4">
  <div class="form-container">
    <div class="update-donor">
      <h2>Update Donor Details: <span>${donor.getDonorName()}</span> </h2>
      <form action="UpdateDonor" method="POST">
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" class="form-control" id="name" name="name" value="${donor.getDonorName()}">
        </div>
        <div class="form-group">
          <label for="address">Address:</label>
          <input type="text" class="form-control" id="address" name="address" value="${donor.getAddress()}">
        </div>
        <div class="form-group">
          <label for="bloodgroup">Blood Group:</label>
          <input type="text" class="form-control" id="bloodgroup" name="bloodgroup" value="${donor.getbloodgrp()}">
        </div>
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="text" class="form-control" id="email" name="email" value="${donor.getEmail()}">
        </div>
        <div class="form-group">
          <label for="Phonenumber">Phone Number:</label>
          <input type="text" class="form-control" id="phonenumber" name="phonenumber" value="${donor.getPhoneNumber()}">
        </div>
        <input type="hidden" name="sno" value="${donor.getSno()}">
        <button type="submit" class="btn btn-primary">Update</button>
      </form>
    </div>
  </div>
</div>

<!-- Bootstrap JS (optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
