import static org.junit.Assert.*;
import org.junit.*;

public class CatTest{
  Cat cat;
  CatFood catfood;
  Fish fish;
  Catnip catnip;



  @Before
  public void before() {
    cat = new Cat("Theo");
    catfood = new CatFood();
    fish = new Fish();
    catnip = new Catnip();

  }

  @Test
  public void hasAName(){
    assertEquals("Theo", cat.getName());
  }

  @Test
  public void canEatCatFood(){
    cat.eat(catfood);
    assertEquals(1, cat.foodEaten());
  }

  @Test
  public void canEatFish(){
    cat.eat(fish);
    assertEquals(1, cat.foodEaten());
  }

  @Test
  public void canGoMental(){
    assertEquals("Wheeeeeeee!", cat.goMental());
  }

  @Test
  public void spewEmptiesBelly(){
    cat.eat(fish);
    cat.eat(catfood);
    cat.spew();
    assertEquals(0, cat.foodEaten());
  }


  @Test
  public void canThrowUpOnlyLastItemEaten(){
    cat.eat(fish);
    cat.eat(catfood);
    CatFood thrownUp = (CatFood)cat.miniSpew();
    assertEquals(thrownUp.getClass().getSimpleName(), "CatFood");
    assertEquals(1, cat.foodEaten());
  }

  @Test
  public void canTakeCatnip(){
    assertEquals("Wheeeeeeee!", cat.snort(catnip));
  }

}

