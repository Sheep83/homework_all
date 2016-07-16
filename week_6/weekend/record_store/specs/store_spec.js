var assert = require('chai').assert;
var Store = require ( '../store' );
var Record = require ( '../record' );

describe('Store', function(){

  it("has an name", function(){
    var store1 = new Store( "Stone Grooves", "Aberdeen", [] );
    assert.equal( "Stone Grooves", store1.name )
  }),
  it("has a city", function(){
    var store1 = new Store( "Stone Grooves", "Aberdeen", [] );
    assert.equal( "Aberdeen", store1.city )
  }),
  it("starts with an empty inventory", function(){
    var store1 = new Store( "Stone Grooves", "Aberdeen", [] );
    assert.equal( 0, store1.inventory.length )
  }),
  it("starts with a cash balance", function(){
    var store1 = new Store( "Stone Grooves", "Aberdeen", [], 500 );
    assert.equal( 500, store1.cash )
  }), 
  it("can add a record to the inventory", function(){
    var store1 = new Store( "Stone Grooves", "Aberdeen", [], 500 );
    var record1 = new Record ( "Metallica", "Ride the Lightning", 4.99);
    store1.addRecord(record1);
    assert.equal( "Metallica", store1.inventory[0].artist )
  })  
})
