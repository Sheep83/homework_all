import java.util.*;

public class Cat{
  private String name;
  private ArrayList<Edible> belly;

  public Cat(String name){
    this.name = name;
    this.belly = new ArrayList<Edible>();
  }

  public String getName(){
    return this.name;
  }

  public void eat(Edible food){
    belly.add(food);
  }

  public int foodEaten(){
    return belly.size();

  }

  public String goMental(){
    return "Wheeeeeeee!";
  }

  public void spew(){
    belly.clear();
  }

  ////java array.pop hack
  public Edible miniSpew(){
    return belly.remove(belly.size()-1);
  }

  public String snort(Catnip catnip){
    return this.goMental();
  }

}
