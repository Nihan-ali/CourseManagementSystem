import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/homeServ")
public class homeServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public homeServ() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
        	PrintWriter out = response.getWriter();
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem", "root", "@livai");

            String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                String userType = rs.getString("role");
                //int id = rs.getInt("id");
                //System.out.println(id);
                if (userType.equals("admin")) {
                	HttpSession session = request.getSession();
                	session.setAttribute("id", "admin");
                	RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                	rd.forward(request, response);
                } else if (userType.equals("teacher")) {
                	System.out.println("in serv "+username);
                	request.setAttribute("username", username);
                	HttpSession session = request.getSession();
                	session.setAttribute("username", username);
                	RequestDispatcher rd = request.getRequestDispatcher("teacherdashboard.jsp");
                	rd.forward(request, response);
                } else if (userType.equals("student")) {
            		request.setAttribute("username", username);
            		HttpSession session = request.getSession();
                	session.setAttribute("id", username);
                	RequestDispatcher rd = request.getRequestDispatcher("studentpage.jsp");
                	rd.forward(request, response);
                }
            } else {
            	RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            	request.setAttribute("error", "Invalid username or password");
            	rd.forward(request, response);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
