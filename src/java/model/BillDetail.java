package model;
public class BillDetail {
    private long billDetailID;
    private long productID;   
    private int quantity;
    private int price;
    private long billID;
    public BillDetail() {
    }

    public BillDetail(long billDetailID, long productID, int quantity, int price, long billID) {
        this.billDetailID = billDetailID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
        this.billID = billID;
    }
    
    public long getBillDetailID() {
        return billDetailID;
    }
    public void setBillDetailID(long billDetailID) {
        this.billDetailID = billDetailID;
    }
    public long getProductID() {
        return productID;
    }
    public void setProductID(long productID) {
        this.productID = productID;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public long getBillID() {
        return billID;
    }
    public void setBillID(long billID) {
        this.billID = billID;
    }    
}
