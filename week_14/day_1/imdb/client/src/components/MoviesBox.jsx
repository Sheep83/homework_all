var React  = require('react')
var movies = [
{id:1, title: "Rogue One", text:"A Star Wars Story"}, 
{id:2, title: "Deadpool", text: "Wait till you get a load of me"}
]
//REACT component
var MoviesBox = React.createClass({

  getInitialState: function(){
    return{movies: movies}

  },

  propTypes:{
    movies: React.PropTypes.array.isRequired,
  },

  render: function(){
      return(
        <div className='movies-box'>
        <h1>Movies</h1>
        <MoviesList movies={this.state.movies}/>
        <MoviesForm handleSubmit={this.handleSubmit}/>
        </div>
        )
    }

})

module.exports = MoviesBox