-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 12 月 12 日 20:50
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
  `add_time` date NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `document`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `document_type`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `user`
--


-- --------------------------------------------------------

--
-- 表的结构 `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `user_type`
--


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
