public class Player{
// private variable to store and return single instance of player class
  private static Player player;
// private constructor to restrict instantiation from outwith the class
  private Player(){
  }
  public void greet(){
    System.out.println("Player created");
  }

  //public method to create or return existing instance of class
  public static Player getInstance(){
    if(player == null){
      player = new Player();
    }
    return player;
  }

}
// existing player instance is returned if it exists. if not, new instance is created and returned.
