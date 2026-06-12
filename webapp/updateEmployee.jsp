<!DOCTYPE html>
<html>
<head>
    <title>Update Employee</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial, sans-serif;
        }

        body{
            min-height:100vh;
            background:linear-gradient(135deg,#2b1055,#7597de,#e056fd);
            overflow-x:hidden;
        }

        .sidebar{
            position:fixed;
            left:0;
            top:0;
            width:260px;
            height:100%;
            background:#17002e;
            color:white;
            padding-top:30px;
            box-shadow:6px 0 25px rgba(0,0,0,0.35);
        }

        .sidebar h2{
            text-align:center;
            margin-bottom:38px;
            font-size:34px;
            letter-spacing:3px;
        }

        .sidebar a{
            display:block;
            color:rgba(255,255,255,0.88);
            text-decoration:none;
            padding:15px 25px;
            margin:8px 18px;
            border-radius:22px;
            transition:0.3s;
            font-weight:bold;
        }

        .sidebar a:hover{
            background:#1900ff;
            color:white;
            transform:translateX(6px);
        }

        .main{
            margin-left:260px;
            min-height:100vh;
            padding:35px;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .content-box{
            width:680px;
            max-width:100%;
            background:rgba(255,255,255,0.92);
            border-radius:28px;
            padding:35px;
            box-shadow:0 25px 45px rgba(0,0,0,0.25);
        }

        h1{
            color:#17002e;
            font-size:34px;
            margin-bottom:6px;
        }

        .note{
            color:#666;
            font-size:14px;
            margin-bottom:28px;
            line-height:1.5;
        }

        .search-box{
            margin-bottom:28px;
            padding-bottom:28px;
            border-bottom:1px solid #e6e1ff;
        }

        .update-box{
            margin-top:10px;
        }

        input{
            width:100%;
            padding:14px 18px;
            margin:10px 0;
            border:2px solid #e6e1ff;
            border-radius:16px;
            background:white;
            color:#17002e;
            font-size:15px;
            outline:none;
            transition:0.3s;
        }

        input::placeholder{
            color:#777;
        }

        input:focus{
            border-color:#8b5cf6;
            box-shadow:0 0 0 4px rgba(139,92,246,0.15);
        }

        input[readonly]{
            background:#f2f0ff;
            color:#4b2dbb;
            cursor:not-allowed;
            font-weight:bold;
        }

        button{
            width:100%;
            margin-top:18px;
            padding:14px;
            border:none;
            border-radius:18px;
            background:#4b2dbb;
            color:white;
            font-weight:bold;
            font-size:15px;
            cursor:pointer;
            transition:0.3s;
            box-shadow:0 8px 18px rgba(75,45,187,0.25);
        }

        button:hover{
            background:#1900ff;
            transform:translateY(-2px);
        }

        @media(max-width:850px){
            .sidebar{
                position:relative;
                width:100%;
                height:auto;
                padding-bottom:20px;
            }

            .main{
                margin-left:0;
                padding:25px;
            }

            .content-box{
                width:100%;
                padding:25px;
            }
        }
    </style>
</head>

<body>

<%
    String empId = (String)request.getAttribute("empId");
    String name = (String)request.getAttribute("name");
    String designation = (String)request.getAttribute("designation");
    String department = (String)request.getAttribute("department");
    String email = (String)request.getAttribute("email");
    String phone = (String)request.getAttribute("phone");
    Double salary = (Double)request.getAttribute("salary");
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

    <div class="content-box">

        <h1>Update Employee</h1>

        <p class="note">
            Search an employee using Employee ID. Employee ID cannot be changed.
        </p>

        <div class="search-box">

            <form action="SearchEmployeeServlet" method="post">

                <input type="text"
                       name="empId"
                       placeholder="Enter Employee ID"
                       value="<%= empId == null ? "" : empId %>"
                       required>

                <button type="submit">
                    Search Employee
                </button>

            </form>

        </div>

        <% if(empId != null) { %>

        <div class="update-box">

            <form action="UpdateEmployeeServlet" method="post">

                <input type="hidden"
                       name="empId"
                       value="<%= empId %>">

                <input type="text"
                       value="<%= empId %>"
                       readonly>

                <input type="text"
                       name="name"
                       placeholder="Employee Name"
                       value="<%= name %>"
                       required>

                <input type="text"
                       name="designation"
                       placeholder="Designation"
                       value="<%= designation %>"
                       required>

                <input type="text"
                       name="department"
                       placeholder="Department"
                       value="<%= department %>"
                       required>

                <input type="email"
                       name="email"
                       placeholder="Email"
                       value="<%= email %>"
                       required>

                <input type="text"
                       name="phone"
                       placeholder="Phone Number"
                       value="<%= phone %>"
                       required>

                <input type="number"
                       name="salary"
                       placeholder="Salary"
                       value="<%= salary %>"
                       required>

                <button type="submit">
                    Update Employee
                </button>

            </form>

        </div>

        <% } %>

    </div>

</div>

</body>
</html>