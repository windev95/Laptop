package model;
public class Screensize {
    private long screensizeID;
    private String screensizeName;

    public Screensize() {
    }

    public Screensize(long screensizeID, String screensizeName) {
        this.screensizeID = screensizeID;
        this.screensizeName = screensizeName;
    }

    public long getScreensizeID() {
        return screensizeID;
    }

    public void setScreensizeID(long screensizeID) {
        this.screensizeID = screensizeID;
    }

    public String getScreensizeName() {
        return screensizeName;
    }

    public void setScreensizeName(String screensizeName) {
        this.screensizeName = screensizeName;
    }
    
}
