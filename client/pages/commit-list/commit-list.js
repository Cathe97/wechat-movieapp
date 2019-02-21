// pages/commit-list/commit-list.js
const qcloud = require('../../vendor/wafer2-client-sdk/index.js')
const config = require('../../config.js')

Page({

  /**
   * 页面的初始数据
   */
  data: {
    commentList:[],
    id:null,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    //console.log(options)
    let id=options.id
    this.setData({
      id:id
    })
    this.getCommentList(options.id)
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {
      let id=this.data.id
      this.getCommentList(id)
  },


  getCommentList(id) {
    wx.showLoading({
      title: '评论数据加载中',
    })
    qcloud.request({
      url: config.service.commentList,
      success: res => {
        
        wx.hideLoading()
        if (!res.data.code) {
          let cerList=[]
          let allList=res.data.data
          for(let i=0;i<allList.length;i++){
            if(allList[i].movie_id==id){
            cerList.push({
              id:allList[i].id,
              movie_id: allList[i].movie_id,
              type:allList[i].type,
              user_icon:allList[i].user_icon,
              user_name:allList[i].user_name,
              user_id:allList[i].user_id,
              content:allList[i].content
            })
            }
          }
          //console.log(cerList)
          this.setData({
            commentList: cerList
          })

        } else {
          wx.showToast({
            title: '评论数据加载失败',
          })
        }
      },
      fail: res => {
        // console.log(res)
        wx.showToast({
          title: '评论数据加载失败',
        })
      }
    })
  }
})