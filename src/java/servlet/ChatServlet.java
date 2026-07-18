package servlet;

import dao.MessageDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

//@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
    
    

   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    System.out.println("🔥 ChatServlet HIT 🔥");

    
    HttpSession session = request.getSession(false);

    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");

    
    String roomName = request.getParameter("roomName");
    String message = request.getParameter("message");
//    System.out.println("Saving message in room: " + roomName);

    if (message == null || message.trim().isEmpty()) {
        response.sendRedirect("chat.jsp?roomName=" + roomName + "&error=Message cannot be empty");
        return;
    }

    message = message.trim();

    MessageDao dao = new MessageDao();
    boolean status = dao.saveMessage(roomName, username, message);

    if (status) {
        response.sendRedirect("chat.jsp?roomName=" + roomName);
    } else {
        response.sendRedirect("chat.jsp?roomName=" + roomName + "&error=Something went wrong");
    }
}
}