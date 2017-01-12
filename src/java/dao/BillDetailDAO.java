package dao;
import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.BillDetail;
public class BillDetailDAO {
    public void insertBillDetail(BillDetail bd) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO bill_detail VALUES(?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, bd.getBillDetailID());
        ps.setLong(2, bd.getProductID());
        ps.setInt(3, bd.getQuantity());
        ps.setInt(4, bd.getPrice());
        ps.setLong(5, bd.getBillID());      
        ps.executeUpdate();
    }    
    //kiểm tra, trả về thông tin BillDetail theo BillDetail ID
    public ArrayList<BillDetail> getListBillDetailbyBillID(String BillID) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM bill_detail WHERE bill_id = '" + BillID + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<BillDetail> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            BillDetail billDetail = new BillDetail();      
            billDetail.setBillDetailID(rs.getLong("bill_detail_id"));
            billDetail.setProductID(rs.getLong("product_id"));
            billDetail.setQuantity(rs.getInt("quantity"));
            billDetail.setPrice(rs.getInt("price"));
            billDetail.setBillID(rs.getLong("bill_id"));
            list.add(billDetail);         
        }         
        return list;    
    }
    public static void main(String[] args) throws SQLException {
        BillDetailDAO dao = new BillDetailDAO();      
        for (BillDetail ds : dao.getListBillDetailbyBillID("1483436508149")) 
        {           
            System.out.println(ds.getBillDetailID()+" - " + ds.getPrice());         
        } 
    }
    
}
