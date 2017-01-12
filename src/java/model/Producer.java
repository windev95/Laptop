package model;
public class Producer {
    private long producerID;         
    private String producerName;   
    private String producerImageBrand;
    private String producerLink;

    public Producer() {
    }
    public Producer(String producerName, String producerImageBrand, String producerLink) {
        this.producerName = producerName;
        this.producerImageBrand = producerImageBrand;
        this.producerLink = producerLink;
    }
    public Producer(long producerID, String producerName, String producerImageBrand, String producerLink) {
        this.producerID = producerID;
        this.producerName = producerName;
        this.producerImageBrand = producerImageBrand;
        this.producerLink = producerLink;
    }

    public long getProducerID() {
        return producerID;
    }

    public void setProducerID(long producerID) {
        this.producerID = producerID;
    }

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    public String getProducerImageBrand() {
        return producerImageBrand;
    }

    public void setProducerImageBrand(String producerImageBrand) {
        this.producerImageBrand = producerImageBrand;
    }

    public String getProducerLink() {
        return producerLink;
    }

    public void setProducerLink(String producerLink) {
        this.producerLink = producerLink;
    }
    
    
}
