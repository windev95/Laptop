package dao;
import connect.DBConnect; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import model.Pq; 
public class PqDAO {
    //kiểm tra, trả về tên khách hàng tường ứng với email truyền vào
    public ArrayList<Pq> getPq(String pqID) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM pq WHERE pq_id = '" + pqID + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Pq> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Pq pq = new Pq();      
            pq.setPqID(rs.getLong("pq_id"));   
            pq.setPqName(rs.getString("pq_name"));
            pq.setPqContent(rs.getString("pq_content"));
            pq.setPqType(rs.getInt("pq_type"));
            list.add(pq);         
        }         
        return list;    
    }
    // get danh sách Admin  
    public ArrayList<Pq> getListPq() throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM pq";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Pq> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Pq pq = new Pq();      
            pq.setPqID(rs.getLong("pq_id"));   
            pq.setPqName(rs.getString("pq_name"));
            pq.setPqContent(rs.getString("pq_content"));
            pq.setPqType(rs.getInt("pq_type")); 
            list.add(pq);         
        }         
        return list;    
    }
    // kiểm tra đăng nhập
    public Pq getPqType(String pqID) {
        Connection con = DBConnect.getConnecttion();
        String sql = "select pq_type from pq where pq_id='" + pqID + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {      
                Pq u = new Pq();
                u.setPqType(rs.getInt("pq_type"));
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    // kiểm tra đăng nhập
    public Pq getPqName(String pqID) {
        Connection con = DBConnect.getConnecttion();
        String sql = "select pq_name from pq where pq_id='" + pqID + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {      
                Pq u = new Pq();
                u.setPqName(rs.getString("pq_name"));
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean insert(Pq pq) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO pq(pq_id,pq_name,pq_content,pq_type) VALUE(?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, pq.getPqID());
            ps.setString(2, pq.getPqName());
            ps.setString(3, pq.getPqContent());
            ps.setInt(4, pq.getPqType());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
     public boolean update(Pq pq) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE pq SET  pq_name= ?, pq_content= ?, pq_type= ? WHERE pq_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);         
            ps.setString(1, pq.getPqName());
            ps.setString(2, pq.getPqContent());
            ps.setInt(3, pq.getPqType());
            ps.setLong(3, pq.getPqID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    public boolean delete(long pq_id) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "DELETE FROM pq WHERE pq_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, pq_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
        public static void main(String[] args) throws SQLException {
        
        PqDAO dao = new PqDAO();      
        System.out.println(dao.getPqType("4").getPqType());
        }

    }
