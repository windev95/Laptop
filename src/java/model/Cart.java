package model;
import java.util.HashMap;
import java.util.Map;
public class Cart { 
    private HashMap<Long, Item> cartItems; 
    public Cart() {
        cartItems = new HashMap<>();
    }
    public Cart(HashMap<Long, Item> cartItems) {
        this.cartItems = cartItems;
    }
    public HashMap<Long, Item> getCartItems() {
        return cartItems;
    }
    public void setCartItems(HashMap<Long, Item> cartItems) {
        this.cartItems = cartItems;
    }  
    
    //insert to cart
    public void plusToCart(Long key, Item item) {
       boolean bln = cartItems.containsKey(key);
       if (bln) {
            int quantity_old = item.getQuantity();
            item.setQuantity(quantity_old + 1);
            cartItems.put(item.getProduct().getProductID(), item);
       } else {
            cartItems.put(item.getProduct().getProductID(), item);
       }
    }
    // sub to cart
    public void subToCart(Long key, Item item) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            int quantity_old = item.getQuantity();
            if (quantity_old <= 1) {
                cartItems.remove(key);
            } else {
                item.setQuantity(quantity_old - 1);
                cartItems.put(key, item);
            }
        }
    }
    //remove to cart
    public void removeToCart(Long product) {
        boolean bln = cartItems.containsKey(product);
        if (bln) {
            cartItems.remove(product);
        }
    } 
    //remove all to cart
    public void removeAll() {
        cartItems = new HashMap<>();
    } 
    //count item
    public int countItem() {
        int count = 0;
        count = cartItems.size();
        return count;
    }
    //sum total
    public int total() {
        int count = 0;
        for (Map.Entry<Long, Item> list : cartItems.entrySet()) {
            count += list.getValue().getProduct().getProductPriceReal() * list.getValue().getQuantity();
        }
        return count;
    }
}
