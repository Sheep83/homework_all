var React = require('react')
var AccountForm = require('./AccountForm')
var AccountList = require('./AccountList')
var AccountDetails = require('./AccountDetails')
var AccountSelect = require('./AccountSelect')

// var MovieSelect = require('./MovieSelect')
// var MovieDetails = require('./MovieDetails')
var _ = require('lodash')

var BankBox = React.createClass({
  getInitialState: function(){
    return { bank: this.props.bank, selectedAccount: null, selectedType: 'All'}

  },

  setSelectedType: function(type){
    this.setState({selectedType: type})
  },

  setSelectedAccount: function(account){
    this.setState({selectedAccount: account})
  },

  handleAccountSubmit: function(account){
    this.props.bank.addAccount(account)
    console.log(this.props.bank.accounts)
    this.setState({bank: this.props.bank})
  },

  handleDetailsSubmit: function(account){
    this.setState({selectedAccount: account})
    console.log('clicked')
  },

  // componentWillMount: function(){
  //   var url = "http://netflixroulette.net/api/api.php?director=Martin%20Scorsese"
  //   var request = new XMLHttpRequest()
  //   request.open("GET", url)
  //   request.onload = function(){
  //     if (request.status === 200){
  //       var data = JSON.parse(request.responseText)
  //       console.log(data)
  //       this.setState({movies: data, currentMovie: data[0]})
  //     }
  //   }.bind(this)
  //   request.send(null)
  // },

  render: function(){
    return (
      <div>
      <h4>Bank of Marie and Brian</h4>
      <h5>Accounts</h5>
      <AccountForm handleAccountSubmit = {this.handleAccountSubmit}/>
      <AccountSelect />
      <AccountList accounts = {this.props.bank.accounts} handleDetailsSubmit = {this.handleDetailsSubmit} filteredAccounts={this.props.bank.filteredAccounts} accountType= {this.setSelectedType}/>
      <h5>Total cash: </h5>{this.props.bank.totalCash()}
      <AccountDetails account={this.state.selectedAccount} />
      </div>
      )
  }
})

module.exports = BankBox;
