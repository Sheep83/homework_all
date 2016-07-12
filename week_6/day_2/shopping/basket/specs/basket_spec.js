var customer = require( '../../customer/customer');
var store = require( '../../items/items');
var basket = require('../../basket/basket');
var assert = require( 'chai').assert;

describe( 'Basket', function(){ 

  it( 'can add item', function(){
  customer.pick();
  assert.equal(1, basket.contents.length)
 }),
  it( 'can remove item', function(){
    customer.remove();
    customer.pick();
    customer.remove();
    assert.equal(0, basket.contents.length)
  }), 
  it( 'total for 2 apples is 1.58', function(){
    customer.pick();
    customer.pick();
    basket.add();
    assert.equal(1.58, basket.total)
  })
  it( 'discount for over £20', function(){
    customer.remove();
    customer.remove();
    basket.contents.push(store[3]);
    basket.contents.push(store[3]);
    basket.add();
    assert.equal(18.9, basket.total)
  })
 })