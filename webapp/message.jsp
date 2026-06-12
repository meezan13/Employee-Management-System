<!DOCTYPE html>
<html>
<head>
    <title>Message</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial,sans-serif;
        }

        body{
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            background:linear-gradient(135deg,#2b1055,#7597de,#e056fd);
            overflow:hidden;
        }

        .box{
            width:450px;
            max-width:90%;
            padding:40px;
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
            font-size:32px;
            margin-bottom:18px;
            text-shadow:0 4px 15px rgba(0,0,0,0.35);
        }

        p{
            color:rgba(54, 13, 61, 0.9);
            font-size:16px;
            line-height:1.7;
            margin-bottom:25px;
        }

        a{
            display:inline-block;
            text-decoration:none;
            padding:14px 35px;
            border-radius:28px;

            background:linear-gradient(to right,#ff6ec7,#8b5cf6);

            color:white;
            font-weight:bold;
            font-size:15px;

            box-shadow:0 10px 20px rgba(0,0,0,0.25);
            transition:0.3s;
        }

        a:hover{
            background:linear-gradient(to right,#ff8bd3,#7c3aed);
            transform:translateY(-2px);
        }
    </style>
</head>

<body>

<div class="box">

    <h2>
        <%= request.getParameter("title") == null ? "Message" : request.getParameter("title") %>
    </h2>

    <p>
        <%= request.getParameter("msg") == null ? "" : request.getParameter("msg") %>
    </p>

    <a href="<%= request.getParameter("link") == null ? "login.jsp" : request.getParameter("link") %>">
        Continue
    </a>

</div>

</body>
</html>