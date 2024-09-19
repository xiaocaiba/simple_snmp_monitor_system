/*
 Navicat Premium Dump SQL

 Source Server         : musql_on_ubantu
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37-0ubuntu0.20.04.3)
 Source Host           : 192.168.137.128:3306
 Source Schema         : ensp_monitor

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37-0ubuntu0.20.04.3)
 File Encoding         : 65001

 Date: 29/06/2024 20:48:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createdAt` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '123@163.com', 'yanghao', 'makabaka', 1714644985711);
INSERT INTO `users` VALUES (2, '2719123586@qq.com', '123456', 'yanghao', 1714645001338);

SET FOREIGN_KEY_CHECKS = 1;
