var React = require('react');
var ReactDOM = require('react-dom');
var MoviesBox = require('./components/BankBox')

window.onload = function(){
  ReactDOM.render(
    <BankBox />,
    document.getElementById('app')
  );
}
