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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {

            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT * FROM users WHERE username=? AND password=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                String role = rs.getString("role");

                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                if(role.equalsIgnoreCase("Admin")) {

                    response.sendRedirect("AdminDashboardServlet");

                }
                else {

                    response.sendRedirect("EmployeeDashboardServlet");

                }

            }
            else {

                response.sendRedirect(
                        "message.jsp?title=Login Failed&msg=Invalid username or password&link=login.jsp"
                );

            }

        }
        catch(Exception e) {

            response.setContentType("text/html");
            response.getWriter().println("<h3>Error while logging in</h3>");
            response.getWriter().println("<pre>");
            e.printStackTrace(response.getWriter());
            response.getWriter().println("</pre>");

        }

    }

}