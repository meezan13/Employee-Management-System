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

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String empId = request.getParameter("empId");

        try {

            Connection con = DBConnection.getConnection();

            String checkQuery =
                    "SELECT name, email FROM employees WHERE emp_id=?";

            PreparedStatement checkPs =
                    con.prepareStatement(checkQuery);

            checkPs.setString(1, empId);

            ResultSet rs =
                    checkPs.executeQuery();

            if(!rs.next()) {

                String msg =
                        "Invalid Employee ID. No employee found with ID " +
                        empId +
                        ".";

                response.sendRedirect(
                        "message.jsp?title=Invalid Employee ID&msg=" +
                        URLEncoder.encode(msg, "UTF-8") +
                        "&link=deleteEmployee.jsp"
                );

                return;
            }

            String name =
                    rs.getString("name");

            String email =
                    rs.getString("email");

            String deleteEmployeeQuery =
                    "DELETE FROM employees WHERE emp_id=?";

            PreparedStatement ps1 =
                    con.prepareStatement(deleteEmployeeQuery);

            ps1.setString(1, empId);

            int employeeResult =
                    ps1.executeUpdate();

            String deleteUserQuery =
                    "DELETE FROM users WHERE username=?";

            PreparedStatement ps2 =
                    con.prepareStatement(deleteUserQuery);

            ps2.setString(1, empId);

            ps2.executeUpdate();

            if(employeeResult > 0) {

                try {
                    String subject =
                            "EMS Account Deleted";

                    String mailMessage =
                            "Hello " + name + ",\n\n" +
                            "Your account has been deleted from the Employee Management System.\n\n" +
                            "Employee ID: " + empId + "\n\n" +
                            "If you believe this was done by mistake, please contact the administrator.\n\n" +
                            "Regards,\n" +
                            "EMS";

                    EmailUtility.sendEmail(
                            email,
                            subject,
                            mailMessage
                    );
                }
                catch(Exception mailError) {
                    mailError.printStackTrace();
                }

                String msg =
                        "Employee profile and login account deleted successfully. " +
                        "A notification email has been sent to the registered email address.";

                response.sendRedirect(
                        "message.jsp?title=Employee Deleted&msg=" +
                        URLEncoder.encode(msg, "UTF-8") +
                        "&link=AdminDashboardServlet"
                );

            }

        }
        catch(Exception e) {

            String msg =
                    "Something went wrong while deleting employee. Please try again.";

            response.sendRedirect(
                    "message.jsp?title=Delete Failed&msg=" +
                    URLEncoder.encode(msg, "UTF-8") +
                    "&link=deleteEmployee.jsp"
            );

            e.printStackTrace();

        }

    }

}