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
  },
  listInventory: function(){
    for(record of this.inventory){
      console.log("Title : " + record.title);
      console.log("Artist : " + record.artist);
      console.log("Price : £ " + record.price);
      console.log(" ");
    }
  },
  sellRecord: function(record){
    for(sold of this.inventory){
      if(record.title === sold.title){
        this.cash += sold.price;
      }
    }
  },
  finances: function(){
    var invValue = 0
    for(record of this.inventory){
      invValue += record.price;
    }
    console.log("Total Store Cash is : £ " + this.cash);
    console.log("Total value of inventory is : £ " + invValue);
    var netWorth = this.cash += invValue;
    console.log("Total net worth of " + this.name + " is : £ " + netWorth);
  }
}

module.exports = Store;
