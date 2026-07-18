 
package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    public boolean validateUser(String username,String password){
        boolean status =false;
        try{
            Connection con=DBConnection.getConnection();
            String validate="SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(validate);
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                status=true;
            }
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        return status;
    }
    
    
}
