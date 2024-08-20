<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manchester Blood Donation Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark">
        <h1 class="navbar-brand mb-0">Welcome to Manchester Blood Donation</h1>
        <div class="navbar-nav ml-auto">
            <div class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user-circle"></i> Welcome Admin
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="index.jsp">Logout</a>
                </div>
            </div>
        </div>
    </nav>
    <div class="sidebar">
        <a href="home.html" id="viewGraphs">View Donors</a>
        <a href="viewBlooddonationAppointments.jsp">Blood Donation Appointments</a>
        <a href="viewPlasmadonationAppointments.jsp">Plasma Donation Appointments</a>
        <a href="viewPlateletdonationAppointment.jsp">Platelet Donation Appointment</a>
        <a href="viewOrgandonationAppointments.jsp">Organ Donation Registrations</a>   
    </div>

    <div class="main-content">
        <div id="initialSection">
            <div id="graphsSection">
                <h2>Bookings and Registrations for This Month</h2>
                <div class="top-chart">
                    <div class="chart-container">
                        <canvas id="lineChart"></canvas>
                    </div>
                </div>
                <div>
                    <div class="chart-container">
                        <canvas id="pieChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="script.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
