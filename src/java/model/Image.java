package model;
public class Image {
    private long imageID;
    private String imageAlt;
    private String imageImage;
    private long productID;  
    public Image() {
    }
    public Image(String imageAlt, String imageImage, Long productID) {
        this.imageAlt = imageAlt;
        this.imageImage = imageImage;
        this.productID = productID;
    }
    public Image(long imageID, String imageAlt, String imageImage , Long productID) {
        this.imageID = imageID;
        this.imageAlt = imageAlt;
        this.imageImage = imageImage;
        this.productID = productID;
    }
    public long getImageID() {
        return imageID;
    }
    public void setImageID(long imageID) {
        this.imageID = imageID;
    }
    public String getImageAlt() {
        return imageAlt;
    }
    public void setImageAlt(String imageAlt) {
        this.imageAlt = imageAlt;
    }
    public String getImageImage() {
        return imageImage;
    }
    public void setImageImage(String imageImage) {
        this.imageImage = imageImage;
    }
    public long getProductID() {
        return productID;
    }
    public void setProductID(long productID) {
        this.productID = productID;
    }        
}
