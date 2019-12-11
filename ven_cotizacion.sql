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

 Date: 10/12/2019 20:35:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ven_cotizacion
-- ----------------------------
DROP TABLE IF EXISTS `ven_cotizacion`;
CREATE TABLE `ven_cotizacion`  (
  `cot_id` int(11) NOT NULL AUTO_INCREMENT,
  `cot_folio` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cot_fecha` date NULL DEFAULT NULL,
  `cot_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cot_nonuevoscontratos` int(11) NULL DEFAULT NULL,
  `cot_nocont` int(11) NULL DEFAULT NULL,
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
  `cot_fkuser` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cot_id`) USING BTREE,
  INDEX `cot_fkuser`(`cot_fkuser`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ven_detalle
-- ----------------------------
DROP TABLE IF EXISTS `ven_detalle`;
CREATE TABLE `ven_detalle`  (
  `det_id` int(11) NOT NULL AUTO_INCREMENT,
  `det_cantidad` int(11) NULL DEFAULT NULL,
  `det_partida` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `det_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `det_unitario` decimal(11, 2) NULL DEFAULT NULL,
  `det_fkcotizacion` int(11) NOT NULL,
  PRIMARY KEY (`det_id`) USING BTREE,
  INDEX `det_fkcotizacion`(`det_fkcotizacion`) USING BTREE,
  CONSTRAINT `ven_detalle_ibfk_1` FOREIGN KEY (`det_fkcotizacion`) REFERENCES `ven_cotizacion` (`cot_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
