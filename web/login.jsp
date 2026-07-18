<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - StudyRoom</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #dbeafe, #eff6ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            width: 350px;
            text-align: center;
        }

        h1 {
            color: #1e3a8a;
            margin-bottom: 25px;
        }

        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 15px;
        }

        button {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 20px;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
        }

        button:hover {
            background: #1d4ed8;
        }

        a {
            display: inline-block;
            margin-top: 18px;
            text-decoration: none;
            color: #2563eb;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .subtitle {
            color: #475569;
            margin-bottom: 20px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>StudyRoom Login</h1>
    <p class="subtitle">Collaborative study room platform</p>

    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Enter username" required><br>
        <input type="password" name="password" placeholder="Enter password" required><br>
        <button type="submit">Login</button>
    </form>

    <a href="register.jsp">New User? Register Here</a>
</div>

</body>
</html>