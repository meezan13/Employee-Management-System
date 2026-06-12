import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewEmployeeServlet")
public class ViewEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        int page = 1;
        int recordsPerPage = 5;

        String pageValue = request.getParameter("page");

        if(pageValue != null) {
            page = Integer.parseInt(pageValue);
        }

        String sortBy = request.getParameter("sortBy");

        if(sortBy == null) {
            sortBy = "emp_id";
        }

        if(!sortBy.equals("emp_id") &&
           !sortBy.equals("name") &&
           !sortBy.equals("department") &&
           !sortBy.equals("salary")) {
            sortBy = "emp_id";
        }

        int offset = (page - 1) * recordsPerPage;

        try {

            Connection con = DBConnection.getConnection();

            String countQuery = "SELECT COUNT(*) FROM employees";
            PreparedStatement countPs = con.prepareStatement(countQuery);
            ResultSet countRs = countPs.executeQuery();

            int totalRecords = 0;

            if(countRs.next()) {
                totalRecords = countRs.getInt(1);
            }

            int totalPages = (int)Math.ceil(totalRecords * 1.0 / recordsPerPage);

            String query =
                    "SELECT emp_id, name, designation, department, email, phone, salary FROM employees " +
                    "ORDER BY " + sortBy + " LIMIT ? OFFSET ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, recordsPerPage);
            ps.setInt(2, offset);

            ResultSet rs = ps.executeQuery();

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>View Employees</title>");

            out.println("<style>");
            out.println("*{margin:0;padding:0;box-sizing:border-box;font-family:Arial,sans-serif;}");
            out.println("body{min-height:100vh;background:linear-gradient(135deg,#2b1055,#7597de,#e056fd);overflow-x:hidden;}");

            out.println(".sidebar{position:fixed;left:0;top:0;width:260px;height:100%;background:#17002e;color:white;padding-top:30px;box-shadow:6px 0 25px rgba(0,0,0,0.35);}");
            out.println(".sidebar h2{text-align:center;margin-bottom:38px;font-size:34px;letter-spacing:3px;}");
            out.println(".sidebar a{display:block;color:rgba(255,255,255,0.88);text-decoration:none;padding:15px 25px;margin:8px 18px;border-radius:22px;transition:0.3s;font-weight:bold;}");
            out.println(".sidebar a:hover{background:#1900ff;color:white;transform:translateX(6px);}");

            out.println(".main{margin-left:260px;min-height:100vh;padding:35px;}");

            out.println(".content-box{background:rgba(255,255,255,0.92);border-radius:28px;padding:30px;box-shadow:0 25px 45px rgba(0,0,0,0.25);}");

            out.println(".header{display:flex;justify-content:space-between;align-items:center;margin-bottom:25px;gap:20px;}");
            out.println(".header-title h1{color:#17002e;font-size:34px;margin-bottom:5px;}");
            out.println(".header-title p{color:#666;font-size:14px;}");

            out.println(".sort-box{display:flex;align-items:center;gap:12px;background:#f7f5ff;padding:12px 18px;border-radius:16px;border:1px solid #e6e1ff;box-shadow:0 6px 15px rgba(75,45,187,0.08);}");
            out.println(".sort-box label{color:#17002e;font-size:14px;font-weight:bold;}");
            out.println("select{padding:12px 18px;border:2px solid #d9d2ff;border-radius:14px;background:white;color:#17002e;font-weight:bold;font-size:14px;cursor:pointer;outline:none;min-width:170px;box-shadow:0 4px 12px rgba(75,45,187,0.10);}");

            out.println(".table-container{overflow-x:auto;border-radius:18px;background:white;box-shadow:0 8px 20px rgba(0,0,0,0.08);}");
            out.println("table{width:100%;border-collapse:collapse;background:white;}");
            out.println("th{background:#f2f0ff;color:#17002e;padding:16px;text-align:left;font-size:14px;}");
            out.println("td{padding:16px;text-align:left;border-bottom:1px solid #eeeeee;color:#222;font-size:14px;}");
            out.println("tr:hover{background:#f8f6ff;}");
            out.println("tr:last-child td{border-bottom:none;}");

            out.println(".emp-id{font-weight:bold;color:#4b2dbb;}");
            out.println(".salary{font-weight:bold;color:#17002e;}");
            out.println(".badge{display:inline-block;padding:6px 12px;border-radius:20px;background:#eee8ff;color:#4b2dbb;font-size:12px;font-weight:bold;}");

            out.println(".pagination{text-align:center;margin-top:25px;}");
            out.println(".pagination a{background:#4b2dbb;color:white;text-decoration:none;padding:11px 20px;border-radius:20px;margin:0 8px;font-weight:bold;display:inline-block;}");
            out.println(".pagination a:hover{background:#1900ff;}");
            out.println(".pagination span{margin:0 15px;font-weight:bold;color:white;}");
            out.println(".empty-message{color:#666;font-style:italic;text-align:center;}");

            out.println("@media(max-width:850px){");
            out.println(".sidebar{position:relative;width:100%;height:auto;padding-bottom:20px;}");
            out.println(".main{margin-left:0;padding:25px;}");
            out.println(".header{flex-direction:column;align-items:flex-start;gap:15px;}");
            out.println(".content-box{padding:22px;}");
            out.println(".sort-box{width:100%;}");
            out.println("select{width:100%;}");
            out.println("}");
            out.println("</style>");

            out.println("</head>");
            out.println("<body>");

            out.println("<div class='sidebar'>");
            out.println("<h2>EMS</h2>");
            out.println("<a href='AdminDashboardServlet'>Dashboard</a>");
            out.println("<a href='addEmployee.jsp'>Add Employee</a>");
            out.println("<a href='ViewEmployeeServlet'>View Employees</a>");
            out.println("<a href='updateEmployee.jsp'>Update Employee</a>");
            out.println("<a href='deleteEmployee.jsp'>Delete Employee</a>");
            out.println("<a href='login.jsp'>Logout</a>");
            out.println("</div>");

            out.println("<div class='main'>");

            out.println("<div class='content-box'>");

            out.println("<div class='header'>");

            out.println("<div class='header-title'>");
            out.println("<h1>Employee Records</h1>");
            out.println("<p>Manage and view all employee details</p>");
            out.println("</div>");

            out.println("<div class='sort-box'>");
            out.println("<form action='ViewEmployeeServlet' method='get'>");
            out.println("<label>Sort By</label>");

            out.println("<select name='sortBy' onchange='this.form.submit()'>");

            out.println("<option value='emp_id' " +
                    (sortBy.equals("emp_id") ? "selected" : "") +
                    ">Employee ID</option>");

            out.println("<option value='name' " +
                    (sortBy.equals("name") ? "selected" : "") +
                    ">Name</option>");

            out.println("<option value='department' " +
                    (sortBy.equals("department") ? "selected" : "") +
                    ">Department</option>");

            out.println("<option value='salary' " +
                    (sortBy.equals("salary") ? "selected" : "") +
                    ">Salary</option>");

            out.println("</select>");
            out.println("<input type='hidden' name='page' value='1'>");
            out.println("</form>");
            out.println("</div>");

            out.println("</div>");

            out.println("<div class='table-container'>");
            out.println("<table>");

            out.println("<tr>");
            out.println("<th>Employee ID</th>");
            out.println("<th>Name</th>");
            out.println("<th>Designation</th>");
            out.println("<th>Department</th>");
            out.println("<th>Email</th>");
            out.println("<th>Phone</th>");
            out.println("<th>Salary</th>");
            out.println("</tr>");

            boolean found = false;

            while(rs.next()) {

                found = true;

                out.println("<tr>");
                out.println("<td class='emp-id'>" + rs.getString("emp_id") + "</td>");
                out.println("<td>" + rs.getString("name") + "</td>");
                out.println("<td>" + rs.getString("designation") + "</td>");
                out.println("<td><span class='badge'>" + rs.getString("department") + "</span></td>");
                out.println("<td>" + rs.getString("email") + "</td>");
                out.println("<td>" + rs.getString("phone") + "</td>");
                out.println("<td class='salary'>" + rs.getDouble("salary") + "</td>");
                out.println("</tr>");

            }

            if(!found) {

                out.println("<tr>");
                out.println("<td colspan='7' class='empty-message'>No employee records found</td>");
                out.println("</tr>");

            }

            out.println("</table>");
            out.println("</div>");

            out.println("<div class='pagination'>");

            if(page > 1) {
                out.println("<a href='ViewEmployeeServlet?page=" +
                        (page - 1) +
                        "&sortBy=" + sortBy +
                        "'>Previous</a>");
            }

            out.println("<span>Page " + page + " of " +
                    (totalPages == 0 ? 1 : totalPages) +
                    "</span>");

            if(page < totalPages) {
                out.println("<a href='ViewEmployeeServlet?page=" +
                        (page + 1) +
                        "&sortBy=" + sortBy +
                        "'>Next</a>");
            }

            out.println("</div>");

            out.println("</div>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

        }
        catch(Exception e) {

            out.println("<h3>Error while fetching employee records</h3>");
            out.println("<pre>");
            e.printStackTrace(out);
            out.println("</pre>");

        }

    }

}