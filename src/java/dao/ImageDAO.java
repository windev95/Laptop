package dao;
import connect.DBConnect; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import model.Image;
public class ImageDAO {
    //get tên loại sản phẩm them id
    public ArrayList<Image> getListImageByProduct(long product_id)  throws SQLException {     
        Connection connection = DBConnect.getConnecttion();      
        String sql = "SELECT * FROM image WHERE product_id = '" + product_id + "'";      
        PreparedStatement ps = connection.prepareCall(sql);       
        ResultSet rs = ps.executeQuery();       
        ArrayList<Image> list = new ArrayList<>();       
        while (rs.next()) { 
            Image image = new Image();     
            image.setImageID(rs.getLong("image_id"));    
            image.setImageAlt(rs.getString("image_alt")); 
            image.setImageImage(rs.getString("image_image"));        
            image.setProductID(rs.getLong("product_id"));  
            list.add(image);         
        }         
        return list;     
    }
    public ArrayList<Image> getListImage() throws SQLException{     
        Connection connection = DBConnect.getConnecttion();      
        String sql = "SELECT * FROM image";      
        PreparedStatement ps = connection.prepareCall(sql);       
        ResultSet rs = ps.executeQuery();       
        ArrayList<Image> list = new ArrayList<>();       
        while (rs.next()) { 
            Image image = new Image();     
            image.setImageID(rs.getLong("image_id"));    
            image.setImageAlt(rs.getString("image_alt")); 
            image.setImageImage(rs.getString("image_image"));        
            image.setProductID(rs.getLong("product_id"));  
            list.add(image);         
        }         
        return list;     
    }
    public boolean insert(Image c) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "call INSERTimage(?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getImageAlt());
            ps.setString(2, c.getImageImage());
            ps.setLong(3, c.getProductID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    public boolean update(Image c) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE image SET image_alt= ?,image_image=?,product_id=? WHERE image_id=?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getImageAlt());
            ps.setString(2, c.getImageImage());
            ps.setLong(3, c.getProductID());
            ps.setLong(4, c.getImageID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException e) {
        return false;
        }
    }
    public boolean delete(long image_id) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "DELETE FROM image WHERE image_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, image_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException e) {
        return false;
        }
    }
    public static void main(String[] args) throws SQLException 
    {       
        ImageDAO dao = new ImageDAO();
        dao.delete(8);
    } 
    
}
