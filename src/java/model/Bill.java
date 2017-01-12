package model;
import java.sql.Timestamp;
public class Bill {
    private long billID;
    private String billName;
    private long billPhone;
    private String billAddress;  
    private Timestamp billDate;
    private String billPayment;
    private int billPaid;
    private int billFinish;
    private int billTotal;
    private long userID;  
    public Bill() {
    }
    public Bill(long billID, String billName, long billPhone, String billAddress, Timestamp billDate, String billPayment, int billPaid, int billFinish, int billTotal, long userID) {
        this.billID = billID;
        this.billName = billName;
        this.billPhone = billPhone;
        this.billAddress = billAddress;
        this.billDate = billDate;
        this.billPayment = billPayment;
        this.billPaid = billPaid;
        this.billFinish = billFinish;
        this.billTotal = billTotal;
        this.userID = userID;
    }
    public long getBillID() {
        return billID;
    }
    public void setBillID(long billID) {
        this.billID = billID;
    }
    public String getBillName() {
        return billName;
    }
    public void setBillName(String billName) {
        this.billName = billName;
    }
    public long getBillPhone() {
        return billPhone;
    }
    public void setBillPhone(long billPhone) {
        this.billPhone = billPhone;
    }
    public String getBillAddress() {
        return billAddress;
    }
    public void setBillAddress(String billAddress) {
        this.billAddress = billAddress;
    }
    public Timestamp getBillDate() {
        return billDate;
    }
    public void setBillDate(Timestamp billDate) {
        this.billDate = billDate;
    }
    public String getBillPayment() {
        return billPayment;
    }
    public void setBillPayment(String billPayment) {
        this.billPayment = billPayment;
    }
    public int getBillPaid() {
        return billPaid;
    }
    public void setBillPaid(int billPaid) {
        this.billPaid = billPaid;
    }
    public int getBillFinish() {
        return billFinish;
    }
    public void setBillFinish(int billFinish) {
        this.billFinish = billFinish;
    }
    public int getBillTotal() {
        return billTotal;
    }
    public void setBillTotal(int billTotal) {
        this.billTotal = billTotal;
    }
    public long getUserID() {
        return userID;
    }
    public void setUserID(long userID) {
        this.userID = userID;
    }    
}
