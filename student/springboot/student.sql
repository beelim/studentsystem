/*
MySQL Data Transfer
Source Host: localhost
Source Database: student
Target Host: localhost
Target Database: student
Date: 2024/1/3 20:22:51
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for s_course
-- ----------------------------
DROP TABLE IF EXISTS `s_course`;
CREATE TABLE `s_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `teacher_id` int NOT NULL,
  `course_date` varchar(32) DEFAULT NULL,
  `selected_num` int NOT NULL DEFAULT '0',
  `max_num` int NOT NULL DEFAULT '50',
  `info` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_teacher_foreign` (`teacher_id`),
  CONSTRAINT `course_teacher_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `s_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for s_inf
-- ----------------------------
DROP TABLE IF EXISTS `s_inf`;
CREATE TABLE `s_inf` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT 'PK，用户id',
  `role_id` int NOT NULL DEFAULT '3' COMMENT '角色名id',
  `usr` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户登陆帐号',
  `pwd` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户名',
  `auth` smallint DEFAULT '0' COMMENT '权限(1=管理员，0=用户，默认0)',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '邮箱',
  `sex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '未知' COMMENT '性别(男，女，未知)',
  `create_time` bigint DEFAULT '0' COMMENT '创建时间(时间毫秒数)',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `FK_ROLE` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for userinf
-- ----------------------------
DROP TABLE IF EXISTS `userinf`;
CREATE TABLE `userinf` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `userpwd` varchar(255) NOT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `userpwd` varchar(255) DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', '管理员', 'ADMIN');
INSERT INTO `student` VALUES ('1', '2021', '123', '气气', null, null, null, null, null, 'STUDENT');
INSERT INTO `user` VALUES ('9', '3', '12', '43', '王五', '1', '192@qq.com', '男', '1623747053568');
INSERT INTO `user` VALUES ('13', '2', '1211', '123', '李四', '0', '12480@qq.com', '女', '1624613604997');
INSERT INTO `user` VALUES ('16', '2', '421', '312', '学生2', '0', '2940@qq.com', '未知', '1624613604997');
INSERT INTO `user` VALUES ('17', '2', 'admin', '123', '管理员', '1', ' 12480@qq.com', '女', '1624613604997');
INSERT INTO `user` VALUES ('25', '1', 'zhangsan', '123', '学生1', '0', 'gasadc12y@163.com', '女', '1624615248298');
INSERT INTO `user` VALUES ('26', '2', '12321321', '12', 'eqw', '0', '31234@qq.com', '男', '1624630123716');
INSERT INTO `user` VALUES ('29', '3', '3213.0', '1231.0', '312.0', '0', '312.0', '男', '1624613604997');
INSERT INTO `user` VALUES ('31', '3', '3213', '1231', '312', '0', '312', '男', '1624710814415');
INSERT INTO `user` VALUES ('32', '3', '3123', '412', '21', '0', '412', '女', '1624759309908');
INSERT INTO `user` VALUES ('33', '3', 'user', '123', '用户2', '0', '412', '女', '1624759309908');
INSERT INTO `user` VALUES ('34', '3', 'user1', '123', '学生3', '0', '74912@qq.com', '女', '1624787972272');
INSERT INTO `userinf` VALUES ('3', '3', '3');
INSERT INTO `userinf` VALUES ('4', '4', '4');
INSERT INTO `userinf` VALUES ('5', '5', '5');
INSERT INTO `userinf` VALUES ('6', '6', '6');
INSERT INTO `userinf` VALUES ('7', '7', '7');
INSERT INTO `userinf` VALUES ('11', '11', '1');
INSERT INTO `userinf` VALUES ('22', '22', '2');
INSERT INTO `users` VALUES ('1', '1', '1');
INSERT INTO `users` VALUES ('11', '22', '1');
INSERT INTO `users` VALUES ('22', '33', '2');
INSERT INTO `users` VALUES ('33', '44', '1');
INSERT INTO `users` VALUES ('55', '55', '1');
INSERT INTO `users` VALUES ('6', '6', '6');
INSERT INTO `users` VALUES ('77', '77', '7');
