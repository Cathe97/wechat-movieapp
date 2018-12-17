// pages/home/home.js
const qcloud = require('../../vendor/wafer2-client-sdk/index.js')
const config = require('../../config.js')

Page({

  /**
   * 页面的初始数据
   */
  data: {
    detail:{},
    movieInfo:{}
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
      this.getRandomComment()
  },

  

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },


  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  //获取一条随机评论
  

  //获取所有评论
  getRandomComment(){
    qcloud.request({
      url:config.service.commentList,
      success:res=>{
        let allList=res.data.data
        let range=allList.length
        let i = Math.floor(Math.random()*range)
        let detail=allList[i]
        //console.log(detail)
        this.setData({
          detail:detail
        })
        let id=detail.movie_id
        this.getMovieDetail(id)
        
      },
      fail:res=>{
       // console.log(res)
        wx.showToast({
          title: '数据加载失败',
          icon:'none'
        })
      }
    })
  },

  getMovieDetail(id) {
    
    qcloud.request({
      url: config.service.movieDetail + id,
      success: res => {

        wx.hideLoading()
        if (!res.data.code) {
          this.setData({
            movieInfo: res.data.data
          })
          //console.log(this.data.movieInfo)
        } else {
          wx.showToast({
            title: '电影数据加载失败',
          })
        }
      },
      fail: res => {
         console.log(res)
        wx.showToast({
          title: '数据加载失败',
        })
      }
    })

  }
  
})