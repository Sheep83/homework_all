var store = require( '../items/items');
var basket = require( '../basket/basket')

var customer = {
  // pick: function(){
  //   var rand = store[Math.floor(Math.random() * store.length)];
  //   basket.contents.push(rand);
  // },
  remove: function(){
    basket.contents.pop()
  },
  pick: function(){
    basket.contents.push(store[0]);
  }
}

customer.pick();
console.log(basket.contents);
customer.remove();
console.log(basket.contents);

module.exports = customer;



