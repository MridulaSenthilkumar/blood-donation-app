<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blood Donation Information</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1533089933452-e5009fc768a3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwyMDUyNzN8MHwxfGFsbHwxfHx8fHx8fDE2NzQxNTM3NjQ&ixlib=rb-1.2.1&q=80&w=1920');
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            color: #ffffff;
            padding: 20px;
        }
        .info-section {
            max-width: 900px;
            margin: 0 auto;
            padding: 30px;
            border-radius: 12px;
            background: rgba(0, 0, 0, 0.5);
            text-align: center;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            animation: fadeIn 2s ease-in-out;
            position: relative;
            overflow: hidden;
        }
        .info-section::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://www.w3schools.com/w3images/abstract.jpg'); /* Background animation image */
            background-size: cover;
            background-position: center;
            filter: blur(8px); /* Blur effect for the background image */
            z-index: -1;
        }
        .info-section h2, .info-section h3 {
            color: #d9534f;
            font-weight: 600;
        }
        .info-section p, .info-section ul {
            color: #f0f0f0;
            font-size: 16px;
        }
        .info-section ul {
            list-style: none;
            padding: 0;
        }
        .info-section ul li {
            margin-bottom: 10px;
        }
        .book-btn {
            margin-top: 20px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .book-btn:hover {
            background-color: #c9302c;
            transform: scale(1.05);
        }
        .stat-section, .testimonial-section {
            margin-top: 30px;
            padding: 20px;
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.8);
        }
        .stat-section h3, .testimonial-section h3 {
            color: #d9534f;
        }
        .testimonial {
            margin-bottom: 20px;
        }
        .testimonial p {
            font-size: 16px;
            font-style: italic;
        }
        .testimonial cite {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #333;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>
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
        
        <button class="btn btn-primary book-btn" onclick="window.location.href='BookAppointment.jsp'">Book Blood Donation</button>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
