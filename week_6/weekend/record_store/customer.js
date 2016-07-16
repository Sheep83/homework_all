var Customer = function(name, cash, inventory){
  this.name = name;
  this.cash = cash;
  this.inventory = inventory;
}

Customer.prototype = {
  buyRecord: function(title, store){
    store.inventory.forEach(function(record){
      var index = store.inventory.indexOf(record);
      if(title === record.title){
        var bought = record;
        this.inventory.push(bought);
        store.inventory.splice(index, 1);
        this.cash -= bought.price;
        store.cash += bought.price;
      }
    }.bind(this))    
  }, 
  sellRecord: function(title, store){
    this.inventory.forEach(function(record){
      var index = this.inventory.indexOf(record);
      if(title === record.title){
        var sold = record;
        store.inventory.push(sold);
        this.inventory.splice(index, 1);
        this.cash += sold.price;
        store.cash -= sold.price;
      }
    }.bind(this))    
  }
}

module.exports = Customer;