package dao;
import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Bill;
public class BillDAO {
    public void insertBill(Bill bill) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO bill VALUES(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, bill.getBillID());
        ps.setString(2, bill.getBillName());
        ps.setLong(3, bill.getBillPhone());
        ps.setString(4, bill.getBillAddress());
        ps.setTimestamp(5, bill.getBillDate());
        ps.setString(6, bill.getBillPayment());
        ps.setLong(7, bill.getBillPaid());
        ps.setLong(8, bill.getBillFinish());
        ps.setLong(9, bill.getBillTotal());
        ps.setLong(10, bill.getUserID());
        ps.executeUpdate();
    }
    public ArrayList<Bill> getListBill() {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM bill ORDER BY bill_finish ASC";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Bill> list = new ArrayList<>();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getLong("bill_id"));
                bill.setBillName(rs.getString("bill_name"));
                bill.setBillPhone(rs.getInt("bill_phone"));
                bill.setBillAddress(rs.getString("bill_address"));
                bill.setBillDate(rs.getTimestamp("bill_date"));
                bill.setBillPayment(rs.getString("bill_payment"));
                bill.setBillPaid(rs.getInt("bill_paid"));
                bill.setBillFinish(rs.getInt("bill_finish"));
                bill.setBillTotal(rs.getInt("bill_total"));
                bill.setUserID(rs.getLong("user_id"));
                list.add(bill);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ArrayList<Bill> getListBillup() {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM `bill` WHERE `bill_finish` = 0 ORDER BY `bill`.`bill_date` DESC";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Bill> list = new ArrayList<>();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getLong("bill_id"));
                bill.setBillName(rs.getString("bill_name"));
                bill.setBillPhone(rs.getInt("bill_phone"));
                bill.setBillAddress(rs.getString("bill_address"));
                bill.setBillDate(rs.getTimestamp("bill_date"));
                bill.setBillPayment(rs.getString("bill_payment"));
                bill.setBillPaid(rs.getInt("bill_paid"));
                bill.setBillFinish(rs.getInt("bill_finish"));
                bill.setBillTotal(rs.getInt("bill_total"));
                bill.setUserID(rs.getLong("user_id"));
                list.add(bill);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    //kiểm tra, trả về thông tin Bill theo User ID
    public ArrayList<Bill> getListBillbyUserID(String userID) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM bill WHERE user_id = '" + userID + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Bill> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Bill bill = new Bill();      
            bill.setBillID(rs.getLong("bill_id"));
            bill.setBillName(rs.getString("bill_name"));
            bill.setBillPhone(rs.getInt("bill_phone"));
            bill.setBillAddress(rs.getString("bill_address"));
            bill.setBillDate(rs.getTimestamp("bill_date"));
            bill.setBillPayment(rs.getString("bill_payment"));
            bill.setBillPaid(rs.getInt("bill_paid"));
            bill.setBillFinish(rs.getInt("bill_finish"));
            bill.setBillTotal(rs.getInt("bill_total"));
            bill.setUserID(rs.getLong("user_id")); 
            list.add(bill);         
        }         
        return list;    
    }
    //kiểm tra, trả về thông tin Bill theo Bill ID
    public Bill getBill(String BillID) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM bill WHERE bill_id = '" + BillID + "'";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        Bill bill = new Bill();        
        while (rs.next()) 
        {                  
            bill.setBillID(rs.getLong("bill_id"));
            bill.setBillName(rs.getString("bill_name"));
            bill.setBillPhone(rs.getInt("bill_phone"));
            bill.setBillAddress(rs.getString("bill_address"));
            bill.setBillDate(rs.getTimestamp("bill_date"));
            bill.setBillPayment(rs.getString("bill_payment"));
            bill.setBillPaid(rs.getInt("bill_paid"));
            bill.setBillFinish(rs.getInt("bill_finish"));
            bill.setBillTotal(rs.getInt("bill_total"));
            bill.setUserID(rs.getLong("user_id"));         
        }         
        return bill;    
    }
    public boolean finish(long c) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE bill SET bill_paid = 1, bill_finish= 1 WHERE bill_id=?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException e) {
        return false;
        }
    }
    
    //kiểm tra, trả về thông tin Bill theo Bill ID
    public Bill doanhthuthang(String thang) throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT sum(`bill_total`) FROM bill WHERE MONTH(`bill_date`) = '" + thang + "' and YEAR(`bill_date`) = YEAR(now())";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        Bill bill = new Bill();        
        while (rs.next()) 
        {                  
            bill.setBillTotal(rs.getInt("sum(`bill_total`)"));         
        }         
        return bill;    
    }
    public boolean update(long c) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE bill SET bill_paid= 1 WHERE bill_id=?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException e) {
        return false;
        }
    }
    public boolean delete(long bill_id) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "DELETE FROM bill WHERE bill_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, bill_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException e) {
        return false;
        }
    }
     public ArrayList<Bill> getListBillnotpaid() {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM bill where bill_paid=0 AND bill_finish = 0";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Bill> list = new ArrayList<>();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getLong("bill_id"));
                bill.setBillName(rs.getString("bill_name"));
                bill.setBillPhone(rs.getInt("bill_phone"));
                bill.setBillAddress(rs.getString("bill_address"));
                bill.setBillDate(rs.getTimestamp("bill_date"));
                bill.setBillPayment(rs.getString("bill_payment"));
                bill.setBillPaid(rs.getInt("bill_paid"));
                bill.setBillFinish(rs.getInt("bill_finish"));
                bill.setBillTotal(rs.getInt("bill_total"));
                bill.setUserID(rs.getLong("user_id"));
                list.add(bill);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ArrayList<Bill> getListBillpaid() {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM bill where bill_paid=1 AND bill_finish = 0";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Bill> list = new ArrayList<>();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getLong("bill_id"));
                bill.setBillName(rs.getString("bill_name"));
                bill.setBillPhone(rs.getInt("bill_phone"));
                bill.setBillAddress(rs.getString("bill_address"));
                bill.setBillDate(rs.getTimestamp("bill_date"));
                bill.setBillPayment(rs.getString("bill_payment"));
                bill.setBillPaid(rs.getInt("bill_paid"));
                bill.setBillFinish(rs.getInt("bill_finish"));
                bill.setBillTotal(rs.getInt("bill_total"));
                bill.setUserID(rs.getLong("user_id"));
                list.add(bill);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ArrayList<Bill> getListBillfinish() {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM bill where bill_paid=1 AND bill_finish = 1";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Bill> list = new ArrayList<>();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getLong("bill_id"));
                bill.setBillName(rs.getString("bill_name"));
                bill.setBillPhone(rs.getInt("bill_phone"));
                bill.setBillAddress(rs.getString("bill_address"));
                bill.setBillDate(rs.getTimestamp("bill_date"));
                bill.setBillPayment(rs.getString("bill_payment"));
                bill.setBillPaid(rs.getInt("bill_paid"));
                bill.setBillFinish(rs.getInt("bill_finish"));
                bill.setBillTotal(rs.getInt("bill_total"));
                bill.setUserID(rs.getLong("user_id"));
                list.add(bill);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) throws SQLException {
        
        BillDAO dao = new BillDAO();      
        System.out.println(dao.doanhthuthang("2").getBillTotal());
//        for (Bill ds : dao.getBill("1483110241484")) 
//        {           
//            System.out.println(ds.getBillID()+" - " + ds.getBillPayment());         
//        } 
    }
    
}
