import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EmployeeDashboardServlet")
public class EmployeeDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String)session.getAttribute("username");

        try {

            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT emp_id, name, designation, department, email, phone, salary " +
                    "FROM employees WHERE emp_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, username);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                request.setAttribute("empId", rs.getString("emp_id"));
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("designation", rs.getString("designation"));
                request.setAttribute("department", rs.getString("department"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("phone", rs.getString("phone"));
                request.setAttribute("salary", rs.getDouble("salary"));

                request.getRequestDispatcher("employeeDashboard.jsp")
                       .forward(request, response);

            }
            else {

                response.sendRedirect(
                        "message.jsp?title=Profile Not Found&msg=No employee profile found for this account&link=login.jsp"
                );

            }

        }
        catch(Exception e) {

            response.setContentType("text/html");
            response.getWriter().println("<h3>Error while loading employee dashboard</h3>");
            response.getWriter().println("<pre>");
            e.printStackTrace(response.getWriter());
            response.getWriter().println("</pre>");

        }

    }

}