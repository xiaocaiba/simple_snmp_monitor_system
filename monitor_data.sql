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

 Date: 29/06/2024 20:47:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for monitor_data
-- ----------------------------
DROP TABLE IF EXISTS `monitor_data`;
CREATE TABLE `monitor_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `port` int NULL DEFAULT NULL,
  `sysName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ifInOctets` bigint UNSIGNED NULL DEFAULT NULL,
  `ifInUcastPkts` bigint UNSIGNED NULL DEFAULT NULL,
  `ifInNUcastPkts` bigint UNSIGNED NULL DEFAULT NULL,
  `ifInErrors` bigint UNSIGNED NULL DEFAULT NULL,
  `ifOutOctets` bigint UNSIGNED NULL DEFAULT NULL,
  `ifOutUcastPkts` bigint UNSIGNED NULL DEFAULT NULL,
  `ifOutNUcastPkts` bigint UNSIGNED NULL DEFAULT NULL,
  `ifOutErrors` bigint UNSIGNED NULL DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_data
-- ----------------------------
INSERT INTO `monitor_data` VALUES (39, '10.1.2.1', 0, 'R1', 1290, 17, 1, 0, 610, 6, 3, 0, '2024-06-26 17:50:43');
INSERT INTO `monitor_data` VALUES (40, '10.1.2.1', 1, 'R1', 164294, 8, 1376, 0, 187196, 4, 3115, 0, '2024-06-26 17:50:43');
INSERT INTO `monitor_data` VALUES (41, '10.1.2.1', 2, 'R1', 164882, 20, 1372, 0, 9846, 29, 4, 0, '2024-06-26 17:50:43');
INSERT INTO `monitor_data` VALUES (42, '10.1.1.1', 1, 'C1', 187196, 4, 3116, 0, 164532, 8, 1378, 0, '2024-06-26 17:50:44');
INSERT INTO `monitor_data` VALUES (43, '10.1.1.1', 2, 'C1', 282532, 887, 1736, 0, 132504, 889, 360, 0, '2024-06-26 17:50:44');
INSERT INTO `monitor_data` VALUES (44, '10.1.1.1', 3, 'C1', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-26 17:50:44');
INSERT INTO `monitor_data` VALUES (45, '10.1.1.1', 4, 'C1', 7496, 26, 6, 0, 167161, 24, 1390, 0, '2024-06-26 17:50:44');
INSERT INTO `monitor_data` VALUES (46, '192.168.137.5', 1, 'C2', 12552, 32, 4, 0, 165722, 26, 1374, 0, '2024-06-26 17:50:44');
INSERT INTO `monitor_data` VALUES (47, '192.168.137.5', 2, 'C2', 135286, 892, 360, 0, 283400, 893, 1737, 0, '2024-06-26 17:50:44');
INSERT INTO `monitor_data` VALUES (48, '192.168.137.5', 3, 'C2', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-26 17:50:44');
INSERT INTO `monitor_data` VALUES (49, '192.168.137.5', 4, 'C2', 178136, 28, 1400, 0, 4423, 31, 19, 0, '2024-06-26 17:50:44');
INSERT INTO `monitor_data` VALUES (50, '192.168.137.5', 5, 'C2', 228360, 1316, 892, 0, 301029, 1008, 1386, 0, '2024-06-26 17:50:44');
INSERT INTO `monitor_data` VALUES (51, '10.1.1.6', 1, 'D1', 980, 12, 2, 0, 166554, 11, 1394, 0, '2024-06-26 17:50:44');
INSERT INTO `monitor_data` VALUES (52, '10.1.1.6', 2, 'D1', 550, 7, 1, 0, 166317, 6, 1395, 0, '2024-06-26 17:50:44');
INSERT INTO `monitor_data` VALUES (53, '10.1.1.6', 3, 'D1', 167332, 27, 1390, 0, 10463, 32, 7, 0, '2024-06-26 17:50:44');
INSERT INTO `monitor_data` VALUES (54, '10.1.1.10', 1, 'D2', 0, 0, 0, 0, 164577, 0, 1383, 0, '2024-06-26 17:50:45');
INSERT INTO `monitor_data` VALUES (55, '10.1.1.10', 2, 'D2', 0, 0, 0, 0, 164458, 0, 1383, 0, '2024-06-26 17:50:45');
INSERT INTO `monitor_data` VALUES (56, '10.1.1.10', 3, 'D2', 4594, 34, 19, 0, 181099, 34, 1401, 0, '2024-06-26 17:50:45');
INSERT INTO `monitor_data` VALUES (57, '10.1.2.1', 0, 'R1', 1290, 17, 1, 0, 610, 6, 3, 0, '2024-06-26 17:53:57');
INSERT INTO `monitor_data` VALUES (58, '10.1.2.1', 1, 'R1', 174647, 8, 1464, 0, 198956, 4, 3311, 0, '2024-06-26 17:53:57');
INSERT INTO `monitor_data` VALUES (59, '10.1.2.1', 2, 'R1', 175889, 29, 1458, 0, 15424, 38, 4, 0, '2024-06-26 17:53:57');
INSERT INTO `monitor_data` VALUES (60, '10.1.1.1', 1, 'C1', 198956, 4, 3312, 0, 174885, 8, 1465, 0, '2024-06-26 17:53:58');
INSERT INTO `monitor_data` VALUES (61, '10.1.1.1', 2, 'C1', 296309, 905, 1843, 0, 145610, 907, 381, 0, '2024-06-26 17:53:58');
INSERT INTO `monitor_data` VALUES (62, '10.1.1.1', 3, 'C1', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-26 17:53:58');
INSERT INTO `monitor_data` VALUES (63, '10.1.1.1', 4, 'C1', 13107, 35, 6, 0, 178287, 33, 1477, 0, '2024-06-26 17:53:58');
INSERT INTO `monitor_data` VALUES (64, '192.168.137.5', 1, 'C2', 18130, 41, 4, 0, 176729, 35, 1460, 0, '2024-06-26 17:53:58');
INSERT INTO `monitor_data` VALUES (65, '192.168.137.5', 2, 'C2', 148392, 910, 381, 0, 297058, 911, 1844, 0, '2024-06-26 17:53:58');
INSERT INTO `monitor_data` VALUES (66, '192.168.137.5', 3, 'C2', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-26 17:53:58');
INSERT INTO `monitor_data` VALUES (67, '192.168.137.5', 4, 'C2', 193979, 37, 1486, 0, 5196, 40, 19, 0, '2024-06-26 17:53:58');
INSERT INTO `monitor_data` VALUES (68, '192.168.137.5', 5, 'C2', 245147, 1391, 923, 0, 339480, 1054, 1473, 0, '2024-06-26 17:53:58');
INSERT INTO `monitor_data` VALUES (69, '10.1.1.6', 1, 'D1', 980, 12, 2, 0, 176907, 11, 1481, 0, '2024-06-26 17:53:59');
INSERT INTO `monitor_data` VALUES (70, '10.1.1.6', 2, 'D1', 550, 7, 1, 0, 176551, 6, 1482, 0, '2024-06-26 17:53:59');
INSERT INTO `monitor_data` VALUES (71, '10.1.1.6', 3, 'D1', 178458, 36, 1477, 0, 16074, 41, 7, 0, '2024-06-26 17:53:59');
INSERT INTO `monitor_data` VALUES (72, '10.1.1.10', 1, 'D2', 0, 0, 0, 0, 174811, 0, 1469, 0, '2024-06-26 17:53:59');
INSERT INTO `monitor_data` VALUES (73, '10.1.1.10', 2, 'D2', 0, 0, 0, 0, 174811, 0, 1469, 0, '2024-06-26 17:53:59');
INSERT INTO `monitor_data` VALUES (74, '10.1.1.10', 3, 'D2', 5367, 43, 19, 0, 196942, 43, 1487, 0, '2024-06-26 17:53:59');
INSERT INTO `monitor_data` VALUES (75, '10.1.2.1', 0, 'R1', 2852, 37, 1, 2, 2232, 25, 5, 0, '2024-06-26 18:01:35');
INSERT INTO `monitor_data` VALUES (76, '10.1.2.1', 1, 'R1', 199042, 8, 1668, 0, 226616, 4, 3773, 0, '2024-06-26 18:01:35');
INSERT INTO `monitor_data` VALUES (77, '10.1.2.1', 2, 'R1', 202538, 58, 1662, 0, 22504, 66, 4, 0, '2024-06-26 18:01:35');
INSERT INTO `monitor_data` VALUES (78, '10.1.1.1', 1, 'C1', 226676, 4, 3773, 5, 199280, 8, 1670, 0, '2024-06-26 18:01:36');
INSERT INTO `monitor_data` VALUES (79, '10.1.1.1', 2, 'C1', 327561, 923, 2107, 0, 162150, 926, 439, 0, '2024-06-26 18:01:36');
INSERT INTO `monitor_data` VALUES (80, '10.1.1.1', 3, 'C1', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-26 18:01:36');
INSERT INTO `monitor_data` VALUES (81, '10.1.1.1', 4, 'C1', 18778, 45, 6, 0, 203515, 42, 1683, 0, '2024-06-26 18:01:36');
INSERT INTO `monitor_data` VALUES (82, '192.168.137.5', 1, 'C2', 25210, 69, 4, 1, 203378, 64, 1664, 0, '2024-06-26 18:01:36');
INSERT INTO `monitor_data` VALUES (83, '192.168.137.5', 2, 'C2', 164932, 929, 439, 0, 328310, 929, 2108, 0, '2024-06-26 18:01:36');
INSERT INTO `monitor_data` VALUES (84, '192.168.137.5', 3, 'C2', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-26 18:01:36');
INSERT INTO `monitor_data` VALUES (85, '192.168.137.5', 4, 'C2', 226994, 87, 1691, 0, 8979, 91, 19, 0, '2024-06-26 18:01:36');
INSERT INTO `monitor_data` VALUES (86, '192.168.137.5', 5, 'C2', 264181, 1499, 1004, 1, 393084, 1117, 1677, 0, '2024-06-26 18:01:36');
INSERT INTO `monitor_data` VALUES (87, '10.1.1.6', 1, 'D1', 980, 12, 2, 0, 201183, 11, 1685, 0, '2024-06-26 18:01:37');
INSERT INTO `monitor_data` VALUES (88, '10.1.1.6', 2, 'D1', 550, 7, 1, 0, 200946, 6, 1686, 0, '2024-06-26 18:01:37');
INSERT INTO `monitor_data` VALUES (89, '10.1.1.6', 3, 'D1', 203686, 45, 1683, 0, 21745, 51, 7, 0, '2024-06-26 18:01:37');
INSERT INTO `monitor_data` VALUES (90, '10.1.1.10', 1, 'D2', 1290, 15, 3, 1, 200337, 18, 1673, 0, '2024-06-26 18:01:37');
INSERT INTO `monitor_data` VALUES (91, '10.1.1.10', 2, 'D2', 1230, 15, 2, 0, 200317, 17, 1673, 0, '2024-06-26 18:01:37');
INSERT INTO `monitor_data` VALUES (92, '10.1.1.10', 3, 'D2', 9150, 94, 19, 0, 229959, 93, 1692, 0, '2024-06-26 18:01:37');
INSERT INTO `monitor_data` VALUES (93, '10.1.2.1', 0, 'R1', 0, 0, 0, 0, 60, 0, 1, 0, '2024-06-28 23:16:04');
INSERT INTO `monitor_data` VALUES (94, '10.1.2.1', 1, 'R1', 102757, 0, 864, 0, 116160, 1, 1936, 0, '2024-06-28 23:16:04');
INSERT INTO `monitor_data` VALUES (95, '10.1.2.1', 2, 'R1', 102809, 3, 863, 0, 2987, 7, 1, 0, '2024-06-28 23:16:04');
INSERT INTO `monitor_data` VALUES (96, '10.1.1.1', 1, 'C1', 116220, 1, 1936, 0, 102995, 0, 866, 0, '2024-06-28 23:16:04');
INSERT INTO `monitor_data` VALUES (97, '10.1.1.1', 2, 'C1', 125221, 23, 1092, 0, 27780, 48, 234, 0, '2024-06-28 23:16:04');
INSERT INTO `monitor_data` VALUES (98, '10.1.1.1', 3, 'C1', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-28 23:16:04');
INSERT INTO `monitor_data` VALUES (99, '10.1.1.1', 4, 'C1', 3406, 29, 8, 0, 104441, 9, 874, 0, '2024-06-28 23:16:04');
INSERT INTO `monitor_data` VALUES (100, '192.168.137.5', 1, 'C2', 5692, 10, 1, 0, 103649, 9, 865, 0, '2024-06-28 23:16:04');
INSERT INTO `monitor_data` VALUES (101, '192.168.137.5', 2, 'C2', 30527, 51, 233, 0, 126056, 29, 1094, 0, '2024-06-28 23:16:04');
INSERT INTO `monitor_data` VALUES (102, '192.168.137.5', 3, 'C2', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-28 23:16:04');
INSERT INTO `monitor_data` VALUES (103, '192.168.137.5', 4, 'C2', 104309, 6, 876, 0, 2148, 5, 19, 0, '2024-06-28 23:16:04');
INSERT INTO `monitor_data` VALUES (104, '192.168.137.5', 5, 'C2', 233370, 698, 2221, 0, 120581, 50, 879, 0, '2024-06-28 23:16:04');
INSERT INTO `monitor_data` VALUES (105, '10.1.1.6', 1, 'D1', 0, 0, 0, 0, 103173, 0, 867, 0, '2024-06-28 23:16:05');
INSERT INTO `monitor_data` VALUES (106, '10.1.1.6', 2, 'D1', 0, 0, 0, 0, 103173, 0, 867, 0, '2024-06-28 23:16:05');
INSERT INTO `monitor_data` VALUES (107, '10.1.1.6', 3, 'D1', 104731, 12, 875, 0, 6371, 35, 9, 0, '2024-06-28 23:16:05');
INSERT INTO `monitor_data` VALUES (108, '10.1.1.10', 1, 'D2', 0, 0, 0, 0, 103173, 0, 867, 0, '2024-06-28 23:16:05');
INSERT INTO `monitor_data` VALUES (109, '10.1.1.10', 2, 'D2', 0, 0, 0, 0, 103054, 0, 866, 0, '2024-06-28 23:16:05');
INSERT INTO `monitor_data` VALUES (110, '10.1.1.10', 3, 'D2', 2319, 8, 19, 0, 107272, 12, 877, 0, '2024-06-28 23:16:05');
INSERT INTO `monitor_data` VALUES (111, '10.1.2.1', 0, 'R1', 0, 0, 0, 0, 60, 0, 1, 0, '2024-06-29 14:53:00');
INSERT INTO `monitor_data` VALUES (112, '10.1.2.1', 1, 'R1', 17731, 0, 149, 3, 19380, 0, 323, 0, '2024-06-29 14:53:00');
INSERT INTO `monitor_data` VALUES (113, '10.1.2.1', 2, 'R1', 17843, 3, 149, 0, 2981, 7, 1, 1, '2024-06-29 14:53:00');
INSERT INTO `monitor_data` VALUES (114, '10.1.1.1', 1, 'C1', 19440, 0, 324, 0, 17969, 0, 151, 0, '2024-06-29 14:53:00');
INSERT INTO `monitor_data` VALUES (115, '10.1.1.1', 2, 'C1', 23921, 20, 197, 0, 9913, 19, 62, 0, '2024-06-29 14:53:00');
INSERT INTO `monitor_data` VALUES (116, '10.1.1.1', 3, 'C1', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-29 14:53:00');
INSERT INTO `monitor_data` VALUES (117, '10.1.1.1', 4, 'C1', 1076, 8, 6, 0, 18390, 1, 159, 2, '2024-06-29 14:53:00');
INSERT INTO `monitor_data` VALUES (118, '192.168.137.5', 1, 'C2', 5685, 10, 1, 0, 18683, 9, 151, 0, '2024-06-29 14:53:00');
INSERT INTO `monitor_data` VALUES (119, '192.168.137.5', 2, 'C2', 12571, 22, 61, 0, 24551, 26, 197, 0, '2024-06-29 14:53:00');
INSERT INTO `monitor_data` VALUES (120, '192.168.137.5', 3, 'C2', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-29 14:53:00');
INSERT INTO `monitor_data` VALUES (121, '192.168.137.5', 4, 'C2', 18390, 5, 154, 0, 1432, 3, 13, 0, '2024-06-29 14:53:00');
INSERT INTO `monitor_data` VALUES (122, '192.168.137.5', 5, 'C2', 25671, 245, 106, 0, 41853, 160, 155, 0, '2024-06-29 14:53:00');
INSERT INTO `monitor_data` VALUES (123, '10.1.1.6', 1, 'D1', 0, 0, 0, 0, 17374, 0, 146, 0, '2024-06-29 14:53:01');
INSERT INTO `monitor_data` VALUES (124, '10.1.1.6', 2, 'D1', 0, 0, 0, 0, 17374, 0, 146, 0, '2024-06-29 14:53:01');
INSERT INTO `monitor_data` VALUES (125, '10.1.1.6', 3, 'D1', 18561, 4, 158, 1, 3921, 14, 6, 0, '2024-06-29 14:53:01');
INSERT INTO `monitor_data` VALUES (126, '10.1.1.10', 1, 'D2', 0, 0, 0, 0, 17493, 0, 147, 0, '2024-06-29 14:53:01');
INSERT INTO `monitor_data` VALUES (127, '10.1.1.10', 2, 'D2', 0, 0, 0, 0, 17493, 0, 147, 0, '2024-06-29 14:53:01');
INSERT INTO `monitor_data` VALUES (128, '10.1.1.10', 3, 'D2', 1484, 6, 12, 1, 21234, 11, 154, 1, '2024-06-29 14:53:01');
INSERT INTO `monitor_data` VALUES (129, '10.1.2.1', 0, 'R1', 0, 0, 0, 0, 60, 0, 1, 0, '2024-06-29 15:16:29');
INSERT INTO `monitor_data` VALUES (130, '10.1.2.1', 1, 'R1', 93833, 0, 790, 0, 104820, 3, 1744, 0, '2024-06-29 15:16:29');
INSERT INTO `monitor_data` VALUES (131, '10.1.2.1', 2, 'R1', 94063, 12, 785, 0, 8672, 18, 1, 0, '2024-06-29 15:16:29');
INSERT INTO `monitor_data` VALUES (132, '10.1.1.1', 1, 'C1', 104880, 3, 1745, 0, 94071, 0, 792, 0, '2024-06-29 15:16:29');
INSERT INTO `monitor_data` VALUES (133, '10.1.1.1', 2, 'C1', 114032, 41, 981, 0, 34500, 39, 216, 0, '2024-06-29 15:16:29');
INSERT INTO `monitor_data` VALUES (134, '10.1.1.1', 3, 'C1', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-29 15:16:29');
INSERT INTO `monitor_data` VALUES (135, '10.1.1.1', 4, 'C1', 7341, 21, 12, 0, 95506, 15, 800, 0, '2024-06-29 15:16:29');
INSERT INTO `monitor_data` VALUES (136, '192.168.137.5', 1, 'C2', 11377, 21, 1, 0, 94903, 18, 786, 0, '2024-06-29 15:16:30');
INSERT INTO `monitor_data` VALUES (137, '192.168.137.5', 2, 'C2', 37162, 42, 215, 0, 114781, 47, 982, 0, '2024-06-29 15:16:30');
INSERT INTO `monitor_data` VALUES (138, '192.168.137.5', 3, 'C2', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-29 15:16:30');
INSERT INTO `monitor_data` VALUES (139, '192.168.137.5', 4, 'C2', 99682, 16, 790, 0, 2564, 14, 16, 0, '2024-06-29 15:16:30');
INSERT INTO `monitor_data` VALUES (140, '192.168.137.5', 5, 'C2', 229586, 1052, 558, 0, 145497, 206, 791, 0, '2024-06-29 15:16:30');
INSERT INTO `monitor_data` VALUES (141, '10.1.1.6', 1, 'D1', 0, 0, 0, 0, 93296, 0, 784, 0, '2024-06-29 15:16:30');
INSERT INTO `monitor_data` VALUES (142, '10.1.1.6', 2, 'D1', 0, 0, 0, 0, 93296, 0, 784, 0, '2024-06-29 15:16:30');
INSERT INTO `monitor_data` VALUES (143, '10.1.1.6', 3, 'D1', 95677, 18, 799, 0, 10187, 27, 12, 0, '2024-06-29 15:16:30');
INSERT INTO `monitor_data` VALUES (144, '10.1.1.10', 1, 'D2', 0, 0, 0, 0, 92939, 0, 781, 0, '2024-06-29 15:16:31');
INSERT INTO `monitor_data` VALUES (145, '10.1.1.10', 2, 'D2', 0, 0, 0, 0, 92939, 0, 781, 0, '2024-06-29 15:16:31');
INSERT INTO `monitor_data` VALUES (146, '10.1.1.10', 3, 'D2', 2616, 17, 15, 0, 102526, 22, 790, 0, '2024-06-29 15:16:31');
INSERT INTO `monitor_data` VALUES (147, '10.1.2.1', 0, 'R1', 0, 0, 0, 0, 60, 0, 1, 0, '2024-06-29 15:18:03');
INSERT INTO `monitor_data` VALUES (148, '10.1.2.1', 1, 'R1', 98950, 0, 833, 0, 110520, 3, 1839, 0, '2024-06-29 15:18:03');
INSERT INTO `monitor_data` VALUES (149, '10.1.2.1', 2, 'R1', 99834, 21, 826, 0, 14244, 27, 1, 0, '2024-06-29 15:18:03');
INSERT INTO `monitor_data` VALUES (150, '10.1.1.1', 1, 'C1', 110520, 3, 1840, 0, 99188, 0, 835, 0, '2024-06-29 15:18:03');
INSERT INTO `monitor_data` VALUES (151, '10.1.1.1', 2, 'C1', 122142, 59, 1038, 0, 47376, 57, 232, 0, '2024-06-29 15:18:03');
INSERT INTO `monitor_data` VALUES (152, '10.1.1.1', 3, 'C1', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-29 15:18:03');
INSERT INTO `monitor_data` VALUES (153, '10.1.1.1', 4, 'C1', 12950, 30, 12, 0, 101396, 24, 842, 0, '2024-06-29 15:18:03');
INSERT INTO `monitor_data` VALUES (154, '192.168.137.5', 1, 'C2', 16949, 30, 1, 0, 100674, 27, 828, 0, '2024-06-29 15:18:04');
INSERT INTO `monitor_data` VALUES (155, '192.168.137.5', 2, 'C2', 50038, 60, 231, 0, 122772, 65, 1038, 0, '2024-06-29 15:18:04');
INSERT INTO `monitor_data` VALUES (156, '192.168.137.5', 3, 'C2', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-29 15:18:04');
INSERT INTO `monitor_data` VALUES (157, '192.168.137.5', 4, 'C2', 110289, 25, 832, 0, 3337, 23, 16, 0, '2024-06-29 15:18:04');
INSERT INTO `monitor_data` VALUES (158, '192.168.137.5', 5, 'C2', 248657, 1155, 570, 0, 178581, 252, 833, 0, '2024-06-29 15:18:04');
INSERT INTO `monitor_data` VALUES (159, '10.1.1.6', 1, 'D1', 0, 0, 0, 0, 98413, 0, 827, 0, '2024-06-29 15:18:04');
INSERT INTO `monitor_data` VALUES (160, '10.1.1.6', 2, 'D1', 0, 0, 0, 0, 98413, 0, 827, 0, '2024-06-29 15:18:04');
INSERT INTO `monitor_data` VALUES (161, '10.1.1.6', 3, 'D1', 101567, 27, 842, 0, 15796, 36, 12, 0, '2024-06-29 15:18:04');
INSERT INTO `monitor_data` VALUES (162, '10.1.1.10', 1, 'D2', 0, 0, 0, 0, 97937, 0, 823, 0, '2024-06-29 15:18:04');
INSERT INTO `monitor_data` VALUES (163, '10.1.1.10', 2, 'D2', 0, 0, 0, 0, 97937, 0, 823, 0, '2024-06-29 15:18:04');
INSERT INTO `monitor_data` VALUES (164, '10.1.1.10', 3, 'D2', 3389, 26, 15, 0, 113133, 31, 832, 0, '2024-06-29 15:18:04');
INSERT INTO `monitor_data` VALUES (165, '10.1.2.1', 0, 'R1', 0, 0, 0, 0, 60, 0, 1, 0, '2024-06-29 15:19:37');
INSERT INTO `monitor_data` VALUES (166, '10.1.2.1', 1, 'R1', 104067, 0, 876, 0, 116100, 3, 1933, 0, '2024-06-29 15:19:37');
INSERT INTO `monitor_data` VALUES (167, '10.1.2.1', 2, 'R1', 105605, 30, 869, 0, 19816, 36, 1, 0, '2024-06-29 15:19:37');
INSERT INTO `monitor_data` VALUES (168, '10.1.1.1', 1, 'C1', 116220, 3, 1934, 0, 104305, 0, 878, 0, '2024-06-29 15:19:37');
INSERT INTO `monitor_data` VALUES (169, '10.1.1.1', 2, 'C1', 129834, 77, 1092, 0, 59736, 75, 244, 0, '2024-06-29 15:19:37');
INSERT INTO `monitor_data` VALUES (170, '10.1.1.1', 3, 'C1', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-29 15:19:37');
INSERT INTO `monitor_data` VALUES (171, '10.1.1.1', 4, 'C1', 18559, 39, 12, 0, 107286, 33, 885, 0, '2024-06-29 15:19:37');
INSERT INTO `monitor_data` VALUES (172, '192.168.137.5', 1, 'C2', 22521, 39, 1, 0, 106564, 36, 871, 0, '2024-06-29 15:19:37');
INSERT INTO `monitor_data` VALUES (173, '192.168.137.5', 2, 'C2', 62398, 78, 243, 0, 130583, 83, 1093, 0, '2024-06-29 15:19:37');
INSERT INTO `monitor_data` VALUES (174, '192.168.137.5', 3, 'C2', 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-29 15:19:37');
INSERT INTO `monitor_data` VALUES (175, '192.168.137.5', 4, 'C2', 120896, 34, 874, 0, 4110, 32, 16, 0, '2024-06-29 15:19:37');
INSERT INTO `monitor_data` VALUES (176, '192.168.137.5', 5, 'C2', 293594, 1336, 602, 0, 211665, 298, 875, 0, '2024-06-29 15:19:37');
INSERT INTO `monitor_data` VALUES (177, '10.1.1.6', 1, 'D1', 0, 0, 0, 0, 103411, 0, 869, 0, '2024-06-29 15:19:38');
INSERT INTO `monitor_data` VALUES (178, '10.1.1.6', 2, 'D1', 0, 0, 0, 0, 103411, 0, 869, 0, '2024-06-29 15:19:38');
INSERT INTO `monitor_data` VALUES (179, '10.1.1.6', 3, 'D1', 107338, 36, 884, 0, 21405, 45, 12, 0, '2024-06-29 15:19:38');
INSERT INTO `monitor_data` VALUES (180, '10.1.1.10', 1, 'D2', 0, 0, 0, 0, 103054, 0, 866, 0, '2024-06-29 15:19:38');
INSERT INTO `monitor_data` VALUES (181, '10.1.1.10', 2, 'D2', 0, 0, 0, 0, 102935, 0, 865, 0, '2024-06-29 15:19:38');
INSERT INTO `monitor_data` VALUES (182, '10.1.1.10', 3, 'D2', 4162, 35, 15, 0, 123740, 40, 874, 0, '2024-06-29 15:19:38');

SET FOREIGN_KEY_CHECKS = 1;
