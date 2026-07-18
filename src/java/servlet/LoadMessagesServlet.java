package servlet;

import dao.MessageDao;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/LoadMessagesServlet")
public class LoadMessagesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String roomName = request.getParameter("roomName");
//        System.out.println("Fetching messages for room: " + roomName);

        MessageDao dao = new MessageDao();
        ArrayList<String> messages = dao.getMessageByRoom(roomName);

        if (messages.size() == 0) {
            response.getWriter().println("<p>No messages yet.</p>");
        } else {
            for (String msg : messages) {

    String safeMsg = msg
        .replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;");

    response.getWriter().println("<p>" + safeMsg + "</p>");
}
        }
    }
}