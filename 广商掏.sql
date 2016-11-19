-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.26 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 guangshangtao 的数据库结构
DROP DATABASE IF EXISTS `guangshangtao`;
CREATE DATABASE IF NOT EXISTS `guangshangtao` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `guangshangtao`;


-- 导出  表 guangshangtao.messages 结构
DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `shopid` int(11) NOT NULL COMMENT '物品ID外键',
  `userid` int(11) NOT NULL COMMENT '用户ID外键',
  `content` varchar(1024) NOT NULL COMMENT '留言内容',
  `username` varchar(1024) NOT NULL COMMENT '留言者姓名',
  `receivename` varchar(1024) NOT NULL COMMENT '接收留言',
  `Leave_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '留言时间',
  `Leave_status` int(11) NOT NULL DEFAULT '1' COMMENT '评论是否显示',
  PRIMARY KEY (`messageid`),
  KEY `shopid` (`shopid`),
  KEY `userid` (`userid`),
  CONSTRAINT `FK_messages_shopinfo` FOREIGN KEY (`shopid`) REFERENCES `shopinfo` (`shopid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_messages_userinfo` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 guangshangtao.orderinfo 结构
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE IF NOT EXISTS `orderinfo` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `ordertime` timestamp NULL DEFAULT NULL COMMENT '订单时间',
  `userid` int(11) DEFAULT NULL COMMENT '用户ID外键',
  `shopid` int(11) DEFAULT NULL COMMENT '物品ID外键',
  PRIMARY KEY (`orderid`),
  KEY `userid` (`userid`),
  KEY `shopid` (`shopid`),
  CONSTRAINT `FK_orderinfo_shopinfo` FOREIGN KEY (`shopid`) REFERENCES `shopinfo` (`shopid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_orderinfo_userinfo` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 guangshangtao.shopinfo 结构
DROP TABLE IF EXISTS `shopinfo`;
CREATE TABLE IF NOT EXISTS `shopinfo` (
  `shopid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `shopname` varchar(64) DEFAULT NULL COMMENT '商品名',
  `des` varchar(1024) DEFAULT NULL COMMENT '描述',
  `username` varchar(64) NOT NULL COMMENT '发布者姓名',
  `userphne` varchar(32) DEFAULT NULL COMMENT '用户电话',
  `category` varchar(64) NOT NULL COMMENT '商品类别',
  `picture` varchar(1024) NOT NULL COMMENT '图片',
  `price` varchar(64) DEFAULT NULL COMMENT '价格',
  `put_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `shop_status` int(11) NOT NULL DEFAULT '1' COMMENT '商品是否显示',
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 guangshangtao.userinfo 结构
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE IF NOT EXISTS `userinfo` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `school` varchar(64) NOT NULL COMMENT '学校',
  `court` varchar(64) DEFAULT NULL COMMENT '院系',
  `professional` varchar(64) DEFAULT NULL COMMENT '专业',
  `phone` varchar(64) DEFAULT NULL COMMENT '号码',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
