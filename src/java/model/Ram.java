package model;
public class Ram {
    private long ramID;
    private String ramName;

    public Ram() {
    }

    public Ram(long ramID, String ramName) {
        this.ramID = ramID;
        this.ramName = ramName;
    }

    public long getRamID() {
        return ramID;
    }

    public void setRamID(long ramID) {
        this.ramID = ramID;
    }

    public String getRamName() {
        return ramName;
    }

    public void setRamName(String ramName) {
        this.ramName = ramName;
    }
    
}
