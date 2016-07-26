var Bank = require('./bank/bank.js');
var sampleAccounts = require('./sample.json');
var Account = require('./bank/account.js');
var BankView = require('./bank/bankview.js')

window.onload = function(){
    console.log('loaded');

    var bank = new Bank();
    for (accountData of sampleAccounts){
      bank.addAccount(new Account(accountData));
    }

    var bankview = new BankView(bank);

    var interestButton = document.getElementById('interest');
    interestButton.onclick = function(){
      bank.payInterest();
      bankview.render(bank);
    }
    
    console.log('We created a new browser bank', bank);
    bankview.render(bank);

  }
  




