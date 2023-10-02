<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Course Management System - Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
/*          */
    
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

#header {
  background-color: #cbd6d2ec;
  display: flex;
  align-items: center;
  top: 0;
  justify-content: flex-start;
  background-color: #ffffff;
  width: 100%;
    margin-bottom: 50px;
    padding: 5px 5px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

        #header img {
            height: 50px;
            width: 50px;
            margin-right: 10px;
        }

        #header h1 {
            color: black;
            margin: 0;
            font-size: 26px;
            margin-right: 90px;
        }
        #teacher-info-btn {
    background-color: transparent;
    color: blue;
    padding: 0;
    text-align: center;
    text-decoration: none;
    font-size: 20px;
    border: none;
    cursor: pointer;
    margin-left: auto;
    margin-right: 100px;
    display: inline;
}


        #teacher-info-btn:hover {
  background-color: #dee4eb;
}
         #login-form {
        background-color: rgba(255, 255, 255, 0.8);
        width: 400px;
        margin: 100px auto;
        padding: 30px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
    }

    .form-field {
        margin-bottom: 20px;
    }

    .form-field label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .form-field input[type="text"],
    .form-field input[type="password"] {
        width: 90%; /* Adjust the width as per your preference */
        padding: 8px; /* Adjust the padding as per your preference */
        border-radius: 3px;
        border: 1px solid #ccc;
    }

    button[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        font-size: 14px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    button[type="submit"]:hover {
        background-color: #45a049;
    }
    .form-field label i {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <div id="header">
        <img src="https://th.bing.com/th/id/OIP.gy2p65lrtMPs4MPK-5VHFAHaHa?w=175&h=180&c=7&r=0&o=5&pid=1.7" alt="Logo">
        <h1 style="margin-left: 10px;">Course Management System</h1>
        <div>
            <h2><a id="teacher-info-btn" href="teacherinfo.jsp">Teacher Info</a></h2>
        </div>
    </div>

<div id="login-form">
    <h2 align = center>Login</h2>
    <form action="homeServ" method="post">
        <div class="form-field">
            <label for="username">
                <i class="fas fa-user"></i> Username
            </label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
        </div>

        <div class="form-field">
            <label for="password">
                <i class="fas fa-lock"></i> Password
            </label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>
		
        <div class="form-field">
        	 <% if (request.getAttribute("error") != null) { %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
    <% } %>
            <button type="submit">Submit</button>
        </div>
    </form>
</div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js">
    
    // Clear form values on page load
     window.addEventListener("pageshow", function (event) {
            if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
                var form = document.getElementById("login-form");
                form.reset();
            }
        });
    
    </script>

</body>
</html>
