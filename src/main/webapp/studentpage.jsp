<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    
    <style>
        
    /* General Styles */

 body {
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
        padding: 0px;
        margin:0px;
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }
    
    /* Header Styles */




.register-button {
  display: inline-block;
  background-color: #030303;
  color: #FFF;
  border: none;
  padding: 8px 12px;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  font-size: 19px;
  margin-bottom: 40px;
}

.register-button:hover {
  background-color: #3d4246;
}
.avail-button {
  display: inline-block;
  background-color: #030303;
  color: #FFF;
  border: none;
  padding: 8px 12px;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  font-size: 19px;
  margin-bottom: 30px;
}

.avail-button:hover {
  background-color: #3d4246;
}


    
    /* Header Styles */


    
    #header {
            background-color: #cbd6d2ec;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            background-color: #ffffff;
            width: 100%;
            margin-bottom: 80px;
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

.container {
  display: none;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  margin-top: 20px;
  margin-bottom :15px;
}

/* Box Styles */

.box {
  flex-basis: calc(25% - 20px);
  border: 1px solid #ccc;
  padding: 20px;
  margin: 10px;
  background: linear-gradient(to bottom right, #e9e0e0, #b7c9c4);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease-in-out;
  cursor: pointer;
  text-align: center;
}

.box:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.course {
  font-weight: bold;
  font-size: 18px;
  margin-bottom: 10px;
}
.teacher-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
}

.teacher-box {
    width: 23%;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    padding: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.teacher-image {
    width: 80px;
    height: 80px;
    margin-bottom: 10px;
    border-radius: 50%;
    overflow: hidden;
}

.teacher-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.teacher-details {
    text-align: center;
}

.teacher-details h3 {
    margin: 0;
    font-size: 16px;
    margin-bottom: 5px;
}

.teacher-details p {
    margin: 0;
    font-size: 14px;
}

.credit {
  color: #3465a4;
  font-size: 14px;
}

.teacher {
  color: #888;
  font-weight: bold;
  font-size: 16px;
}

#registered-courses,
#available-courses {
  display: none;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
}
#available-courses {
  
  margin-top: 10px;
}
/* Take Course Button and Form Styles */

.take-course-btn {
  display: inline-block;
  background-color: #3498DB;
  color: #FFF;
  border: none;
  padding: 8px 12px;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  font-size: 16px;
  text-decoration: none;
  transition: background-color 0.3s ease-in-out;
}

.take-course-btn:hover {
  background-color: #2980B9;
}

#take-course-btn {
  display: block;
  margin: 20px auto;
  background-color: #3498DB;
  color: #FFF;
  border: none;
  padding: 12px 20px;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  font-size: 16px;
  text-decoration: none;
  transition: background-color 0.3s ease-in-out;
}

#take-course-btn:hover {
  background-color: #2980B9;
}

#take-course-form {
  display: none;
  position: absolute;
  top: 80px;
  left: 50%;
  transform: translateX(-50%);
  width: 400px;
  padding: 30px;
  background-color: #FFF;
  border-radius: 4px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

#take-course-form select {
  width: 100%;
  padding: 12px;
  margin-bottom: 20px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

#take-course-form button {
  display: inline-block;
  background-color: #3498DB;
  color: #FFF;
  border: none;
  padding: 12px 20px;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  font-size: 16px;
  text-decoration: none;
  transition: background-color 0.3s ease-in-out;
}

#take-course-form button:hover {
  background-color: #2980B9;
}

#take-course-form .cancel-btn {
  background-color: #E74C3C;
}

#take-course-form .cancel-btn:hover {
  background-color: #C0392B;
}



  
    </style>
    
</head>
<body>
    <div id="header">
        <img src="https://th.bing.com/th/id/OIP.gy2p65lrtMPs4MPK-5VHFAHaHa?w=175&h=180&c=7&r=0&o=5&pid=1.7" alt="Logo">
        <h1>Course Management System</h1>
        <h3><span id="my-dashboard">Student Dashboard</span></h3>
        
        <div id="logout-box">
        <span id="name">${username}</span>
            <button id="logout-button" onclick="location.href='home.jsp'">
                <i class="fas fa-sign-out-alt"></i> Log Out
            </button>
        </div>
    </div>
<button id="register-button" class="register-button"><i class="fas fa-book"></i>   Registered Courses</button>
<div id="registered-courses" class="container">
        <%-- Retrieve and display the registered course boxes dynamically --%>
        <% 
        String[] name = new String[15]; // Adjust the size as per your requirement
        String[] credit = new String[15];
        String[] teacher = new String[15];
        int total = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem", "root", "@livai");
            String query = "SELECT name,credit,teacher_name from courses, takes where coursecode = coursename and studentname=?";
            PreparedStatement st = con.prepareStatement(query);
            String  id =(String) session.getAttribute("id");
            st.setString(1, id);

            ResultSet rs = st.executeQuery();
            int index = 0;
            while (rs.next()) {
            	System.out.println("it came here "+rs.getString("name") );
                name[index] = rs.getString("name");
                credit[index] = rs.getString("credit");
                teacher[index] = rs.getString("teacher_name");
                index++;
                total++;
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
        
        <%-- Display the retrieved registered courses --%>
        <% for (int i = 0; i < total; i++) { %>
            <div class="box">
                <div class="course"><%= name[i] %></div>
                <div class="credit">Credit: <%= credit[i] %></div>
                <div class="credit">Instructor: <%= teacher[i] %></div>
            </div>
        <% } %>
    </div>
<button id="available-courses-button" class="avail-button"><i class="fas fa-plus"></i>  Available Courses</button>

<div id="available-courses" class="container">
    <%-- Retrieve and display the available course boxes dynamically --%>
    <% 
    String[] availablename = new String[15]; // Adjust the size as per your requirement
    String[] availableCredit = new String[15];
    String[] availableteacher = new String[15];
    String[] availablecode = new String[15];
    int availableTotal = 0;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem", "root", "@livai");
        String query = "SELECT coursecode, name, credit, teacher_name FROM courses WHERE coursecode NOT IN (SELECT coursename FROM takes WHERE studentname = ?)";
        PreparedStatement st = con.prepareStatement(query);
        String  id =(String) session.getAttribute("id");
        st.setString(1, id);

        ResultSet rs = st.executeQuery();
        int index = 0;
        while (rs.next()) {
            availablename[index] = rs.getString("name");
            availableCredit[index] = rs.getString("credit");
            availableteacher[index] = rs.getString("teacher_name");
            availablecode[index] = rs.getString("coursecode");
            index++;
            availableTotal++;
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
    <%-- Display the retrieved available courses --%>
    <% for (int i = 0; i < availableTotal; i++) { %>
        <div class="box">
            <div class="course"><%= availablename[i] %></div>
            <div class="credit">Credit: <%= availableCredit[i] %></div>
            <div class="teacher">Instructor: <%= availableteacher[i] %></div>
            <form action="EnrollServlet" method="post">
                <input type="hidden" name="courseCode" value="<%= availablecode[i] %>">
                <button type="submit" class="take-course-btn">Enroll</button>
            </form>
        </div>
    <% } %>
</div>


<!--         <button id="take-course-btn" onclick="toggleForm()">Take Course</button> -->
<!--         <div id="take-course-form" style="display: none;"> -->
<!--             <h4>Take Course</h4> -->
<!--             <select id="course-select"> -->
<%--                 Add options for available courses --%>
<%--                 <% for (int i = 0; i < availableTotal; i++) { %> --%>
<%--                     <option value="<%= availableData[i] %>"><%= availableData[i] %></option> --%>
<%--                 <% } %> --%>
<!--             </select> -->
<!--             <button onclick="submitCourse()">Submit</button> -->
<!--             <button onclick="cancelForm()">Cancel</button> -->
<!--         </div> -->
        


<script>
document.addEventListener('DOMContentLoaded', function() {
    var registerButton = document.querySelector('#register-button');
    var availableCoursesButton = document.querySelector('#available-courses-button');

    registerButton.addEventListener('click', function() {
        toggleContainer('registered-courses');
    });

    availableCoursesButton.addEventListener('click', function() {
        toggleContainer('available-courses');
    });

    function toggleContainer(containerId) {
        var container = document.querySelector('#' + containerId);
        container.style.display = container.style.display === 'none' ? 'flex' : 'none';
    }

    var takeCourseButtons = document.getElementsByClassName('take-course-btn');
    for (var i = 0; i < takeCourseButtons.length; i++) {
        takeCourseButtons[i].addEventListener('click', function() {
            var courseName = this.getAttribute('data-course');
            takeCourse(courseName);
        });
    }

    function takeCourse(courseName) {
        // Add your logic for taking the course here
        //alert("Taking course: " + courseName);
    }

    
    
    

    

    // Show the registered courses and available courses by default
    toggleContainer('registered-courses');
    toggleContainer('available-courses');
});
function logout() {
    window.location.href = "home.jsp";
}

</script>




</body>
</html>