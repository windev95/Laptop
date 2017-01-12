package model;
public class Pq {
    private long pqID;
    private String pqName;
    private String pqContent;
    private int pqType;

    public Pq() {
    }

    public Pq(long pqID, String pqName, String pqContent, int pqType) {
        this.pqID = pqID;
        this.pqName = pqName;
        this.pqContent = pqContent;
        this.pqType = pqType;
    }

    public long getPqID() {
        return pqID;
    }

    public void setPqID(long pqID) {
        this.pqID = pqID;
    }

    public String getPqName() {
        return pqName;
    }

    public void setPqName(String pqName) {
        this.pqName = pqName;
    }

    public String getPqContent() {
        return pqContent;
    }

    public void setPqContent(String pqContent) {
        this.pqContent = pqContent;
    }

    public int getPqType() {
        return pqType;
    }

    public void setPqType(int pqType) {
        this.pqType = pqType;
    }
    
}
