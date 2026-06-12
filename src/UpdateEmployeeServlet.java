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

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String empId = request.getParameter("empId");
        String name = request.getParameter("name");
        String designation = request.getParameter("designation");
        String department = request.getParameter("department");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        double salary = Double.parseDouble(request.getParameter("salary"));

        try {

            Connection con = DBConnection.getConnection();

            String checkEmployeeQuery =
                    "SELECT emp_id FROM employees WHERE emp_id=?";

            PreparedStatement checkEmployeePs =
                    con.prepareStatement(checkEmployeeQuery);

            checkEmployeePs.setString(1, empId);

            ResultSet employeeRs =
                    checkEmployeePs.executeQuery();

            if(!employeeRs.next()) {

                String msg =
                        "Invalid Employee ID. No employee found with ID " +
                        empId +
                        ".";

                response.sendRedirect(
                        "message.jsp?title=Invalid Employee ID&msg=" +
                        URLEncoder.encode(msg, "UTF-8") +
                        "&link=updateEmployee.jsp"
                );

                return;
            }

            String checkEmailQuery =
                    "SELECT emp_id FROM employees WHERE email=? AND emp_id<>?";

            PreparedStatement checkEmailPs =
                    con.prepareStatement(checkEmailQuery);

            checkEmailPs.setString(1, email);
            checkEmailPs.setString(2, empId);

            ResultSet emailRs =
                    checkEmailPs.executeQuery();

            if(emailRs.next()) {

                String existingEmpId =
                        emailRs.getString("emp_id");

                String msg =
                        "This email already belongs to Employee ID " +
                        existingEmpId +
                        " and cannot be used for another employee.";

                response.sendRedirect(
                        "message.jsp?title=Duplicate Email&msg=" +
                        URLEncoder.encode(msg, "UTF-8") +
                        "&link=updateEmployee.jsp"
                );

                return;
            }

            String query =
                    "UPDATE employees SET name=?, designation=?, department=?, salary=?, email=?, phone=? WHERE emp_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, designation);
            ps.setString(3, department);
            ps.setDouble(4, salary);
            ps.setString(5, email);
            ps.setString(6, phone);
            ps.setString(7, empId);

            int result =
                    ps.executeUpdate();

            if(result > 0) {

                try {
                    String subject =
                            "EMS Record Updated";

                    String mailMessage =
                            "Hello " + name + ",\n\n" +
                            "Your Employee Management System record has been updated successfully.\n\n" +
                            "Updated Details:\n" +
                            "Employee ID: " + empId + "\n" +
                            "Name: " + name + "\n" +
                            "Designation: " + designation + "\n" +
                            "Department: " + department + "\n" +
                            "Email: " + email + "\n" +
                            "Phone: " + phone + "\n" +
                            "Salary: " + salary + "\n\n" +
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
                        "Employee profile updated successfully. Notification email has been sent.";

                response.sendRedirect(
                        "message.jsp?title=Update Successful&msg=" +
                        URLEncoder.encode(msg, "UTF-8") +
                        "&link=AdminDashboardServlet"
                );

            }

        }
        catch(Exception e) {

            String msg =
                    "Something went wrong while updating employee. Please check the entered details.";

            response.sendRedirect(
                    "message.jsp?title=Update Failed&msg=" +
                    URLEncoder.encode(msg, "UTF-8") +
                    "&link=updateEmployee.jsp"
            );

            e.printStackTrace();

        }

    }

}