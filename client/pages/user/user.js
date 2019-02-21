// pages/user/user.js
const qcloud = require('../../vendor/wafer2-client-sdk/index.js')
const config = require('../../config.js')
const app=getApp()
const COLLECTED=0
const ISSUED=1

Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo:null,
    type:['已收藏的影评','已发布的影评'],
    index:COLLECTED,
    list:{},
    iList:{}
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
        
        this.getCollection()
        this.getIssue()
      },
      fail: err => {
        console.log(err)
        wx.showToast({
          title: '登录失败',
          icon: 'none'
        })
      }
    })
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    app.doQcloudLogin({
      success:({userInfo})=>{
        this.setData({
          userInfo
        })
        this.getIssue()
        this.getCollection()
      },
      fail:err=>{
        console.log(err)
        wx.showToast({
          title: '登录失败',
          icon:'none'
        })
      }
    })
  },



  bindPickerChange(event){
    let typeNum=event.detail.value
    //console.log(typeNum)
    this.setData({
      index:event.detail.value
    })
    
    
  },

  onTapLogin:function(){
    app.doQcloudLogin({
      success:({userInfo})=>{
        this.setData({
          userInfo
        })
      }
    })
  },

  

  //获取收藏列表
  getCollection() {
    qcloud.request({
      url: config.service.collectionList,
      login: true,
      success: r => {
        //获得收藏列表
        console.log(r)
        let list = r.data.data
        this.setData({
          list:list
        })
        console.log(this.data.list)
        
      },
      fail: r => {
        console.log(r)
        wx.showToast({
          title: '数据加载失败',
          icon:'none'
        })
      }
    })
  },

  //获取用户已评论的影评
  getIssue(){
    qcloud.request({
      url:config.service.iList,
      login:true,
      success:res=>{
        //console.log(res)
        let issueList=res.data.data
        this.setData({
          iList:issueList
        })
      },
      fail:res=>{
        console.log(res)
        wx.showToast({
          title: '数据加载失败',
          icon:'none'
        })
      }
    })
  },

  onPullDownRefresh(){
    app.doQcloudLogin({
      success: ({ userInfo }) => {
        this.setData({
          userInfo
        })
        this.getIssue()
        this.getCollection()
      },
      fail: err => {
        console.log(err)
        wx.showToast({
          title: '登录失败',
          icon: 'none'
        })
      }
    })
  }


  
  
  
})