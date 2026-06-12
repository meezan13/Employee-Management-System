import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        int totalEmployees = 0;
        int totalDepartments = 0;
        int totalAdmins = 0;

        try {
            Connection con = DBConnection.getConnection();

            Statement st = con.createStatement();

            ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM employees");
            if(rs1.next()) {
                totalEmployees = rs1.getInt(1);
            }

            ResultSet rs2 = st.executeQuery("SELECT COUNT(DISTINCT department) FROM employees");
            if(rs2.next()) {
                totalDepartments = rs2.getInt(1);
            }

            ResultSet rs3 = st.executeQuery("SELECT COUNT(*) FROM users WHERE role='Admin'");
            if(rs3.next()) {
                totalAdmins = rs3.getInt(1);
            }

            request.setAttribute("totalEmployees", totalEmployees);
            request.setAttribute("totalDepartments", totalDepartments);
            request.setAttribute("totalAdmins", totalAdmins);

            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);

        } catch(Exception e) {

            PrintWriter out = response.getWriter();

            out.println("<html><body style='font-family:Arial;padding:30px;'>");
            out.println("<h2>Error in AdminDashboardServlet</h2>");
            out.println("<pre>");
            e.printStackTrace(out);
            out.println("</pre>");
            out.println("</body></html>");
        }
    }
}