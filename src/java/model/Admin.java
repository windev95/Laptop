package model;
public class Admin {
    private long adminID;
    private String adminfullName;
    private String adminAvatar;
    private String adminEmail;
    private String adminPass; 
    private long pqID; 

    public Admin() {
    }

    public Admin(long adminID, String adminfullName, String adminAvatar, String adminEmail, String adminPass, long pqID) {
        this.adminID = adminID;
        this.adminfullName = adminfullName;
        this.adminAvatar = adminAvatar;
        this.adminEmail = adminEmail;
        this.adminPass = adminPass;
        this.pqID = pqID;
    }

    public long getAdminID() {
        return adminID;
    }

    public void setAdminID(long adminID) {
        this.adminID = adminID;
    }

    public String getAdminfullName() {
        return adminfullName;
    }

    public void setAdminfullName(String adminfullName) {
        this.adminfullName = adminfullName;
    }

    public String getAdminAvatar() {
        return adminAvatar;
    }

    public void setAdminAvatar(String adminAvatar) {
        this.adminAvatar = adminAvatar;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getAdminPass() {
        return adminPass;
    }

    public void setAdminPass(String adminPass) {
        this.adminPass = adminPass;
    }

    public long getPqID() {
        return pqID;
    }

    public void setPqID(long pqID) {
        this.pqID = pqID;
    }
    
}
