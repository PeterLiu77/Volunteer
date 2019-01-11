/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : volunteer

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-01-11 16:41:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `FEEDBACK_ID` varchar(40) NOT NULL,
  `USER_ID` varchar(40) DEFAULT NULL,
  `INPUT_BY` varchar(20) DEFAULT NULL,
  `INPUT_TIME` datetime DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `CONTENT` longtext,
  `CLASS_TYPE` char(1) DEFAULT NULL COMMENT '1管理2安全3建议4其他',
  `TEL` varchar(20) DEFAULT NULL,
  `STATE` char(1) DEFAULT NULL COMMENT '0未处理1已处理',
  PRIMARY KEY (`FEEDBACK_ID`),
  KEY `FK_Reference_5` (`USER_ID`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `MODULE_ID` varchar(40) NOT NULL,
  `PARENT_ID` varchar(40) DEFAULT NULL,
  `PARENT_NAME` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `LAYER_NUM` int(11) DEFAULT NULL,
  `IS_LEAF` int(11) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL COMMENT '1启用0停用',
  `REMARK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `PROJECT_ID` varchar(40) NOT NULL,
  `USER_ID` varchar(40) DEFAULT NULL COMMENT '负责人ID',
  `PROJECT_NAME` varchar(50) DEFAULT NULL,
  `LOCATION` varchar(64) DEFAULT NULL,
  `BEGIN_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL COMMENT '1未开始2正在报名3已报满4已结束',
  `REMARK` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`),
  KEY `FK_Reference_7` (`USER_ID`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for project_user
-- ----------------------------
DROP TABLE IF EXISTS `project_user`;
CREATE TABLE `project_user` (
  `USER_ID` varchar(40) DEFAULT NULL,
  `PROJECT_ID` varchar(40) DEFAULT NULL,
  KEY `FK_Reference_8` (`USER_ID`),
  KEY `FK_Reference_9` (`PROJECT_ID`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`PROJECT_ID`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_user
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ROLE_ID` varchar(40) NOT NULL COMMENT '1志愿者2负责人3管理员',
  `NAME` varchar(30) DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '志愿者', '志愿者的role_id是1');
INSERT INTO `role` VALUES ('2', '负责人', '项目负责人的role_id是2');
INSERT INTO `role` VALUES ('3', '管理员', '管理员的role_id是3');

-- ----------------------------
-- Table structure for role_module
-- ----------------------------
DROP TABLE IF EXISTS `role_module`;
CREATE TABLE `role_module` (
  `MODULE_ID` varchar(40) DEFAULT NULL,
  `ROLE_ID` varchar(40) DEFAULT NULL,
  KEY `FK_Reference_27` (`ROLE_ID`),
  KEY `FK_Reference_28` (`MODULE_ID`),
  CONSTRAINT `FK_Reference_28` FOREIGN KEY (`MODULE_ID`) REFERENCES `module` (`MODULE_ID`),
  CONSTRAINT `FK_Reference_27` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_module
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USER_ID` varchar(40) NOT NULL,
  `ROLE_ID` varchar(40) DEFAULT NULL,
  `USER_NAME` varchar(50) NOT NULL COMMENT '不能重复,可为中文',
  `PASSWORD` varchar(64) DEFAULT NULL COMMENT 'shiro MD5密码32位',
  `STATE` int(11) DEFAULT NULL COMMENT '1启用0停用',
  PRIMARY KEY (`USER_ID`),
  KEY `FK_Reference_10` (`ROLE_ID`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('001', '1', 'z1', '123', '1');
INSERT INTO `user` VALUES ('002', '1', 'z2', '123', '1');
INSERT INTO `user` VALUES ('003', '1', 'z3', '123', '0');
INSERT INTO `user` VALUES ('004', '1', 'z4', '123', '1');
INSERT INTO `user` VALUES ('011', '2', 'f1', '123', '0');
INSERT INTO `user` VALUES ('012', '2', 'f2', '123', '1');
INSERT INTO `user` VALUES ('013', '2', 'f4', '123', '1');
INSERT INTO `user` VALUES ('021', '3', 'g1', '123', '1');
INSERT INTO `user` VALUES ('022', '3', 'g2', '123', '1');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `USER_ID` varchar(40) NOT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '不能重复,可为中文',
  `PASSWORD` varchar(64) DEFAULT NULL COMMENT 'shiro MD5密码32位',
  `STATE` int(11) DEFAULT NULL COMMENT '1启用0停用',
  `NAME` varchar(20) DEFAULT NULL,
  `GENDER` char(1) DEFAULT NULL,
  `TELEPHONE` varchar(100) DEFAULT NULL,
  `PROVINCE` varchar(20) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `SCHOOL` varchar(40) DEFAULT NULL,
  `HOME` varchar(80) DEFAULT NULL,
  `VOLUNTEER_TIME` int(11) DEFAULT NULL,
  `PARTY` varchar(80) DEFAULT NULL,
  `VOLUNTEER_TYPE` char(10) DEFAULT NULL,
  `REMARK` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
