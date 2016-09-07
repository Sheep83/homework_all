var React = require('react')
// var AccountDescription = require('./AccountDescription')


var AccountSelect = function (props){
  
  return(
    <div className='account-table'>
      <select>
      <option key='0' value='All'>All</option>
      <option key='1' value='Current'>Current</option>
      <option key='2' value='Business'>Business</option>
      </select>
    </div>
  )
}

module.exports = AccountSelect