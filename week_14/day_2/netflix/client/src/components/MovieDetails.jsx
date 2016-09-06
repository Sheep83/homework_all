var React = require('react')

var MovieDetails = React.createClass({
  render: function(){
    if (!this.props.movie){
      return(
        <h4>Nothing selected</h4>
        )
    }
    return(
      <div>
      <h4>{this.props.movie.show_title}</h4>
      <p>Year of release: {this.props.movie.release_year}</p>
      <p>Cast: {this.props.movie.show_cast}</p>
      <p>Synopsis: {this.props.movie.summary}</p>
      <p>Run Time: {this.props.movie.runtime}</p>
      <img src={this.props.movie.poster} alt={this.props.movie.poster}/>
      </div>
      )
  }
})

module.exports = MovieDetails

