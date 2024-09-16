<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manchester Blood Donation Department</title>
    
    <!-- Google Fonts and Font Awesome -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    
    <!-- Bootstrap and custom styles -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://media.wired.com/photos/5926eed2cefba457b079b9ac/master/w_2560%2Cc_limit/STORY-155149909-grey.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .navbar-custom {
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .navbar-custom .navbar-brand {
            font-size: 2rem;
            font-weight: 600;
            color: #333;
            text-align: center;
            flex: 1;
        }

        .header-section {
            text-align: center;
            margin-top: 50px;
            margin-bottom: 40px;
            color: white;
        }

        .header-section p {
            font-size: 1.2rem;
            color: #dcdcdc;
        }

        .login-section {
            max-width: 450px;
            margin: 0 auto;
            padding: 30px;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
        }

        .login-section button {
            font-size: 1.1rem;
            padding: 12px;
            border-radius: 25px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .login-section button:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
        }

        .btn-primary {
            background-color: #d9534f;
            border: none;
        }

        .btn-primary:hover {
            background-color: #c9302c;
        }

        .btn-secondary {
            background-color: #5bc0de;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #31b0d5;
        }

        .admin-login-form {
            display: none;
            margin-top: 20px;
        }

        .admin-login-form input {
            border-radius: 20px;
        }

        .admin-login-form .btn-back {
            margin-bottom: 20px;
            background-color: #f0ad4e;
            border: none;
        }

        .admin-login-form .btn-back:hover {
            background-color: #ec971f;
        }

        /* Add subtle fade-in effect for form elements */
        .fade-in {
            opacity: 0;
            animation: fadeIn 1s forwards;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

    </style>

    <script src="https://cdn.auth0.com/js/lock/11.34/lock.min.js"></script>
    <script>
        var lock;

        document.addEventListener("DOMContentLoaded", function() {
            console.log('DOM content loaded. Initializing Auth0 Lock...');
            lock = new Auth0Lock(
                'ZnRj1qFKOIav6Z1zb5ycdBQXtwZtrWtj',
                'dev-h42pkcp3clbxcoh5.us.auth0.com',
                {
                    auth: {
                        redirectUrl: 'http://localhost:8080/BloodDonationApp/Login',
                        responseType: 'token id_token',
                        params: {
                            scope: 'openid profile email'
                        }
                    }
                }
            );

            console.log('Auth0 Lock initialized:', lock);
        });

        function login() {
            if (lock) {
                console.log('Showing Auth0 Lock widget...');
                lock.show(); 
            } else {
                console.error('Auth0 Lock is not initialized.');
            }
        }

        function handleAuthentication() {
            lock.on("authenticated", function(authResult) {
                console.log('Authenticated:', authResult);
                // Sending the token to login servlet
                localStorage.setItem('id_token', authResult.idToken);
                window.location.href = 'http://localhost:8080/BloodDonationApp/Login?id_token=' + authResult.idToken;
            });
        }
        
        
        function showAdminLogin() {
            console.log('Showing Admin Login Form...');
            document.getElementById('adminLoginForm').classList.add('fade-in');
            document.getElementById('adminLoginForm').style.display = 'block';
            document.getElementById('userLoginButton').style.display = 'none';
            document.getElementById('adminLoginButton').style.display = 'none';
        }

        function showLoginOptions() {
            console.log('Showing Login Options...');
            document.getElementById('adminLoginForm').style.display = 'none';
            document.getElementById('userLoginButton').style.display = 'block';
            document.getElementById('adminLoginButton').style.display = 'block';
        }

    </script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-custom">
    <a class="navbar-brand" href="#">Blood Bridge Manchester</a>
</nav>

<div class="container">
    <div class="header-section">
        <p>Choose your login option below</p>
    </div>
    
    <!-- Login Section -->
    <div class="login-section">
        <button class="btn btn-primary btn-block" id="adminLoginButton" onclick="showAdminLogin()">Login as Admin <i class="fas fa-user-shield"></i></button>
        <button class="btn btn-secondary btn-block" id="userLoginButton" onclick="login()">Login as User <i class="fas fa-user"></i></button>
        
        <!-- Admin Login Form -->
        <div id="adminLoginForm" class="admin-login-form">
            <button class="btn btn-back btn-block" onclick="showLoginOptions()"><i class="fas fa-arrow-left"></i> Back</button>
            <form action="AdminLogin" method="post">
                <div class="form-group">
                    <label for="adminEmail">Email:</label>
                    <input type="email" id="adminEmail" name="adminEmail" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="adminPassword">Password:</label>
                    <input type="password" id="adminPassword" name="adminPassword" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login as Admin</button>
            </form>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<script>
    document.addEventListener("DOMContentLoaded", function() {
        handleAuthentication();
    });
</script>
</body>
</html>
