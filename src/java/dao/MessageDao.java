    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author singh
 */
public class MessageDao {
    
    public int getRoomIDByName(String roomName){
        int roomId=0;
        
        
        try{
            Connection con =DBConnection.getConnection();
            String query="SELECT id FROM rooms WHERE room_name=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,roomName);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                roomId = rs.getInt("id");
            }                                                    
        } catch(SQLException e){
            e.printStackTrace();
        }
        return roomId;
    }
    
    public boolean  saveMessage(String roomName, String username, String message){
        boolean status = false;
        
        try{
            Connection con = DBConnection.getConnection();
            
            int roomId= getRoomIDByName(roomName);
            
            String query="INSERT into messages (room_id,username,message) values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setInt(1, roomId);
            ps.setString(2,username);
            ps.setString(3, message);
            
            int rows= ps.executeUpdate();
            
            if(rows>0){
                status=true;
                
            }
            
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        
        return status;
    }
    public ArrayList<String> getMessageByRoom(String roomName){
        ArrayList<String>messageList=new ArrayList<>();
        try{
            Connection con = DBConnection.getConnection();
            int roomID= getRoomIDByName(roomName);
            String query="SELECT username,message FROM messages where room_id=?";
            
            PreparedStatement ps =con.prepareStatement(query);
            ps.setInt(1, roomID);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                String fullMessage=rs.getString("username")+ ":"+rs.getString("message"); 
                messageList.add(fullMessage);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return messageList;
        
        
    }
    
}
