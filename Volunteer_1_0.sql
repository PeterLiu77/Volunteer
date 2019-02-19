/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : volunteer

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-02-19 21:57:38
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
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `MANAGER_ID` varchar(40) NOT NULL,
  `MANAGER_NAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `ID_NUMBER` varchar(40) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL COMMENT '1启用0停用',
  PRIMARY KEY (`MANAGER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('101', 'aa', '39b390f0c57acd3bc1e62493264f5608', '阿旺', '410421199102051145', '1');
INSERT INTO `manager` VALUES ('102', 'bb', 'a09cba00825dc98b6e61cede7cb393f8', '小老板', '320926195511175276', '0');
INSERT INTO `manager` VALUES ('103', 'cc', '0fc457083cddf40a372db83c522f222a', '爱心哥', '120222198210244142', '1');
INSERT INTO `manager` VALUES ('104', 'dd', 'c8f58ece0bc2a57803a6d362aca2e49b', '奉献姐', '120001198406305236', '1');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `PROJECT_ID` varchar(40) NOT NULL,
  `MANAGER_ID` varchar(40) DEFAULT NULL,
  `PROJECT_NAME` varchar(50) DEFAULT NULL,
  `LOCATION` varchar(64) DEFAULT NULL,
  `BEGIN_TIME` datetime DEFAULT NULL,
  `LAST_TIME` int(11) DEFAULT NULL,
  `REMARK` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`),
  KEY `FK_Reference_7` (`MANAGER_ID`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`MANAGER_ID`) REFERENCES `manager` (`MANAGER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('001', '101', '阳光小学支教活动', '天津市武清区阳光小学', '2015-07-25 10:00:00', '6', '一次完美的支教活动');
INSERT INTO `project` VALUES ('002', '102', '廊坊市敬老院帮助老人活动', '河北省廊坊市夕阳红敬老院', '2019-12-25 14:00:00', '4', '帮助老人尽孝心');
INSERT INTO `project` VALUES ('003', '103', '周邓纪念馆引导任务', '天津市南开区周邓纪念馆', '2019-10-18 14:00:00', '8', '为人指路');
INSERT INTO `project` VALUES ('004', '103', '天津市图书馆图书整理任务', '天津市图书馆复康路分馆', '2019-07-25 14:00:00', '3', '一次开心的整理图书活动');
INSERT INTO `project` VALUES ('005', '103', '春天小学支教任务', '天津市和平区春天小学', '2019-06-17 09:00:00', '5', '春天小学帮扶活动');
INSERT INTO `project` VALUES ('006', '104', '天津火车站春运引导任务', '天津市红桥区天津西站', '2016-01-16 12:30:00', '6', '帮助需要帮助的人踏上回家的路');
INSERT INTO `project` VALUES ('007', '104', '营口道路口行人引导', '天津市和平区营口道', '2020-07-11 15:00:00', '7', '引导行人遵守交通规则，防止意外事故发生');

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
INSERT INTO `project_user` VALUES ('000', '001');
INSERT INTO `project_user` VALUES ('000', '002');
INSERT INTO `project_user` VALUES ('000', '003');
INSERT INTO `project_user` VALUES ('000', '004');
INSERT INTO `project_user` VALUES ('000', '005');
INSERT INTO `project_user` VALUES ('000', '006');
INSERT INTO `project_user` VALUES ('000', '007');
INSERT INTO `project_user` VALUES ('001', '001');
INSERT INTO `project_user` VALUES ('001', '002');
INSERT INTO `project_user` VALUES ('001', '003');
INSERT INTO `project_user` VALUES ('001', '004');
INSERT INTO `project_user` VALUES ('001', '005');
INSERT INTO `project_user` VALUES ('001', '007');
INSERT INTO `project_user` VALUES ('002', '004');
INSERT INTO `project_user` VALUES ('002', '001');
INSERT INTO `project_user` VALUES ('002', '006');
INSERT INTO `project_user` VALUES ('002', '002');
INSERT INTO `project_user` VALUES ('003', '002');
INSERT INTO `project_user` VALUES ('003', '005');
INSERT INTO `project_user` VALUES ('004', '005');
INSERT INTO `project_user` VALUES ('004', '004');
INSERT INTO `project_user` VALUES ('004', '003');
INSERT INTO `project_user` VALUES ('004', '001');
INSERT INTO `project_user` VALUES ('004', '007');
INSERT INTO `project_user` VALUES ('005', '006');
INSERT INTO `project_user` VALUES ('005', '002');
INSERT INTO `project_user` VALUES ('005', '007');
INSERT INTO `project_user` VALUES ('006', '004');
INSERT INTO `project_user` VALUES ('007', '002');
INSERT INTO `project_user` VALUES ('007', '004');
INSERT INTO `project_user` VALUES ('007', '003');
INSERT INTO `project_user` VALUES ('007', '007');
INSERT INTO `project_user` VALUES ('008', '007');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USER_ID` varchar(40) NOT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL COMMENT '1启用0停用',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('000', 'lpd', 'd048a8fb9049e7626d8beafd5c5cd7f3', '0');
INSERT INTO `user` VALUES ('001', 'aaa', '1c7e3d68884894ebeb954f75f865fb80', '1');
INSERT INTO `user` VALUES ('002', 'bbb', 'aaef77bfae9fb0c33045aaab549397b9', '1');
INSERT INTO `user` VALUES ('003', 'ccc', 'b4ed52f38c8df22a6c86bf0ea23f79d0', '1');
INSERT INTO `user` VALUES ('004', 'ddd', '0749a84909c59eb0518146829213ff78', '0');
INSERT INTO `user` VALUES ('005', 'eee', 'b444f7e2f6feffc87fdb9d73f331da57', '1');
INSERT INTO `user` VALUES ('006', 'fff', '585625336500c412f2a6bd81a510678b', '1');
INSERT INTO `user` VALUES ('007', 'ggg', '89ef9c7b688f8f72d2d0d2fdbe0a063b', '1');
INSERT INTO `user` VALUES ('008', 'hhh', '5f1b9704e0730f0d88dffb492f186068', '1');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `USER_ID` varchar(40) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `GENDER` char(1) DEFAULT NULL,
  `TELEPHONE` varchar(100) DEFAULT NULL,
  `PROVINCE` varchar(20) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('000', '超级管理员', '男', '15001011111', '天津', '南开');
INSERT INTO `user_info` VALUES ('001', '张同学', '男', '13801011111', '天津', '宝坻');
INSERT INTO `user_info` VALUES ('002', '王同学', '女', '13801014854', '河北', '唐山');
INSERT INTO `user_info` VALUES ('003', '李同学', '男', '15001018888', '黑龙江', '大庆');
INSERT INTO `user_info` VALUES ('004', '赵同学', '女', '15001010652', '吉林', '白城');
INSERT INTO `user_info` VALUES ('005', '陈同学', '女', '13501016666', '广东', '东莞');
INSERT INTO `user_info` VALUES ('006', '孙同学', '女', '15001011774', '新疆', '乌鲁木齐');
INSERT INTO `user_info` VALUES ('007', '朱同学', '男', '13201077771', '内蒙古', '呼和浩特');
INSERT INTO `user_info` VALUES ('008', '周同学', '女', '15001013365', '河南', '商丘');
