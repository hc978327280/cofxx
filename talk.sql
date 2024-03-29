/*
Navicat MySQL Data Transfer

Source Server         : talk
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : talk

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-11-06 11:07:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chat_user
-- ----------------------------
DROP TABLE IF EXISTS `chat_user`;
CREATE TABLE `chat_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(255) NOT NULL COMMENT 'openid',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '昵称',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关注',
  `subscribe_time` int(10) DEFAULT NULL COMMENT '关注时间',
  `unsubscribe_time` int(10) DEFAULT NULL COMMENT '取消关注时间',
  `relname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `signature` text COMMENT '个性签名',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机号',
  `is_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否绑定',
  `language` varchar(50) DEFAULT NULL COMMENT '使用语言',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `group_id` int(10) DEFAULT '0' COMMENT '分组ID',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号分组标识',
  `tagid_list` varchar(255) DEFAULT NULL COMMENT '标签',
  `score` int(10) DEFAULT '0' COMMENT '积分',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金钱',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `location_precision` varchar(50) DEFAULT NULL COMMENT '精度',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0:公众号粉丝1：注册会员',
  `unionid` varchar(160) DEFAULT NULL COMMENT 'unionid字段',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `last_time` int(10) DEFAULT '586969200' COMMENT '最后交互时间',
  `parentid` int(10) DEFAULT '1' COMMENT '非扫码用户默认都是1',
  `isfenxiao` int(8) DEFAULT '0' COMMENT '是否为分销，默认为0，1,2,3，分别为1,2,3级分销',
  `totle_earn` decimal(8,2) DEFAULT '0.00' COMMENT '挣钱总额',
  `balance` decimal(8,2) DEFAULT '0.00' COMMENT '分销挣的剩余未提现额',
  `fenxiao_leavel` int(8) DEFAULT '2' COMMENT '分销等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='公众号粉丝表';

-- ----------------------------
-- Records of chat_user
-- ----------------------------
INSERT INTO `chat_user` VALUES ('85', '1', 'oYxpK0bPptICGQd3YP_1s7jfDTmE', 'Love violet life', 'http://www.hwqugou.cn/img/555.jpg', '1', '1', '1517280919', '1517280912', null, null, null, '0', 'zh_CN', '中国', '江西', '赣州', '', '0', '0', '[]', '0', '0.00', null, null, null, '0', null, null, '1517478028', '1', '0', '26.00', '26.00', '2');
INSERT INTO `chat_user` VALUES ('86', '1', 'oYxpK0W2u3Sbbp-wevdQtCuviDVM', '大美如斯', 'http://www.hwqugou.cn/img/444.png', '2', '1', '1507261446', null, null, null, null, '0', 'zh_CN', '中国', '河南', '焦作', '', '0', '0', '[]', '0', '0.00', null, null, null, '0', null, null, '586969200', '1', '0', '0.00', '0.00', '2');
INSERT INTO `chat_user` VALUES ('87', '1', 'oYxpK0RsvcwgS9DtmIOuyb_BgJbo', '大金', 'http://www.hwqugou.cn/img/333.jpg', '1', '1', '1508920878', null, null, null, null, '0', 'zh_CN', '中国', '河南', '商丘', '', '0', '0', '[]', '0', '0.00', null, null, null, '0', null, null, '586969200', '1', '0', '0.00', '0.00', '2');
INSERT INTO `chat_user` VALUES ('88', '1', 'oYxpK0VnHjESafUHzRpstS8mMwlE', '悦悦', 'http://www.hwqugou.cn/img/222.jpg', '2', '1', '1512281210', null, null, null, null, '0', 'zh_CN', '中国', '福建', '福州', '', '0', '0', '[]', '0', '0.00', null, null, null, '0', null, null, '586969200', '1', '0', '0.00', '0.00', '2');
INSERT INTO `chat_user` VALUES ('89', '1', 'oYxpK0fJVYveWC_nAd7CBwcvYZ3Q', '雨薇', 'http://www.hwqugou.cn/img/111.jpg', '2', '1', '1506320564', null, null, null, null, '0', 'zh_CN', '', '', '', '', '0', '0', '[]', '0', '0.00', null, null, null, '0', null, null, '586969200', '1', '0', '0.00', '0.00', '2');

-- ----------------------------
-- Table structure for talk_chat
-- ----------------------------
DROP TABLE IF EXISTS `talk_chat`;
CREATE TABLE `talk_chat` (
  `chat_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '聊天记录ID',
  `chat_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `chat_content` varchar(255) NOT NULL DEFAULT '0' COMMENT '用户聊天记录  ''消息格式【发信人id:内容】',
  `is_send` enum('0','1') NOT NULL DEFAULT '1' COMMENT '是否是自己发送的 0：不是 1：是',
  `talker` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聊天对象标识',
  PRIMARY KEY (`chat_id`),
  KEY `chat_user_id` (`chat_user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talk_chat
-- ----------------------------

-- ----------------------------
-- Table structure for talk_communication
-- ----------------------------
DROP TABLE IF EXISTS `talk_communication`;
CREATE TABLE `talk_communication` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `fromid` int(5) NOT NULL,
  `fromname` varchar(50) NOT NULL,
  `toid` int(5) NOT NULL,
  `toname` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `time` int(10) NOT NULL,
  `shopid` int(5) DEFAULT NULL,
  `isread` tinyint(2) DEFAULT '0',
  `type` tinyint(2) DEFAULT '1' COMMENT '1是普通文本，2是图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talk_communication
-- ----------------------------
INSERT INTO `talk_communication` VALUES ('30', '1', '黄超', '2', '黄超超', '你好', '1572946176', null, '1', '1');
INSERT INTO `talk_communication` VALUES ('31', '2', '黄超超', '1', '黄超', '我好', '1572946185', null, '1', '1');
INSERT INTO `talk_communication` VALUES ('32', '3', '周杰伦', '2', '黄超超', '我是3号', '1572946492', null, '1', '1');
INSERT INTO `talk_communication` VALUES ('33', '1', '黄超', '2', '黄超超', '你在干嘛', '1572946524', null, '1', '1');
INSERT INTO `talk_communication` VALUES ('34', '3', '周杰伦', '2', '黄超超', '你下线了吗', '1572946582', null, '0', '1');
INSERT INTO `talk_communication` VALUES ('35', '1', '黄超', '2', '黄超超', '你好', '1572951043', null, '1', '1');
INSERT INTO `talk_communication` VALUES ('36', '1', '黄超', '2', '黄超超', '你好', '1572951061', null, '1', '1');
INSERT INTO `talk_communication` VALUES ('37', '2', '黄超超', '1', '黄超', '哈哈', '1572951066', null, '1', '1');
INSERT INTO `talk_communication` VALUES ('38', '1', '黄超', '2', '黄超超', 'dwasd', '1573005144', null, '1', '1');
INSERT INTO `talk_communication` VALUES ('39', '2', '黄超超', '1', '黄超', 'sgfdsf', '1573005151', null, '1', '1');

-- ----------------------------
-- Table structure for talk_user
-- ----------------------------
DROP TABLE IF EXISTS `talk_user`;
CREATE TABLE `talk_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '用户姓名',
  `user_hobby` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '用户爱好',
  `user_job` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '用户职业',
  `user_phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '用户电话',
  `user_age` tinyint(6) unsigned DEFAULT '1' COMMENT '用户年龄',
  `user_sex` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '0:男 1：女',
  `user_addtime` int(10) unsigned DEFAULT '0' COMMENT '用户添加时间',
  `user_logintime` int(10) unsigned DEFAULT '0' COMMENT '用户登录时间',
  `user_img` varchar(100) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talk_user
-- ----------------------------
INSERT INTO `talk_user` VALUES ('1', '0', '黄超', '黄超', '游戏', '计算机', '0', '1', '0', '0', '0', 'http://talk.com/static/newcj/img/20180607185957_fjrFt.jpeg');
INSERT INTO `talk_user` VALUES ('2', 'oMuYK46kY1fH-yywP5LndzuLa4sM', '黄超超', '黄超超', '游戏', '计算', '0', '1', '0', '0', '0', 'http://talk.com/static/newcj/img/20180731152127_fctgj.jpg');
INSERT INTO `talk_user` VALUES ('3', '0', '周杰伦', '周杰伦', '0', '0', '0', '1', '0', '0', '0', 'http://talk.com/static/newcj/img/20180731152127_fctgj.jpg');
