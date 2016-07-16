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
        var toSell = sold;
      }
    }
    console.log(toSell);
    this.cash += toSell.price;
    console.log(this.cash)
  }
}

module.exports = Store;
