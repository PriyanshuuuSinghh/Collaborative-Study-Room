/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.ResultSet;
import java.sql.Connection;
import java. sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;



/**
 *
 * @author singh
 */
public class RoomDao {
    
    public boolean CreateRoom(String roomName,String createdBy){
        boolean status = false;
        try{
            Connection con = DBConnection.getConnection();
            
            String query="INSERT INTO rooms(room_name,created_by) VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,roomName);
            ps.setString(2,createdBy);
            
            int rows= ps.executeUpdate();
            
            if(rows>0){
                status = true;
            }
            
            
        }catch (SQLException e){
            e.printStackTrace();
        }
         return status;
    }
    
   public ArrayList<String[]> getAllRoomsWithOwner() {
        ArrayList<String[]> roomList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT room_name, created_by FROM rooms";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] roomData = new String[2];
                roomData[0] = rs.getString("room_name");
                roomData[1] = rs.getString("created_by");
                roomList.add(roomData);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roomList;
    }
   
   public boolean deleteRoom(String roomName, String username) {
    boolean status = false;


    try {
        Connection con = DBConnection.getConnection();

        // DEBUG
        System.out.println("Trying to delete: " + roomName + " by " + username);

        // STEP 1: get room id ONLY by room_name (ignore created_by for now)
        String getRoomIdQuery = "SELECT id, created_by FROM rooms WHERE room_name=?";
        PreparedStatement ps1 = con.prepareStatement(getRoomIdQuery);
        ps1.setString(1, roomName);
        ResultSet rs = ps1.executeQuery();

        int roomId = 0;
        String owner = "";

        if (rs.next()) {
            roomId = rs.getInt("id");
            owner = rs.getString("created_by");

            System.out.println("DB Owner: " + owner);
        } else {
            System.out.println("Room not found");
            return false;
        }

        // STEP 2: check ownership manually
        if (!username.equals(owner)) {
            System.out.println("User not owner → cannot delete");
            return false;
        }

        // STEP 3: delete messages
        String deleteMessagesQuery = "DELETE FROM messages WHERE room_id=?";
        PreparedStatement ps2 = con.prepareStatement(deleteMessagesQuery);
        ps2.setInt(1, roomId);
        ps2.executeUpdate();

        // STEP 4: delete room
        String deleteRoomQuery = "DELETE FROM rooms WHERE id=?";
        PreparedStatement ps3 = con.prepareStatement(deleteRoomQuery);
        ps3.setInt(1, roomId);

        int row = ps3.executeUpdate();
        System.out.println("Rows deleted: " + row);

        if (row > 0) {
            status = true;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return status;
}
   public boolean isRoomExists(String roomName){
       boolean exists=false;
       try{
           Connection con =DBConnection.getConnection();
           String query="Select * From rooms where room_name=?";
           PreparedStatement ps = con.prepareStatement(query);
           ps.setString(1,"roomName");
           ResultSet rs = ps.executeQuery();
           if(rs.next()){
               exists=true;
           }
       }catch(Exception e){
           e.printStackTrace();
       }
       return exists;
   }
   
   
   }
   
    
    

