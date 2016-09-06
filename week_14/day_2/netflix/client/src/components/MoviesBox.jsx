var React = require('react')
var MovieSelect = require('./MovieSelect')
var MovieDetails = require('./MovieDetails')
var _ = require('lodash')

var MoviesBox = React.createClass({
  getInitialState: function(){
    return { movies: [], currentMovie: null}
  },

  setCurrentMovie: function(movie){
    this.setState({currentMovie: movie})
  },

  componentWillMount: function(){
    var url = "http://netflixroulette.net/api/api.php?director=Martin%20Scorsese"
    var request = new XMLHttpRequest()
    request.open("GET", url)
    request.onload = function(){
      if (request.status === 200){
        var data = JSON.parse(request.responseText)
        console.log(data)
        this.setState({movies: data, currentMovie: data[0]})
      }
    }.bind(this)
    request.send(null)
  },

  render: function(){
    return (
      <div>
      <h4>Martin Scorsese Movies</h4>
      <h5>Some of them anyway... </h5>
      <MovieSelect movies={this.state.movies} setCurrentMovie={this.setCurrentMovie}/>
      <MovieDetails movie = {this.state.currentMovie}/>
      </div>
      )
  }
})

module.exports = MoviesBox;
