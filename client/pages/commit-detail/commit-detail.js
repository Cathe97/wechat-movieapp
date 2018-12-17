// pages/commit-detail/commit-detail.js
const qcloud = require('../../vendor/wafer2-client-sdk/index.js')
const config = require('../../config.js')
const app = getApp()
const audioContext = wx.createInnerAudioContext()
const AUDIO_ON=1;
const AUDIO_OFF=0;
const COLLECTED=1;
const UNCOLLECTED=0;

Page({

  /**
   * 页面的初始数据
   */
  data: {
    movie:{},
    detail:{},
    voiceState:0,
    collectState:0,
    commmentId:{},
    userInfo:null

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    app.doQcloudLogin({
      success: ({ userInfo }) => {
        this.setData({
          userInfo
        })
        this.getCommentDetail(options.commentId)
        this.testCollection()
      },
      fail: err => {
        console.log(err)
      }
    })
    
    this.setData({
      commentId:options.commentId
    })
    
    //console.log(this.data.commentId)
    
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
    app.doQcloudLogin({
      success: ({ userInfo }) => {
        this.setData({
          userInfo
        })
      },
      fail: err => {
        console.log(err)
      }
    })

  },

  onTapLogin: function () {
    app.doQcloudLogin({
      success: ({ userInfo }) => {
        this.setData({
          userInfo
        })
      }
    })

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

  typeChoice(event) {
    //要先获取数据查看用户是否评价过这部电影
    //console.log(event)
    let movieId=event.currentTarget.id
    console.log(movieId)
    //获取用户发布的评论列表查看是否有这部电影

    wx.showActionSheet({
      itemList: ['文字', '音频'],
      success: res => {
        if (res.tapIndex == 1) {
          wx.navigateTo({
            url: `/pages/add-commit/add-commit?type=audio&id=${movieId}`,
          })
        } else {
          wx.navigateTo({
            url: `/pages/add-commit/add-commit?type=text&id=${movieId}`,
          })
        }
      },
      fail: res => {
        console.log(res)
      }
    })
  },

  getCommentDetail(id){
    wx.showLoading({
      title: '评论详情加载中',
    })
    qcloud.request({
      url: config.service.commentDetail + id,
      success: res => {
        //console.log(res)
        wx.hideLoading()
        if (!res.data.code) {
          let data=res.data.data[0]
          let movieId=data.movie_id
          this.getMovieDetail(movieId)
          //console.log(data)
          this.setData({
            detail: data
          })

        } else {
          wx.showToast({
            title: '电影数据加载失败',
          })
        }
      },
      fail: res => {
        console.log(res)
        wx.showToast({
          title: '电影数据加载失败',
        })
      }
    })
  },


  getMovieDetail(id) {
    qcloud.request({
      url: config.service.movieDetail + id,
      success: res => {
        if (!res.data.code) {
          //console.log(res)
          this.setData({
            movie: res.data.data
          })

        } else {
          wx.showToast({
            title: '电影数据加载失败',
          })
        }
      },
      fail: res => {
        wx.showToast({
          title: '电影数据加载失败',
        })
      }
    })

  },
  
  //实现音乐播放
  playVoice(e){
    let voiceUrl=e.currentTarget.dataset.url
    let voiceState=e.currentTarget.dataset.state
    audioContext.src=voiceUrl
    if(voiceState==AUDIO_OFF){
      audioContext.play()
      this.setData({
        voiceState:AUDIO_ON
      })
    }else{
      audioContext.stop()
      this.setData({
        voiceState: AUDIO_OFF
      })
    }
  },

  //检查用户是否收藏过该影评
  testCollection(){
    qcloud.request({
      url:config.service.collectionList,
      login:true,
      success:r=>{
        //获得收藏列表
        console.log(r)
        let list=r.data.data

        for(let i=0;i<list.length;i++){
          if(list[i].id==this.data.commentId){
            this.setData({
              collectState:COLLECTED
            })
          }
        }
      },
      fail:r=>{
        console.log(r)
      }
    })
  },


  // 添加对于收藏数据表的增加和删除
  collectDBOperate(){
    console.log(this.data.commentId)
    console.log(this.data.collectState)
    qcloud.request({
      url: config.service.collectionOperate,
      login:true,
      method: 'POST',
      data: {
        commentId: this.data.commentId,
        collectState: this.data.collectState
      },
      success: res => {
        console.log(res)
        console.log(this.data.collectState)
        this.setData({
          collectState:this.data.collectState?UNCOLLECTED:COLLECTED
        })
        console.log(this.data.collectState)
      },
      fail: res => {
        console.log(res)
      }
    })
  },

  collectOperate(){
    app.doQcloudLogin({
      success:({userInfo})=>{
        this.collectDBOperate()
      }
    })
  }
  


  // 检查用户是否发表过某id电影评论


})