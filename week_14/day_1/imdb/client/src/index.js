var React = require('react');
var ReactDOM = require('react-dom');
var MoviesBox = require('./components/MoviesBox')

window.onload = function(){
  console.log("webpack app started");
  ReactDOM.render(
    <MoviesBox title="Movies" subhead="More movies"/>, 
    document.getElementById('app')
    )
}
