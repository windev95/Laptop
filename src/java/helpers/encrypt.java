package helpers;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
public class encrypt {
    public static String hashmd5(String inputa, String inputb) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest((inputa + inputb).getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }               
    }
    public static void main(String[] args) throws Exception {
        System.out.println("Kết quả đã mã hóa: " + hashmd5("demo@gmail.com", "demo"));
    }
    
}
