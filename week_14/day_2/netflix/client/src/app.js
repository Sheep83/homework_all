var React = require('react');
var ReactDOM = require('react-dom');
var MoviesBox = require('./components/MoviesBox')

window.onload = function(){
  ReactDOM.render(
    <MoviesBox />,
    document.getElementById('app')
  );
}
