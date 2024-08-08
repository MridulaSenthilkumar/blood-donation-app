<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manchester Blood Donation Department</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            background: url('https://media.wired.com/photos/5926eed2cefba457b079b9ac/master/w_2560%2Cc_limit/STORY-155149909-grey.jpg') no-repeat center center fixed;
        }
        .header-section {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 40px;
        }
        .header-section h1 {
            color: Blue;
        }
        .header-section p {
            color: #5a5a5a;
        }
        .login-section {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            background-color: #ffffff;
        }
        .btn-primary {
            background-color: #d9534f;
            border-color: #d9534f;
        }
        .btn-primary:hover {
            background-color: #c9302c;
            border-color: #ac2925;
        }
        .btn-secondary {
            background-color: #5bc0de;
            border-color: #46b8da;
        }
        .btn-secondary:hover {
            background-color: #31b0d5;
            border-color: #269abc;
        }
        .admin-login-form {
            display: none;
        }
    </style>
    <!-- Include Auth0 Lock script -->
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
                lock.show(); // This triggers the Auth0 Lock widget
            } else {
                console.error('Auth0 Lock is not initialized.');
            }
        }

        function showAdminLogin() {
            console.log('Showing Admin Login Form...');
            document.getElementById('adminLoginForm').style.display = 'block';
            document.getElementById('userLoginButton').style.display = 'none';
            document.getElementById('adminLoginButton').style.display = 'none';
        }
        
        function handleAuthentication() {
            lock.on("authenticated", function(authResult) {
                console.log('Authenticated:', authResult);
                // Send the token to your server
                localStorage.setItem('id_token', authResult.idToken);
                window.location.href = 'http://localhost:8080/BloodDonationApp/Login?id_token=' + authResult.idToken;
            });
        }
    </script>
</head>
<body>
<div class="container">
    <div class="header-section">
        <h1>Welcome to Manchester Blood Donation Department</h1>
        <p>Please choose your login option</p>
    </div>
    
    <!-- Login Section -->
    <div class="login-section">
        <button class="btn btn-primary btn-block" id="adminLoginButton" onclick="showAdminLogin()">Login as Admin</button>
        <button class="btn btn-secondary btn-block" id="userLoginButton" onclick="login()">Login as User</button>
        
        <!-- Admin Login Form -->
        <div id="adminLoginForm" class="admin-login-form">
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

<!-- Bootstrap JS and other scripts -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- Call handleAuthentication function after DOM load -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        handleAuthentication();
    });
</script>
</body>
</html>