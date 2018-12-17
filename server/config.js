const CONF = {
    port: '5757',
    rootPathname: '',

    // 微信小程序 App ID
    appId: 'wx76fce64e3f760b3f',

    // 微信小程序 App Secret
  appSecret: '28d01cba841e066f9e2eb5f8c0188b7c',

    // 是否使用腾讯云代理登录小程序
    useQcloudLogin: false,

    /**
     * MySQL 配置，用来存储 session 和用户信息
     * 若使用了腾讯云微信小程序解决方案
     * 开发环境下，MySQL 的初始密码为您的微信小程序 appid
     */
    mysql: {
        host: 'localhost',
        port: 3306,
        user: 'root',
        db: 'cAuth',
        pass: 'wx76fce64e3f760b3f',
        char: 'utf8mb4'

        
    },

    cos: {
        /**
         * 地区简称
         * @查看 https://cloud.tencent.com/document/product/436/6224
         */
      region: 'ap-shanghai',
        // Bucket 名称
      fileBucket: '	commit-1257710776',
        // 文件夹
        uploadFolder: ''
    },

    // 微信登录态有效期
    wxLoginExpires: 7200,
    wxMessageToken: 'abcdefgh'
}

module.exports = CONF
