package model;
public class Category 
{      
    private long categoryID;     
    private String categoryName;
    private String categorymt;
    private String categorymkw;
    private String categorymd;

    public Category(){
    }      
    public Category(long categoryID, String categoryName, String categorymt,String categorymkw,String categorymd ) 
    {         
        this.categoryID = categoryID;         
        this.categoryName = categoryName; 
        this.categorymt = categorymt;
        this.categorymkw = categorymkw;
        this.categorymd = categorymd;
    }      
    public long getCategoryID() 
    {         
        return categoryID;    
    }      
    public void setCategoryID(long categoryID) 
    {         
        this.categoryID = categoryID;    
    }     
    public String getCategoryName()
    {         
        return categoryName;    
    }      
    public void setCategoryName(String categoryName) 
    {         
        this.categoryName = categoryName;     
    }  

    /**
     * @return the categorymt
     */
    public String getCategorymt() {
        return categorymt;
    }

    /**
     * @param categorymt the categorymt to set
     */
    public void setCategorymt(String categorymt) {
        this.categorymt = categorymt;
    }

    /**
     * @return the categorymkw
     */
    public String getCategorymkw() {
        return categorymkw;
    }

    /**
     * @param categorymkw the categorymkw to set
     */
    public void setCategorymkw(String categorymkw) {
        this.categorymkw = categorymkw;
    }

    /**
     * @return the categorymd
     */
    public String getCategorymd() {
        return categorymd;
    }

    /**
     * @param categorymd the categorymd to set
     */
    public void setCategorymd(String categorymd) {
        this.categorymd = categorymd;
    }
} 