var store = require( '../items/items');
var customer = require( '../customer/customer');

var basket = {
  contents: [],
  total: 0, 
  add: function(customer){
    for(var i = 0; i < basket.contents.length; i++) {
      this.total += basket.contents[i].price;
    }
    if(this.total > 20 && customer['card'] === true) {
      var sum = this.total * 0.1;
      this.total -= sum;
      var sum = this.total * 0.05;
      this.total -= sum;
      // this.total -= (this.total * 0.1)
    }else if(this.total > 20) {
      var sum = this.total * 0.1;
      this.total -= sum;
    }

  }
}

module.exports = basket;


