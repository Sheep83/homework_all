package brag;
import java.util.*;

public class Game {
  public ArrayList<Player> players;

  public Game(){

  }

  public void createPlayers(){
    Player player1 = new Player("Brian");
    Player player2 = new Player("Josh");

  }

  public static void main(String[] args){
          Deck deck = new Deck();

          //print out the deck.
          System.out.println(deck.getDeck());
      }
}