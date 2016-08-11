package brag;
import java.util.*;

public class Deck {
    ArrayList<Card> cards = new ArrayList<Card>();

    String[] values = {"A","2","3","4","5","6","7","8","9","10","J","Q","K"};
    String[] suit = {"Club", "Spade", "Diamond", "Heart"};

    static boolean firstThread = true;
    public Deck(){
        for (int i = 0; i<suit.length; i++) {
            for(int j=0; j<values.length; j++){
                this.cards.add(new Card(suit[i],values[j]));
            }
        }
        //shuffle 
        Collections.shuffle(this.cards);

    }

    public ArrayList<Card> getDeck(){
        return cards;
    }

    public void dealCard (){
      this.cards.remove(0);
      System.out.println(this.cards.size());
    }

    // public static void main(String[] args){
    //     Deck deck = new Deck();

    //     //print out the deck.
    //     System.out.println(deck.getDeck());
    // }

}