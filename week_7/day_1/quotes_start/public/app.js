window.onload = main;

var Quote = function(text, author){
  this.text = text;
  this.author = author;
}

function main(){
  var btn = document.getElementById('add-button');
  btn.onclick = handleClick;
  var input = document.getElementById('quote-text-input');
  input.onpropertychange = input.oninput;
  input.oninput = function(){
    document.getElementById('quote-preview').innerHTML = input.value;
  }
  var form = document.getElementById( 'quote-form' );
  form.onsubmit = function(){
    event.preventDefault();
  }
  var quotes = [];
  quote1 = new Quote ("There is more to life than increasing its speed ", 'Mahatma Gandhi');
  quote2 = new Quote ("Life is really simple, but we insist on making it complicated ", "Confucius");
  quote3 = new Quote ("I love deadlines. I like the whooshing sound they make as they fly by ", "Douglas Adams");
  quote4 = new Quote ("I tried being reasonable. I didn\'t like it ", "Clint Eastwood");
  quote5 = new Quote ("The desire to be a poitician should bar you for life from ever being one ", "Billy Connolly");
  quotes.push(quote1);
  quotes.push(quote2);
  quotes.push(quote3);
  quotes.push(quote4);
  quotes.push(quote5);
  addAll(quotes);

  // for (var i of quotes){
  //   quotelist.appendChild(createQuote(i,text, i.author));
  // }
  // form.onsubmit = function(event){
  //   event.preventDefault();
  //   tmpElement = appendQuote("", "");
  //   resetForm();
  // }

  // var resetForm = function(){
  //   quoteInput.value = "";
  //   authorInput.value = "";
  // }

  // var handleKeyChange = function(){
  //   if(quoteInput.value || authorInput.value){
  //     modifyQuote(tmpElement, quoteInput.value, authorInput.value);
  //     quotelist.appendChild(tmpElement);
  //   }
  // }

  // var modifyQuote = function(el, newText, newAuthor){
  //   el.childNodes[0].innerHTML = newText + " <cite> " + newAuthor + "</cite>";
  // }

  // quoteInput.oninput = handleKeyChange;
  // authorInput.oninput = handleKeyChange;

  // quotelist.onclick = function(event){
  //   if (quotelist.lastChild === event.target.parentNode){
  //     resetForm();
  //   }
  //   quotelist.removeChild(event.target.parentNode);
  // }

} //// end of main function

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
  li.innerText = text += " - ";
  var cite = document.createElement( 'cite' );
  cite.innerText = author;
  li.appendChild( cite );
  ul.appendChild( li );
  li.onclick = function() {
    this.parentNode.removeChild(this);
  }
}

function addAll(quotes){
  var ul = document.getElementById( 'quote-list' );
  for (quote of quotes){
    appendQuote(quote.text, quote.author);
  }
}
















