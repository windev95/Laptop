package dao;
import connect.DBConnect; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import model.Producer; 
public class ProducerDAO {
    //Get danh sách nhà sản xuất
    public ArrayList<Producer> getListProducer() throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM producer";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Producer> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Producer category = new Producer();      
            category.setProducerID(rs.getInt("producer_id"));       
            category.setProducerName(rs.getString("producer_name"));
            category.setProducerImageBrand(rs.getString("producer_image_brand"));
            category.setProducerLink(rs.getString("producer_link")); 
            list.add(category);         
        }         
        return list;    
    }
    //get tên loại sản phẩm them id
    public ArrayList<Producer> getProducerNamebyID(long producerID) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT producer_name FROM producer WHERE producer_id = '" + producerID + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Producer> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Producer producer = new Producer();        
            producer.setProducerName(rs.getString("producer_name"));       
            list.add(producer);         
        }         
        return list;    
    }
    //get tên loại sản phẩm them id
    public ArrayList<Producer> getProducerNameID(long producerID) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT producer_name FROM producer WHERE producer_id = '" + producerID + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Producer> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Producer category = new Producer();      
            category.setProducerID(rs.getInt("producer_id")); 
            category.setProducerName(rs.getString("producer_name")); 
            category.setProducerImageBrand(rs.getString("producer_image_brand")); 
            category.setProducerLink(rs.getString("producer_link")); 
            list.add(category);         
        }         
        return list;    
    }
    public Producer getProducer(long producerID) {
    try {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM producer WHERE producer_id = ?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, producerID);
        ResultSet rs = ps.executeQuery();
        Producer u = new Producer();
        while (rs.next()) {
        u.setProducerName(rs.getString("producer_name"));
        }
    return u;
    } catch (SQLException ex) {
    
    }
    return null;
    }
    public boolean insert(Producer c) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "call insertproducer(?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getProducerName());
            ps.setString(2, c.getProducerImageBrand());
            ps.setString(3, c.getProducerLink());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException e) {
        return false;
        }
    }
    public boolean update(Producer c) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE producer SET producer_name= ?,producer_image_brand=?,producer_link=? WHERE producer_id=?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getProducerName());
            ps.setString(2, c.getProducerImageBrand());
            ps.setString(3, c.getProducerLink());
            ps.setLong(4, c.getProducerID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException e) {
        return false;
        }
    }
    public boolean delete(long producer_id) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "DELETE FROM producer WHERE producer_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, producer_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException e) {
        return false;
        }
    }
    public static void main(String[] args) throws SQLException 
    {       
        ProducerDAO dao = new ProducerDAO();      
        for (Producer ds : dao.getProducerNameID(1)) 
        {           
            System.out.println(ds.getProducerID() +" - " + ds.getProducerName());         
        }     
    } 
    
}
