<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Admin Panel</title>
	<link rel="stylesheet" href="cts.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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

		.container {
			display: inline-block;
			margin: 10px;
			padding: 10px;
			background-color: #ffffff;
			border-radius: 5px;
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		}

		.container h2 {
			margin: 0;
		}

		.container a {
			text-decoration: none;
			color: #333;
		}

		.container a:hover {
			text-decoration: underline;
		}


	</style>
</head>
<body>
	<div id="header">
		<img src="https://th.bing.com/th/id/OIP.gy2p65lrtMPs4MPK-5VHFAHaHa?w=175&h=180&c=7&r=0&o=5&pid=1.7" alt="Logo">
		<h1>Course Management System</h1>
		<h3 ><span id="my-dashboard">Admin Dashboard</span></h3>
		<div id="logout-box">
			<span id="name">Admin</span>
			<button id="logout-button" onclick="location.href='home.jsp'">
				<i class="fas fa-sign-out-alt"></i> Log Out
			</button>
		</div>
	</div>

	<nav class="menu-bar">
  <button type="button"  onclick="redirectToCourses()">Courses</button>
  <button type="button"  onclick="redirectToTeachers()">Teachers</button>
  <button type="button" onclick="redirectToStudents()">Students</button>
</nav>

	<script>
		function redirectToCourses() {
			window.location.href = "courses.jsp";
		}
		function redirectToTeachers() {
			window.location.href = "teacher.jsp";
		}		
		function redirectToStudents() {
			window.location.href = "student.jsp";
		}
	</script>

</body>

</html>