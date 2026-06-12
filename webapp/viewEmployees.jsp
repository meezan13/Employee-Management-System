<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Employees</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial,sans-serif;
        }

        body{
            background:#f4f6f9;
        }

        .sidebar{
            position:fixed;
            left:0;
            top:0;
            width:250px;
            height:100%;
            background:linear-gradient(to bottom,#2f80ed,#1c5fd4);
            color:white;
            padding-top:20px;
        }

        .sidebar h2{
            text-align:center;
            margin-bottom:30px;
        }

        .sidebar a{
            display:block;
            color:white;
            text-decoration:none;
            padding:15px 20px;
        }

        .sidebar a:hover{
            background:rgba(255,255,255,0.15);
            border-left:4px solid white;
        }

        .main{
            margin-left:250px;
            padding:30px;
        }

        .header{
            background:white;
            padding:20px;
            border-radius:12px;
            box-shadow:0 2px 8px rgba(0,0,0,0.1);
            margin-bottom:20px;
        }

        .header h1{
            color:#2f80ed;
            margin-bottom:15px;
        }

        .sort-box{
            margin-top:10px;
        }

        select{
            padding:8px;
            border:1px solid #ccc;
            border-radius:5px;
        }

        table{
            width:100%;
            background:white;
            border-collapse:collapse;
            box-shadow:0 2px 8px rgba(0,0,0,0.1);
        }

        th{
            background:#2f80ed;
            color:white;
            padding:12px;
        }

        td{
            padding:12px;
            text-align:center;
            border-bottom:1px solid #ddd;
        }

        tr:hover{
            background:#f2f7ff;
        }

        .pagination{
            text-align:center;
            margin-top:25px;
        }

        .pagination a{
            background:#2f80ed;
            color:white;
            text-decoration:none;
            padding:10px 18px;
            border-radius:5px;
            margin:0 5px;
        }

        .pagination a:hover{
            background:#1c5fd4;
        }

        .pagination span{
            margin:0 15px;
            font-weight:bold;
        }

        .empty-message{
            color:#666;
            font-style:italic;
        }
    </style>
</head>

<body>

<%
    ResultSet rs = (ResultSet)request.getAttribute("employeeData");

    Integer currentPageObj = (Integer)request.getAttribute("currentPage");
    Integer totalPagesObj = (Integer)request.getAttribute("totalPages");
    String sortBy = (String)request.getAttribute("sortBy");

    int currentPage = currentPageObj == null ? 1 : currentPageObj;
    int totalPages = totalPagesObj == null ? 1 : totalPagesObj;

    if(sortBy == null) {
        sortBy = "name";
    }
%>

<div class="sidebar">

    <h2>EMS</h2>

    <a href="AdminDashboardServlet">Dashboard</a>
    <a href="addEmployee.jsp">Add Employee</a>
    <a href="ViewEmployeeServlet">View Employees</a>
    <a href="updateEmployee.jsp">Update Employee</a>
    <a href="deleteEmployee.jsp">Delete Employee</a>
    <a href="login.jsp">Logout</a>

</div>

<div class="main">

    <div class="header">

        <h1>Employee Records</h1>

        <div class="sort-box">

            <form action="ViewEmployeeServlet" method="get">

                <label><b>Sort By :</b></label>

                <select name="sortBy" onchange="this.form.submit()">
                    <option value="name" <%= sortBy.equals("name") ? "selected" : "" %>>Name</option>
                    <option value="department" <%= sortBy.equals("department") ? "selected" : "" %>>Department</option>
                    <option value="salary" <%= sortBy.equals("salary") ? "selected" : "" %>>Salary</option>
                </select>

                <input type="hidden" name="page" value="1">

            </form>

        </div>

    </div>

    <table>

        <tr>
            <th>Employee ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Salary</th>
        </tr>

        <%
            boolean hasData = false;

            if(rs != null) {
                while(rs.next()) {
                    hasData = true;
        %>

        <tr>
            <td><%= rs.getString("emp_id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("department") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getDouble("salary") %></td>
        </tr>

        <%
                }
            }

            if(!hasData) {
        %>

        <tr>
            <td colspan="6" class="empty-message">
                No employee records found
            </td>
        </tr>

        <%
            }
        %>

    </table>

    <div class="pagination">

        <% if(currentPage > 1) { %>
            <a href="ViewEmployeeServlet?page=<%= currentPage - 1 %>&sortBy=<%= sortBy %>">Previous</a>
        <% } %>

        <span>Page <%= currentPage %> of <%= totalPages == 0 ? 1 : totalPages %></span>

        <% if(currentPage < totalPages) { %>
            <a href="ViewEmployeeServlet?page=<%= currentPage + 1 %>&sortBy=<%= sortBy %>">Next</a>
        <% } %>

    </div>

</div>

</body>
</html>