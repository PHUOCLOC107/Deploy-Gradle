/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : clock

 Target Server Type    : MariaDB
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 16/04/2025 21:27:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activation_tokens
-- ----------------------------
DROP TABLE IF EXISTS `activation_tokens`;
CREATE TABLE `activation_tokens`  (
  `user_id` int(11) NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `activation_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activation_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Đồng hồ tranh', '2025-01-04 16:36:43', '2025-01-04 16:38:40');
INSERT INTO `categories` VALUES (2, 'Đồng hồ con công', '2025-01-04 16:37:26', '2025-01-04 16:38:40');
INSERT INTO `categories` VALUES (3, 'Đồng hồ quà tặng', '2025-01-04 16:37:34', '2025-01-04 16:38:40');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact
-- ----------------------------

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (3, 16, 'Đăng nhập', 'Người dùng admin123 đăng nhập vào hệ thống', '2025-04-13 15:56:45');
INSERT INTO `logs` VALUES (4, 16, 'Đăng nhập', 'Người dùng admin123 đăng nhập vào hệ thống', '2025-04-13 15:58:33');
INSERT INTO `logs` VALUES (5, 16, 'Đăng nhập', 'Người dùng admin123 đăng nhập vào hệ thống', '2025-04-13 15:58:40');
INSERT INTO `logs` VALUES (6, 16, 'Đăng nhập', 'Người dùng admin123 đăng nhập vào hệ thống', '2025-04-13 16:17:35');
INSERT INTO `logs` VALUES (7, 16, 'Đăng nhập', 'Người dùng admin123 đăng nhập vào hệ thống', '2025-04-13 19:19:40');
INSERT INTO `logs` VALUES (8, 16, 'Đăng nhập', 'Người dùng admin123 đăng nhập vào hệ thống', '2025-04-13 19:37:23');
INSERT INTO `logs` VALUES (9, 16, 'Đăng nhập', 'Người dùng admin123 đăng nhập vào hệ thống', '2025-04-13 19:46:47');
INSERT INTO `logs` VALUES (10, 16, 'Đăng nhập', 'Người dùng admin123 đăng nhập vào hệ thống', '2025-04-13 20:08:42');
INSERT INTO `logs` VALUES (11, 48, 'Đăng nhập', 'Người dùng 22130150 đăng nhập vào hệ thống', '2025-04-13 20:56:42');
INSERT INTO `logs` VALUES (12, 48, 'Đăng nhập', 'Người dùng 22130150 đăng nhập vào hệ thống', '2025-04-13 20:58:29');
INSERT INTO `logs` VALUES (13, 48, 'Đăng nhập', 'Người dùng 22130150 đăng nhập vào hệ thống', '2025-04-13 20:58:45');
INSERT INTO `logs` VALUES (14, 48, 'Đăng nhập', 'Người dùng 22130150 đăng nhập vào hệ thống', '2025-04-13 20:59:59');

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL,
  `product_id` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_items_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `total_price` int(11) NULL DEFAULT NULL,
  `status` enum('Đang xử lý','Đã giao','Đã hủy') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for otp_requests
-- ----------------------------
DROP TABLE IF EXISTS `otp_requests`;
CREATE TABLE `otp_requests`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `otp_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of otp_requests
-- ----------------------------

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `district` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` enum('pending','completed','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `payment_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_images_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 751 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (1, 1, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (2, 2, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (3, 3, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (4, 4, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-3-480x480.webp');
INSERT INTO `product_images` VALUES (5, 5, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-2-480x480.webp');
INSERT INTO `product_images` VALUES (6, 6, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (7, 7, 'https://tuongxinh.com.vn/wp-content/uploads/2016/07/Tranh-dong-ho-hoa-dao-HL0116-480x480.jpg');
INSERT INTO `product_images` VALUES (8, 8, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/Tranh-dong-ho-keo-vo-TN107-1-480x480.jpg');
INSERT INTO `product_images` VALUES (9, 9, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/maket-2-min-480x480.png');
INSERT INTO `product_images` VALUES (10, 10, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01DWGM3f2BlAwKlvwLA_2208308148378.jpg_430x430q90-min-480x480.jpg');
INSERT INTO `product_images` VALUES (11, 11, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/O1CN01Mx3SMd1aQROJHGDct_1780653324-480x480.jpg');
INSERT INTO `product_images` VALUES (12, 12, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/3-1-480x480.jpg');
INSERT INTO `product_images` VALUES (13, 13, 'https://tuongxinh.com.vn/wp-content/uploads/2021/04/33-min-480x480.jpg');
INSERT INTO `product_images` VALUES (14, 14, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/2-1-480x480.jpg');
INSERT INTO `product_images` VALUES (15, 15, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/4-480x480.jpg');
INSERT INTO `product_images` VALUES (16, 16, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/Untitled-1-480x480.jpg');
INSERT INTO `product_images` VALUES (17, 17, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/5-480x480.jpg');
INSERT INTO `product_images` VALUES (18, 18, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-12-480x480.jpg');
INSERT INTO `product_images` VALUES (19, 19, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-17-480x480.jpg');
INSERT INTO `product_images` VALUES (20, 20, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-4-480x480.jpg');
INSERT INTO `product_images` VALUES (21, 21, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-5-480x480.jpg');
INSERT INTO `product_images` VALUES (22, 22, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-6-480x480.jpg');
INSERT INTO `product_images` VALUES (23, 23, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-1-1-480x480.jpg');
INSERT INTO `product_images` VALUES (24, 24, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-1-480x480.jpg');
INSERT INTO `product_images` VALUES (25, 25, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (26, 26, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-3-480x480.jpg');
INSERT INTO `product_images` VALUES (27, 27, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-10-480x480.jpg');
INSERT INTO `product_images` VALUES (28, 28, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-14-480x480.jpg');
INSERT INTO `product_images` VALUES (29, 29, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-15-480x480.jpg');
INSERT INTO `product_images` VALUES (30, 30, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-16-480x480.jpg');
INSERT INTO `product_images` VALUES (31, 31, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-18-480x480.jpg');
INSERT INTO `product_images` VALUES (32, 32, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-7-480x480.jpg');
INSERT INTO `product_images` VALUES (33, 33, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-8-480x480.jpg');
INSERT INTO `product_images` VALUES (34, 34, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-3-1-480x480.jpg');
INSERT INTO `product_images` VALUES (35, 35, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-2-1-480x480.jpg');
INSERT INTO `product_images` VALUES (36, 36, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-9-480x480.jpg');
INSERT INTO `product_images` VALUES (37, 37, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-11-480x480.jpg');
INSERT INTO `product_images` VALUES (38, 38, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-13-480x480.jpg');
INSERT INTO `product_images` VALUES (39, 39, 'https://tuongxinh.com.vn/wp-content/uploads/2022/04/z3344382267121_9ce379820c1eaef91df0ecd8313a389a-min-480x480.jpg');
INSERT INTO `product_images` VALUES (40, 40, 'https://tuongxinh.com.vn/wp-content/uploads/2019/04/hl837maket-480x480.jpg');
INSERT INTO `product_images` VALUES (41, 41, 'https://tuongxinh.com.vn/wp-content/uploads/2016/06/tranh-treo-tuong-thuan-buom-xuoi-gio-480x480.jpg');
INSERT INTO `product_images` VALUES (42, 42, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (43, 43, 'https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3864069190083_de792016ee82caef7523c2bc34d9601b-1-480x480.jpg');
INSERT INTO `product_images` VALUES (44, 44, 'https://tuongxinh.com.vn/wp-content/uploads/2022/11/1-2-480x480.jpg');
INSERT INTO `product_images` VALUES (45, 45, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-5-min-480x480.jpg');
INSERT INTO `product_images` VALUES (46, 46, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-6-min-480x480.jpg');
INSERT INTO `product_images` VALUES (47, 47, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-7-min-480x480.jpg');
INSERT INTO `product_images` VALUES (48, 48, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-8-min-480x480.jpg');
INSERT INTO `product_images` VALUES (49, 49, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-9-min-480x480.jpg');
INSERT INTO `product_images` VALUES (50, 50, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-10-min-480x480.jpg');
INSERT INTO `product_images` VALUES (51, 51, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-3-min-480x480.jpg');
INSERT INTO `product_images` VALUES (52, 52, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-11-min-480x480.jpg');
INSERT INTO `product_images` VALUES (53, 53, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-12-min-480x480.jpg');
INSERT INTO `product_images` VALUES (54, 54, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/1-min-1-480x480.jpg');
INSERT INTO `product_images` VALUES (55, 55, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/2-2-min-480x480.jpg');
INSERT INTO `product_images` VALUES (56, 56, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/19-2-min-480x480.jpg');
INSERT INTO `product_images` VALUES (57, 57, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/2-min-1-480x480.jpg');
INSERT INTO `product_images` VALUES (58, 58, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/3-min-480x480.jpg');
INSERT INTO `product_images` VALUES (59, 59, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/4-min-480x480.jpg');
INSERT INTO `product_images` VALUES (60, 60, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/5-min-480x480.jpg');
INSERT INTO `product_images` VALUES (61, 61, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/6-min-1-480x480.jpg');
INSERT INTO `product_images` VALUES (62, 62, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01UuOJyt26vdtvdVbMJ_1134747724-min-480x480.jpg');
INSERT INTO `product_images` VALUES (63, 63, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01smYqCR1QhhzPvp0Eo_150592008.jpg_400x400-min-480x480.jpg');
INSERT INTO `product_images` VALUES (64, 64, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01sNtI6B1QhhzHfodhy_150592008-min-480x480.jpg');
INSERT INTO `product_images` VALUES (65, 65, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01sOigyy1QhhzMGbGh7_150592008-min-480x480.jpg');
INSERT INTO `product_images` VALUES (66, 66, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01syD5Fg1Qhhz8l3EbS_150592008-min-480x480.jpg');
INSERT INTO `product_images` VALUES (67, 67, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN010DxUuD1Qhhz6En3rX_150592008-min-480x480.jpg');
INSERT INTO `product_images` VALUES (68, 68, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01yw5sPe1QhhzNL5Wfu_150592008-480x480.jpg');
INSERT INTO `product_images` VALUES (69, 69, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01MoygjR1Qhhvag9zef_150592008-480x480.jpg');
INSERT INTO `product_images` VALUES (70, 70, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01Nq0TwL1ZqFvi8APKS_2212277063245-min-480x480.jpg');
INSERT INTO `product_images` VALUES (71, 71, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01ooflVg1c2jzaqCIQd_3214463543-min-1-480x480.jpg');
INSERT INTO `product_images` VALUES (72, 72, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01Y7hryM2EqcRy2FkNc_1845148796-min-480x480.jpg');
INSERT INTO `product_images` VALUES (73, 73, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01zHYP8h26vdtwCcNGB_1134747724-min-480x480.jpg');
INSERT INTO `product_images` VALUES (74, 74, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01WhLyys2EqcUrg5ZPa_1845148796-min-480x480.jpg');
INSERT INTO `product_images` VALUES (75, 75, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01OBDLoA1c2jzT9NRPB_3214463543-min-480x480.jpg');
INSERT INTO `product_images` VALUES (76, 76, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN016grUy32EqcUyBTIwm_1845148796-min-480x480.jpg');
INSERT INTO `product_images` VALUES (77, 77, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01UY4mHe26vdtt3jmgJ_1134747724-min-480x480.jpg');
INSERT INTO `product_images` VALUES (78, 78, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01vWzBfm1ZqFvgcGyWf_2212277063245-min-480x480.jpg');
INSERT INTO `product_images` VALUES (79, 79, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01vYISje1ZqFvgcEh8d_2212277063245-min-480x480.jpg');
INSERT INTO `product_images` VALUES (80, 80, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01yzoWQC1ygyIa9rzPB_1839926609-min-480x480.jpg');
INSERT INTO `product_images` VALUES (81, 81, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN010fbTG01YDUpPWhtSf_2213028043025-min-480x480.jpg');
INSERT INTO `product_images` VALUES (82, 82, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN012yY08O1ZqFvfds0z8_2212277063245-min-480x480.jpg');
INSERT INTO `product_images` VALUES (83, 83, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01vOSskr26vdtrb38re_1134747724-min-480x480.jpg');
INSERT INTO `product_images` VALUES (84, 84, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/15-min-1-480x480.jpg');
INSERT INTO `product_images` VALUES (85, 85, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/18-min-480x480.jpg');
INSERT INTO `product_images` VALUES (86, 86, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/z2875566214866_0838f3d6e28a267fe3e3b1e5420683fc-480x480.jpg');
INSERT INTO `product_images` VALUES (87, 87, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/11-min-480x480.jpg');
INSERT INTO `product_images` VALUES (88, 88, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/z2878200427828_da96d1e1984778398955e146f97e7f9d-480x480.jpg');
INSERT INTO `product_images` VALUES (89, 89, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/17-min-480x480.jpg');
INSERT INTO `product_images` VALUES (90, 90, 'https://tuongxinh.com.vn/wp-content/uploads/2019/05/dong-ho-con-cong-doi-trang-tri-phong-khach-001-1377-0-480x480.jpg');
INSERT INTO `product_images` VALUES (91, 91, 'https://tuongxinh.com.vn/wp-content/uploads/2018/08/Dh-911-2-480x480.jpg');
INSERT INTO `product_images` VALUES (92, 92, 'https://tuongxinh.com.vn/wp-content/uploads/2021/05/dong-ho-treo-tuong-doi-cong-480x480.jpg');
INSERT INTO `product_images` VALUES (93, 93, 'https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3874481385329_9c7fdef1842985cb5a74fca7f0b21767-480x480.jpg');
INSERT INTO `product_images` VALUES (94, 94, 'https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3874481877518_2a8961a9480104132fd70750d6471c24-480x480.jpg');
INSERT INTO `product_images` VALUES (95, 95, 'https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3874487541207_10d9fc53b291b98cde0cab89a8393a1d-480x480.jpg');
INSERT INTO `product_images` VALUES (96, 96, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4801533074298_0bacba4eb2c5be80982bbc1569095fe3-1-480x480.jpg');
INSERT INTO `product_images` VALUES (97, 97, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462113288034_7d95a16dab10dfe187f5ccd64c6145e6-min-480x480.jpg');
INSERT INTO `product_images` VALUES (98, 98, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462113308211_eae1b3929946d235ffc94913347ec329-min-480x480.jpg');
INSERT INTO `product_images` VALUES (99, 99, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462113317483_e028d87c63fea3fbf7694f7fd123d795-min-480x480.jpg');
INSERT INTO `product_images` VALUES (100, 100, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462113310501_f0231ecd6f7a533f49dca23a10deb37e-min-480x480.jpg');
INSERT INTO `product_images` VALUES (101, 101, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462112740175_959f0be5ad4f223a2caef61279f51ba9-min-480x480.jpg');
INSERT INTO `product_images` VALUES (102, 102, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z5375766772099_8852fd611055b63f7952826ff7d65b07-480x480.jpg');
INSERT INTO `product_images` VALUES (103, 103, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462111787420_c0fb7556297d97f0d157ec54f10939df-min-480x480.jpg');
INSERT INTO `product_images` VALUES (104, 104, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3536120733820_11aef53541ffe4ad7019e38c34a5a5ac-480x480.jpg');
INSERT INTO `product_images` VALUES (105, 105, 'https://tuongxinh.com.vn/wp-content/uploads/2022/07/Untitled-2-480x480.jpg');
INSERT INTO `product_images` VALUES (106, 106, 'https://tuongxinh.com.vn/wp-content/uploads/2022/07/z3536124251732_03ff8c457d56949f5f2e0f1ae179a876-480x480.jpg');
INSERT INTO `product_images` VALUES (107, 107, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/1-2-480x480.jpg');
INSERT INTO `product_images` VALUES (108, 108, 'https://tuongxinh.com.vn/wp-content/uploads/2021/03/Dha-103-3-480x480.jpg');
INSERT INTO `product_images` VALUES (109, 109, 'https://tuongxinh.com.vn/wp-content/uploads/2021/05/z2473743777269_4fe76ef81b318538b5ae6d717849c2af-min-480x480.jpg');
INSERT INTO `product_images` VALUES (110, 110, 'https://tuongxinh.com.vn/wp-content/uploads/2021/05/z2489573804844_07315879eccffd4c9bcd4c884cc7160b-min-480x480.jpg');
INSERT INTO `product_images` VALUES (111, 111, 'https://tuongxinh.com.vn/wp-content/uploads/2021/05/z2489577471676_71cf0b83a7cc9c81778ca5649d1a8917-min-480x480.jpg');
INSERT INTO `product_images` VALUES (112, 112, 'https://tuongxinh.com.vn/wp-content/uploads/2021/05/dha108-480x480.jpg');
INSERT INTO `product_images` VALUES (113, 113, 'https://tuongxinh.com.vn/wp-content/uploads/2021/05/78a0c23efec60b9852d7-480x480.jpg');
INSERT INTO `product_images` VALUES (114, 114, 'https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3519549177740_a68304d8bdce0e17990d5036b183a820-480x480.jpg');
INSERT INTO `product_images` VALUES (115, 115, 'https://tuongxinh.com.vn/wp-content/uploads/2020/06/046c4509c41939476008-480x480.jpg');
INSERT INTO `product_images` VALUES (116, 116, 'https://tuongxinh.com.vn/wp-content/uploads/2020/12/z2216902905662_52c2f07a966724d6ea7164f1c8e46206-min-480x480.jpg');
INSERT INTO `product_images` VALUES (117, 117, 'https://tuongxinh.com.vn/wp-content/uploads/2020/07/z1984819253800_c799b096e031c89f553044df295cf0a4-480x480.jpg');
INSERT INTO `product_images` VALUES (118, 118, 'https://tuongxinh.com.vn/wp-content/uploads/2018/01/dong-ho-treo-tuong-nghe-thuat-cong-hoang-DH0181-1-1-480x480.jpg');
INSERT INTO `product_images` VALUES (119, 119, 'https://tuongxinh.com.vn/wp-content/uploads/2020/02/đồng-hồ-nghệ-thuật-chim-công-dh131-480x480.jpg');
INSERT INTO `product_images` VALUES (120, 120, 'https://tuongxinh.com.vn/wp-content/uploads/2019/05/O1CN01tkdAxh1b9JsfI1d6R_3043023422-480x480.jpg');
INSERT INTO `product_images` VALUES (121, 121, 'https://tuongxinh.com.vn/wp-content/uploads/2019/05/10834260600_682455381-480x480.jpg');
INSERT INTO `product_images` VALUES (122, 122, 'https://tuongxinh.com.vn/wp-content/uploads/2020/11/z2187105053148_d9e8e8fdf24b646ebdc70512fcc4b76a-min-480x480.jpg');
INSERT INTO `product_images` VALUES (123, 123, 'https://tuongxinh.com.vn/wp-content/uploads/2019/05/e29231ae5e42a71cfe53-480x480.jpg');
INSERT INTO `product_images` VALUES (124, 124, 'https://tuongxinh.com.vn/wp-content/uploads/2019/02/143da1b638ffdea187ee-480x480.jpg');
INSERT INTO `product_images` VALUES (125, 125, 'https://tuongxinh.com.vn/wp-content/uploads/2019/05/doi-chim-cong-noi-2-480x480.jpg');
INSERT INTO `product_images` VALUES (126, 126, 'https://tuongxinh.com.vn/wp-content/uploads/2018/09/8858815897_682455381-480x480.jpg');
INSERT INTO `product_images` VALUES (127, 127, 'https://tuongxinh.com.vn/wp-content/uploads/2018/08/a3e04f1c022ba4abfcc0384ae2886cda-480x480.jpg');
INSERT INTO `product_images` VALUES (128, 128, 'https://tuongxinh.com.vn/wp-content/uploads/2018/08/Đồng-hồ-treo-tường-chim-công-cao-cấp-sang-trọng-480x480.jpg');
INSERT INTO `product_images` VALUES (129, 129, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4822361888385_a1846144eb9401a4122c9f0593330304-min-1-480x480.jpg');
INSERT INTO `product_images` VALUES (130, 130, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/Dong-ho-de-ban-qua-tang-cong-ty-doanh-nghiep-khach-hang-480x480.jpg');
INSERT INTO `product_images` VALUES (131, 131, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833135940196_69cc5d47a521f7c5968b3f969ead38a1-480x480.jpg');
INSERT INTO `product_images` VALUES (132, 132, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833101000295_3f82c8b8a70b7c4d17320526dbfd8034-480x480.jpg');
INSERT INTO `product_images` VALUES (133, 133, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833171537898_c194c3148162d68314387b6f259c93b9-min-480x480.jpg');
INSERT INTO `product_images` VALUES (134, 134, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833158103208_ade094b66513b09916c109138cf31f99-480x480.jpg');
INSERT INTO `product_images` VALUES (135, 135, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833137905058_666b6954fd462dda5f3203f357d1ca5d-480x480.jpg');
INSERT INTO `product_images` VALUES (136, 136, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833167428623_f18adb05ad8ca68b3f41a37b897daecb-min-480x480.jpg');
INSERT INTO `product_images` VALUES (137, 137, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833120397785_4fdf46a5793a8289bc56d889957ebd28-480x480.jpg');
INSERT INTO `product_images` VALUES (138, 138, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833130561937_4778499556cb0e0359dcc84b42e4ca84-480x480.jpg');
INSERT INTO `product_images` VALUES (139, 139, 'https://tuongxinh.com.vn/wp-content/uploads/2023/12/1200k-480x480.jpg');
INSERT INTO `product_images` VALUES (140, 140, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146014101_c8ad4bc745a0206e0b00d9b8ec4627d3-480x480.jpg');
INSERT INTO `product_images` VALUES (141, 141, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146014251_940920a85d36aa57b21c7ba430ed4255-480x480.jpg');
INSERT INTO `product_images` VALUES (142, 142, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833178877485_28c4faac8b80229314b50c0f005a7dd7-min-480x480.jpg');
INSERT INTO `product_images` VALUES (143, 143, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833145490635_91a20b262c731cf360dbe61c6ce6b22f-480x480.jpg');
INSERT INTO `product_images` VALUES (144, 144, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833182349473_d3d0eebcb254f52579aebf811650c0d6-min-480x480.jpg');
INSERT INTO `product_images` VALUES (145, 145, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833143041298_ef584aab62e4cb3647aa9a0639e956a1-480x480.jpg');
INSERT INTO `product_images` VALUES (146, 146, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146438603_c1ffedbb9d58816c7a5af67d4591f438-480x480.jpg');
INSERT INTO `product_images` VALUES (147, 147, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146438606_8a181cdb517184e5eccf4db64326f268-480x480.jpg');
INSERT INTO `product_images` VALUES (148, 148, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146441782_e6bd9e41afcdf9854aab05c916bdf4e6-480x480.jpg');
INSERT INTO `product_images` VALUES (149, 149, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146014205_6ab0cadeca8a5ac99e3353863f89ffac-480x480.jpg');
INSERT INTO `product_images` VALUES (150, 150, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146014301_9c187ae27d9e5df48e8c695defe9fd12-480x480.jpg');
INSERT INTO `product_images` VALUES (151, 1, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (152, 2, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (153, 3, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (154, 4, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (155, 5, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (156, 6, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (157, 7, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (158, 8, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (159, 9, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (160, 10, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (161, 11, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (162, 12, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (163, 13, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (164, 14, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (165, 15, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (166, 16, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (167, 17, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (168, 18, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (169, 19, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (170, 20, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (171, 21, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (172, 22, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (173, 23, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (174, 24, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (175, 25, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (176, 26, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (177, 27, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (178, 28, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (179, 29, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (180, 30, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (181, 31, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (182, 32, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (183, 33, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (184, 34, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (185, 35, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (186, 36, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (187, 37, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (188, 38, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (189, 39, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (190, 40, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (191, 41, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (192, 42, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (193, 43, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (194, 44, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (195, 45, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (196, 46, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (197, 47, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (198, 48, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (199, 49, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (200, 50, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (201, 51, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (202, 52, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (203, 53, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (204, 54, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (205, 55, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (206, 56, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (207, 57, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (208, 58, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (209, 59, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (210, 60, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (211, 61, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (212, 62, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (213, 63, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (214, 64, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (215, 65, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (216, 66, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (217, 67, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (218, 68, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (219, 69, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (220, 70, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (221, 71, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (222, 72, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (223, 73, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (224, 74, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (225, 75, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (226, 76, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (227, 77, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (228, 78, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (229, 79, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (230, 80, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (231, 81, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (232, 82, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (233, 83, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (234, 84, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (235, 85, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (236, 86, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (237, 87, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (238, 88, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (239, 89, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (240, 90, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (241, 91, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (242, 92, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (243, 93, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (244, 94, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (245, 95, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (246, 96, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (247, 97, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (248, 98, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (249, 99, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (250, 100, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (251, 101, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (252, 102, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (253, 103, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (254, 104, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (255, 105, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (256, 106, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (257, 107, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (258, 108, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (259, 109, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (260, 110, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (261, 111, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (262, 112, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (263, 113, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (264, 114, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (265, 115, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (266, 116, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (267, 117, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (268, 118, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (269, 119, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (270, 120, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (271, 121, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (272, 122, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (273, 123, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (274, 124, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (275, 125, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (276, 126, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (277, 127, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (278, 128, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (279, 129, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (280, 130, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (281, 131, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (282, 132, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (283, 133, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (284, 134, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (285, 135, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (286, 136, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (287, 137, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (288, 138, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (289, 139, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (290, 140, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (291, 141, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (292, 142, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (293, 143, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (294, 144, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (295, 145, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (296, 146, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (297, 147, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (298, 148, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (299, 149, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (300, 150, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp');
INSERT INTO `product_images` VALUES (301, 1, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (302, 2, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (303, 3, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (304, 4, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (305, 5, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (306, 6, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (307, 7, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (308, 8, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (309, 9, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (310, 10, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (311, 11, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (312, 12, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (313, 13, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (314, 14, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (315, 15, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (316, 16, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (317, 17, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (318, 18, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (319, 19, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (320, 20, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (321, 21, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (322, 22, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (323, 23, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (324, 24, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (325, 25, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (326, 26, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (327, 27, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (328, 28, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (329, 29, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (330, 30, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (331, 31, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (332, 32, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (333, 33, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (334, 34, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (335, 35, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (336, 36, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (337, 37, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (338, 38, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (339, 39, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (340, 40, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (341, 41, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (342, 42, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (343, 43, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (344, 44, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (345, 45, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (346, 46, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (347, 47, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (348, 48, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (349, 49, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (350, 50, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (351, 51, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (352, 52, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (353, 53, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (354, 54, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (355, 55, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (356, 56, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (357, 57, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (358, 58, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (359, 59, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (360, 60, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (361, 61, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (362, 62, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (363, 63, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (364, 64, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (365, 65, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (366, 66, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (367, 67, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (368, 68, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (369, 69, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (370, 70, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (371, 71, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (372, 72, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (373, 73, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (374, 74, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (375, 75, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (376, 76, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (377, 77, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (378, 78, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (379, 79, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (380, 80, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (381, 81, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (382, 82, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (383, 83, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (384, 84, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (385, 85, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (386, 86, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (387, 87, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (388, 88, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (389, 89, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (390, 90, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (391, 91, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (392, 92, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (393, 93, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (394, 94, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (395, 95, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (396, 96, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (397, 97, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (398, 98, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (399, 99, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (400, 100, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (401, 101, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (402, 102, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (403, 103, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (404, 104, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (405, 105, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (406, 106, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (407, 107, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (408, 108, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (409, 109, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (410, 110, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (411, 111, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (412, 112, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (413, 113, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (414, 114, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (415, 115, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (416, 116, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (417, 117, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (418, 118, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (419, 119, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (420, 120, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (421, 121, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (422, 122, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (423, 123, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (424, 124, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (425, 125, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (426, 126, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (427, 127, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (428, 128, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (429, 129, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (430, 130, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (431, 131, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (432, 132, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (433, 133, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (434, 134, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (435, 135, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (436, 136, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (437, 137, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (438, 138, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (439, 139, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (440, 140, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (441, 141, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (442, 142, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (443, 143, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (444, 144, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (445, 145, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (446, 146, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (447, 147, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (448, 148, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (449, 149, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (450, 150, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp');
INSERT INTO `product_images` VALUES (451, 1, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (452, 2, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (453, 3, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (454, 4, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (455, 5, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (456, 6, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (457, 7, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (458, 8, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (459, 9, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (460, 10, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (461, 11, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (462, 12, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (463, 13, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (464, 14, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (465, 15, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (466, 16, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (467, 17, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (468, 18, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (469, 19, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (470, 20, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (471, 21, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (472, 22, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (473, 23, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (474, 24, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (475, 25, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (476, 26, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (477, 27, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (478, 28, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (479, 29, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (480, 30, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (481, 31, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (482, 32, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (483, 33, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (484, 34, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (485, 35, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (486, 36, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (487, 37, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (488, 38, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (489, 39, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (490, 40, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (491, 41, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (492, 42, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (493, 43, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (494, 44, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (495, 45, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (496, 46, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (497, 47, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (498, 48, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (499, 49, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (500, 50, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (501, 51, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (502, 52, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (503, 53, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (504, 54, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (505, 55, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (506, 56, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (507, 57, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (508, 58, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (509, 59, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (510, 60, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (511, 61, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (512, 62, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (513, 63, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (514, 64, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (515, 65, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (516, 66, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (517, 67, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (518, 68, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (519, 69, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (520, 70, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (521, 71, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (522, 72, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (523, 73, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (524, 74, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (525, 75, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (526, 76, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (527, 77, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (528, 78, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (529, 79, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (530, 80, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (531, 81, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (532, 82, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (533, 83, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (534, 84, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (535, 85, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (536, 86, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (537, 87, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (538, 88, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (539, 89, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (540, 90, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (541, 91, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (542, 92, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (543, 93, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (544, 94, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (545, 95, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (546, 96, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (547, 97, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (548, 98, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (549, 99, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (550, 100, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (551, 101, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (552, 102, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (553, 103, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (554, 104, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (555, 105, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (556, 106, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (557, 107, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (558, 108, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (559, 109, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (560, 110, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (561, 111, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (562, 112, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (563, 113, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (564, 114, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (565, 115, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (566, 116, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (567, 117, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (568, 118, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (569, 119, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (570, 120, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (571, 121, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (572, 122, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (573, 123, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (574, 124, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (575, 125, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (576, 126, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (577, 127, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (578, 128, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (579, 129, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (580, 130, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (581, 131, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (582, 132, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (583, 133, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (584, 134, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (585, 135, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (586, 136, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (587, 137, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (588, 138, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (589, 139, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (590, 140, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (591, 141, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (592, 142, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (593, 143, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (594, 144, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (595, 145, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (596, 146, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (597, 147, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (598, 148, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (599, 149, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (600, 150, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp');
INSERT INTO `product_images` VALUES (601, 1, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (602, 2, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (603, 3, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (604, 4, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (605, 5, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (606, 6, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (607, 7, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (608, 8, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (609, 9, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (610, 10, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (611, 11, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (612, 12, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (613, 13, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (614, 14, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (615, 15, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (616, 16, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (617, 17, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (618, 18, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (619, 19, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (620, 20, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (621, 21, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (622, 22, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (623, 23, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (624, 24, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (625, 25, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (626, 26, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (627, 27, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (628, 28, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (629, 29, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (630, 30, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (631, 31, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (632, 32, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (633, 33, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (634, 34, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (635, 35, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (636, 36, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (637, 37, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (638, 38, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (639, 39, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (640, 40, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (641, 41, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (642, 42, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (643, 43, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (644, 44, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (645, 45, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (646, 46, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (647, 47, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (648, 48, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (649, 49, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (650, 50, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (651, 51, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (652, 52, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (653, 53, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (654, 54, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (655, 55, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (656, 56, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (657, 57, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (658, 58, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (659, 59, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (660, 60, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (661, 61, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (662, 62, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (663, 63, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (664, 64, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (665, 65, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (666, 66, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (667, 67, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (668, 68, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (669, 69, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (670, 70, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (671, 71, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (672, 72, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (673, 73, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (674, 74, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (675, 75, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (676, 76, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (677, 77, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (678, 78, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (679, 79, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (680, 80, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (681, 81, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (682, 82, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (683, 83, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (684, 84, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (685, 85, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (686, 86, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (687, 87, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (688, 88, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (689, 89, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (690, 90, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (691, 91, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (692, 92, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (693, 93, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (694, 94, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (695, 95, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (696, 96, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (697, 97, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (698, 98, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (699, 99, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (700, 100, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (701, 101, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (702, 102, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (703, 103, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (704, 104, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (705, 105, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (706, 106, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (707, 107, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (708, 108, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (709, 109, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (710, 110, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (711, 111, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (712, 112, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (713, 113, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (714, 114, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (715, 115, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (716, 116, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (717, 117, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (718, 118, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (719, 119, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (720, 120, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (721, 121, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (722, 122, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (723, 123, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (724, 124, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (725, 125, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (726, 126, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (727, 127, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (728, 128, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (729, 129, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (730, 130, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (731, 131, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (732, 132, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (733, 133, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (734, 134, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (735, 135, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (736, 136, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (737, 137, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (738, 138, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (739, 139, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (740, 140, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (741, 141, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (742, 142, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (743, 143, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (744, 144, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (745, 145, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (746, 146, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (747, 147, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (748, 148, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (749, 149, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');
INSERT INTO `product_images` VALUES (750, 150, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg');

-- ----------------------------
-- Table structure for product_technical_specifications
-- ----------------------------
DROP TABLE IF EXISTS `product_technical_specifications`;
CREATE TABLE `product_technical_specifications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `height` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `width` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dial_diameter` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `engine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `power` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `product_technical_specifications_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_technical_specifications
-- ----------------------------
INSERT INTO `product_technical_specifications` VALUES (1, 1, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TX865', '70cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (2, 2, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TX866', '68cm', '62cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (3, 3, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TX868', '70cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (4, 4, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TX869', '64cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (5, 5, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TX866', '68cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (6, 6, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'PT0105', '70cm', '62cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (7, 7, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'HL0116', '68cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (8, 8, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TN107', '64cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (9, 9, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG3199', '64cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (10, 10, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG39', '64cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (11, 11, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG2149', '70cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (12, 12, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG2121', '70cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (13, 13, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'HL1939', '64cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (14, 14, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG2120', '68cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (15, 15, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG2122', '70cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (16, 16, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG2124', '64cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (17, 17, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG2123', '70cm', '62cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (18, 18, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1609', '64cm', '62cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (19, 19, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1610', '64cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (20, 20, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1596', '64cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (21, 21, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1597', '70cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (22, 22, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1598', '68cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (23, 23, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1593', '64cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (24, 24, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1591', '68cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (25, 25, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1590', '64cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (26, 26, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1592', '70cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (27, 27, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1604', '70cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (28, 28, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1605', '64cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (29, 29, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1606', '70cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (30, 30, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1607', '68cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (31, 31, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1608', '70cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (32, 32, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1599', '68cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (33, 33, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1600', '70cm', '62cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (34, 34, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1595', '68cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (35, 35, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1594', '64cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (36, 36, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1601', '68cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (37, 37, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1602', '70cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (38, 38, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'TG1603', '64cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (39, 39, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG65', '64cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (40, 40, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'HL837', '68cm', '62cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (41, 41, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'PT0123', '70cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (42, 42, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG01', '70cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (43, 43, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG175', '68cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (44, 44, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG176', '70cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (45, 45, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG94', '68cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (46, 46, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG95', '64cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (47, 47, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG96', '64cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (48, 48, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG97', '70cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (49, 49, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG98', '68cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (50, 50, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG99', '64cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (51, 51, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG92', '70cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (52, 52, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG101', '70cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (53, 53, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG102', '64cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (54, 54, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1145', '68cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (55, 55, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1140', '70cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (56, 56, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1112', '64cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (57, 57, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1143', '64cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (58, 58, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1144', '64cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (59, 59, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1146', '64cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (60, 60, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1147', '68cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (61, 61, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1148', '70cm', '62cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (62, 62, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG36', '68cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (63, 63, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG55', '70cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (64, 64, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG56', '64cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (65, 65, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG57', '70cm', '62cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (66, 66, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG58', '70cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (67, 67, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG59', '68cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (68, 68, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG61', '70cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (69, 69, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG62', '68cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (70, 70, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG30', '68cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (71, 71, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG32', '70cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (72, 72, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG60', '70cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (73, 73, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG26', '68cm', '62cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (74, 74, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG24', '70cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (75, 75, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG31', '70cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (76, 76, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG28', '68cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (77, 77, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG20', '70cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (78, 78, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG22', '70cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (79, 79, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG23', '70cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (80, 80, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG25', '68cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (81, 81, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG27', '64cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (82, 82, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG29', '64cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (83, 83, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG21', '64cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (84, 84, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1155', '68cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (85, 85, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1160', '68cm', '62cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (86, 86, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1154', '64cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (87, 87, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1151', '70cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (88, 88, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1152', '64cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (89, 89, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1157', '70cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (90, 90, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA11', '68cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (91, 91, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH911', '70cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (92, 92, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA110', '70cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (93, 93, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA203', '68cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (94, 94, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA205', '68cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (95, 95, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA212', '64cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (96, 96, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA306', '68cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (97, 97, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA158', '70cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (98, 98, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA159', '68cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (99, 99, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA160', '70cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (100, 100, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA161', '64cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (101, 101, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA162', '64cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (102, 102, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA163', '68cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (103, 103, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA165', '64cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (104, 104, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA181', '64cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (105, 105, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA182', '70cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (106, 106, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA183', '70cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (107, 107, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA175', '68cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (108, 108, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA103', '64cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (109, 109, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA105', '70cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (110, 110, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA106', '68cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (111, 111, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA107', '70cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (112, 112, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA108', '68cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (113, 113, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA109', '68cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (114, 114, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA34', '70cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (115, 115, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA53', '70cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (116, 116, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA99', '64cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (117, 117, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH0152', '68cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (118, 118, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH0181', '70cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (119, 119, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH131', '70cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (120, 120, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA01', '70cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (121, 121, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA02', '64cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (122, 122, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA80', '64cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (123, 123, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH0151', '68cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (124, 124, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH1014', '70cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (125, 125, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DHA10', '68cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (126, 126, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH964', '68cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (127, 127, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH923', '68cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (128, 128, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DH924', '64cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (129, 129, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'QT01', '64cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (130, 130, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'QT68', '64cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (131, 131, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG236', '64cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (132, 132, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG241', '70cm', '68cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (133, 133, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG35', '70cm', '62cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (134, 134, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG65', '68cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (135, 135, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG67', '64cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (136, 136, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG82', '68cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (137, 137, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG83', '70cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (138, 138, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG84', '64cm', '62cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (139, 139, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'QT23', '70cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (140, 140, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'QT13', '70cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (141, 141, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'QT16', '64cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (142, 142, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG01', '64cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (143, 143, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG175', '68cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (144, 144, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG240', '70cm', '64cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (145, 145, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'DG68', '64cm', '64cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (146, 146, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'QT20', '70cm', '64cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (147, 147, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'QT21', '64cm', '68cm', '20cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (148, 148, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'QT22', '70cm', '62cm', '26cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Nhôm cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (149, 149, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'QT14', '70cm', '68cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');
INSERT INTO `product_technical_specifications` VALUES (150, 150, 'SHOUSE (Thương hiệu đẳng cấp, đạt chuẩn Châu Âu)', 'QT19', '64cm', '62cm', '24cm', 'Máy đồng hồ kim trôi, không gây tiếng ồn', 'Thép cao cấp', 'Vàng, Xanh', 'Cổ điển, sang trọng', 'Pin');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `discount_percent` int(11) NULL DEFAULT NULL,
  `refund_policy_id` int(11) NULL DEFAULT NULL,
  `shipping_info_id` int(11) NULL DEFAULT NULL,
  `product_type` enum('Cao cấp','Bình thường') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `video_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sold` int(11) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `refund_policy_id`(`refund_policy_id`) USING BTREE,
  INDEX `shipping_info_id`(`shipping_info_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`refund_policy_id`) REFERENCES `refund_policies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`shipping_info_id`) REFERENCES `shipping_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_4` FOREIGN KEY (`refund_policy_id`) REFERENCES `refund_policies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_5` FOREIGN KEY (`shipping_info_id`) REFERENCES `shipping_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Tranh đồng hồ khung kim loại cao cấp xu hướng trang trí 2025 phong cách độc đáo sang trọng TX865', 1250000, 12, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-4-480x480.webp', 10, 51, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (2, 'Tranh đồng hồ khung kim loại cao cấp xu hướng trang trí 2025 phong cách độc đáo sang trọng TX866', 1250000, 12, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-1-480x480.webp', 0, 63, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (3, 'Tranh đồng hồ khung kim loại cao cấp xu hướng trang trí 2025 phong cách độc đáo sang trọng TX868', 1250000, 12, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-5-480x480.webp', 12, 24, '2025-03-27 21:15:21', '2025-03-27 21:15:21');
INSERT INTO `products` VALUES (4, 'Tranh đồng hồ khung kim loại cao cấp xu hướng trang trí 2025 phong cách độc đáo sang trọng TX869', 1250000, 12, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-3-480x480.webp', 1, 25, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (5, 'Tranh đồng hồ khung kim loại cao cấp xu hướng trang trí 2025 phong cách độc đáo sang trọng TX866', 1250000, 12, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2024/12/tranh-dong-ho-khung-kim-loai-2-480x480.webp', 9, 52, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (6, 'Tranh đồng hồ mã đáo thành công PT0105', 1150000, 41, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min-480x480.jpg', 3, 24, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (7, 'Tranh đồng hồ hoa đào HL0116', 1300000, 47, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2016/07/Tranh-dong-ho-hoa-dao-HL0116-480x480.jpg', 5, 21, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (8, 'Tranh đồng hồ Kéo vó TN107', 1150000, 41, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2016/08/Tranh-dong-ho-keo-vo-TN107-1-480x480.jpg', 13, 69, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (9, 'Tranh tráng gương 3D hươu tuần lộc hiện đại decor trang trí nhà cửa TG3199', 750000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/maket-2-min-480x480.png', 3, 40, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (10, 'Đồng hồ tranh tráng gương lá cây nghệ thuật DG39', 350000, 54, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01DWGM3f2BlAwKlvwLA_2208308148378.jpg_430x430q90-min-480x480.jpg', 14, 57, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (11, 'Tranh đồng hồ nghệ thuật trang trí phòng ăn TG2149', 750000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/O1CN01Mx3SMd1aQROJHGDct_1780653324-480x480.jpg', 8, 47, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (12, 'Tranh đồng hồ hoa nghệ thuật trang trí phòng ăn TG2121', 680000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/3-1-480x480.jpg', 13, 42, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (13, 'Tranh đồng hồ trang trí Hoa Sen HL1939', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/04/33-min-480x480.jpg', 1, 68, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (14, 'Tranh đồng hồ hoa nghệ thuật trang trí phòng ăn TG2120', 680000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/2-1-480x480.jpg', 6, 64, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (15, 'Tranh đồng hồ hoa nghệ thuật trang trí phòng ăn TG2122', 680000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/4-480x480.jpg', 2, 41, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (16, 'Tranh đồng hồ hoa nghệ thuật trang trí phòng ăn TG2124', 680000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/Untitled-1-480x480.jpg', 14, 36, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (17, 'Tranh đồng hồ hoa tulip trang trí phòng ăn TG2123', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/5-480x480.jpg', 7, 40, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (18, 'Tranh tráng gương đồng hồ Chiếc Lá Nghệ Thuật TG1609', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-12-480x480.jpg', 10, 60, '2025-01-06 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (19, 'Tranh tráng gương đồng hồ Chiếc Lá Nghệ Thuật TG1610', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-17-480x480.jpg', 0, 29, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (20, 'Tranh tráng gương đồng hồ Cửu Ngư Nghệ Thuật TG1596', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-4-480x480.jpg', 3, 56, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (21, 'Tranh tráng gương đồng hồ Cửu Ngư Nghệ Thuật TG1597', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-5-480x480.jpg', 3, 21, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (22, 'Tranh tráng gương đồng hồ Cửu Ngư Nghệ Thuật TG1598', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-6-480x480.jpg', 13, 51, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (23, 'Tranh tráng gương đồng hồ Cửu Ngư Quần Hội TG1593', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-1-1-480x480.jpg', 14, 49, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (24, 'Tranh tráng gương đồng hồ Hoa 3D nghệ thuật hiện đại TG1591', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-1-480x480.jpg', 6, 39, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (25, 'Tranh tráng gương đồng hồ Hươu 3D hiện đại TG1590', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/1-min-480x480.jpg', 1, 32, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (26, 'Tranh tráng gương đồng hồ Hươu 3D hiện đại TG1592', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-3-480x480.jpg', 2, 70, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (27, 'Tranh tráng gương đồng hồ Hươu 3D Hiện Đại TG1604', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-10-480x480.jpg', 12, 55, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (28, 'Tranh tráng gương đồng hồ Hươu 3D Hiện Đại TG1605', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-14-480x480.jpg', 12, 37, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (29, 'Tranh tráng gương đồng hồ Hươu 3D Hiện Đại TG1606', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-15-480x480.jpg', 1, 65, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (30, 'Tranh tráng gương đồng hồ Hươu 3D Hiện Đại TG1607', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-16-480x480.jpg', 6, 46, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (31, 'Tranh tráng gương đồng hồ Hươu 3D Hiện Đại TG1608', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-18-480x480.jpg', 12, 25, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (32, 'Tranh tráng gương đồng hồ Hươu 3D nghệ thuật TG1599', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-7-480x480.jpg', 11, 65, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (33, 'Tranh tráng gương đồng hồ Hươu 3D nghệ thuật TG1600', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-8-480x480.jpg', 13, 21, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (34, 'Tranh tráng gương đồng hồ Hươu Phong Cảnh 3D Nghệ Thuật TG1595', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-3-1-480x480.jpg', 10, 55, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (35, 'Tranh tráng gương đồng hồ Lá Cây 3D hiện đại TG1594', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-2-1-480x480.jpg', 1, 37, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (36, 'Tranh tráng gương đồng hồ Phong Cảnh 3D nghệ thuật TG1601', 390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-9-480x480.jpg', 1, 38, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (37, 'Tranh tráng gương đồng hồ Phong Cảnh 3D nghệ thuật TG1602', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-11-480x480.jpg', 11, 30, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (38, 'Tranh tráng gương đồng hồ Phong Cảnh 3D nghệ thuật TG1603', 550000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-13-480x480.jpg', 5, 37, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (39, 'Đồng hồ tranh tráng gương phong cảnh nghệ thuật DG65', 550000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/04/z3344382267121_9ce379820c1eaef91df0ecd8313a389a-min-480x480.jpg', 7, 54, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (40, 'Tranh đồng hồ thiên nhiên hoa lá HL837', 550000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2019/04/hl837maket-480x480.jpg', 11, 21, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (41, 'Tranh đồng hồ treo tường thuận buồm xuôi gió PT0123', 550000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2016/06/tranh-treo-tuong-thuan-buom-xuoi-gio-480x480.jpg', 10, 70, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (42, 'Đồng hồ tranh tráng gương Hươu nghệ thuật độc đáo DG01', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/1-min-480x480.jpg', 9, 66, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (43, 'Đồng hồ tranh Thuận Buồm Xuôi Gió hiện đại sang trọng DG175', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3864069190083_de792016ee82caef7523c2bc34d9601b-1-480x480.jpg', 9, 32, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (44, 'Đồng hồ tranh tráng gương Mã Đáo Thành Công DG176', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/11/1-2-480x480.jpg', 10, 35, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (45, 'Đồng hồ tranh cô gái nghệ thuật DG94', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-5-min-480x480.jpg', 7, 28, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (46, 'Đồng hồ tranh cô gái nghệ thuật DG95', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-6-min-480x480.jpg', 14, 29, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (47, 'Đồng hồ tranh cô gái nghệ thuật DG96', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-7-min-480x480.jpg', 8, 48, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (48, 'Đồng hồ tranh cô gái nghệ thuật DG97', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-8-min-480x480.jpg', 9, 26, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (49, 'Đồng hồ tranh cô gái nghệ thuật DG98', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-9-min-480x480.jpg', 14, 31, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (50, 'Đồng hồ tranh cô gái nghệ thuật DG99', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-10-min-480x480.jpg', 3, 59, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (51, 'Đồng hồ tranh Hươu phong cảnh nghệ thuật DG92', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-3-min-480x480.jpg', 7, 30, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (52, 'Đồng hồ tranh phong cảnh nghệ thuật DG101', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-11-min-480x480.jpg', 2, 37, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (53, 'Đồng hồ tranh phong cảnh nghệ thuật DG102', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-12-min-480x480.jpg', 9, 24, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (54, 'Đồng hồ tranh cô gái sang trọng hiện đại DH1145', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/1-min-1-480x480.jpg', 4, 25, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (55, 'Đồng hồ tranh phong cảnh đồng quê DH1140', 1150000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/2-2-min-480x480.jpg', 11, 30, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (56, 'Đồng hồ tranh trang trí nội thất hiện đại DH1112', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/19-2-min-480x480.jpg', 13, 60, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (57, 'Đồng hồ tranh trang trí nội thất hiện đại DH1143', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/2-min-1-480x480.jpg', 9, 43, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (58, 'Đồng hồ tranh trang trí nội thất hiện đại DH1144', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/3-min-480x480.jpg', 1, 45, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (59, 'Đồng hồ tranh trang trí nội thất hiện đại DH1146', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/4-min-480x480.jpg', 0, 44, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (60, 'Đồng hồ tranh trang trí nội thất hiện đại DH1147', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/5-min-480x480.jpg', 8, 67, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (61, 'Đồng hồ tranh trang trí nội thất hiện đại DH1148', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/6-min-1-480x480.jpg', 3, 38, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (62, 'Đồng hồ tranh tráng gương cô gái nghệ thuật DG36', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01UuOJyt26vdtvdVbMJ_1134747724-min-480x480.jpg', 14, 51, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (63, 'Đồng hồ tranh tráng gương cô gái nghệ thuật DG55', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01smYqCR1QhhzPvp0Eo_150592008.jpg_400x400-min-480x480.jpg', 10, 58, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (64, 'Đồng hồ tranh tráng gương cô gái nghệ thuật DG56', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01sNtI6B1QhhzHfodhy_150592008-min-480x480.jpg', 6, 48, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (65, 'Đồng hồ tranh tráng gương cô gái nghệ thuật DG57', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01sOigyy1QhhzMGbGh7_150592008-min-480x480.jpg', 3, 20, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (66, 'Đồng hồ tranh tráng gương cô gái nghệ thuật DG58', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01syD5Fg1Qhhz8l3EbS_150592008-min-480x480.jpg', 9, 23, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (67, 'Đồng hồ tranh tráng gương cô gái nghệ thuật DG59', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN010DxUuD1Qhhz6En3rX_150592008-min-480x480.jpg', 8, 68, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (68, 'Đồng hồ tranh tráng gương cô gái váy đỏ nghệ thuật DG61', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01yw5sPe1QhhzNL5Wfu_150592008-480x480.jpg', 0, 31, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (69, 'Đồng hồ tranh tráng gương cô gái váy đỏ nghệ thuật DG62', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01MoygjR1Qhhvag9zef_150592008-480x480.jpg', 10, 56, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (70, 'Đồng hồ tranh tráng gương địa danh nổi tiếng DG30', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01Nq0TwL1ZqFvi8APKS_2212277063245-min-480x480.jpg', 12, 43, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (71, 'Đồng hồ tranh tráng gương Hồ Lô phong thủy DG32', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01ooflVg1c2jzaqCIQd_3214463543-min-1-480x480.jpg', 3, 40, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (72, 'Đồng hồ tranh tráng gương Hươu nghệ thuật DG60', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01Y7hryM2EqcRy2FkNc_1845148796-min-480x480.jpg', 14, 43, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (73, 'Đồng hồ tranh tráng gương Hươu nghệ thuật độc đáo DG26', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01zHYP8h26vdtwCcNGB_1134747724-min-480x480.jpg', 8, 49, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (74, 'Đồng hồ tranh tráng gương lọ hoa trang trí phòng ăn DG24', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01WhLyys2EqcUrg5ZPa_1845148796-min-480x480.jpg', 12, 63, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (75, 'Đồng hồ tranh tráng gương Mã Đáo Thành Công DG31', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01OBDLoA1c2jzT9NRPB_3214463543-min-480x480.jpg', 2, 40, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (76, 'Đồng hồ tranh tráng gương nghệ thuật độc đáo DG28', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN016grUy32EqcUyBTIwm_1845148796-min-480x480.jpg', 0, 61, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (77, 'Đồng hồ tranh tráng gương phong cảnh nghệ thuật DG20', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01UY4mHe26vdtt3jmgJ_1134747724-min-480x480.jpg', 4, 45, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (78, 'Đồng hồ tranh tráng gương phong cảnh nghệ thuật DG22', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01vWzBfm1ZqFvgcGyWf_2212277063245-min-480x480.jpg', 0, 68, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (79, 'Đồng hồ tranh tráng gương phong cảnh nghệ thuật DG23', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01vYISje1ZqFvgcEh8d_2212277063245-min-480x480.jpg', 8, 49, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (80, 'Đồng hồ tranh tráng gương phong cảnh nghệ thuật DG25', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01yzoWQC1ygyIa9rzPB_1839926609-min-480x480.jpg', 4, 53, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (81, 'Đồng hồ tranh tráng gương phong cảnh nghệ thuật DG27', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN010fbTG01YDUpPWhtSf_2213028043025-min-480x480.jpg', 7, 56, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (82, 'Đồng hồ tranh tráng gương phong cảnh nghệ thuật DG29', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN012yY08O1ZqFvfds0z8_2212277063245-min-480x480.jpg', 1, 22, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (83, 'Đồng hồ tranh tráng gương Sơn Thủy Hữu Tình DG21', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01vOSskr26vdtrb38re_1134747724-min-480x480.jpg', 10, 26, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (84, 'Đồng hồ tranh bông hoa nghệ thuật DH1155', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/15-min-1-480x480.jpg', 6, 70, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (85, 'Đồng hồ tranh cô gái nghệ thuật hiện đại DH1160', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/18-min-480x480.jpg', 12, 70, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (86, 'Đồng hồ tranh cô gái nghệ thuật trừu tượng DH1154', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/z2875566214866_0838f3d6e28a267fe3e3b1e5420683fc-480x480.jpg', 9, 46, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (87, 'Đồng hồ tranh hươu vàng phong cảnh nghệ thuật DH1151', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/11-min-480x480.jpg', 8, 22, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (88, 'Đồng hồ tranh hươu vàng phong cảnh nghệ thuật DH1152', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/z2878200427828_da96d1e1984778398955e146f97e7f9d-480x480.jpg', 7, 25, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (89, 'Đồng hồ tranh hươu vàng phong cảnh nghệ thuật DH1157', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 1, 'https://tuongxinh.com.vn/wp-content/uploads/2021/10/17-min-480x480.jpg', 4, 70, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (90, 'ĐỒNG HỒ TREO TƯỜNG NGHỆ THUẬT DHA11', 1250000, 14, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2019/05/dong-ho-con-cong-doi-trang-tri-phong-khach-001-1377-0-480x480.jpg', 12, 31, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (91, 'Đồng hồ treo tường phòng khách DH911', 1050000, 29, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2018/08/Dh-911-2-480x480.jpg', 5, 38, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (92, 'ĐỒNG HỒ CHIM CÔNG NGHỆ THUẬT DHA110', 1380000, 16, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2021/05/dong-ho-treo-tuong-doi-cong-480x480.jpg', 13, 61, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (93, 'Đồng hồ chim công nghệ thuật sang trọng DHA203', 1850000, 20, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3874481385329_9c7fdef1842985cb5a74fca7f0b21767-480x480.jpg', 2, 27, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (94, 'Đồng hồ chim công nghệ thuật sang trọng DHA205', 1850000, 20, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3874481877518_2a8961a9480104132fd70750d6471c24-480x480.jpg', 4, 62, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (95, 'Đồng hồ chim công nghệ thuật sang trọng DHA212', 1250000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3874487541207_10d9fc53b291b98cde0cab89a8393a1d-480x480.jpg', 9, 43, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (96, 'Đồng hồ treo tường chim công nghệ thuật DHA306', 1280000, 0, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4801533074298_0bacba4eb2c5be80982bbc1569095fe3-1-480x480.jpg', 6, 64, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (97, 'Đồng hồ chim Công cao cấp trang trí nội thất DHA158', 1480000, 18, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462113288034_7d95a16dab10dfe187f5ccd64c6145e6-min-480x480.jpg', 14, 30, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (98, 'Đồng hồ chim Công cao cấp trang trí nội thất DHA159', 1850000, 11, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462113308211_eae1b3929946d235ffc94913347ec329-min-480x480.jpg', 8, 34, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (99, 'Đồng hồ chim Công cao cấp trang trí nội thất DHA160', 1450000, 19, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462113317483_e028d87c63fea3fbf7694f7fd123d795-min-480x480.jpg', 5, 28, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (100, 'Đồng hồ chim Công cao cấp trang trí nội thất DHA161', 1500000, 37, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462113310501_f0231ecd6f7a533f49dca23a10deb37e-min-480x480.jpg', 5, 70, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (101, 'Đồng hồ chim Công cao cấp trang trí nội thất DHA162', 1800000, 36, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462112740175_959f0be5ad4f223a2caef61279f51ba9-min-480x480.jpg', 12, 25, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (102, 'Đồng hồ chim Công cao cấp trang trí nội thất DHA163', 1220000, 18, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z5375766772099_8852fd611055b63f7952826ff7d65b07-480x480.jpg', 3, 52, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (103, 'Đồng hồ chim Công cao cấp trang trí nội thất DHA165', 1090000, 40, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462111787420_c0fb7556297d97f0d157ec54f10939df-min-480x480.jpg', 7, 40, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (104, 'Đồng hồ chim Công cao cấp trang trí nội thất DHA181', 1150000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3536120733820_11aef53541ffe4ad7019e38c34a5a5ac-480x480.jpg', 14, 40, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (105, 'Đồng hồ chim Công cao cấp trang trí nội thất DHA182', 1750000, 6, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/07/Untitled-2-480x480.jpg', 7, 24, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (106, 'Đồng hồ chim Công cao cấp trang trí nội thất DHA183', 1500000, 17, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/07/z3536124251732_03ff8c457d56949f5f2e0f1ae179a876-480x480.jpg', 5, 57, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (107, 'Đồng hồ chim Công cao cấp trang trí nội thất sang trọng DHA175', 1250000, 22, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/06/1-2-480x480.jpg', 6, 41, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (108, 'Đồng hồ trang trí nội thất phòng khách DHA103', 1100000, 47, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2021/03/Dha-103-3-480x480.jpg', 0, 48, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (109, 'ĐỒNG HỒ CHIM CÔNG NGHỆ THUẬT DHA105', 1180000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2021/05/z2473743777269_4fe76ef81b318538b5ae6d717849c2af-min-480x480.jpg', 11, 20, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (110, 'ĐỒNG HỒ CHIM CÔNG NGHỆ THUẬT DHA106', 1100000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2021/05/z2489573804844_07315879eccffd4c9bcd4c884cc7160b-min-480x480.jpg', 6, 59, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (111, 'ĐỒNG HỒ CHIM CÔNG NGHỆ THUẬT DHA107', 1050000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2021/05/z2489577471676_71cf0b83a7cc9c81778ca5649d1a8917-min-480x480.jpg', 11, 23, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (112, 'ĐỒNG HỒ CHIM CÔNG NGHỆ THUẬT DHA108', 1250000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2021/05/dha108-480x480.jpg', 10, 66, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (113, 'ĐỒNG HỒ CHIM CÔNG NGHỆ THUẬT DHA109', 1390000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2021/05/78a0c23efec60b9852d7-480x480.jpg', 3, 47, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (114, 'Đồng hồ nghệ thuật đôi chim công uyên ương DHA34', 1550000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3519549177740_a68304d8bdce0e17990d5036b183a820-480x480.jpg', 3, 65, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (115, 'Đồng hồ treo tường Chim Công DHA53', 890000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2020/06/046c4509c41939476008-480x480.jpg', 6, 54, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (116, 'Đồng hồ treo tường Chim Công uyên ương DHA99', 1380000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2020/12/z2216902905662_52c2f07a966724d6ea7164f1c8e46206-min-480x480.jpg', 8, 40, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (117, 'Đồng hồ treo tường nghệ thuật Chim Công DH0152', 920000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2020/07/z1984819253800_c799b096e031c89f553044df295cf0a4-480x480.jpg', 0, 21, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (118, 'Đồng hồ treo tường nghệ thuật Chim Công DH0181', 780000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2018/01/dong-ho-treo-tuong-nghe-thuat-cong-hoang-DH0181-1-1-480x480.jpg', 3, 63, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (119, 'Đồng hồ treo tường nghệ thuật chim công DH131', 890000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2020/02/đồng-hồ-nghệ-thuật-chim-công-dh131-480x480.jpg', 0, 22, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (120, 'Đồng hồ treo tường nghệ thuật Chim Công DHA01', 1300000, 19, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2019/05/O1CN01tkdAxh1b9JsfI1d6R_3043023422-480x480.jpg', 5, 57, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (121, 'Đồng hồ treo tường nghệ thuật Chim Công DHA02', 990000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2019/05/10834260600_682455381-480x480.jpg', 5, 34, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (122, 'Đồng hồ treo tường nghệ thuật Chim Công DHA80', 1090000, 37, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2020/11/z2187105053148_d9e8e8fdf24b646ebdc70512fcc4b76a-min-480x480.jpg', 1, 39, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (123, 'Đồng hồ treo tường nghệ thuật DH0151', 1100000, 11, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2019/05/e29231ae5e42a71cfe53-480x480.jpg', 10, 62, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (124, 'Đồng hồ treo tường nghệ thuật DH1014', 1150000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2019/02/143da1b638ffdea187ee-480x480.jpg', 0, 57, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (125, 'ĐỒNG HỒ TREO TƯỜNG NGHỆ THUẬT DHA10', 890000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2019/05/doi-chim-cong-noi-2-480x480.jpg', 4, 40, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (126, 'Đồng hồ treo tường phòng khách DH964', 850000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2018/09/8858815897_682455381-480x480.jpg', 10, 52, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (127, 'Đồng hồ treo tường sang trọng DH923', 1900000, 30, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2018/08/a3e04f1c022ba4abfcc0384ae2886cda-480x480.jpg', 7, 24, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (128, 'Đồng hồ treo tường sang trọng DH924', 1900000, 30, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 2, 'https://tuongxinh.com.vn/wp-content/uploads/2018/08/Đồng-hồ-treo-tường-chim-công-cao-cấp-sang-trọng-480x480.jpg', 11, 53, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (129, 'Đồng hồ pha lê để bàn quà tặng khách hàng, quà tặng doanh nghiệp QT01', 1150000, 26, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4822361888385_a1846144eb9401a4122c9f0593330304-min-1-480x480.jpg', 11, 28, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (130, 'Đồng hồ gỗ để bàn quà tặng khách hàng, quà tặng doanh nghiệp QT68', 380000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/Dong-ho-de-ban-qua-tang-cong-ty-doanh-nghiep-khach-hang-480x480.jpg', 1, 21, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (131, 'Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG236', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833135940196_69cc5d47a521f7c5968b3f969ead38a1-480x480.jpg', 0, 58, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (132, 'Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG241', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833101000295_3f82c8b8a70b7c4d17320526dbfd8034-480x480.jpg', 5, 53, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (133, 'Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG35', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833171537898_c194c3148162d68314387b6f259c93b9-min-480x480.jpg', 0, 27, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (134, 'Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG65', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833158103208_ade094b66513b09916c109138cf31f99-480x480.jpg', 14, 39, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (135, 'Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG67', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833137905058_666b6954fd462dda5f3203f357d1ca5d-480x480.jpg', 5, 68, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (136, 'Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG82', 350000, 0, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833167428623_f18adb05ad8ca68b3f41a37b897daecb-min-480x480.jpg', 9, 44, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (137, 'Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG83', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833120397785_4fdf46a5793a8289bc56d889957ebd28-480x480.jpg', 0, 55, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (138, 'Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG84', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833130561937_4778499556cb0e0359dcc84b42e4ca84-480x480.jpg', 1, 26, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (139, 'Hộp đựng bút Mã Đáo Thành Công quà tặng khách hàng đối tác, quà tặng doanh nghiệp QT23', 1200000, 0, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/12/1200k-480x480.jpg', 10, 29, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (140, 'Đồng hồ tranh tết in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT13', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146014101_c8ad4bc745a0206e0b00d9b8ec4627d3-480x480.jpg', 1, 62, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (141, 'Đồng hồ tranh tết in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT16', 650000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146014251_940920a85d36aa57b21c7ba430ed4255-480x480.jpg', 3, 32, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (142, 'Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG01', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833178877485_28c4faac8b80229314b50c0f005a7dd7-min-480x480.jpg', 10, 48, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (143, 'Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG175', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833145490635_91a20b262c731cf360dbe61c6ce6b22f-480x480.jpg', 7, 23, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (144, 'Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG240', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833182349473_d3d0eebcb254f52579aebf811650c0d6-min-480x480.jpg', 14, 56, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (145, 'Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG68', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833143041298_ef584aab62e4cb3647aa9a0639e956a1-480x480.jpg', 13, 57, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (146, 'Đồng hồ chim công nghệ thuật in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT20', 850000, 0, 1, 1, 'Cao cấp', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146438603_c1ffedbb9d58816c7a5af67d4591f438-480x480.jpg', 10, 59, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (147, 'Đồng hồ nghệ thuật in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT21', 850000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146438606_8a181cdb517184e5eccf4db64326f268-480x480.jpg', 14, 59, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (148, 'Đồng hồ nghệ thuật in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT22', 850000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146441782_e6bd9e41afcdf9854aab05c916bdf4e6-480x480.jpg', 4, 47, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (149, 'Đồng hồ tranh tết in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT14', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146014205_6ab0cadeca8a5ac99e3353863f89ffac-480x480.jpg', 10, 65, '2024-12-19 14:48:25', '2025-01-12 17:34:28');
INSERT INTO `products` VALUES (150, 'Đồng hồ tranh tết in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT19', 350000, 0, 1, 1, 'Bình thường', '*SHOUSE là thương hiệu đồng hồ treo tường đẳng cấp, uy tín đã và đang xuất khẩu sang các nước Châu Âu như: Pháp, Đức, Ý, Thụy Điển … Các sản phẩm của chúng tôi đều được thiết kế tinh xảo từ đường nét đến nước sơn. Đồng hồ treo tường Chim Công Vàng A25 là hàng loại 1 chất lượng cao đang được rất nhiều khách hàng chọn lựa.', 'https://www.youtube.com/embed/Ld8I6ZbQtMQ?si=UKSk55dKCqH0e3AK', 3, 'https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146014301_9c187ae27d9e5df48e8c695defe9fd12-480x480.jpg', 8, 29, '2024-12-19 14:48:25', '2025-01-12 17:34:28');

-- ----------------------------
-- Table structure for refund_policies
-- ----------------------------
DROP TABLE IF EXISTS `refund_policies`;
CREATE TABLE `refund_policies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `policy_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of refund_policies
-- ----------------------------
INSERT INTO `refund_policies` VALUES (1, 'Trả hàng sau 15 ngày');

-- ----------------------------
-- Table structure for shipping_info
-- ----------------------------
DROP TABLE IF EXISTS `shipping_info`;
CREATE TABLE `shipping_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `policy_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shipping_info
-- ----------------------------
INSERT INTO `shipping_info` VALUES (1, 'Vận chuyển miễn phí');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` enum('customer','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT NULL,
  `activation_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (16, 'ADMIN', 'admin2004@gmail.com', 'admin123', '$2a$10$0YTIndXXpZWeFkTMpUVk3uuxxQekVkxWIWPmiUaZU5vUUhJYrR.cO', '0813556473', 'NewYork', 'admin', 1, '2025-04-13 15:56:33', NULL, NULL);
INSERT INTO `users` VALUES (29, 'Phuocloc', 'vophuocloc2004@gmail.com', 'vophuocloc2004@gmail.com', NULL, '0342846411', 'Linh Trung, Thủ Đức', NULL, NULL, '2025-04-10 11:24:32', NULL, NULL);
INSERT INTO `users` VALUES (46, 'AlexanderLoc', 'alexanderloc2004@gmail.com', 'alex123', '$2a$10$tIJVLi3KUfOcRmlr3S7RMuuCdcAKeY72ihB3cCSM0oo2qQ1RQq/Ry', NULL, NULL, NULL, 0, '2025-04-13 20:09:49', NULL, '768190');
INSERT INTO `users` VALUES (47, 'Test', 'test@example.com', 'test123', '$2a$10$4Cv3M0KGEpRe4zvjEZ5Pauu17SM3eXkqB6Cy6M9iWErQKp2PzM3tS', '123456789', NULL, NULL, 1, '2025-04-13 20:29:47', NULL, NULL);
INSERT INTO `users` VALUES (48, 'Võ Phước Lộc', NULL, '22130150', '$2a$10$bH7HUy5hE3BuhQrW3Xg8fu721TjaRofz7yq1KOchGY.ychh91Mtam', '0813556473', NULL, NULL, 1, '2025-04-13 20:58:23', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
