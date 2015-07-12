-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: bbs
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cateID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catename` varchar(20) NOT NULL,
  `post_number` int(11) NOT NULL,
  `subject_number` int(11) NOT NULL,
  `cateadmin_UID` int(11) NOT NULL,
  PRIMARY KEY (`cateID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcateinfo`
--

DROP TABLE IF EXISTS `postcateinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postcateinfo` (
  `pcinfoID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subjectPostID` int(11) NOT NULL,
  `cate1_cateID` int(11) NOT NULL,
  `cate2_cateID` int(11) NOT NULL,
  `cate3_cateID` int(11) NOT NULL,
  PRIMARY KEY (`pcinfoID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcateinfo`
--

LOCK TABLES `postcateinfo` WRITE;
/*!40000 ALTER TABLE `postcateinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `postcateinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replypost`
--

DROP TABLE IF EXISTS `replypost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replypost` (
  `replyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reply_NO` int(10) NOT NULL,
  `reply_SID` int(11) NOT NULL,
  `reply_content` text NOT NULL,
  `reply_author` varchar(20) NOT NULL,
  `reply_UID` int(11) NOT NULL,
  `reply_addtime` datetime NOT NULL,
  `reply_addip` varchar(15) NOT NULL,
  `reply_likenumber` int(11) NOT NULL,
  `reply_dislikenumber` int(11) NOT NULL,
  PRIMARY KEY (`replyID`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replypost`
--

LOCK TABLES `replypost` WRITE;
/*!40000 ALTER TABLE `replypost` DISABLE KEYS */;
INSERT INTO `replypost` VALUES (1,0,10,'就是这样','千山',0,'2015-06-18 19:26:00','192.168.0.10',0,0),(2,0,6,'测试发表回复，这是2楼。','',0,'2015-06-18 19:27:14','192.168.0.10',0,0),(3,0,6,'洞妖洞妖，这里是洞拐，听到请回话。','吴大爷',0,'2015-06-18 19:46:10','192.168.0.10',0,0),(4,0,6,'洞妖洞妖，这里是洞拐，听到请回话。','吴大爷',0,'2015-06-18 19:46:10','192.168.0.10',0,0),(5,0,6,'洞妖洞妖，这里是洞拐，听到请回话。','吴大爷',0,'2015-06-18 19:46:11','192.168.0.10',0,0),(6,0,6,'洞妖洞妖，这里是洞拐，听到请回话。','吴大爷',0,'2015-06-18 19:46:11','192.168.0.10',0,0),(7,0,6,'有问题啊','',0,'2015-06-18 19:47:09','192.168.0.10',0,0),(8,0,10,'看我看我','',0,'2015-06-18 19:48:32','192.168.0.10',0,0),(9,0,6,'回7楼，有啥问题？','',0,'2015-06-18 20:01:13','192.168.0.10',0,0),(10,0,11,'就是这样','testuser2',0,'2015-06-18 21:52:51','192.168.0.10',0,0),(11,0,7,'估计得使用字符串截取方法。','testuser2',0,'2015-06-18 21:56:40','192.168.0.10',0,0),(12,0,1,'OK','testuser2',0,'2015-06-18 22:46:24','192.168.0.10',0,0),(13,0,10,'这个是要有的','testuser2',0,'2015-06-18 22:48:51','192.168.0.10',0,0),(14,0,13,'6.在主题列表项footer层增加最后回复人和回复时间；','testuser2',0,'2015-06-18 22:50:48','192.168.0.10',0,0),(15,0,13,'7. 使用富文本编辑器；','testuser2',0,'2015-06-18 23:02:45','192.168.0.10',0,0),(16,0,13,'8. 首页底部的帖子分类<br>\r\n9. 发表主题帖时的分类选择与添加','admin',0,'2015-06-19 05:34:12','192.168.0.10',0,0),(17,0,13,'10. 版主功能（版主使用）与系统管理功能（系统管理员使用）；<p>这两项任务是重点功能，包括：版主对主题帖的加精、置顶操作，对主题帖和回复贴的删除，对恶意用户账户的冻结、解冻，系统管理员对版主权限的批准、设置、取消；</p>','admin',0,'2015-06-19 05:36:53','192.168.0.10',0,0),(18,0,13,'11. 使用面包屑导航；<br>12. 增加主题帖与回复贴的搜索功能；<br>13. DEBUG；','admin',0,'2015-06-19 05:46:55','192.168.0.10',0,0),(19,0,13,'完成以上所列13项任务，这个BBS的核心需求就算满足了。基本上我们不需要再对BBS的基本功能做任何更改，除非我们拿去卖给客户的时候按客户要求适当修改。<br>\r\n同时，它也可以拿去作为一个完整的模块被整合到一个较大的项目之中。<hr>\r\n<p>之后我们的开发将主要进入模块功能的整合阶段，该BBS作为一个接口或模块和其他功能模块相互配合，比如可以在此基础上整合设计功能。</p>\r\n<p>你们将会在我的plog项目中看到它的出现。那时它将作为我的整个plog个中的一个小模块出现。</p>','admin',0,'2015-06-19 06:01:36','192.168.0.10',0,0),(20,0,13,'7楼：<br>\r\n比如可以在此基础上整合社交功能。','admin',0,'2015-06-19 06:03:23','192.168.0.10',0,0),(21,0,17,'<ul><li>GitHub</li></ul>','千山',0,'2015-06-19 10:59:45','192.168.0.10',0,0),(22,0,19,'我们可以列出一个史上最伟大的发明的排行榜，这个榜单一定是非常激动人心的。','岳千山',0,'2015-06-20 08:16:51','192.168.0.10',0,0),(23,0,23,'前一种是自然的高效的阅读方式; 后一种是复杂阅读，因为翻译阅读的底层实际上使用的是母语阅读与理解。','y.chainsan',0,'2015-06-21 07:41:28','192.168.0.10',0,0);
/*!40000 ALTER TABLE `replypost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectpost`
--

DROP TABLE IF EXISTS `subjectpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjectpost` (
  `subjectID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_NO` int(10) NOT NULL,
  `post_title` varchar(60) NOT NULL,
  `post_content` text NOT NULL,
  `post_author` varchar(20) NOT NULL,
  `postauthor_UID` int(11) NOT NULL,
  `category_number` int(11) NOT NULL,
  `post_level` tinyint(2) NOT NULL DEFAULT '0',
  `post_position` tinyint(2) NOT NULL DEFAULT '0',
  `addtime` datetime NOT NULL,
  `addip` varchar(15) NOT NULL,
  `lastreply_time` datetime NOT NULL,
  `lastreply_author` varchar(20) NOT NULL,
  `lastreply_UID` int(11) NOT NULL,
  `view_number` int(11) NOT NULL,
  `reply_number` int(11) NOT NULL,
  `like_number` int(11) NOT NULL,
  `dislike_number` int(11) NOT NULL,
  PRIMARY KEY (`subjectID`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectpost`
--

LOCK TABLES `subjectpost` WRITE;
/*!40000 ALTER TABLE `subjectpost` DISABLE KEYS */;
INSERT INTO `subjectpost` VALUES (1,0,'测试标题，Today\'s the day','ok?','testuser',0,0,0,0,'2015-06-16 20:17:56','::1','2015-06-18 22:46:24','testuser2',0,3,1,0,0),(2,0,'测试标题2','测试Neri2内容2','作者2',0,0,0,0,'2015-06-16 20:26:47','::1','2015-06-16 20:26:47','',0,2,0,0,0),(3,0,'测试标题3，测试标题3','<h2>测试内容3，测试内容3</h2>','',0,0,0,0,'2015-06-16 20:32:00','::1','2015-06-16 20:32:00','',0,2,0,0,0),(4,0,'今天是2015年6月16日，星期二','这里是杭州，中国','',0,0,0,0,'2015-06-16 21:07:15','::1','2015-06-16 21:07:15','',0,2,0,0,0),(5,0,'Welcome to Y. Chainsan\'s BBS!','great designs come from the real demand.','chainsan',0,0,0,0,'2015-06-16 21:09:46','::1','2015-06-16 21:09:46','',0,2,0,0,0),(6,0,'在留言板的基础上开发一个BBS。相对于留言板的单向信息发布功能，BBS能够实现用户之间留言的回复与互动。实现一个web应','在留言板的基础上开发一个BBS。相对于留言板的单向信息发布功能，BBS能够实现用户之间留言的回复与互动。实现一个web应用最基本的社交需求。','testuser',0,0,0,0,'2015-06-16 22:15:44','::1','2015-06-18 20:01:13','',0,10,7,0,0),(7,0,'更好的解决标题超出字数显示的问题','如题','岳千山',0,0,0,0,'2015-06-16 22:36:38','::1','2015-06-18 21:56:40','testuser2',0,3,1,0,0),(8,0,'上线测试：测试标题','测试内容','',0,0,0,0,'2015-06-16 23:02:24','192.168.0.10','2015-06-16 23:02:24','',0,1,0,0,0),(9,0,'项目开发练习：顺风租车系统','<p>\r\n<ol>\r\n<li>用户前台：提交用车信息；</li>\r\n<li>管理员后台：查看用户用车需求；</li>\r\n</ol>\r\n</p>','',0,0,0,0,'2015-06-17 21:52:49','192.168.0.10','2015-06-17 21:52:49','',0,2,0,0,0),(10,0,'在主题列表项footer层增加最后回复人和回复时间','rt','千山',0,0,0,0,'2015-06-18 19:25:42','192.168.0.10','2015-06-18 22:48:51','testuser2',0,3,3,0,0),(11,0,'写代码之前必须先把开发文档写清楚','思路清晰明确了，代码就很顺利','',0,0,0,0,'2015-06-18 21:04:53','192.168.0.10','2015-06-18 21:52:51','testuser2',0,2,1,0,0),(12,0,'测试帖','测试帖内容，测试内容，测试内容。测试内容。','testuser2',0,0,0,0,'2015-06-18 21:54:33','192.168.0.10','2015-06-18 21:54:33','',0,1,0,0,0),(13,0,'BBS系统接下来要解决的问题','<p>\r\n<ol>\r\n<li>不同楼层之间相互回复的解决；</li>\r\n<li>点击回复定位到文本输入框区域；</li>\r\n<li>帖子详情的分页问题；</li>\r\n<li>在主题帖详情页底部分页区域显示总回复数；</li>\r\n<li>在首页顶部和底部分别列出主题帖数和总贴数；</li>\r\n</ol>\r\n</p>','testuser2',0,0,0,0,'2015-06-18 22:04:18','192.168.0.10','2015-06-19 06:03:23','admin',0,24,7,0,0),(14,0,'什么是模板？','对于什么是模板这个问题，可以这样解释：模板是一组插入了HTML的PHP脚本或者说是插入了PHP脚本的HTML，通过这种插入的内容来表示变化的数据。例如，下面的代码就是一个简单模板文件的例子。\r\n。。。','千山',0,0,0,0,'2015-06-18 23:01:45','192.168.0.10','2015-06-18 23:01:45','',0,2,0,0,0),(15,0,'Good morning, everybody!','<h3>Today is Friday, the dragon boat festival is comming.</h3>\r\n<P>Have a nice holiday!</p>','admin',0,0,0,0,'2015-06-19 05:31:17','192.168.0.10','2015-06-19 05:31:17','',0,2,0,0,0),(16,0,'之前在留言板发表的一个留言：开发一个BBS','<h4>标题：下一步工作：开发一个BBS</h4>\r\n内容：<br>\r\n<p>\r\n     在留言板的基础上开发一个BBS。相对于留言板的单向信息发布功能，BBS能够实现用户之间留言的回复与互动。实现一个web应用最基本的社交需求。 \r\n</p>\r\n<p>\r\n新增功能：<br>\r\n<ol>\r\n<li>列表显示主题帖标题；</li>\r\n<li>浏览主题帖内容；</li>\r\n<li>回复主题帖；</li>\r\n<li>帖子按主题分类成为不同板块，但是一个弱板块BBS；</li>\r\n<li>当前所在页面位置导航；</li>\r\n<li>管理用户；</li>\r\n<li>用户（版主）对板块的管理；</li>\r\n<li>其他；</li>\r\n</ol>\r\n<br>\r\n岳千山  发表于 2015-06-12 10:46:50  来自 192.168.0.10</p>','admin',0,0,0,0,'2015-06-19 05:45:28','192.168.0.10','2015-06-19 05:45:28','',0,4,0,0,0),(17,0,'【开发】BBS需添加的版块','<p>\r\n暂列如下：<br>\r\n<ul>\r\n<li>设计</li>\r\n<li>Web开发</li>\r\n<li>PHP</li>\r\n<li>ThinkPHP</li>\r\n<li>Laravel</li>\r\n<li>MySQL</li>\r\n<li>JavaScript</li>\r\n<li>jQuery</li>\r\n<li>HTML</li>\r\n<li>CSS</li>\r\n<li>测试</li>\r\n<li>安全</li>\r\n<li>Linux</li>\r\n<li>其他</li>\r\n</ul>\r\n</p>','千山',0,0,0,0,'2015-06-19 10:55:18','192.168.0.10','2015-06-19 10:59:45','千山',0,8,1,0,0),(18,0,'【开发】在设计阶段，首要的任务是确定开发的边界','<p>所谓边界，就是确认哪些功能、哪些模块是不做的。也就是首先和需求方共同限定开发的界限，避免需求无休止的的增加。这个原则是一开始就要跟顾客声明的，并要求对方深刻理解这样做的原因和好处。这是项目顺利实施的首要前提条件。\r\n</p>\r\n<p>只有确定了边界，才可以对整个项目做整体的规划和问题分解，最终落实到具体的且数量确定的一个个小的任务。也就是量化代码的功能任务。这也是能够合理计算和确定大致施工期限的依据。</p>','岳千山',0,0,0,0,'2015-06-19 21:16:06','192.168.0.10','2015-06-19 21:16:06','',0,2,0,0,0),(19,0,'【设计】一切伟大的设计都是发明','<p>设计和发明在某些情况下其实是一回事，他们往往都是对现有的技术、可获得的产品（物）通过一种创新性的再加工（设计），然后按照这种设计思路制造出一种新的产品，这种产品往往比过往的已有产品更具有先进性，它可以提高人类在某个需求方面的易获得性，也就是生产和生活的效率。\r\n</p>\r\n<p>据报道乔布斯在发布iPhone手机的时候曾说，苹果重新发明了手机。他用了发明一词，实际上苹果公司只是对旧有的所谓的功能机做了一个非常优秀的再设计。所以说，在一些情况下，设计和发明几乎是同一个概念。</p>\r\n<p>以下所列事物都是非常优秀的设计，也可以说是非常优秀的发明。<br>\r\n<ul>\r\n<li>金字塔</li>\r\n<li>车轮</li>\r\n<li>私有制</li>\r\n<li>共和制</li>\r\n<li>汽车</li>\r\n<li>火柴</li>\r\n<li>电灯</li>\r\n<li>算盘</li>\r\n<li>计算机</li>\r\n<li>Java编程语言</li>\r\n<li>数据库</li>\r\n<li>互联网</li>\r\n<li>淘宝网</li>\r\n<li>。。。。。。</li>\r\n</ul>\r\n</p>','岳千山',0,0,0,0,'2015-06-20 08:11:51','192.168.0.10','2015-06-20 08:16:51','岳千山',0,3,1,0,0),(20,0,'【项目plog】对需求及功能的初步设想','<p>plog项目实际上是对现有的各种内容管理系统（CMS）的一种整合再设计。它要满足的需求是：对长文内容的存储展示、对短文内容的存储展示和对话题的讨论三大需求；<p/>\r\n<p>\r\n基于以上需求，该项目的基本功能应该有：<br>\r\n<ol>\r\n<li>用户管理；</li>\r\n<li>长文(文章)管理；</li>\r\n<li>短文(声音)管理；</li>\r\n<li>话题(讨论帖)管理；</li>\r\n<li>社交关系管理；</li>\r\n</ol>\r\n</p>\r\n<p>对应以上五个管理项，应该有至少五个大模块。</p>','岳千山',0,0,0,0,'2015-06-20 09:00:28','192.168.0.10','2015-06-20 09:00:28','',0,3,0,0,0),(21,0,'【开发】MVC是一种开发模式，或称为一种开发架构','<p>它是指在实现一个web应用的过程中，从外观表现（UI）、业务逻辑控制程序（BL）到数据交互（DA）的一种纵向的三层架构。它属于一种软件开发模式的设计。</p>\r\n<p>UI、BL和DA则分别对应MVC中的V、C和M。</p>','千山',0,0,0,0,'2015-06-20 09:24:29','192.168.0.10','2015-06-20 09:24:29','',0,2,0,0,0),(22,0,'【设计】中国互联网初期的五大类网站：社交论坛、下载站、网址导航站、电子商务站和资讯站','在中国互联网初期，不懂技术对这些爱折腾的年轻人而言不是什么问题。当时，网站按属性划分为五大类：社交论坛、下载站、网址导航站、电子商务站和资讯站，分别对应不同的系统开发工具。比如论坛对应Discuz！或者PHPWIND，下载站对应帝国系统，网址导航一般使用114，电商平台则可使用Discuz！开发的一个叫做ECMall的工具，再或者上海的商派，资讯站通常采用织梦系统。<br><p>来源：http://it.sohu.com/20150614/n414982812.shtml</p>','千山',0,0,0,0,'2015-06-20 19:25:39','192.168.0.10','2015-06-20 19:25:39','',0,2,0,0,0),(23,0,'【语言】两种阅读模式','一种是基于声音信号的阅读; 另一种是基于翻译的阅读。','y.chainsan',0,0,0,0,'2015-06-21 07:38:06','192.168.0.10','2015-06-21 07:41:28','y.chainsan',0,2,1,0,0);
/*!40000 ALTER TABLE `subjectpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` char(40) NOT NULL,
  `sex` tinyint(2) NOT NULL,
  `user_level` tinyint(2) NOT NULL,
  `email` varchar(50) NOT NULL,
  `registration_time` datetime NOT NULL,
  `registration_ip` varchar(15) NOT NULL,
  `user_status` tinyint(2) NOT NULL DEFAULT '0',
  `user_country` varchar(40) NOT NULL,
  `user_city` varchar(40) NOT NULL,
  `post_number` int(11) NOT NULL,
  `subject_number` int(11) NOT NULL,
  `reply_number` int(11) NOT NULL,
  `markedpost_number` int(11) NOT NULL,
  `follow_number` int(11) NOT NULL,
  `fans_number` int(11) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'testuser','45c571a156ddcef41351a713bcddee5ba7e95460',0,0,'test@test.com','2015-06-16 06:34:48','::1',0,'','',0,0,0,0,0,0),(2,'testuser','45c571a156ddcef41351a713bcddee5ba7e95460',0,0,'test1@test.com','2015-06-16 06:36:01','::1',0,'','',0,0,0,0,0,0),(3,'admin','fcd839d46e11f9a25ddc7f1c1c8bb94cb8fc8131',0,2,'simyue@sohu.com','2015-06-16 06:41:25','::1',0,'','',0,0,0,0,0,0),(4,'testuser2','7c4a8d09ca3762af61e59520943dc26494f8941b',0,0,'test2@test.com','2015-06-18 21:51:20','192.168.0.10',0,'','',0,0,0,0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-21 12:52:24
