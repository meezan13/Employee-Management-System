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

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String designation = request.getParameter("designation");
        String department = request.getParameter("department");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        double salary = Double.parseDouble(request.getParameter("salary"));

        try {
            Connection con = DBConnection.getConnection();

            String checkEmailQuery =
                    "SELECT emp_id FROM employees WHERE email=?";

            PreparedStatement checkEmailPs =
                    con.prepareStatement(checkEmailQuery);

            checkEmailPs.setString(1, email);

            ResultSet emailRs = checkEmailPs.executeQuery();

            if(emailRs.next()) {

                String existingEmpId = emailRs.getString("emp_id");

                String msg =
                        "This email is already registered with Employee ID " +
                        existingEmpId +
                        " and cannot be used again.";

                response.sendRedirect(
                        "message.jsp?title=Duplicate Email&msg=" +
                        URLEncoder.encode(msg, "UTF-8") +
                        "&link=addEmployee.jsp"
                );

                return;
            }

            String countQuery =
                    "SELECT COUNT(*) FROM employees";

            PreparedStatement countPs =
                    con.prepareStatement(countQuery);

            ResultSet countRs =
                    countPs.executeQuery();

            int nextNumber = 1;

            if(countRs.next()) {
                nextNumber = countRs.getInt(1) + 1;
            }

            String empId =
                    String.format("EMP%03d", nextNumber);

            String username = empId;
            String password = empId.toLowerCase() + "@123";
            String role = "Employee";

            String employeeQuery =
                    "INSERT INTO employees(emp_id, name, designation, department, salary, email, phone) " +
                    "VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps1 =
                    con.prepareStatement(employeeQuery);

            ps1.setString(1, empId);
            ps1.setString(2, name);
            ps1.setString(3, designation);
            ps1.setString(4, department);
            ps1.setDouble(5, salary);
            ps1.setString(6, email);
            ps1.setString(7, phone);

            int employeeResult =
                    ps1.executeUpdate();

            String userQuery =
                    "INSERT INTO users(username, password, role) VALUES(?,?,?)";

            PreparedStatement ps2 =
                    con.prepareStatement(userQuery);

            ps2.setString(1, username);
            ps2.setString(2, password);
            ps2.setString(3, role);

            int userResult =
                    ps2.executeUpdate();

            if(employeeResult > 0 && userResult > 0) {

                try {
                    String subject =
                            "EMS Account Created";

                    String mailMessage =
                            "Hello " + name + ",\n\n" +
        "Your Employee Management System account has been created successfully.\n\n" +

        "Employee Details:\n" +
        "Employee ID: " + empId + "\n" +
        "Name: " + name + "\n" +
        "Designation: " + designation + "\n" +
        "Department: " + department + "\n" +
        "Email: " + email + "\n" +
        "Phone: " + phone + "\n" +
        "Salary: " + salary + "\n\n" +

        "Login Details:\n" +
        "Username: " + username + "\n" +
        "Password: " + password + "\n\n" +

        "Please keep these details safe.\n\n" +
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
                        "Employee added successfully. Generated Employee ID is " +
                        empId +
                        ". Login details have been sent by email.";

                response.sendRedirect(
                        "message.jsp?title=Employee Added&msg=" +
                        URLEncoder.encode(msg, "UTF-8") +
                        "&link=AdminDashboardServlet"
                );
            }

        }
        catch(Exception e) {

            String msg =
                    "Something went wrong while adding employee. Please check the entered details.";

            response.sendRedirect(
                    "message.jsp?title=Add Employee Failed&msg=" +
                    URLEncoder.encode(msg, "UTF-8") +
                    "&link=addEmployee.jsp"
            );

            e.printStackTrace();
        }
    }
}