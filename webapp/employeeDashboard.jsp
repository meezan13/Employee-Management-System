<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard</title>

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
            color:rgba(50, 19, 54, 0.85);
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
            color:rgba(48, 17, 67, 0.85);
            margin-bottom:18px;
            font-size:18px;
        }

        .card p{
            color:rgb(251,248,251);
            font-size:24px;
            font-weight:bold;
            text-shadow:0 4px 15px rgba(170,129,182,0.35);
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
    String empId = (String)request.getAttribute("empId");
    String name = (String)request.getAttribute("name");
    String designation = (String)request.getAttribute("designation");
    String department = (String)request.getAttribute("department");

    if(empId == null) {
        response.sendRedirect("EmployeeDashboardServlet");
        return;
    }
%>

<div class="sidebar">

    <h2>EMS</h2>

    <a href="EmployeeDashboardServlet">Dashboard</a>
    <a href="MyProfileServlet">My Profile</a>
    <a href="login.jsp">Logout</a>

</div>

<div class="main">

    <div class="header">
        <h1>Welcome <%= name %></h1>
        <p>Employee Management System Dashboard</p>
    </div>

    <div class="cards">

        <div class="card">
            <h3>Employee Name</h3>
            <p><%= name %></p>
        </div>

        <div class="card">
            <h3>Employee ID</h3>
            <p><%= empId %></p>
        </div>

        <div class="card">
            <h3>Department</h3>
            <p><%= department %></p>
        </div>

    </div>

</div>

</body>
</html>