<!DOCTYPE html>
<html>
<head>
    <title>Employee Management System - Login</title>

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

        .page{
            width:90%;
            max-width:1100px;
            display:flex;
            align-items:center;
            justify-content:space-between;
            gap:70px;
        }

        .left-content{
            width:50%;
            color:white;
        }

        .left-content h1{
            font-size:58px;
            line-height:1.08;
            font-weight:bold;
            letter-spacing:2px;
            margin-bottom:18px;
            text-shadow:0 5px 18px rgba(0,0,0,0.35);
        }

        .left-content p{
            font-size:24px;
            letter-spacing:4px;
            color:rgba(255,255,255,0.9);
        }

        .login-box{
            width:400px;
            padding:45px 40px;
            border-radius:22px;

            background:rgba(255,255,255,0.18);
            border:1px solid rgba(255,255,255,0.45);

            box-shadow:
                0 25px 45px rgba(0,0,0,0.25),
                inset 0 0 25px rgba(255,255,255,0.08);

            backdrop-filter:blur(18px);
            -webkit-backdrop-filter:blur(18px);
        }

        label{
            display:block;
            color:white;
            font-size:15px;
            font-weight:bold;
            margin:18px 0 8px;
        }

        input[type=text],
        input[type=password]{
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

        input[type=text]:focus,
        input[type=password]:focus{
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

        .forgot-link{
            display:block;
            margin-top:22px;
            text-align:center;
            text-decoration:none;
            color:rgba(255,255,255,0.85);
            font-size:14px;
        }

        .forgot-link:hover{
            color:white;
            text-decoration:underline;
        }

        @media(max-width:800px){
            .page{
                flex-direction:column;
                text-align:center;
            }

            .left-content{
                width:100%;
            }

            .left-content h1{
                font-size:38px;
            }

            .left-content p{
                font-size:16px;
                letter-spacing:2px;
            }

            .login-box{
                width:100%;
                max-width:390px;
            }
        }
    </style>
</head>

<body>

    <div class="page">

        <div class="left-content">
            <h1>Employee<br>Management<br>System</h1>
            <p>Login to continue...</p>
        </div>

        <div class="login-box">

            <form action="LoginServlet" method="post">

                <label>Username</label>
                <input type="text"
                       name="username"
                       placeholder="Enter Username"
                       required>

                <label>Password</label>
                <input type="password"
                       name="password"
                       placeholder="Enter Password"
                       required>

                <input type="submit" value="LOGIN">

                <a href="forgotPassword.jsp" class="forgot-link">
                    Forgot Password?
                </a>

            </form>

        </div>

    </div>

</body>
</html>