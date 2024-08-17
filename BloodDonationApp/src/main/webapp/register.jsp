<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Organ Donor Registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="peoplelogin.jsp">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <ul class="navbar-nav mr-auto">
            <!-- Donate Dropdown -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownDonate" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Donate
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownDonate">
                    <a class="dropdown-item" href="whatCanYouDonate.jsp">What Can You Donate?</a>
                </div>
            </li>
        </ul>

        <!-- Become a Living Donor Button -->
        <button class="btn btn-warning mr-2" onclick="window.location.href='becomeLivingDonor.jsp'">Become a Living Donor</button>

        <!-- Register Button -->
        <button class="btn btn-primary" onclick="window.location.href='register.jsp'">Register</button>
    </div>
</nav>

<!-- Registration Form -->
<div class="container mt-5">
    <h2>Organ Donor Registration</h2>
    <form action="./register" method="post">

        <!-- Personal Information -->
        <div class="form-group">
            <label for="firstName">First Name</label>
            <input type="text" class="form-control" id="firstName" name="firstName" required>
        </div>

        <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" class="form-control" id="lastName" name="lastName" required>
        </div>

        <div class="form-group">
            <label for="dob">Date of Birth</label>
            <input type="date" class="form-control" id="dob" name="dob" required>
        </div>

        <!-- Address Input -->
        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" class="form-control" id="address" name="address" required>
        </div>

        <!-- Contact Information -->
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="text" class="form-control" id="phone" name="phone" required>
        </div>

        <!-- Organ Donation Choice -->
        <div class="form-group">
            <label>I want to donate:</label><br>
            <div class="form-check">
                <input type="radio" class="form-check-input" id="donateAll" name="donationChoice" value="all" checked>
                <label class="form-check-label" for="donateAll">All my organs and tissue</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" id="donateSome" name="donationChoice" value="some">
                <label class="form-check-label" for="donateSome">Some organs and tissue</label>
            </div>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-success">Submit</button>
    </form>
</div>

</body>
</html>