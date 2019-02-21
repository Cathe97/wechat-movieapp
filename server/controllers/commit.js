//评论相关业务逻辑
const DB = require('../utils/db.js')

module.exports = {
  list: async ctx => {
    /**
     * 获取电影评论列表
     */
    
    ctx.state.data = await DB.query("SELECT * FROM comment;")
  },

  comment: async ctx=>{
    /**
     * 获取具体评论详情
     */
    commentID =+ ctx.params.id
    ctx.state.data=(await DB.query("SELECT*FROM comment where comment.id=?",[commentID]))
  },


  //获取用户发布的影评
  iList: async ctx=>{
    let user=ctx.state.$wxInfo.userinfo.openId
    ctx.state.data = await DB.query("SELECT movies.id, movies.title, movies.image, comment.id,comment.user_name, comment.user_icon, comment.type,comment.content FROM comment left JOIN movies ON comment.movie_id=movies.id WHERE comment.user_id=?",[user])
  },

  //提交影评
  subComment:async ctx=>{
    let userId=ctx.state.$wxInfo.userinfo.openId
    let userName = ctx.state.$wxInfo.userinfo.nickName
    let userIcon=ctx.state.$wxInfo.userinfo.avatarUrl

    let movieId =+ctx.request.body.movieId
    let type =ctx.request.body.type
    let content =ctx.request.body.content||null

    await DB.query('INSERT INTO comment(movie_id,user_id,user_name,user_icon,type,content) VALUES (?,?,?,?,?,?)',[movieId,userId,userName,userIcon,type,content])
  },

  
}