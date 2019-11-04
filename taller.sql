/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : taller

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 04/11/2019 15:43:40
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
INSERT INTO `auth_assignment` VALUES ('Mecanico', 8, 1571593106);
INSERT INTO `auth_assignment` VALUES ('Mecanico', 10, 1572903296);
INSERT INTO `auth_assignment` VALUES ('operador', 5, 1571510454);
INSERT INTO `auth_assignment` VALUES ('operador', 7, 1571591867);
INSERT INTO `auth_assignment` VALUES ('operador', 9, 1572903173);
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
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/gii/*', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/*', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/action', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/diff', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/index', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/preview', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/view', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/gridview/*', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/gridview/export/*', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/gridview/export/download', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/site/*', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/site/acceso', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/site/captcha', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/site/dash', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/site/error', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/site/index', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/site/login', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/site/logout', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/*', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/*', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-activate', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-deactivate', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-delete', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/create', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/delete', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/grid-page-size', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/grid-sort', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/index', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/toggle-attribute', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/update', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/view', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/*', 3, NULL, NULL, NULL, 1571510329, 1571510329, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/captcha', 3, NULL, NULL, NULL, 1571510329, 1571510329, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/change-own-password', 3, NULL, NULL, NULL, 1571510329, 1571510329, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-email', 3, NULL, NULL, NULL, 1571510329, 1571510329, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-email-receive', 3, NULL, NULL, NULL, 1571510329, 1571510329, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-registration-email', 3, NULL, NULL, NULL, 1571510329, 1571510329, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/login', 3, NULL, NULL, NULL, 1571510329, 1571510329, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/logout', 3, NULL, NULL, NULL, 1571510329, 1571510329, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/password-recovery', 3, NULL, NULL, NULL, 1571510329, 1571510329, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/password-recovery-receive', 3, NULL, NULL, NULL, 1571510329, 1571510329, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/registration', 3, NULL, NULL, NULL, 1571510329, 1571510329, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/*', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-activate', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-deactivate', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-delete', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/create', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/delete', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/grid-page-size', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/grid-sort', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/index', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/refresh-routes', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/set-child-permissions', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/set-child-routes', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/toggle-attribute', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/update', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/view', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/*', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-activate', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-deactivate', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-delete', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/create', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/delete', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/grid-page-size', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/grid-sort', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/index', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/set-child-permissions', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/set-child-roles', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/toggle-attribute', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/update', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/view', 3, NULL, NULL, NULL, 1571510328, 1571510328, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/*', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set-roles', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/*', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-activate', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-deactivate', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-delete', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/create', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/delete', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/grid-page-size', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/grid-sort', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/index', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/toggle-attribute', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/update', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/view', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/*', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-activate', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-deactivate', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-delete', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/change-password', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/create', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/delete', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/grid-page-size', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/grid-sort', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/index', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/toggle-attribute', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/update', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/view', 3, NULL, NULL, NULL, 1571510327, 1571510327, NULL);
INSERT INTO `auth_item` VALUES ('/ven-almacen/*', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-almacen/create', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-almacen/index', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-almacen/report', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-almacen/view', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-concepto/*', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/*', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/ajax-create', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/create', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/delete', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/index', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/update', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/view', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-producto/*', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-producto/create', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-producto/delete', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-producto/index', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-producto/update', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-producto/view', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-recibo/*', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-recibo/create', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-recibo/delete', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-recibo/index', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-recibo/report', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-recibo/update', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-recibo/view', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-ventas/*', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-ventas/create', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-ventas/delete', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-ventas/index', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-ventas/report', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-ventas/report2', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-ventas/update', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-ventas/view', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('Mecanico', 1, 'Mecanico', NULL, NULL, 1571592758, 1571592758, NULL);
INSERT INTO `auth_item` VALUES ('operador', 1, 'operador', NULL, NULL, 1571510265, 1571545220, NULL);
INSERT INTO `auth_item` VALUES ('operar', 2, 'operador', NULL, NULL, 1571510318, 1571510318, NULL);
INSERT INTO `auth_item` VALUES ('tecnico', 2, 'Mecanico', NULL, NULL, 1571592796, 1571592796, NULL);

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
INSERT INTO `auth_item_child` VALUES ('prueba', '/dashboard/index');
INSERT INTO `auth_item_child` VALUES ('prueba', '/req-requisicion/create');
INSERT INTO `auth_item_child` VALUES ('prueba', '/req-requisicion/index');
INSERT INTO `auth_item_child` VALUES ('prueba', '/req-requisicion/report');
INSERT INTO `auth_item_child` VALUES ('prueba', '/req-requisicion/update');
INSERT INTO `auth_item_child` VALUES ('prueba', '/req-requisicion/view');
INSERT INTO `auth_item_child` VALUES ('permisoOtros', '/site/acceso');
INSERT INTO `auth_item_child` VALUES ('operar', '/site/index');
INSERT INTO `auth_item_child` VALUES ('prueba', '/site/index');
INSERT INTO `auth_item_child` VALUES ('tecnico', '/site/index');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/site/index');
INSERT INTO `auth_item_child` VALUES ('prueba', '/sws-dashboard/submenu');
INSERT INTO `auth_item_child` VALUES ('prueba', '/sws-dashboardgrupos/index');
INSERT INTO `auth_item_child` VALUES ('changeOwnPassword', '/user-management/auth/change-own-password');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set-roles');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/index');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/view');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', '/user-management/user/change-password');
INSERT INTO `auth_item_child` VALUES ('createUsers', '/user-management/user/create');
INSERT INTO `auth_item_child` VALUES ('operar', '/user-management/user/create');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/delete');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('operar', '/user-management/user/index');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/index');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/update');
INSERT INTO `auth_item_child` VALUES ('operar', '/user-management/user/update');
INSERT INTO `auth_item_child` VALUES ('operar', '/user-management/user/view');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/view');
INSERT INTO `auth_item_child` VALUES ('Admin', 'assignRolesToUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeOwnPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeUserPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'createUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'deleteUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'editUsers');
INSERT INTO `auth_item_child` VALUES ('operador', 'operar');
INSERT INTO `auth_item_child` VALUES ('otros', 'permisoOtros');
INSERT INTO `auth_item_child` VALUES ('jefe', 'prueba');
INSERT INTO `auth_item_child` VALUES ('otro', 'Usuario General');
INSERT INTO `auth_item_child` VALUES ('editUserEmail', 'viewUserEmail');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUserRoles');
INSERT INTO `auth_item_child` VALUES ('Admin', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('createUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('editUsers', 'viewUsers');

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'superadmin', 'kz2px152FAWlkHbkZoCiXgBAd-S8SSjF', '$2y$13$MhlYe12xkGFnSeK0sO2up.Y9kAD9Ct6JS1i9VLP7YAqd1dFsSylz2', NULL, 1, 1, 1426062188, 1426062188, NULL, NULL, NULL, 0);
INSERT INTO `user` VALUES (4, 'otro', 'NEDNdq8Kt7291gYRuEAMtla4XCMF_tMe', '$2y$13$zeHS/vr1TLWqbGdEk09SNe2dePeXFnRoj0FQhvM.4GjlRvGFCWJNW', NULL, 1, 0, 1566596324, 1566596324, '127.0.0.1', '', '', 0);
INSERT INTO `user` VALUES (5, 'polo', 'aHZwmwypWrGKdoIR2fc9Z8L7csxnm1O3', '$2y$13$67nfEOEKXk8frbDWov5xH.8sfLYZO2lDfBgO6X1hrM62OYmr1j8o6', NULL, 1, 0, 1571340187, 1571340187, '127.0.0.1', '', '', 0);
INSERT INTO `user` VALUES (6, '11', 'Y1aZlqwvLnSHdT03e-103VctJ52jg-s5', '$2y$13$EpwcqOS07AgbA8sJF6WwQeRvXxddbERlx2dtThRgsl8uuo1g9YWaC', NULL, 1, 0, 1571591649, 1571591649, '127.0.0.1', '', '', 0);
INSERT INTO `user` VALUES (7, 'aa', 'CfXxvCTzyVi_v4I2BJhwisfj9GhUl4W3', '$2y$13$qDNsMDjVTSUQ3oA4yjaXWu99DVLXXccqqetSeBI2Anx8cfsR0U/L.', NULL, 1, 0, 1571591867, 1571591867, '127.0.0.1', '', '', 0);
INSERT INTO `user` VALUES (8, 'ss', 'xy5_WRNHEj0erBr-f2KReBEv6L3uezI-', '$2y$13$HRdbOvlRPZj7LABOsWUyMujoYFLfa9RvF5PjNJPBda32.ZhfS3Tqe', NULL, 1, 0, 1571592271, 1571593094, '127.0.0.1', '', NULL, 0);
INSERT INTO `user` VALUES (9, 'operador', '89zFPnK7Pi7u151hjchckWoyYovt15YC', '$2y$13$wN3n5w2FjJ7IwZEKGMzxX.jEogONetTNLMg.WArjC84NsJWKq3E1y', NULL, 1, 0, 1572903173, 1572903173, '127.0.0.1', '', NULL, 0);
INSERT INTO `user` VALUES (10, 'mecanico', 'u0qYQ-RKMI6rixefcZKjA63gNB0S2m0k', '$2y$13$dYSLrzETyB0kkEe1OWmeru69w2czOyShBhbgY3SHUTY9oIMf7DEYi', NULL, 1, 0, 1572903296, 1572903296, '127.0.0.1', '', '', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO `user_visit_log` VALUES (1, '5daa9fe115080', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571463137, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (28, '5dab56181b5e7', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571509784, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (29, '5dab57d2c188b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571510226, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (30, '5dab58cf9dd00', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571510479, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (31, '5dabc4e17d496', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571538145, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (32, '5dabdce31a608', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571544291, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (33, '5dabdf0f4d298', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571544847, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (34, '5dabdf36b2cd3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571544886, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (35, '5dabe0a59b439', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571545253, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (36, '5dac4cee06526', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571572974, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (37, '5dac551c5a450', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571575068, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (38, '5dac84d20ccd3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571587282, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (39, '5dac852f1a80a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571587375, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (40, '5dac9ba1af7a5', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 8, 1571593121, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (41, '5dac9c4871d92', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571593288, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (42, '5dae033f59444', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571685183, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (43, '5dae03531a1c6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571685203, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (44, '5dae048d4063f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571685517, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (45, '5dae1d708cf9a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571691888, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (46, '5dae429f6f8ce', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1571701407, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (47, '5daf664acdafa', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571776074, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (48, '5db0a5dcd7f9d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571857884, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (49, '5db0a87e3bca3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1571858558, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (50, '5db2071d69f0b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 1, 1571948317, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (51, '5db2071d69f17', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 1, 1571948317, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (52, '5db21ab4acf05', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 1, 1571953332, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (53, '5db3033013efe', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 1, 1572012848, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (54, '5db3b65f1546d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1, 1572058719, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (55, '5db782bb97802', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1572307643, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (56, '5db791576f089', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1572311383, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (57, '5db7a72a06be9', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1572316970, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (58, '5db871a367632', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1572368803, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (59, '5db89b2a46eab', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1572379434, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (60, '5db89dc66352d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1572380102, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (61, '5db8a0dd1254e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1572380893, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (62, '5db8a2eac7375', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1572381418, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (63, '5db8a6b89baae', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1572382392, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (64, '5db8be24f3712', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1572388389, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (65, '5db8c774e081b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1572390772, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (66, '5db8dd741d5f6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 5, 1572396404, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (67, '5dbbaae704135', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', 5, 1572580071, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (68, '5dc0920c8a3a3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', 5, 1572901388, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (69, '5dc0920c89d8a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', 5, 1572901388, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (70, '5dc098d6372ff', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', 5, 1572903126, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (71, '5dc098e4b6caf', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', 5, 1572903140, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (72, '5dc0991647e5f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', 9, 1572903190, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (73, '5dc0995f8450b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', 1, 1572903263, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (74, '5dc099910a298', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', 10, 1572903313, 'Chrome', 'Windows');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ven_almacen
-- ----------------------------
INSERT INTO `ven_almacen` VALUES (1, 'z-4', '2019-10-16', 123, 'NISSAN', 'MAZDA', 'JOSE ALBERTO', '232FERG', 'ROJO', 'PINTURA', '6 MESES');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ven_concepto
-- ----------------------------
INSERT INTO `ven_concepto` VALUES (1, 1.00, 'PINTURA CAPA', 123.24, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ven_folio
-- ----------------------------
INSERT INTO `ven_folio` VALUES (11, 'A', '18', 'Almacen');
INSERT INTO `ven_folio` VALUES (25, 'Z', '11', 'ss');
INSERT INTO `ven_folio` VALUES (29, 'ADADA', '0', '123141');
INSERT INTO `ven_folio` VALUES (30, 'ADADA', '0', '123141');
INSERT INTO `ven_folio` VALUES (31, 'DF', '0', 'Refacciones');
INSERT INTO `ven_folio` VALUES (32, 'DF', '0', 'Refacciones');
INSERT INTO `ven_folio` VALUES (33, 'AD', '0', 'afasfd');
INSERT INTO `ven_folio` VALUES (34, 'XS', '0', 'asdasd');

-- ----------------------------
-- Table structure for ven_orden
-- ----------------------------
DROP TABLE IF EXISTS `ven_orden`;
CREATE TABLE `ven_orden`  (
  `ord_id` int(11) NOT NULL AUTO_INCREMENT,
  `ord_folio` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ord_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ord_user` int(11) DEFAULT NULL,
  `ord_direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ord_codigoPostal` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ord_telefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ord_ife` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ord_modelo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ord_tipo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ord_marca` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ord_placa` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ord_fechaIngreso` datetime(0) NOT NULL,
  `ord_fechaEntrega` datetime(0) DEFAULT NULL,
  `ord_noSerie` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ord_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ord_kilometraje` int(10) DEFAULT NULL,
  `ord_vehiculoExterior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `ord_vehiculoInterior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `ord_observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `ord_tanque` decimal(3, 2) DEFAULT NULL,
  `ord_accesoriosExterior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `ord_accesoriosInterior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `ord_problemas` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `ord_diagnostico` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`ord_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ven_orden
-- ----------------------------
INSERT INTO `ven_orden` VALUES (15, 'A-6', 'Carlos Donaldo', NULL, 'Colonia Espejo 1 #133', '86108', '9932978261', '4151f3sf', 'afsd', '1', 'adasd', 'asdasd', '2019-10-08 12:36:51', '2019-10-25 12:35:22', '24', 'zfsgf', NULL, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', 'n', 0.50, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', 'i', 'n');
INSERT INTO `ven_orden` VALUES (16, 'Z-11', 'asdasd', NULL, 'Colonia Espejo 1 #133', '86108', '9932978261', '980622', 'afsd', '1', 'adasd', '12FS42', '2019-10-25 12:38:42', '2019-10-25 12:38:42', '123', 'zfsgf', 123, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', 'n', 0.50, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', 'i', 'n');
INSERT INTO `ven_orden` VALUES (17, 'A-7', 'DBS', NULL, 'Av Niños Héroes 165, Cuadrante II, Atasta de Serra', '86100', '21351', 'awrfq', '21a', '1', 'a', 'a', '2019-10-28 19:09:51', '2019-10-03 19:10:52', 'a', '', 5151212, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"on\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"on\",\"Bocinas\":\"off\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', 'egew', 0.65, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', 'ewfwe', 'teste');
INSERT INTO `ven_orden` VALUES (18, 'A-8', 'DBS', NULL, 'Av Niños Héroes 165, Cuadrante II, Atasta de Serra', '86100', '21351', 'awrfq', '21a', '1', 'a', 'a', '2019-10-28 19:09:51', '2019-10-03 19:10:52', 'a', '', 5151212, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"on\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"on\",\"Bocinas\":\"off\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', 'egew', 0.65, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', 'ewfwe', 'teste');
INSERT INTO `ven_orden` VALUES (19, 'A-9', 'DBS', NULL, '', '', '', '', '', '', '', '', '2019-10-28 20:44:45', '2019-10-28 20:44:45', '', '', NULL, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', '', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', '', '');
INSERT INTO `ven_orden` VALUES (20, 'A-10', 'DBS', NULL, '', '', '', '', '', '', '', '', '2019-10-28 20:44:45', '2019-10-28 20:44:45', '', '', NULL, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', '', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', '', '');
INSERT INTO `ven_orden` VALUES (21, 'A-11', 'DBS', NULL, '', '', '', '', '', '', '', '', '2019-10-28 20:45:20', '2019-10-28 20:45:20', '', '', NULL, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', '', 0.75, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', '', '');
INSERT INTO `ven_orden` VALUES (22, 'A-12', 'DBS', NULL, '', '', '', '', '', '', '', '', '2019-10-28 20:45:20', '2019-10-28 20:45:20', '', '', NULL, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', '', 0.75, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', '', '');
INSERT INTO `ven_orden` VALUES (23, 'A-13', 'Sergio Daniel Jimenez Zacarias', NULL, 'Fracc.Bonanza Calle 8', '86100', '9935907735', '134TEHERH53Y45YWR', 'F95', 'convertible', 'ferrari', '4F54Y', '2019-10-29 15:00:20', '2019-11-13 18:30:20', '2332535Y1', 'ROJO', 1234, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', '', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', '', '');
INSERT INTO `ven_orden` VALUES (24, 'A-14', 'Sergio Daniel Jimenez Zacarias', NULL, 'Fracc.Bonanza Calle 8', '86100', '9935907735', '134TEHERH53Y45YWR', 'F95', 'convertible', 'ferrari', '4F54Y', '2019-10-29 15:00:20', '2019-11-13 18:30:20', '2332535Y1', 'ROJO', 1234, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', '', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', '', '');
INSERT INTO `ven_orden` VALUES (25, 'A-15', 'Sergio Daniel Jimenez ZACARIAS', NULL, 'Av Niños Héroes 165, Cuadrante II, Atasta de Serra', '86100', '9952151334', 'FG4532', 'ROJOS', 'Convertible', 'Ferrari', '231415', '2019-10-29 15:06:49', '2019-10-29 15:06:49', '15215', 'rojo', 1213, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"on\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"on\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', '', 0.80, '{\"Gato\":\"on\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', '', '');
INSERT INTO `ven_orden` VALUES (26, 'A-16', 'Sergio Daniel Jimenez ZACARIAS', NULL, 'Av Niños Héroes 165, Cuadrante II, Atasta de Serra', '86100', '9952151334', 'FG4532', 'ROJOS', 'Convertible', 'Ferrari', '231415', '2019-10-29 15:06:49', '2019-10-29 15:06:49', '15215', 'rojo', 1213, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"on\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"on\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', '', 0.80, '{\"Gato\":\"on\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', '', '');
INSERT INTO `ven_orden` VALUES (27, 'A-17', 'Sergio Daniel Jimenez ZACARIAS', 10, 'Av Niños Héroes 165, Cuadrante II, Atasta de Serra', '86100', '9952151334', 'awrfq', '21a', '1', 'a', '215151', '2019-11-04 15:41:46', '2019-10-28 19:10:50', '15215', 'rojo', 1234, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', 'noe', 0.55, '{\"Gato\":\"off\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', 'nulls', 'nose');
INSERT INTO `ven_orden` VALUES (28, 'A-18', 'Sergio Daniel Jimenez ZACARIAS', 10, 'Av Niños Héroes 165, Cuadrante II, Atasta de Serra', '86100', '9952151334', 'awrfq', '21a', '1', 'a', '215151', '2019-11-04 15:41:46', '2019-10-28 19:10:50', '15215', 'rojo', 1234, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', 'noe', 0.55, '{\"Gato\":\"off\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', 'nulls', 'nose');

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
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ven_producto
-- ----------------------------
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ven_recibo
-- ----------------------------
INSERT INTO `ven_recibo` VALUES (1, 'Daniel Osorio', 123.23, 'TESTEO DE  RECIBOS', 'Felipe Osorio', '2019-10-15', 'z-1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ven_ventas
-- ----------------------------
INSERT INTO `ven_ventas` VALUES (98, 'A-2', '2019-09-20', 'ALBERTO', 'CHABLE', 'RODRIGUEZ', 'industrial', 'villahermosa', '', 'bocho', 'gris', '2019', '555fff', 'lupe', '554664', '6 meses de garantia');

SET FOREIGN_KEY_CHECKS = 1;
