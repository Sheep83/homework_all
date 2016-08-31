package shopping_basket;
import shopping_basket.*;
import java.util.*;


public class Basket {

    public ArrayList<Item> mContents;
    public Double mTotal;
    

    public Basket () {
        mTotal = null;
        mContents = new ArrayList<Item>();

    }


    public int getSize(){
        return this.mContents.size();
    }

}