<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.RoomDao" %>

<%
if (session == null || session.getAttribute("username") == null) {
    response.sendRedirect("login.jsp");
    return;
}

String username = (String) session.getAttribute("username");


    RoomDao dao = new RoomDao();
    ArrayList<String[]> rooms = dao.getAllRoomsWithOwner();
%>

<html>
<head>
    
    <title>Study Room Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8fafc;
            margin: 0;
            padding: 0;
        }

        .header {
            background: #1e3a8a;
            color: white;
            padding: 20px 40px;
        }

        .header h2 {
            margin: 0;
        }

        .container {
            width: 80%;
            margin: 30px auto;
        }

        .card {
            background: white;
            padding: 25px;
            margin-bottom: 25px;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.08);
        }

        h3 {
            color: #1e293b;
            margin-bottom: 15px;
        }

        input[type="text"] {
            width: 70%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 15px;
        }

        button {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 18px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 15px;
            margin-left: 10px;
        }

        button:hover {
            background: #1d4ed8;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            background: #eff6ff;
            margin: 10px 0;
            padding: 14px;
            border-radius: 10px;
            transition: 0.2s;
        }

        li:hover {
            background: #dbeafe;
        }

        a.room-link {
            text-decoration: none;
            color: #1e3a8a;
            font-weight: bold;
            display: block;
        }

        .logout {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: white;
            background: #dc2626;
            padding: 10px 18px;
            border-radius: 8px;
            font-weight: bold;
        }

        .logout:hover {
            background: #b91c1c;
        }

        .empty {
            color: #64748b;
            font-style: italic;
        }
    </style>
</head>
<body>
    
    <%
String error = request.getParameter("error");

if (error != null && !error.trim().isEmpty()) {

    String safeError = error
        .replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;");
%>

    <div style="color: #dc2626; background:#fee2e2; padding:10px; border-radius:8px; margin:10px;">
        <%= safeError %>
    </div>

<%
}
%>

<div class="header">
    <h2>Welcome, <%= username %></h2>
    <p>Study Room Dashboard</p>
    <a href="logout.jsp" class="logout">Logout</a>
</div>

<div class="container">

    <div class="card">
        <h3>Create a New Study Room</h3>
        <form action="RoomServlet" method="post">
            <input type="text" name="roomName" placeholder="Enter room name..." >
            <button type="submit">Create Room</button>
        </form>
    </div>

    <div class="card">
        <h3>Available Rooms</h3>

        <%
            if(rooms.size() == 0){
        %>
            <p class="empty">No rooms created yet.</p>
        <%
            } else {
        %>
            <ul>
            <%
                for(String[] room : rooms){
                    String roomName = room[0];
                    String owner = room[1];
            %>

                <li>
                    <a class="room-link" href="chat.jsp?roomName=<%= roomName %>">
                        <%= roomName %>
                    </a>
                    <br>
                    <small>Created by: <%= owner %></small>
                    <% if(username.equals(owner)){ %>
                    <form action="DeleteRoomServlet" method="post" style="margin-top:8px;">
                        <input type="hidden" name="roomName" value="<%= roomName %>">
                        <button type="submit">Delete Room</button>
                    </form>
                    
                        
                    <% } %>
                    
                    
                </li>

            <%
                }
            %>
            </ul>
        <%
            }
        %>
    </div>

</div>

</body>
</html>