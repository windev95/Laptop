package dao;
import connect.DBConnect; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import model.Storage;
public class StorageDAO {
    //get tên ổ cứng theo storageID
    public ArrayList<Storage> getStorageNameID(long storageID) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT storage_name FROM storage WHERE storage_id = '" + storageID + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Storage> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Storage storage = new Storage();        
            storage.setStorageName(rs.getString("storage_name"));       
            list.add(storage);         
        }         
        return list;    
    }
    // get danh sách Storage
    public ArrayList<Storage> getListStorage() throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM storage";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Storage> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Storage category = new Storage();      
            category.setStorageID(rs.getInt("storage_id"));       
            category.setStorageName(rs.getString("storage_name"));       
            list.add(category);         
        }         
        return list;    
    }
    public static void main(String[] args) throws SQLException 
    {       
        StorageDAO dao = new StorageDAO();      
        for (Storage ds : dao.getStorageNameID(3)) 
        {           
            System.out.println(" - " + ds.getStorageName());         
        }     
    } 
    
}
