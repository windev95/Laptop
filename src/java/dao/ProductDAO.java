package dao; 
import connect.DBConnect; 
import java.sql.Connection;
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product; 
public class ProductDAO 
{     
    // get danh sách sản phẩm dựa vào mã danh mục    
    public ArrayList<Product> getListProductByCategory(long category_id)  throws SQLException {     
        Connection connection = DBConnect.getConnecttion();      
        String sql = "SELECT * FROM product WHERE `product_hide` = 0 and category_id = '" + category_id + "'";      
        PreparedStatement ps = connection.prepareCall(sql);       
        ResultSet rs = ps.executeQuery();       
        ArrayList<Product> list = new ArrayList<>();       
        while (rs.next()) { 
            Product product = new Product();       
            product.setProductID(rs.getLong("product_id"));     
            product.setProductName(rs.getString("product_name"));    
            product.setProductImage(rs.getString("product_image")); 
            product.setProductPrice(rs.getInt("product_price")); 
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real"));
            product.setProductContent(rs.getString("product_content"));      
            list.add(product);         
        }         
        return list;     
    }  
    // get danh sách sản phẩm dựa vào mã nhà sản xuất
    public ArrayList<Product> getListProductByProducer(long producer_id)  throws SQLException {     
        Connection connection = DBConnect.getConnecttion();      
        String sql = "SELECT * FROM product WHERE `product_hide` = 0 and producer_id = '" + producer_id + "'";      
        PreparedStatement ps = connection.prepareCall(sql);       
        ResultSet rs = ps.executeQuery();       
        ArrayList<Product> list = new ArrayList<>();       
        while (rs.next()) { 
            Product product = new Product();       
            product.setProductID(rs.getLong("product_id"));     
            product.setProductName(rs.getString("product_name"));    
            product.setProductImage(rs.getString("product_image")); 
            product.setProductPrice(rs.getInt("product_price")); 
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real"));
            product.setProductContent(rs.getString("product_content"));      
            list.add(product);         
        }         
        return list;     
    }  
    // get danh sách sản phẩm dựa vào tìm kiếm nâng cao
    public ArrayList<Product> getListProductByAdvanceSearchNav(String categoryID,String producerID, String pricelevelID, String screensizeID, String cpuID, String ramID, String storageID, int firstResult,int maxResult)  throws SQLException {     
        Connection connection = DBConnect.getConnecttion();      
        String sql = "SELECT * FROM product WHERE `product_hide` = 0 and `category_id` LIKE '%" + categoryID + "%' and `producer_id` LIKE '%" + producerID + "%' and `pricelevel_id` LIKE '%" + pricelevelID + "%' and `screensize_id` LIKE '%" + screensizeID + "%' and `cpu_id` LIKE '%" + cpuID + "%' and `ram_id` LIKE '%" + ramID + "%' and `storage_id` LIKE '%" + storageID + "%' limit ?,?";      
        PreparedStatement ps = connection.prepareCall(sql);  
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();       
        ArrayList<Product> list = new ArrayList<>();       
        while (rs.next()) { 
            Product product = new Product();       
            product.setProductID(rs.getLong("product_id")); 
            product.setProductName(rs.getString("product_name"));    
            product.setProductImage(rs.getString("product_image")); 
            product.setProductPrice(rs.getInt("product_price"));   
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real"));
            product.setProductContent(rs.getString("product_content")); 
            product.setProductCpuDetail(rs.getString("product_cpudetail")); 
            product.setProductVGA(rs.getString("product_vga")); 
            product.setCpuID(rs.getLong("cpu_id"));
            product.setRamID(rs.getLong("ram_id"));
            product.setStorageID(rs.getLong("storage_id"));    
            list.add(product);         
        }         
        return list;     
    }
    // Tính tổng sản phẩm tìm kiếm nâng cao
    public int countProductByAdvanceSearch(String categoryID, String producerID, String pricelevelID, String screensizeID, String cpuID, String ramID, String storageID) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(product_id) FROM product WHERE `product_hide` = 0 and `category_id` LIKE '%" + categoryID + "%' and `producer_id` LIKE '%" + producerID + "%' and `pricelevel_id` LIKE '%" + pricelevelID + "%' and `screensize_id` LIKE '%" + screensizeID + "%' and `cpu_id` LIKE '%" + cpuID + "%' and `ram_id` LIKE '%" + ramID + "%' and `storage_id` LIKE '%" + storageID + "%'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
    public ArrayList<Product> getListProduct()  throws SQLException {     
        Connection connection = DBConnect.getConnecttion();      
        String sql = "SELECT * FROM product";      
        PreparedStatement ps = connection.prepareCall(sql);       
        ResultSet rs = ps.executeQuery();       
        ArrayList<Product> list = new ArrayList<>();       
        while (rs.next()) { 
            Product product = new Product();       
            product.setProductID(rs.getLong("product_id"));            
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductColor(rs.getString("product_color"));
            product.setProductContent(rs.getString("product_content"));
            product.setProductMetaTitle(rs.getString("product_metatitle"));
            product.setProductMetaKeywords(rs.getString("product_metakeywords"));
            product.setProductMetaDescription(rs.getString("product_metadescription"));
            product.setProductCpuDetail(rs.getString("product_cpudetail")); 
            product.setProductRamDetail(rs.getString("product_ramdetail")); 
            product.setProductStorageDetail(rs.getString("product_storagedetail")); 
            product.setProductScreen(rs.getString("product_screen")); 
            product.setProductScreenDetail(rs.getString("product_screendetail")); 
            product.setProductVGA(rs.getString("product_vga")); 
            product.setProductSound(rs.getString("product_sound")); 
            product.setProductDVD(rs.getString("product_dvd")); 
            product.setProductConnect(rs.getString("product_connect")); 
            product.setProductLAN(rs.getString("product_lan")); 
            product.setProductWifi(rs.getString("product_wifi")); 
            product.setProductWireless(rs.getString("product_wireless")); 
            product.setProductCardReader(rs.getString("product_cardreader")); 
            product.setProductWebcam(rs.getString("product_webcam")); 
            product.setProductPin(rs.getString("product_pin")); 
            product.setProductOS(rs.getString("product_os")); 
            product.setProductSize(rs.getString("product_size")); 
            product.setProductWeight(rs.getString("product_weight")); 
            product.setProductMaterial(rs.getString("product_material")); 
            product.setProductPrice(rs.getInt("product_price")); 
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real")); 
            product.setProductUpdate(rs.getTimestamp("product_update")); 
            product.setProductBuys(rs.getInt("product_buys")); 
            product.setProductInventory(rs.getInt("product_inventory")); 
            product.setProductHide(rs.getInt("product_hide"));           
            product.setProductPrice(rs.getInt("product_price"));
            product.setCpuID(rs.getLong("cpu_id"));
            product.setRamID(rs.getLong("ram_id"));
            product.setStorageID(rs.getLong("storage_id"));
            product.setPricelevelID(rs.getLong("pricelevel_id"));
            product.setScreensizeID(rs.getLong("screensize_id"));
            product.setCategoryID(rs.getLong("category_id"));
            product.setProducerID(rs.getLong("producer_id"));      
            list.add(product);         
        }         
        return list;     
    }
    // get danh sách tất cả sản phẩm
    public ArrayList<Product> getListAllProduct()  throws SQLException {     
        Connection connection = DBConnect.getConnecttion();      
        String sql = "SELECT * FROM product WHERE `product_hide` = 0";      
        PreparedStatement ps = connection.prepareCall(sql);       
        ResultSet rs = ps.executeQuery();       
        ArrayList<Product> list = new ArrayList<>();       
        while (rs.next()) { 
            Product product = new Product();       
            product.setProductID(rs.getLong("product_id")); 
            product.setProductName(rs.getString("product_name"));    
            product.setProductImage(rs.getString("product_image")); 
            product.setProductPrice(rs.getInt("product_price"));  
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real")); 
            product.setProductContent(rs.getString("product_content"));      
            list.add(product);         
        }         
        return list;     
    }  
    // get danh sách 6 sản phẩm nổi bật
    public ArrayList<Product> getListProductNoibat()  throws SQLException {     
        Connection connection = DBConnect.getConnecttion();      
        String sql = "SELECT * FROM product WHERE `product_hide` = 0 ORDER BY `product_buys` DESC LIMIT 6";      
        PreparedStatement ps = connection.prepareCall(sql);       
        ResultSet rs = ps.executeQuery();       
        ArrayList<Product> list = new ArrayList<>();       
        while (rs.next()) { 
            Product product = new Product();       
            product.setProductID(rs.getLong("product_id")); 
            product.setProductName(rs.getString("product_name"));    
            product.setProductImage(rs.getString("product_image")); 
            product.setProductPrice(rs.getInt("product_price"));   
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real"));
            product.setProductContent(rs.getString("product_content"));      
            list.add(product);         
        }         
        return list;     
    }  
    // get danh sách 6 sản phẩm mới
    public ArrayList<Product> getListProductNew()  throws SQLException {     
        Connection connection = DBConnect.getConnecttion();      
        String sql = "SELECT * FROM product WHERE `product_hide` = 0 ORDER BY `product_update` DESC LIMIT 6";      
        PreparedStatement ps = connection.prepareCall(sql);       
        ResultSet rs = ps.executeQuery();       
        ArrayList<Product> list = new ArrayList<>();       
        while (rs.next()) { 
            Product product = new Product();       
            product.setProductID(rs.getLong("product_id")); 
            product.setProductName(rs.getString("product_name"));    
            product.setProductImage(rs.getString("product_image")); 
            product.setProductPrice(rs.getInt("product_price"));   
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real"));
            product.setProductContent(rs.getString("product_content"));      
            list.add(product);         
        }         
        return list;     
    } 
    // get danh sách 6 sản phẩm giá tốt
    public ArrayList<Product> getListProductPrice()  throws SQLException {     
        Connection connection = DBConnect.getConnecttion();      
        String sql = "SELECT * FROM product WHERE `product_hide` = 0 ORDER BY `product_price_real` ASC LIMIT 6";      
        PreparedStatement ps = connection.prepareCall(sql);       
        ResultSet rs = ps.executeQuery();       
        ArrayList<Product> list = new ArrayList<>();       
        while (rs.next()) { 
            Product product = new Product();       
            product.setProductID(rs.getLong("product_id")); 
            product.setProductName(rs.getString("product_name"));    
            product.setProductImage(rs.getString("product_image")); 
            product.setProductPrice(rs.getInt("product_price"));   
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real"));
            product.setProductContent(rs.getString("product_content"));      
            list.add(product);         
        }         
        return list;     
    } 
    // get danh sách 6 sản phẩm theo loại
    public ArrayList<Product> getListProductBuysByCategory(long category_id)  throws SQLException {     
        Connection connection = DBConnect.getConnecttion();      
        String sql = "SELECT * FROM product WHERE `product_hide` = 0 and category_id = '" + category_id + "' ORDER BY `product_buys` DESC LIMIT 6";      
        PreparedStatement ps = connection.prepareCall(sql);       
        ResultSet rs = ps.executeQuery();       
        ArrayList<Product> list = new ArrayList<>();       
        while (rs.next()) { 
            Product product = new Product();       
            product.setProductID(rs.getLong("product_id")); 
            product.setProductName(rs.getString("product_name"));    
            product.setProductImage(rs.getString("product_image")); 
            product.setProductPrice(rs.getInt("product_price"));   
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real"));
            product.setProductContent(rs.getString("product_content"));      
            list.add(product);         
        }         
        return list;     
    }
    public Product getProduct(long productID) throws SQLException 
    {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM product WHERE `product_hide` = 0 and product_id = '" + productID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Product product = new Product();
        while (rs.next()) 
        {
            product.setProductID(rs.getLong("product_id"));            
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductColor(rs.getString("product_color"));
            product.setProductContent(rs.getString("product_content"));
            product.setProductMetaTitle(rs.getString("product_metatitle"));
            product.setProductMetaKeywords(rs.getString("product_metakeywords"));
            product.setProductMetaDescription(rs.getString("product_metadescription"));
            product.setProductCpuDetail(rs.getString("product_cpudetail")); 
            product.setProductRamDetail(rs.getString("product_ramdetail")); 
            product.setProductStorageDetail(rs.getString("product_storagedetail")); 
            product.setProductScreen(rs.getString("product_screen")); 
            product.setProductScreenDetail(rs.getString("product_screendetail")); 
            product.setProductVGA(rs.getString("product_vga")); 
            product.setProductSound(rs.getString("product_sound")); 
            product.setProductDVD(rs.getString("product_dvd")); 
            product.setProductConnect(rs.getString("product_connect")); 
            product.setProductLAN(rs.getString("product_lan")); 
            product.setProductWifi(rs.getString("product_wifi")); 
            product.setProductWireless(rs.getString("product_wireless")); 
            product.setProductCardReader(rs.getString("product_cardreader")); 
            product.setProductWebcam(rs.getString("product_webcam")); 
            product.setProductPin(rs.getString("product_pin")); 
            product.setProductOS(rs.getString("product_os")); 
            product.setProductSize(rs.getString("product_size")); 
            product.setProductWeight(rs.getString("product_weight")); 
            product.setProductMaterial(rs.getString("product_material")); 
            product.setProductPrice(rs.getInt("product_price")); 
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real")); 
            product.setProductUpdate(rs.getTimestamp("product_update")); 
            product.setProductBuys(rs.getInt("product_buys")); 
            product.setProductInventory(rs.getInt("product_inventory")); 
            product.setProductHide(rs.getInt("product_hide"));           
            product.setProductPrice(rs.getInt("product_price"));
            product.setCpuID(rs.getLong("cpu_id"));
            product.setRamID(rs.getLong("ram_id"));
            product.setStorageID(rs.getLong("storage_id"));
            product.setPricelevelID(rs.getLong("pricelevel_id"));
            product.setScreensizeID(rs.getLong("screensize_id"));
            product.setCategoryID(rs.getLong("category_id"));
            product.setProducerID(rs.getLong("producer_id"));
        }
        return product;
    }
    public ArrayList<Product> getListProductByNav(long producerID, int firstResult,int maxResult) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql="SELECT * FROM product WHERE producer_id = '" + producerID + "' limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("product_id")); 
            product.setProductName(rs.getString("product_name"));    
            product.setProductImage(rs.getString("product_image")); 
            product.setProductPrice(rs.getInt("product_price"));   
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real"));
            product.setProductContent(rs.getString("product_content")); 
            product.setProductCpuDetail(rs.getString("product_cpudetail")); 
            product.setProductVGA(rs.getString("product_vga")); 
            product.setCpuID(rs.getLong("cpu_id"));
            product.setRamID(rs.getLong("ram_id"));
            product.setStorageID(rs.getLong("storage_id"));
            product.setProducerID(rs.getLong("producer_id"));
        list.add(product);
    }
    return list;
    }
    // Tính tổng sản phẩm
    public int countProductByProducer(long producerID) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(product_id) FROM product WHERE producer_id = '" + producerID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
    public ArrayList<Product> getallListProductByNav(int firstResult,int maxResult) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql="SELECT * FROM product limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("product_id")); 
            product.setProductName(rs.getString("product_name"));    
            product.setProductImage(rs.getString("product_image")); 
            product.setProductPrice(rs.getInt("product_price"));   
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real"));
            product.setProductContent(rs.getString("product_content")); 
            product.setProductCpuDetail(rs.getString("product_cpudetail")); 
            product.setProductVGA(rs.getString("product_vga")); 
            product.setCpuID(rs.getLong("cpu_id"));
            product.setRamID(rs.getLong("ram_id"));
            product.setStorageID(rs.getLong("storage_id"));
        list.add(product);
    }
    return list;
    }
    // Tính tổng sản phẩm
    public int countProduct() throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(product_id) FROM product";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
    //Tìm kiếm sản phẩm
    public ArrayList<Product> getListProductBySearchNav(String query, int firstResult,int maxResult) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql="SELECT * FROM product WHERE product_name LIKE '%" + query + "%' limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("product_id")); 
            product.setProductName(rs.getString("product_name"));    
            product.setProductImage(rs.getString("product_image")); 
            product.setProductPrice(rs.getInt("product_price"));   
            product.setProductSale(rs.getInt("product_sale")); 
            product.setProductPriceReal(rs.getInt("product_price_real"));
            product.setProductContent(rs.getString("product_content")); 
            product.setProductCpuDetail(rs.getString("product_cpudetail")); 
            product.setProductVGA(rs.getString("product_vga")); 
            product.setCpuID(rs.getLong("cpu_id"));
            product.setRamID(rs.getLong("ram_id"));
            product.setStorageID(rs.getLong("storage_id"));
        list.add(product);
    }
    return list;
    }
    // Tính tổng sản phẩm tìm kiếm
    public int countProductBySearch(String query) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(product_id) FROM product WHERE product_name LIKE '%" + query + "%'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
    //set giảm số lượng tồn kho
    public boolean minusProduct(int id, int gia) {
        Connection connection = DBConnect.getConnecttion();

        String sql = "INSERT INTO users VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, id);
            ps.setLong(2, gia);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean insert(Product p) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "call insertproduct(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);  
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getProductImage());
            ps.setString(3, p.getProductColor());
            ps.setString(4, p.getProductContent());
            ps.setString(5, p.getProductCpuDetail());
            ps.setString(6, p.getProductRamDetail());
            ps.setString(7, p.getProductStorageDetail());
            ps.setString(8, p.getProductScreen());
            ps.setString(9, p.getProductScreenDetail());
            ps.setString(10, p.getProductVGA());
            ps.setString(11, p.getProductSound());
            ps.setString(12, p.getProductDVD());
            ps.setString(13, p.getProductConnect());
            ps.setString(14, p.getProductLAN());
            ps.setString(15, p.getProductWifi());
            ps.setString(16, p.getProductWireless());
            ps.setString(17, p.getProductCardReader());
            ps.setString(18, p.getProductWebcam());
            ps.setString(19, p.getProductPin());
            ps.setString(20, p.getProductOS());
            ps.setString(21, p.getProductSize());
            ps.setString(22, p.getProductWeight());
            ps.setString(23, p.getProductMaterial());
            ps.setDouble(24, p.getProductPrice());
            ps.setInt(25, p.getProductSale());
            ps.setDouble(26, p.getProductPriceReal());
            ps.setTimestamp(27, p.getProductUpdate());
            ps.setInt(28, p.getProductInventory());
            ps.setInt(29, p.getProductHide());
            ps.setLong(30, p.getCpuID());
            ps.setLong(31, p.getRamID());
            ps.setLong(32, p.getStorageID());
            ps.setLong(33, p.getPricelevelID());
            ps.setLong(34, p.getScreensizeID());
            ps.setLong(35, p.getCategoryID());
            ps.setLong(36, p.getProducerID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    public boolean update(Product p) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE product SET product_content=?,product_name=?,product_image=?,product_color=?,product_cpudetail=?,product_ramdetail=?,product_storagedetail=?,product_screen=?,product_screendetail=?,product_vga=?,product_sound=?,product_dvd=?,product_connect=?,product_lan=?,product_wifi=?,product_wireless=?,product_cardreader=?,product_webcam=?,product_pin=?,product_os=?,product_size=?,product_weight=?,product_material=?,product_price=?,product_sale=?,product_price_real=?,product_update=?,product_inventory=?,product_hide=?,cpu_id=?,ram_id=?,storage_id=?,pricelevel_id=?,screensize_id=?,category_id=?,producer_id=? WHERE product_id=?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, p.getProductContent());
            ps.setString(2, p.getProductName());
            ps.setString(3, p.getProductImage());
            ps.setString(4, p.getProductColor());            
            ps.setString(5, p.getProductCpuDetail());
            ps.setString(6, p.getProductRamDetail());
            ps.setString(7, p.getProductStorageDetail());
            ps.setString(8, p.getProductScreen());
            ps.setString(9, p.getProductScreenDetail());
            ps.setString(10, p.getProductVGA());
            ps.setString(11, p.getProductSound());
            ps.setString(12, p.getProductDVD());
            ps.setString(13, p.getProductConnect());
            ps.setString(14, p.getProductLAN());
            ps.setString(15, p.getProductWifi());
            ps.setString(16, p.getProductWireless());
            ps.setString(17, p.getProductCardReader());
            ps.setString(18, p.getProductWebcam());
            ps.setString(19, p.getProductPin());
            ps.setString(20, p.getProductOS());
            ps.setString(21, p.getProductSize());
            ps.setString(22, p.getProductWeight());
            ps.setString(23, p.getProductMaterial());
            ps.setDouble(24, p.getProductPrice());
            ps.setInt(25, p.getProductSale());
            ps.setDouble(26, p.getProductPriceReal());
            ps.setTimestamp(27, p.getProductUpdate());
            ps.setInt(28, p.getProductInventory());
            ps.setInt(29, p.getProductHide());
            ps.setLong(30, p.getCpuID());
            ps.setLong(31, p.getRamID());
            ps.setLong(32, p.getStorageID());
            ps.setLong(33, p.getPricelevelID());
            ps.setLong(34, p.getScreensizeID());
            ps.setLong(35, p.getCategoryID());
            ps.setLong(36, p.getProducerID());
            ps.setLong(37, p.getProductID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    public boolean delete(long product_id) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "DELETE FROM product WHERE product_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, product_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    public Product getProducer(long producerID) {
    try {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM product WHERE product_id = ?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, producerID);
        ResultSet rs = ps.executeQuery();
        Product u = new Product();
        while (rs.next()) {
        u.setProductName(rs.getString("product_name"));
        }
    return u;
    } catch (SQLException ex) {
    
    }
    return null;
    }
    public static void main(String[] args) throws SQLException {
        ProductDAO dao = new ProductDAO(); 
        for (Product ds : dao.getListProductByNav(1, 1, 9)) 
        {           
            System.out.println(ds.getProductID() +" - " + ds.getProductName());         
        }
    } 
} 