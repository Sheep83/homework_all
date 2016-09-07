var React = require('react')

var AccountDetails = function(props){
  if (props.account) {
    return(
      <div className='account-details'>
       {props.account.owner} {props.account.amount} {props.account.details} {props.account.type}
       <button value="Add Interest" />
      </div>
    )
  }else{
    return <div></div>
      
  }
}

module.exports = AccountDetails