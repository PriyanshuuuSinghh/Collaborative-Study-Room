<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register - Study Room</title>
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
            width: 360px;
            text-align: center;
        }

        h1 {
            color: #1e3a8a;
            margin-bottom: 25px;
        }

        .subtitle {
            color: #475569;
            margin-bottom: 20px;
            font-size: 14px;
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
            background: #16a34a;
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
            background: #15803d;
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

        .error {
            color: red;
            margin-top: 12px;
            font-size: 14px;
        }

        .success {
            color: green;
            margin-top: 12px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Create Account</h1>
    <p class="subtitle">Join your collaborative study room</p>

    <form action="RegisterServlet" method="post">
        <input type="text" name="username" placeholder="Choose username" required><br>
        <input type="password" name="password" placeholder="Choose password" required><br>
        <button type="submit">Register</button>
    </form>

    <a href="login.jsp">Already have an account? Login</a>
</div>

</body>
</html>