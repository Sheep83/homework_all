var assert = require('chai').assert;
var Store = require ( '../store' );
var Record = require ( '../record' );
var Customer = require ( '../customer' );


describe('Customer', function(){

  it("has an name", function(){
    var record1 = new Record ( "Metallica", "Ride the Lightning", 4.99);
    var record2 = new Record ( "Stone Roses", "Stone Roses", 5.99);
    var record3 = new Record ( "Pixies", "Doolittle", 8.99);
    var customer1 = new Customer( "Brian", 100, [record1, record2, record3] );
    assert.equal( "Brian", customer1.name )
  }),
  it("has an inventory", function(){
    var record1 = new Record ( "Metallica", "Ride the Lightning", 4.99);
    var record2 = new Record ( "Stone Roses", "Stone Roses", 5.99);
    var record3 = new Record ( "Pixies", "Doolittle", 8.99);
    var customer1 = new Customer( "Brian", 100, [record1, record2, record3] );
    assert.equal( 3, customer1.inventory.length )
  }),
  it("has a cash balance", function(){
    var customer1 = new Customer( "Brian", 100, [] );
    assert.equal( 100, customer1.cash )
  }),
  it("can buy a record", function(){
    var store1 = new Store( "Stone Grooves", "Aberdeen", [], 500 );
    var record1 = new Record ( "Metallica", "Ride the Lightning", 4.99);
    var record2 = new Record ( "Stone Roses", "Stone Roses", 5.99);
    var record3 = new Record ( "Pixies", "Doolittle", 8.99);
    store1.addRecord(record1);
    store1.addRecord(record2);
    store1.addRecord(record3);
    var customer1 = new Customer( "Brian", 100, [] );
    customer1.buyRecord( "Doolittle", store1);
    assert.equal( 508.99, store1.cash ); 
    assert.equal( "Doolittle", customer1.inventory[0].title );
    assert.equal( 91.01, customer1.cash );
    assert.equal( 2, store1.inventory.length );
    assert.equal( 1, customer1.inventory.length );
  }),
  it("can sell a record", function(){
    var store1 = new Store( "Stone Grooves", "Aberdeen", [], 500 );
    var record1 = new Record ( "Metallica", "Ride the Lightning", 4.99);
    var record2 = new Record ( "Stone Roses", "Stone Roses", 5.99);
    var record3 = new Record ( "Pixies", "Doolittle", 8.99);
    store1.addRecord(record1);
    store1.addRecord(record2);
    store1.addRecord(record3);
    var customer1 = new Customer( "Brian", 100, [] );
    customer1.buyRecord( "Doolittle", store1);
    customer1.buyRecord( "Stone Roses", store1);
    customer1.buyRecord( "Ride the Lightning", store1);
    assert.equal( 519.97, store1.cash ); 
    assert.equal( 3, customer1.inventory.length );
    assert.equal( 0, store1.inventory.length );
    customer1.sellRecord( "Stone Roses", store1);
    assert.equal( 2, customer1.inventory.length );
    assert.equal( 1, store1.inventory.length );
    assert.equal( 513.98, store1.cash ); 
  })
})


