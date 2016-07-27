var express = require('express');
var app = express();
var MongoClient = require('mongodb').MongoClient
var bodyParser = require( 'body-parser' );
var path = require('path');
var fs = require('fs');
var ObjectID = require('mongodb').ObjectID;
app.use(bodyParser.json() );
app.use(express.static('client/build'));

// CREATE
app.post('/animals', function(req, res){
  console.log(req.body);
  res.status(200).end();
  var url = 'mongodb://localhost:27017/farm';
  MongoClient.connect(url, function(err, db){
    var collection = db.collection('animals')
    collection.insert({
      name: req.body.name, 
      type: req.body.type, 
      age: req.body.age 
    })
    res.status(200).end();
    db.close();
  })
});
// DELETE
app.delete('/animals/:id', function(req, res) {
  var url = 'mongodb://localhost:27017/farm';
  MongoClient.connect(url, function(err, db) {
    var collection = db.collection('animals');
    collection.remove({_id: new ObjectID(req.params.id)});
    res.status(200).end()
    db.close();
  })
});
// UPDATE
app.put('/animals/:id', function(req, res){
  res.status(200).end();
  var url = 'mongodb://localhost:27017/farm';
  MongoClient.connect(url, function(err, db){
    var collection = db.collection('animals')
    collection.updateOne({_id: new ObjectID(req.params.id)}, 
      {$set: {
        name: req.body.name, 
        type: req.body.type, 
        age: req.body.age 
      }})

    res.status(200).end();
    db.close();
  })
});
//INDEX
app.get('/animals', function(req, res){
  var url = 'mongodb://localhost:27017/farm';
  MongoClient.connect(url, function(err, db){
    var collection = db.collection('animals')
    collection.find({}).toArray( function(err, docs){
      res.json(docs);
      db.close();
    })
  })
});
//ROOT
app.get('/', function(req, res){
  res.sendFile(path.join(__dirname + '/client/build/index.html'));
  });

app.listen( '3000', function(){
  console.log( 'Running on 3000');
})