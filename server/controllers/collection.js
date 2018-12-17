const DB=require('../utils/db.js')
const COLLECTED=1
const UNCOLLECTED=0

module.exports={

  operate :async ctx =>{
    let user = ctx.state.$wxInfo.userinfo.openId
    let commentId =+ctx.request.body.commentId
    let collectState=ctx.request.body.collectState
    
    
    if(collectState=='1'){
      await DB.query("DELETE FROM collection where user_id=? and comment_id=?", [user, commentId])
    }else{
      await DB.query("INSERT INTO collection (user_id,comment_id) VALUES (?,?)", [user, commentId])
    }
    
    
  },

  list:async ctx=>{
    let user = ctx.state.$wxInfo.userinfo.openId
    ctx.state.data = await DB.query('SELECT movie_comment.id,movie_comment.movie_id,movie_comment.user_name,movie_comment.user_icon,movie_comment.type,movie_comment.content,movie_comment.title,movie_comment.image FROM collection left JOIN (SELECT comment.id,comment.movie_id,comment.user_name,comment.user_icon,comment.type,comment.content,movies.title,movies.image FROM comment left JOIN movies ON comment.movie_id=movies.id) AS movie_comment ON collection.comment_id=movie_comment.id WHERE collection.user_id=?',[user])
  }

 
}
