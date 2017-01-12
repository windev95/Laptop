package model;
public class Users {
    private long userID;
    private String userfullName;
    private String userAddress;
    private long userPhone;
    private String userEmail;
    private String userPass;    
    public Users(){
    }

    public Users(long userID, String userfullName, String userAddress, long userPhone, String userEmail, String userPass) {
        this.userID = userID;
        this.userfullName = userfullName;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.userEmail = userEmail;
        this.userPass = userPass;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public String getUserFullName() {
        return userfullName;
    }

    public void setUserFullName(String userfullName) {
        this.userfullName = userfullName;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public long getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(long userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }
    
}
