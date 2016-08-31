package shopping_basket;
import shopping_basket.*;
import java.util.*;


public class Customer {

  public String name;
  public Boolean card;
  public Basket basket;
  // public Store store;

  public Customer (String name, Boolean card, Basket basket){
    this.name = name;
    this.card = card;
    this.basket = basket;
  }

  public void addItem (Item item){
    basket.mContents.add(item);
  }

  public void removeItem(Item item){
    for (int i=0; i<this.basket.getSize(); i++){
      if (item.getName() == this.basket.mContents.get(i).getName()){
        basket.mContents.remove(item);
      }
    }
  }

  public String getName(){
    return this.name;
  }

  public Boolean getCard(){
    return this.card;
  }

  public int getBasketSize(){
    return basket.mContents.size();
  }


}
