package dao;
import connect.DBConnect; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Users; 
public class UsersDAO {
    //get user
    public ArrayList<Users> getListUsers() throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM users";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Users> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Users users = new Users();      
            users.setUserID(rs.getLong("user_id"));   
            users.setUserFullName(rs.getString("user_fullname")); 
            users.setUserAddress(rs.getString("user_address")); 
            users.setUserPhone(rs.getLong("user_phone")); 
            users.setUserEmail(rs.getString("user_email")); 
            list.add(users);         
        }         
        return list;    
    }
    // kiểm tra email tồn tại chưa
    public boolean checkEmail(String email) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM users WHERE user_email = '" + email + "'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
            return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    //kiểm tra, trả về tên khách hàng tường ứng với email truyền vào
    public ArrayList<Users> getUserByEmail(String email) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM users WHERE user_email = '" + email + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Users> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Users users = new Users();      
            users.setUserID(rs.getLong("user_id"));   
            users.setUserFullName(rs.getString("user_fullname")); 
            users.setUserAddress(rs.getString("user_address")); 
            users.setUserPhone(rs.getLong("user_phone")); 
            users.setUserEmail(rs.getString("user_email")); 
            list.add(users);         
        }         
        return list;    
    }
    // phương thức thêm tài khoản
    public boolean insertUser(Users u) {
        Connection connection = DBConnect.getConnecttion();

        String sql = "INSERT INTO users VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, u.getUserID());
            ps.setString(2, u.getUserFullName());
            ps.setString(3, u.getUserAddress());
            ps.setLong(4, u.getUserPhone());
            ps.setString(5, u.getUserEmail());
            ps.setString(6, u.getUserPass());

            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    //Đổi mật khẩu
    public boolean updatePass(Users u, String UserID) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE users SET user_pass = '" + u.getUserPass() + "' WHERE user_id = '"+ UserID + "'";
            PreparedStatement ps = connection.prepareCall(sql);         
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    //Đổi thông tin User
    public boolean updateUser(Users u, String UserID) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE users SET user_fullname = '" + u.getUserFullName() + "', user_address = '" + u.getUserAddress() + "', user_phone = '" + u.getUserPhone() + "' WHERE user_id = '"+ UserID + "'";
            PreparedStatement ps = connection.prepareCall(sql);         
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    // kiểm tra đăng nhập
    public Users login(String email, String password) {
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from users where user_email='" + email + "' and user_pass='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users u = new Users();
                u.setUserEmail(rs.getString("user_email"));
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public Users getUser(long userID) {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM users WHERE user_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, userID);
            ResultSet rs = ps.executeQuery();
            Users u = new Users();
            while (rs.next()) {
                u.setUserEmail(rs.getString("user_email"));
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }    
    public static void main(String[] args) throws SQLException 
    {       
        UsersDAO dao = new UsersDAO(); 
//        for (Users ds : dao.getUserByEmail("demo@gmail.com")) 
//        {           
//            System.out.println(ds.getUserID()+" - " + ds.getUserFullName());         
//        }     
    } 
}
