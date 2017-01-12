package dao;
import connect.DBConnect; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin; 
public class AdminDAO {
    // phương thức thêm tài khoản
    public boolean insertAdmin(Admin a) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO admin VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, a.getAdminID());
            ps.setString(2, a.getAdminfullName());
            ps.setString(3, a.getAdminAvatar());
            ps.setString(4, a.getAdminEmail());
            ps.setString(5, a.getAdminPass());
            ps.setLong(6, a.getPqID());

            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    // get danh sách Admin  
    public ArrayList<Admin> getListAdmin() throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM admin";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Admin> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Admin admin = new Admin();      
            admin.setAdminID(rs.getLong("admin_id"));   
            admin.setAdminfullName(rs.getString("admin_fullname"));
            admin.setAdminAvatar(rs.getString("admin_avatar")); 
            admin.setAdminEmail(rs.getString("admin_email")); 
            admin.setPqID(rs.getLong("pq_id"));  
            list.add(admin);         
        }         
        return list;    
    }
    // kiểm tra đăng nhập
    public Admin login(String email, String password) {
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from admin where admin_email ='" + email + "' and admin_pass ='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin a = new Admin();
                a.setAdminEmail(rs.getString("admin_email"));
                con.close();
                return a;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    // kiểm tra email tồn tại chưa
    public boolean checkEmail(String email) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM admin WHERE admin_email = '" + email + "'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
            return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    //kiểm tra, trả về tên khách hàng tường ứng với email truyền vào
    public ArrayList<Admin> getAdminByEmail(String email) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM admin WHERE admin_email = '" + email + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Admin> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Admin admin = new Admin();      
            admin.setAdminID(rs.getLong("admin_id"));   
            admin.setAdminfullName(rs.getString("admin_fullname"));
            admin.setAdminAvatar(rs.getString("admin_avatar")); 
            admin.setAdminEmail(rs.getString("admin_email")); 
            admin.setPqID(rs.getLong("pq_id")); 
            list.add(admin);         
        }         
        return list;    
    }
    public Admin getAdmin(long adminID) throws SQLException 
    {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM admin WHERE `admin_id` = '" + adminID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Admin admin = new Admin();
        while (rs.next()) 
        {
            admin.setAdminID(rs.getLong("admin_id"));   
            admin.setAdminfullName(rs.getString("admin_fullname"));
            admin.setAdminAvatar(rs.getString("admin_avatar")); 
            admin.setAdminEmail(rs.getString("admin_email")); 
            admin.setPqID(rs.getLong("pq_id"));
        }
        return admin;
    }
    public boolean delete(long admin_id) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "DELETE FROM admin WHERE admin_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, admin_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    
}
