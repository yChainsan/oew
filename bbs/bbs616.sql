-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 06 月 16 日 09:36
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `bbs`
--
CREATE DATABASE IF NOT EXISTS `bbs` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bbs`;

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `cateID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catename` varchar(20) NOT NULL,
  `post_number` int(11) NOT NULL,
  `subject_number` int(11) NOT NULL,
  `cateadmin_UID` int(11) NOT NULL,
  PRIMARY KEY (`cateID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `postcateinfo`
--

CREATE TABLE IF NOT EXISTS `postcateinfo` (
  `pcinfoID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subjectPostID` int(11) NOT NULL,
  `cate1_cateID` int(11) NOT NULL,
  `cate2_cateID` int(11) NOT NULL,
  `cate3_cateID` int(11) NOT NULL,
  PRIMARY KEY (`pcinfoID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `replypost`
--

CREATE TABLE IF NOT EXISTS `replypost` (
  `replyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reply_NO` int(10) NOT NULL,
  `reply_SID` int(11) NOT NULL,
  `reply_content` text NOT NULL,
  `reply_UID` int(11) NOT NULL,
  `reply_addtime` datetime NOT NULL,
  `reply_addip` varchar(15) NOT NULL,
  `reply_likenumber` int(11) NOT NULL,
  `reply_dislikenumber` int(11) NOT NULL,
  PRIMARY KEY (`replyID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `subjectpost`
--

CREATE TABLE IF NOT EXISTS `subjectpost` (
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
  `lastreply_UID` int(11) NOT NULL,
  `view_number` int(11) NOT NULL,
  `reply_number` int(11) NOT NULL,
  `like_number` int(11) NOT NULL,
  `dislike_number` int(11) NOT NULL,
  PRIMARY KEY (`subjectID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `subjectpost`
--

INSERT INTO `subjectpost` (`subjectID`, `subject_NO`, `post_title`, `post_content`, `post_author`, `postauthor_UID`, `category_number`, `post_level`, `post_position`, `addtime`, `addip`, `lastreply_time`, `lastreply_UID`, `view_number`, `reply_number`, `like_number`, `dislike_number`) VALUES
(1, 0, 'test', 'test', '', 0, 0, 0, 0, '2015-06-16 16:58:40', '127.0.0.1', '0000-00-00 00:00:00', 0, 0, 0, 0, 0),
(2, 0, 'test2', 'test test test test', '', 0, 0, 0, 0, '2015-06-16 17:03:57', '127.0.0.1', '2015-06-16 17:03:57', 0, 0, 0, 0, 0),
(3, 0, 'test title 3', 'test', 'test user', 0, 0, 0, 0, '2015-06-16 17:05:48', '127.0.0.1', '2015-06-16 17:05:48', 0, 0, 0, 0, 0),
(4, 0, 'admin test title', 'admin test post content', 'admin', 0, 0, 0, 0, '2015-06-16 17:09:09', '127.0.0.1', '2015-06-16 17:09:09', 0, 0, 0, 0, 0),
(5, 0, 'testuser''s post', 'testuser''s content', 'test', 0, 0, 0, 0, '2015-06-16 17:10:32', '127.0.0.1', '2015-06-16 17:10:32', 0, 0, 0, 0, 0),
(6, 0, '我的测试帖', '啊啊啊是的', 'test', 0, 0, 0, 0, '2015-06-16 17:27:16', '127.0.0.1', '2015-06-16 17:27:16', 0, 0, 0, 0, 0),
(7, 0, '测试返回是否保留输入内容', '测试内容', 'test', 0, 0, 0, 0, '2015-06-16 17:34:43', '127.0.0.1', '2015-06-16 17:34:43', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`userID`, `username`, `password`, `sex`, `user_level`, `email`, `registration_time`, `registration_ip`, `user_status`, `user_country`, `user_city`, `post_number`, `subject_number`, `reply_number`, `markedpost_number`, `follow_number`, `fans_number`) VALUES
(1, 'testuser', '45c571a156ddcef41351a713bcddee5ba7e95460', 0, 0, '', '2015-06-15 16:37:19', '127.0.0.1', 0, '', '', 0, 0, 0, 0, 0, 0),
(2, 'test', '45c571a156ddcef41351a713bcddee5ba7e95460', 0, 0, 'test@test.com', '2015-06-15 16:40:49', '127.0.0.1', 0, '', '', 0, 0, 0, 0, 0, 0),
(3, 'test', '45c571a156ddcef41351a713bcddee5ba7e95460', 0, 0, 'test1@test.com', '2015-06-15 16:50:07', '127.0.0.1', 0, '', '', 0, 0, 0, 0, 0, 0),
(4, 'admin', 'fcd839d46e11f9a25ddc7f1c1c8bb94cb8fc8131', 0, 2, 'simyue@sohu.com', '2015-06-15 17:09:13', '127.0.0.1', 0, '', '', 0, 0, 0, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
