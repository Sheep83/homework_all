var React = require('react')

var AccountDescription = function(props){

  var handleClick= function(){
    props.handleDetailsSubmit(props.account)
  }
    return(
      <div className='account-row'>
       {props.account.owner} {props.account.type}
       <button value="Details" onClick={handleClick}/>
      </div>
    )
}

module.exports = AccountDescription