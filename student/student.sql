/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : student

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 05/01/2024 18:27:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'ADMIN');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程编号',
  `descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程描述',
  `times` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课时',
  `teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任课老师',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '大学英语', 'CS001', '教室 E408 ，上课时间 1-18周', '56课时', '张珊珊');
INSERT INTO `course` VALUES (2, '高等数学', 'CS002', '教室 N204 ，上课时间 1-16周', '56课时', '李思思');
INSERT INTO `course` VALUES (3, '大学物理', 'CS003', '教室 N202 ，上课时间 1-16周', '56课时', '王维');
INSERT INTO `course` VALUES (4, '数据结构', 'CS004', '教室 S215 ，上课时间 1-16周', '56课时', '赵丽丽');
INSERT INTO `course` VALUES (5, '操作系统', 'CS005', '教室 S314 ，上课时间 1-16周', '56课时', '孙骁骁');
INSERT INTO `course` VALUES (6, 'JavaEE', 'CS006', '教室 N404 ，上课时间 1-16周', '56课时', '何言');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `course_id` int(0) NULL DEFAULT NULL COMMENT '课程ID',
  `student_id` int(0) NULL DEFAULT NULL COMMENT '学生ID',
  `score` double(10, 0) NULL DEFAULT NULL COMMENT '分数',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评语',
  `feedback` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生反馈',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成绩' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, 6, 1, 100, '优秀', '老师很用心，我学到很多知识');
INSERT INTO `grade` VALUES (3, 2, 2, 95, '优秀', '感谢老师的指导');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码密码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'qiqi', '123', '气气', '15732577554', 'qiqi@qq.com', '男', '2003-03-12', 'http://localhost:9090/files/download?fileName=1704423787666_微信图片_202309242349285.jpg', 'STUDENT');
INSERT INTO `student` VALUES (2, 'baiqi', '123', '白起', '15637657743', 'baiqi@163.com', '男', '2003-11-18', 'http://localhost:9090/files/download?fileName=1704381941375_微信图片_20240104232458.jpg', 'STUDENT');
INSERT INTO `student` VALUES (3, 'heyu', '123', '何宇', '13545464566', 'heyu@163.com', '男', '2002-07-03', 'http://localhost:9090/files/download?fileName=1704381836462_微信图片_202309242349281.jpg', 'STUDENT');
INSERT INTO `student` VALUES (4, 'liutao', '123', '刘涛', '13576456545', 'liutao@163.com', '女', '2003-01-04', 'http://localhost:9090/files/download?fileName=1704381823889_微信图片_202309242349283.jpg', 'STUDENT');
INSERT INTO `student` VALUES (5, 'wangwei', '123', '王维', '15364344342', 'wangwei@163.com', '男', '2002-06-06', 'http://localhost:9090/files/download?fileName=1704381797520_微信图片_202309242349272.jpg', 'STUDENT');
INSERT INTO `student` VALUES (6, 'lining', '123', '李宁', '13435454354', 'lining@163.com', '男', '2003-06-03', 'http://localhost:9090/files/download?fileName=1704380728330_微信图片_202309242349284.jpg', 'STUDENT');

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程编号',
  `student_id` int(0) NULL DEFAULT NULL COMMENT '学生ID',
  `course_id` int(0) NULL DEFAULT NULL COMMENT '课程ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生选课' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES (2, 'JavaEE', 'CS006', 1, 6);
INSERT INTO `student_course` VALUES (4, '高等数学', 'CS002', 2, 2);
INSERT INTO `student_course` VALUES (5, '高等数学', 'CS002', 1, 2);
INSERT INTO `student_course` VALUES (6, '大学英语', 'CS001', 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
