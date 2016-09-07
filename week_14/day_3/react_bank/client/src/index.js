var React = require('react');
var ReactDOM = require('react-dom');
var BankBox = require('./components/BankBox')
var Bank = require('./models/bank/bank')


window.onload = function(){
    var bank = new Bank()
  ReactDOM.render(
    <BankBox bank = {bank}/>,
    document.getElementById('app')
    
  );
}
