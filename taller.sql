/*
 Navicat Premium Data Transfer

 Source Server         : MariaDB_localhost
 Source Server Type    : MariaDB
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : taller

 Target Server Type    : MariaDB
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 16/10/2019 14:37:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('otro', 4, 1566596332);
INSERT INTO `auth_assignment` VALUES ('otros', 4, 1566597215);

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `group_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  INDEX `fk_auth_item_group_code`(`group_code`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `auth_item_ibfk_2` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('Admin', 'assignRolesToUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeOwnPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeUserPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'createUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'deleteUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'editUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set-roles');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUserRoles');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('changeOwnPassword', '/user-management/auth/change-own-password');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', '/user-management/user/change-password');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('createUsers', '/user-management/user/create');
INSERT INTO `auth_item_child` VALUES ('createUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/delete');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('editUserEmail', 'viewUserEmail');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/update');
INSERT INTO `auth_item_child` VALUES ('editUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('jefe', 'prueba');
INSERT INTO `auth_item_child` VALUES ('otro', 'Usuario General');
INSERT INTO `auth_item_child` VALUES ('otros', 'permisoOtros');
INSERT INTO `auth_item_child` VALUES ('permisoOtros', '/site/acceso');
INSERT INTO `auth_item_child` VALUES ('prueba', '/dashboard/index');
INSERT INTO `auth_item_child` VALUES ('prueba', '/req-requisicion/create');
INSERT INTO `auth_item_child` VALUES ('prueba', '/req-requisicion/index');
INSERT INTO `auth_item_child` VALUES ('prueba', '/req-requisicion/report');
INSERT INTO `auth_item_child` VALUES ('prueba', '/req-requisicion/update');
INSERT INTO `auth_item_child` VALUES ('prueba', '/req-requisicion/view');
INSERT INTO `auth_item_child` VALUES ('prueba', '/site/index');
INSERT INTO `auth_item_child` VALUES ('prueba', '/sws-dashboard/submenu');
INSERT INTO `auth_item_child` VALUES ('prueba', '/sws-dashboardgrupos/index');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/site/index');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/index');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/view');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/index');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/view');

-- ----------------------------
-- Table structure for auth_item_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_group`;
CREATE TABLE `auth_item_group`  (
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item_group
-- ----------------------------
INSERT INTO `auth_item_group` VALUES ('otros', 'otros', 1566597116, 1566597116);
INSERT INTO `auth_item_group` VALUES ('prueba', 'prueba', 1566588258, 1566588258);
INSERT INTO `auth_item_group` VALUES ('userCommonPermissions', 'User common permission', 1426062189, 1426062189);
INSERT INTO `auth_item_group` VALUES ('userManagement', 'User management', 1426062189, 1426062189);

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `confirmation_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `superadmin` smallint(1) DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `registration_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bind_to_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email_confirmed` smallint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'superadmin', 'kz2px152FAWlkHbkZoCiXgBAd-S8SSjF', '$2y$13$MhlYe12xkGFnSeK0sO2up.Y9kAD9Ct6JS1i9VLP7YAqd1dFsSylz2', NULL, 1, 1, 1426062188, 1426062188, NULL, NULL, NULL, 0);
INSERT INTO `user` VALUES (4, 'otro', 'NEDNdq8Kt7291gYRuEAMtla4XCMF_tMe', '$2y$13$zeHS/vr1TLWqbGdEk09SNe2dePeXFnRoj0FQhvM.4GjlRvGFCWJNW', NULL, 1, 0, 1566596324, 1566596324, '127.0.0.1', '', '', 0);
INSERT INTO `user` VALUES (5, 'polo', 'frM3C3hHw3if4TI4zX_zsgX7oU9qBIRt', '$2y$13$r/lxPp71z1gbfj8cuNeKc..tozuUDqaMIjE5GqnyFVCG0bQJEkYQe', NULL, 1, 0, 1571181464, 1571181464, '127.0.0.1', '', '', 0);

-- ----------------------------
-- Table structure for user_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_log`;
CREATE TABLE `user_visit_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `language` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  `browser` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `os` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO `user_visit_log` VALUES (1, '5cae8867448fc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1, 1554942055, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (2, '5d7ee7dd99c7a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1568597981, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (3, '5d816521da1bb', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1568761121, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (4, '5d82c5894e1f9', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1568851337, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (5, '5d841b5a6ffe3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1568938842, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (6, '5d84d8aedc9ec', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1568987310, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (7, '5d85430a0473c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1569014538, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (8, '5d8543eadfa4e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1569014762, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (9, '5d8544a63cab0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1569014950, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (10, '5d8553593c2cd', '192.168.4.24', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1, 1569018713, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (11, '5d855e5856df2', '192.16.24.80', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1569021528, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (12, '5d8d20adc3c70', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1, 1569530029, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (13, '5d97f374e4e86', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1, 1570239348, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (14, '5d97f5eecc274', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1, 1570239982, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (15, '5d9f4a202a022', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1, 1570720288, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (16, '5da0cf6aed40a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1, 1570819947, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (17, '5da6110739a95', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571164423, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (18, '5da62b95422c3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571171221, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (19, '5da63b1a7bede', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571175194, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (20, '5da6537506901', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571181429, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (21, '5da653a9e082b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571181481, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (22, '5da656e8eaef7', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571182312, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (23, '5da656f207199', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571182322, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (24, '5da65782d5152', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571182466, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (25, '5da65784d6215', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571182468, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (26, '5da6582ff3a8f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571182639, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (27, '5da65fced177f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571184590, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (28, '5da65fd0c0d91', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571184592, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (29, '5da760abb68e2', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571250347, 'Chrome', 'Windows');

-- ----------------------------
-- Table structure for ven_almacen
-- ----------------------------
DROP TABLE IF EXISTS `ven_almacen`;
CREATE TABLE `ven_almacen`  (
  `alm_id` int(11) NOT NULL AUTO_INCREMENT,
  `alm_folio` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alm_fecha` date NOT NULL,
  `alm_noPedido` int(255) DEFAULT NULL,
  `alm_vehiculo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alm_modelo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alm_mecanico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alm_placa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alm_color` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alm_trabajo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alm_garantia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`alm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ven_almacen
-- ----------------------------
INSERT INTO `ven_almacen` VALUES (1, 'f-1', '2019-10-16', 213, 'Nissan', 'Sports', 'Juan José', '123', 'Rojo', '3145', '6 meses');

-- ----------------------------
-- Table structure for ven_concepto
-- ----------------------------
DROP TABLE IF EXISTS `ven_concepto`;
CREATE TABLE `ven_concepto`  (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_cantidad` double(10, 2) NOT NULL,
  `con_descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `con_precioUnitario` double(10, 2) NOT NULL,
  `con_fkalm_id` int(11) NOT NULL,
  PRIMARY KEY (`con_id`) USING BTREE,
  INDEX `con_fkalm_id`(`con_fkalm_id`) USING BTREE,
  CONSTRAINT `con_fk1` FOREIGN KEY (`con_fkalm_id`) REFERENCES `ven_almacen` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ven_concepto
-- ----------------------------
INSERT INTO `ven_concepto` VALUES (1, 3.00, '-----', 204.50, 1);
INSERT INTO `ven_concepto` VALUES (2, 2.00, '----', 12.00, 1);

-- ----------------------------
-- Table structure for ven_folio
-- ----------------------------
DROP TABLE IF EXISTS `ven_folio`;
CREATE TABLE `ven_folio`  (
  `fol_id` int(11) NOT NULL AUTO_INCREMENT,
  `fol_serie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fol_folio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `fol_descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`fol_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ven_folio
-- ----------------------------
INSERT INTO `ven_folio` VALUES (11, 'A', '2', NULL);
INSERT INTO `ven_folio` VALUES (19, 'B', '0', NULL);
INSERT INTO `ven_folio` VALUES (20, 'f', '1', NULL);
INSERT INTO `ven_folio` VALUES (21, 'C', '0', NULL);
INSERT INTO `ven_folio` VALUES (22, 'BF', '0', NULL);
INSERT INTO `ven_folio` VALUES (23, 'test', '0', NULL);
INSERT INTO `ven_folio` VALUES (24, 'DSDS', '0', NULL);
INSERT INTO `ven_folio` VALUES (25, 'z', '1', NULL);
INSERT INTO `ven_folio` VALUES (26, 'F', '0', NULL);
INSERT INTO `ven_folio` VALUES (27, 'F', '0', NULL);

-- ----------------------------
-- Table structure for ven_producto
-- ----------------------------
DROP TABLE IF EXISTS `ven_producto`;
CREATE TABLE `ven_producto`  (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_unidad` int(11) NOT NULL,
  `pro_nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pro_precio` decimal(10, 2) NOT NULL,
  `pro_fkventas` int(11) NOT NULL,
  PRIMARY KEY (`pro_id`) USING BTREE,
  INDEX `pro_fkven_folio`(`pro_fkventas`) USING BTREE,
  CONSTRAINT `ven_producto_ibfk_1` FOREIGN KEY (`pro_fkventas`) REFERENCES `ven_ventas` (`ven_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ven_producto
-- ----------------------------
INSERT INTO `ven_producto` VALUES (87, 1, 'ACEITE', 500.00, 97);
INSERT INTO `ven_producto` VALUES (88, 1, 'ACEITE', 500.00, 98);

-- ----------------------------
-- Table structure for ven_recibo
-- ----------------------------
DROP TABLE IF EXISTS `ven_recibo`;
CREATE TABLE `ven_recibo`  (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_nomcliente` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rec_cantidad` decimal(11, 2) NOT NULL,
  `rec_concepto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rec_nomresponsable` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rec_fecha` date NOT NULL,
  `rec_folio` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`rec_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ven_recibo
-- ----------------------------
INSERT INTO `ven_recibo` VALUES (1, 'Daniel Osorio', 123.23, 'efe', 'Felipe Osorio', '0000-00-00', '');
INSERT INTO `ven_recibo` VALUES (2, 'Daniel Osorio', 123.23, 'Utiles', 'Felipe Osorio', '2019-10-15', '123a');
INSERT INTO `ven_recibo` VALUES (3, 'Daniel Osorio', 123.23, 'TESTEO DE  RECIBOS', 'Felipe Osorio', '2019-10-15', 'z-1');

-- ----------------------------
-- Table structure for ven_ventas
-- ----------------------------
DROP TABLE IF EXISTS `ven_ventas`;
CREATE TABLE `ven_ventas`  (
  `ven_id` int(11) NOT NULL AUTO_INCREMENT,
  `ven_folio` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_fecha` date NOT NULL,
  `ven_nombre` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_paterno` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_materno` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_domicilio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_ciudad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_rfc` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_vehiculo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_modelo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_placa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_tecnico` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_oi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ven_garantia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ven_id`) USING BTREE,
  INDEX `ven_fkfolio`(`ven_folio`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ven_ventas
-- ----------------------------
INSERT INTO `ven_ventas` VALUES (97, 'A-1', '2019-09-19', 'alberto', 'chable', 'rodriguez', 'a', 'Villahermosa', 'hydhfhhf', 'vocho', 'azul', '2015', 'hfgfgf', 'jose', '24314', '6 meses de garantia');
INSERT INTO `ven_ventas` VALUES (98, 'A-2', '2019-09-20', 'ALBERTO', 'CHABLE', 'RODRIGUEZ', 'industrial', 'villahermosa', '', 'bocho', 'gris', '2019', '555fff', 'lupe', '554664', '6 meses de garantia');

SET FOREIGN_KEY_CHECKS = 1;
