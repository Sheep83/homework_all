package brag;
import java.util.*;

public class Game {
  public ArrayList<Player> players;
  private Player player1;
  private Player player2;

  public Game(){

  }

  public void getPlayer1Name(){
    System.out.println(player1.name);
  }

  public void getPlayer2Name(){
    System.out.println(player2.name);
  }

  public void createPlayers(){
    player1 = new Player("Brian");
    player2 = new Player("Josh");
  }

  }

  
