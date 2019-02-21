// pages/hot-movie/hot-movie.js
const qcloud = require('../../vendor/wafer2-client-sdk/index.js')
const config = require('../../config.js')

Page({

  /**
   * 页面的初始数据
   */
  data: {
    moivesList:[]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getMoviesList()
  },

  

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
    this.getMoviesList()
  },


  getMoviesList(){
    wx.showLoading({
      title: '电影数据加载中',
    })
    qcloud.request({
      url: config.service.moviesList,
      success: result => {
        wx.hideLoading()
        if (!result.data.code) {
          this.setData({
            moviesList: result.data.data
          })
        } else {
          wx.showToast({
            title: '电影数据加载失败',
          })
        }
      },
      fail: result => {
        console.log(result)
      }
    })
  }
})