var customer = require( '../../customer/customer');
var store = require( '../../items/items');
var basket = require('../../basket/basket');
var assert = require( 'chai').assert;

describe( 'Basket', function(){ 
  beforeEach(function(){
   basket.contents = [];
   basket.total = 0;
 })

  it( 'can add item', function(){
    customer.pick();
    assert.equal(1, basket.contents.length)
  }),
  it( 'can remove item', function(){
    customer.pick();
    customer.remove();
    assert.equal(0, basket.contents.length)
  }), 
  it( 'total for 2 apples is 1.58', function(){
    customer.pick();
    customer.pick();
    basket.add(customer);
    assert.equal(1.58, basket.total)
  }),
  it( 'discount for over £20', function(){
    basket.contents.push(store[3]);
    basket.contents.push(store[3]);
    customer['card'] = false;
    basket.add(customer);
    assert.equal(18.9, basket.total)
  }),
  it( 'further discount', function(){
    basket.contents.push(store[3]);
    basket.contents.push(store[3]);
    customer['card'] = true;
    basket.add(customer);
    assert.equal(17.955, basket.total)
  }),
  it( 'add specific item', function(){
    customer.addItem("cornflakes");
    assert.equal("cornflakes", basket.contents[0]['name'])
  }),
  it( 'remove specific item', function(){
    customer.addItem("apple");
    customer.addItem("cornflakes");
    customer.removeItem("apple");
    assert.equal("cornflakes", basket.contents[0]['name'])
  })
})


