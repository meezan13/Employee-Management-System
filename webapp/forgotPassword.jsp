<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>

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
            display:flex;
            justify-content:center;
            align-items:center;
            overflow:hidden;
        }

        .forgot-box{
            width:430px;
            padding:45px 40px;
            border-radius:22px;
            background:rgba(255,255,255,0.18);
            border:1px solid rgba(255,255,255,0.45);
            box-shadow:
                0 25px 45px rgba(0,0,0,0.25),
                inset 0 0 25px rgba(255,255,255,0.08);
            backdrop-filter:blur(18px);
            -webkit-backdrop-filter:blur(18px);
            text-align:center;
        }

        h2{
            color:white;
            font-size:34px;
            margin-bottom:10px;
            text-shadow:0 5px 18px rgba(0,0,0,0.35);
        }

        .subtitle{
            color:rgba(255,255,255,0.9);
            font-size:15px;
            line-height:1.6;
            margin-bottom:28px;
        }

        label{
            display:block;
            text-align:left;
            color:white;
            font-size:15px;
            font-weight:bold;
            margin:18px 0 8px;
        }

        input[type=email]{
            width:100%;
            padding:14px 18px;
            border:none;
            border-radius:28px;
            background:rgba(255,255,255,0.28);
            color:rgb(50, 12, 59);
            font-size:15px;
            outline:none;
            box-shadow:inset 0 0 8px rgba(255,255,255,0.18);
        }

        input::placeholder{
            color:rgba(255,255,255,0.85);
        }

        input[type=email]:focus{
            background:rgba(255,255,255,0.35);
            box-shadow:0 0 0 2px rgba(255,255,255,0.45);
        }

        input[type=submit]{
            width:100%;
            margin-top:28px;
            padding:14px;
            border:none;
            border-radius:28px;
            background:linear-gradient(to right, #ff6ec7, #8b5cf6);
            color:white;
            font-weight:bold;
            font-size:15px;
            cursor:pointer;
            box-shadow:0 10px 20px rgba(0,0,0,0.25);
        }

        input[type=submit]:hover{
            background:linear-gradient(to right, #ff8bd3, #7c3aed);
            transform:translateY(-2px);
        }

        .back-link{
            display:block;
            margin-top:22px;
            text-align:center;
            text-decoration:none;
            color:rgba(255,255,255,0.85);
            font-size:14px;
        }

        .back-link:hover{
            color:white;
            text-decoration:underline;
        }

        @media(max-width:800px){
            .forgot-box{
                width:100%;
                max-width:390px;
            }
        }
    </style>
</head>

<body>

<div class="forgot-box">

    <h2>Forgot Password</h2>

    <p class="subtitle">
        Enter your registered email address<br>
        to receive your login details.
    </p>

    <form action="ForgotPasswordServlet" method="post">

        <label>Email Address</label>

        <input type="email"
               name="email"
               placeholder="Enter Registered Email"
               required>

        <input type="submit"
               value="Send Login Details">

    </form>

    <a href="login.jsp" class="back-link">
        Back to Login
    </a>

</div>

</body>
</html>