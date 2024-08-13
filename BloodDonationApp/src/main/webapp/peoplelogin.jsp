<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blood Donation Information</title>
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
        .search-form {
            display: flex;
            align-items: center;
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
                        <a class="dropdown-item" href="whatIsPlasma.jsp">What is Plasma?</a>
                        <a class="dropdown-item" href="whyDonatePlasma.jsp">Why to donate Plasma?</a>
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
        <div class="info-section">
            <h2>Importance of Blood Donation</h2>
            <p>Blood donation is a critical act of kindness that saves lives. It is essential for surgeries, trauma care, cancer treatments, and many other medical needs. By donating blood, you help ensure that hospitals and clinics have the resources to provide the care that patients need.</p>
            
            <h3>Blood Group Compatibility</h3>
            <ul>
                <li><strong>O-</strong> is a universal donor and can donate to all blood groups.</li>
                <li><strong>AB+</strong> is a universal recipient and can receive from all blood groups.</li>
                <li><strong>O+</strong> can donate to A+, B+, AB+, and O+.</li>
                <li><strong>A-</strong> can donate to A+ and A- and AB+ and AB-.</li>
                <li><strong>B-</strong> can donate to B+ and B- and AB+ and AB-.</li>
                <li><strong>AB-</strong> can donate to AB+ and AB- only.</li>
            </ul>
            
            <div class="stat-section">
                <h3>Global Impact of Blood Donation</h3>
                <p>Every two seconds, someone in the world needs blood. Blood donations are crucial for trauma victims, cancer patients, and people undergoing surgeries. It is estimated that a single donation can save up to three lives. Each year, millions of lives are saved through blood donations worldwide, making it a vital part of global health systems.</p>
                <p>In the U.S., around 16 million blood donations are made annually, helping to maintain a stable supply. Globally, blood donation drives are essential in providing life-saving support across various medical emergencies and treatments.</p>
            </div>

            <div class="testimonial-section">
                <h3>What Donors Say</h3>
                <div class="testimonial">
                    <p>"Donating blood is a small act that makes a big difference. Knowing that I am contributing to saving lives gives me a sense of fulfillment and purpose."</p>
                    <cite>- John Doe, Regular Donor</cite>
                </div>
                <div class="testimonial">
                    <p>"The process was quick and easy. The staff was very professional and made me feel comfortable. I am glad I could help those in need."</p>
                    <cite>- Jane Smith, First-Time Donor</cite>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
