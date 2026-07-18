package servlet;

import dao.RoomDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//@WebServlet("/RoomServlet")
public class RoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    // 🔒 1. Session check (IMPORTANT)
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");

    // 🔹 2. Get room name
    String roomName = request.getParameter("roomName");

    // 🔹 3. Null / empty validation
    if (roomName == null || roomName.trim().isEmpty()) {
        response.sendRedirect("room.jsp?error=Room name cannot be empty");
        return;
    }

    // 🔹 4. Trim
    roomName = roomName.trim();

    RoomDao dao = new RoomDao();

    // 🔹 5. Duplicate check
    if (dao.isRoomExists(roomName)) {
        response.sendRedirect("room.jsp?error=Room already exists");
        return;
    }

    // 🔹 6. Insert room
    boolean status = dao.CreateRoom(roomName, username);

    if (status) {
        response.sendRedirect("room.jsp");
    } else {
        response.sendRedirect("room.jsp?error= Room already exits");
    }
}
    }