/*
 Navicat Premium Data Transfer

 Source Server         : LocalHost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : taller

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 09/12/2019 16:42:17
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
  `created_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('auxiliar', 13, 1574811966);
INSERT INTO `auth_assignment` VALUES ('auxiliar', 18, 1574998326);
INSERT INTO `auth_assignment` VALUES ('Mecanico', 5, 1574916661);
INSERT INTO `auth_assignment` VALUES ('Mecanico', 9, 1574916387);
INSERT INTO `auth_assignment` VALUES ('Mecanico', 10, 1572903296);
INSERT INTO `auth_assignment` VALUES ('operador', 5, 1571510454);
INSERT INTO `auth_assignment` VALUES ('operador', 9, 1574916387);
INSERT INTO `auth_assignment` VALUES ('otro', 4, 1566596332);
INSERT INTO `auth_assignment` VALUES ('otros', 4, 1566597215);

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  `group_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
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
INSERT INTO `auth_item` VALUES ('/pdfjs/*', 3, NULL, NULL, NULL, 1574811874, 1574811874, NULL);
INSERT INTO `auth_item` VALUES ('/pdfjs/default/*', 3, NULL, NULL, NULL, 1574811874, 1574811874, NULL);
INSERT INTO `auth_item` VALUES ('/pdfjs/default/index', 3, NULL, NULL, NULL, 1574811874, 1574811874, NULL);
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
INSERT INTO `auth_item` VALUES ('/ven-almacen/delete', 3, NULL, NULL, NULL, 1574811874, 1574811874, NULL);
INSERT INTO `auth_item` VALUES ('/ven-almacen/index', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-almacen/report', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-almacen/update', 3, NULL, NULL, NULL, 1574811874, 1574811874, NULL);
INSERT INTO `auth_item` VALUES ('/ven-almacen/view', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-concepto/*', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/*', 3, NULL, NULL, NULL, 1571510325, 1571510325, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/ajax-create', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/create', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/delete', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/index', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/update', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-folio/view', 3, NULL, NULL, NULL, 1571510326, 1571510326, NULL);
INSERT INTO `auth_item` VALUES ('/ven-orden/*', 3, NULL, NULL, NULL, 1574811874, 1574811874, NULL);
INSERT INTO `auth_item` VALUES ('/ven-orden/create', 3, NULL, NULL, NULL, 1574811874, 1574811874, NULL);
INSERT INTO `auth_item` VALUES ('/ven-orden/delete', 3, NULL, NULL, NULL, 1574811874, 1574811874, NULL);
INSERT INTO `auth_item` VALUES ('/ven-orden/index', 3, NULL, NULL, NULL, 1574811874, 1574811874, NULL);
INSERT INTO `auth_item` VALUES ('/ven-orden/report', 3, NULL, NULL, NULL, 1574811874, 1574811874, NULL);
INSERT INTO `auth_item` VALUES ('/ven-orden/update', 3, NULL, NULL, NULL, 1574811874, 1574811874, NULL);
INSERT INTO `auth_item` VALUES ('/ven-orden/view', 3, NULL, NULL, NULL, 1574811874, 1574811874, NULL);
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
INSERT INTO `auth_item` VALUES ('auxilia', 2, 'auxiliar', NULL, NULL, 1574811859, 1574811859, 'otros');
INSERT INTO `auth_item` VALUES ('auxiliar', 1, 'auxiliar', NULL, NULL, 1574811942, 1574811942, NULL);
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
INSERT INTO `auth_item_child` VALUES ('auxilia', '/user-management/auth/change-own-password');
INSERT INTO `auth_item_child` VALUES ('changeOwnPassword', '/user-management/auth/change-own-password');
INSERT INTO `auth_item_child` VALUES ('operar', '/user-management/auth/change-own-password');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set-roles');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/index');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/view');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', '/user-management/user/change-password');
INSERT INTO `auth_item_child` VALUES ('tecnico', '/user-management/user/change-password');
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
INSERT INTO `auth_item_child` VALUES ('auxilia', '/ven-orden/create');
INSERT INTO `auth_item_child` VALUES ('tecnico', '/ven-orden/create');
INSERT INTO `auth_item_child` VALUES ('auxilia', '/ven-orden/index');
INSERT INTO `auth_item_child` VALUES ('tecnico', '/ven-orden/index');
INSERT INTO `auth_item_child` VALUES ('tecnico', '/ven-orden/report');
INSERT INTO `auth_item_child` VALUES ('tecnico', '/ven-orden/view');
INSERT INTO `auth_item_child` VALUES ('auxilia', '/ven-ventas/create');
INSERT INTO `auth_item_child` VALUES ('auxilia', '/ven-ventas/index');
INSERT INTO `auth_item_child` VALUES ('Admin', 'assignRolesToUsers');
INSERT INTO `auth_item_child` VALUES ('auxiliar', 'auxilia');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeOwnPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeUserPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'createUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'deleteUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'editUsers');
INSERT INTO `auth_item_child` VALUES ('operador', 'operar');
INSERT INTO `auth_item_child` VALUES ('otros', 'permisoOtros');
INSERT INTO `auth_item_child` VALUES ('jefe', 'prueba');
INSERT INTO `auth_item_child` VALUES ('Mecanico', 'tecnico');
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
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
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
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
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
  `confirmation_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `superadmin` smallint(1) NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `registration_ip` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bind_to_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email_confirmed` smallint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'superadmin', 'kz2px152FAWlkHbkZoCiXgBAd-S8SSjF', '$2y$13$MhlYe12xkGFnSeK0sO2up.Y9kAD9Ct6JS1i9VLP7YAqd1dFsSylz2', NULL, 1, 1, 1426062188, 1426062188, NULL, NULL, NULL, 0);
INSERT INTO `user` VALUES (4, 'otro', 'NEDNdq8Kt7291gYRuEAMtla4XCMF_tMe', '$2y$13$zeHS/vr1TLWqbGdEk09SNe2dePeXFnRoj0FQhvM.4GjlRvGFCWJNW', NULL, 1, 0, 1566596324, 1566596324, '127.0.0.1', '', '', 0);
INSERT INTO `user` VALUES (5, 'mari', 'aHZwmwypWrGKdoIR2fc9Z8L7csxnm1O3', '$2y$13$ZveHQOS6ZlYG6b0aw/urxeID/8viY0FYG5CVkZ5PCQWXs6Gu/x2Qa', NULL, 1, 0, 1571340187, 1574984831, '127.0.0.1', '', '', 0);
INSERT INTO `user` VALUES (9, 'operador', '89zFPnK7Pi7u151hjchckWoyYovt15YC', '$2y$13$wN3n5w2FjJ7IwZEKGMzxX.jEogONetTNLMg.WArjC84NsJWKq3E1y', NULL, 1, 0, 1572903173, 1572903173, '127.0.0.1', '', NULL, 0);
INSERT INTO `user` VALUES (10, 'mecanico', 'u0qYQ-RKMI6rixefcZKjA63gNB0S2m0k', '$2y$13$wQ7gsDY1lFAerPy8V35qrOrJNl9U0ImYsOQbD9xziyf06B6SDbbX.', NULL, 1, 0, 1572903296, 1574718690, '127.0.0.1', '', '', 0);
INSERT INTO `user` VALUES (12, 'polo', 'JVxwbgdfYfi4V-2ump0fspiWefu5buUi', '$2y$13$DRjsAZ/E1NeMmV1PLz729epXLEpeqPHi1suHn5AdFD3lU8fQ30u5i', NULL, 1, 1, 1574736154, 1575387102, '127.0.0.1', '', '', 0);
INSERT INTO `user` VALUES (13, 'FRANCISCO', 'nR5NnSCKc6uBNj07AZRR4vbVgcTIIKOq', '$2y$13$7f1kuvpXgXFfOkygNaJ6vudcObLxl0ynRQl9BrzR2kmw5ULPrVkRW', NULL, 1, 0, 1574810203, 1574984480, '189.201.129.225', '', '', 0);
INSERT INTO `user` VALUES (18, 'test', 'Wff_Gzsg17icgmg6ujZMpUHKeosRmFxC', '$2y$13$13rxtR/hick9NN2e4yWMCu7f0YBClr88lyEMQElZKX8oPbM80SQ3G', NULL, 1, 0, 1574998326, 1575321712, '187.187.193.191', '', '', 0);

-- ----------------------------
-- Table structure for user_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_log`;
CREATE TABLE `user_visit_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `language` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  `browser` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `os` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 289 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO `user_visit_log` VALUES (1, '5ddc0b3a03132', '2806:10a6:18:11fd:1af:2bed:30e7:fb01', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560 Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.109 Safari/537.36', 5, 1574701882, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (2, '5ddc161d33412', '2806:10a6:18:11fd:1af:2bed:30e7:fb01', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560 Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.109 Safari/537.36', 5, 1574704669, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (3, '5ddc16e712a62', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574704871, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (4, '5ddc22fa5ece4', '2806:10a6:18:11fd:1af:2bed:30e7:fb01', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560 Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.109 Safari/537.36', 5, 1574707962, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (5, '5ddc252e396f2', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574708526, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (6, '5ddc2a21b8eab', '2806:10a6:18:11fd:f80d:fa43:264b:bd2e', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574709793, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (7, '5ddc2effe2364', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574711039, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (8, '5ddc2f357b60e', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574711093, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (9, '5ddc3120bc5ba', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574711584, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (10, '5ddc3151c00d9', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574711633, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (11, '5ddc36f0cacbb', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574713072, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (12, '5ddc37bcab550', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574713276, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (13, '5ddc37e275ee9', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574713314, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (14, '5ddc3da99373f', '2806:10a6:18:11fd:1af:2bed:30e7:fb01', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560 Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.109 Safari/537.36', 5, 1574714793, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (15, '5ddc40dab512b', '201.175.175.187', 'es', 'Mozilla/5.0 (Linux; Android 9; EML-L09) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1574715610, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (16, '5ddc423673d10', '2806:10a6:18:11fd:f80d:fa43:264b:bd2e', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574715958, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (17, '5ddc4548c0476', '2806:10a6:18:11fd:8152:c178:f775:581a', 'es', 'Mozilla/5.0 (Linux; Android 6.0; MYA-L13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1574716744, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (18, '5ddc47efa75e3', '2806:10a6:18:11fd:7019:88e6:2a65:b2ab', 'es', 'Mozilla/5.0 (Linux; Android 8.1.0; SM-G610M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.96 Mobile Safari/537.36', 5, 1574717423, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (19, '5ddc499322587', '2806:10a6:18:11fd:8152:c178:f775:581a', 'es', 'Mozilla/5.0 (Linux; Android 6.0; MYA-L13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1574717843, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (20, '5ddc4c5c522e9', '2806:10a6:18:11fd:1af:2bed:30e7:fb01', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560 Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.109 Safari/537.36', 5, 1574718556, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (21, '5ddc4c8b92e43', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574718603, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (22, '5ddc4d10eb3f7', '2806:10a6:18:11fd:1af:2bed:30e7:fb01', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560 Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.109 Safari/537.36', 10, 1574718736, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (23, '5ddc4ee475134', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574719204, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (24, '5ddc5076bad95', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574719606, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (25, '5ddc50cd9de3b', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574719693, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (26, '5ddc52140eac0', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574720020, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (27, '5ddc53e07e4dd', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574720480, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (28, '5ddc55be18c35', '2806:10a6:18:11fd:1af:2bed:30e7:fb01', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560 Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.109 Safari/537.36', 5, 1574720958, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (29, '5ddc58ea8177b', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574721770, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (30, '5ddc5b8c6651a', '2806:10a6:18:11fd:f80d:fa43:264b:bd2e', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574722444, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (31, '5ddc5c3e8e51e', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574722622, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (32, '5ddc5c4a6e962', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574722634, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (33, '5ddc5dc70b38d', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 9; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 1, 1574723015, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (34, '5ddc65af970cc', '2806:10a6:18:11fd:94ea:142c:6009:15cf', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574725039, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (35, '5ddc74f525340', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574728949, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (36, '5ddc753675556', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574729014, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (37, '5ddc8c5b0632d', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574734939, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (38, '5ddc8ce2d75dc', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574735074, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (39, '5ddc8cf31d43c', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574735091, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (40, '5ddc8e0ad2598', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574735370, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (41, '5ddcb88594cbf', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574746245, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (42, '5ddcdb86edf89', '187.187.193.191', 'es', 'Mozilla/5.0 (Linux; Android 7.1.2; Moto G Build/NJH47F) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/65.0.3325.144 Mobile Safari/537.36', 1, 1574755206, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (43, '5ddcdc64423a2', '187.187.193.191', 'es', 'Mozilla/5.0 (Linux; Android 7.1.2; Moto G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Mobile Safari/537.36', 1, 1574755428, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (44, '5ddcddff04bbc', '187.187.193.191', 'es', 'Mozilla/5.0 (Android 7.1.2; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0', 1, 1574755839, 'Firefox', 'Android');
INSERT INTO `user_visit_log` VALUES (45, '5ddd31b62b8bd', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 9; EML-L09) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1574777270, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (46, '5ddd3268295b3', '189.201.129.225', 'es', 'Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0', 5, 1574777448, 'Firefox', 'Android');
INSERT INTO `user_visit_log` VALUES (47, '5ddd32c58f1a4', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 9; EML-L09) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1574777541, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (48, '5ddd332da49bc', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 7.1.2; Moto G Build/NJH47F) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/65.0.3325.144 Mobile Safari/537.36', 5, 1574777645, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (49, '5ddd33c209d06', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574777794, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (50, '5ddd34c2ee1b2', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 5.1.1; D5316 Build/19.4.A.0.182; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/76.0.3809.132 Mobile Safari/537.36', 1, 1574778050, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (51, '5ddd357cf09d0', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 9; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 1, 1574778236, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (52, '5ddd3754c8028', '2806:10a6:18:11fd:c4af:daad:2501:8920', 'es', 'Mozilla/5.0 (Linux; Android 9; SM-T380) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Safari/537.36', 5, 1574778708, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (53, '5ddd390e61964', '2806:10a6:18:11fd:bdb5:9fff:dc84:1874', 'es', 'Mozilla/5.0 (Linux; Android 8.1.0; SM-G610M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.96 Mobile Safari/537.36', 5, 1574779150, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (54, '5ddd5b728549e', '2806:10a6:18:11fd:d0aa:cef5:72e6:9d9e', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574787954, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (55, '5ddd5c1a28525', '2806:10a6:18:11fd:5c17:9a76:c044:530c', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574788122, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (56, '5ddd5fc21bf28', '2806:10a6:18:11fd:d0aa:cef5:72e6:9d9e', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574789058, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (57, '5ddd66be5f761', '2806:10a6:18:11fd:d0aa:cef5:72e6:9d9e', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574790846, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (58, '5ddd7c073a046', '2806:10a6:18:11fd:d0aa:cef5:72e6:9d9e', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574796295, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (59, '5ddd835b84f95', '2806:10a6:18:11fd:d0aa:cef5:72e6:9d9e', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574798171, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (60, '5ddd83ce96ea9', '2806:10a6:18:11fd:5c17:9a76:c044:530c', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574798286, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (61, '5ddd88b9eca11', '2806:10a6:18:11fd:e524:1584:c6ba:3c80', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574799545, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (62, '5dddaa35b7f50', '2806:10a6:18:11fd:d0aa:cef5:72e6:9d9e', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574808117, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (63, '5dddb1e2d51cf', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574810082, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (64, '5dddb6d4b5419', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574811348, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (65, '5dddb710933b5', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574811408, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (66, '5dddb94c37c11', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1574811980, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (67, '5dddb95d005b7', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574811997, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (68, '5dddbdd8ddc74', '2806:10a6:18:11fd:d0aa:cef5:72e6:9d9e', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574813144, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (69, '5ddde60ccaa43', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574823436, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (70, '5ddde63d28c09', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1574823485, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (71, '5dddfc4952492', '189.128.0.218', 'es', 'Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0', 5, 1574829129, 'Firefox', 'Android');
INSERT INTO `user_visit_log` VALUES (72, '5dde7d093626a', '2806:10a6:18:11fd:7080:9c35:584a:4426', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574862089, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (73, '5dde81aad5359', '2806:10a6:18:11fd:613f:7ac8:5789:afb4', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574863274, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (74, '5dde83cf38dde', '2806:10a6:18:11fd:613f:7ac8:5789:afb4', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574863823, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (75, '5dde898f8d995', '2806:10a6:18:11fd:7080:9c35:584a:4426', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574865295, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (76, '5dde96de97a05', '2806:10a6:18:11fd:b9d7:d3a2:ee2e:d67e', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574868702, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (77, '5dde99056b330', '2806:10a6:18:11fd:613f:7ac8:5789:afb4', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574869253, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (78, '5dde99736170f', '2806:10a6:18:11fd:613f:7ac8:5789:afb4', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574869363, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (79, '5ddea6ca51753', '2806:10a6:18:11fd:b9d7:d3a2:ee2e:d67e', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574872778, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (80, '5ddea6e4bce89', '2806:10a6:18:11fd:b9d7:d3a2:ee2e:d67e', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574872804, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (81, '5ddeb686e8203', '2806:10a6:18:11fd:b9d7:d3a2:ee2e:d67e', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574876806, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (82, '5ddeb7ce06ccc', '2806:10a6:18:11fd:7880:f9e1:5d9:8ea4', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574877134, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (83, '5ddebdb723a70', '2806:10a6:18:11fd:b9d7:d3a2:ee2e:d67e', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574878647, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (84, '5ddec0588808f', '2806:10a6:18:11fd:7880:f9e1:5d9:8ea4', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574879320, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (85, '5ddec8fa06c83', '2806:10a6:18:11fd:b9d7:d3a2:ee2e:d67e', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574881530, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (86, '5ddecb3c2c2ba', '2806:10a6:18:11fd:7880:f9e1:5d9:8ea4', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574882108, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (87, '5ddee148d884f', '2806:10a6:18:11fd:3d31:1f8e:e49d:931c', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574887752, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (88, '5ddeedc9352c7', '2806:10a6:18:11fd:7880:f9e1:5d9:8ea4', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574890953, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (89, '5ddeeea0eceac', '201.175.172.55', 'es', 'Mozilla/5.0 (Linux; Android 9; EML-L09) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 1, 1574891168, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (90, '5ddeeea234512', '2806:10a6:18:11fd:7880:f9e1:5d9:8ea4', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1574891170, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (91, '5ddeefd354ec7', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574891475, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (92, '5ddef1f0e5e9d', '2806:10a6:18:11fd:7880:f9e1:5d9:8ea4', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574892016, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (93, '5ddef202e7533', '2806:10a6:18:11fd:7880:f9e1:5d9:8ea4', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574892034, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (94, '5ddef3b22fc4d', '2806:10a6:18:11fd:b9d7:d3a2:ee2e:d67e', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574892466, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (95, '5ddf08dbcc841', '201.175.173.173', 'es', 'Mozilla/5.0 (Linux; Android 9; EML-L09) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1574897883, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (96, '5ddf0d6dec2d2', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574899053, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (97, '5ddf0ddd8f90b', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574899165, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (98, '5ddf0df6587c5', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574899190, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (99, '5ddf0e3d0cf47', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1574899261, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (100, '5ddf0f3861106', '200.68.137.178', 'es', 'Mozilla/5.0 (Linux; Android 9; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 1, 1574899512, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (101, '5ddf13999df8e', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574900633, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (102, '5ddf35162590f', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574909206, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (103, '5ddf42504dbe4', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574912592, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (104, '5ddf432581478', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1574912805, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (105, '5ddf43380101e', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574912824, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (106, '5ddf4353caf51', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574912851, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (107, '5ddf46ef7c26f', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574913775, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (108, '5ddf472ce6e73', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574913836, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (109, '5ddf473b0e7e5', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1574913851, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (110, '5ddf47d658c5d', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574914006, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (111, '5ddf4879bffcb', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1574914169, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (112, '5ddf489d9bac9', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574914205, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (113, '5ddf48c257110', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574914242, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (114, '5ddf48cd80aa3', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 9, 1574914253, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (115, '5ddf4d7a3d688', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574915450, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (116, '5ddf4e3d45756', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574915645, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (117, '5ddf4e71cfacd', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574915697, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (118, '5ddf512ee3107', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574916398, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (119, '5ddf5153669e2', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574916435, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (120, '5ddf516976c2b', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574916457, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (121, '5ddf517754777', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574916471, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (122, '5ddf518643064', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574916486, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (123, '5ddf51b75612e', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574916535, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (124, '5ddf51cd7d0d5', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574916557, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (125, '5ddf520475f71', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574916612, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (126, '5ddf522da66da', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574916653, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (127, '5ddf523ba1f8e', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574916667, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (128, '5ddf55038791e', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574917379, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (129, '5ddf5576a318e', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574917494, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (130, '5ddf558b4cbff', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574917515, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (131, '5ddf55a9e0bed', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1574917545, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (132, '5ddf55b996fb4', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574917561, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (133, '5ddf55d19f59b', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', NULL, 1574917585, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (134, '5ddf55e611a31', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', NULL, 1574917606, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (135, '5ddf55f2deddf', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574917618, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (136, '5ddf561f33efe', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1574917663, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (137, '5ddf5674d1cc5', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574917748, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (138, '5ddf5696457a3', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574917782, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (139, '5ddf5785a5a1c', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1574918021, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (140, '5ddf58a0dc3e0', '187.187.193.191', 'es', 'Mozilla/5.0 (Linux; Android 7.1.2; Moto G Build/NJH47F) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/65.0.3325.144 Mobile Safari/537.36', 5, 1574918304, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (141, '5ddf58cf74a98', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574918351, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (142, '5ddf5bf421a1d', '187.187.193.191', 'es', 'Mozilla/5.0 (Linux; Android 7.1.2; Moto G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Mobile Safari/537.36', 5, 1574919156, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (143, '5ddf5db9b8819', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574919609, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (144, '5ddfc6f013272', '2806:10a6:18:11fd:38d2:e4c0:2e1f:4faa', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574946544, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (145, '5ddfcba289fb8', '2806:10a6:18:11fd:a47a:7dac:165f:1c16', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574947746, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (146, '5ddff55ca184c', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574958428, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (147, '5ddff59160ad3', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574958481, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (148, '5ddff5c9dd8f2', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574958537, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (149, '5de006f42da37', '2806:10a6:18:11fd:38d2:e4c0:2e1f:4faa', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574962932, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (150, '5de01f6d84028', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574969197, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (151, '5de02a5021d45', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 5.1.1; D5316 Build/19.4.A.0.182; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/76.0.3809.132 Mobile Safari/537.36', 1, 1574971984, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (152, '5de02ab8ca219', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 9; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 1, 1574972088, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (153, '5de036e093e2c', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574975200, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (154, '5de045b46e3fe', '2806:10a6:18:11fd:38d2:e4c0:2e1f:4faa', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574978996, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (155, '5de04c0a4d01f', '2806:10a6:18:11fd:b5d9:a177:6246:8715', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574980618, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (156, '5de054aa0ea32', '2806:10a6:18:11fd:e870:f8b8:4b59:f94b', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574982826, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (157, '5de05d46b161f', '2806:10a6:18:11fd:b5d9:a177:6246:8715', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574985030, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (158, '5de05d6e07147', '2806:10a6:18:11fd:38d2:e4c0:2e1f:4faa', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1574985070, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (159, '5de05e9749008', '2806:10a6:18:11fd:b5d9:a177:6246:8715', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574985367, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (160, '5de061f777c10', '2806:10a6:18:11fd:ac2d:84dc:82e2:f34e', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574986231, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (161, '5de064ba7d634', '2806:10a6:18:11fd:38d2:e4c0:2e1f:4faa', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1574986938, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (162, '5de064f711a09', '2806:10a6:18:11fd:38d2:e4c0:2e1f:4faa', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574986999, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (163, '5de0673a11dee', '2806:10a6:18:11fd:38d2:e4c0:2e1f:4faa', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574987578, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (164, '5de0673c7b72a', '2806:10a6:18:11fd:b5d9:a177:6246:8715', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574987580, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (165, '5de0683a67c24', '2806:10a6:18:11fd:ac2d:84dc:82e2:f34e', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1574987834, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (166, '5de07f5437e10', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574993748, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (167, '5de090ff94fca', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574998271, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (168, '5de091401403c', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 18, 1574998336, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (169, '5de091bfe68a5', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574998463, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (170, '5de09206dc799', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 18, 1574998534, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (171, '5de09283efcda', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1574998659, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (172, '5de12d68b72e3', '187.135.135.219', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575038312, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (173, '5de12f44ecd1e', '2806:10a6:18:11fd:f481:f708:1570:810d', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575038788, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (174, '5de13e4e94d80', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575042638, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (175, '5de156660770b', '2806:10a6:18:11fd:f481:f708:1570:810d', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575048806, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (176, '5de1568f65c0e', '2806:10a6:18:11fd:f481:f708:1570:810d', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575048847, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (177, '5de15d2a008bc', '2806:10a6:18:11fd:f481:f708:1570:810d', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575050538, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (178, '5de1696383a4e', '2806:10a6:18:11fd:f481:f708:1570:810d', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575053667, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (179, '5de1914b4fcf9', '2806:10a6:18:11fd:511e:11fc:8b54:4049', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575063883, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (180, '5de19a9aad807', '2806:10a6:18:11fd:f481:f708:1570:810d', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575066266, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (181, '5de1b85b0fe42', '2806:10a6:18:11fd:99ea:4d6e:acab:3c13', 'es', 'Mozilla/5.0 (Linux; Android 6.0; MYA-L13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1575073883, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (182, '5de1c2c434761', '2806:10a6:18:11fd:99ea:4d6e:acab:3c13', 'es', 'Mozilla/5.0 (Linux; Android 6.0; MYA-L13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1575076548, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (183, '5de1c37492dc0', '2806:10a6:18:11fd:f481:f708:1570:810d', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575076724, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (184, '5de1c3a423105', '2806:10a6:18:11fd:f481:f708:1570:810d', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575076772, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (185, '5de1c3b1d7224', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 7.1.2; Moto G Build/NJH47F) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/65.0.3325.144 Mobile Safari/537.36', 1, 1575076785, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (186, '5de1c4b82abc3', '200.68.136.215', 'es', 'Mozilla/5.0 (Linux; Android 6.0; MYA-L13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1575077048, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (187, '5de1d7f87e3af', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575081976, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (188, '5de1e1e8c6062', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575084520, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (189, '5de1fc5130914', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575091281, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (190, '5de28253da9ba', '2806:10a6:18:11fd:ac2d:84dc:82e2:f34e', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575125587, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (191, '5de28424b263e', '2806:10a6:18:11fd:94a6:8808:e57c:16e9', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575126052, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (192, '5de299d502076', '2806:10a6:18:11fd:4cec:2700:2799:db28', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575131605, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (193, '5de2a6ccc2e29', '2806:10a6:18:11fd:79ec:b95a:bc3:3c69', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575134924, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (194, '5de2a6f30422b', '2806:10a6:18:11fd:94a6:8808:e57c:16e9', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575134963, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (195, '5de2b09ddd049', '2806:10a6:18:11fd:94a6:8808:e57c:16e9', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575137437, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (196, '5de2b7468ee5c', '2806:10a6:18:11fd:94a6:8808:e57c:16e9', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575139142, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (197, '5de2b7a8b88cf', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575139240, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (198, '5de2c2515439e', '2806:10a6:18:11fd:94a6:8808:e57c:16e9', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575141969, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (199, '5de2d97849d99', '2806:10a6:18:11fd:94a6:8808:e57c:16e9', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575147896, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (200, '5de2daae4f7d1', '2806:10a6:18:11fd:94a6:8808:e57c:16e9', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575148206, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (201, '5de2de25f05f1', '2806:10a6:18:11fd:4cec:2700:2799:db28', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575149093, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (202, '5de48a3e722e8', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575258686, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (203, '5de48ae27183d', '187.187.193.191', 'es', 'Mozilla/5.0 (Linux; Android 6.0; BLADE A602) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 1, 1575258850, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (204, '5de48d73e86c6', '187.187.193.191', 'es', 'Mozilla/5.0 (Linux; Android 7.1.2; Moto G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Mobile Safari/537.36', 1, 1575259507, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (205, '5de48f4aad235', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575259978, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (206, '5de48fdf5a9d4', '187.187.193.191', 'es', 'Mozilla/5.0 (Linux; Android 6.0; BLADE A602) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 1, 1575260127, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (207, '5de492543f5ec', '187.187.193.191', 'es', 'Mozilla/5.0 (Android 7.1.2; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0', 1, 1575260756, 'Firefox', 'Android');
INSERT INTO `user_visit_log` VALUES (208, '5de493346f714', '187.187.193.191', 'es', 'Mozilla/5.0 (Linux; Android 7.1.2; Moto G Build/NJH47F) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/65.0.3325.144 Mobile Safari/537.36', 1, 1575260980, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (209, '5de5124b8baad', '2806:10a6:18:11fd:1c62:2b82:5f1:4d3b', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575293515, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (210, '5de524b77f184', '2806:10a6:18:11fd:1c62:2b82:5f1:4d3b', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575298231, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (211, '5de525d55309c', '2806:10a6:18:11fd:610e:3de9:469c:de28', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575298517, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (212, '5de531ffbe489', '2806:10a6:18:11fd:7052:38e1:8b01:f8df', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 12, 1575301631, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (213, '5de54020a5d26', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 5.1.1; D5316 Build/19.4.A.0.182) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/42.0.2311.133 Mobile Safari/537.36', 1, 1575305248, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (214, '5de540987ad37', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 9; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 1, 1575305368, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (215, '5de553b5f3590', '2806:10a6:18:11fd:610e:3de9:469c:de28', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575310261, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (216, '5de553f7b9bc8', '2806:10a6:18:11fd:1c62:2b82:5f1:4d3b', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575310327, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (217, '5de5803a61f68', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575321658, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (218, '5de5805ebd154', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 18, 1575321694, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (219, '5de58087636ec', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575321735, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (220, '5de5877197767', '2806:10a6:18:11fd:610e:3de9:469c:de28', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575323505, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (221, '5de5dc6d597d6', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575345261, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (222, '5de6778e4f973', '2806:10a6:18:11fd:a839:b3aa:aaa2:acae', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575384974, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (223, '5de67a87e0c4d', '2806:10a6:18:2ae:597a:4d0:1203:a4e5', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575385735, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (224, '5de67e56764be', '2806:10a6:18:11fd:a839:b3aa:aaa2:acae', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575386710, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (225, '5de67ebc4d784', '187.187.193.68', 'es', 'Mozilla/5.0 (Linux; Android 6.0; MYA-L13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1575386812, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (226, '5de67fa298cfb', '189.201.129.225', 'es', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 12, 1575387042, 'Chrome', 'Linux');
INSERT INTO `user_visit_log` VALUES (227, '5de67fecc2292', '189.201.129.225', 'es', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 12, 1575387116, 'Chrome', 'Linux');
INSERT INTO `user_visit_log` VALUES (228, '5de685c566384', '2806:10a6:18:11fd:1dfd:51c8:d5be:7823', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 12, 1575388613, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (229, '5de68608811e0', '2806:10a6:18:11fd:508f:8034:87bc:20a8', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 12, 1575388680, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (230, '5de6ab0926f6a', '2806:10a6:18:11fd:a839:b3aa:aaa2:acae', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575398153, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (231, '5de6baa42d7d7', '2806:10a6:18:11fd:a839:b3aa:aaa2:acae', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575402148, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (232, '5de6bebd63903', '187.187.193.68', 'es', 'Mozilla/5.0 (Linux; Android 6.0; MYA-L13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1575403197, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (233, '5de6d8d3b997e', '187.135.135.219', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 12, 1575409875, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (234, '5de6f2d923287', '189.201.129.225', 'es', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', 1, 1575416537, 'iPad', 'iPad');
INSERT INTO `user_visit_log` VALUES (235, '5de6f449e7433', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 7.1.2; Moto G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Mobile Safari/537.36', 1, 1575416905, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (236, '5de6f581edf35', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575417217, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (237, '5de6fb60396d5', '189.201.129.225', 'es', 'Mozilla/5.0 (Linux; Android 7.1.2; Moto G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Mobile Safari/537.36', 1, 1575418720, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (238, '5de75f80496bb', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575444352, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (239, '5de7b4789d300', '2806:10a6:18:11fd:31c7:8338:b203:3816', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575466104, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (240, '5de7b52911dd1', '2806:10a6:18:11fd:300a:2dfd:38b0:c939', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575466281, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (241, '5de7c767939f8', '2806:10a6:18:2ae:a9b1:e13f:e1e6:6237', 'es', 'Mozilla/5.0 (Linux; Android 6.0; MYA-L13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1575470951, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (242, '5de7cbc09d6e4', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575472064, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (243, '5de7cc50592f2', '187.187.193.191', 'es', 'Mozilla/5.0 (Linux; Android 7.1.2; Moto G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Mobile Safari/537.36', 1, 1575472208, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (244, '5de842c465db1', '2806:10a6:18:11fd:300a:2dfd:38b0:c939', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575502532, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (245, '5de8696ad9b57', '200.68.137.151', 'es', 'Mozilla/5.0 (Linux; Android 6.0; MYA-L13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1575512426, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (246, '5de88eb3a641f', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575521971, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (247, '5de901dab1c7f', '2806:10a6:18:11fd:300a:2dfd:38b0:c939', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575551450, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (248, '5de902ca80bf0', '2806:10a6:18:11fd:e026:b602:95a2:72aa', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575551690, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (249, '5de91f8423877', '2806:10a6:18:11fd:508f:8034:87bc:20a8', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575559044, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (250, '5de93a87130d8', '2806:10a6:18:11fd:508f:8034:87bc:20a8', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575565959, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (251, '5de93ddf88ac8', '2806:10a6:18:11fd:300a:2dfd:38b0:c939', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575566815, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (252, '5de949010b47b', '2806:10a6:18:11fd:508f:8034:87bc:20a8', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 12, 1575569665, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (253, '5de95207e9400', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575571975, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (254, '5de9534929432', '2806:10a6:18:11fd:300a:2dfd:38b0:c939', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575572297, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (255, '5de963a017715', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575576480, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (256, '5de990508f768', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 18, 1575587920, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (257, '5de990661eb20', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575587942, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (258, '5de9cc66c26ee', '2806:10a6:b:9b26:e82f:e40d:528d:fad7', 'es', 'Mozilla/5.0 (Linux; Android 9; EML-L09) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 1, 1575603302, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (259, '5dea56cd00e2d', '2806:10a6:18:360:e110:39b5:6f:bf11', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575638733, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (260, '5dea571b13ab6', '2806:10a6:18:360:e1bb:b395:745c:4c7b', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 12, 1575638811, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (261, '5deaa2f0622ae', '2806:10a6:18:360:e1bb:b395:745c:4c7b', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575658224, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (262, '5deaa48b45c27', '2806:10a6:18:360:e110:39b5:6f:bf11', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575658635, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (263, '5deaab6de49a7', '2806:10a6:18:360:e1bb:b395:745c:4c7b', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575660397, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (264, '5deaaeb9e3ec4', '2806:10a6:18:360:e913:9399:e7be:1ae7', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 12, 1575661241, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (265, '5deabee4d6e5a', '2806:10a6:18:360:e1bb:b395:745c:4c7b', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575665380, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (266, '5deac12eee28f', '2806:10a6:18:360:e1bb:b395:745c:4c7b', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575665966, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (267, '5debae4054e40', '2806:10a6:18:360:e087:2f:cdfa:c227', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575726656, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (268, '5debb7fdb432b', '2806:10a6:18:360:e087:2f:cdfa:c227', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575729149, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (269, '5debbaf3f0e65', '187.135.193.242', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575729907, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (270, '5debf87189b1f', '2806:10a6:18:360:e913:9399:e7be:1ae7', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575745649, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (271, '5debf9c164d99', '187.135.193.242', 'es', 'Mozilla/5.0 (iPad; CPU OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329 Safari/8536.25', 1, 1575745985, 'iPad', 'iPad');
INSERT INTO `user_visit_log` VALUES (272, '5dec070889b9f', '2806:10a6:18:360:e913:9399:e7be:1ae7', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575749384, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (273, '5dec0d6326a41', '200.68.137.220', 'es', 'Mozilla/5.0 (Linux; Android 6.0; MYA-L13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1575751011, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (274, '5dec2eacafa8b', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575759532, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (275, '5dec652e57fd1', '2806:10a6:b:9b26:5d2b:5b98:26f3:3d4', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575773486, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (276, '5ded3b552c2e7', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575828309, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (277, '5ded62612d7f7', '187.187.193.191', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575838305, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (278, '5dee489b382a3', '2806:10a6:18:1fa:d0c3:a32c:bd9d:8a60', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575897243, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (279, '5dee629ed0428', '2806:10a6:18:1fa:64e2:42a:d5dd:c2b1', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575903902, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (280, '5dee6d075adf3', '2806:10a6:18:1fa:64e2:42a:d5dd:c2b1', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575906567, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (281, '5dee71684e37a', '2806:10a6:18:1fa:287b:941b:bdc9:d293', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575907688, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (282, '5dee757c7617c', '187.135.199.143', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575908732, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (283, '5dee7598ae737', '2806:10a6:18:1fa:287b:941b:bdc9:d293', 'es', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-T560) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 13, 1575908760, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (284, '5deea454cab02', '2806:10a6:18:1fa:7cbd:ce64:dc79:60fc', 'es', 'Mozilla/5.0 (Linux; Android 8.1.0; SM-G610M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 5, 1575920724, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (285, '5deea495efc78', '2806:10a6:18:1fa:64e2:42a:d5dd:c2b1', 'es', 'Mozilla/5.0 (Linux; Android 7.0; SM-T713) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 12, 1575920789, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (286, '5deead70f1061', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575923056, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (287, '5deebb4c59b4f', '2806:10a6:18:1fa:d0c3:a32c:bd9d:8a60', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 5, 1575926604, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (288, '5deec750b1c2f', '189.201.129.225', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1, 1575929680, 'Chrome', 'Windows');

-- ----------------------------
-- Table structure for ven_almacen
-- ----------------------------
DROP TABLE IF EXISTS `ven_almacen`;
CREATE TABLE `ven_almacen`  (
  `alm_id` int(11) NOT NULL AUTO_INCREMENT,
  `alm_folio` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alm_fecha` date NOT NULL,
  `alm_noPedido` int(255) NULL DEFAULT NULL,
  `alm_vehiculo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alm_modelo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alm_mecanico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alm_placa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alm_color` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alm_trabajo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alm_garantia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`alm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ven_almacen
-- ----------------------------
INSERT INTO `ven_almacen` VALUES (1, 'VALE-1', '2019-11-27', NULL, 'Fiesta', '2003', 'Moises', 'DHE 77 57', 'Azul', 'X', '');
INSERT INTO `ven_almacen` VALUES (2, 'VALE-2', '2019-11-28', 21749, 'SENTRA', '2013', 'ESTEBAN', 'MYD-93-56', 'NEGRO', 'JF015E', '');
INSERT INTO `ven_almacen` VALUES (3, 'VALE-3', '2019-11-28', 6, 'EDGE', '2009', 'ESTEBAN', 'NTK-28-20', 'NEGRO', '6F50', '');
INSERT INTO `ven_almacen` VALUES (4, 'VALE-4', '2019-11-28', 24, 'FOCUS', '2001', 'ESTEBAN', 'WTY-88-65', 'BLANCO', '4F27E', '');
INSERT INTO `ven_almacen` VALUES (5, 'VALE-5', '2019-11-28', 14, 'DAKOTA', '2006', 'JOVINO', 'VM-74-973', 'ROJO', '42RLE', '');
INSERT INTO `ven_almacen` VALUES (6, 'VALE-6', '2019-11-28', 4, 'Malibu', '2000', 'Jesus', 'WUB-91-42', 'Azul', '4T40', '');
INSERT INTO `ven_almacen` VALUES (7, 'VALE-7', '2019-11-28', 23, 'Torrent', '2007', 'Esteban', 'Suelta', 'Suelta', 'AW55-50', '');
INSERT INTO `ven_almacen` VALUES (8, 'VALE-8', '2019-11-29', 20, 'MAZDA 6', '2009', 'MOISES/MANUEL', 'VMA-129-A', 'AZUL', 'X', '');
INSERT INTO `ven_almacen` VALUES (9, 'VALE-9', '2019-11-29', 21, 'EUROVAN', '2008', 'MOISÉS ', 'VM-44-581', 'BLANCO', 'X', '');
INSERT INTO `ven_almacen` VALUES (10, 'VALE-10', '2019-11-30', 25, 'TORRENT', '2006', 'JOVINO', 'WTK-20-15', 'BLANCO', 'AW5550', '');
INSERT INTO `ven_almacen` VALUES (11, 'VALE-11', '2019-11-30', 28, 'VERSA', '2015', 'VICTOR', 'WTX-57-58', 'ROJO', 'X', '');
INSERT INTO `ven_almacen` VALUES (12, 'VALE-12', '2019-11-30', 29, 'NEON', '2001', 'JOVINO', 'WUB-81-96', 'ROJO', '413', '');
INSERT INTO `ven_almacen` VALUES (13, 'VALE-13', '2019-11-30', 27, 'Dakota', '2009', 'Jesus', 'Suelta', 'Suelta', '42RLE', '');
INSERT INTO `ven_almacen` VALUES (14, 'VALE-14', '2019-12-02', 32, 'CRUZE', '2013', 'ESTEBAN/JORGE', 'WSW-11-73', 'BLANCO', 'X', '');
INSERT INTO `ven_almacen` VALUES (15, 'VALE-15', '2019-12-03', NULL, 'Ranger', '2002', 'MOYSES', 'VR-45-683', 'Blanco', 'Si', '');
INSERT INTO `ven_almacen` VALUES (16, 'VALE-16', '2019-12-03', 33, 'Sentra', '2013', 'Jovino', 'WSH-86-71', 'Gris oscuro', 'CVT', '');
INSERT INTO `ven_almacen` VALUES (17, 'VALE-17', '2019-12-04', 41, 'SONIC', '2014', 'JORGE', 'WTT-31-47', 'GRIS', 'X', '');
INSERT INTO `ven_almacen` VALUES (18, 'VALE-18', '2019-12-04', 40, 'FIESTA', '2006', 'MOISES', 'ĎA7-ANY', 'GRIS', 'X', '');
INSERT INTO `ven_almacen` VALUES (19, 'VALE-19', '2019-12-04', 10, 'SAVEIRO', '2014', 'MOISES', 'SUELTA', 'SUELTA ', 'X', '');
INSERT INTO `ven_almacen` VALUES (20, 'VALE-20', '2019-12-04', 44, 'AVEO', '2014', 'MOISES', 'WSB-81-84', 'NEGRO', 'X', '');
INSERT INTO `ven_almacen` VALUES (21, 'VALE-21', '2019-12-04', 31, 'Exploeer ', '2002', 'Jesus', 'WTG-80-84', 'Roja', '5R55', '');
INSERT INTO `ven_almacen` VALUES (22, 'VALE-22', '2019-12-05', 52, 'JOURNEY', '2009', 'VICTOR', 'DSU-68-16', 'ROJO', 'X', '');
INSERT INTO `ven_almacen` VALUES (23, 'VALE-23', '2019-12-05', 48, 'SUBURBAN', '2009', 'MOISES', 'WTG-95-76', 'BLANCO', 'X', '');
INSERT INTO `ven_almacen` VALUES (24, 'VALE-24', '2019-12-05', 53, 'CHEYENNE', '2009', 'JORGE', 'VM-74-939', 'BLANCO', 'X', '');
INSERT INTO `ven_almacen` VALUES (25, 'VALE-25', '2019-12-05', 54, 'F150', '2010', 'JORGE', 'VR-51-633', 'BLANCO', 'X', '');
INSERT INTO `ven_almacen` VALUES (26, 'VALE-26', '2019-12-06', NULL, 'Sentra', '2004', 'Moyses', 'Suelta', 'Suelta', 'Si', '');
INSERT INTO `ven_almacen` VALUES (27, 'VALE-27', '2019-12-07', 51, 'JETTA', '2007', 'JOVINO', 'VMH-332-A', 'BLANCO', '09G', '');
INSERT INTO `ven_almacen` VALUES (28, 'VALE-28', '2019-12-07', 60, 'SENTRA', '2013', 'MOISES', 'TXX-27-75', 'BLANCO', 'X', '');
INSERT INTO `ven_almacen` VALUES (29, 'VALE-29', '2019-12-07', 61, 'TOWN COUNTRY', '01998', 'JORGE', 'XKH-74-18', 'ROJO', 'X', '');
INSERT INTO `ven_almacen` VALUES (30, 'VALE-30', '2019-12-09', 56, 'TIIDA', '2007', 'ESTEBAN', 'DHX-51-44', 'GRIS', 'RL4F03A', '');
INSERT INTO `ven_almacen` VALUES (31, 'VALE-31', '2019-12-09', 71, 'DAKOTA', '2006', 'JORGE', 'VM-53-472', 'BLANCO', 'X', '');
INSERT INTO `ven_almacen` VALUES (32, 'VALE-32', '2019-12-09', 66, 'Altima', '2003', 'Jovino', '652-PS', 'Gris', 'X', '');
INSERT INTO `ven_almacen` VALUES (33, 'VALE-33', '2019-12-09', 72, 'COLORADO', '2007', 'JORGE', 'VS-34-912', 'BLANCO', 'X', '');

-- ----------------------------
-- Table structure for ven_concepto
-- ----------------------------
DROP TABLE IF EXISTS `ven_concepto`;
CREATE TABLE `ven_concepto`  (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_cantidad` double(10, 2) NOT NULL,
  `con_descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `con_precioUnitario` double(10, 2) NOT NULL,
  `con_fkalm_id` int(11) NOT NULL,
  PRIMARY KEY (`con_id`) USING BTREE,
  INDEX `con_fkalm_id`(`con_fkalm_id`) USING BTREE,
  CONSTRAINT `con_fk1` FOREIGN KEY (`con_fkalm_id`) REFERENCES `ven_almacen` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ven_concepto
-- ----------------------------
INSERT INTO `ven_concepto` VALUES (1, 1.00, 'ACEITE ', 1.00, 1);
INSERT INTO `ven_concepto` VALUES (2, 1.00, 'REPUESTO DE  BOMBA', 1.00, 1);
INSERT INTO `ven_concepto` VALUES (3, 1.00, 'CADENA', 1.00, 2);
INSERT INTO `ven_concepto` VALUES (4, 1.00, 'VALVULA DE BOMBA', 1.00, 2);
INSERT INTO `ven_concepto` VALUES (5, 1.00, 'TROMPO', 1.00, 2);
INSERT INTO `ven_concepto` VALUES (6, 10.00, 'ACEITE CVT', 1.00, 2);
INSERT INTO `ven_concepto` VALUES (7, 1.00, 'TURBINA', 1.00, 2);
INSERT INTO `ven_concepto` VALUES (8, 1.00, 'SILICON', 1.00, 2);
INSERT INTO `ven_concepto` VALUES (9, 1.00, 'FILTRO DE CARTUCHO S/M', 1.00, 2);
INSERT INTO `ven_concepto` VALUES (10, 1.00, 'FILTRO', 1.00, 2);
INSERT INTO `ven_concepto` VALUES (11, 12.00, 'MERCON V', 1.00, 3);
INSERT INTO `ven_concepto` VALUES (12, 1.00, 'SILICON', 1.00, 3);
INSERT INTO `ven_concepto` VALUES (13, 1.00, 'TAMBOR DE REVERSA', 1.00, 3);
INSERT INTO `ven_concepto` VALUES (14, 1.00, 'FILTRO', 1.00, 3);
INSERT INTO `ven_concepto` VALUES (15, 1.00, 'JUEGO DE DISCOS DE PASTA', 1.00, 3);
INSERT INTO `ven_concepto` VALUES (16, 1.00, 'JUEGO DE JUNTAS CON PISTONES', 1.00, 3);
INSERT INTO `ven_concepto` VALUES (17, 1.00, 'RETRN LATERAL', 1.00, 4);
INSERT INTO `ven_concepto` VALUES (18, 1.00, 'SILICON', 1.00, 5);
INSERT INTO `ven_concepto` VALUES (19, 1.00, 'CAJA DE SELENOIDES 42RLE', 1.00, 5);
INSERT INTO `ven_concepto` VALUES (20, 1.00, 'ARNES DE CUERPO DE VALVULAS', 0.00, 6);
INSERT INTO `ven_concepto` VALUES (21, 2.00, 'SELENOIDES DE CAMBIOS', 0.00, 6);
INSERT INTO `ven_concepto` VALUES (22, 10.00, 'LITROS DE ACEITE MERCON 5', 0.00, 7);
INSERT INTO `ven_concepto` VALUES (23, 1.00, 'TURBINA', 0.00, 7);
INSERT INTO `ven_concepto` VALUES (24, 1.00, 'FILTRO', 0.00, 7);
INSERT INTO `ven_concepto` VALUES (25, 1.00, 'JUEGO DE JUNTA ', 0.00, 7);
INSERT INTO `ven_concepto` VALUES (26, 1.00, 'JUEGO DE DISCOS DE PASTA', 0.00, 7);
INSERT INTO `ven_concepto` VALUES (27, 1.00, 'ACEITE', 1.00, 8);
INSERT INTO `ven_concepto` VALUES (28, 2.00, 'HORQUILLAS INFERIOR', 1.00, 8);
INSERT INTO `ven_concepto` VALUES (29, 2.00, 'HORQUILLAS SUPERIOR ', 1.00, 8);
INSERT INTO `ven_concepto` VALUES (30, 2.00, 'VARILLAS', 1.00, 8);
INSERT INTO `ven_concepto` VALUES (31, 2.00, 'TERMINALES', 1.00, 8);
INSERT INTO `ven_concepto` VALUES (32, 2.00, 'ACEITE ', 1.00, 9);
INSERT INTO `ven_concepto` VALUES (33, 1.00, 'DIRECCIÓN HIDRÁULICA ', 1.00, 9);
INSERT INTO `ven_concepto` VALUES (34, 1.00, 'BOMBA DE DIRECCIÓN  HIDRÁULICA ', 1.00, 9);
INSERT INTO `ven_concepto` VALUES (35, 1.00, 'SOPORTE LATERAL', 1.00, 10);
INSERT INTO `ven_concepto` VALUES (36, 1.00, 'SOPORTE  DELANTERO', 1.00, 10);
INSERT INTO `ven_concepto` VALUES (37, 1.00, 'BANDA DE QUINTA', 1.00, 10);
INSERT INTO `ven_concepto` VALUES (38, 1.00, 'JUEGO DE RONDANA', 1.00, 10);
INSERT INTO `ven_concepto` VALUES (39, 10.00, 'ACEITE MERCON V', 1.00, 10);
INSERT INTO `ven_concepto` VALUES (40, 1.00, 'TURBINA', 1.00, 10);
INSERT INTO `ven_concepto` VALUES (41, 1.00, 'FILTRO', 1.00, 10);
INSERT INTO `ven_concepto` VALUES (42, 1.00, 'JUEGO DE DISCOS DE PASTA', 1.00, 10);
INSERT INTO `ven_concepto` VALUES (43, 1.00, 'JUEGO DE JUNTAS', 1.00, 10);
INSERT INTO `ven_concepto` VALUES (44, 4.00, 'ACEITE ATF VI', 1.00, 11);
INSERT INTO `ven_concepto` VALUES (45, 5.00, 'ACEITE', 1.00, 12);
INSERT INTO `ven_concepto` VALUES (46, 1.00, 'SILICON', 1.00, 12);
INSERT INTO `ven_concepto` VALUES (47, 1.00, 'FILTRO', 1.00, 12);
INSERT INTO `ven_concepto` VALUES (48, 12.00, 'LITROS DE ACEITE MERCON 5', 0.00, 13);
INSERT INTO `ven_concepto` VALUES (49, 1.00, 'SILICON', 0.00, 13);
INSERT INTO `ven_concepto` VALUES (50, 1.00, 'FILTRO', 0.00, 13);
INSERT INTO `ven_concepto` VALUES (51, 5.00, 'DISCOS DE ACERO CHICOS', 0.00, 13);
INSERT INTO `ven_concepto` VALUES (52, 1.00, 'TAMBOR DE ALUMINIO COMPLETO', 0.00, 13);
INSERT INTO `ven_concepto` VALUES (53, 1.00, 'PISTON AULADO', 0.00, 13);
INSERT INTO `ven_concepto` VALUES (54, 1.00, 'TURBINA', 0.00, 13);
INSERT INTO `ven_concepto` VALUES (55, 1.00, 'JUEGO DE DISCOS DE PASTA', 0.00, 13);
INSERT INTO `ven_concepto` VALUES (56, 1.00, 'JUEGO DE JUNTAS', 0.00, 13);
INSERT INTO `ven_concepto` VALUES (57, 5.00, 'ACEITE MERCON V', 1.00, 14);
INSERT INTO `ven_concepto` VALUES (58, 1.00, 'MALLA DEL MODULO', 1.00, 14);
INSERT INTO `ven_concepto` VALUES (59, 1.00, 'ACEITE', 0.00, 15);
INSERT INTO `ven_concepto` VALUES (60, 1.00, 'VALERO DE VALVULA', 0.00, 15);
INSERT INTO `ven_concepto` VALUES (61, 1.00, 'TAPON AJUSTAFOR ', 0.00, 15);
INSERT INTO `ven_concepto` VALUES (62, 1.00, 'BARRA DE DIRECCION', 0.00, 15);
INSERT INTO `ven_concepto` VALUES (63, 1.00, 'REPUESTO DE DIRECCION HIDRAULICA', 0.00, 15);
INSERT INTO `ven_concepto` VALUES (64, 1.00, 'SOPORTE TRASERO', 0.00, 16);
INSERT INTO `ven_concepto` VALUES (65, 1.00, 'SOPORTE LATERAL', 0.00, 16);
INSERT INTO `ven_concepto` VALUES (66, 1.00, 'BOMBA DE ACEITE', 0.00, 16);
INSERT INTO `ven_concepto` VALUES (67, 1.00, 'TURBINA', 0.00, 16);
INSERT INTO `ven_concepto` VALUES (68, 1.00, 'SILICON', 0.00, 16);
INSERT INTO `ven_concepto` VALUES (69, 8.00, 'LITROS DE ACEITE CVT AMARILLO', 0.00, 16);
INSERT INTO `ven_concepto` VALUES (70, 1.00, 'FILTTO DE CARTUCHO', 0.00, 16);
INSERT INTO `ven_concepto` VALUES (71, 1.00, 'FILTRO', 0.00, 16);
INSERT INTO `ven_concepto` VALUES (72, 1.00, 'CADENA DEL YOYO', 0.00, 16);
INSERT INTO `ven_concepto` VALUES (73, 1.00, 'YOYO', 0.00, 16);
INSERT INTO `ven_concepto` VALUES (74, 5.00, 'ACEITE', 1.00, 17);
INSERT INTO `ven_concepto` VALUES (75, 2.00, 'CUBRE POLVOS', 1.00, 18);
INSERT INTO `ven_concepto` VALUES (76, 1.00, 'ACEITE', 1.00, 18);
INSERT INTO `ven_concepto` VALUES (77, 1.00, 'BALERO', 1.00, 18);
INSERT INTO `ven_concepto` VALUES (78, 1.00, 'REPUESTO DE DIRECCIÓN ', 1.00, 18);
INSERT INTO `ven_concepto` VALUES (79, 1.00, 'BARRA', 1.00, 18);
INSERT INTO `ven_concepto` VALUES (80, 1.00, 'DIRECCIÓN  HIDRÁULICA NUEVA NO ORIGINAL', 1.00, 19);
INSERT INTO `ven_concepto` VALUES (81, 1.00, 'REPUESTO DE DIRECCION', 1.00, 20);
INSERT INTO `ven_concepto` VALUES (82, 1.00, 'ACEITE', 1.00, 20);
INSERT INTO `ven_concepto` VALUES (83, 1.00, 'BANDA DE REVERSA', 0.00, 21);
INSERT INTO `ven_concepto` VALUES (84, 2.00, 'BANDAS DELANTERAS', 0.00, 21);
INSERT INTO `ven_concepto` VALUES (85, 1.00, 'FILTRO  A604', 1.00, 22);
INSERT INTO `ven_concepto` VALUES (86, 1.00, 'SILICON', 1.00, 22);
INSERT INTO `ven_concepto` VALUES (87, 5.00, 'MERCON V', 1.00, 22);
INSERT INTO `ven_concepto` VALUES (88, 2.00, 'ACEITE', 1.00, 23);
INSERT INTO `ven_concepto` VALUES (89, 1.00, 'REPUESTO DE DIRECCION HIDRAULICA', 1.00, 23);
INSERT INTO `ven_concepto` VALUES (90, 1.00, 'REPUESTO DE HIDROBOSTER', 1.00, 23);
INSERT INTO `ven_concepto` VALUES (91, 1.00, 'JUNTA DE CARTER', 1.00, 24);
INSERT INTO `ven_concepto` VALUES (92, 1.00, 'FILTRO', 1.00, 24);
INSERT INTO `ven_concepto` VALUES (93, 6.00, 'ACEITE MERCON  V', 1.00, 24);
INSERT INTO `ven_concepto` VALUES (94, 5.00, 'ACEITE MERCON V', 1.00, 25);
INSERT INTO `ven_concepto` VALUES (95, 1.00, 'JUNTA DE CARTER', 1.00, 25);
INSERT INTO `ven_concepto` VALUES (96, 1.00, 'FILTRO', 1.00, 25);
INSERT INTO `ven_concepto` VALUES (97, 1.00, 'VALERO DE BOMBA', 0.00, 26);
INSERT INTO `ven_concepto` VALUES (98, 1.00, 'REPUESTO DE BOMBA DE DIRECCION ', 0.00, 26);
INSERT INTO `ven_concepto` VALUES (99, 1.00, 'SILICON', 1.00, 27);
INSERT INTO `ven_concepto` VALUES (100, 10.00, 'ACEITE MERCON V', 1.00, 27);
INSERT INTO `ven_concepto` VALUES (101, 1.00, 'ENFRIADOR', 1.00, 27);
INSERT INTO `ven_concepto` VALUES (102, 1.00, 'TURBINA', 1.00, 27);
INSERT INTO `ven_concepto` VALUES (103, 5.00, 'ACEITE CVT', 1.00, 28);
INSERT INTO `ven_concepto` VALUES (104, 1.00, 'FILTRO', 1.00, 29);
INSERT INTO `ven_concepto` VALUES (105, 5.00, 'ACEITE MERCON V', 1.00, 29);
INSERT INTO `ven_concepto` VALUES (106, 1.00, 'RETEN DE CIGUEÑAL', 1.00, 30);
INSERT INTO `ven_concepto` VALUES (107, 1.00, 'SILICON', 1.00, 30);
INSERT INTO `ven_concepto` VALUES (108, 10.00, 'ACEITE MERCON V', 1.00, 30);
INSERT INTO `ven_concepto` VALUES (109, 1.00, 'BANDA', 1.00, 30);
INSERT INTO `ven_concepto` VALUES (110, 1.00, 'JUEGO DE DISCOS DE PASTA', 1.00, 30);
INSERT INTO `ven_concepto` VALUES (111, 1.00, 'JUEGO DE JUNTAS', 1.00, 30);
INSERT INTO `ven_concepto` VALUES (112, 5.00, 'ACEITE MERCON V', 1.00, 31);
INSERT INTO `ven_concepto` VALUES (113, 1.00, 'FILTRO', 1.00, 31);
INSERT INTO `ven_concepto` VALUES (114, 1.00, 'ACEITE', 1.00, 32);
INSERT INTO `ven_concepto` VALUES (115, 1.00, 'REPUESTO DE DIRECCION', 1.00, 32);
INSERT INTO `ven_concepto` VALUES (116, 5.00, 'ACEITE MERCON V', 1.00, 33);
INSERT INTO `ven_concepto` VALUES (117, 1.00, 'JUNTA', 1.00, 33);
INSERT INTO `ven_concepto` VALUES (118, 1.00, 'FILTRO', 1.00, 33);

-- ----------------------------
-- Table structure for ven_cotizacion
-- ----------------------------
DROP TABLE IF EXISTS `ven_cotizacion`;
CREATE TABLE `ven_cotizacion`  (
  `cot_id` int(11) NOT NULL,
  `cot_folio` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cot_fecha` date NULL DEFAULT NULL,
  `cot_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_nonuevoscontratos` int(11) NULL DEFAULT NULL,
  `cot_nocontratos` int(11) NULL DEFAULT NULL,
  `cot_telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_atencion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_modelo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_tipo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_marca` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_placas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_mecanico` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_psalida` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_fechasalida` date NULL DEFAULT NULL,
  `cot_solocotizacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `cot_acepto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_elaboro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cot_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ven_detalle
-- ----------------------------
DROP TABLE IF EXISTS `ven_detalle`;
CREATE TABLE `ven_detalle`  (
  `det_id` int(11) NOT NULL,
  `det_cantidad` int(11) NULL DEFAULT NULL,
  `det_partida` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `det_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `det_unitario` decimal(11, 2) NULL DEFAULT NULL,
  `det_fkcotizacion` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`det_id`) USING BTREE,
  INDEX `det_fkcotizacion`(`det_fkcotizacion`) USING BTREE,
  CONSTRAINT `ven_detalle_ibfk_1` FOREIGN KEY (`det_fkcotizacion`) REFERENCES `ven_cotizacion` (`cot_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ven_folio
-- ----------------------------
DROP TABLE IF EXISTS `ven_folio`;
CREATE TABLE `ven_folio`  (
  `fol_id` int(11) NOT NULL AUTO_INCREMENT,
  `fol_serie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fol_folio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `fol_descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`fol_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ven_folio
-- ----------------------------
INSERT INTO `ven_folio` VALUES (1, 'POLO', '73', 'Polo');
INSERT INTO `ven_folio` VALUES (2, 'NOTA', '66', 'NOTA');
INSERT INTO `ven_folio` VALUES (3, 'VALE', '33', 'VALES');

-- ----------------------------
-- Table structure for ven_orden
-- ----------------------------
DROP TABLE IF EXISTS `ven_orden`;
CREATE TABLE `ven_orden`  (
  `ord_id` int(11) NOT NULL AUTO_INCREMENT,
  `ord_folio` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ord_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ord_user` int(11) NULL DEFAULT NULL,
  `ord_direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ord_codigoPostal` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ord_telefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ord_ife` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ord_modelo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ord_tipo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ord_marca` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ord_placa` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ord_fechaIngreso` datetime(0) NOT NULL,
  `ord_fechaEntrega` datetime(0) NULL DEFAULT NULL,
  `ord_noSerie` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ord_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ord_kilometraje` int(10) NULL DEFAULT NULL,
  `ord_vehiculoExterior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `ord_vehiculoInterior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `ord_observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ord_tanque` decimal(3, 2) NULL DEFAULT NULL,
  `ord_accesoriosExterior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `ord_accesoriosInterior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `ord_problemas` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ord_diagnostico` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ord_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ven_orden
-- ----------------------------
INSERT INTO `ven_orden` VALUES (1, 'POLO-1', 'JOSE JUAN VAZCONELOS', 1, '', '', '9141115033', '', '2002', 'VAGONETA', '', 'SUELTA', '2019-11-25 11:57:57', '2019-11-25 12:50:00', '', 'suelta', NULL, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', 'Dirección suelta', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', '', 'Empatado de dirección 1800.00\r\npulido de Barda 200.00');
INSERT INTO `ven_orden` VALUES (2, 'POLO-2', 'wiki am Henrique salvador hernandes', 5, '', '', '9341060303', '', '2006', 'lupo', 'vw', 'DJN-15-16', '2019-11-25 12:52:48', '2019-11-25 18:15:00', '', 'negro', NULL, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Cajuela llena', 0.20, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Checar dirección truena ', '');
INSERT INTO `ven_orden` VALUES (3, 'POLO-3', 'SR. FELIPE BALCAZAR LOPEZ', 5, 'CARRET VHSA-TEAPA KM 19 PASANDO PLAYAS DEL ROSARIO ANTES DE LA \"T\" FTE LA SUBESTACION CFE HAY UNA ENTRADA A LA 3RA CASA COLOR ROSA PORTON NEGRO ', '', '9935611246', '', '2001', 'FOCUS', 'FORD', 'SUELTA', '2019-11-25 13:14:31', '2019-11-27 09:05:00', '', 'SUELTA', 0, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', 'REPARACION DE TRANSMISION AUTOMATICA Y DIRECCION HIDRAULICA SUELTA', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', '', '');
INSERT INTO `ven_orden` VALUES (4, 'POLO-4', 'miguel garcia', 5, '', '', '9931912422', '', '2000', 'malibu', 'chevrolet', 'WUB-91-42', '2019-11-25 13:26:10', NULL, '', 'azul', NULL, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check prendido', 1.00, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"on\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Checar sensor de velocidad', '');
INSERT INTO `ven_orden` VALUES (5, 'POLO-5', 'SR EDUARDO  MACIAS', 5, '', '', '9933200749', '', '2011', 'Odyssey', 'Honda', 'WSW-81-06', '2019-11-25 13:43:44', '2019-11-27 11:25:00', '', 'Blanco', 92331, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"on\",\"Cinturones\":\"on\"}', 'I marca en el tablero', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"on\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Empacando de dirección ', '');
INSERT INTO `ven_orden` VALUES (6, 'POLO-6', 'SR. RAYMUNDO CARMONA', 5, '', '', '9931764963', '', '2009', 'EDGE', 'FORD', 'NTK-28-20', '2019-11-25 14:46:46', NULL, '', 'NEGRO', 135520, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check. Brake. !  P ', 0.50, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Revisar golpea en reversa, ', '');
INSERT INTO `ven_orden` VALUES (7, 'POLO-7', 'Sr JESUS PALOMEQUE', 5, '', '', '9931988509', '', '2008', 'Torrent', 'Pontiac', 'WTU-68-11', '2019-11-26 08:31:59', '2019-11-26 12:50:00', '', 'GRIS', 171147, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Chuck.abs.bolsa de aire', 0.25, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'MANTENIMIENTO  a la TRANSMISIÓN  AUTOMÁTICA ', '');
INSERT INTO `ven_orden` VALUES (8, 'POLO-8', 'MARCOS ROBERTO NIETO QUEVEDO', 5, '', '', '9931903612', '', '2007', 'TAHOE', 'Chevrolet', 'WTS-68-78', '2019-11-26 11:16:27', '2019-11-27 14:50:00', '', 'Blanco', NULL, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check prendido', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Cambio de reten de cigueñal $ 1500 mano de obra', '');
INSERT INTO `ven_orden` VALUES (9, 'POLO-9', 'SR. PICHARDO', 5, '', '', '9932426210', '', '2004', 'Jetta a4', 'vw', 'W25-AAS', '2019-11-26 13:25:29', NULL, '', 'Negro', 302024, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check bolsa de aire y circulo con 6 reyas', 0.55, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"on\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Checar golpeteo en tercera ', '');
INSERT INTO `ven_orden` VALUES (10, 'POLO-10', 'Taller ewald sr. Antonio', 5, 'Conocido', '', '9932670668', '', '2014', 'Saveiro', 'VW', 'SUELTA', '2019-11-26 14:08:07', '2019-12-05 17:10:00', '', 'suelta', NULL, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', '', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', 'Proble,a ennla direccion', 'Bajar caja de direccion');
INSERT INTO `ven_orden` VALUES (11, 'POLO-11', 'SR. Florentino vazquez/ miguel', 5, '', '', '9371029015', '', '2006', 'Sentra', 'Nissan', 'Wth-69-06', '2019-11-26 17:58:22', NULL, '', 'Gris', NULL, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', '', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Revisar problema de caja', '');
INSERT INTO `ven_orden` VALUES (12, 'POLO-12', 'SR. Ramón camacho', 5, '', '', '9931148529', '', '2013', 'Sonic', 'Chevrolet', 'EXT-30-59', '2019-11-27 07:41:38', '2019-11-27 17:45:00', '', 'Blanco', NULL, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.20, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Revisar palanca de velocidades ', '');
INSERT INTO `ven_orden` VALUES (13, 'POLO-13', 'SR. Juan Manuel Martínez ', 5, '', '', '9933300885', '', '2011', 'Lobo Kingston ranch', 'Ford', 'VM-75-782', '2019-11-27 08:35:01', '2019-11-27 15:30:00', '', 'Blanco', 245221, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.20, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"on\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Mantenimiento a la caja de velocidades $1500 más iva', '');
INSERT INTO `ven_orden` VALUES (14, 'POLO-14', 'SR. ABELARDO LOPEZ', 5, '', '', '9932203960', '', '2006', 'Dakota', 'Dodge', 'VM-74-973', '2019-11-27 09:31:48', '2019-11-28 13:55:00', '', 'Rojo', 132164, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check ', 0.30, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"on\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Checar caja de selenoide y mantenimiento', 'No hace los cambios');
INSERT INTO `ven_orden` VALUES (15, 'POLO-15', 'SR. AULICER HERNANDEZ RUIZ', 5, '', '', '9934186843', '', '2003', 'Polo', 'VW', 'DPY-81-93', '2019-11-27 10:03:02', '2019-11-27 16:50:00', '', 'Cafe', 266185, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check y liquido de limpia parabrisas', 0.25, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Checar tronido en la direccion ', '');
INSERT INTO `ven_orden` VALUES (16, 'POLO-16', 'SR. JORGE HERNANDEZ MAY', 5, '', '', '9931704072', '', '2013', 'TSURU', 'nissan', '99-10-VMF', '2019-11-27 10:16:44', '2019-11-27 10:10:00', '', 'AMARUILLO', 343961, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.75, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Cambio de bujes de direccion hidraulica', '');
INSERT INTO `ven_orden` VALUES (17, 'POLO-17', 'Sr esteban alamilla robles', 5, '', '', '9933023174', '', '2010', 'ACTITUDE', 'Dodge', 'WTA-60-83', '2019-11-27 11:47:03', '2019-11-27 11:45:00', '', 'BLANCO', 195795, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"on\",\"Cinturones\":\"on\"}', '', 0.75, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Mantenimiento a la transmision automatica $1,000.00', '');
INSERT INTO `ven_orden` VALUES (18, 'POLO-18', 'SR. Emmanuel zapata hernandez ', 5, '', '', '9934366147', '', '2003', 'Fiesta', 'Ford', 'DHE-77-57', '2019-11-27 12:18:36', '2019-11-27 12:50:00', '', 'azul', 49413, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.20, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Empacado de bomba de direccion $1200', '');
INSERT INTO `ven_orden` VALUES (19, 'POLO-19', 'SR. JOSE JESUS', 5, 'TORRES', '', '9931485184', '', '2012', 'TACOMA', 'TOYOTA', 'VM-73-027', '2019-11-27 13:05:37', '2019-12-05 17:10:00', '', 'GRIS', 1624, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check', 0.75, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Al desarrollar de 20 a 60 vibra', '');
INSERT INTO `ven_orden` VALUES (20, 'POLO-20', 'SRA. TELMA ROMERO', 5, '', '', '9932206400    ', '', '2009', 'Mazda', '6', 'WMA-129-A', '2019-11-28 07:09:18', NULL, '9931025190', 'AZUL', 114713, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.50, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"on\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"on\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Checar direccion', '');
INSERT INTO `ven_orden` VALUES (21, 'POLO-21', 'ABENAMAR GIRON SANTIAGO', 5, '', '', '9372833817', '', '2008', 'EUROVAN', 'VW', 'VM-44-581', '2019-11-28 12:01:38', NULL, '', 'BLANCO', 102088, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Abs,freno de mano,i,antiderrapante, no marca gasolina ', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Empacado de bomba $1,200\r\nEmpacado de direccion $1,900\r\n', '');
INSERT INTO `ven_orden` VALUES (23, 'POLO-23', 'ULISES HERNANDEZMROMERO', 5, '', '', '9931600158', '', '2007s', 'TORRENT', 'CHEVROLET', 'SUELTA', '2019-11-28 13:53:11', NULL, '', 'SUELTA', NULL, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', 'LA CAJA LA TRAJERON DESARMADA', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', 'REVISAR TRANSMISION AUTOMATICA', '');
INSERT INTO `ven_orden` VALUES (24, 'POLO-24', 'FELIPE BALCAZAR LOPEZ', 5, '', '', '9935611246', '', '2001', 'FOCUS', 'FORD', 'WTY-88-65', '2019-11-28 16:30:40', '2019-11-29 15:45:00', '', 'BLANCO', 321879, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"off\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.45, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Correcion de fuga en reten lateral', '');
INSERT INTO `ven_orden` VALUES (25, 'POLO-25', 'AURA JOSEFA LANZ JIMENEZ', 5, '', '', '9932061764', '', '2006', 'TORRENT', 'PONTIAC', 'WTK-20-15', '2019-11-28 18:10:37', NULL, '', 'BLANCO', 277372, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check', 0.70, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'REVISIÓN DE LA TRANSMISIÓN  AUTÓMATICA', '');
INSERT INTO `ven_orden` VALUES (26, 'POLO-27', 'SR. ABELARDO LOPEZ', 5, '', '', '9932203960', '', '2009', 'DAKOTA', 'DODGE', 'SUELTA', '2019-11-29 16:28:19', NULL, '', 'SUELTA', NULL, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', 'CAJA SUELTA', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', 'REPARACION DE TRASNSMISION AUTOMATICA', '');
INSERT INTO `ven_orden` VALUES (27, 'POLO-28', 'Sra. Nelly hernandes castillo', 13, '', '', '9932192727', '', '2015', 'Versa', 'nissan', 'WTX-57-58', '2019-11-30 09:01:38', '2019-11-30 11:15:00', '', 'Rojo', 79830, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.40, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"on\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"on\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Cambio de aceite a la caja de velocidades $1400', '');
INSERT INTO `ven_orden` VALUES (28, 'POLO-29', 'CARLOS AUGUSTO LOPEZ', 5, '', '', '9935133151', '', '2001', 'NEON', 'DODGE', 'WUB-81-96', '2019-11-30 11:29:38', NULL, '', 'ROJO', 418401, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Motorcito', 0.45, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Mantenimiento a la transmisiones 6to mes ', '');
INSERT INTO `ven_orden` VALUES (29, 'POLO-30', 'MIGUEL ARTEAGA ', 5, '', '', '9982708394', '', '2006', 'RAV 4', 'TOYOTA', 'DJP-70-61', '2019-11-30 13:40:31', NULL, '', 'GRIS', NULL, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'BOLSA DE AIRE, ANTIDERRAPANTE,CHECK,VSC,', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Mano de obra x cambio de aceite', '');
INSERT INTO `ven_orden` VALUES (30, 'POLO-31', 'SR. JOSE GUADELUPE PEREZ RODRIGUEZ', 13, '', '', '9321031051', '', '2002', 'Explorer', 'Ford', 'WTG-80-84', '2019-11-30 15:10:42', NULL, '', 'Roja', 182502, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'ABS SERVICE ENGINE SOON', 0.80, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Parpadea el overdaver pero si hace los cambios ', '');
INSERT INTO `ven_orden` VALUES (31, 'POLO-32', 'Lic. Javier alonso lopez', 13, '', '', '9932282172', '', '2013', 'Cruze', 'Chevrolet', 'WSW-11-73', '2019-12-02 07:32:08', NULL, '', 'Blanco', 123392, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"on\",\"Cinturones\":\"on\"}', 'Check prendido', 0.55, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"on\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"on\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Se le prendio el check y el diagnostico dice q es el modulo de la transmicion pero comenta el cliente q no le falla', '');
INSERT INTO `ven_orden` VALUES (32, 'POLO-33', 'Sr. Francisco lopez ', 13, '', '', '9932600753', '', '2015', 'Sentra', 'nissan', 'WSH-86-71', '2019-12-02 08:50:43', NULL, '', 'Gris oscuro', 213275, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check ABS PRENDISOS calavera rota derecha', 0.25, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Checar certer de transmicion automatica', '');
INSERT INTO `ven_orden` VALUES (33, 'POLO-34', 'Sr. Jose francisco olan', 13, '', '', '9931972177', '', '2006', 'Stratus', 'DODGE', 'WTY-18-51', '2019-12-02 12:12:17', NULL, '', 'BLANCO', 216211, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check AIR BAG prendido', 0.25, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Cambio de aceite del tercer mes', '');
INSERT INTO `ven_orden` VALUES (34, 'POLO-35', 'SR. CARLOS HERNANDEZ ALCARAZ', 13, '', '', '9931777215', '', '2007', 'Lobo', 'Ford', 'VM-71-762', '2019-12-03 08:56:42', NULL, '', 'Azul', 251379, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check prendido, calavera izquierda rota,  espejo izwierdo roto', 0.10, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Mantenimiento del tercer mes', '');
INSERT INTO `ven_orden` VALUES (35, 'POLO-36', 'Sr. Pedro alberto gonzales', 13, '', '', '9931904993', '', '2012', 'March', 'nissan', 'WTV-44-35', '2019-12-03 10:24:33', NULL, '', 'Cobre', 26617, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check prendido', 0.40, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Cambio de aceite $ 1300', '');
INSERT INTO `ven_orden` VALUES (36, 'POLO-37', 'SR. MIGUEL PERDOMO CERINO', 13, '', '', '993309671', '', '2002', 'RANGER', 'Ford', 'VR-45-683', '2019-12-03 10:49:04', NULL, '', 'Blanco', NULL, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"on\",\"Cinturones\":\"on\"}', 'Bateria encendida, calavera derecha rota', 0.50, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Empacado de direccion $1900\r\nCliente dejo $1000 pesos de anticipo', '');
INSERT INTO `ven_orden` VALUES (37, 'POLO-38', 'SR. MARIO HERNANDEZ FERIA', 13, '', '', '9933749883', '', '2014', 'Aveo', 'Chevrolet', 'WUC-40-58', '2019-12-03 13:54:03', NULL, '', 'Negro', 114606, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.25, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Cambio de manguera de retroseso de direccion hidraulica', '');
INSERT INTO `ven_orden` VALUES (38, 'POLO-39', 'Sr. Jaime torres', 13, '', '', '9931529026', '', '2009', 'Yaris', 'TOYOTA', 'WTS-51-01', '2019-12-03 15:30:41', NULL, '', 'Negro', 205779, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.50, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Reparacion de chicote $750', '');
INSERT INTO `ven_orden` VALUES (39, 'POLO-40', 'Ulises camelo', 13, '', '', '9933074493', '', '2006', 'Fiesta', 'Ford', 'D47-ANY', '2019-12-03 17:38:16', NULL, '', 'GRIS', NULL, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"on\",\"Cinturones\":\"on\"}', 'Prendido check engine', 0.25, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"on\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"on\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Empacado de direccion $1800 \r\nBarra de direccion $1900', '');
INSERT INTO `ven_orden` VALUES (40, 'POLO-41', 'SR.JUAN  MARCOS BEDOLLA DE CASTRO', 13, '', '', '9935918231', '', '2014', 'Sonic', 'Chevrolet', 'WTT-31-47', '2019-12-04 07:42:02', NULL, '', 'Gris', 106877, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.65, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Cambio de aceite a la caja de velocidades', '');
INSERT INTO `ven_orden` VALUES (41, 'POLO-42', 'Profe rocha', 13, '', '', '9932289388', '', '2006', 'Explorer', 'Ford', 'WTV-50-71', '2019-12-04 08:22:37', NULL, '', 'Cafe oscuro', 262218, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'ABS ', 0.25, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"on\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Checar cuerpo de valvulas', '');
INSERT INTO `ven_orden` VALUES (42, 'POLO-43', 'MARCOS ROBERTO NIETO QUEVEDO', 13, '', '', '9931903612', '', '2007', 'TAHOE', 'Chevrolet', 'WTS-68-78', '2019-12-04 09:32:27', '2019-12-06 13:20:00', '', 'BLANCO', 1746, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check', 0.35, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Tira aceite de transmision', '');
INSERT INTO `ven_orden` VALUES (43, 'POLO-44', 'Sr.luis roberto', 13, '', '', '9933080925', '', '2014', 'Aveo', 'Chevrolet', 'WSB-81-84', '2019-12-04 10:05:20', NULL, '', 'Negro', NULL, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.40, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Empacado de direccion y cambio de manguera de retroseso $1900 mas iva si requiere factura o si paga con tarjeta', '');
INSERT INTO `ven_orden` VALUES (44, 'POLO-45', 'ENRIQUE HERNANDEZ DEL ANGEL', 13, '', '', '9934335468', '', '96', 'Explorer', 'Ford', 'WSX-95-05', '2019-12-04 10:30:32', NULL, '', 'BLANCO', 202364, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"off\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Bolsa de aire', 0.70, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', '', '');
INSERT INTO `ven_orden` VALUES (45, 'POLO-46', 'EWALD', 13, '', '', '3391544', '', '2013', 'Silverado', 'chevrolet', 'VM-71-885', '2019-12-04 12:19:12', NULL, '', 'Blanco', NULL, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check dibujo de pression de aire de llanta', 0.00, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Checar golpeteo al frenar y patinamiento entre segunda y tercera', '');
INSERT INTO `ven_orden` VALUES (46, 'POLO-47', 'SR. Javier alonso arevalos', 13, '', '', '9932282172', '', '2013', 'Cruze', 'Chevrolet', 'WSW-11-73', '2019-12-05 07:19:22', '2019-12-05 16:05:00', '', 'BLANCO', NULL, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"on\",\"Cinturones\":\"on\"}', '', 0.25, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"on\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', '', '');
INSERT INTO `ven_orden` VALUES (47, 'POLO-48', 'ROBERTO PEDRERO', 13, '', '', '9932792529', '', '2009', 'SUBURBAN', 'CHEVROLET', 'WTG-95-76', '2019-12-05 09:02:14', NULL, '', 'BLANCO', 127718, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Bolsa de aire, check, tablero abretado', 0.50, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', '', 'Fuga de aceite de motor por el carter reparacion $2,800.00 aprox.\r\nFuga de la direccion reparacion $2,800.00\r\nfuga del hidroboster reparacion $4,500.00\r\nTOTAL $10,100.00');
INSERT INTO `ven_orden` VALUES (48, 'POLO-49', 'SR. JOSÉ cerino', 13, '', '', '9932620055', '', '2004', 'Ranger', 'Ford', 'VM-52-541', '2019-12-05 09:17:30', NULL, '', 'BLANCO', 243128, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'ABS prendido', 0.50, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'MANO DE obra por bajar y montar direccion\r\n600', '');
INSERT INTO `ven_orden` VALUES (49, 'POLO-50', 'SR. YVES DE DIOS', 13, '', '', '9931100132', '', '2007', 'Tida', 'nissan', 'WLW-457-A', '2019-12-05 09:37:36', '2019-12-05 14:35:00', '', 'Cafe', 98588, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check  prendido bolsa de AIRE prendido', 0.40, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"on\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Reparacion de chicote de palanca $700', '');
INSERT INTO `ven_orden` VALUES (50, 'POLO-51', 'SR FERNANDO ALBERTO', 13, '', '', '9931273267', '', '2013', 'Jetta', 'VW', 'WMH-332-A', '2019-12-05 10:38:19', NULL, '', 'Blanco', 143267, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.20, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Checar carter si tiene agua el la caja de velocidades', '');
INSERT INTO `ven_orden` VALUES (51, 'POLO-52', 'UBELMAR LOPEZ PALACIOS', 13, '', '', '9161659974', '', '2009', 'JOURNEY', 'DODGE', 'DSU-68-16', '2019-12-05 10:49:33', '2019-12-05 12:25:00', '', 'ROJO', 269598, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"off\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'ABS, CHECK, ESP BAS, ANTIDERRAPANTE.   Trae en la unidad: 2 bombas de gasolina, 1 valvula de oxigeno', 0.25, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA $1,000.00', '');
INSERT INTO `ven_orden` VALUES (52, 'POLO-53', 'SR JOSE SANTANA GARCIA ', 13, '', '', '9933014934', '', '2009', 'Cheyenne', 'Chevrolet', 'VM-74-939', '2019-12-05 12:58:29', '2019-12-05 16:00:00', '', 'BLANCO', 277333, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check,abs,antiderrapante,', 0.10, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Mantenimiento del 6to mes ', '');
INSERT INTO `ven_orden` VALUES (53, 'POLO-54', 'DANIEL  MIRANDA', 13, '', '', '9931577780', '', '2010', 'F150', 'FORD', 'VR-51-633', '2019-12-05 14:44:12', '2019-12-05 16:10:00', '', 'BLANCO', 1942103, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"off\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check', 0.75, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'MANTENIMIENTO A LA TRANSMISION AUTOMSTICA $1,200.00', '');
INSERT INTO `ven_orden` VALUES (54, 'POLO-55', 'Sr. Pedro camacho', 12, 'Conocido', '', '9931051300', '', '2017', 'Vento', 'VW', 'Wua-64-01', '2019-12-06 07:27:06', '2019-12-06 14:25:00', '', 'AZUL', NULL, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"on\",\"Cinturones\":\"on\"}', 'Hace ruido al girar chek encendido abs solo 1 tapon de rueda', 0.50, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"on\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Garantia de direccion hidraulica', '');
INSERT INTO `ven_orden` VALUES (55, 'POLO-56', 'RUBEN MATA BRIONES', 5, '', '', '9931802251', '', '2007', 'TIIDA', 'NISSAN', 'DHX-51-44', '2019-12-06 10:20:31', NULL, '', 'GRIS', 218141, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"on\",\"Cinturones\":\"on\"}', 'CHECK, (!)  FUEGO EN LA PALANCA', 0.25, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'EMPACADO DE TRANSMISIONS AUTOMATICA $5,500.00\r\nMANTENIMIENTO A LA TRANSMISION AUTOMATICA $1,000.00\r\nRETEN DE CIGUEÑAL $600.00\r\n\r\nOBSERVACION ESTE PRESUSPUESTO PUEDE VARIAR AL BAJAR  LA CAJA', '');
INSERT INTO `ven_orden` VALUES (56, 'POLO-57', 'JOSÉ DEL CARMEN  DIAZ', 12, '', '', '9931117680', '', '2004', 'SENTRA', 'NiSSAN', 'SUELTA ', '2019-12-06 14:08:47', NULL, '', 'SUELTA', NULL, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', 'BOMBA HIDRÁULICA  SUELTA', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', 'EMPACANDO DE BOMBA HIDRÁULICA  $1,000.00\r\nVALERO $150.00', '');
INSERT INTO `ven_orden` VALUES (57, 'POLO-58', 'Sra. Blanca diaz', 13, '', '', '9931678150', '', '2013', 'Versa', 'nissan', 'WTW-91-94', '2019-12-07 08:40:08', NULL, '', 'GRIS', 122080, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Llavecita encendida deja unas botas un garrafon sin tapete de cajuela', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Reparar chicote de palanca de velocidades $800', '');
INSERT INTO `ven_orden` VALUES (58, 'POLO-59', 'MARIA TERESA DE JESUS DIAZ CARRERA', 13, '', '', '9932638715', '', '2015', 'DUSTER', 'RENAULT', 'WSF-74-97', '2019-12-07 10:26:26', NULL, '', 'CAFE', 29764, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check ', 0.25, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'REVISION DE FALLO DE LA TRANSMISION AUTOMATICA', '');
INSERT INTO `ven_orden` VALUES (59, 'POLO-60', 'JOEL ROSAS', 13, '', '', '2227250531', '', '2013', 'SENTRA', 'NISSAN', 'TXX-27-75', '2019-12-07 10:39:24', NULL, '', 'BLANCO', 3097, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Check', 0.55, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Mantenimiento a la transmision automatica$1,500.00', '');
INSERT INTO `ven_orden` VALUES (60, 'POLO-61', 'Sr. Eloy garibay', 13, '', '', '9931757197', '', '1998', 'Touwn country', 'CHRYSLER', 'XKH-74-18', '2019-12-07 11:01:15', NULL, '', 'ROJO', 173116, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.55, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA 6TO MES', '');
INSERT INTO `ven_orden` VALUES (61, 'POLO-62', 'SR ROBERTO', 13, '', '', '9935901275', '', '2009', 'Outlnder', 'Mitsubishi', 'WTT-56-17', '2019-12-09 07:08:43', NULL, '', 'Blanco', 136714, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.40, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"on\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"on\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Mano de obra por cambio de reten lateral', '');
INSERT INTO `ven_orden` VALUES (62, 'POLO-63', 'SR. Servando calacuayo', 13, '', '', '9932830002', '', '2006', 'Jetta', 'VW', 'WPG-44-38', '2019-12-09 07:27:29', NULL, '', 'GRIS', 212644, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'Testigos de liquido limpia parabrisas y circulo con 6 rayitas pprendidos', 0.25, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"on\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Cambio de aceite del sexto mes $1200', '');
INSERT INTO `ven_orden` VALUES (63, 'POLO-64', 'Sr. Jose manuel ruiz', 13, 'Conocido', '', '9932294102', '', '2008', 'Ecoesport', 'Ford', 'SUELTA', '2019-12-09 07:45:11', NULL, '', 'SUELTA', NULL, '{\"Unidad de luces\":\"off\",\"Cuarto de luces\":\"off\",\"Antena\":\"off\",\"Espejo lateral\":\"off\",\"Cristales\":\"off\",\"Emblema\":\"off\",\"Llantas(4)\":\"off\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"off\",\"Tap\\u00f3n de gasolina\":\"off\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"off\"}', '{\"Instalaci\\u00f3n de tablero\":\"off\",\"Calefacci\\u00f3n\":\"off\",\"Limpiadores plumas\":\"off\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"off\",\"Ceniceros\":\"off\",\"Botones interiores\":\"off\",\"Manijas interiores\":\"off\",\"Tapetes\":\"off\",\"Vestiduras\":\"off\",\"Cinturones\":\"off\"}', 'Cliente deja 1000.00', 0.00, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"off\",\"Tap\\u00f3n de aceite\":\"off\",\"Tap\\u00f3n de radiador\":\"off\",\"Varilla para aceite\":\"off\",\"Filtro de aire\":\"off\",\"Bater\\u00eda\":\"off\"}', 'Fuga de direccion hidraulica', 'Empacado y revisar k no haya otro daño');
INSERT INTO `ven_orden` VALUES (64, 'POLO-65', 'SR. MARY MALENDES', 13, '', '', '9931118908', '', '2003', 'Windstar', 'Ford', 'WUB-79-24', '2019-12-09 08:05:33', NULL, '', 'CAFE', 220844, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"on\",\"Cinturones\":\"on\"}', 'ABS CHECK PRENDIDOS calavera derecha rota', 0.30, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Revisar bomba por sumbido', '');
INSERT INTO `ven_orden` VALUES (65, 'POLO-66', 'SILVIA PRECIADO COLEMAN', 5, '', '', '9933008194', '', '2003', 'ALTIMA', 'NISSAN', '652-PS', '2019-12-09 09:05:20', NULL, '', 'GRIS', 326247408, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.50, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'EMPACANDO DE DIRECCIÓN  HIDRÁULICA $1,900.00', '');
INSERT INTO `ven_orden` VALUES (66, 'POLO-67', 'Sr. Jorge vidal', 13, 'Conocido', '', '9932092601', '', '2009', 'Journey', 'DODGE', 'Wtt-1217', '2019-12-09 09:10:01', NULL, '', 'BLANCO', 228173, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"on\",\"Cinturones\":\"on\"}', 'Motorcito, bolsa de aire, encendido', 0.45, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Mantenimiento $1200', '');
INSERT INTO `ven_orden` VALUES (67, 'POLO-68', 'Sra. Maria luisa ojeda', 13, '', '', '9935901855', '', '2012', 'Sentra', 'nissan', 'WYD-93-56', '2019-12-09 09:30:55', NULL, '', 'Negro', 89927, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"off\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"on\",\"Cinturones\":\"on\"}', '', 0.90, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"on\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Checar fallo de caja de velocidades \r\nDe parkin en cualquier velocidad golpea y se revoluciona', '');
INSERT INTO `ven_orden` VALUES (68, 'POLO-69', 'SR. VICTIOR Navedo', 13, '', '', '9931337419', '', '1993', 'Cherokee', 'Jeep', 'WMC-209-A', '2019-12-09 09:44:38', NULL, '', 'Blanco', 239834, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', '', 0.50, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Empacado de transmicion automatica', '');
INSERT INTO `ven_orden` VALUES (69, 'POLO-70', 'AARON LEÓN LANESTOSA', 5, '', '', '9933112933', '', '2005', 'RAM 1500', 'DODGE', 'VM-52-320', '2019-12-09 09:49:33', NULL, '', 'AZUL', 211417, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'CHECK,ABS', 0.25, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'REVISIÓN DE TRANSMISIÓN  AUTOMÁTICA \r\nNO DESARROLLA', '');
INSERT INTO `ven_orden` VALUES (70, 'POLO-71', 'SR FRANCISCO OSORIO', 5, '', '', '9933110829', '', '2006', 'DAKOTA', 'DODGE', 'VM-53-472', '2019-12-09 10:09:09', NULL, '', 'BLANCO', 167428, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"off\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"on\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'CHECK', 0.70, '{\"Gato\":\"off\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA 3ER MES', '');
INSERT INTO `ven_orden` VALUES (71, 'POLO-72', 'SR. Luis hernandez', 13, '', '', '3500208', '', '2007', 'Colorado', 'Chevrolet', 'VS-34-912', '2019-12-09 10:26:10', NULL, '', 'Blanco', 215558, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"off\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"off\",\"Bocinas\":\"off\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'ABS, CHECK, PRESION DE LLANTA, ', 0.75, '{\"Gato\":\"on\",\"Maneral de gato\":\"off\",\"Llave de ruedas\":\"off\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"off\",\"Llantas de refacci\\u00f3n\":\"off\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', '', '');
INSERT INTO `ven_orden` VALUES (72, 'POLO-73', 'Sr. David lorenzo garcia', 13, '', '', '9932240498', '', '2002', 'Town y country', 'Chrysler', 'WTT-41-27', '2019-12-09 13:43:01', NULL, '', 'Verde', 164389, '{\"Unidad de luces\":\"on\",\"Cuarto de luces\":\"on\",\"Antena\":\"on\",\"Espejo lateral\":\"on\",\"Cristales\":\"on\",\"Emblema\":\"on\",\"Llantas(4)\":\"on\",\"Tapon de ruedas(4)\":\"on\",\"Molduras completas\":\"on\",\"Tap\\u00f3n de gasolina\":\"on\",\"Carrocer\\u00eda sin golpes\":\"on\",\"Bocinas de clax\\u00f3n\":\"on\"}', '{\"Instalaci\\u00f3n de tablero\":\"on\",\"Calefacci\\u00f3n\":\"on\",\"Limpiadores plumas\":\"on\",\"Radio tipo\":\"on\",\"Bocinas\":\"on\",\"Encendedor\":\"off\",\"Espejo retrovisor\":\"on\",\"Ceniceros\":\"on\",\"Botones interiores\":\"on\",\"Manijas interiores\":\"on\",\"Tapetes\":\"on\",\"Vestiduras\":\"off\",\"Cinturones\":\"on\"}', 'ABS, ', 0.35, '{\"Gato\":\"on\",\"Maneral de gato\":\"on\",\"Llave de ruedas\":\"on\",\"Estuche de  herramientas\":\"off\",\"Tri\\u00e1ngulos de seguridad\":\"on\",\"Llantas de refacci\\u00f3n\":\"on\",\"Extintor\":\"off\"}', '{\"Clax\\u00f3n\":\"on\",\"Tap\\u00f3n de aceite\":\"on\",\"Tap\\u00f3n de radiador\":\"on\",\"Varilla para aceite\":\"on\",\"Filtro de aire\":\"on\",\"Bater\\u00eda\":\"on\"}', 'Cambio de ceite a la caja de velocidades $1200', '');

-- ----------------------------
-- Table structure for ven_producto
-- ----------------------------
DROP TABLE IF EXISTS `ven_producto`;
CREATE TABLE `ven_producto`  (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_unidad` int(11) NOT NULL,
  `pro_nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pro_precio` decimal(10, 2) NOT NULL,
  `pro_fkventas` int(11) NOT NULL,
  PRIMARY KEY (`pro_id`) USING BTREE,
  INDEX `pro_fkven_folio`(`pro_fkventas`) USING BTREE,
  CONSTRAINT `ven_producto_ibfk_1` FOREIGN KEY (`pro_fkventas`) REFERENCES `ven_ventas` (`ven_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ven_producto
-- ----------------------------
INSERT INTO `ven_producto` VALUES (1, 1, 'REPARACION DE TRANSMISION AUTOMATICA', 15500.00, 1);
INSERT INTO `ven_producto` VALUES (3, 1, 'EMPACADO DE DIRECCION HIDRAULICA', 1800.00, 2);
INSERT INTO `ven_producto` VALUES (4, 1, 'PULIDO DE BARRA', 200.00, 2);
INSERT INTO `ven_producto` VALUES (5, 1, 'BOMBA HIDRAULICA ORIGINAL/USADA', 1500.00, 3);
INSERT INTO `ven_producto` VALUES (6, 1, 'CAMBIO DE DIRECCION HIDRAULICA NUEVA NO ORIJINAL', 6000.00, 4);
INSERT INTO `ven_producto` VALUES (7, 1, 'CAMBIO DE DIRECCION HIDRAULICA NUEVA NO ORIGINAL', 6500.00, 5);
INSERT INTO `ven_producto` VALUES (8, 1, 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA', 1000.00, 6);
INSERT INTO `ven_producto` VALUES (9, 1, 'MANO DE OBRA X COLOCACION DE CAJA DE SELENOIDES Y JUNTA', 350.00, 7);
INSERT INTO `ven_producto` VALUES (10, 1, 'JUEGO DE JUNTAS', 1300.00, 8);
INSERT INTO `ven_producto` VALUES (11, 1, 'JUEGO DE DISCOS DE PASTA', 1040.00, 8);
INSERT INTO `ven_producto` VALUES (12, 1, 'FILTRO', 200.00, 8);
INSERT INTO `ven_producto` VALUES (14, 12, 'LITROS DE ACEITE MERCON V', 80.00, 8);
INSERT INTO `ven_producto` VALUES (15, 1, 'TRANSMISION AUTOMATICA A CAMBIO.  INCLUYE: ACEITE, TURBINA Y TRANSMISION. DIRECCION HIDRAULICA RECONSTRUIDA A CAMBIO. 2 SOPORTES. VIATICOS', 18000.00, 9);
INSERT INTO `ven_producto` VALUES (16, 1, 'EMPACADO DE DIRECCION HIDRAULICA ', 2500.00, 10);
INSERT INTO `ven_producto` VALUES (17, 1, 'EMPACDO BOMBA DE DIRECCION HIDRAULICA', 1400.00, 10);
INSERT INTO `ven_producto` VALUES (18, 1, 'BALERO', 100.00, 10);
INSERT INTO `ven_producto` VALUES (19, 1, 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA', 1000.00, 11);
INSERT INTO `ven_producto` VALUES (20, 1, 'MANO DE OBRA POR BAJAR TRANSMISION AUTOMATICA', 1500.00, 12);
INSERT INTO `ven_producto` VALUES (21, 1, 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA', 1300.00, 12);
INSERT INTO `ven_producto` VALUES (22, 1, 'BUJES DE DIRECCION', 400.00, 13);
INSERT INTO `ven_producto` VALUES (23, 1, 'MANO DE OBRA', 400.00, 13);
INSERT INTO `ven_producto` VALUES (24, 1, 'JUNTA DE CARTER', 700.00, 14);
INSERT INTO `ven_producto` VALUES (25, 1, 'MANTENIMIENTO A LA TRASNMISION AUTYOMATICA', 1500.00, 14);
INSERT INTO `ven_producto` VALUES (26, 1, 'MANO DE OBRA POR AJUSTAR DIRECCION', 300.00, 15);
INSERT INTO `ven_producto` VALUES (27, 1, 'TORNILLOS ', 90.00, 15);
INSERT INTO `ven_producto` VALUES (28, 1, 'EMPACADO DE BOMBA HIDRAULICA', 1200.00, 16);
INSERT INTO `ven_producto` VALUES (29, 1, 'REPUESTO DE DIRECCIÓN DE SENTRA', 480.00, 17);
INSERT INTO `ven_producto` VALUES (30, 1, 'ACEITE MERCON V', 85.00, 17);
INSERT INTO `ven_producto` VALUES (32, 2, 'SENSORES', 600.00, 19);
INSERT INTO `ven_producto` VALUES (33, 1, 'HARNETS', 1500.00, 19);
INSERT INTO `ven_producto` VALUES (34, 1, 'MANO DE OBRA', 1200.00, 19);
INSERT INTO `ven_producto` VALUES (35, 1, 'REPARACION DE TRANSMISION AUTOMATICA SEGUN COTIZACION', 14560.00, 20);
INSERT INTO `ven_producto` VALUES (36, 1, 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA', 1400.00, 21);
INSERT INTO `ven_producto` VALUES (37, 1, 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA  6TO MES ', 1000.00, 22);
INSERT INTO `ven_producto` VALUES (38, 1, 'DIRECCION HIDRAULICA INSTALADA', 8000.00, 23);
INSERT INTO `ven_producto` VALUES (39, 1, 'BONBA DE DIRECCION HIDRAULICA  INSTALADA', 2600.00, 23);
INSERT INTO `ven_producto` VALUES (40, 2, 'ACEITE', 90.00, 23);
INSERT INTO `ven_producto` VALUES (41, 2, 'ACEITE MERCON V', 80.00, 24);
INSERT INTO `ven_producto` VALUES (42, 1, 'REPARACION DE TRANSMISION AUTOMATICA SEGUN COTIZACION', 9000.00, 25);
INSERT INTO `ven_producto` VALUES (43, 1, 'CARNETS NUEVO', 1500.00, 26);
INSERT INTO `ven_producto` VALUES (44, 2, 'JUNTA CUERPO DE VALVULAS', 80.00, 26);
INSERT INTO `ven_producto` VALUES (45, 1, 'BANDA DE REVERSA USADA', 500.00, 26);
INSERT INTO `ven_producto` VALUES (46, 1, 'VALERO USADO', 100.00, 26);
INSERT INTO `ven_producto` VALUES (47, 1, 'FILTRO 4X2', 140.00, 26);
INSERT INTO `ven_producto` VALUES (48, 1, 'JUNTA DE CARTER', 50.00, 26);
INSERT INTO `ven_producto` VALUES (49, 1, 'RETÉN DE COLA', 50.00, 26);
INSERT INTO `ven_producto` VALUES (50, 1, 'PORTA PLANETARIO', 500.00, 26);
INSERT INTO `ven_producto` VALUES (51, 10, 'ACEITE M5', 70.00, 26);
INSERT INTO `ven_producto` VALUES (52, 1, 'MANO DE OBRA POR CAMBIO DE ACEITE', 300.00, 27);
INSERT INTO `ven_producto` VALUES (53, 1, 'FILTRO', 250.00, 27);
INSERT INTO `ven_producto` VALUES (54, 1, 'REVISION DE VEHICULO', 100.00, 28);
INSERT INTO `ven_producto` VALUES (55, 1, 'MODULADOR A4LD', 450.00, 29);
INSERT INTO `ven_producto` VALUES (56, 1, 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA 3ER MES', 1200.00, 30);
INSERT INTO `ven_producto` VALUES (57, 1, 'EMPACADO DE DIRECCION HIDRAULICA', 1900.00, 31);
INSERT INTO `ven_producto` VALUES (58, 2, 'HORQUILLAS INFERIOR', 4750.00, 31);
INSERT INTO `ven_producto` VALUES (59, 2, 'HORQUILLAS SUPERIOR', 1600.00, 31);
INSERT INTO `ven_producto` VALUES (60, 2, 'VARILLAS', 400.00, 31);
INSERT INTO `ven_producto` VALUES (61, 2, 'TERMINALES', 450.00, 31);
INSERT INTO `ven_producto` VALUES (62, 1, 'MANO DE OBRA', 1800.00, 31);
INSERT INTO `ven_producto` VALUES (63, 1, 'CAMBIO DE ACEITE DEL TERCER MES', 1200.00, 32);
INSERT INTO `ven_producto` VALUES (64, 1, 'CAMBIO DE ACEITE DE CAJA DE VELOCIDADES ', 1300.00, 33);
INSERT INTO `ven_producto` VALUES (65, 1, 'CAMBIO DE MANGUERA DE RETROCESO DE DIRECCIÓN HIDRAULICA', 430.00, 34);
INSERT INTO `ven_producto` VALUES (66, 1, 'EMPACANDO DE DIRECCIÓN  HIDRAULICA', 1700.00, 35);
INSERT INTO `ven_producto` VALUES (67, 1, 'BARRA DE DIRECCIÓN NUEVA', 1800.00, 35);
INSERT INTO `ven_producto` VALUES (68, 1, 'BALERO DE DIRECCION', 250.00, 35);
INSERT INTO `ven_producto` VALUES (69, 1, 'AJUSTADOR DE DIRECCION', 250.00, 35);
INSERT INTO `ven_producto` VALUES (70, 1, 'TABLETA COLADERA', 1900.00, 36);
INSERT INTO `ven_producto` VALUES (71, 1, 'MANTENIMIENTO A LA CAJA DE  VELOCIDADEZ', 1200.00, 36);
INSERT INTO `ven_producto` VALUES (72, 1, 'MANO DE OBRA', 500.00, 36);
INSERT INTO `ven_producto` VALUES (73, 1, 'REPARACIÓN DE CHICOTE DE PALANCA SELECTORA', 750.00, 37);
INSERT INTO `ven_producto` VALUES (74, 4, 'LITROS DE ACEITE MERCON 5', 95.00, 38);
INSERT INTO `ven_producto` VALUES (75, 1, 'RETÉN DE FLECHA', 100.00, 39);
INSERT INTO `ven_producto` VALUES (76, 1, 'CAMBIO DE ACEITE DE LA TRANSMISION AUTOMATICA', 1000.00, 40);
INSERT INTO `ven_producto` VALUES (77, 1, 'MANGUERA', 100.00, 42);
INSERT INTO `ven_producto` VALUES (78, 1, 'PULIDO DE BARRA', 200.00, 42);
INSERT INTO `ven_producto` VALUES (79, 1, 'EMPACADO DE DIRECCION HIDRAULICA', 1700.00, 42);
INSERT INTO `ven_producto` VALUES (80, 1, 'REPARACION DE TRANSMISION AUTOMATICA SEGUN COTIZACION', 13600.00, 43);
INSERT INTO `ven_producto` VALUES (81, 1, 'RETÉN TURBINA TIIDA', 100.00, 44);
INSERT INTO `ven_producto` VALUES (82, 1, 'SCANEO DE VEHÍCULO RENAULT SANDERO ROJO', 100.00, 45);
INSERT INTO `ven_producto` VALUES (83, 1, 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA', 1000.00, 46);
INSERT INTO `ven_producto` VALUES (84, 1, 'REPARACION DE CHICOTE DE PALANCA', 700.00, 47);
INSERT INTO `ven_producto` VALUES (85, 1, 'CAMBIO DE SOPORTE DE LA CAJA DE VELOCIDADES', 1480.00, 48);
INSERT INTO `ven_producto` VALUES (86, 1, 'MANO DE OBRA', 300.00, 48);
INSERT INTO `ven_producto` VALUES (87, 1, 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA', 1200.00, 49);
INSERT INTO `ven_producto` VALUES (88, 1, 'MANO DE OBRA POR INSTALACION DE DIRECCION HIDRAULICA', 600.00, 50);
INSERT INTO `ven_producto` VALUES (89, 1, 'BOMBA DE DIRECCION HIDRAULICA', 1500.00, 51);
INSERT INTO `ven_producto` VALUES (90, 1, 'EMPACADO DE BOMBA HIDRAULICA', 1000.00, 52);
INSERT INTO `ven_producto` VALUES (91, 1, 'BALERO', 150.00, 52);
INSERT INTO `ven_producto` VALUES (92, 1, 'ACEITE MERCON V', 95.00, 53);
INSERT INTO `ven_producto` VALUES (93, 1, 'JUEGO DE JUNTAS CON PISTONES', 4800.00, 54);
INSERT INTO `ven_producto` VALUES (94, 1, 'JUEGO DE DISCOS DE PASTA', 1800.00, 54);
INSERT INTO `ven_producto` VALUES (95, 1, 'FILTRO', 140.00, 54);
INSERT INTO `ven_producto` VALUES (96, 1, 'TURBIN', 1900.00, 54);
INSERT INTO `ven_producto` VALUES (97, 10, 'ACEITE MERCON V', 80.00, 54);
INSERT INTO `ven_producto` VALUES (98, 3, 'ACEITE MERCON V', 80.00, 55);
INSERT INTO `ven_producto` VALUES (99, 1, 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA', 1500.00, 56);
INSERT INTO `ven_producto` VALUES (100, 1, 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA', 1200.00, 57);
INSERT INTO `ven_producto` VALUES (101, 2, 'ACEITE  MERCON V', 80.00, 58);
INSERT INTO `ven_producto` VALUES (102, 1, 'REPARACION DE TRANSMISION AUTOMATICA SEGUN COTIZACION', 9000.00, 59);
INSERT INTO `ven_producto` VALUES (103, 1, 'REPARACIÓN DEL CHICOTE DE PALANCA  DE VELOCIDADES  ', 800.00, 60);
INSERT INTO `ven_producto` VALUES (104, 1, 'CAMBIO  DE ACEITE DE LA TRANSMISIÓN  AUTOMÁTICA ', 1000.00, 60);
INSERT INTO `ven_producto` VALUES (105, 1, 'ACEITE ATF III', 60.00, 61);
INSERT INTO `ven_producto` VALUES (106, 1, 'REPARACION DE TRANSMISION AUTOMATICA SEGUN COTIZACION', 11500.00, 62);
INSERT INTO `ven_producto` VALUES (107, 1, 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA 6TO MES', 1200.00, 63);
INSERT INTO `ven_producto` VALUES (108, 1, 'MANO DE OBRA POR CAMBIO DE RETEN LATERAL LADO DERECHO', 800.00, 64);
INSERT INTO `ven_producto` VALUES (109, 1, 'MANTENIMIENTO  A LA TRANSMISION AUTOMATICA 3ER MES', 1200.00, 65);
INSERT INTO `ven_producto` VALUES (110, 1, 'MANTENIMIENTO A LA TRANSMISION AUTOMATICA', 1200.00, 66);
INSERT INTO `ven_producto` VALUES (111, 1, 'BARRA DE DIRECCION HIDRAUICA GOL', 1800.00, 67);
INSERT INTO `ven_producto` VALUES (112, 1, 'REPUESTO DE DIRECCION GOL', 750.00, 67);
INSERT INTO `ven_producto` VALUES (113, 1, 'DIRECCION HIDRAULICA NUEVA NO ORIGINAL ECOSPORT FORD 2008\r\nCOMPLEMENTO DE FACTURA A285 ', 1120.00, 68);
INSERT INTO `ven_producto` VALUES (114, 1, 'ACEITE ATF III', 60.00, 68);

-- ----------------------------
-- Table structure for ven_recibo
-- ----------------------------
DROP TABLE IF EXISTS `ven_recibo`;
CREATE TABLE `ven_recibo`  (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_nomcliente` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rec_cantidad` decimal(11, 2) NOT NULL,
  `rec_concepto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rec_nomresponsable` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rec_fecha` date NOT NULL,
  `rec_folio` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`rec_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ven_ventas
-- ----------------------------
DROP TABLE IF EXISTS `ven_ventas`;
CREATE TABLE `ven_ventas`  (
  `ven_id` int(11) NOT NULL AUTO_INCREMENT,
  `ven_folio` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_fecha` date NOT NULL,
  `ven_nombre` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_paterno` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_materno` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_domicilio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_ciudad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_rfc` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_vehiculo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_modelo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_placa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_tecnico` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_oi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ven_garantia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ven_id`) USING BTREE,
  INDEX `ven_fkfolio`(`ven_folio`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ven_ventas
-- ----------------------------
INSERT INTO `ven_ventas` VALUES (1, 'NOTA-1', '2019-11-25', 'SR FERNANDO ALBERTO ', 'DIVES', 'PEREZ', '', 'VILLAHERMOSA', '', 'JETTA', 'BLANCO', '2013', 'VW-332-A', 'JOVINO', '21996', '6 MESES SEGUN FORMATO ANEXO');
INSERT INTO `ven_ventas` VALUES (2, 'NOTA-2', '2019-11-25', 'SR. JOSE JUAN', ' VAZCONCELOS ', '', '', '', '', 'CHEVY', 'SUELTA', '2002', 'SUELTA', 'MOISES', '1', '90 DIAS DE GARANTIA EN EL SERVICIO REALIZADO');
INSERT INTO `ven_ventas` VALUES (3, 'NOTA-3', '2019-11-25', 'SR. MARIO', 'ANDRADE', '  MOSQUEDA', '', '', '99341125927', 'HILUX', 'BLANCO', '2012', 'VM-37-833', 'MOISES', 'S.O.', '60 DIAS DE GARANTIAS EN EL SERVICIO REALIZADO');
INSERT INTO `ven_ventas` VALUES (4, 'NOTA-4', '2019-11-25', 'SR. REFUGIO', 'torres', '', '', '', '9932287090', 'aveo', 'ROJO', '2013', 'WSX-2338', 'MOYSES', 'S.O', '90 DIAS DE GARANTIA ');
INSERT INTO `ven_ventas` VALUES (5, 'NOTA-5', '2019-11-25', 'SR. WILLIAM ENRIQUE', 'SALVADOR', 'FERNANDEZ', '', '', '9341060303', 'LUPO', 'NEGRO', '2006', 'DJN-15-16', 'MOISES', '2', '90 DIAS DE GARANTIA EN EL SERVICIO REALIZADO');
INSERT INTO `ven_ventas` VALUES (6, 'NOTA-6', '2019-11-26', 'SR. JESUS', 'PALOMEQUE', '', '', 'VILLAHERMOSA', '9931988509', 'TORRENT PONTIAC', 'GRIS', '2008', 'WTU-68-11', 'JOVINO', '7', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (7, 'NOTA-7', '2019-11-26', 'JUAN REYES', 'RUIZ', 'GARCIA', '', '', '9931169802', 'JOURNEY', 'ROJO VINO', '2011', 'WTV-17-00', 'JESUS', '21997', '');
INSERT INTO `ven_ventas` VALUES (8, 'NOTA-8', '2019-11-26', 'SR. JUAN ALBERTO', 'LEYVA', '', '', '', '9932502043', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (9, 'NOTA-9', '2019-11-27', 'SR. FELIPE ', 'BALCAZAR ', 'LOPEZ', '', 'VILLAHERMOSA', '9935611246', 'FOCUS', 'SUELTA', '2001', 'SUELTA', 'ESTEBAN', '3', '\" 6  MESES DE GARANTIA SEGUN FOERMATO ANEXO \"');
INSERT INTO `ven_ventas` VALUES (10, 'NOTA-10', '2019-11-27', 'SR. EDUARDO ', 'MACIAS', '', '', 'VILLAHERMOSA', '9933200749', 'ODYSSEY', 'BLANCO', '2011', 'WSW-81-06', 'MOISES', '5', '90 DIAS DE GARANTIA EN EL SERVICIO REALIZADO');
INSERT INTO `ven_ventas` VALUES (11, 'NOTA-11', '2019-11-27', 'SR. ESTEBAN', 'ALAMILLA ', 'ROBLES', '', 'VILLAHERMOSA', '9933023174', 'ATITUDE', 'BLANCO', '2010', 'WTA-60-83', 'MOISES', '17', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (12, 'NOTA-12', '2019-11-27', 'MARCOS ROBERTO', 'NIETO ', 'QUEVEDO', '', 'VILLAHERMOSA', '9931903612', 'TAHOE', 'BLANCO', '2007', 'WTS-68-78', 'JOVINO', '8', '60 DIAS DE GARANTIAS EN EL SERVICIO REALIZADO');
INSERT INTO `ven_ventas` VALUES (13, 'NOTA-13', '2019-11-27', 'JORGE', 'HERNANDEZ', 'MAY', '', '', '9931704072', 'TSURU', 'AMARILLO', '2013', '99-10-VMF', 'MOISES', '16', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (14, 'NOTA-14', '2019-11-27', 'JUAN MANUEL', 'MARTINEZ', '', '', '', '9933300885', 'LOBO KINGSTON RANCH', 'BLANCO', '2011', 'VM-75-782', 'VICTOR', '13', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (15, 'NOTA-15', '2019-11-27', 'AULICER', 'HERNANDEZ', 'RUIZ', '', '', '9934186843', 'POLO', 'CAFE', '2003', 'DPY-8193', 'MOISES', '15', '');
INSERT INTO `ven_ventas` VALUES (16, 'NOTA-16', '2019-11-27', 'EMMANUEL ', 'ZAPATA', 'HERNANDEZ', '', '', '9934366147', 'FIESTA', 'AZUL', '2003', 'DHE-77-57', 'MOISES', '18', '\" 60 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (17, 'NOTA-17', '2019-11-29', 'Carlos mario', 'Zamudio', 'Torres', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (19, 'NOTA-18', '2019-11-29', 'MIGUEL', 'GARCIA', '', '', '', '9931912422', 'MALIBU', 'AZUL', '2000', 'WUB-91-42', 'TEC. JESUS/CHEO', '4', '60 DIAS DE GARANTIAS EN EL SERVICIO REALIZADO');
INSERT INTO `ven_ventas` VALUES (20, 'NOTA-19', '2019-11-29', 'RITA', 'MARIN', '', '', '', '9341072881', 'LOBO', 'NEGRO', '2005', 'VM-36-739', 'TEC. JOVINO', 'S.O.', '\" 6  MESES DE GARANTIA SEGUN FORMATO ANEXO \"');
INSERT INTO `ven_ventas` VALUES (21, 'NOTA-20', '2019-11-30', 'NELLY ', 'HERNANDEZ ', 'CASTILLO', '', '', '9932192727', 'VERSA', 'ROJO', '2015', 'WTX-57-58', 'VICTOR', '28', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (22, 'NOTA-21', '2019-11-30', 'CARLOS AUGUSTO', 'LOPEZ', '', '', '', '9935133151', 'NEON', 'ROJO', '2001', 'WUB-81-96', 'JOVINO', '29', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO\"');
INSERT INTO `ven_ventas` VALUES (23, 'NOTA-22', '2019-11-30', 'ABENAMAR', 'GIRON', 'SANTIAGO', '', '', '9372833817', 'EUROVAN', 'BLANCO', '2008', 'VM-44-581', 'MOISES', '21', '90 DIAS DE GARANTIA EN EL SERVICIO REALIZADO');
INSERT INTO `ven_ventas` VALUES (24, 'NOTA-23', '2019-11-30', '	ABENAMAR ', 'GIRON ', 'SANTIAGO', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (25, 'NOTA-24', '2019-11-30', 'MARIA LUISA', 'OJEDA', '', '', '', '9935901855', 'SENTRA', 'NEGRO', '2013', 'MYD-93-56', 'ESTEBAN', '21749', '6 MESES SEGUN FORMATO ANEXO');
INSERT INTO `ven_ventas` VALUES (26, 'NOTA-25', '2019-11-30', 'Gilberto', 'Ramos', 'Perez', 'Conocido', '', '', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (27, 'NOTA-26', '2019-11-30', 'MIGUEL ', 'ARTEAGA', '', '', '', '9982708394', 'RAV 4', 'GRIS', '2006', 'DJP-70-61', 'VICTOR', '30', '');
INSERT INTO `ven_ventas` VALUES (28, 'NOTA-27', '2019-12-02', 'GUILLERMO', 'PRIETO', '', '', '', '', 'FIESTA', '', '2007', '', 'ESTEBAN', '', '');
INSERT INTO `ven_ventas` VALUES (29, 'NOTA-28', '2019-12-02', 'REMIGIO', 'LOPEZ', 'DE LA CRUZ', '', '', '9141002253', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (30, 'NOTA-29', '2019-12-02', 'JOSE FRANCISCO', 'OLAN', '', '', '', '9931972177', 'STRATUS', 'BLANCO', '2006', 'WTY-18-51', 'VICTOR', '34', '\" AMPLIACION DE GARANTIA SEGUN FORMATO ANEXO \"');
INSERT INTO `ven_ventas` VALUES (31, 'NOTA-30', '2019-12-02', 'THELMA', 'ROMERO', '', '', '', '9932206400', 'MAZDA 6', 'AZUL', '2009', 'WMA-129-A', 'MOISES/MANUEL', '20', '\" 90 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (32, 'NOTA-31', '2019-12-03', 'SR. Carlos', 'Hernandez', 'Alcaraz', '', '', '', 'Lobo', 'Azul', '2007', 'VM-71-762', 'Jovino- victor', '35', '');
INSERT INTO `ven_ventas` VALUES (33, 'NOTA-32', '2019-12-03', 'Sr. Pedro ', 'Alberto', 'Gonzales', '', '', '', 'March', 'Cobre', '2012', 'WTV-44-35', 'Jesús- victor', '36', '30 días de garantía por el servicio prestado');
INSERT INTO `ven_ventas` VALUES (34, 'NOTA-33', '2019-12-03', 'SR. Mario', 'Hernandez', 'Feria', '', '', '', 'Aveo', 'Negro', '2014', 'WUC-40-58', 'Moyses', '38', '30 días de garantía por el servicio prestado');
INSERT INTO `ven_ventas` VALUES (35, 'NOTA-34', '2019-12-03', 'SR. Miguel  ', 'Perdomo', 'Cerino', 'Conocido', '', '9933096761', 'Ranger', 'Blanco', '2002', 'Vr-45-683', 'Moyses', '37', '');
INSERT INTO `ven_ventas` VALUES (36, 'NOTA-35', '2019-12-03', 'Javier alonzo', 'Lopez', 'Arevalo', 'Conocido', '', '9932282172', 'Cruze', '', '2013', 'WSW-11-73', 'Esteban', '32', '30 días de garantía por el servicio prestado');
INSERT INTO `ven_ventas` VALUES (37, 'NOTA-36', '2019-12-03', 'Jaime', 'Torrez', '', 'Conocido', '', '99 31 52 90 26', 'Yaris', 'Negro', '2009', 'WTS-51-01', 'Jovino', '39', '30 días de garantía por el servicio prestado');
INSERT INTO `ven_ventas` VALUES (38, 'NOTA-37', '2019-12-04', 'SR. Jesus', 'Predraza', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (39, 'NOTA-38', '2019-12-04', 'Mostradror ', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (40, 'NOTA-39', '2019-12-04', 'JUAN MARCOS', 'BEDOLLA', 'DE CASTRO', '', '', '9935918231', 'SONIC', 'GRIS', '2014', 'WTT-31-41', 'JORGE', '41', '');
INSERT INTO `ven_ventas` VALUES (42, 'NOTA-40', '2019-12-04', 'LUIS ROBERTO', '', '', '', '', '9933080925', 'AVEO', 'NEGRO', '2014', 'WSB-81-84', 'MOISES', '44', '90 DIAS DE GARANTIA EN EL SERVICIO REALIZADO');
INSERT INTO `ven_ventas` VALUES (43, 'NOTA-41', '2019-12-04', 'ULISES', 'HERNANDEZ ', 'ROMERO', '', '', '9931600158', 'TORRENT', 'SUELTA', '2007', 'SUELTA', 'ESTEBAN', '23', '\" 6  MESES DE GARANTÍA SEGÚN FORMATO ANEXO \"');
INSERT INTO `ven_ventas` VALUES (44, 'NOTA-42', '2019-12-05', 'Antonio', 'Miranda', 'Guzman', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (45, 'NOTA-43', '2019-12-05', 'PUBLICO', 'GENERAL', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (46, 'NOTA-44', '2019-12-05', 'UBELMAR', 'LOPEZ', 'PALACIOS', '', '', '9161659974', 'JOURNEY', 'ROJO', '2009', 'DSU-68-16', ' VICTOR', '52', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO\"');
INSERT INTO `ven_ventas` VALUES (47, 'NOTA-45', '2019-12-05', 'YVES DE DIOS', '', '', '', '', '9931100132', 'TIIDA', 'CAFE', '2007', 'WLW-457-A', 'JOVINO', '50', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (48, 'NOTA-46', '2019-12-05', 'JAVIER ALONSO', 'AREVALOS', '', '', '', '9932282172', 'CRUZE', 'BLANCO', '2013', 'WSW-11-73', 'ESTEBAN', '47', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (49, 'NOTA-47', '2019-12-05', 'DANIEL', 'MIRANDA', '', '', '', '9931577780', 'F150', 'BLANCO', '2010', 'VR-51-633', 'JORGE', '54', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (50, 'NOTA-48', '2019-12-05', 'JOSE', 'CERINO', '', '', '', '9932620055', 'RANGER', 'BLANCO', '2004', 'VM-52-541', 'MOISES', '49', '');
INSERT INTO `ven_ventas` VALUES (51, 'NOTA-49', '2019-12-06', 'JORGE', 'COLLADO', '', '', '', '9933956260', '', '', '', '', '', '', 'SIN GARANTIA');
INSERT INTO `ven_ventas` VALUES (52, 'NOTA-50', '2019-12-06', 'JOSE DEL CARMEN ', 'DIAZ', '', '', '', '9931117680', 'SENTRA', 'SUELTA', '2004', 'SUELTA', 'MOISES', '57', '60 DIAS DE GARANTIA EN EL SERVICIO REALIZADO');
INSERT INTO `ven_ventas` VALUES (53, 'NOTA-51', '2019-12-07', 'PUBLICO', 'GENERAL', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (54, 'NOTA-52', '2019-12-07', 'DOLORES', 'GOMEZ ', 'DIAZ', '', '', '9381402075', '', '', '', '', '', '', 'RAV 2005');
INSERT INTO `ven_ventas` VALUES (55, 'NOTA-53', '2019-12-07', 'LUCIANO', 'GIRON', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (56, 'NOTA-54', '2019-12-07', 'JOEL', 'ROSAS', '', '', '', '2227250531', 'SENTRA', 'BLANCO', '2013', 'TXX-27-75', 'MOISES', '60', 'SE ENCONTRO RESIDUOS EN EL ACEITE DEL VEHICULO YA ESTA ENTERADO EL CLIENTE HAY QUE CHECAR EL FUNCIONAMIENTO DEL VEHICULO');
INSERT INTO `ven_ventas` VALUES (57, 'NOTA-55', '2019-12-07', 'ELOY', 'GARIBAY', '', '', '', '9931757197', 'TOWN COUNTRY', 'ROJO', '1998', 'XKH-74-18', 'JORGE', '61', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (58, 'NOTA-56', '2019-12-07', 'LUCIANO', 'GIRON', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (59, 'NOTA-57', '2019-12-07', 'JOSE  GUADALUPE', 'PEREZ', '', '', '', '9321031051', 'EXPLORER', 'ROJO', '2002', 'WTG-80-84', 'JESUS', '31', '\" 6  MESES DE GARANTIA SEGUN FORMATO ANEXO \"');
INSERT INTO `ven_ventas` VALUES (60, 'NOTA-58', '2019-12-07', 'BLANCA', 'FUENTES', '', '', '', '9931678150', 'VERSA', 'GRIS', '2013', 'WTW-91-94', 'JOVINO', '58', '30 días de garantía por el servicio prestado');
INSERT INTO `ven_ventas` VALUES (61, 'NOTA-59', '2019-12-09', 'VICTOR ', 'MEDEL', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (62, 'NOTA-60', '2019-12-09', 'ABELARDO ', 'LOPEZ', '', '', '', '9932203960', 'DAKOTA', 'SUELTA', '2009', 'SUELTA', 'JESUS', '27', '\" 6  MESES DE GARANTIA SEGUN FORMATO ANEXO \"');
INSERT INTO `ven_ventas` VALUES (63, 'NOTA-61', '2019-12-09', 'SERVANDO ', 'CALACUAYO', '', '', '', '9932830002', 'JETTA', 'GRIS', '2006', 'WPG-44-38', 'ABRAHAN', '63', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (64, 'NOTA-62', '2019-12-09', 'ROBERTO ', '', '', '', '', '9935901275', 'OUTLANDER', 'BLANCO', '2009', 'WTT-56-17', 'JORGE', '62', '');
INSERT INTO `ven_ventas` VALUES (65, 'NOTA-63', '2019-12-09', 'FRANCISCO ', 'OSORIO', '', '', '', '9933110829', 'DAKOTA', 'BLANCO', '2006', 'VM-53-472', 'JOVINO/JORGE', '71', '\" AMPLIACION DE GARANTIA SEGUN FORMATO ANEXO \"');
INSERT INTO `ven_ventas` VALUES (66, 'NOTA-64', '2019-12-09', 'LUIS ', 'HERNANDEZ', '', '', '', '3500208', 'COLORADO', 'BLANCO', '2007', 'VS-34-912', 'JORGE', '72', '\" 30 DIAS DE GARANTIA EN EL SERVICIO REALIZADO \"');
INSERT INTO `ven_ventas` VALUES (67, 'NOTA-65', '2019-12-09', 'FAUSTO', 'VELOZ', 'SANCHEZ', '', '', '9932337030', '', '', '', '', '', '', '');
INSERT INTO `ven_ventas` VALUES (68, 'NOTA-66', '2019-12-09', 'JOSE MANUEL ', 'RUIZ', 'LISCANO', '', '', '9932294102', 'ECOSPORT', '', '2008', 'SUELTA', 'ESTEBAN', '64', '90 DIAS DE GARANTIA');

SET FOREIGN_KEY_CHECKS = 1;
