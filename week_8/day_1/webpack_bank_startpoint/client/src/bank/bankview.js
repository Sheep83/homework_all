var BankView = function(){

}

BankView.prototype = {
  render: function(bank){

    var totalDisplay = document.getElementById('total');
    totalDisplay.innerText = bank.totalCash();
    var accountList = document.getElementById('accounts');
    accountList.innerHTML = "";

    for(account of bank.accounts){
      var accountListItem = document.createElement('li');
      accountListItem.innerText = account.owner + " : £  " + account.amount.toFixed(2);
      accountList.appendChild(accountListItem);
    }
    var personalAccountsList = document.getElementById('personal-accounts');
    var businessAccountsList = document.getElementById('business-accounts');
    personalAccountsList.innerHTML = "";
    businessAccountsList.innerHTML = "";

    for (account of bank.accounts){
      if (account.type === 'personal'){
        var persListItem = document.createElement('li');
        persListItem.innerText = account.owner + " : £ " + account.amount.toFixed(2);
        personalAccountsList.appendChild(persListItem);
      }else{
        var busListItem = document.createElement('li');
        busListItem.innerText = account.owner + " : £ " + account.amount.toFixed(2);
        businessAccountsList.appendChild(busListItem);
      }
    }
  }
}

module.exports = BankView;