import static org.junit.Assert.*;
import org.junit.*;
import shopping_basket.*;

public class CustomerTest {

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
  public void hasName(){
    assertEquals("Brian", customer.getName());
  }

  @Test
  public void hasCard(){
    assertEquals(false, customer.getCard());
  }

  @Test
  public void hasEmptyBasket(){
    assertEquals(0, customer.getBasketSize());
  }

  @Test
  public void canAddItem(){
    // store.addStock(item1);
    // store.addStock(item2);
    customer.addItem(item1);
    assertEquals(1, customer.getBasketSize());
  }

  @Test
  public void canRemoveItem(){
    // store.addStock(item1);
    // store.addStock(item2);
    customer.addItem(item1);
    customer.removeItem(item1);
    assertEquals(0, customer.getBasketSize());
  }

}