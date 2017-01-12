package helpers;
import java.text.DecimalFormat;
public class MoneyFormat {
    public static String format(int money) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");            
        return formatter.format(money) + "₫";
    }
    
    public static void main(String[] args) throws Exception {
        
        System.out.println("Kết quả định dạng: " + format(1000000000));
    }
    
}
