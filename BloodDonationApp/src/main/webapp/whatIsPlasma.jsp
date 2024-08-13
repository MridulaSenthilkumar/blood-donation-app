<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>What is Plasma?</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://media.wired.com/photos/5926eed2cefba457b079b9ac/master/w_2560%2Cc_limit/STORY-155149909-grey.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
            padding: 20px;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .navbar-nav .nav-item .nav-link {
            color: #ffffff;
        }
        .navbar-nav .nav-item .nav-link:hover {
            color: #d9534f;
        }
        .navbar-brand {
            color: #d9534f;
            font-weight: bold;
        }
        .search-bar {
            max-width: 300px;
        }
        .info-section {
            max-width: 900px;
            margin: 0 auto;
            padding: 30px;
            border-radius: 12px;
            background: rgba(0, 0, 0, 0.5);
            text-align: center;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }
        .info-section h2, .info-section h3 {
            color: #d9534f;
            font-weight: 600;
        }
        .book-btn {
            background-color: #d9534f;
            color: #fff;
            transition: background-color 0.3s, transform 0.3s;
        }
        .book-btn:hover {
            background-color: #c9302c;
            transform: scale(1.05);
        }
        .navbar-right {
            display: flex;
            align-items: center;
            margin-left: auto;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="peoplelogin.jsp">Blood Donation</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="peoplelogin.jsp">Home</a>
                </li>
                <!-- Dropdown for Plasma -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Plasma
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="whatisplasma.jsp">What is Plasma?</a>
                        <a class="dropdown-item" href="donatePlasma.jsp">Donate Plasma</a>
                        <a class="dropdown-item" href="whoCanDonatePlasma.jsp">Who Can Donate Plasma?</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Why give blood</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Who can give blood</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Where to donate</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">News and campaigns</a>
                </li>
            </ul>
            <div class="navbar-right">
                <!-- Search Bar -->
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2 search-bar" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <!-- Book Appointment Button -->
                <button class="btn btn-primary ml-3 book-btn" onclick="window.location.href='BookAppointment.jsp'">Book Appointment</button>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <div class="info-section">
            <h2>What is Plasma?</h2>
            <p>Plasma is the yellowish liquid component of blood that remains after red blood cells, white blood cells, and platelets have been removed. It makes up about 55% of total blood volume and contains water, salts, enzymes, antibodies, and other proteins.</p>
            
            <h3>Role of Plasma</h3>
            <ul>
                <li><strong>Transport:</strong> Plasma transports nutrients, hormones, and proteins to the parts of the body that need it.</li>
                <li><strong>Regulation:</strong> It helps maintain blood pressure and volume, and regulates body temperature.</li>
                <li><strong>Protection:</strong> Plasma contains proteins that help to clot blood and fight infections.</li>
            </ul>
            
            <h3>Plasma Donation</h3>
            <p>Plasma donation is similar to blood donation but focuses on extracting only the plasma component. It is used to treat patients with conditions such as hemophilia, liver disease, and certain types of cancer. Plasma can be donated more frequently than whole blood, making it a valuable resource in medical treatments.</p>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
