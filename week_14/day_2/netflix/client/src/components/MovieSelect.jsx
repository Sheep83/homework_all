var React = require('react')
var MovieDetails = require('./MovieDetails')

var MovieSelect = React.createClass({

  getInitialState: function(){
    return {selectedIndex: null}
  },

  handleChange: function(event){
    var newIndex = event.target.value
    this.setState({selectedIndex: newIndex});
    this.props.setCurrentMovie(this.props.movies[newIndex])
  },

  render: function(){
    var movies = this.props.movies.map(function(movie) {
      return (
        <option value={this.props.movies.indexOf(movie)} key={this.props.movies.indexOf(movie)}>
        {movie.show_title}
        </option>
        )
    }.bind(this))
          
    return(
      <select value={this.state.selectedIndex} onChange={this.handleChange}>
      {movies}
      </select>
      
    )
  }
})

module.exports = MovieSelect