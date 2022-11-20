/*
 Navicat Premium Data Transfer

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : soen387_teamproject

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 19/11/2022 23:12:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `eID` int(11) NOT NULL,
  `fName` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lName` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` int(10) NOT NULL,
  `dOB` date NOT NULL,
  PRIMARY KEY (`eID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES (1, 'Sam', 'Loren', '574 Rue Guy, Montreal', 'Sam.001@gmail.com', 1234567890, '1990-08-07');
INSERT INTO `administrator` VALUES (2, 'Tony', 'Fang', '398 Rue Brossard, Montreal', 'Tony2@gmail.com', 1112223334, '1990-03-02');
INSERT INTO `administrator` VALUES (3, 'Chatte', 'Fancy', '89 Rue de Decarie, Montreal', 'chatte@gmail.com', 1231114560, '1990-05-01');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `courseCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `semester` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `days` int(11) NOT NULL,
  `time` time(0) NOT NULL,
  `instructor` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `room` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`cID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'comp345', 'CLanguage', '2022Fall', 120, '09:00:00', 'yui', 'LB100', '2022-09-01', '2022-12-31');
INSERT INTO `course` VALUES (2, 'comp346', 'Operating System', '2022Fall', 120, '10:00:00', 'wong', 'LB101', '2022-09-01', '2022-12-31');
INSERT INTO `course` VALUES (3, 'comp361', 'ComputerMath', '2022Fall', 120, '11:00:00', 'Sam', 'LB102', '2022-09-01', '2022-12-31');
INSERT INTO `course` VALUES (4, 'comp371', 'GameDesign', '2022Fall', 120, '13:00:00', 'sammy', 'LB103', '2022-09-01', '2022-12-31');
INSERT INTO `course` VALUES (5, 'comp352', 'DataStructure', '2022Fall', 120, '14:00:00', 'yummi', 'LB104', '2022-09-01', '2022-12-31');
INSERT INTO `course` VALUES (6, 'comp387', 'web application', '2022Fall', 120, '15:00:00', 'hassan', 'LB105', '2022-09-01', '2022-12-31');
INSERT INTO `course` VALUES (7, 'comp345', 'CLanguage', '2023winter', 120, '09:00:00', 'yui', 'LB100', '2023-01-01', '2023-04-30');
INSERT INTO `course` VALUES (8, 'comp346', 'Operating System', '2023winter', 120, '10:00:00', 'wong', 'LB101', '2023-01-01', '2023-04-30');
INSERT INTO `course` VALUES (9, 'comp361', 'ComputerMath', '2023winter', 120, '13:00:00', 'Sam', 'LB102', '2023-01-01', '2023-04-30');
INSERT INTO `course` VALUES (10, 'comp371', 'GameDesign', '2023winter', 120, '14:00:00', 'sammy', 'LB103', '2023-01-01', '2023-04-30');
INSERT INTO `course` VALUES (11, 'comp352', 'DataStructure', '2023winter', 120, '13:00:00', 'yummi', 'LB104', '2023-01-01', '2023-04-30');
INSERT INTO `course` VALUES (12, 'comp387', 'web application', '2023winter', 120, '15:00:00', 'hassan', 'LB105', '2023-01-01', '2023-04-30');

-- ----------------------------
-- Table structure for enrolled
-- ----------------------------
DROP TABLE IF EXISTS `enrolled`;
CREATE TABLE `enrolled`  (
  `sID` int(11) NOT NULL,
  `cID` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of enrolled
-- ----------------------------
INSERT INTO `enrolled` VALUES (3, 7);
INSERT INTO `enrolled` VALUES (2, 1);
INSERT INTO `enrolled` VALUES (3, 4);
INSERT INTO `enrolled` VALUES (1, 1);
INSERT INTO `enrolled` VALUES (1, 2);
INSERT INTO `enrolled` VALUES (1, 3);
INSERT INTO `enrolled` VALUES (1, 10);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sID` int(11) NOT NULL,
  `fName` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lName` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` int(10) NOT NULL,
  `dOB` date NOT NULL,
  PRIMARY KEY (`sID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'Gallo', 'Man', '489 Rue definis, Toronto', 'gallo@gmail.com', 1110002341, '1990-01-04');
INSERT INTO `student` VALUES (2, 'Tala', 'Golf', '934 Rue de Bouflsa, Candiac', 'tala@gmail.com', 1002001321, '1995-05-23');
INSERT INTO `student` VALUES (3, 'Mali', 'Namo', '374 Reif de Fone, Kingston', 'mali@gmail.com', 1003331213, '1996-05-03');

SET FOREIGN_KEY_CHECKS = 1;
