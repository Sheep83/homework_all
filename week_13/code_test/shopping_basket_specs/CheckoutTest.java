import static org.junit.Assert.*;
import org.junit.*;
import shopping_basket.*;

public class CheckoutTest {

  Customer customer;
  Basket basket;
  Item item1, item2, item3, item4, item5;
  Checkout checkout;

  @Before
  public void before(){
    basket = new Basket();
    customer = new Customer("Brian", true, basket);
    item1 = new Item("apple", 2, true);
    item2 = new Item("banana", 1, false);
    item3 = new Item("orange", 3, false);
    item4 = new Item("game", 10, false);
    checkout = new Checkout(customer);
  }

  @Test
  public void canApplyBogof(){
    customer.addItem(item1);
    customer.addItem(item1);
    customer.addItem(item1);
    customer.addItem(item1);
    customer.addItem(item1);
    customer.addItem(item2);
    customer.addItem(item3);
    customer.addItem(item3);
    assertEquals((Double)13.0, checkout.bogof());
  }

  @Test
  public void canDiscount(){
    customer.addItem(item1);
    customer.addItem(item1);
    customer.addItem(item1);
    customer.addItem(item1);
    customer.addItem(item1);
    customer.addItem(item2);
    customer.addItem(item3);
    customer.addItem(item3);
    customer.addItem(item4);
    assertEquals((Double)20.70, checkout.applyDiscount());
  }

  @Test
  public void canUseCard(){
    customer.addItem(item1);
    customer.addItem(item1);
    customer.addItem(item1);
    customer.addItem(item1);
    customer.addItem(item1);
    customer.addItem(item2);
    customer.addItem(item3);
    customer.addItem(item3);
    customer.addItem(item4);
    assertEquals((Double)20.286, checkout.allDiscount());
  }

  @Test
  public void canApplyOnlyCard(){
    customer.addItem(item4);
    assertEquals((Double)9.8, checkout.allDiscount());
  }



}