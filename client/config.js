/**
 * 小程序配置文件
 */

// 此处主机域名修改成腾讯云解决方案分配的域名
var host = 'https://m6sjvcxj.qcloud.la';

var config = {

    // 下面的地址配合云端 Demo 工作
    service: {
        host,

        // 登录地址，用于建立会话
        loginUrl: `${host}/weapp/login`,

        // 测试的请求地址，用于测试会话
        requestUrl: `${host}/weapp/user`,

        // 测试的信道服务地址
        tunnelUrl: `${host}/weapp/tunnel`,

        // 上传图片接口
        uploadUrl: `${host}/weapp/upload`,

        //导入电影列表
        moviesList: `${host}/weapp/movies`,

        //下载电影详情
        movieDetail: `${host}/weapp/movies/`,

        //下载评论列表
        commentList: `${host}/weapp/comment`,

        //下载评论详情
        commentDetail: `${host}/weapp/comment/`,

        //下载收藏列表
        collectionList: `${host}/weapp/collection`,

        //操作收藏列表
        collectionOperate: `${host}/weapp/collection`,

        iList: `${host}/weapp/comment-user`,

        //提交影评
        submit:`${host}/weapp/comment-sub`
    }
};

module.exports = config;
