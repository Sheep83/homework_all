import brag.*;
import java.util.*;

public class Runner{
  public static void main(String[] args){
          Game game = new Game();
          Deck deck = new Deck();
          game.createPlayers();
          game.getPlayer1Name();
          game.getPlayer2Name();


          //print out the deck.
          System.out.println(deck.getDeck());
      }
    
}