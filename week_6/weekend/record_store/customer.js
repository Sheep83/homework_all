var Customer = function(name, cash, inventory){
  this.name = name;
  this.cash = cash;
  this.inventory = inventory;
}

Customer.prototype = {
  buyRecord: function(title, store){
    store.inventory.forEach(function(record){
      if(title === record.title){
        var bought = record;
        this.inventory.push(bought);
        this.cash -= bought.price;
        store.cash += bought.price;
      }
    }.bind(this))    
  }
}

module.exports = Customer;