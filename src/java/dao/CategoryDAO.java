package dao; 
import connect.DBConnect; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category; 
public class CategoryDAO 
{     
    // get danh sách thể loại     
    public ArrayList<Category> getListCategory() throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM category";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Category> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Category category = new Category();      
            category.setCategoryID(rs.getInt("category_id"));       
            category.setCategoryName(rs.getString("category_name"));
            category.setCategorymt(rs.getString("category_metatitle")); 
            category.setCategorymkw(rs.getString("category_metakeywords"));  
            category.setCategorymd(rs.getString("category_metadescription"));  
            list.add(category);         
        }         
        return list;    
    }
    // kiểm tra email tồn tại chưa
    public boolean checkCategory(String Category) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM category WHERE category_name = '" + Category + "'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
            return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
        //Get thể loại
    public Category getCategory(long categoryID) throws SQLException 
    {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM category WHERE `category_id` = '" + categoryID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Category category = new Category();
        while (rs.next()) 
        {
            category.setCategoryID(rs.getInt("category_id"));       
            category.setCategoryName(rs.getString("category_name"));
            category.setCategorymt(rs.getString("category_metatitle")); 
            category.setCategorymkw(rs.getString("category_metakeywords"));  
            category.setCategorymd(rs.getString("category_metadescription"));
        }
        return category;
    }
    //get tên loại sản phẩm them id
    public ArrayList<Category> getCategoryNameID(long categoryID) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT category_name FROM category WHERE category_id = '" + categoryID + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Category> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Category category = new Category();        
            category.setCategoryName(rs.getString("category_name"));       
            list.add(category);         
        }         
        return list;    
    }
    public boolean insert(Category c) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO category VALUE(?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getCategoryID());
            ps.setString(2, c.getCategoryName());
            ps.setString(3, c.getCategorymt());
            ps.setString(4, c.getCategorymkw());
            ps.setString(5, c.getCategorymd());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    public boolean update(Category c) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE category SET category_name = ?,category_metatitle = ?,category_metakeywords = ?,category_metadescription = ? WHERE category_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);         
            ps.setString(1, c.getCategoryName());
            ps.setString(2, c.getCategorymt());
            ps.setString(3, c.getCategorymkw());
            ps.setString(4, c.getCategorymd());
            ps.setLong(5, c.getCategoryID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    public boolean delete(long category_id) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "DELETE FROM category WHERE category_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, category_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    public static void main(String[] args) throws SQLException 
    {       
        CategoryDAO dao = new CategoryDAO();      
        System.out.println(dao.getListCategory());
    } 
} 