const DB = require('../utils/db.js')
module.exports = {
  list: async ctx => {
    ctx.state.data = await DB.query("SELECT * FROM movies;")
  },

  movieDetail: async ctx =>{
    movieID =+ ctx.params.id


    ctx.state.data =(await DB.query('SELECT * FROM movies where movies.id=?',[movieID]))[0]
  }
}