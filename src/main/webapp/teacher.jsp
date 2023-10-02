<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Available Teachers</title>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<style>



 .popup-background { 
     position: fixed; 
     top: 0; 
     left: 0; 
     width: 100%; 
     height: 100%; 
     background-color: rgba(0, 0, 0, 0.7); 
     z-index: 9999; 
     display: none; 
 } 

 .popup-form { 
     position: absolute; 
     top: 50%; 
     left: 50%; 
     transform: translate(-50%, -50%); 
     background-color: #f9f9f9; 
     padding: 20px; 
     border-radius: 5px; 
     width: 400px; 
 } 

 .form-group { 
     margin-bottom: 10px; 
 } 

 .form-group label { 
     display: block; 
     font-weight: bold; 
     margin-bottom: 5px; 
 } 

 .form-group select { 
     width: 100%; 
     padding: 10px; 
     border-radius: 5px; 
     border: 1px solid #ccc; 
     font-size: 16px; 
 } 

 .form-buttons { 
     margin-top: 20px; 
     text-align: right; 
 } 

 .form-buttons .btn { 
     padding: 10px 20px; 
     background-color: #4CAF50; 
     color: #fff; 
     border-radius: 5px; 
     border: none; 
     cursor: pointer; 
     font-size: 16px; 
     margin-left: 10px; 
 } 

 .form-buttons .btn:hover { 
     background-color: #3e8e41; 
 } 

 .form-buttons .btn:first-child { 
     background-color: #3e8e41; 
 } 



 .form-buttons .btn:first-child:hover { 
     background-color: #3e8e41; 
 } 

		
.container {
			display: inline-block;
			width: 60%;
			margin: 10px;
			padding: 10px;
			background-color: #ffffff;
			border-radius: 5px;
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		}
		
		.header {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin-bottom: 20px;
			border-bottom: 1px solid #ccc;
			padding-bottom: 10px;
		}
		
		.header h2 {
			font-size: 24px;
			margin: 0;
			padding: 0;
		}
		
		.btn {
			background-color: #4CAF50;
			color: white;
			border: none;
			padding: 10px 20px;
			font-size: 16px;
			cursor: pointer;
			display: inline-block;
			margin-right: 10px;
			margin-buttom:50px;
		}
		
		.btn:hover {
			background-color: #3e8e41;
		}
		
		.popup-background {
			position: fixed;
			top: 0;
			left: 0;
			height: 100%;
			width: 100%;
			background-color: rgba(0, 0, 0, 0.5);
			z-index: 1;
			display: none;
			justify-content: center;
			align-items: center;
			overflow: hidden;
		}

		.popup-form {
			background-color: white;
			padding: 20px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
			text-align: center;
			width: 80%;
			max-width: 500px;
			position: relative;
			z-index: 2;
			border-radius: 10px;
		}
		
		.form-label {
			display: block;
			margin-bottom: 10px;
			font-weight: bold;
			text-align: left;
		}
		
		.form-input {
			display: block;
			margin-bottom: 20px;
			padding: 10px;
			border: 1px solid #ccc;
			width: 100%;
			box-sizing: border-box;
			font-size: 16px;
		}
.course-table {
  width: 100%;
  margin-top: 20px;
  background-color: #e9f1fb;
  border-radius: 5px;
  padding: 10px;
}

.course-table table {
  width: 100%;
  border-collapse: collapse;
}

.course-table th,
.course-table td {
  padding: 10px;
  text-align: center;
  font-size: 14px;
}

.course-table thead {
  background-color: #007bff;
  color: #fff;
  font-weight: bold;
}

.course-table tbody tr:nth-child(even) {
  background-color: #f2f2f2;
}

.course-table tbody tr:hover {
  background-color: #e0e0e0;
}

.course-table th:first-child,
.course-table td:first-child {
  width: 20%;
}

.course-table th:nth-child(2),
.course-table td:nth-child(2) {
  width: 40%;
}

.course-table th:nth-child(3),
.course-table td:nth-child(3) {
  width: 20%;
}



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
            margin-bottom: 30px;
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
            font-weight:bold;
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

.menu-bar {
    width: 60%;
    margin: 0 auto; /* Center-align the menu bar */
    display: table;
    table-layout: fixed;
    border-collapse: separate;
    background-color: #f1f1f1;
    padding: 10px;
  }

  .menu-bar button {
    display: table-cell;
    width: 33.33%;
    text-align: center;
    padding: 10px;
    background-color: #87ceeb;
    color: #fff;
    border: none;
  }

  .menu-bar button.active {
    background-color: #1e90ff;
  }


#titl {
  display: flex;
  justify-content: space-between;
  align-items: baseline; /* Align items along the baseline */
  margin-bottom: 50px;
  margin-top: 30px;
  position: relative;
}


#titl::after {
  content: "";
  position: absolute;
  bottom: -15px; /* Adjust the position to align with the baseline */
  left: 0;
  width: 100%;
  height: 5px;
  background: linear-gradient(to right, #3498DB, #E74C3C);
}

#titl h2 {
  margin: 0;
}



.assign-course-button {
  margin-left: 380px; /* Add margin between the title and button */
}





</style>
</head>
<body>
	<div id="header">
		<img src="https://th.bing.com/th/id/OIP.gy2p65lrtMPs4MPK-5VHFAHaHa?w=175&h=180&c=7&r=0&o=5&pid=1.7" alt="Logo">
		<h1>Course Management System</h1>
		<h3 ><span id="my-dashboard"><b>Admin Dashboard</b></span></h3>
		<div id="logout-box">
			<span id="name">Admin</span>
			<button id="logout-button" onclick="location.href='home.jsp'">
				<i class="fas fa-sign-out-alt"></i> Log Out
			</button>
		</div>
	</div>
<nav class="menu-bar">
  <button type="button" onclick="redirectToCourses()">Courses</button>
  <button type="button" class="active" onclick="redirectToTeachers()">Teachers</button>
  <button type="button" onclick="redirectToStudents()">Students</button>
</nav>





 		<div>
		<% 
			// fetch teacher data
        String[] teachername = new String[20]; // Adjust the size as per your requirement
        String[] teacherrole = new String[20];
        String[] teachermail = new String[20];

        int total = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem", "root", "@livai");
            String query = "SELECT name,role,mail FROM teacher";
            PreparedStatement st = con.prepareStatement(query);

            ResultSet rs = st.executeQuery();
            int index = 0;
            while (rs.next()) {
                teachername[index] = rs.getString("name");
                teacherrole[index] = rs.getString("role");
                teachermail[index] = rs.getString("mail");
                index++;
                total++;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // fetch course data 
        String[] coursename = new String[20]; // Adjust the size as per your requirement
        String[] courseid = new String[20];
        String[] coursecredit = new String[20];
        String[] courseteacher = new String[20];

        int total1 = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem", "root", "@livai");
            String query = "SELECT coursecode,name,credit,teacher_name FROM courses";
            PreparedStatement st = con.prepareStatement(query);

            ResultSet rs = st.executeQuery();
            int index = 0;
            while (rs.next()) {
                coursename[index] = rs.getString("name");
                courseid[index] = rs.getString("coursecode");
                coursecredit[index] = rs.getString("credit");
                courseteacher[index] = rs.getString("teacher_name");
                index++;
                total1++;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
//         for (String lo:courseteacher){
//         	System.out.println(lo+"jdsjbd");
//         }
        %>
    </div>
    <div id="titl">
			<h2 align="left"><b>Faculty Members</b></h2>
			<button class="assign-course-button btn" onclick="showAssignForm()" >Assign Courses</button>			
		</div>
	<div class="container">
		
		<div class="teacher-table">
			<table class="table table-striped table-bordered course-table">
  <thead class="thead-dark">
    <% if(total!=0) { %>
    <tr>
      <th>Name</th>
      <th>Email</th>
      <th>Role</th>
    </tr>
    <% } %>
  </thead>
  <tbody>
    <% int iter = 0; %>
    <% while (iter != total) { %>
    <tr>
      <td ><%= teachername[iter] %></td>
      <td><%= teachermail[iter] %></td>
      <td><%= teacherrole[iter] %></td>
    </tr>
    <% iter++; } %>
  </tbody>
</table>


		</div>
		<div id="assign-form-background" class="popup-background" style="display:none;">
			<div id="assign-form" class="popup-form">
				<form action="AssignCourse" method="POST">
					<div class="form-group">
						<label for="teacher_id">Teacher:</label>
						<select id="teacher_id" name="teacher_id">
							<option value="">Select A Teacher</option>
							<% for(int i=0;i<total;i++) { %>
								<option value="<%= teachername[i] %>"><%= teachername[i] %></option>
							<% } %>
						</select>
					</div>
					<div class="form-group">
						<label for="course_id">Course:</label>
						<select id="course_id" name="course_id">
							<option value="">Available Courses</option>
							<% for(int i=0; i<total1; i++) { %>
								<%if(courseteacher[i]==null){%>
								<option value="<%= coursename[i] %>"><%= coursename[i] %></option>
							<%}}%>
						</select>

					</div>
					<div class="form-buttons">
						<input type="submit" value="Assign" class="btn">
						<button type="button" onclick="hideAssignForm()" class="btn">Cancel</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		function showAssignForm() {
			document.getElementById("assign-form-background").style.display = "block";
		}

		function hideAssignForm() {
			document.getElementById("assign-form-background").style.display = "none";
		}
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
	
<%-- 	<% response.sendRedirect("teacher.jsp"); %> --%>
	
</body>
</html>
