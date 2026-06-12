<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>

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

        .profile-card{
            width:760px;
            max-width:100%;
            background:rgba(255,255,255,0.92);
            border-radius:28px;
            padding:35px;
            box-shadow:0 25px 45px rgba(0,0,0,0.25);
        }

        .profile-header{
            margin-bottom:28px;
        }

        .profile-header h1{
            color:#17002e;
            font-size:34px;
            margin-bottom:6px;
        }

        .profile-header p{
            color:#666;
            font-size:14px;
        }

        .profile-grid{
            display:grid;
            grid-template-columns:1fr 1fr;
            gap:18px;
        }

        .info-box{
            background:white;
            border:1px solid #e6e1ff;
            border-radius:18px;
            padding:18px;
            box-shadow:0 8px 20px rgba(0,0,0,0.06);
            transition:0.3s;
        }

        .info-box:hover{
            transform:translateY(-4px);
            box-shadow:0 12px 24px rgba(75,45,187,0.15);
        }

        .label{
            color:#4b2dbb;
            font-size:13px;
            font-weight:bold;
            margin-bottom:8px;
        }

        .value{
            color:#17002e;
            font-size:17px;
            font-weight:bold;
            word-break:break-word;
        }

        .wide{
            grid-column:span 2;
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

            .profile-card{
                width:100%;
                padding:25px;
            }

            .profile-grid{
                grid-template-columns:1fr;
            }

            .wide{
                grid-column:span 1;
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

    if(empId == null) {
        response.sendRedirect("MyProfileServlet");
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

    <div class="profile-card">

        <div class="profile-header">
            <h1>Employee Profile</h1>
            <p>View your personal and employment details</p>
        </div>

        <div class="profile-grid">

            <div class="info-box">
                <div class="label">Employee ID</div>
                <div class="value"><%= empId %></div>
            </div>

            <div class="info-box">
                <div class="label">Name</div>
                <div class="value"><%= name %></div>
            </div>

            <div class="info-box">
                <div class="label">Designation</div>
                <div class="value"><%= designation %></div>
            </div>

            <div class="info-box">
                <div class="label">Department</div>
                <div class="value"><%= department %></div>
            </div>

            <div class="info-box">
                <div class="label">Phone</div>
                <div class="value"><%= phone %></div>
            </div>

            <div class="info-box">
                <div class="label">Salary</div>
                <div class="value">&#8377;<%= salary %></div>
            </div>

            <div class="info-box wide">
                <div class="label">Email</div>
                <div class="value"><%= email %></div>
            </div>

        </div>

    </div>

</div>

</body>
</html>