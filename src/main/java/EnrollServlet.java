import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EnrollServlet")
public class EnrollServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String studentId = (String) session.getAttribute("id");
        String courseCode = request.getParameter("courseCode");
        System.out.println(session.getAttribute("id"));
        System.out.println(request.getParameter("courseCode"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem", "root","@livai");
            String query = "INSERT INTO takes (studentname, coursename) VALUES (?, ?)";
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, studentId);
            st.setString(2, courseCode);

            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
            	session.setAttribute("username", studentId);
                // Enrollment successful
                response.sendRedirect("studentpage.jsp"); // Redirect to the dashboard or a success page
            } else {
                // Enrollment failed
                response.sendRedirect("error.jsp"); // Redirect to an error page
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page
        }
    }
}
