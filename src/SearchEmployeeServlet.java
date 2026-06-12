import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchEmployeeServlet")
public class SearchEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String empId = request.getParameter("empId");

        try {
            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT emp_id, name, designation, department, email, phone, salary " +
                    "FROM employees WHERE emp_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, empId);

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

                request.getRequestDispatcher("updateEmployee.jsp")
                       .forward(request, response);

            }
            else {

                String msg =
                        "Invalid Employee ID. No employee found with ID " +
                        empId +
                        ".";

                response.sendRedirect(
                        "message.jsp?title=Invalid Employee ID&msg=" +
                        URLEncoder.encode(msg, "UTF-8") +
                        "&link=updateEmployee.jsp"
                );

            }

        }
        catch(Exception e) {

            String msg =
                    "Something went wrong while searching employee.";

            response.sendRedirect(
                    "message.jsp?title=Search Failed&msg=" +
                    URLEncoder.encode(msg, "UTF-8") +
                    "&link=updateEmployee.jsp"
            );

            e.printStackTrace();

        }

    }

}