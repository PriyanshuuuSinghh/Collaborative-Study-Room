<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
if (session == null || session.getAttribute("username") == null) {
    response.sendRedirect("login.jsp");
    return;
}

String username = (String) session.getAttribute("username");

String roomName = request.getParameter("roomName");

if (roomName == null || roomName.trim().isEmpty()) {
    response.sendRedirect("room.jsp?error=Invalid room");
    return;
}

roomName = roomName.trim();
%>

<html>
<head>
    <title>Live Chat Room</title>
    <style>


body {
    font-family: Arial, sans-serif;
    background: #f1f5f9;
    margin: 0;
    padding: 0;
}


.header {
    background: #0f172a;
    color: white;
    padding: 15px 25px;
}

.header h2, .header h3 {
    margin: 5px 0;
}


.main-container {
    display: flex;
    flex-direction: column;
    height: 100vh;
}


.video-section {
    height: 40%;
    background: #111827;
    color: white;
    padding: 15px;
}


.bottom-section {
    display: flex;
    height: 60%;
}


.chat-section {
    width: 65%;
    display: flex;
    flex-direction: column;
    padding: 15px;
}


#chatBox {
    flex: 1;
    overflow-y: auto;
    background: white;
    border-radius: 12px;
    padding: 15px;
    border: 1px solid #cbd5e1;
    margin-bottom: 10px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.08);
}


#chatBox p {
    background: #eff6ff;
    padding: 10px 14px;
    border-radius: 10px;
    margin: 8px 0;
    font-size: 14px;
}


.message-form {
    display: flex;
}


input[type="text"] {
    width: 75%;
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


.resource-section {
    width: 35%;
    background: #e2e8f0;
    padding: 15px;
    overflow-y: auto;
}


.resource-section p {
    background: white;
    padding: 10px;
    border-radius: 8px;
    margin: 8px 0;
}

/* ===== BACK LINK ===== */
.back-link {
    display: inline-block;
    margin-top: 10px;
    text-decoration: none;
    color: #2563eb;
    font-weight: bold;
}

.back-link:hover {
    text-decoration: underline;
}

</style>

</head>
<body>

<div class="header">
<!--    <h2>Welcome, <%= username %> </h2>-->
    
    <%
String safeUsername = username
    .replace("&", "&amp;")
    .replace("<", "&lt;")
    .replace(">", "&gt;");
%>

<h2>Welcome, <%= safeUsername %></h2>
    <!--<h3>Room: <%= roomName %></h3>-->
<%
String safeRoom = roomName
    .replace("&", "&amp;")  
    .replace("<", "&lt;")
    .replace(">", "&gt;");
%>

Room: <%= safeRoom %>
</div>

<body>

<div class="main-container">


    <div class="video-section">
        <h3>Video Session</h3>
        
    </div>

    
    <div class="bottom-section">

        <div class="chat-section">
            <h3>Live Chat</h3>

            <div id="chatBox">
                
            </div>

            <form id="chatForm" action="ChatServlet" method="post">
                <input type="hidden" name="roomName" value="<%= roomName %>">
                <input type="text" name="message" placeholder="Type your message...">
                <button type="submit">Send</button>
            </form>
        </div>

        
        <div class="resource-section">
            <h3>Resources</h3>
            <p>No files yet</p>
        </div>

    </div>

</div>
 <script>

document.addEventListener("DOMContentLoaded", function () {

    const form = document.getElementById("chatForm");
    const chatBox = document.getElementById("chatBox");
    const input = document.querySelector("input[name='message']");

   
    function loadMessages() {
        let roomName = "<%= roomName %>";

        fetch("<%= request.getContextPath() %>/LoadMessagesServlet?roomName=" + roomName)
            .then(response => response.text())
            .then(data => {
                chatBox.innerHTML = data;

               
                chatBox.scrollTop = chatBox.scrollHeight;
            })
            .catch(err => console.error("Load error:", err));
    }

    
    setInterval(loadMessages, 2000);

   
    loadMessages();

    
    form.addEventListener("submit", function (e) {
        e.preventDefault();

        const formData = new FormData(form);

       fetch("<%= request.getContextPath() %>/ChatServlet", {
           method: "POST",
            body: formData
            
        })
        .then(response => {
            if (!response.ok) throw new Error("Send failed");

           
            input.value = "";

            
            setTimeout(loadMessages, 200);
        })
        .catch(err => console.error("Send error:", err));
    });

});

</script>
</body>

</body>
</html>