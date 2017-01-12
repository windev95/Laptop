package model;
public class Storage {
    private long storageID;
    private String storageName;

    public Storage() {
    }

    public Storage(long storageID, String storageName) {
        this.storageID = storageID;
        this.storageName = storageName;
    }

    public long getStorageID() {
        return storageID;
    }

    public void setStorageID(long storageID) {
        this.storageID = storageID;
    }

    public String getStorageName() {
        return storageName;
    }

    public void setStorageName(String storageName) {
        this.storageName = storageName;
    }
    
}
