package model;
public class Pricelevel {
    private long pricelevelID;
    private String pricelevelName;

    public Pricelevel() {
    }

    public Pricelevel(long pricelevelID, String pricelevelName) {
        this.pricelevelID = pricelevelID;
        this.pricelevelName = pricelevelName;
    }

    public long getPricelevelID() {
        return pricelevelID;
    }

    public void setPricelevelID(long pricelevelID) {
        this.pricelevelID = pricelevelID;
    }

    public String getPricelevelName() {
        return pricelevelName;
    }

    public void setPricelevelName(String pricelevelName) {
        this.pricelevelName = pricelevelName;
    }
    
}
