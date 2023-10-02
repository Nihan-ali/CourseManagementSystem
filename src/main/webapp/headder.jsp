<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Course Management System - Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
              body {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  padding: 0px;
  margin: 0px;
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
}

#header {
  background-color: #cbd6d2ec;
  display: flex;
  align-items: center;
  justify-content: flex-start;
  background-color: #ffffff;
  width: 100%;
  margin-bottom: 90px;
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
  margin-right: 100px;
}

#my-dashboard {
  color: black;
  font-weight: bold;
  font-size: 20px;
  margin-left: 120px;
}

#logout-box {
  background-color: transparent;
  display: flex;
  align-items: center;
  border-radius: 5px;
  padding: 5px 10px;
  margin-left: auto;
  font-weight: bold;
}

#name {
  margin-right: 10px;
}

#logout-button {
  background-color: #3498DB;
  color: #FFF;
  border: none;
  padding: 8px 12px;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  text-decoration: none;
}

#logout-button i {
  margin-right: 5px;
}

    </style>
</head>
<body>
    <div id="header">
        <img src="https://th.bing.com/th/id/OIP.gy2p65lrtMPs4MPK-5VHFAHaHa?w=175&h=180&c=7&r=0&o=5&pid=1.7" alt="Logo">
        <h1>Course Management System</h1>
        <h3><span id="my-dashboard">My Dashboard</span></h3>
        
        <div id="logout-box">
        <span id="name">Your Name</span>
            <button id="logout-button" onclick="location.href='home.jsp'">
                <i class="fas fa-sign-out-alt"></i> Log Out
            </button>
        </div>
    </div>
</body>
</html>
