package shopping_basket;
import shopping_basket.*;
import java.util.*;



public class Item {

    public String name;
    public int price;
    public Boolean bogof;
    

    public Item (String name, int price, Boolean bogof) {
        this.name = name;
        this.price = price;
        this.bogof = bogof;

    }

    public String getName(){
      return this.name;
    }

    public int getPrice(){
      return this.price;
    }

    public Boolean getBogof(){
      return this.bogof;
    }

  }