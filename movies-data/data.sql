-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-12-17 16:59:11
-- 服务器版本： 5.7.18
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cAuth`
--

-- --------------------------------------------------------

--
-- 表的结构 `cAppinfo`
--

CREATE TABLE `cAppinfo` (
  `appid` char(36) DEFAULT NULL,
  `secret` char(64) DEFAULT NULL,
  `ip` char(20) DEFAULT NULL,
  `login_duration` int(11) DEFAULT NULL,
  `qcloud_appid` char(64) DEFAULT NULL,
  `session_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `cAppinfo`
--

INSERT INTO `cAppinfo` (`appid`, `secret`, `ip`, `login_duration`, `qcloud_appid`, `session_duration`) VALUES
('wx76fce64e3f760b3f', '', '193.112.76.250', 1000, '1257710776', 2000);

-- --------------------------------------------------------

--
-- 表的结构 `collection`
--

CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `collection`
--

INSERT INTO `collection` (`id`, `user_id`, `comment_id`, `create_time`) VALUES
(7, 'onS05R35suOIeDoWrDhpZa0zbq4', 3, '2018-12-17 01:44:31'),
(15, 'onS0-5R35suOIeDoWrDhpZa0zbq4', 6, '2018-12-17 16:38:32'),
(17, 'onS0-5R35suOIeDoWrDhpZa0zbq4', 9, '2018-12-17 22:34:11'),
(20, 'onS0-5R35suOIeDoWrDhpZa0zbq4', 1, '2018-12-18 00:14:07');

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(5) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`id`, `movie_id`, `user_id`, `user_name`, `user_icon`, `type`, `content`, `duration`, `create_time`) VALUES
(1, 1, 'onS0-5SmClrcO5QZ0l745lhinDuQ', 'Decades', 'https://wx.qlogo.cn/mmopen/vi_32/xAH8B9iaRq0Tj8jT5YnibQkaicaH6VTsyC2AKKKK0vGskFzJsz8O1alSA4r27meTqics2COnicmfWx2wgC7SIyjlgdg/132', 'text', '洛基开局反野被拿一血，幻视下路送人头，雷神猥琐发育败方mvp，美队黑寡妇黑豹艰难保护我方水晶，冬兵战争猎鹰打支援，绯红守家，钢铁奇异小虫偷水晶失败被团灭，星爵演员，绿巨人开局心态崩溃了退出游戏。', NULL, '2018-12-15 21:36:03'),
(2, 1, 'onS0-5R35suOIeDoWrDhpZa0zbq4', 'HashtagCookie', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoFgQFEnqM1qzYGibkc71ibGZ8RzchyrhjAMWC43iaFPJXg4AnWJqgKXKazIaKX9bOXzrkicwosoOiaB0Q/132', 'text', '灭霸是一个有情怀的无产主义者，不惜牺牲此生最爱来整治这个混乱而拥挤不堪的宇宙，整治完了也不是要搞什么奴隶制自己当皇帝什么的，而是隐居深山老林看着夕阳感叹人生无常，说不定有空再种种菜养养鸡什么的。以随机的方式减去一半的人口也体现了其公平性和创新性，简直就是boss里面不可多得的楷模。', NULL, '2018-12-15 21:38:01'),
(3, 1, 'onS0-5WI6bJoNKnFsv2ZCZOZlIj0', '优兹', 'https://wx.qlogo.cn/mmopen/vi_32/8TTTz4m0ic2seCn0FuDTMdzwD7V5Sy1YqTNtOORK48PR5uQUxloPUzqRYUJtbtfw9ibzEcGtJ3JC3icENbjneoxxg/132', 'text', '《灭霸：后来我什么都有了，但是没有了我们》', NULL, '2018-12-15 21:41:28'),
(4, 2, 'onS0-5R35suOIeDoWrDhpZa0zbq4', 'HashtagCookie', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoFgQFEnqM1qzYGibkc71ibGZ8RzchyrhjAMWC43iaFPJXg4AnWJqgKXKazIaKX9bOXzrkicwosoOiaB0Q/132', 'text', '从他出现第一个镜头开始，Garry Oldman消失了，Winston Churchill复活了。Joe Wright以极其古典而不花哨的方式，成功的塑造了一个不被建制派同僚所认同，但最终在平民中找到力量的伟大领袖。这片真的太适合与Dunkirk作双片连映了。', NULL, '2018-12-15 21:54:29'),
(5, 3, 'onS0-5WI6bJoNKnFsv2ZCZOZlIj0', '优兹', 'https://wx.qlogo.cn/mmopen/vi_32/8TTTz4m0ic2seCn0FuDTMdzwD7V5Sy1YqTNtOORK48PR5uQUxloPUzqRYUJtbtfw9ibzEcGtJ3JC3icENbjneoxxg/132', 'audio', 'https://commit-1257710776.cos.ap-shanghai.myqcloud.com/01%20%23Cookie%20Jar.m4a', NULL, '2018-12-15 21:57:17'),
(6, 4, 'onS0-5WI6bJoNKnFsv2ZCZOZlIj0', '优兹', 'https://wx.qlogo.cn/mmopen/vi_32/8TTTz4m0ic2seCn0FuDTMdzwD7V5Sy1YqTNtOORK48PR5uQUxloPUzqRYUJtbtfw9ibzEcGtJ3JC3icENbjneoxxg/132', 'audio', 'https://commit-1257710776.cos.ap-shanghai.myqcloud.com/01.%20Rain.mp3', NULL, '2018-12-15 22:07:42'),
(7, 5, 'onS0-5WI6bJoNKnFsv2ZCZOZlIj0', '优兹', 'https://wx.qlogo.cn/mmopen/vi_32/8TTTz4m0ic2seCn0FuDTMdzwD7V5Sy1YqTNtOORK48PR5uQUxloPUzqRYUJtbtfw9ibzEcGtJ3JC3icENbjneoxxg/132', 'text', '我和我不想要的后半生，我和我不愿意和解的自己。你们都朝春天去，就留我在破碎里又丧又美丽。', NULL, '2018-12-15 22:12:15'),
(8, 5, 'onS0-5SmClrcO5QZ0l745lhinDuQ', 'Decades', 'https://wx.qlogo.cn/mmopen/vi_32/xAH8B9iaRq0Tj8jT5YnibQkaicaH6VTsyC2AKKKK0vGskFzJsz8O1alSA4r27meTqics2COnicmfWx2wgC7SIyjlgdg/132', 'text', '那些劝我们向前看的朋友，“不是所有人都可以和过去和解”。', NULL, '2018-12-15 22:12:15'),
(9, 6, 'onS0-5SmClrcO5QZ0l745lhinDuQ', 'Decades', 'https://wx.qlogo.cn/mmopen/vi_32/xAH8B9iaRq0Tj8jT5YnibQkaicaH6VTsyC2AKKKK0vGskFzJsz8O1alSA4r27meTqics2COnicmfWx2wgC7SIyjlgdg/132', 'text', '基本已帅呆。', NULL, '2018-12-15 22:12:15'),
(14, 8, 'onS0-5R35suOIeDoWrDhpZa0zbq4', 'HashtagCookie', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoFgQFEnqM1qzYGibkc71ibGZ8RzchyrhjAMWC43iaFPJXg4AnWJqgKXKazIaKX9bOXzrkicwosoOiaB0Q/132', 'text', '很好看，时常重温。', NULL, '2018-12-17 23:33:53');

-- --------------------------------------------------------

--
-- 表的结构 `cSessionInfo`
--

CREATE TABLE `cSessionInfo` (
  `open_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `session_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_info` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会话管理用户信息';

--
-- 转存表中的数据 `cSessionInfo`
--

INSERT INTO `cSessionInfo` (`open_id`, `uuid`, `skey`, `create_time`, `last_visit_time`, `session_key`, `user_info`) VALUES
('onS0-5R35suOIeDoWrDhpZa0zbq4', '3eb62819-fbf7-4743-aeaa-5ce93c906277', 'f3acc4b2564952fd5c7cd1425e5b8a40da37d719', '2018-11-16 21:38:53', '2018-12-17 16:56:50', 'pFdqkCztGg0Qdzr1kyTsXQ==', '{\"openId\":\"onS0-5R35suOIeDoWrDhpZa0zbq4\",\"nickName\":\"HashtagCookie\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Albania\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoFgQFEnqM1qzYGibkc71ibGZ8RzchyrhjAMWC43iaFPJXg4AnWJqgKXKazIaKX9bOXzrkicwosoOiaB0Q/132\",\"watermark\":{\"timestamp\":1545065809,\"appid\":\"wx76fce64e3f760b3f\"}}'),
('onS0-5SmClrcO5QZ0l745lhinDuQ', '47093fc7-738a-43b7-88fe-3b29294e9ce7', 'bec26e5a7ba672a21f9ab1dc9b11abf90f63aafe', '2018-12-15 12:21:17', '2018-12-15 12:21:17', 'aSjiwd2zTQxipPwY0mTNxA==', '{\"openId\":\"onS0-5SmClrcO5QZ0l745lhinDuQ\",\"nickName\":\"Decades\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Taian\",\"province\":\"Shandong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/xAH8B9iaRq0Tj8jT5YnibQkaicaH6VTsyC2AKKKK0vGskFzJsz8O1alSA4r27meTqics2COnicmfWx2wgC7SIyjlgdg/132\",\"watermark\":{\"timestamp\":1544876477,\"appid\":\"wx76fce64e3f760b3f\"}}'),
('onS0-5WI6bJoNKnFsv2ZCZOZlIj0', 'd4ab302b-10a4-413a-9b50-7f1933e7290a', '651c7e3e1da26b4b63dd610c0cf49f91635480ab', '2018-12-15 13:10:22', '2018-12-15 13:10:22', 'c6kCpL+jkDwiOGNBubgQvw==', '{\"openId\":\"onS0-5WI6bJoNKnFsv2ZCZOZlIj0\",\"nickName\":\"优兹\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Dongguan\",\"province\":\"Guangdong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/8TTTz4m0ic2seCn0FuDTMdzwD7V5Sy1YqTNtOORK48PR5uQUxloPUzqRYUJtbtfw9ibzEcGtJ3JC3icENbjneoxxg/132\",\"watermark\":{\"timestamp\":1544879421,\"appid\":\"wx76fce64e3f760b3f\"}}');

-- --------------------------------------------------------

--
-- 表的结构 `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` text,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `movies`
--

INSERT INTO `movies` (`id`, `title`, `image`, `category`, `description`, `create_time`) VALUES
(1, '复仇者联盟3：无限战争', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p2517753454.jpg', '动作 / 科幻 / 奇幻 / 冒险', '《复仇者联盟3：无限战争》是漫威电影宇宙10周年的历史性集结，将为影迷们带来史诗版的终极对决。面对灭霸突然发起的闪电袭击，复仇者联盟及其所有超级英雄盟友必须全力以赴，才能阻止他对全宇宙造成毁灭性的打击。', '2018-12-14 02:18:01'),
(2, '至暗时刻 Darkest Hour', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p2504277551.jpg', '剧情 / 传记 / 历史', '影片讲述英国首相丘吉尔在作为首相期间面临的最重要的审判：是向纳粹妥协做俘虏，还是团结人民群起反抗？丘吉尔将集结整个国家为自由奋战，试图改变世界历史进程，度过黎明前的黑暗。', '2018-12-14 02:18:01'),
(3, '挡不住的奇迹', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p863416171.jpg', '剧情 / 喜剧 / 音乐', '盖伊（汤姆·埃弗里特·斯科特 饰）平常就喜欢打鼓，正好当时著名乐队“奇迹”中急需一名鼓手参加表演，于是他鼓起勇气前往应征。盖伊的表现得到了认同，加入了乐队后便密锣紧鼓的加紧训练。演出时，乐队演奏了著名的原创歌曲，可是盖伊却打错了节奏。阴差阳错的时，除了主唱吉米（强纳·森萨奇 饰）之外，其余的人也都喜欢了这个被奏错的版本。这件事成为了吉米与盖伊之间不和的导火线。这首歌很快在经纪人（汤姆·汉克斯 饰）的力捧下成为了冠军歌，但盖伊与吉米之间的矛盾也因为歌迷菲伊的原因越来越深。 到最后他们之间的矛盾能否化解，乐队又能否继续走红呢？', '2018-12-14 02:18:01'),
(4, '爱乐之城 La La Land', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p2425658570.jpg', '剧情 / 爱情 / 歌舞', '米娅（艾玛·斯通 Emma Stone 饰）渴望成为一名演员，但至今她仍旧只是片场咖啡厅里的一名平凡的咖啡师，尽管不停的参加着大大小小的试镜，但米娅收获的只有失败。某日，在一场派对之中，米娅邂逅了名为塞巴斯汀（瑞恩·高斯林 Ryan Gosling 饰）的男子，起初两人之间产生了小小的矛盾，但很快，米娅便被塞巴斯汀身上闪耀的才华以及他对爵士乐的纯粹追求所吸引，最终两人走到了一起。在塞巴斯汀的鼓励下，米娅辞掉了咖啡厅的工作，专心为自己写起了剧本，与此同时，塞巴斯汀为了获得一份稳定的收入，加入了一支流行爵士乐队，开始演奏自己并不喜欢的现代爵士乐，没想到一炮而红。随着时间的推移，努力追求梦想的两人，彼此之间的距离却越来越远，在理想和感情之间，他们必须做出选择。', '2018-12-14 02:18:01'),
(5, '海边的曼彻斯特', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p2496940327.jpg', '剧情 / 家庭', '李（卡西·阿弗莱克 Casey Affleck 饰）是一名颓废压抑的修理工，在得知哥哥乔伊（凯尔·钱德勒 Kyle Chandler 饰）去世的消息后，李回到了故乡——海边的曼彻斯特处理乔伊的后事。根据乔伊的遗嘱，李将会成为乔伊的儿子帕特里克（卢卡斯·赫奇斯 Lucas Hedg es 饰）的监护人，李打算将帕特里克带回波士顿，但很显然帕特里克并不愿意离开家乡和朋友们，但李亦不愿在这片伤心地久留。原来，曼彻斯特埋藏着李的一段绝望的回忆，他的过失使得两个女儿葬身火海，妻子兰迪（米歇尔·威廉姆斯 Michelle Williams 饰）亦因此而离开了他。此次重回故乡，李再度见到了已经再婚并且即将做妈妈的兰迪，与此同时，帕特里克那失踪已久的母亲艾丽斯（格瑞辰·摩尔 Gretchen Mol 饰）亦联系上了帕特里克，希望他能够成为她的新家庭中的一员。', '2018-12-14 02:18:01'),
(6, '热血警探', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p449619623.jpg', '喜剧 / 动作', '尼古拉斯•安奇尔（西蒙•佩吉Simon Pegg 饰）在伦敦担任高级巡警，抓贼破案似乎是他最大的乐趣。为此他成为警局中最敬业最能干的警员。但这却招致了警长的妒嫉，可怜的尼古拉斯被调至一个偏僻平静的小镇当警察。小镇已经几十年没有过恶性犯罪事件。尼古拉斯在那里过得相当郁闷，他觉得自己的擒贼本领没有施展空间。更令他烦恼的是，镇里警察局局长儿子丹尼•巴特曼（尼克•弗罗斯特 Nick Frost 饰）也来凑热闹，成为他的搭档。这个新搭档麻烦至极，整天询问大城市的警员经历。正在尼古拉斯烦心于镇里鸡毛蒜皮的事务和身边的苯搭档时，镇里却发生了一桩案件，让尼古拉斯•嗅到了大展拳脚的机会，惊心动魄的战役开始了。', '2018-12-14 02:18:01'),
(7, '爱在黎明破晓前', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p452582315.jpg', '剧情 / 爱情', '美国青年杰西（伊桑·霍克 Ethan Hawke 饰）在火车上偶遇了法国女学生塞琳娜（朱莉·德尔佩 Julie Delpy 饰），两人在火车上交谈甚欢。当火车到达维也纳时，杰西盛情邀请塞琳娜一起在维也纳游览一番，即使杰西翌日便要坐飞机离开。与杰西一见钟情的塞琳娜接受了杰西的邀请。他们一边游览城市，一边谈论着彼此的过去 ，彼此对生活的感想，两人了解越加深刻。他们非常珍惜这美妙的晚上，这对恋人一起经历了很多浪漫的经历因为他们约定在半年后再见，而此次约会将会在日出之间结束……', '2018-12-14 02:18:01'),
(8, '美丽心灵', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p1665997400.jpg', ' 剧情 / 传记', '小约翰•福布斯-纳什（拉塞尔•克劳）在念研究生时，便发表了著名的博弈理论，该理论虽只有短短26页，却在经济、军事等领域产生了深远的影响。但就在小约翰•福布斯-纳什蜚声国际时，他的出众直觉因为精神分裂症受到困扰，然而这并没阻止他向学术上的最高层进军的步伐，在深爱他的妻子艾丽西亚（珍妮弗•康纳利）的鼓励和帮助下，他走得虽然艰缓，却始终没有停步，而最终，凭借十几年的不懈努力和顽强意志，他如愿以偿。', '2018-12-14 02:18:01'),
(9, '当幸福来敲门', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p2220721286.jpg', '剧情 / 家庭 / 传记', '克里斯•加纳（威尔·史密斯 Will Smith 饰）用尽全部积蓄买下了高科技治疗仪，到处向医院推销，可是价格高昂，接受的人不多。就算他多努力都无法提供一个良好的生活环境给妻儿，妻子（桑迪·牛顿 Thandie Newton 饰）最终选择离开家。从此他带着儿子克里斯托夫（贾登·史密斯 Jaden Smith 饰）相依为命。克里斯好不容易争取回来一个股票投资公司实习的机会，就算没有报酬，成功机会只有百分之五，他仍努力奋斗，儿子是他的力量。他看尽白眼，与儿子躲在地铁站里的公共厕所里，住在教堂的收容所里…… 他坚信，幸福明天就会来临。', '2018-12-14 02:18:01'),
(10, '肖申克的救赎', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p480747492.jpg', '剧情 / 犯罪', '20世纪40年代末，小有成就的青年银行家安迪（蒂姆·罗宾斯 Tim Robbins 饰）因涉嫌杀害妻子及她的情人而锒铛入狱。在这座名为肖申克的监狱内，希望似乎虚无缥缈，终身监禁的惩罚无疑注定了安迪接下来灰暗绝望的人生。未过多久，安迪尝试接近囚犯中颇有声望的瑞德（摩根·弗里曼 Morgan Freeman 饰），请求对方帮自己搞来小锤子。以此为契机，二人逐渐熟稔，安迪也仿佛在鱼龙混杂、罪恶横生、黑白混淆的牢狱中找到属于自己的求生之道。他利用自身的专业知识，帮助监狱管理层逃税、洗黑钱，同时凭借与瑞德的交往在犯人中间也渐渐受到礼遇。表面看来，他已如瑞德那样对那堵高墙从憎恨转变为处之泰然，但是对自由的渴望仍促使他朝着心中的希望和目标前进。而关于其罪行的真相，似乎更使这一切朝前推进了一步……', '2018-12-14 02:18:01'),
(11, '三傻大闹宝莱坞', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p579729551.jpg', '剧情 / 喜剧 / 爱情 / 歌舞', '本片根据印度畅销书作家奇坦·巴哈特（Chetan Bhagat）的处女作小说《五点人》（Five Point Someone）改编而成。法兰（马德哈万 R Madhavan 饰）、拉杜（沙曼·乔希 Sharman Joshi 饰）与兰乔（阿米尔·汗 Aamir Khan 饰）是皇家工程学院的学生，三人共居一室，结为好友。在以严格著称的学院里，兰乔是个非常与众不同的学生，他不死记硬背，甚至还公然顶撞校长“病毒”（波曼·伊拉尼 Boman Irani 饰），质疑他的教学方法。他不仅鼓动法兰与拉杜去勇敢追寻理想，还劝说校长的二女儿碧雅（卡琳娜·卡普 Kareena Kapoor 饰）离开满眼铜臭的未婚夫。兰乔的特立独行引起了模范学生“消音器”（奥米·维嘉 Omi Vaidya 饰）的不满，他约定十年后再与兰乔一决高下，看哪种生活方式更能取得成功。', '2018-12-14 02:18:01'),
(12, '千与千寻', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p1606727862.jpg', '剧情 / 动画 / 奇幻', '千寻和爸爸妈妈一同驱车前往新家，在郊外的小路上不慎进入了神秘的隧道——他们去到了另外一个诡异世界—一个中世纪的小镇。远处飘来食物的香味，爸爸妈妈大快朵颐，孰料之后变成了猪！这时小镇上渐渐来了许多样子古怪、半透明的人。千寻仓皇逃出，一个叫小白的人救了他，喂了她阻止身体消 失的药，并且告诉她怎样去找锅炉爷爷以及汤婆婆，而且必须获得一分工作才能不被魔法变成别的东西。千寻在小白的帮助下幸运地获得了一份在浴池打杂的工作。渐渐她不再被那些怪模怪样的人吓倒，并从小玲那儿知道了小白是凶恶的汤婆婆的弟子。 一次，千寻发现小白被一群白色飞舞的纸人打伤，为了救受伤的小白，她用河神送给她的药丸驱出了小白身体内的封印以及守封印的小妖精，但小白还是没有醒过来。 为了救小白，千寻又踏上了她的冒险之旅。', '2018-12-14 02:18:01'),
(13, '机器人总动员', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p1461851991.jpg', '爱情 / 科幻 / 动画 / 冒险', '公元2805年，人类文明高度发展，却因污染和生活垃圾大量增加使得地球不再适于人类居住。地球人被迫乘坐飞船离开故乡，进行一次漫长无边的宇宙之旅。临行前他们委托Buynlarge的公司对地球垃圾进行清理，该公司开发了名为WALL·E（Waste Allocation Loa d Lifters – Earth 地球废品分装员）的机器人担当此重任。这些机器人按照程序日复一日、年复一年辛勤工作，但随着时间的流逝和恶劣环境的侵蚀，WALL·E们接连损坏、停止运动。最后只有一个仍在进行这项似乎永无止境的工作。经历了漫长的岁月，它开始拥有了自己的意识。它喜欢将收集来的宝贝小心翼翼藏起，喜欢收工后看看几百年前的歌舞片，此外还有一只蟑螂朋友作伴。直到有一天，一艘来自宇宙的飞船打破了它一成不变的生活……', '2018-12-14 02:18:01'),
(14, '死亡诗社', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p1910824340.jpg', '剧情', '威尔顿预备学院以其沉稳凝重的教学风格和较高的升学率闻名，作为其毕业班的学生，理想就是升入名校。新学期文学老师约翰·基汀（罗宾·威廉姆斯 饰）的到来如同一阵春风，一反传统名校的严肃刻板。基汀带学生们在校史楼内聆听死亡的声音，反思生的意义 ；让男生们在绿茵场上宣读自己的理想；鼓励学生站在课桌上，用新的视角俯瞰世界。老师自由发散式的哲学思维让学生内心产生强烈的共鸣，他们渐渐学会自己思考与求索，勇敢的追问人生的路途，甚至违反门禁，成立死亡诗社，在山洞里击节而歌！基汀教授、基汀老师、基汀队长，他的教育宛若春风化雨，润物无声的留在每个人心里…', '2018-12-14 02:18:01'),
(15, '星际穿越', '	https://movie-1257710776.cos.ap-shanghai.myqcloud.com/p2206088801.jpg', '剧情 / 科幻 / 冒险', '近未来的地球黄沙遍野，小麦、秋葵等基础农作物相继因枯萎病灭绝，人类不再像从前那样仰望星空，放纵想象力和灵感的迸发，而是每日在沙尘暴的肆虐下倒数着所剩不多的光景。在家务农的前NASA宇航员库珀（马修·麦康纳 Matthew McConaughey 饰）接连在女儿墨菲（麦肯吉·弗依 Mackenzie Foy 饰）的书房发现奇怪的重力场现象，随即得知在某个未知区域内前NASA成员仍秘密进行一个拯救人类的计划。多年以前土星附近出现神秘虫洞，NASA借机将数名宇航员派遣到遥远的星系寻找适合居住的星球。在布兰德教授（迈克尔·凯恩 Michael Caine 饰）的劝说下，库珀忍痛告别了女儿，和其他三名专家教授女儿艾米莉亚·布兰德（安妮·海瑟薇 Anne Hathaway 饰）、罗米利（大卫·吉雅西 David Gyasi 饰）、多伊尔（韦斯·本特利 Wes Bentley 饰）搭乘宇宙飞船前往目前已知的最有希望的三颗星球考察。他们穿越遥远的星系银河，感受了一小时七年光阴的沧海桑田，窥见了未知星球和黑洞的壮伟与神秘。在浩瀚宇宙的绝望而孤独角落，总有一份超越了时空的笃定情怀将他们紧紧相连……', '2018-12-14 02:18:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `cSessionInfo`
--
ALTER TABLE `cSessionInfo`
  ADD PRIMARY KEY (`open_id`),
  ADD KEY `openid` (`open_id`) USING BTREE,
  ADD KEY `skey` (`skey`) USING BTREE;

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
