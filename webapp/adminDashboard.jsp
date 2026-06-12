<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial, sans-serif;
        }

        body{
            min-height:100vh;
            background:linear-gradient(135deg, #2b1055, #7597de, #e056fd);
            color:white;
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
            padding:35px;
        }

        .header{
            background:rgba(255,255,255,0.18);
            border:1px solid rgba(255,255,255,0.35);
            border-radius:25px;
            padding:30px;
            margin-bottom:30px;
            backdrop-filter:blur(18px);
            -webkit-backdrop-filter:blur(18px);
            box-shadow:0 20px 40px rgba(0,0,0,0.22);
        }

        .header h1{
            font-size:38px;
            margin-bottom:8px;
            text-shadow:0 4px 15px rgba(0,0,0,0.35);
        }

        .header p{
            color:rgba(55, 13, 55, 0.85);
            font-size:16px;
        }

        .cards{
            display:flex;
            gap:25px;
            flex-wrap:wrap;
        }

        .card{
            width:260px;
            padding:28px;
            border-radius:25px;
            background:rgba(255,255,255,0.18);
            border:1px solid rgba(255,255,255,0.35);
            backdrop-filter:blur(18px);
            -webkit-backdrop-filter:blur(18px);
            box-shadow:0 20px 40px rgba(0,0,0,0.22);
            text-align:center;
            transition:0.3s;
        }

        .card:hover{
            transform:translateY(-8px);
            background:rgba(255,255,255,0.25);
        }

        .card h3{
            color:rgba(40, 16, 56, 0.85);
            margin-bottom:18px;
            font-size:18px;
        }

        .card h2{
            color:rgb(251, 248, 251);
            font-size:42px;
            text-shadow:0 4px 15px rgba(170, 129, 182, 0.35);
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

            .cards{
                justify-content:center;
            }

            .card{
                width:100%;
                max-width:330px;
            }
        }
    </style>
</head>

<body>

<%
    Integer totalEmployeesObj = (Integer)request.getAttribute("totalEmployees");
    Integer totalDepartmentsObj = (Integer)request.getAttribute("totalDepartments");
    Integer totalAdminsObj = (Integer)request.getAttribute("totalAdmins");

    int totalEmployees = totalEmployeesObj == null ? 0 : totalEmployeesObj;
    int totalDepartments = totalDepartmentsObj == null ? 0 : totalDepartmentsObj;
    int totalAdmins = totalAdminsObj == null ? 0 : totalAdminsObj;
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
        <h1>Welcome Admin</h1>
        <p>Employee Management System Dashboard</p>
    </div>

    <div class="cards">

        <div class="card">
            <h3>Total Employees</h3>
            <h2><%= totalEmployees %></h2>
        </div>

        <div class="card">
            <h3>Departments</h3>
            <h2><%= totalDepartments %></h2>
        </div>

        <div class="card">
            <h3>Admins</h3>
            <h2><%= totalAdmins %></h2>
        </div>

    </div>

</div>

</body>
</html>