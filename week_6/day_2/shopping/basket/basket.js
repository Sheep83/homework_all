var store = require( '../items/items');

var basket = {
  contents: [],
  total: 0, 
  add: function(){
    this.total = 0;
    for (var i = 0; i < basket.contents.length; i++) {
      this.total += basket.contents[i].price;
    }
    if(this.total > 20) {
      var sum = this.total * 0.1;
      this.total -= sum;
      // this.total -= (this.total * 0.1)
    }

  }
}

module.exports = basket;


