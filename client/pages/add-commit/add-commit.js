const qcloud = require('../../vendor/wafer2-client-sdk/index.js')
const config = require('../../config.js')
const app = getApp()
const recorderHolder=wx.getRecorderManager()
const EDIT=0
const PREVIEW=1
const audioContext = wx.createInnerAudioContext()
const AUDIO_ON = 1;
const AUDIO_OFF = 0;

Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo: null,
    movieInfo:{},
    commentType:'text',
    pageState:EDIT,
    textComment:'',
    audioComment:'',
    voiceState:AUDIO_OFF,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      commentType:options.type
    })
    console.log(this.data.commentType)
    this.getMovieDetail(options.id)
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

  getMovieDetail(id) {
    wx.showLoading({
      title: '电影数据加载中',
    })
    qcloud.request({
      url: config.service.movieDetail + id,
      success: res => {
        console.log(res)
        wx.hideLoading()
        if (!res.data.code) {
          this.setData({
            movieInfo: res.data.data
          })

        } else {
          wx.showToast({
            title: '电影数据加载失败',
          })
        }
      },
      fail: res => {
        // console.log(res)
        wx.showToast({
          title: '电影数据加载失败',
        })
      }
    })

  },

  //获取输入框的值
  getValue(e){
    let value=e.detail.value
    this.setData({
      textComment:value
    })
    console.log(this.data.textComment)
  },

   //是否按下提交改变页面状态
  previewComment(e){
    this.setData({
      pageState:PREVIEW
    })
  },

  //录制音频
  getAudio(e){
    recorderHolder.onStart(() => {
      wx.showToast({
        title: '开始录音',
        icon:'loading'
      })
    })
    recorderHolder.onStop((res) => {
      wx.showToast({
        title: '录制结束',
      })
     
      this.setData({
        audioComment:res.tempFilePath
      })
      console.log(this.data.audioComment)
    })
    let operation=e.type
    if(operation=='touchstart'){
      recorderHolder.start({
        duration:6000,
        sampleRate:44100,
        numberOfChannels:1,
        encodeBitRate:192000,
        format:'mp3',
        frameSize:50
      })
    }else{
      recorderHolder.stop()
    }
  },

  //返回重新编辑 
  comeBack(){
    this.setData({
      pageState:EDIT
    })
  },

  //播放录制好的音频
  playVoice(e) {
    let voiceUrl = this.data.audioComment
    let voiceState = e.currentTarget.dataset.state
    audioContext.src = voiceUrl
    if (voiceState == AUDIO_OFF) {
      audioContext.play()
      this.setData({
        voiceState: AUDIO_ON
      })
    } else {
      audioContext.stop()
      this.setData({
        voiceState: AUDIO_OFF
      })
    }
  },
  
  //提交影评
  submit(){
    console.log(this.data.movieInfo.id)
    //如果是音频评论先将音频文件上传至对象存储
    if(this.data.commentType=='audio'){
      this.uploadVoice(()=>{
        this.uploadComment()
      })
    }else{
      this.uploadComment()
    }
   
    
  },

  //上传评论函数
  uploadComment(){
    app.doQcloudLogin({
      success: ({ userInfo }) => {
        this.setData({
          userInfo
        })
        qcloud.request({
          url: config.service.submit,
          login: true,
          method: 'PUT',
          data: {
            movieId: this.data.movieInfo.id,
            type: this.data.commentType,
            content: this.data.commentType == 'audio' ? this.data.audioComment : this.data.textComment
          },
          success: res => {
            console.log(res)
            if (!res.data.code) {
              wx.showToast({
                title: '影评发布成功',
              })
              let id = this.data.movieInfo.id
              wx.redirectTo({
                url: `/pages/commit-list/commit-list?id=${id}`,
              })
            } else {
              wx.showToast({
                title: '影评发布失败',
                icon: 'none'
              })
            }
          },
          fail: res => {
            wx.showToast({
              title: '影评发布失败',
              icon: 'none'
            })
            console.log(res)
          }
        })
      },
      fail: err => {
        console.log(err)
      }
    })
  },


  //音频上传函数
  uploadVoice(callback){
    let tempPath=this.data.audioComment
    wx.uploadFile({
      url: config.service.uploadUrl,
      filePath: tempPath,
      name: 'file',
      header:{
        'content-type':'multipart/form-data'
      },
      success:res=>{
        console.log(res)
        let audioUrl=JSON.parse(res.data).data.imgUrl
        this.setData({
          audioComment:audioUrl
        })
        console.log(this.data.audioComment)
        callback&&callback()
      },
      fail:res=>{
        console.log(res)
      }
    })
  }



})