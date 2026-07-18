
package servlet;

import dao.RoomDao;

import java.io.IOException;
//import java.io.PrintWriter;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class DeleteRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String roomName = request.getParameter("roomName");

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        RoomDao dao = new RoomDao();
        dao.deleteRoom(roomName, username);

        response.sendRedirect("room.jsp");
    }
}
   