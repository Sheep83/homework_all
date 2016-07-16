var assert = require('chai').assert;
var Store = require ( '../store' );

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
  })
})
