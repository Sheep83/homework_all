var React = require('react')
var AccountDescription = require('./AccountDescription')


var AccountList = function (props){
  var accountTypes = ['Current', 'Business']

  var accountNodes = props.accounts.map(function(account, index) {
    return (
      <li key={index}>
        <AccountDescription account={account} handleDetailsSubmit = {props.handleDetailsSubmit}/>
      </li>
    )
  })

  return(
    <div className='account-table'>
      <ul>
        {accountNodes}
      </ul>
    </div>
  )
}

module.exports = AccountList