-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 12 月 17 日 12:54
-- 服务器版本: 5.5.8
-- PHP 版本: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `documents_manager`
--

-- --------------------------------------------------------

--
-- 表的结构 `attachment`
--

CREATE TABLE IF NOT EXISTS `attachment` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `upload_time` date NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `document_id` (`document_id`),
  KEY `uploader_id` (`uploader_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `attachment`
--


-- --------------------------------------------------------

--
-- 表的结构 `attachment_type`
--

CREATE TABLE IF NOT EXISTS `attachment_type` (
  `attachment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`attachment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `attachment_type`
--


-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `problem` text COLLATE utf8_unicode_ci,
  `idea` text COLLATE utf8_unicode_ci,
  `experiment` text COLLATE utf8_unicode_ci,
  `contribution` text COLLATE utf8_unicode_ci,
  `improvement` text COLLATE utf8_unicode_ci,
  `is_finished` tinyint(1) NOT NULL DEFAULT '0',
  `finish_time` date DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `rank_time` date DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `comment`
--


-- --------------------------------------------------------

--
-- 表的结构 `configuration`
--

CREATE TABLE IF NOT EXISTS `configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `conf_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `conf_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `configuration`
--


-- --------------------------------------------------------

--
-- 表的结构 `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `pages` int(11) NOT NULL,
  `abstract` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publication` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `volume` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `book_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isbn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avr_rank` double DEFAULT NULL,
  PRIMARY KEY (`document_id`),
  KEY `type_id` (`type_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `document`
--

INSERT INTO `document` (`document_id`, `type_id`, `user_id`, `add_time`, `title`, `author`, `year`, `pages`, `abstract`, `keywords`, `publisher`, `url`, `publication`, `city`, `volume`, `issue`, `editor`, `book_name`, `school_name`, `doi`, `isbn`, `avr_rank`) VALUES
(1, 1, 2, '2013-12-16 00:00:00', 'Book1', 'xxx', '2011', 100, '.........................', 'keyword1', 'abc', 'http://example.com', NULL, NULL, NULL, NULL, 'xx', NULL, NULL, NULL, '1111', NULL),
(2, 1, 2, '2013-12-17 00:00:00', 'Book2', 'xx', '1991', 11, '111111111', 'k2', '11', '111', NULL, NULL, NULL, NULL, '11', NULL, NULL, NULL, '111111', NULL),
(3, 4, 2, '2013-12-17 00:00:00', 'Conference1', '1', '1991', 11, '1111111', '11', '11', '11', '11', '11', NULL, NULL, NULL, NULL, NULL, '11111', NULL, NULL),
(4, 6, 2, '2013-12-17 12:39:37', 'report1', '1', '2000', 1, '11', '11', '111', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 7, 2, '2013-12-17 12:51:49', '1', '1', '1', 1, '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `document_relation`
--

CREATE TABLE IF NOT EXISTS `document_relation` (
  `document_relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`document_relation_id`),
  KEY `document_id` (`document_id`),
  KEY `relation_id` (`relation_id`),
  KEY `reference_id` (`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `document_relation`
--


-- --------------------------------------------------------

--
-- 表的结构 `document_tag`
--

CREATE TABLE IF NOT EXISTS `document_tag` (
  `document_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`document_tag_id`),
  KEY `document_id` (`document_id`),
  KEY `tag_id` (`tag_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `document_tag`
--


-- --------------------------------------------------------

--
-- 表的结构 `document_type`
--

CREATE TABLE IF NOT EXISTS `document_type` (
  `document_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`document_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `document_type`
--

INSERT INTO `document_type` (`document_type_id`, `name`, `description`) VALUES
(1, '图书', 'editor:编辑,isbn:ISBN'),
(2, '图书章节', 'editor:编辑,book_name:图书名'),
(3, '期刊', 'publication:出处,volume:卷,issue:期,doi:DOI'),
(4, '会议', 'publication:出处,city:城市,doi:DOI'),
(5, '学位论文', 'school_name:学校名'),
(6, '技术报告', NULL),
(7, '在线资源', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `relation`
--

CREATE TABLE IF NOT EXISTS `relation` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `relation`
--


-- --------------------------------------------------------

--
-- 表的结构 `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` date NOT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `tag`
--


-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `name` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` date NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `type_id`, `name`, `email`, `phone`, `reg_date`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 'pan', 'pyqiverson@sina.com', '1', '2013-12-14'),
(2, 'xiaop', '5c95434b5f2559fa417ba86c3d9528bc', 2, NULL, NULL, NULL, '2013-12-15'),
(3, 'ruanhao', 'c4ca4238a0b923820dcc509a6f75849b', 4, NULL, NULL, NULL, '2013-12-15'),
(4, 'feil', 'c4ca4238a0b923820dcc509a6f75849b', 2, NULL, NULL, NULL, '2013-12-15'),
(5, 'feil1', 'c4ca4238a0b923820dcc509a6f75849b', 3, NULL, NULL, NULL, '2013-12-15');

-- --------------------------------------------------------

--
-- 表的结构 `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `user_type`
--

INSERT INTO `user_type` (`user_type_id`, `name`) VALUES
(1, '管理员'),
(2, '研究生'),
(3, '博士生'),
(4, '导师');

--
-- 限制导出的表
--

--
-- 限制表 `attachment`
--
ALTER TABLE `attachment`
  ADD CONSTRAINT `attachment_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`),
  ADD CONSTRAINT `attachment_ibfk_2` FOREIGN KEY (`uploader_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `attachment_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `attachment_type` (`attachment_type_id`);

--
-- 限制表 `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`);

--
-- 限制表 `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `document_type` (`document_type_id`),
  ADD CONSTRAINT `document_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- 限制表 `document_relation`
--
ALTER TABLE `document_relation`
  ADD CONSTRAINT `document_relation_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`),
  ADD CONSTRAINT `document_relation_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `document` (`document_id`),
  ADD CONSTRAINT `document_relation_ibfk_3` FOREIGN KEY (`relation_id`) REFERENCES `relation` (`relation_id`);

--
-- 限制表 `document_tag`
--
ALTER TABLE `document_tag`
  ADD CONSTRAINT `document_tag_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`),
  ADD CONSTRAINT `document_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`),
  ADD CONSTRAINT `document_tag_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- 限制表 `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- 限制表 `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `user_type` (`user_type_id`);
