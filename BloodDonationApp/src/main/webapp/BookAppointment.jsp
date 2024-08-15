<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1592123484164-9c0d3ea4d1d5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDJ8fGJsb29kJTIwZG9uYXRpb258ZW58MHx8fDE2NzMyNjQ0Njk&ixlib=rb-1.2.1&q=80&w=1080');
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            color: #fff;
        }
        .container {
            background-color: rgba(0, 0, 0, 0.75);
            padding: 40px;
            border-radius: 10px;
            max-width: 600px;
            margin-top: 50px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-family: 'Arial Black', sans-serif;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        .form-group label {
            font-weight: bold;
            color: #d9534f;
        }
        .form-control {
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.8);
            border: none;
        }
        .form-control:focus {
            border: none;
            box-shadow: 0 0 10px rgba(217, 83, 79, 0.6);
        }
        .btn-primary {
            background-color: #d9534f;
            border-color: #d9534f;
            font-weight: bold;
            padding: 10px;
            font-size: 18px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #c9302c;
            border-color: #ac2925;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Book Appointment</h2>
        <form action="BookAppointment" method="post">
            <div class="form-group">
                <label for="donationType">Type of Donation:</label>
                <select id="donationType" name="donationType" class="form-control" required>
                    <option value="blood">Blood Donation</option>
                    <option value="plasma">Plasma Donation</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="name">Donor Name:</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="Enter your name" required>
            </div>
            
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" class="form-control" placeholder="Enter your address" required>
            </div>
            
            <div class="form-group">
                <label for="bloodGroup">Blood Group:</label>
                <input type="text" id="bloodGroup" name="bloodGroup" class="form-control" placeholder="Enter your blood group" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
            </div>
            
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="Enter your phone number" required>
            </div>
            
            <div class="form-group">
                <label for="appointmentDate">Appointment Date:</label>
                <input type="date" id="appointmentDate" name="appointmentDate" class="form-control" required>
            </div>
            
            <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </form>
    </div>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
