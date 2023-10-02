<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>Courses</title>
	<link rel="stylesheet" href="courses.css">
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
			width: 60%;
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
  bottom: -15px; 
  left: 0;
  width: 100%;
  height: 5px;
  background: linear-gradient(to right, #3498DB, #E74C3C);
}

#titl h2 {
  margin: 0;
}

.dlt-course-button {
  margin-left: 180px; /* Add margin between the title and button */
}

.add-course-button {
  margin-left: 180px; /* Add margin between the title and button */
}
	
.black-button {
    background-color: black;
    color: white;
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
  <button type="button" class="active" onclick="redirectToCourses()">Courses</button>
  <button type="button"  onclick="redirectToTeachers()">Teachers</button>
  <button type="button" onclick="redirectToStudents()">Students</button>
</nav>
		<div>
		<% 
        String[] coursename = new String[20]; // Adjust the size as per your requirement
        String[] courseid = new String[20];
        String[] coursecredit = new String[20];

        int total = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem", "root", "@livai");
            String query = "SELECT name,coursecode,credit FROM courses";
            PreparedStatement st = con.prepareStatement(query);

            ResultSet rs = st.executeQuery();
            int index = 0;
            while (rs.next()) {
                coursename[index] = rs.getString("name");
                courseid[index] = rs.getString("coursecode");
                coursecredit[index] = rs.getString("credit");
                index++;
                total++;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
        </div>
        
        <div class="header" id="titl">
  <h2><b>Available Courses</b></h2>
  <button class="add-course-button btn" onclick="showPopupForm()">
    <i class="fas fa-plus"></i> Add New Course
  </button>
  <button class="dlt-course-button btn" onclick="showDeleteForm()">
    <i class="fas fa-trash"></i> Delete Course
  </button>
</div>

			
			<div class="container">
				

		<div class="course-table">
  <table class="table table-striped table-bordered">
    <thead class="thead-dark">
      <% if(total!=0) { %>
      <tr>
        <th>Course ID</th>
        <th>Course Name</th>
        <th>Course Credit</th>
      </tr>
      <% } %>
    </thead>
    <tbody>
      <% int iter = 0; %>
      <% while (iter!=total) { %>
      <tr>
        <td><%= coursename[iter] %></td>
        <td><%= courseid[iter] %></td>
        <td><%= coursecredit[iter] %></td>
      </tr>
      <% iter++;} %>
    </tbody>
  </table>
</div>
</div>

	<div id="popup-background" class="popup-background">
		<div id="popup-form" class="popup-form">
			<form action="JoinCourses" method="POST">
		    <h2>Add New Course</h2>
		    <label for="course_name" class="form-label">Course Name:</label>
		    <input type="text" id="course_name" name="course_name" class="form-input"><br>
		    
		    <label for="course_code" class="form-label">Course Code:</label>
		    <input type="text" id="course_code" name="course_code" class="form-input"><br>            
		    
		    <label for="course_credit" class="form-label">Course Credit:</label>
		    <input type="text" id="course_credit" name="course_credit" class="form-input"><br>
		    
		    <input type="submit" value="Add Course" class="btn">
		    <button type="button" onclick="hidePopupForm()" class="btn">Cancel</button>
		</form>

		</div>
	</div>
		<div id="delete-form-background" class="popup-background">
		  <div id="delete-form" class="popup-form">
		    <form action="DeleteCourse" method="POST">
		      <h2>Delete Course</h2>
		      <label for="course_id" class="form-label">Course ID:</label>
		      <select id="course_id" name="course_id" class="form-input">
		        <% 
		          try {
		            Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem", "root", "@livai");
		            String query = "SELECT coursecode, name FROM courses";
		            PreparedStatement st = con.prepareStatement(query);
		            ResultSet rs = st.executeQuery();
		
		            while (rs.next()) {
		              String courseId = rs.getString("coursecode");
		              String courseName = rs.getString("name");
		              %>
		              <option value="<%= courseId %>"><%= courseId %> - <%= courseName %></option>
		              <% 
		            }
		            con.close();
		          } catch (Exception e) {
		            e.printStackTrace();
		          }
		        %>
		      </select>
		      <input type="submit" value="Delete Course" class="btn">
		      <button type="button" onclick="hideDeleteForm()" class="btn">Cancel</button>
		    </form>
		  </div>
		</div>

	<script>
		function showPopupForm() {
			document.getElementById("popup-background").style.display = "flex";
		}

		function hidePopupForm() {
			document.getElementById("popup-background").style.display = "none";
		}
		  function showDeleteForm() {
		    document.getElementById("delete-form-background").style.display = "flex";
		  }
		
		  function hideDeleteForm() {
		    document.getElementById("delete-form-background").style.display = "none";
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
	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
</body>
</html>
