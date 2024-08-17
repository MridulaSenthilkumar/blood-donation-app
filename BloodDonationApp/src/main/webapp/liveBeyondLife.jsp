<!-- liveBeyondLife.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Live Beyond Life</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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

<div class="container mt-4">
    <h1>Welcome to the Live Beyond Life Page</h1>
    <p>This is where you can find information about organ donation and ways to help others after your life.</p>
</div>

<!-- Bootstrap and JS scripts -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
