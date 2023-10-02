<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student info</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="cts.css">
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
  margin-bottom: 40px;
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
  margin-right: 10px;
}

#my-dashboard {
  color: black;
  font-weight: bold;
  font-size: 20px;
  margin-left: 30px;
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
  text-align: center;
  position: relative;
  display: inline-block;
  margin-bottom: 5px;
}

#titl::after {
  content: "";
  position: absolute;
  bottom: -5px;
  left: 0;
  width: 80vw;
  height: 5px;
  background: linear-gradient(to right, #3498DB, #E74C3C);
}

.dashboard-title {
  text-align: center;
  margin-bottom: 30px;
}

.table-wrapper {
  margin-top: 80px;
  max-height: 400px;
  overflow-y: auto;
}

.table {
  width: 80%;
  margin: 0 auto;
}

.table thead th {
	text-align: center;
  background-color: #3498DB;
  color: #FFF;
}

.table tbody tr:hover {
  background-color: #f5f5f5;
}

.table tbody td {
	text-align: center;
  vertical-align: middle;
}

.btn-primary {
  background-color: #3498DB;
  border-color: #3498DB;
}

.btn-primary:hover {
  background-color: #2181c4;
  border-color: #2181c4;
}

.modal-title {
  color: #3498DB;
  font-weight: bold;
}

.modal-body {
  max-height: 200px;
  overflow-y: auto;
}

.modal-body::-webkit-scrollbar {
  width: 8px;
}

.modal-body::-webkit-scrollbar-track {
  background-color: #f2f2f2;
}
.modal {
	margin-top: 100px;
  align-items: center;
  justify-content: center;
}



.modal-body::-webkit-scrollbar-thumb {
  background-color: #3498DB;
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
        <h3 style="margin-left:14.5rem"><span id="my-dashboard">Admin Dashboard</span></h3>
        
        <div id="logout-box">
        <span id="name">Admin</span>
            <button id="logout-button" onclick="location.href='home.jsp'">
                <i class="fas fa-sign-out-alt"></i> Log Out
            </button>
        </div>
    </div>

		<nav class="menu-bar">
  <button type="button" onclick="redirectToCourses()">Courses</button>
  <button type="button"  onclick="redirectToTeachers()">Teachers</button>
  <button type="button" class="active" onclick="redirectToStudents()">Students</button>
</nav>
    <div class="container">
    <div id ="titl">
        <h2 align ="center">Our Students</h2></div>

        <div class="table-wrapper">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Taken Courses</th>
                    </tr>
                </thead>
                <tbody>
    <% 
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem", "root", "@livai");
        String query = "SELECT username FROM user where role= ?";
        
        PreparedStatement st = con.prepareStatement(query);
        String id = "student";
        System.out.println(id);
        st.setString(1, id);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String studentName = rs.getString("username");
    %>
            <tr>
                <td><%= studentName%></td>
                <td>
                    <button class="btn btn-primary" data-toggle="modal" data-target="#studentsModal<%= studentName %>">View</button>
                    <!-- Modal -->
                    <div class="modal fade" id="studentsModal<%= studentName %>" tabindex="-1" role="dialog" aria-labelledby="studentsModalLabel<%= studentName %>" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="studentsModalLabel<%= studentName %>"><%= studentName %> Registered for </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Course Code</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% 
                                            try {
                                                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem", "root", "@livai");
                                                String query2 = "SELECT coursename FROM takes WHERE studentname=?";
                                                PreparedStatement st2 = con2.prepareStatement(query2);
                                                st2.setString(1, studentName);
                                                ResultSet rs2 = st2.executeQuery();
                                                while (rs2.next()) {
                                                    String courseName = rs2.getString("coursename");
                                            %>
                                                    <tr>
                                                        <td><%= courseName %></td>
                                                    </tr>
                                            <% 
                                                }
                                                con2.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
    <% 
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
</tbody>
                
</table>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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