// pages/movie-detail/movie-detail.js
const qcloud = require('../../vendor/wafer2-client-sdk/index.js')
const config = require('../../config.js')
const UNCOMMENTED = 0;
const COMMENTED = 1

Page({

  /**
   * 页面的初始数据
   */
  data: {
    detail:{},
    issueState:UNCOMMENTED
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getMovieDetail(options.id)
    this.getIssue()
  },


  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    this.getIssue()
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
  },

  //检查用户是否发表过该电影评论
  getIssue() {
    qcloud.request({
      url: config.service.iList,
      login: true,
      success: res => {
        //console.log(res)
        let issueList = res.data.data
        let title = this.data.detail.title
        for (let i = 0; i < issueList.length; i++) {
          //console.log(issueList[i].id)
          if (issueList[i].title == title) {
            this.setData({
              issueState: COMMENTED
            })
          }
        }
        console.log(this.data.issueState)

      },
      fail: res => {
        console.log(res)
        wx.showToast({
          title: '数据加载失败',
          icon: 'none'
        })
      }
    })
  }

  
})