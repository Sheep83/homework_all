import static org.junit.Assert.*;
import org.junit.*;
import shopping_basket.*;

public class BasketTest {

  Customer customer;
  Basket basket;
  Item item1, item2;

  @Before
  public void before(){
    basket = new Basket();
    customer = new Customer("Brian", false, basket);
    item1 = new Item("apple", 2, true);
    item2 = new Item("banana", 1, false);
  }

  @Test
  public void canGetSize(){
    customer.addItem(item1);
    customer.addItem(item2);
    assertEquals(2, basket.getSize());
  }

}