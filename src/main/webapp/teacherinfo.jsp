<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher List</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
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
            padding: 5px 5px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom:40px;
        }
        h3{
/*         	text-align:center; */
        	margin-left:15rem;
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
            font-size: 20px;
            margin-left: 10px;
            font-weight:bold;
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
        
        .underline {
            border-bottom: 2px solid #333333;
        }
                .teacher-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 20px;
        }
        
        .teacher-card {
            width: 400px;
            height:120px;
            margin-bottom: 20px;
            border-radius: 7px;
            padding: 10px;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }
        
        .teacher-card:hover {
            transform: translateY(-5px);
        }
        
        .teacher-image {
            width: 80px;
            height: 80px;
            margin-right: 10px;
        }
        
        .teacher-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }
        
        .teacher-details {
            flex-grow: 1;
        }
        .teacher-name {
    font-size: 18px;
    font-weight: bold;
    margin: 0;
}

.teacher-role {
    font-size: 14px;
    margin: 0 0 5px;
}

.teacher-email {
    font-size: 12px;
    color: #666666;
    margin: 0;
}

.teacher-card {
    display: flex;
    align-items: center;
    background-color: #f9f9f9;
    flex-basis: calc(25% - 20px);
}
#titl {
  text-align: left;
  position: relative;
  display: inline-block;
  font-weight: bold;
  margin-left:80px;
  margin-top: 20px;
  font-size: 30px;
  margin-bottom: 20px;
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



.teacher-card:nth-child(even) {
    background-color: #e9e9e9;
}

.teacher-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}


.teacher-card-content {
    flex-grow: 1;
}

.teacher-actions {
    display: flex;
    justify-content: flex-end;
    margin-top: 10px;
}

.teacher-actions a {
    color: #3498DB;
    text-decoration: none;
    margin-left: 10px;
}

.teacher-actions a:hover {
    text-decoration: underline;
}
        
        
    </style>
</head>
<body>
    <div id="header">
        <img src="https://th.bing.com/th/id/OIP.gy2p65lrtMPs4MPK-5VHFAHaHa?w=175&h=180&c=7&r=0&o=5&pid=1.7" alt="Logo">
        <h1>Course Management System</h1>
        <h3><span id="my-dashboard">Teacher Information</span></h3>
        
        <div id="logout-box">
            <button id="logout-button" onclick="location.href='home.jsp'">
                <i class="fas fa-sign-in-alt"></i> Log In
            </button>
        </div>
    </div>
    <div id ="titl">Teachers List</div>
    <div style="display: flex; flex-wrap: wrap; justify-content: space-between; margin: 20px;">
        <% 
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem", "root", "@livai");
            String query = "SELECT name, mail, url,role FROM teacher";
            PreparedStatement st = con.prepareStatement(query);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("mail");
                String role = rs.getString("role");
                String imageUrl = rs.getString("url");
        %>
                <div class="teacher-card">
    <div  class="teacher-image">
        <img src="<%= imageUrl %>" alt="Teacher Image" >
    </div>
    <div class="teacher-details">
        <h3 class="teacher-name"><%= name %></h3>
        <h5 class="teacher-role"><%= role %></h5>
        <p class="teacher-email">Email: <%= email %></p>
    </div>
</div>

        <% 
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </div>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js"></script>
</body>
</html>
