var Store = function(name, city, inventory, cash){
  this.name = name;
  this.city = city;
  this.inventory = inventory;
  this.cash = cash;
}

Store.prototype = {
  addRecord: function(record){
    this.inventory.push(record);
    return this.inventory;
  }
}

module.exports = Store;
