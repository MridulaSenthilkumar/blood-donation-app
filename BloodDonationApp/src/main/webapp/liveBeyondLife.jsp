<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Live Beyond Life - Organ Donation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://draravindan.com/wp-content/uploads/2021/10/patient-heart-donation.jpg');
            background-size: cover; /* Adjusts the size of the background image to cover the entire viewport */
            background-attachment: fixed; /* Keeps the background image fixed during scrolling */
            background-position: center; /* Centers the background image */
            color: #ffffff; /* Sets the default text color to white for better readability on a dark background */
        }
        .container {
            background-color: rgba(0, 0, 0, 0.5); /* Adds a semi-transparent black background to the container for better contrast */
            padding: 20px;
            border-radius: 8px;
        }
        h1, h2, h3, p {
            color: #ffffff; /* Ensures text color is white */
        }
        .story img {
            max-width: 100%;
            height: auto;
        }
    </style>
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
            <button class="btn btn-warning mr-2" onclick="window.location.href='https://www.organdonor.gov/learn/process/living-donation'">Become a Living Donor</button>
        </ul>

        <!-- Register Button -->
        <button class="btn btn-primary" onclick="window.location.href='register.jsp'">Register</button>
    </div>
</nav>

<div class="container mt-4">
    <h1>Organ Donation</h1>

    <!-- Introduction -->
    <section id="introduction">
        <h2>What is Organ Donation?</h2>
        <p>Organ donation is the process of giving an organ or tissue to be used in transplantation to replace a damaged or failing organ in another person. Donating organs can save or improve the lives of many people in need of a transplant. There are two main types of organ donation: living donation and deceased donation.</p>
        <p>Living donation involves a living person donating an organ, such as a kidney or part of the liver. Deceased donation occurs when a person who has passed away donates their organs.</p>
    </section>

    <!-- Statistics and Impact -->
    <section id="statistics" class="mt-4">
        <h2>Organ Donation Statistics</h2>
        <p>Every year, thousands of people receive life-saving transplants thanks to organ donors. However, many others are still waiting for a transplant. Here’s a snapshot of the current situation:</p>
        <ul>
            <li><strong>Number of people on the waiting list:</strong> 120,000+</li>
            <li><strong>Number of transplants performed annually:</strong> 40,000+</li>
            <li><strong>Number of donors registered:</strong> 10 million+</li>
        </ul>
    </section>

    <!-- How to Become a Donor -->
    <section id="register" class="mt-4">
        <h2>How to Become an Organ Donor</h2>
        <p>Becoming an organ donor is simple and can make a huge difference in someone's life. Here’s how you can register:</p>
        <ol>
            <li>Visit your local registry or a national registry website.</li>
            <li>Complete the registration form with your personal details.</li>
            <li>Inform your family about your decision to be a donor.</li>
            <li>Carry a donor card or mark your driver's license if applicable.</li>
        </ol>
        <p><a href="register.jsp" target="_blank" class="btn btn-info">Register Now</a></p>
    </section>

    <!-- FAQs -->
    <section id="faqs" class="mt-4">
        <h2>Frequently Asked Questions</h2>
        <dl>
            <dt>Who can be an organ donor?</dt>
            <dd>Most people can become organ donors regardless of age or medical history. Your suitability will be assessed at the time of donation.</dd>
            
            <dt>Will organ donation affect my medical care?</dt>
            <dd>No, your medical care will not be affected. Organ donation will only be considered once all efforts to save your life have been exhausted.</dd>
            
            <dt>Can I donate organs if I have a medical condition?</dt>
            <dd>Many conditions do not disqualify you from being a donor. Each case is evaluated individually.</dd>
        </dl>
    </section>

    <!-- Success Stories -->
    <section id="success-stories" class="mt-4">
        <h2>Success Stories</h2>
        <div class="story">
            <h3>Jane's Journey</h3>
            <p>Jane received a life-saving kidney transplant last year. Her recovery has been remarkable, and she's now back to enjoying life with her family.</p>
        </div>
        <div class="story mt-4">
            <h3>John's Gift</h3>
            <p>John decided to become an organ donor after losing a loved one. His donation helped several people, and his family takes comfort in his legacy.</p>
        </div>
    </section>

    <!-- Contact Information -->
    <section id="contact" class="mt-4">
        <h2>Contact Us</h2>
        <p>If you have any questions or need more information about organ donation, please reach out to us:</p>
        <p><strong>Email:</strong> info@organdonation.org</p>
        <p><strong>Phone:</strong> 1-800-123-4567</p>
    </section>
</div>

<!-- Bootstrap and JS scripts -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
