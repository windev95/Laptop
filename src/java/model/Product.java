package model;
import java.sql.Timestamp;
public class Product {
    private long productID;         
    private String productName;   
    private String productImage; 
    private String productColor;
    private String productContent;
    private String productMetaTitle;
    private String productMetaKeywords;
    private String productMetaDescription;
    private String productCpuDetail;
    private String productRamDetail;
    private String productStorageDetail;
    private String productScreen;
    private String productScreenDetail;
    private String productVGA;
    private String productSound;
    private String productDVD;
    private String productConnect;
    private String productLAN;
    private String productWifi;
    private String productWireless;
    private String productCardReader;
    private String productWebcam;
    private String productPin;
    private String productOS;
    private String productSize;
    private String productWeight;
    private String productMaterial;
    private int productPrice;
    private int productSale;
    private int productPriceReal;    
    private Timestamp productUpdate;
    private int productBuys;
    private int productInventory;
    private int productHide;   
    private long cpuID;
    private long ramID;
    private long storageID;
    private long pricelevelID;
    private long screensizeID;
    private long categoryID;
    private long producerID;  
    public Product() {
    }
    public Product(long productID,String productContent,String productName, String productImage, String productColor, String productCpuDetail, String productRamDetail, String productStorageDetail,String productScreen, String productScreenDetail, String productVGA, String productSound, String productDVD, String productConnect, String productLAN, String productWifi, String productWireless, String productCardReader, String productWebcam, String productPin, String productOS, String productSize, String productWeight, String productMaterial, int productPrice, int productSale, int productPriceReal, Timestamp productUpdate, int productInventory, int productHide,long cpuid,long ramid,long storageid,long pricelevelid,long screensizeid,long categoryid,long producerid) {
        this.productID = productID;
        this.productName = productName;
        this.productImage = productImage;
        this.productColor = productColor;
        this.productContent = productContent;
        this.productCpuDetail = productCpuDetail;
        this.productRamDetail = productRamDetail;
        this.productStorageDetail = productStorageDetail;
        this.productScreen = productScreen;
        this.productScreenDetail = productScreenDetail;
        this.productVGA = productVGA;
        this.productSound = productSound;
        this.productDVD = productDVD;
        this.productConnect = productConnect;
        this.productLAN = productLAN;
        this.productWifi = productWifi;
        this.productWireless = productWireless;
        this.productCardReader = productCardReader;
        this.productWebcam = productWebcam;
        this.productPin = productPin;
        this.productOS = productOS;
        this.productSize = productSize;
        this.productWeight = productWeight;
        this.productMaterial = productMaterial;
        this.productPrice = productPrice;
        this.productSale = productSale;
        this.productPriceReal = productPriceReal;
        this.productUpdate = productUpdate;
        this.productInventory = productInventory;
        this.productHide = productHide;
        this.cpuID = cpuid;
        this.ramID = ramid;
        this.storageID = storageid;
        this.pricelevelID = pricelevelid;
        this.screensizeID = screensizeid;
        this.categoryID = categoryid;
        this.producerID = producerid;
    }
    public Product(String productContent,String productName, String productImage, String productColor, String productCpuDetail, String productRamDetail, String productStorageDetail,String productScreen, String productScreenDetail, String productVGA, String productSound, String productDVD, String productConnect, String productLAN, String productWifi, String productWireless, String productCardReader, String productWebcam, String productPin, String productOS, String productSize, String productWeight, String productMaterial, int productPrice, int productSale, int productPriceReal, Timestamp productUpdate, int productInventory, int productHide,long cpuid,long ramid,long storageid,long pricelevelid,long screensizeid,long categoryid,long producerid) {
        this.productName = productName;
        this.productImage = productImage;
        this.productColor = productColor;
        this.productContent = productContent;
        this.productCpuDetail = productCpuDetail;
        this.productRamDetail = productRamDetail;
        this.productStorageDetail = productStorageDetail;
        this.productScreen = productScreen;
        this.productScreenDetail = productScreenDetail;
        this.productVGA = productVGA;
        this.productSound = productSound;
        this.productDVD = productDVD;
        this.productConnect = productConnect;
        this.productLAN = productLAN;
        this.productWifi = productWifi;
        this.productWireless = productWireless;
        this.productCardReader = productCardReader;
        this.productWebcam = productWebcam;
        this.productPin = productPin;
        this.productOS = productOS;
        this.productSize = productSize;
        this.productWeight = productWeight;
        this.productMaterial = productMaterial;
        this.productPrice = productPrice;
        this.productSale = productSale;
        this.productPriceReal = productPriceReal;
        this.productUpdate = productUpdate;
        this.productInventory = productInventory;
        this.productHide = productHide;
        this.cpuID = cpuid;
        this.ramID = ramid;
        this.storageID = storageid;
        this.pricelevelID = pricelevelid;
        this.screensizeID = screensizeid;
        this.categoryID = categoryid;
        this.producerID = producerid;
    }
    public Product(long productID, String productName, String productImage, String productColor, String productContent, String productMetaTitle, String productMetaKeywords, String productMetaDescription, String productCpuDetail, String productRamDetail, String productStorageDetail,String productScreen, String productScreenDetail, String productVGA, String productSound, String productDVD, String productConnect, String productLAN, String productWifi, String productWireless, String productCardReader, String productWebcam, String productPin, String productOS, String productSize, String productWeight, String productMaterial, int productPrice, int productSale, int productPriceReal, Timestamp productUpdate, int productBuys, int productInventory, int productHide,long cpuid,long ramid,long storageid,long pricelevelid,long screensizeid,long categoryid,long producerid) {
        this.productID = productID;
        this.productName = productName;
        this.productImage = productImage;
        this.productColor = productColor;
        this.productContent = productContent;
        this.productMetaTitle = productMetaTitle;
        this.productMetaKeywords = productMetaKeywords;
        this.productMetaDescription = productMetaDescription;
        this.productCpuDetail = productCpuDetail;
        this.productRamDetail = productRamDetail;
        this.productStorageDetail = productStorageDetail;
        this.productScreen = productScreen;
        this.productScreenDetail = productScreenDetail;
        this.productVGA = productVGA;
        this.productSound = productSound;
        this.productDVD = productDVD;
        this.productConnect = productConnect;
        this.productLAN = productLAN;
        this.productWifi = productWifi;
        this.productWireless = productWireless;
        this.productCardReader = productCardReader;
        this.productWebcam = productWebcam;
        this.productPin = productPin;
        this.productOS = productOS;
        this.productSize = productSize;
        this.productWeight = productWeight;
        this.productMaterial = productMaterial;
        this.productPrice = productPrice;
        this.productSale = productSale;
        this.productPriceReal = productPriceReal;
        this.productUpdate = productUpdate;
        this.productBuys = productBuys;
        this.productInventory = productInventory;
        this.productHide = productHide;
        this.cpuID = cpuid;
        this.ramID = ramid;
        this.storageID = storageid;
        this.pricelevelID = pricelevelid;
        this.screensizeID = screensizeid;
        this.categoryID = categoryid;
        this.producerID = producerid;
    }
    public long getProductID() {
        return productID;
    }
    public void setProductID(long productID) {
        this.productID = productID;
    }
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public String getProductImage() {
        return productImage;
    }
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
    public String getProductColor() {
        return productColor;
    }
    public void setProductColor(String productColor) {
        this.productColor = productColor;
    }
    public String getProductContent() {
        return productContent;
    }
    public void setProductContent(String productContent) {
        this.productContent = productContent;
    }
    public String getProductMetaTitle() {
        return productMetaTitle;
    }
    public void setProductMetaTitle(String productMetaTitle) {
        this.productMetaTitle = productMetaTitle;
    }
    public String getProductMetaKeywords() {
        return productMetaKeywords;
    }
    public void setProductMetaKeywords(String productMetaKeywords) {
        this.productMetaKeywords = productMetaKeywords;
    }
    public String getProductMetaDescription() {
        return productMetaDescription;
    }
    public void setProductMetaDescription(String productMetaDescription) {
        this.productMetaDescription = productMetaDescription;
    }
    public String getProductCpuDetail() {
        return productCpuDetail;
    }
    public void setProductCpuDetail(String productCpuDetail) {
        this.productCpuDetail = productCpuDetail;
    }
    public String getProductRamDetail() {
        return productRamDetail;
    }
    public void setProductRamDetail(String productRamDetail) {
        this.productRamDetail = productRamDetail;
    }
    public String getProductStorageDetail() {
        return productStorageDetail;
    }
    public void setProductStorageDetail(String productStorageDetail) {
        this.productStorageDetail = productStorageDetail;
    }
    public String getProductScreen() {
        return productScreen;
    }
    public void setProductScreen(String productScreen) {
        this.productScreen = productScreen;
    }
    public String getProductScreenDetail() {
        return productScreenDetail;
    }
    public void setProductScreenDetail(String productScreenDetail) {
        this.productScreenDetail = productScreenDetail;
    }
    public String getProductVGA() {
        return productVGA;
    }
    public void setProductVGA(String productVGA) {
        this.productVGA = productVGA;
    }
    public String getProductSound() {
        return productSound;
    }
    public void setProductSound(String productSound) {
        this.productSound = productSound;
    }
    public String getProductDVD() {
        return productDVD;
    }
    public void setProductDVD(String productDVD) {
        this.productDVD = productDVD;
    }
    public String getProductConnect() {
        return productConnect;
    }
    public void setProductConnect(String productConnect) {
        this.productConnect = productConnect;
    }
    public String getProductLAN() {
        return productLAN;
    }
    public void setProductLAN(String productLAN) {
        this.productLAN = productLAN;
    }
    public String getProductWifi() {
        return productWifi;
    }
    public void setProductWifi(String productWifi) {
        this.productWifi = productWifi;
    }
    public String getProductWireless() {
        return productWireless;
    }
    public void setProductWireless(String productWireless) {
        this.productWireless = productWireless;
    }
    public String getProductCardReader() {
        return productCardReader;
    }
    public void setProductCardReader(String productCardReader) {
        this.productCardReader = productCardReader;
    }
    public String getProductWebcam() {
        return productWebcam;
    }
    public void setProductWebcam(String productWebcam) {
        this.productWebcam = productWebcam;
    }
    public String getProductPin() {
        return productPin;
    }
    public void setProductPin(String productPin) {
        this.productPin = productPin;
    }
    public String getProductOS() {
        return productOS;
    }
    public void setProductOS(String productOS) {
        this.productOS = productOS;
    }
    public String getProductSize() {
        return productSize;
    }
    public void setProductSize(String productSize) {
        this.productSize = productSize;
    }
    public String getProductWeight() {
        return productWeight;
    }
    public void setProductWeight(String productWeight) {
        this.productWeight = productWeight;
    }
    public String getProductMaterial() {
        return productMaterial;
    }
    public void setProductMaterial(String productMaterial) {
        this.productMaterial = productMaterial;
    }
    public int getProductPrice() {
        return productPrice;
    }
    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }
    public int getProductSale() {
        return productSale;
    }
    public void setProductSale(int productSale) {
        this.productSale = productSale;
    }
    public int getProductPriceReal() {
        return productPriceReal;
    }
    public void setProductPriceReal(int productPriceReal) {
        this.productPriceReal = productPriceReal;
    }
    public Timestamp getProductUpdate() {
        return productUpdate;
    }
    public void setProductUpdate(Timestamp productUpdate) {
        this.productUpdate = productUpdate;
    }
    public int getProductBuys() {
        return productBuys;
    }
    public void setProductBuys(int productBuys) {
        this.productBuys = productBuys;
    }
    public int getProductInventory() {
        return productInventory;
    }
    public void setProductInventory(int productInventory) {
        this.productInventory = productInventory;
    }
    public int getProductHide() {
        return productHide;
    }
    public void setProductHide(int productHide) {
        this.productHide = productHide;
    }
    public long getCpuID() {
        return cpuID;
    }
    public void setCpuID(long cpuID) {
        this.cpuID = cpuID;
    }
    public long getRamID() {
        return ramID;
    }
    public void setRamID(long ramID) {
        this.ramID = ramID;
    }
    public long getStorageID() {
        return storageID;
    }
    public void setStorageID(long storageID) {
        this.storageID = storageID;
    }
    public long getPricelevelID() {
        return pricelevelID;
    }
    public void setPricelevelID(long pricelevelID) {
        this.pricelevelID = pricelevelID;
    }
    public long getScreensizeID() {
        return screensizeID;
    }
    public void setScreensizeID(long screensizeID) {
        this.screensizeID = screensizeID;
    }
    public long getCategoryID() {
        return categoryID;
    }
    public void setCategoryID(long categoryID) {
        this.categoryID = categoryID;
    }
    public long getProducerID() {
        return producerID;
    }
    public void setProducerID(long producerID) {
        this.producerID = producerID;
    }
}

//package model; 
//public class Product 
//{    
//    private long productID;   
//    private long categoryID;  
//    private String productName;   
//    private String productImage;    
//    private double productPrice;   
//    private String productDescription;
//    public Product(){
//    }
//    public Product(long productID, String productName, String productImage, double productPrice, String productDescription) {
//        this.productID = productID;
//        this.productName = productName;
//        this.productImage = productImage;
//        this.productPrice = productPrice;
//        this.productDescription = productDescription;
//    }
//    public long getProductID() {
//        return productID;
//    }
//    public void setProductID(long productID) {
//        this.productID = productID;
//    }
//    public long getCategoryID() {
//        return categoryID;
//    }
//    public void setCategoryID(long categoryID) {
//        this.categoryID = categoryID;
//    }
//    public String getProductName() {
//        return productName;
//    }
//    public void setProductName(String productName) {
//        this.productName = productName;
//    }
//    public String getProductImage() {
//        return productImage;
//    }
//    public void setProductImage(String productImage) {
//        this.productImage = productImage;
//    }
//    public double getProductPrice() {
//        return productPrice;
//    }
//    public void setProductPrice(double productPrice) {
//        this.productPrice = productPrice;
//    }
//    public String getProductDescription() {
//        return productDescription;
//    }
//    public void setProductDescription(String productDescription) {
//        this.productDescription = productDescription;
//    }    
//}  