var store = require( '../items/items');
var basket = require( '../basket/basket')

var customer = {
  name: "Brian",
  card: true,
  remove: function(){
    basket.contents.pop()
  },
  pick: function(){
    basket.contents.push(store[0]);
  },
  addItem: function (item) {
    for (var i = 0; i < store.length; i++) {
      if(item == store[i]['name']) {
        basket.contents.push(store[i])
      }
    }
    // body...
  }
}


module.exports = customer;



