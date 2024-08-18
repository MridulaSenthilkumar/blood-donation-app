<!-- First Navbar: Blood Donation Title Only -->
<nav class="navbar navbar-light bg-light">
    <a class="navbar-brand" href="peoplelogin.jsp">Blood Donation</a>
</nav>

<!-- Second Navbar: Main Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="peoplelogin.jsp">Home</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlood" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Blood Donation
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownBlood">
                    <a class="dropdown-item" href="whyDonateBlood.jsp">Why Donate Blood?</a>
                    <a class="dropdown-item" href="bloodTypes.jsp">Blood Types</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPlasma" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Plasma Donation
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownPlasma">
                    <a class="dropdown-item" href="whatIsPlasma.jsp">What is Plasma?</a>
                    <a class="dropdown-item" href="whyDonatePlasma.jsp">Why Donate Plasma?</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPlatelet" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Platelet Donation
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownPlatelet">
                    <a class="dropdown-item" href="whatIsPlatelet.jsp">What is Platelet?</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="liveBeyondLife.jsp">Live beyond your life</a>
            </li>
        </ul>

        <!-- Search Bar and Book Appointment Button -->
        <div class="navbar-right">
            <form class="form-inline search-form">
                <input class="form-control mr-sm-2 search-bar" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <button class="btn btn-primary book-btn ml-2" onclick="window.location.href='BookAppointment.jsp'">Book Appointment</button>
        </div>
    </div>
</nav>
