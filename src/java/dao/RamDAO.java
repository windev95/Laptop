package dao;
import connect.DBConnect; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import model.Ram;
public class RamDAO {
    //get tên RAM theo ramID
    public ArrayList<Ram> getRamNameID(long ramID) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT ram_name FROM ram WHERE ram_id = '" + ramID + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Ram> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Ram ram = new Ram();        
            ram.setRamName(rs.getString("ram_name"));       
            list.add(ram);         
        }         
        return list;    
    }
    // get danh sách RAM
    public ArrayList<Ram> getListRam() throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM ram";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Ram> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Ram category = new Ram();      
            category.setRamID(rs.getInt("ram_id"));       
            category.setRamName(rs.getString("ram_name"));       
            list.add(category);         
        }         
        return list;    
    }
    public static void main(String[] args) throws SQLException 
    {       
        RamDAO dao = new RamDAO();      
        for (Ram ds : dao.getRamNameID(1)) 
        {           
            System.out.println(" - " + ds.getRamName());         
        }     
    } 
    
}
