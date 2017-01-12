package dao;
import connect.DBConnect; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import model.Cpu;
public class CpuDAO {
    //get tên CPU theo cpuID
    public ArrayList<Cpu> getCpuNameID(long cpuID) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT cpu_name FROM cpu WHERE cpu_id = '" + cpuID + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Cpu> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Cpu cpu = new Cpu();        
            cpu.setCpuName(rs.getString("cpu_name"));       
            list.add(cpu);         
        }         
        return list;    
    }
    // get danh sách CPU
    public ArrayList<Cpu> getListCpu() throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM cpu";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Cpu> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Cpu category = new Cpu();      
            category.setCpuID(rs.getInt("cpu_id"));       
            category.setCpuName(rs.getString("cpu_name"));       
            list.add(category);         
        }         
        return list;    
    }
    public boolean insert(Cpu c) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "call insertcpu(?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getCpuName());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    public boolean update(Cpu c) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE cpu SET cpu_name= ? WHERE cpu_id=?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getCpuName());
            ps.setLong(2, c.getCpuID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException e) {
        return false;
        }
    }
    public boolean delete(long cpu_id) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "DELETE FROM cpu WHERE cpu_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, cpu_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException e) {
        return false;
        }
    }
    public static void main(String[] args) throws SQLException 
    {       
        CpuDAO dao = new CpuDAO();      
    } 
    
}
