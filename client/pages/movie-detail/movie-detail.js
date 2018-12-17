// pages/movie-detail/movie-detail.js
const qcloud = require('../../vendor/wafer2-client-sdk/index.js')
const config = require('../../config.js')

Page({

  /**
   * 页面的初始数据
   */
  data: {
    detail:{}
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    
    this.getMovieDetail(options.id)
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
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },

  getMovieDetail(id){
    wx.showLoading({
      title: '电影数据加载中',
    })
    qcloud.request({
      url:config.service.movieDetail+id,
      success:res=>{
        
        wx.hideLoading()
        if (!res.data.code) {
          this.setData({
            detail: res.data.data
          })
          
        } else {
          wx.showToast({
            title: '电影数据加载失败',
          })
        }
      },
      fail:res=>{
        // console.log(res)
        wx.showToast({
          title: '电影数据加载失败',
        })
      }
    })
    
  },

  typeChoice(){
    let movieId=this.data.detail.id
    wx.showActionSheet({
      itemList:['文字','音频'],
      success:res=>{
        if(res.tapIndex==1){
          wx.navigateTo({
            url: `/pages/add-commit/add-commit?type=audio&id=${movieId}`,
          })
        }else{
          wx.navigateTo({
            url: `/pages/add-commit/add-commit?type=text&id=${movieId}`,
          })
        }
      },
      fail:res=>{
      }
    })
  }

  
})