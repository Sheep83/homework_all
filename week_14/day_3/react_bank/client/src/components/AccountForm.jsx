var React = require('react')
var Account = require('../models/bank/account')

var AccountForm = React.createClass({

  getInitialState: function(){
    return{name: '', amount: '', details: '', type: ''}
  },

  handleNameChange: function(e){
    this.setState({name: e.target.value})
  },

  handleAmountChange: function(e){
    this.setState({amount: e.target.value})
  },

  handleDetailsChange: function(e){
    this.setState({details: e.target.value})
  },

  handleTypeChange: function(e){
    this.setState({type: e.target.value})
  },

  handleSubmit: function(e){
    e.preventDefault()
    var name = this.state.name.trim()
    var amount = this.state.amount.trim()
    var details = this.state.details.trim()
    var type = this.state.type.trim()
    if (!name && !amount && !details && !type){
      return;
    }
    var newAccount = new Account(name, amount, type, details)
    console.log(newAccount)
    this.props.handleAccountSubmit(newAccount)
    this.setState({name: '', amount: '', details: '', type: ''})
  },

  render: function(){
    return(
      <form className='account-form' onSubmit={this.handleSubmit}>
      <input type="text" placeholder="Account holder" 
      value={this.state.name}
      onChange={this.handleNameChange}
      />
      <input type="text" placeholder="Opening Balance" 
      value={this.state.amount}
      onChange={this.handleAmountChange}
      />
      <input type="text" placeholder="Details" 
      value={this.state.details}
      onChange={this.handleDetailsChange}
      />
      <input type="text" placeholder="Account Type" 
      value={this.state.type}
      onChange={this.handleTypeChange}
      />
      <input type="submit" value="Add Account" />
      </form>
      )
  }

})

module.exports = AccountForm