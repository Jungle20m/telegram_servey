/*
 Navicat Premium Data Transfer

 Source Server         : telegram_servey
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : survey_db

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 01/09/2020 05:44:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `question_id` int(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `callback` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `status` tinyint(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES (1, 1, '500 người', '1', 0, NULL, NULL);
INSERT INTO `answers` VALUES (2, 1, '600 người', '2', 1, NULL, NULL);
INSERT INTO `answers` VALUES (3, 1, '700 người', '3', 0, NULL, NULL);
INSERT INTO `answers` VALUES (4, 2, '1 tuần', '4', 1, NULL, NULL);
INSERT INTO `answers` VALUES (5, 2, '2 tuần', '5', 0, NULL, NULL);
INSERT INTO `answers` VALUES (6, 3, 'Có', '6', 1, NULL, NULL);
INSERT INTO `answers` VALUES (7, 3, 'Không', '7', 0, NULL, NULL);

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `servey_id` int(0) NOT NULL,
  `next_question_id` int(0) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, 1, 2, 'Tại thời điểm này Việt Nam có khoảng bao nhiêu ca nhiễm covid-19', NULL, NULL);
INSERT INTO `questions` VALUES (2, 1, 3, 'Thời gian ủ bệnh của virus corona tối đa bao nhiêu ngày', NULL, NULL);
INSERT INTO `questions` VALUES (3, 1, 0, 'Bạn có sợ corona không', NULL, NULL);

-- ----------------------------
-- Table structure for servey
-- ----------------------------
DROP TABLE IF EXISTS `servey`;
CREATE TABLE `servey`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL,
  `head_question_id` int(0) NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of servey
-- ----------------------------
INSERT INTO `servey` VALUES (1, 'Xin chào tôi là bot Servey Icom, bạn có muốn thể hiện độ hiểu biết của mình về covid-19 không.', 'covid-19 servey ', 'Khảo sát mức độ hiểu biết về dịch covid 19 của nhân viên trong công ty', 1, NULL, NULL);

-- ----------------------------
-- Table structure for servey_history
-- ----------------------------
DROP TABLE IF EXISTS `servey_history`;
CREATE TABLE `servey_history`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `servey_time_id` int(0) NOT NULL,
  `question_id` int(0) NOT NULL,
  `answer_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of servey_history
-- ----------------------------
INSERT INTO `servey_history` VALUES (92, 75, 1, 1);
INSERT INTO `servey_history` VALUES (93, 75, 2, 4);
INSERT INTO `servey_history` VALUES (94, 75, 3, 7);
INSERT INTO `servey_history` VALUES (95, 76, 1, 1);
INSERT INTO `servey_history` VALUES (96, 76, 2, 4);
INSERT INTO `servey_history` VALUES (97, 76, 3, 7);

-- ----------------------------
-- Table structure for servey_times
-- ----------------------------
DROP TABLE IF EXISTS `servey_times`;
CREATE TABLE `servey_times`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_servey_id` int(0) NOT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `created_at` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of servey_times
-- ----------------------------
INSERT INTO `servey_times` VALUES (75, 6, '1598228965.52006158307232329', '2020-08-24 07:29:27');
INSERT INTO `servey_times` VALUES (76, 6, '1598229013.14151936169307408', '2020-08-24 07:30:14');

-- ----------------------------
-- Table structure for user_servey
-- ----------------------------
DROP TABLE IF EXISTS `user_servey`;
CREATE TABLE `user_servey`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `servey_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_servey
-- ----------------------------
INSERT INTO `user_servey` VALUES (6, 225, 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `avatar` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `short_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gender` tinyint(0) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `google_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `active_status` tinyint(0) NOT NULL DEFAULT 1,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `date_in` date NULL DEFAULT NULL,
  `date_out` date NULL DEFAULT NULL,
  `trial_date` date NULL DEFAULT NULL,
  `telegram_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 265 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'Administrator', NULL, 'admin', 'long.net.it@gmail.com', NULL, NULL, 0, NULL, '2018-07-28 11:38:32', NULL, NULL, 2, NULL, '2019-11-20', '2018-07-28', NULL, '2018-09-28', 0);
INSERT INTO `users` VALUES (3, 'Dương Quốc Hoàng', NULL, 'hoangdq', 'hoangdq@i-com.vn', NULL, NULL, 0, NULL, '2018-08-17 14:13:41', NULL, NULL, 1, NULL, '1992-12-04', '2017-03-03', '2017-05-03', '2017-05-03', 479510966);
INSERT INTO `users` VALUES (6, 'Đội trực icom', NULL, 'doitrucicom', 'doitruc@i-com.vn', NULL, NULL, 0, NULL, '2018-08-17 14:14:48', '2020-08-06 18:46:27', NULL, 0, '0000000000', '2020-08-22', '2018-08-17', NULL, '2018-10-17', 0);
INSERT INTO `users` VALUES (7, 'Kiều Thị Ngọc Huyền', NULL, 'huyenktn', 'huyenktn@i-com.vn', NULL, NULL, 2, NULL, '2018-08-21 17:46:11', '2020-08-06 18:45:05', NULL, 0, '0000000000', '1990-08-03', '2013-10-01', '2013-12-01', '2013-12-01', 796247721);
INSERT INTO `users` VALUES (8, 'Vũ Thị Thu Huyền', NULL, 'huyenvtt', 'huyenvtt@i-com.vn', NULL, NULL, 2, NULL, '2018-08-23 14:11:01', NULL, NULL, 2, NULL, '1985-10-27', '2017-08-14', NULL, '2017-10-14', 0);
INSERT INTO `users` VALUES (14, 'Trịnh Minh Nghĩa', NULL, 'nghiatm', 'nghiatm@i-com.vn', NULL, NULL, 1, NULL, '2018-10-05 10:30:04', '2020-08-06 18:44:19', NULL, 0, '0000000000', '1989-08-19', '2017-09-25', '2017-11-25', '2017-11-25', 620395885);
INSERT INTO `users` VALUES (31, 'Thắng Ngô Minh', NULL, 'thangnm', 'thangnm@i-com.vn', NULL, 'eyJpdiI6Ik9zOXdkQ2xqSm1NdWwyNmlnMXZpOEE9PSIsInZhbHVlIjoicDY5UjFaYTZVR1VBNVh6SlJxRlpCYm1zUkgvZ1dJUlhaZnI5bkoyM1lPcz0iLCJtYWMiOiIyZThjMjA2ZWNlNWNkMGFhODc0YTc3NzU4M2Q3MjI3MTQ5NzhmZWY4OWYzMDcwNTlkNzkxMjRjMzFhMzRkNTMxIn0=', 0, 'fVau5xBd4idnGQzWG9rcgug0kmXkXfGmrKHEebchcVq4W1h7Ay7R3ywrzMMP', '2018-10-24 11:36:18', '2020-07-28 11:05:39', '102216979838631921593', 1, NULL, '1979-08-02', '2016-05-23', '2016-07-23', '2016-07-23', 383773444);
INSERT INTO `users` VALUES (32, 'Quách Phương Thảo', 'https://lh5.googleusercontent.com/-lXM4NA-JvFU/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmInIGUoukgSKsrAAA6zDip-yR4Jw/photo.jpg', 'thaoqp', 'thaoqp@i-com.vn', NULL, 'eyJpdiI6InJlUUNGV0h3YTRSWVEwUVJDUHlxblE9PSIsInZhbHVlIjoiN1pEbSszdmg1RzNCbU5ndk1qYTQwcG90WWRwRmhDbGxic2NPcmVZVWNnND0iLCJtYWMiOiJmNDA5ZjRhNmE2NmRiNmQ2NmE3YTc0ZTJkMTJlYTIzNTE4NjUxZDBmZDk0NjlhMWI5YWU4ZmYxOWEzMjk5NjlkIn0=', 2, NULL, '2018-10-24 11:36:21', '2020-08-11 13:30:36', '112644519781821803403', 1, '0909029491', '1970-01-01', '2018-10-24', NULL, '2018-12-24', 298377530);
INSERT INTO `users` VALUES (57, 'Hồng Thu Nguyễn', 'https://lh3.googleusercontent.com/a-/AOh14GiG3FophhRSyBKZzAxtbtaZpMZkqSTHz-0mCuKOZg', 'thunh', 'thunh@i-com.vn', NULL, 'eyJpdiI6IjQ0Skl0d2VPYXpvNG54UWRnOWpSNXc9PSIsInZhbHVlIjoiQW9Xem1uL09mUUxWb0VIdTJvUjFMaUl4RkxselI4S3RLa2Z4bWVxUGw4ND0iLCJtYWMiOiJjYTJmYWY5NzFhZjYwOGY2MDRmMTBjNWZiMGFmMzRkYzMwYmU1Nzc0NTI1NTVmNDAzYTdhZmNiNWE2ZmQ5MjY2In0=', 0, NULL, '2018-11-05 10:55:54', '2020-08-06 11:04:19', '109500903637859285702', 1, NULL, '1992-08-31', '2016-01-04', '2016-03-04', '2016-03-04', 1149863198);
INSERT INTO `users` VALUES (58, 'Nguyễn Thị Hà Hoa', '', 'hoanth', 'hoanth@i-com.vn', NULL, 'eyJpdiI6Inl5NkR1Vjh6UWpza0VaOUUzcEI1MGc9PSIsInZhbHVlIjoiQ3QycWFNVnVRU0JsZVVwQ090bUw1WHlUUHBNRkc5K2RnaU4wMzl1dm9Rcz0iLCJtYWMiOiJiNmU5OTFhNjVlNDkwZjU2NTc0ZDZmOTA5MDIyOTA5NWRhZGQ0NmI4MmUxODIxNDI4N2ZhMWE4NzgxZDNlMWQ3In0=', 0, NULL, '2018-11-05 10:55:54', '2020-08-04 15:38:33', '113049058090197412578', 1, NULL, '1987-10-04', '2014-05-05', '2014-07-05', '2014-07-05', 853687016);
INSERT INTO `users` VALUES (59, 'Phạm Hùng Cường', NULL, 'cuongph', 'cuongph@i-com.vn', NULL, NULL, 1, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1991-12-21', '2015-04-14', '2015-06-14', '2015-06-14', 0);
INSERT INTO `users` VALUES (60, 'Nguyễn Ngọc Trâm', NULL, 'tramnn', 'tramnn@i-com.vn', NULL, NULL, 2, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1992-07-31', '2014-07-07', '2014-09-07', '2014-09-07', 892815523);
INSERT INTO `users` VALUES (63, 'Hương Phan Thị Mai', 'https://lh3.googleusercontent.com/a-/AOh14GgabhbA_Ow3JHSbqKEtHvI8BBpejwMdyYwIhJO7GQ', 'huongptm', 'huongptm@i-com.vn', NULL, 'eyJpdiI6Iit1MTBHNHRJTG9pM2hvUkNkNlNKbnc9PSIsInZhbHVlIjoiWFFBT01UWkVkQldzTlZqSm5NczFheUlDSENVZVVpQlhjUlRVZi9xK2xIND0iLCJtYWMiOiIxNjRiODIzYTNlYjUyMjczMTFhMzY0ZmU2MTIwZDY3NWQ1MDVkMThlZGVlYzY2ZWRjOGVjMTJkNTMyNDFkODJjIn0=', 0, NULL, '2018-11-05 10:55:54', '2020-08-12 13:34:20', '109001341273146423318', 1, NULL, '1987-06-21', '2015-01-19', '2015-03-19', '2015-03-19', 0);
INSERT INTO `users` VALUES (64, 'Vũ Thị Huyền Trang', NULL, 'trangvth', 'trangvth@i-com.vn', NULL, NULL, 0, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1986-12-01', '2016-08-16', '2016-10-16', '2016-10-16', 1362159617);
INSERT INTO `users` VALUES (65, 'Phạm Thu Trang', NULL, 'trangpt', 'trangpt@i-com.vn', NULL, NULL, 0, NULL, '2018-11-05 10:55:54', '2020-08-06 18:42:21', NULL, 0, '0000000000', '1990-02-03', '2016-03-07', NULL, '2016-05-07', 0);
INSERT INTO `users` VALUES (70, 'Hiếu Vũ Thị', 'https://lh3.googleusercontent.com/a-/AOh14GiWNWNX27Fdo37VvF6OapfaCPG8EZP6Be-gS5qI7Q', 'hieuvt', 'hieuvt@i-com.vn', NULL, 'eyJpdiI6IlowNmQwT2JrRUFHYXhwakRNRUVXbmc9PSIsInZhbHVlIjoiZGtwdk9neVp1TUZFWk5JcUZDOXBiQW1ab09pUWVXZEwyaisxaWtFUWU3ND0iLCJtYWMiOiJhY2U5NTljYzdkYTQ5MjM2NjEzOTI1ZDc0YTg0YzQ1YmI4OWRlZWM2MmFjOWMzYTc1YTI4YjVjZDEwYzA2ZTVkIn0=', 0, NULL, '2018-11-05 10:55:54', '2020-08-06 11:04:16', '112828586052065335417', 1, NULL, '1992-07-09', '2015-08-09', NULL, '2015-10-09', 855398640);
INSERT INTO `users` VALUES (76, 'Trần Trung Dũng', NULL, 'dungtt', 'dungtt@i-com.vn', NULL, NULL, 0, NULL, '2018-11-05 10:55:54', '2020-08-06 18:41:38', NULL, 0, '0000000000', '1983-05-12', '2014-03-03', NULL, '2014-05-03', 590921274);
INSERT INTO `users` VALUES (79, 'Phan Huyen Trang', NULL, 'trangph', 'trangph@i-com.vn', NULL, 'eyJpdiI6IjZhRU51ajJPMDdUa0J5Y2Fmck5tbnc9PSIsInZhbHVlIjoiY0xSQVp1dHNpYlNqQ1dkYXVlZGZWYnh6QXdUU1dvcERvQzljM2pSYWMyYz0iLCJtYWMiOiIzMTg5OTJmN2I3YTA5ZmFmYTQ1ZmZkOTdkNWZmMTA1NmQ4MjA0MjBiM2Y0NTE5YjVmOGQxNzJhMzJiYjNjMzZhIn0=', 0, 'cAWV8992R739gvmt8H4jv4n9jbgSRBoZOsFbYMDQ1NRwqpF2DscLmWj1taP5', '2018-11-05 10:55:54', '2020-07-13 10:36:59', '108879111011819140972', 1, NULL, '1986-11-04', '2011-02-18', NULL, '2011-04-18', 1096821805);
INSERT INTO `users` VALUES (80, 'Nguyen Thanh Phuong', NULL, 'phuongnt', 'phuongnt@i-com.vn', NULL, 'eyJpdiI6ImV5aFZudGw2dmZEb3ZzU2pHbGlLRnc9PSIsInZhbHVlIjoiUTRxUytvNERVN09mam1aVm9iWWtTQUhzV2l0cFZieldkckJwU3A4MVlZMD0iLCJtYWMiOiJiNjkzZGQwMWJhMDRhZjFhZTY3OGE2YTU2OTQ5YTc1YzMxMjEzYmU5MjczMWYxNzk1NmZmNjVkN2EyZDZkOTRmIn0=', 0, NULL, '2018-11-05 10:55:54', '2020-07-13 10:26:07', '115888610770232737679', 1, NULL, '1988-12-21', '2011-08-17', NULL, '2011-10-17', 1122980137);
INSERT INTO `users` VALUES (85, 'Kim Anh Nguyễn', NULL, 'anhnk', 'anhnk@i-com.vn', NULL, 'eyJpdiI6IkZJYXhXeCtsVCsrM3o5Y3QrRk50RFE9PSIsInZhbHVlIjoiamdoakZweVltcWdHd3d6Q0NOdG5SNUZNeGJaM3BTK0dQNTRYcnByRndMQT0iLCJtYWMiOiJlZDE1MGMyMzcyZWVjYjEzZDdmNzkxZTA2ZWY4ODYwNTUzZTNhZGFkZTQxNzkzNzUyNDgxMTNiYjkyNTczNzRmIn0=', 0, NULL, '2018-11-05 10:55:54', '2020-07-07 16:25:54', '115834371757601515069', 1, NULL, '1984-11-05', '2016-07-01', NULL, '2016-09-01', 878970518);
INSERT INTO `users` VALUES (88, 'Thu Hương Đỗ Thị', 'https://lh3.googleusercontent.com/a-/AOh14GjFu7XjNsAf3_gyj5sVMqENO37lv4Nwakcvonmu2A', 'huongdtt', 'huongdtt@i-com.vn', NULL, 'eyJpdiI6IlBkUUVZczBUaTQ1TkxyT0h0MEQ2UHc9PSIsInZhbHVlIjoiM2luek9hdWxMYmlYbzNJMHc1MmdaSTQ3YVVDRk1GcmhOVG90OEZIVjY1cz0iLCJtYWMiOiI5NjkyYTA1MjE5OTZkNjM0ZWEyYzQ3MTlmMjVmYjFmMDJhMjk1MjcyZGNiOGQ0MTY2MGRjYjQxZjA0ZWM5MmUwIn0=', 0, NULL, '2018-11-05 10:55:54', '2020-08-07 11:33:54', '105262129984671156024', 1, NULL, '1986-12-08', '2015-06-15', NULL, '2015-08-15', 0);
INSERT INTO `users` VALUES (89, 'Phạm Thị Hải', NULL, 'haipt', 'haipt@i-com.vn', NULL, NULL, 0, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1990-06-20', '2016-05-05', NULL, '2016-07-05', 0);
INSERT INTO `users` VALUES (91, 'Dinh Thi Binh', 'https://lh3.googleusercontent.com/a-/AOh14GhMuuad46E6rOKSXa4F8qT6mL3mhdwlQUIabQhlMQ', 'binhdt', 'binhdt@i-com.vn', NULL, 'eyJpdiI6ImRVQ2NLeGF6eWc2MHJzd1l2em5zVWc9PSIsInZhbHVlIjoiU3lmT0RKQXdndWVWR0dIRjBZT24rTUxzYjhlaDZZa2dRcXo4YlMzMS9MQT0iLCJtYWMiOiIyOGViYTdiMDkxMjE0MDYzZTgwOGMyYTJjOTlkMGJmYmFlNjJhYWY3MDNhNzVhNGY3ZTU1ZmUzYTFmOWUzMDk5In0=', 2, NULL, '2018-11-05 10:55:54', '2020-08-07 07:14:12', '108081850984623272594', 1, NULL, '1984-09-25', '2011-06-23', NULL, '2011-08-23', 1000916056);
INSERT INTO `users` VALUES (93, 'Nguyễn Thị Hiền', NULL, 'hiennt', 'hiennt@i-com.vn', NULL, NULL, 2, NULL, '2018-11-05 10:55:54', NULL, NULL, 2, NULL, '1990-07-27', '2017-04-18', NULL, '2017-06-18', 0);
INSERT INTO `users` VALUES (100, 'Quỳnh Phạm', 'https://lh3.googleusercontent.com/a-/AOh14GgJ0as6LmQWTyWzS4XlI1mXMkojXrikAGNKxY_8gA', 'quynhpt', 'quynhpt@i-com.vn', NULL, 'eyJpdiI6ImdwZUZLem5MYnZxVVlCWktGcW9Zd0E9PSIsInZhbHVlIjoiNzhPV3NML0ZuMkh5dmFXTnVDRmc0N0N2UytFTkJBNU1IeGlVQzU2TVVWWT0iLCJtYWMiOiI3Y2I4NTgwZjM4YmE5YjRkYTk4MmNiZGU1YzNjNjZiYTk5ZTc1ZDlmOTAwY2JkZGM3NDJjZTM4ZmNiYmUxNTZmIn0=', 0, NULL, '2018-11-05 10:55:54', '2020-08-10 14:51:14', '118237281077846897221', 1, '0000000000', '1995-08-19', '2017-07-10', NULL, '2017-09-10', 723295745);
INSERT INTO `users` VALUES (101, 'Đinh Văn Phú', NULL, 'phudv', 'phudv@i-com.vn', NULL, NULL, 1, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1983-09-28', '2017-08-07', NULL, '2017-10-07', 1039780805);
INSERT INTO `users` VALUES (102, 'Lê Đức Chiến', NULL, 'chienld', 'chienld@i-com.vn', NULL, NULL, 0, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1985-07-29', '2017-08-16', NULL, '2017-10-16', 669125710);
INSERT INTO `users` VALUES (103, 'Đinh Thị Minh Phương', NULL, 'phuongdtm', 'phuongdtm@i-com.vn', NULL, NULL, 2, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1988-09-25', '2017-10-04', NULL, '2017-12-04', 984344771);
INSERT INTO `users` VALUES (105, 'Lê Ngọc Huyền', NULL, 'huyenln', 'huyenln@i-com.vn', NULL, NULL, 2, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1992-02-24', '0001-01-01', NULL, '0001-03-01', 0);
INSERT INTO `users` VALUES (108, 'Nguyễn Thị Quỳnh Trang', NULL, 'trangntq', 'trangntq@i-com.vn', NULL, NULL, 2, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1992-08-31', '2017-02-13', NULL, '2017-04-13', 1004045546);
INSERT INTO `users` VALUES (109, 'Thúy Vũ Thị', 'https://lh3.googleusercontent.com/a-/AOh14Gi8U0Fd3bkaHr2GGP_5qVgo8PB8bti6iqEUqHmt', 'thuyvt', 'thuyvt@i-com.vn', NULL, 'eyJpdiI6ImIrY05vbkdCbHE5MS9SRGhadnd0alE9PSIsInZhbHVlIjoiZlZuaXY2VmljKzJZT3hNbVZmdFo2bEk3RTRPSWdsUlBpY2NnSFY4L05DUT0iLCJtYWMiOiI2MTM2YmJhNWYxM2IzZjU3ODQwZWUxNjRmMDZmMDBmZjIwNzVhMzUwNzJhMjlkZjUwZmFjNzllOWU2MDc3OGE2In0=', 2, NULL, '2018-11-05 10:55:54', '2020-08-12 13:22:38', '114452003071712386733', 1, '0000000000', '1991-05-20', '2015-12-14', NULL, '2016-02-14', 0);
INSERT INTO `users` VALUES (111, 'Lê Thị Hằng', NULL, 'hanglt', 'hanglt@i-com.vn', NULL, NULL, 0, NULL, '2018-11-05 10:55:54', '2020-08-06 18:37:36', NULL, 1, '0000000000', '1992-10-30', '2015-04-13', NULL, '2015-06-13', 0);
INSERT INTO `users` VALUES (112, 'Nguyễn Thu Hương', NULL, 'huongnt', 'huongnt@i-com.vn', NULL, NULL, 2, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1990-02-18', '2015-04-14', NULL, '2015-06-14', 1101333257);
INSERT INTO `users` VALUES (113, 'Trần Thành Công', NULL, 'congtt', 'congtt@i-com.vn', NULL, NULL, 1, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1990-09-17', '2014-06-08', NULL, '2014-08-08', 1005766583);
INSERT INTO `users` VALUES (117, 'Nguyễn Tuấn Linh', NULL, 'linhnt', 'linhnt@i-com.vn', NULL, NULL, 0, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1989-12-06', '2018-05-02', NULL, '2018-07-02', 807684625);
INSERT INTO `users` VALUES (118, 'Vũ Đình Cường', NULL, 'cuongvd', 'cuongvd@i-com.vn', NULL, NULL, 0, NULL, '2018-11-05 10:55:54', NULL, NULL, 1, NULL, '1985-06-15', '2018-05-17', NULL, '2018-07-17', 498086348);
INSERT INTO `users` VALUES (130, 'Duong Thi Minh Huong', NULL, 'huongdm', 'huongdm@i-com.vn', NULL, 'eyJpdiI6IkhmRFlDWFBqRjNuZng0QUMxaCtSRlE9PSIsInZhbHVlIjoiQUFHQmNiazRLSWVYdEMvMHhGZmdSdzVMS2NhSEdsMzM2cEtqWWhmWlVRcz0iLCJtYWMiOiI2NmQ1ZDllNjcyMmEyNDRiOGIwMjU0Y2M0ZjBlZmRiNjA3MDA4NzY5YjFiZDMyNjYwYjViZWY4ODc5YTI4NzRlIn0=', 2, NULL, '2018-11-09 08:37:24', '2020-07-21 16:50:58', '112649292761275430259', 1, NULL, '1984-04-13', '2010-04-16', '2010-06-16', '2010-06-16', 705702303);
INSERT INTO `users` VALUES (131, 'Phạm Việt Dũng', NULL, 'dungpv', 'dungpv@i-com.vn', NULL, NULL, 0, NULL, '2018-11-12 17:57:52', NULL, NULL, 1, NULL, '2018-11-13', '2008-11-13', '2009-01-13', '2009-01-13', 923944596);
INSERT INTO `users` VALUES (132, 'Huyền Vũ Thị', NULL, 'huyen.vuthi', 'huyen.vuthi@i-com.vn', NULL, 'eyJpdiI6InlQenJieWFMRGpjeVBzRWNxMEZ1bFE9PSIsInZhbHVlIjoiZkRwL1prZUdyQk5xSzNSRjZWc2xUYVdsRU8vOG9UMGJ2R01iUVZkQjRGOD0iLCJtYWMiOiI5MDg4NTA1YzczNWQzNmFkNDg4NmQ1NjI0Y2Q5M2NkYmE3MjJkMTgwNjE5ZTkyZjQ1NmI3NDY2NmY0YTUzNjU4In0=', 2, NULL, '2018-11-15 08:31:59', '2020-07-21 16:52:12', '110842661040601083340', 1, NULL, '1970-01-01', '2017-05-29', '2017-07-29', '2017-07-29', 1027054137);
INSERT INTO `users` VALUES (134, 'Trang Nguyễn Thu', NULL, 'trangnt', 'trangnt@i-com.vn', NULL, 'eyJpdiI6ImYwTmhnWDNmWTNVU2p1bUZQUnN6WkE9PSIsInZhbHVlIjoiSlpFZkp4NXh5NThGS042Q0JVN2U1bVR0YUQ2a0VZR0ZObW4vbkgvbjJHaz0iLCJtYWMiOiIyY2JmZjJlMDQ1ZDcyY2QwOGE2NzU0NjkzZWNmNDM5NTc0ZDI2MmJjY2I3YTM5YzQ0ZDY4NTI1Y2U1NzVmZDA2In0=', 2, 'Loa9xzADGSLTOiexC5ZnsB8jo8DEEF33fE1ZO8fN7EqNI1GEeSkbARnvEhZP', '2018-11-23 17:32:18', '2020-07-15 11:03:53', '107615472071422908491', 1, NULL, '1970-01-01', '2018-11-23', NULL, '2019-01-23', 1085541421);
INSERT INTO `users` VALUES (135, 'Trần Thị Mai Hương', NULL, 'huongttm', 'huongttm@i-com.vn', NULL, 'eyJpdiI6IjZtU0RPTDRET2xxc3ZOWVFKVm5rQWc9PSIsInZhbHVlIjoiaThTNmgrNUZtRU9MQzBRMDlaS1BUMy9QdzFUbFV6VVQ0clRtUEtvYndNND0iLCJtYWMiOiJiYmY0NjMzNjM0NmVlOWEzM2Q1NGQwYTIxZDM4YjkxYzllNjYwODQ4MDBiZDMwMjI1NjAyNDY5OTgzMjJmNDY1In0=', 2, NULL, '2018-12-12 14:01:27', '2020-07-07 16:20:45', '107477638938085718655', 1, NULL, '1970-01-01', '2018-09-24', '2018-11-24', '2018-11-24', 881046764);
INSERT INTO `users` VALUES (137, 'Nguyễn Thị Ngọc Thùy', NULL, 'thuynn', 'thuynn@i-com.vn', NULL, 'eyJpdiI6IkFXNUdqMnRtL1pmSkF4YkJWbDkzNUE9PSIsInZhbHVlIjoiVzhGWnZIT0hWdVBaTVhmYjc4dmJmc2lZdnlZZ3lINDdlM2twSnBQUmhDaz0iLCJtYWMiOiI4MWZlYzI3MjE5NDdlNGIzNzNiYTBjNGM2NjUyZWY3OGIxM2Y5MjFlMjk0MDdjOGE1NzgyM2IwZjRiYjM2YmIwIn0=', 2, NULL, '2018-12-28 09:25:41', '2020-08-07 14:23:40', '106978075456420782610', 1, '0904896496', '1970-01-01', '2009-03-09', NULL, '2009-05-09', 791234825);
INSERT INTO `users` VALUES (138, 'Thu Vu Minh', NULL, 'thuvm', 'thuvm@i-com.vn', NULL, 'eyJpdiI6ImNVZE5tb3AzVy9wWWxyL3hqZ2YrbkE9PSIsInZhbHVlIjoiczgzMTZyMXhyOWNINGtOL3RDYkpBOWhIRll5T2dTRXNidFplMDJQdEsxUT0iLCJtYWMiOiIwMmI3MGUzMWNmMTg4NTliMzVlOGU2N2NiMGU0MGE1NTA4Y2FjMmZiMmFiYTNlYTZlZTM5MzI1N2FkZTI3OWE4In0=', 2, NULL, '2018-12-28 09:25:37', '2020-07-20 17:39:23', '114029172024121658064', 1, NULL, '1970-01-01', '2015-11-02', NULL, '2016-01-02', 1091056075);
INSERT INTO `users` VALUES (139, 'Anh Vân', 'https://lh3.googleusercontent.com/a-/AOh14Gj87yjeP7nahmjzHU04Jgjfe5v0qE_MydWNJZML', 'vananh', 'vananh@i-com.vn', NULL, 'eyJpdiI6IjMrSUlodURaeDlyVFBIRWhDTDNxZHc9PSIsInZhbHVlIjoiMEhpajdHUXBGVDRTcHgvZHQrYkErZUx4S2cwMCthaTkyMUpJSE9xRWwxOD0iLCJtYWMiOiIxM2ViZGZkMjM4NWM4N2RmNDg0YWJiMzVmY2NiYzBiYzVjYWU0MmM2ZjMxMWMwMmVhNjkzMmM3MGZmNWJhZTU0In0=', 2, NULL, '2018-12-28 09:31:01', '2020-08-06 10:51:45', '112451520481176438396', 1, NULL, '1983-10-29', '2018-03-01', NULL, '2018-05-01', 851058214);
INSERT INTO `users` VALUES (141, 'Dũng Nguyễn Tiến', NULL, 'dungnt2', 'dungnt2@i-com.vn', NULL, 'eyJpdiI6ImRCbDhtdzk4K2FVMDFad0s1a2FseXc9PSIsInZhbHVlIjoibnlQMGFWcWlNZWZyTE5TZHdueE90TThTdjVhQ3l0eFRQQ1NTTTVwUXprZz0iLCJtYWMiOiJkYmI4NTA1NmJiYjRjMzRmM2E1ZThiZGUxNDg4NGNhYzFlNDc5MjBlOTkwMTc3YTk3ZWU5NzI1ZDI0Y2NjOWI0In0=', 1, NULL, '2018-12-28 09:31:07', '2020-07-13 10:16:39', '106630321196327323041', 1, NULL, '1970-01-01', '2016-03-01', NULL, '2016-05-01', 407821912);
INSERT INTO `users` VALUES (156, 'Phạm Hồng Huế', NULL, 'hueph', 'hueph@i-com.vn', NULL, 'eyJpdiI6IkwxUnVPeUxJMlE1b2pTYmtMd1FoSEE9PSIsInZhbHVlIjoibkEyWVcrR1FlYXBVZHN5WHBadnBUL25haWVlb1g5dHVEWDdtcmlFTXFZVT0iLCJtYWMiOiI2MGQ0N2Y3Y2Q0YTNmM2RlNDA4OTljZGFjYjNhZmU1NjBjY2JlNmQxYTA2NTE5NDU1YjZhYTYwNzVmZDUyMTQ2In0=', 2, NULL, '2019-02-20 11:30:39', '2020-08-06 18:06:44', '103134019659878316888', 1, '0986168489', '1970-01-01', '2019-02-20', NULL, '2019-04-20', 754794430);
INSERT INTO `users` VALUES (164, 'Nguyễn Đức Thịnh', NULL, 'thinhnd', 'thinhnd@i-com.vn', NULL, NULL, 1, NULL, '2019-03-15 09:31:38', NULL, NULL, 2, NULL, '1970-01-01', '2019-03-15', NULL, '2019-05-15', 0);
INSERT INTO `users` VALUES (166, 'Trần Thị Phương Giang', NULL, 'giangttp', 'giangttp@i-com.vn', NULL, NULL, 2, NULL, '2019-03-22 11:15:11', NULL, NULL, 1, NULL, '1988-02-03', '2019-03-22', NULL, '2019-05-22', 822994647);
INSERT INTO `users` VALUES (167, 'Vũ Bảo Trâm', 'https://lh6.googleusercontent.com/-hNtNk_KEnho/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuckecSuLKT8P3Upy-p1iWYrnwEMstg/photo.jpg', 'tramvb', 'tramvb@i-com.vn', NULL, 'eyJpdiI6ImIxUDB0dWJiQmRhaDBzaTNXWTE2ekE9PSIsInZhbHVlIjoibkV3dE4vZittVEorRTVhYVk2WEU0djlmcThuQWZ0amVNd3g3ZURTV1MyND0iLCJtYWMiOiI0NWU2NWE1YTc3MTc1MWUxMGNlNTg2YTQ5NzFlNWYwNGQ2NWNhNjE3ODE3NTg2N2U0OWI5N2MwNWIxZWY0NjNjIn0=', 2, NULL, '2019-04-03 14:42:51', '2020-08-06 09:32:28', '105197788834028576372', 1, NULL, '1970-01-01', '2019-04-03', NULL, '2019-06-03', 1052272259);
INSERT INTO `users` VALUES (168, 'Trương Thị Nhụy', NULL, 'nhuytt', 'nhuytt@i-com.vn', NULL, NULL, 2, NULL, '2019-04-08 13:15:09', NULL, NULL, 2, NULL, '2019-11-25', '2019-04-08', NULL, '2019-06-08', 831455243);
INSERT INTO `users` VALUES (170, 'Nguyễn Thị Thúy Hằng', NULL, 'hangntt', 'hangntt@i-com.vn', NULL, 'eyJpdiI6IlNERWkvR0dxdFkzT3VMUVBScUNPcmc9PSIsInZhbHVlIjoiZU1MdWpFMUN0Z3M2R1ovUjVwUUFLYWtEYkZ6U0dvZnJiUmxzUjNCVVc4ND0iLCJtYWMiOiJkYjdkODQ3MzQzZTYyODY0ZGQ2ZmMzMDBlN2RkZGFkMDMzZjg5ZDlmODA5NGRiZDI2MWQ5YmNjYjRlMGNlN2ZhIn0=', 2, NULL, '2019-04-10 10:16:25', '2020-07-13 10:30:37', '108030322267372622075', 1, NULL, '1970-01-01', NULL, NULL, NULL, 1107064422);
INSERT INTO `users` VALUES (171, 'Trần Thu Hương', NULL, 'huongtt', 'huongtt@i-com.vn', NULL, NULL, 2, NULL, '2019-04-12 17:05:58', NULL, NULL, 1, NULL, '1970-01-01', NULL, NULL, NULL, 1133865245);
INSERT INTO `users` VALUES (172, 'Đỗ Ngọc Việt Mỹ', NULL, 'mydnv', 'mydnv@i-com.vn', NULL, NULL, 2, NULL, '2019-04-25 19:22:33', NULL, NULL, 2, NULL, '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (173, 'Phùng Thị Huệ Hà', NULL, 'colaocong', 'colaocong@i-com.vn', NULL, NULL, 2, NULL, '2019-05-09 08:19:38', NULL, NULL, 1, NULL, '2019-05-09', '2019-01-09', NULL, '2019-07-09', 0);
INSERT INTO `users` VALUES (175, 'Grab Report', NULL, 'grab', 'grab@i-com.vn', NULL, NULL, 2, NULL, '2019-05-14 17:21:44', NULL, NULL, 1, NULL, '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (176, 'Lê Văn Dự', NULL, 'dulv', 'dulv@i-com.vn', NULL, NULL, 1, NULL, '2019-05-15 09:04:45', '2020-08-06 18:04:57', NULL, 0, '0000000000', '1999-11-15', '2019-05-08', NULL, '2019-07-07', 0);
INSERT INTO `users` VALUES (179, 'Nghiêm Thu Trang', NULL, 'trang.nghiemthu', 'trang.nghiemthu@i-com.vn', NULL, NULL, 2, NULL, '2019-05-15 09:21:59', NULL, NULL, 2, NULL, '1996-10-24', '2019-06-13', NULL, '2019-07-12', 0);
INSERT INTO `users` VALUES (183, 'Thông báo Chấm công', NULL, 'thongbao', 'thongbao@i-com.vn', NULL, NULL, 2, NULL, '2019-06-04 08:44:03', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (184, 'Hứa Thị Hoàng Yến', NULL, 'yenhth', 'yenhth@i-com.vn', NULL, 'eyJpdiI6IkRCSTQvcjZkQUJXSzFrWFBabWJCeEE9PSIsInZhbHVlIjoiTTJleTFic3REUGlQL1Q3WjIvNWpiVXQrWGE1U2YrM2tvaW1SY2JOWEJ2UT0iLCJtYWMiOiI3ZDY5MzlhNWQzNGVjYTQzMmRlYWU3NGM5ZjkwNWRmYzM2YjcyOTAyMjg5YTRkZGNiMTM3NzkyYzhkZTQxZGY0In0=', 2, NULL, '2019-06-06 09:00:49', '2020-07-28 10:38:04', '116108706152311336403', 1, NULL, '1992-06-14', NULL, NULL, NULL, 823983760);
INSERT INTO `users` VALUES (186, 'Dương Linh Trang', 'https://lh4.googleusercontent.com/-vI3ZupiSF_w/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmOsxFjrdXXZSkVzheXtmcBH1omog/photo.jpg', 'trangdl', 'trangdl@i-com.vn', NULL, 'eyJpdiI6IjZwUW9hOFdqZ3lNUks5SmFiY0hRZVE9PSIsInZhbHVlIjoiT0ZuQ0E2NkJyMjlrU090cjByOUxtUjJNWGxBdkFmRjlSaE9EZnlka1Nybz0iLCJtYWMiOiI3ZjM0MmQxYzg4ZDE5MDZiYWM1YTQ5YTcyMDIyYmEwOTQ3OWY0ODEyMTU4YzlkNjNjYjY5YjA3OGE4MGFkNDg3In0=', 2, NULL, '2019-06-10 10:11:33', '2020-08-06 07:51:49', '103169012251470095272', 1, NULL, '1997-06-10', NULL, NULL, NULL, 850242875);
INSERT INTO `users` VALUES (188, 'Nguyễn Hoa Thúy Lê', NULL, 'lenht', 'lenht@i-com.vn', NULL, NULL, 2, NULL, '2019-06-11 08:54:34', NULL, NULL, 2, NULL, '2019-06-11', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (198, 'Đỗ Linh Chi', 'https://lh3.googleusercontent.com/a-/AOh14Ghi1V4dISa-dk384n7GRnbzGcQCOaFJJekEnwzIBQ', 'chidl', 'chidl@i-com.vn', NULL, 'eyJpdiI6Inhnclg1MXV4SGR5SEdFeEtPMHFnSmc9PSIsInZhbHVlIjoiR1hzU2FrVW1jZTlqOEVBbmJEQy9QakNEb1JiQ2lGeFVnRER4aWEzekU0QT0iLCJtYWMiOiI0MzE0NTU0MWE2OTBlZDg5ZTc3NThkODYyNDViNmNjZDZiN2M2YjFhMjZhMDM3OGYzNWE2YWY4ZWFiOWFlNGI1In0=', 2, NULL, '2019-06-24 10:13:21', '2020-08-06 15:34:06', '113279947294938451610', 1, NULL, '1970-01-01', NULL, NULL, NULL, 1029599190);
INSERT INTO `users` VALUES (199, 'Nguyễn Thị Mỹ Linh', 'https://lh4.googleusercontent.com/-Ce2gayCeEoc/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuckC-pM3hgJ_Lj2Ohk6p4GNfBBeINA/photo.jpg', 'linhntm', 'linhntm@i-com.vn', NULL, 'eyJpdiI6IllFdURpNnRFaHF1ZW9BNjU1YVNOUVE9PSIsInZhbHVlIjoibU4wOEV6c0NleVZ5OCtHMmFnbTNjUmFMREhLL095L0l4dmFNUWxoQXRxaz0iLCJtYWMiOiJmNDg0MmQ0ZjkzMjBkYjI1NzU4ZTEwODI3ODBmOTJlYjgyMjdkODZhOTA3NTg3ODY2MjRiMWU3OWY3OThjMmQzIn0=', 2, NULL, '2019-06-24 16:12:37', '2020-08-06 15:16:28', '110884426682917057003', 1, NULL, '1996-07-28', NULL, NULL, NULL, 999160786);
INSERT INTO `users` VALUES (200, 'Đoàn Duy', NULL, 'duyd', 'duyd@i-com.vn', NULL, NULL, 1, NULL, '2019-06-24 16:21:35', '2020-08-06 18:02:14', NULL, 0, '0000000000', '2020-06-24', NULL, NULL, NULL, 818287418);
INSERT INTO `users` VALUES (201, 'Nguyễn Quốc Bảo', NULL, 'baonq', 'baonq@i-com.vn', NULL, NULL, 1, NULL, '2019-06-25 08:19:12', '2020-08-06 18:04:13', NULL, 1, '0000000000', '1996-03-23', NULL, NULL, NULL, 859641965);
INSERT INTO `users` VALUES (217, 'Dư Diệu Thư', NULL, 'thudd', 'thudd@i-com.vn', NULL, NULL, 2, NULL, '2019-07-30 07:56:56', '2020-08-06 18:01:32', NULL, 0, '0000000000', '1970-01-01', NULL, NULL, NULL, 631020670);
INSERT INTO `users` VALUES (218, 'Nguyễn Văn Cường', NULL, 'cuongnv', 'cuongnv@i-com.vn', NULL, NULL, 1, NULL, '2019-07-30 07:59:59', NULL, NULL, 2, NULL, '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (219, 'Ngô Thị Liên', NULL, 'liennt', 'liennt@i-com.vn', NULL, NULL, 2, NULL, '2019-08-07 16:52:05', NULL, NULL, 1, NULL, '1970-01-01', NULL, NULL, NULL, 1033711491);
INSERT INTO `users` VALUES (220, 'Văn Giang Lê', 'https://lh6.googleusercontent.com/-JXSWwYV2sFw/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclvNZ7QuCsxIbTIO7M60LLf8iCDkw/photo.jpg', 'gianglv', 'gianglv@i-com.vn', NULL, 'eyJpdiI6Ik5ocGR1dmhwTVZnTEtnMWZDZXdOY0E9PSIsInZhbHVlIjoieVNGRXBvdVNSQTV5eXQ3VDlUajM1NXpLVWk3ZTUrTTZSSUpwbUJNNk9tST0iLCJtYWMiOiI4ZDM2ZGJkNTNhNTkxZTkxMmYwMGE0NDhjODcyYzk2YmUxMmNjNmNjNWFhZjk4MjY1OWY0ZTIzYTA1NzdlYzlmIn0=', 1, NULL, '2019-08-19 08:26:59', '2020-08-12 14:50:17', '113045351451039235462', 1, NULL, '2019-08-19', NULL, NULL, NULL, 380855472);
INSERT INTO `users` VALUES (221, 'Nguyễn Thị Huyền', NULL, 'huyennt', 'huyennt@i-com.vn', NULL, NULL, 2, NULL, '2019-09-03 08:42:24', NULL, NULL, 2, NULL, '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (223, 'Trương Thị Thu Thủy', 'https://lh6.googleusercontent.com/-8nxDcHkSt7Y/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnR6EPGzs-NPJAYR7HQXD3i0IZp4w/photo.jpg', 'thuyttt', 'thuyttt@i-com.vn', NULL, 'eyJpdiI6IitxRG1NTlpuMzhlMVV2aTNVL1Q4MFE9PSIsInZhbHVlIjoialloUmNIWFFDdkRNaFYycjFnOVY2VzR5dXd0QTN5TjdGWFVRMVpHenBaTT0iLCJtYWMiOiIzOTk2ZDRmNTE5YWY4NTRlYzM1MGEzMzdkMzc4YjMyODEwOWY3ZDFlNTBlYWVjNDQyNzUwZTZhYmUwMjc1YjhlIn0=', 2, NULL, '2019-09-16 09:51:55', '2020-08-06 13:31:03', '117710181889236022576', 1, NULL, '1970-01-01', NULL, NULL, NULL, 663845937);
INSERT INTO `users` VALUES (224, 'Nguyễn Hồng Thái', NULL, 'thainh', 'thainh@i-com.vn', NULL, NULL, 1, NULL, '2019-09-16 16:39:40', NULL, NULL, 2, NULL, '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (225, 'Ninh Việt Anh', 'https://lh3.googleusercontent.com/-CbvMaJV7_vE/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucn-TVA4X1mCU7VS5wJf_I5-sJ1faw/photo.jpg', 'anhnv', 'anhnv@i-com.vn', NULL, 'eyJpdiI6InJaTkovQUpTaS9LTmRIOWkrL1p2cGc9PSIsInZhbHVlIjoiWEhaTDllOGpNSDVIZjVIRUVJamZuS014b0VLYW1GNW9jSHJNUHZhbGpSVT0iLCJtYWMiOiI2ODUyZDgzOTAyY2M3MTkzNDM1YmViMjJkMzE0ZTE5NDlmYTMxNjFmZTIyMDdmZWZiYWRhMzZhODYwMjQ3NWRhIn0=', 1, NULL, '2019-09-23 09:20:12', '2020-07-29 13:35:52', '116062693497251149290', 1, '0328880000', '2020-08-23', NULL, NULL, NULL, 846520456);
INSERT INTO `users` VALUES (226, 'Nguyễn Văn Huy', 'https://lh5.googleusercontent.com/-QV0l-eGQIws/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmDAGowxeAg2cnb_9y87uQ7XaMXqw/photo.jpg', 'huynv', 'huynv@i-com.vn', NULL, 'eyJpdiI6IjlwZ3NHSmQrZWI0aUkzUUZWWHM3UkE9PSIsInZhbHVlIjoiajFqRDgzbDhweTNXeXFkbllLeHdOdU9iTWkrQ1BXeldGY053SDBZNE8rOD0iLCJtYWMiOiI5N2M5YWVjZWNkNzgwNDMyZGE4NzMwY2QxYzMwZDkzMTUxYjY5NDQ2OTZkYzI0MTgzOWYwOTM4NTM0ZmMzMjRiIn0=', 1, NULL, '2019-09-30 10:00:47', '2020-08-11 14:28:40', '117385167852928279486', 1, NULL, '1986-08-03', NULL, NULL, NULL, 1120435873);
INSERT INTO `users` VALUES (227, 'Nguyễn Thanh Hương', NULL, 'huong.nguyenthanh', 'huong.nguyenthanh@i-com.vn', NULL, NULL, 2, NULL, '2019-10-10 14:23:24', '2020-08-06 17:56:05', NULL, 0, '0000000000', '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (228, 'ICom VietNamNet', NULL, 'icom', 'icom@i-com.vn', NULL, NULL, 2, NULL, '2019-10-11 13:46:18', NULL, NULL, 1, NULL, '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (229, 'ICOM CHAM SOC KHACH HANG', NULL, 'giaiquyetkhieunai', 'giaiquyetkhieunai@i-com.vn', NULL, NULL, 2, NULL, '2019-11-18 15:37:27', NULL, NULL, 1, NULL, '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (231, 'Phạm Ánh Dương', NULL, 'duongpa', 'duongpa@i-com.vn', NULL, 'eyJpdiI6IjVSMFNkRllXZENidy84MkZwNW1PM2c9PSIsInZhbHVlIjoiYThFZlUxN3V1Y2xsNmY4Z3RSM1h3TFJzU2h6SzMxZ3B0dnBnUnhXRmdZMD0iLCJtYWMiOiIwNDgwODZmZGEzMjQ2MzM1Mjc4YTM1ZTlmMGVlZjI2MDM1MDVmY2Q0NjM4ZDFmOGY3MmRkYjUwOGZhYzhjNjM4In0=', 2, NULL, '2019-11-28 09:45:48', '2020-07-01 16:01:11', '118357067512621270339', 1, NULL, '1970-01-01', NULL, NULL, NULL, 853325638);
INSERT INTO `users` VALUES (232, 'Đỗ Văn Thịnh', 'https://lh3.googleusercontent.com/a-/AOh14GhZatJdmLH4Uu17HEXHOW-nf5EawYDuzyoBHh8m', 'thinhdv', 'thinhdv@i-com.vn', NULL, 'eyJpdiI6Ink0NXZSdW1oWjBVc0VZOUZvNEJZSUE9PSIsInZhbHVlIjoiSXY5SjRBZjJsQWhJOGpTN3JrbHlpNTNCRmdUTVN0ZWIybC91SjJzK05udz0iLCJtYWMiOiIwNWFhMmY4N2ViYTlkNzdjOTBmOGVkMjRmNjA2YTg4YjEzYjk4MzUzNDQyMjNmNjMyYmIwNzFlN2IxYzhjNGVkIn0=', 1, NULL, '2019-12-16 17:18:29', '2020-08-05 16:43:34', '110512374767832060516', 1, NULL, '1970-01-01', NULL, NULL, NULL, 519413827);
INSERT INTO `users` VALUES (233, 'Phan Tam Hà', 'https://lh5.googleusercontent.com/-UaVbUTKGy5s/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucliJSSiNBkxsBCBAYOEGiik0MuGwA/photo.jpg', 'hapt', 'hapt@i-com.vn', NULL, 'eyJpdiI6IklCNG5oUEZKWkxrbkMvNVF1WUVJWlE9PSIsInZhbHVlIjoiOFhlT3FQOFNPbGk1Y2ZVQlJ3clVlbk5saTJJN2NpYVFYK0VFcUxxM3VrTT0iLCJtYWMiOiIyZTI5Y2JkZTViMjczZWU4Njk4YTI5MGZkMTVhYTM0YjU1MmNiZTYyYWMwZTNkMTUyZWIxMDQ0NGY4ODExNDE4In0=', 1, NULL, '2019-12-26 09:27:57', '2020-08-06 15:43:45', '103471520567679871799', 1, NULL, '1970-01-01', NULL, NULL, NULL, 1096821805);
INSERT INTO `users` VALUES (234, 'Bảo Ngọc', 'https://lh3.googleusercontent.com/a-/AOh14GgFK5oroViGdxIC_YcQxmw3kPgdNA3RbM-4JJ3C', 'ngocntb', 'ngocntb@i-com.vn', NULL, 'eyJpdiI6IkNNNng1dW53L3BjeGVpcVUzb0hVdkE9PSIsInZhbHVlIjoiZm41bFBFWDYvbEdGeEd4emFJOWsrMzlmQXZDZUlGbldROXp5SGxxSWExND0iLCJtYWMiOiI4MDFlZjNlOWYxOTkxZmQwYTQzNWZiOTYwN2VkY2ViMzQyZTFjMjUzM2MzMzZlMzNiNGQwZTBiNDUwMWIxY2E1In0=', 2, NULL, '2020-01-10 08:41:35', '2020-08-07 16:09:49', '107676461286663984914', 1, NULL, '1970-01-01', NULL, NULL, NULL, 981615629);
INSERT INTO `users` VALUES (235, 'Đinh Thị Hương Trà', NULL, 'tradth', 'tradth@i-com.vn', NULL, 'eyJpdiI6IjZVOWtFckZrV05palBEelk0UWdyb2c9PSIsInZhbHVlIjoiejJsS3NBdDRZNE1aK05WYnFheGhiMHI5NGJ1NlFIZlIxWWdnTCtKY2NYQT0iLCJtYWMiOiI1MzRkOTkyM2VlNmZjZTI1YTBlMDViNjEyYmI0MTU0YzYwMjA2ZTY0MDAwNzhkNGI5MjlkZTljNTJiYzM4MmQ5In0=', 2, NULL, '2020-01-10 16:57:24', '2020-07-28 10:25:29', '115982102869732216253', 1, NULL, '1970-01-01', NULL, NULL, NULL, 1004012922);
INSERT INTO `users` VALUES (236, 'Phòng HCNS', NULL, 'hr', 'hr@i-com.vn', NULL, NULL, 2, NULL, '2020-01-13 09:05:31', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (237, 'Nguyễn Tuấn Anh', 'https://lh3.googleusercontent.com/-0iXPdrv0Dg0/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmfdj49-LNlEcQL0hmnAIBL9I3QoQ/photo.jpg', 'anhnt', 'anhnt@i-com.vn', NULL, 'eyJpdiI6InRrQzZJM0RuK3FQSW1ZWHgxamhnMEE9PSIsInZhbHVlIjoiQ244SUZHUVpPTG5wWkhPTGEyWUx3b0Vtd01neUZ3VUN0NHVPTERSU2hqYz0iLCJtYWMiOiJhMzhmZWQ4NTRjOGZhZWZkNTgwM2VlNDM3YmNjMTNkYzg5NjI0ZTFiY2FlNmQ3YTdmNjMzN2RkNjFhZTA0OTZiIn0=', 2, NULL, '2020-01-15 16:16:49', '2020-08-07 14:15:15', '104230810649163672370', 1, '0000000000', '1970-01-01', NULL, NULL, NULL, 1101086530);
INSERT INTO `users` VALUES (238, 'Đặng Bích Liên', NULL, 'liendb', 'liendb@i-com.vn', NULL, NULL, 2, NULL, '2020-02-03 15:03:34', NULL, NULL, 1, NULL, '1970-01-01', NULL, NULL, NULL, 1005363646);
INSERT INTO `users` VALUES (239, 'Hoàng Văn Hậu', NULL, 'hauhv', 'hauhv@i-com.vn', NULL, 'eyJpdiI6ImVPY1lwUUF3NUFBNWlEODk5Qm5ldkE9PSIsInZhbHVlIjoiNlZXVzFnelowcjhmSzJoN0tEVzN2N3ZwTXBMU21HSjk3Z1hJeEF0K2JBOD0iLCJtYWMiOiI2MGUyYmVhMDI5ZDRmNjY3ZmYxNzQ4MWNlMzBlZjU0MTk2ZDhkOWY3ODI2MDc0YmM1MDI4YzA4MDM5ZDdjYjRmIn0=', 1, NULL, '2020-02-07 12:48:46', '2020-07-17 10:25:18', '113085403505287423834', 1, NULL, '1970-01-01', NULL, NULL, NULL, 1090636210);
INSERT INTO `users` VALUES (240, 'Trần Thị Cẩm Tú', 'https://lh3.googleusercontent.com/a-/AOh14GhpOEOhpG6CaWDpzsDDQlEH7IRKhg0tRCIdUqBPrg', 'tuttc', 'tuttc@i-com.vn', NULL, 'eyJpdiI6InNqc3lLeWIwZkZlVm9jaHYwWlZDTFE9PSIsInZhbHVlIjoibUdGeWRkMlc4RUlvWEpaTUcrbGdzZ1BnSkFMSk45Q2NNcVgwMnhpSXZPUT0iLCJtYWMiOiI1ZDE4NjFkN2FiNGViODEwNDA3ZWM5MmQ1MmI4MTIzNWZjOWJiNmE2YWFkOWI3NzhhNTg2NzYxZTgzZWQ4ZTBmIn0=', 2, NULL, '2020-02-12 15:43:59', '2020-08-06 08:29:53', '117519929445414844076', 1, NULL, '1970-01-01', NULL, NULL, NULL, 1005363646);
INSERT INTO `users` VALUES (241, 'Trương Thị Tú Oanh', NULL, 'oanhttt', 'oanhttt@i-com.vn', NULL, 'eyJpdiI6IlVZOWc0YzBvWGxxWlMxU20raitMK1E9PSIsInZhbHVlIjoiV3lJZ0lCSm9hdUFpdDJBdVZLc3h4ZzA5dUIrVjJMQ3hJK2NhSS9nU3Vqaz0iLCJtYWMiOiI3MTQ0ZWI3MDMzOGE0YTFlNTQwZTgwYjcyMjI0Nzg4NDU2Nzg4ZDkxZjNiNDY5YTFhNjI2YWE1ZTBiNzU3ZmMyIn0=', 2, NULL, '2020-02-17 13:51:11', '2020-07-13 10:03:12', '118437546693343011096', 1, NULL, '1970-01-01', NULL, NULL, NULL, 906432201);
INSERT INTO `users` VALUES (242, 'Nguyễn Thị Thu Hiền', 'https://lh6.googleusercontent.com/-PIq5HliHX9w/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclLqOPIO_-dYHMaW3FLye2JBq1uIQ/photo.jpg', 'hienntt', 'hienntt@i-com.vn', NULL, 'eyJpdiI6ImdudFZvb2F3S1ZqSzBlSy83dE12a1E9PSIsInZhbHVlIjoiUnZxdzE4MlR3T0RYYjZIQmFYMGRaQlN5TmpPZTNCbytadlQ2UUJMTVBjND0iLCJtYWMiOiIyOTBjMmFlYTMzNzI2ZjM3YThjMDZlNGU1MTA4NmZlYTM4MTgyMDFkMzE3OWJiZmEwZmM2NTYzNDMyNmE1ODYxIn0=', 2, NULL, '2020-02-19 18:59:22', '2020-08-06 16:01:32', '114981763421737340936', 1, NULL, '1970-01-01', NULL, NULL, NULL, 493267088);
INSERT INTO `users` VALUES (243, 'Phan Thị Huyền Linh', 'https://lh6.googleusercontent.com/-GmwgGzJEoyk/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmdP57WC0kFl3RnAlhz-5Te1gTPaw/photo.jpg', 'linhpth', 'linhpth@i-com.vn', NULL, 'eyJpdiI6IjRHR1h0RlFmSGpIRWQycE1wNThkRGc9PSIsInZhbHVlIjoiMU0wOFNvTDdXU3dEVURUSWlvQm9ZVzh3MzF0V2hlZzV2cThNWXFKR2JTdz0iLCJtYWMiOiJiNjJjMTY4ODEyM2M4OWI3Y2IzNThhZWM2OGIwODU1YmRmMmIzZjZmNzcwMTlhN2I1MzMyNWNkM2VlOWQxZjczIn0=', 2, NULL, '2020-03-02 09:54:19', '2020-08-07 14:14:39', '106972580465709956865', 1, '0000000000', '1970-01-01', NULL, NULL, NULL, 883016106);
INSERT INTO `users` VALUES (244, 'Hà Thị Mến', 'https://lh5.googleusercontent.com/-Pycd0CZHaEw/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnLtqgmwzisRpgq7kR253kwPf_3Bg/photo.jpg', 'menht', 'menht@i-com.vn', NULL, 'eyJpdiI6IjhydmNNTWd2U1RGZ082L3BqS01iM3c9PSIsInZhbHVlIjoibm9oMlUwRXFNcnFkZm5najJkb3doeVNKZjh0T0ZudzhYTm9lRkliQWZKYz0iLCJtYWMiOiIxZDAwZDJkYjNkYmQ2NzJmMDhlZWRhZjk4OWE4ZGE4NDY3YTUwYmRlMmM1YzMyY2ZmMWM3NWFiNTk5MjBkNzE1In0=', 2, NULL, '2020-03-02 10:59:37', '2020-08-06 07:20:01', '107580489826051731660', 1, NULL, '1970-01-01', NULL, NULL, NULL, 1132700517);
INSERT INTO `users` VALUES (245, 'Thủy Cù Thị Ngọc', 'https://lh6.googleusercontent.com/-2LVZgWU3UBc/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmALbL73VTwlyAtclVucUiXg34H8Q/photo.jpg', 'thuyctn', 'thuyctn@i-com.vn', NULL, 'eyJpdiI6ImprdXZPNXF3RStGSW9WcmJKaTdvNlE9PSIsInZhbHVlIjoiSDlIRDM1UjViUXZzTjBFb0YyWDFMWEx3QjFVejViMU1xWEplRVVFV2hzND0iLCJtYWMiOiIwMTYyMWM3NTk5YjZlMDJmNDNjMDRhNjY1Y2JiNTQ3ZTdlY2I5OGI2N2YyYmY2ZmRmZDNmYmYzODUxYzM5NWQwIn0=', 2, NULL, '2020-03-09 11:07:39', '2020-08-10 19:41:38', '110683194417073735261', 1, NULL, '1970-01-01', NULL, NULL, NULL, 651128912);
INSERT INTO `users` VALUES (246, 'Nguyễn Thị Việt Hà', NULL, 'hantv', 'hantv@i-com.vn', NULL, NULL, 2, NULL, '2020-03-10 09:12:18', NULL, NULL, 1, NULL, '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (247, 'Lâm Văn Thịnh', 'https://lh3.googleusercontent.com/-A_fj5lvL_BM/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmlwMUKgdenn4ZeVUA24VeQx43dQQ/photo.jpg', 'thinhlv', 'thinhlv@i-com.vn', NULL, 'eyJpdiI6ImlOcVhpNS82UDFFQWVqR2tFbmpXUGc9PSIsInZhbHVlIjoiZUVTOUY5V29MRldPdzY2ckRTQk1lRXpqbFVVSUhLTEJPcnc2T2ZRVnZBaz0iLCJtYWMiOiIxNjczY2QyNDgyOWRmNDNjZTc3MmE1YzdhMWY4YTVhZGU3NjI4OGVjODI2OGU4ODU3MjU4NTA5YzY4MjM3MTM2In0=', 2, NULL, '2020-03-12 17:00:15', '2020-08-12 14:49:34', '104313355093278903620', 1, NULL, '1970-01-01', NULL, NULL, NULL, 1008472977);
INSERT INTO `users` VALUES (248, 'ICOM Tuyển dụng', NULL, 'tuyendung', 'tuyendung@i-com.vn', NULL, NULL, 2, NULL, '2020-03-18 09:38:00', '2020-08-06 17:49:01', NULL, 0, '0000000000', '2020-08-06', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (249, 'Hằng Trịnh Hà', 'https://lh5.googleusercontent.com/-NEp_TxtZ4iA/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucninozQI5MjXe30gkdVAAKnBDLnLg/photo.jpg', 'hangth', 'hangth@i-com.vn', NULL, 'eyJpdiI6ImpuYkM0LzRaQUd4Z1Rqc1JadUFaVHc9PSIsInZhbHVlIjoia3Zxd01sSHZnVkFIVlhyeHFYVVVJRDR0UzBLaEs0eDd2b25SblhVWGdmUT0iLCJtYWMiOiIyOGY1MzhkMmVkOTY4NWM5NTQ1MWZlODE0MzdmMTczMzQxNjViMGJmNGI5ODhiMjJiZjZmZTlmMDFiYmYzMmUyIn0=', 2, NULL, '2020-03-23 17:36:41', '2020-08-07 13:46:25', '112927317750851693312', 1, NULL, '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (250, 'Lê Việt Anh', 'https://lh5.googleusercontent.com/-31Rk49-Nmn4/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucn4vNwfR71GjLorkLZFd8FpMBD4jA/photo.jpg', 'anhlv', 'anhlv@i-com.vn', NULL, 'eyJpdiI6Ik5INFRQalYvSW9QdWdNNnJWYkVCMHc9PSIsInZhbHVlIjoiR2YyQXRwU3JmTXEyNHZtWmJqVUJqYWZSd2dneU5sLzAvRlZhcksxVy9UWT0iLCJtYWMiOiJhMTBlMDVkYjFhY2U4MjRjY2E4YTVkMTdkMTJjODQzNWQ5YjM2ZjA3OTRhYWQ3NDFmYzZiYjkyY2VlZTYxYWU5In0=', 1, 'BO12pzCAZ8q0vDcKhSNywIyZZOz8oOrOATYktCy34TCehWmd4dtooz0jEfsV', '2020-04-03 08:13:58', '2020-07-29 10:48:59', '111973606169379036872', 1, NULL, '1970-01-01', NULL, NULL, NULL, 1067837132);
INSERT INTO `users` VALUES (251, 'Bui Ba Thang', 'https://lh4.googleusercontent.com/-aRFDamtgmfw/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucljcW_yJugcB16rxHVRSLkieiWzdw/photo.jpg', 'thangbb', 'thangbb@i-com.vn', NULL, 'eyJpdiI6IkxwdjNFM2c4a204UW8zWnpDOXFxUEE9PSIsInZhbHVlIjoidTd6NlcwWlp6TkNSV2daaENIaGlLd3o5bEtZazQxWDJrOE5WRGpvZmk4TT0iLCJtYWMiOiIwOTVjMGYxZTk2ZjcwMzhmYWJhNGUwYTNhZDBlODE0OTMwN2YwYWZmMzJmMTE3OTJlYjUyZGI4MzRkNmIyMjk3In0=', 2, NULL, '2020-04-08 15:05:00', '2020-08-05 17:21:43', '115706307271983366759', 1, NULL, '1970-01-01', NULL, NULL, NULL, 547671345);
INSERT INTO `users` VALUES (252, 'Đỗ Thị Trà My', NULL, 'mydtt', 'mydtt@i-com.vn', NULL, 'eyJpdiI6ImhLeWJiTU9sRWVGY014TG1iQUt0d3c9PSIsInZhbHVlIjoiV2hLQ0h1LzhYelkrVFZNQXJWNnBwRlVnVWd5cUw2QXJrbDNDZ0ZGeEF2WT0iLCJtYWMiOiI2OGFmNjBiNmU1NTUwZWUzNGZmMWI5YTFlMmRjZGUwN2E5OWZjNGQwYzBjNWM2Yjg1OWQ4NWE2NjdmYzQzNjc0In0=', 2, 'Cb7DzCRT6LrBp8eqVMps0cPewSdEQqC6sbteF7GbTobhqC3Q6Y0uULZnHwbB', '2020-04-13 10:30:29', '2020-07-27 16:34:17', '105170873791745056898', 1, NULL, '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (253, 'Nguyễn Thị Mỹ Trang', 'https://lh3.googleusercontent.com/a-/AOh14Gj-4FJhy1DZ2l8GdUzNh-r6N71MPkXhh5R5TCWT', 'trangntm', 'trangntm@i-com.vn', NULL, 'eyJpdiI6IkZNVkU1eTloQnVsRmJ0bW9PNGpva1E9PSIsInZhbHVlIjoiNzNPTTFFdTRLY2lBaktYNytqUlZTbno5Y1l2UUxBUVJJOEZseS9rVjVOUT0iLCJtYWMiOiI0ZDRmZmNmODRlZWZhNTY2NTJjMzdmZTNkOGM0ZjFjM2MwZTVkZTlkNzNiOGM0NmJmOGNkMzQxZmM2NmM3ZTZmIn0=', 2, NULL, '2020-04-14 10:51:35', '2020-08-07 14:11:23', '111980689552307719614', 1, '0988928140', '1970-01-01', NULL, NULL, NULL, 1259808644);
INSERT INTO `users` VALUES (254, 'Linh Nguyen Khanh', 'https://lh3.googleusercontent.com/a-/AOh14GgbN0xAP-rpJUT6cN_6v3IXUd65sDoHxn_SQAXz', 'linhnk', 'linhnk@i-com.vn', NULL, 'eyJpdiI6InRDa3lBOVRvbFRNZEpxS0pLT0NVU0E9PSIsInZhbHVlIjoicWxMcnNKNHZlRkVuZnBDTWltWlFkR1p2QnlzTjNRak1TbVJsYjB2MXh4OD0iLCJtYWMiOiI0MjIxZWQ2M2NiMjFjMTJmMmQ5NDJiOGQ2MzM1NmFhNWU3ZTIwZjc5OWY5ZDhjODQ4MjNlOGZiMDM1NTViZDMzIn0=', 2, NULL, '2020-04-20 13:49:25', '2020-08-11 07:12:51', '117065592927096905397', 1, NULL, '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (255, 'Vũ Hải Nam', 'https://lh3.googleusercontent.com/-GS-PVo5-b4A/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnj7KiFq2Yv6qfrOj-ZoBxbbaiLyw/photo.jpg', 'namvh', 'namvh@i-com.vn', NULL, 'eyJpdiI6IlJBenc2ZlBVZFQzU1kvN1QwYXBCWlE9PSIsInZhbHVlIjoic2o3eVUxbm5nS0hhOHRKNVVwaTFKS3ZyM1FFekFKdzNEbFRjZlBIOGtXND0iLCJtYWMiOiI5MWRmZDg2NjZkMTIxZjdmYzI0NTEyYzFhNzRlMGJiNWVlZDBlMGI5MWE4ZTA4ODM2MjI0NGNjZDYyYzhlYmRiIn0=', 1, NULL, '2020-05-04 09:03:34', '2020-08-06 18:46:50', '106578502786083199084', 1, '000000000', '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (256, 'Nguyễn Thị Minh Nghĩa', 'https://lh4.googleusercontent.com/-EpUabFzgR18/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmhoCzPnuxVCm20ZsDLWF5PaYgi7g/photo.jpg', 'nghiantm', 'nghiantm@i-com.vn', NULL, 'eyJpdiI6ImF2bGFVcGRqdUZaVWxJSG9JNmRId0E9PSIsInZhbHVlIjoia0dFaTRkM2g3dTVwbG91dnUrcW1HeHIxVkhvYi9uT3F6SlljZEFnTUxCdz0iLCJtYWMiOiJjNTAyYzIzMDIyNDRmOGY4YWU5MDFmODk2YmY3M2QwYzJkMzQ5MDk0ZTY0ZmUxMmNjZjU0ZTRmNTU4Mjc4YTdkIn0=', 2, NULL, '2020-05-18 14:23:38', '2020-08-07 14:10:44', '118228409713728994142', 1, '0000000000', '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (257, 'Nguyễn Bá Nguyện', 'https://lh6.googleusercontent.com/-YLmRfE-Rq2g/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuck160cEW_YDg72_UTu60fQtfpYVmw/photo.jpg', 'nguyennb', 'nguyennb@i-com.vn', NULL, 'eyJpdiI6Ik5Pdk8rZHZZaDh0UjUxSEpodWZPK0E9PSIsInZhbHVlIjoib0lQN2tUdytjaG1IaEJLSE45d1Ewak1La3VZcXhqWjZQYUlpVkZQR08wRT0iLCJtYWMiOiJhNzYxZWFjZmU0M2M5MDU0MjZmODU4OWFhYzE1M2JlYjM2YmQwMmM4YjYwMTlmOTQyZWEwZGRkNDVjYmM5ZmY5In0=', 2, NULL, '2020-06-01 14:29:03', '2020-08-06 17:46:12', '115226620820494137553', 1, '0000000000', '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (258, 'Nguyễn Thị Hải Yến', NULL, 'yennth', 'yennth@i-com.vn', NULL, NULL, 2, NULL, '2020-06-08 09:53:21', '2020-08-06 17:45:45', NULL, 0, '0000000000', '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (259, 'Vương Trọng Nhân', NULL, 'nhanvt', 'nhanvt@i-com.vn', NULL, 'eyJpdiI6IlJkeW9GSm9ZR1UwN2UxamxFSGNvQkE9PSIsInZhbHVlIjoiWXltYUFDdlVSWlBoL3lRcFYxcCtpNlQ0a1lzYkZBUEtGZjRhd3cxRmY4dz0iLCJtYWMiOiIwMzE3NDRkNmYyYzBkYTFmNTEzYTkyYzgwYjgxMWM2YmY4ZjY4MmRmODMyNGQ2MGQ2NTc1YTViYzI4MWQ2YjYwIn0=', 1, NULL, '2020-06-08 16:08:01', '2020-08-06 17:44:58', '100477769777677799316', 1, '0000000000', '1970-01-01', NULL, NULL, NULL, 756771920);
INSERT INTO `users` VALUES (260, 'Đỗ Đức An', NULL, 'andd', 'andd@i-com.vn', NULL, NULL, 2, NULL, '2020-06-17 09:47:13', '2020-08-06 17:42:13', NULL, 0, '0000000000', '1970-01-01', NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (261, 'Phạm Thùy Dương', NULL, 'duongpt', 'duongpt@i-com.vn', NULL, NULL, 2, NULL, '2020-06-19 13:39:48', '2020-08-06 17:41:43', NULL, 0, '0000000000', '1970-01-01', NULL, NULL, NULL, 1334911699);
INSERT INTO `users` VALUES (262, 'Đào Thị Thanh Tâm', 'https://lh3.googleusercontent.com/-FsDGAtPmYao/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucljrPKKFfWenfrc0j5hQtLQxi0ayw/photo.jpg', NULL, 'tamdtt@i-com.vn', NULL, 'eyJpdiI6IlU2SThYaWhZem1QVXhUejhNTzhnOVE9PSIsInZhbHVlIjoiR3ZMb1JpellXczlJMjcrN1c4TkwraEVUalJNTEY2SndnQTJEL3F0MVFRTT0iLCJtYWMiOiI1OWYxNTMxOTY1NmNlOTVhYTQxNmJlNDI3MzViZmE5NTQyYWE0MzM4YmJmOWUwN2UxYjRiNzgxNzdjNGZlMTEwIn0=', 0, NULL, '2020-08-06 09:42:22', '2020-08-06 14:53:55', '103449102528354219519', 1, '0978817097', '1997-12-23', NULL, NULL, NULL, 983173679);
INSERT INTO `users` VALUES (263, 'Đỗ Thị Thu', 'https://lh5.googleusercontent.com/-1QLIB96NZnw/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclzHYUmEupjUKqOvaTt_pwp0d_OgA/photo.jpg', NULL, 'thudt@i-com.vn', NULL, 'eyJpdiI6IlZQblBMM3p0dkVjN2tZMm9rSXFIZ2c9PSIsInZhbHVlIjoicVVBZ0ZVcjFDUTJyOFZpYkE3NFFtYXAwdWY2SVhDaEZjMkdhS0J5NEZJTT0iLCJtYWMiOiJkODk4MzlmZDc4MDQ1ZmVjYWM1NjcyNzMyNTM1YWI3ODZlNTU3ZGI3NDhjNzk1ZGVmMDlmZjk2YTRiYTg5NGNlIn0=', 0, NULL, '2020-08-06 08:17:40', '2020-08-06 18:48:09', '108189046335028558827', 1, '0977515742', '1996-02-10', NULL, NULL, NULL, 1306088725);
INSERT INTO `users` VALUES (264, 'Nguyễn Duy Tùng', 'https://lh4.googleusercontent.com/-DHJeO_RNeQg/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucl8BAZ1pUJz5Pw0t1MGEuC5K3j_BQ/photo.jpg', NULL, 'tungnd@i-com.vn', NULL, 'eyJpdiI6IlNSOVZ5VzFadlJKUENJOVdZWXNpV0E9PSIsInZhbHVlIjoiYTJQRDM3V0FEUW10YXU5QXd3R01CTndxNlZmcWtpUmdBemp2K1VGaTk0Yz0iLCJtYWMiOiI4YzZlYmFlMmNhMTgxZTY2Yjc2YzVhMWYyOThkMGZjYjBhYjg1NGRlNjdhMWYwNWI1MTMzYzI5YzM4NzBiNTg5In0=', 0, NULL, NULL, '2020-08-11 13:30:50', '117376772016362093175', 1, '0983559164', '1992-02-12', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
