import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        String email = request.getParameter("email");

        try {

            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT e.emp_id, u.username, u.password " +
                    "FROM employees e " +
                    "JOIN users u ON e.emp_id = u.username " +
                    "WHERE e.email = ?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                String username =
                        rs.getString("username");

                String password =
                        rs.getString("password");

                String subject =
                        "EMS Password Recovery";

                String message =
                        "Hello,\n\n" +
                        "Your Employee Management System login details are:\n\n" +
                        "Username: " + username + "\n" +
                        "Password: " + password + "\n\n" +
                        "Regards,\n" +
                        "EMS";

                EmailUtility.sendEmail(
                        email,
                        subject,
                        message
                );

                response.getWriter().println(
                        "<html><body style='font-family:Arial;text-align:center;margin-top:100px;'>" +
                        "<h2>Email Sent Successfully</h2>" +
                        "<p>Your login details have been sent to your registered email.</p>" +
                        "<br><a href='login.jsp'>Back to Login</a>" +
                        "</body></html>"
                );

            }
            else {

    response.sendRedirect(
        "message.jsp?title=Account Not Found&msg=No employee is registered with the provided email address.&link=forgotPassword.jsp"
    );

}

        }
        catch(Exception e) {

            response.getWriter().println("<h2>Error</h2>");
            response.getWriter().println("<pre>");
            e.printStackTrace(response.getWriter());
            response.getWriter().println("</pre>");

        }

    }

}