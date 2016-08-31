package shopping_basket;
import shopping_basket.*;
import java.util.*;
import java.math.BigDecimal;


public class Checkout {

  public Customer customer;

  public Checkout (Customer customer){
    this.customer = customer;
  }

  public Double bogof(){
    Double subTotal = 0.0;
    Set<Item> itemsSet = new HashSet<Item>(customer.basket.mContents);
    for (Item item : itemsSet){
      int count = Collections.frequency(customer.basket.mContents, item);
      System.out.println("count: " + count);
      if (count > 1 && item.getBogof() == true){
        Double numberOfBogof = Math.floor(count/2); 
        subTotal += (numberOfBogof * item.getPrice());
        int remainder = count % 2;
        subTotal += (remainder * item.getPrice());
      }else{
        subTotal += (item.getPrice() * count);
      }
    }
    return subTotal;
  }

  public Double applyDiscount(){
    Double newTotal = null;
    Double afterBogof = this.bogof();
    if(afterBogof > 20){
      newTotal = afterBogof -= (afterBogof * 0.1);
      return newTotal;
    }else{
      return this.bogof();
    }
  }

  public Double allDiscount(){
    Double newTotal = null;
    Double afterDiscount = this.applyDiscount();
    if(customer.getCard() == true){
     newTotal = afterDiscount * 0.98; 
    }else{
      newTotal = this.applyDiscount();
    }
    return newTotal;
  }

}




