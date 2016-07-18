window.onload = main;

var Quote = function(text, author){
  this.text = text;
  this.author = author;
}

function main(){
  var btn = document.getElementById('add-button');
  btn.onclick = handleClick;
  var form = document.getElementById( 'quote-form' );
  form.onsubmit = function(){
    event.preventDefault();
  }

  var quotes = [];
  quote1 = new Quote ("There is more to life than increasing its speed. ", 'Mahatma Gandhi');
  quote2 = new Quote ("Life is really simple, but we insist on making it complicated. ", "Confucius");
  quote3 = new Quote ("Willie Miller is the best penalty box defender in the world. ", "Alex Ferguson");
  quote4 = new Quote (" I tried being reasonable. I didn\'t like it. ", "Clint Eastwood");
  quotes.push(quote1);
  quotes.push(quote2);
  quotes.push(quote3);
  quotes.push(quote4);
  addToPage(quotes);
}


function addToPage(quotes){
  var ulist = document.getElementById( 'quote-list' );

  for (quote of quotes){
    var text = quote.text;
    var author = quote.author;

    var li = document.createElement( 'li' );
    li.innerText = text;

    var cite = document.createElement( 'cite' );
    cite.innerText = author;
    
    li.appendChild(cite);
    ulist.appendChild(li);
    li.onclick = function() {
      this.parentNode.removeChild(this);
      }
  }
}

function handleClick(){
  var txtInput = document.getElementById('quote-text-input');
  var autInput = document.getElementById('author-text-input');
  appendQuote(txtInput.value, autInput.value);
  txtInput.value = '';
  autInput.value = '';
}

function appendQuote( text, author ){
  var ul = document.getElementById('quote-list');
  var li = document.createElement( 'li' );
  li.innerText = text;
  var cite = document.createElement( 'cite' );
  cite.innerText = author;
  li.appendChild( cite );
  ul.appendChild( li );
  li.onclick = function() {
    this.parentNode.removeChild(this);
  }
}















