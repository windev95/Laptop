package dao;
import connect.DBConnect; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import model.Screensize;
public class ScreensizeDAO {
    //get tên loại sản phẩm them id
    public ArrayList<Screensize> getScreensizeNameID(long screensizeID) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT screensize_name FROM screensize WHERE screensize_id = '" + screensizeID + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Screensize> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Screensize screensize = new Screensize();        
            screensize.setScreensizeName(rs.getString("screensize_name"));       
            list.add(screensize);         
        }         
        return list;    
    }
    // get danh sách Screensize
    public ArrayList<Screensize> getListScreensize() throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM screensize";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Screensize> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Screensize category = new Screensize();      
            category.setScreensizeID(rs.getInt("screensize_id"));       
            category.setScreensizeName(rs.getString("screensize_name"));       
            list.add(category);         
        }         
        return list;    
    }
    public static void main(String[] args) throws SQLException 
    {       
        ScreensizeDAO dao = new ScreensizeDAO();      
        for (Screensize ds : dao.getScreensizeNameID(3)) 
        {           
            System.out.println(" - " + ds.getScreensizeName());         
        }     
    } 
    
}
