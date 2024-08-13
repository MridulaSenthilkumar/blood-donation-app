<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Why Donate Plasma</title>
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
        .content-section {
            max-width: 900px;
            margin: 0 auto;
            padding: 30px;
            border-radius: 12px;
            background: rgba(0, 0, 0, 0.5);
            text-align: center;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }
        .content-section h2 {
            color: #d9534f;
            font-weight: 600;
        }
        .navbar-right .btn {
            margin-left: 10px;
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
                        <a class="dropdown-item" href="whyDonatePlasma.jsp">Why to Donate Plasma?</a>
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
                <!-- Search Bar and Button Container -->
                <form class="form-inline search-form">
                    <input class="form-control mr-sm-2 search-bar" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <!-- Book Appointment Button -->
                <button class="btn btn-primary book-btn" onclick="window.location.href='BookAppointment.jsp'">Book Appointment</button>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <div class="content-section">
            <h2>Why We Need Plasma Donors</h2>
            <p>Plasma makes up around 55% of your blood, and it carries platelets, red blood cells, and white blood cells around the body. Plasma contains antibodies, proteins, and other substances.</p>
            <p>On this page, we explain how we use plasma at NHS Blood and Transplant.</p>
            
            <h3>Plasma for Medicines</h3>
            <p>We use plasma donated at our plasma donor centers to make unique, life-saving medicines, which can be used to treat over 50 diseases. Often, these medicines are the only treatment option for patients with serious, even life-threatening, conditions. Every year, 17,000 people in England rely on the medicines made from plasma.</p>

            <h3>Who Plasma Medicines Help</h3>
            <p>Plasma contains antibodies called immunoglobulins. These can be made into medicines to treat people whose immune systems aren’t working as they should be. This can be caused by rare genetic conditions, called Primary Immune Disorders.</p>
            <p>Immunoglobulin medicines can also treat heart conditions, blood disorders, nervous system disorders, and infectious diseases.</p>
            <p>It takes about 21 plasma donations to help save the life of a baby with Kawasaki disease, by protecting their heart from complications. It takes 50 plasma donations to save the life of someone with a blood disorder called autoimmune hemolytic anemia, where their immune system is attacking their blood. It takes 56 plasma donations to help save the life of someone with an acute nervous system disorder called Guillain Barre Syndrome. It takes 124 plasma donations to help save someone's life if they have a bacterial infection called toxic shock syndrome. It can take 130 plasma donations every year to save someone's life if they have a Primary Immune Disorder.</p>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
