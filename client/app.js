//app.js
var qcloud = require('./vendor/wafer2-client-sdk/index')
var config = require('./config')

let userInfo={}

App({
  onLaunch: function() {
    qcloud.setLoginUrl(config.service.loginUrl)
  },
  
  doQcloudLogin({ success, error }) {
    
    qcloud.login({
      success: result => {
        console.log(result)
        if (result) {
          let userInfo = result
          success && success({
            userInfo
          })
        } else {
          this.getUserInfo({ success, error })
        }
      },
      fail: () => {
        error && error()
      }
    })
  },

  getUserInfo({ success, error }) {
    qcloud.request({
      url: config.service.requestUrl,
      login: true,
      success: result => {
        //console.log(result)
        let data = result.data
        if (!data.code) {
          let userInfo = data.data
          success && success({
            userInfo
          })
        } else {
          error && error()
        }
      },
      fail: () => {
        error && error()
      }
    })
  },

  
})