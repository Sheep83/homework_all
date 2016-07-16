var assert = require('chai').assert;
var Record = require ( '../record' );

describe('Record', function(){

  it("has an artist", function(){
    var record1 = new Record ( "Metallica", "Ride the Lightning", 4.99)
    assert.equal( "Metallica", record1.artist )
  }),
  it("has a title", function(){
    var record1 = new Record ( "Metallica", "Ride the Lightning", 4.99)
    assert.equal( "Ride the Lightning", record1.title )
  }),
  it("has a price", function(){
    var record1 = new Record ( "Metallica", "Ride the Lightning", 4.99)
    assert.equal( 4.99, record1.price )
  })
})
