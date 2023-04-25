/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : wx_erp

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 24/04/2023 19:56:37
*/


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wx_category
-- ----------------------------
DROP TABLE IF EXISTS `wx_category`;
CREATE TABLE `wx_category`  (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父级分类ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `fk_parent_id_category` FOREIGN KEY (`parent_id`) REFERENCES `wx_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_category
-- ----------------------------

-- ----------------------------
-- Table structure for wx_department
-- ----------------------------
DROP TABLE IF EXISTS `wx_department`;
CREATE TABLE `wx_department`  (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父级部门ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `fk_parent_id_department` FOREIGN KEY (`parent_id`) REFERENCES `wx_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_department
-- ----------------------------
INSERT INTO `wx_department` VALUES (0, 'root', 0, '2023-04-12 11:20:56', '2023-04-12 11:21:00');
INSERT INTO `wx_department` VALUES (8, 'cloud', 0, '2023-04-12 11:23:31', '2023-04-12 11:23:31');
INSERT INTO `wx_department` VALUES (9, '华南总集团', 8, '2023-04-12 11:24:45', '2023-04-12 11:24:45');

-- ----------------------------
-- Table structure for wx_employee
-- ----------------------------
DROP TABLE IF EXISTS `wx_employee`;
CREATE TABLE `wx_employee`  (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '员工姓名',
  `gender` int(11) NOT NULL DEFAULT 0 COMMENT '性别：0-未知，1-男，2-女',
  `age` int(11) NOT NULL COMMENT '年龄',
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地址',
  `department_id` int(11) NOT NULL COMMENT '所属部门ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_department_id`(`department_id`) USING BTREE,
  CONSTRAINT `fk_department_id_employee` FOREIGN KEY (`department_id`) REFERENCES `wx_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_employee
-- ----------------------------
INSERT INTO `wx_employee` VALUES (1, 'lilinxi', 1, 20, '17744937947', 'lilinxi015@163.com', '广东深圳', 8, '2023-04-12 11:29:19', '2023-04-12 11:29:19');

-- ----------------------------
-- Table structure for wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu`;
CREATE TABLE `wx_menu`  (
  `id` int(32) NOT NULL COMMENT '主键',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父id',
  `meta_id` int(11) NULL DEFAULT NULL COMMENT '元数据',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `META_ID`(`meta_id`) USING BTREE,
  INDEX `PARENT_ID`(`parent_id`) USING BTREE,
  CONSTRAINT `META_ID` FOREIGN KEY (`meta_id`) REFERENCES `wx_meta` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `PARENT_ID` FOREIGN KEY (`parent_id`) REFERENCES `wx_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_menu
-- ----------------------------
INSERT INTO `wx_menu` VALUES (1, '/home/index', 'home', '/home/index', NULL, NULL, 1);
INSERT INTO `wx_menu` VALUES (2, '/proTable', 'proTable', '/proTable/useProTable', NULL, NULL, 2);
INSERT INTO `wx_menu` VALUES (3, '/proTable/useProTable', 'useProTable', '/proTable/useProTable/index', NULL, 2, 3);
INSERT INTO `wx_menu` VALUES (4, '/proTable/useProTable/detail/:id', 'useProTableDetail', '/proTable/useProTable/detai', NULL, 3, 4);

-- ----------------------------
-- Table structure for wx_meta
-- ----------------------------
DROP TABLE IF EXISTS `wx_meta`;
CREATE TABLE `wx_meta`  (
  `id` int(32) NOT NULL COMMENT '主键',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `enable_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接',
  `enable_hide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否隐藏',
  `enable_full` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否填充',
  `enable_affix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enable_keep_alive` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否激活',
  `active_menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '激活菜单',
  `deleted` int(32) NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_meta
-- ----------------------------
INSERT INTO `wx_meta` VALUES (1, 'HomeFilled', '首页', '', 'false', 'false', 'true', 'true', NULL, 0);
INSERT INTO `wx_meta` VALUES (2, 'MessageBox', '超级表格', NULL, 'false', 'false', 'false', 'true', NULL, 0);
INSERT INTO `wx_meta` VALUES (3, 'Menu', '使用 ProTable', NULL, 'false', 'false', 'false', 'true', NULL, 0);
INSERT INTO `wx_meta` VALUES (4, 'Menu', 'ProTable 详情', NULL, 'true', 'false', 'false', 'true', '/proTable/useProTable', 0);
INSERT INTO `wx_meta` VALUES (5, 'fsdfss', 'sdfsdfds', NULL, 'sdfsd', 'fs', 'fs', 'fs', ' ', 1);

-- ----------------------------
-- Table structure for wx_product
-- ----------------------------
DROP TABLE IF EXISTS `wx_product`;
CREATE TABLE `wx_product`  (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `category_id` int(11) NOT NULL COMMENT '所属分类ID',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_id`(`category_id`) USING BTREE,
  CONSTRAINT `fk_category_id_product` FOREIGN KEY (`category_id`) REFERENCES `wx_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_product
-- ----------------------------

-- ----------------------------
-- Table structure for wx_purchase
-- ----------------------------
DROP TABLE IF EXISTS `wx_purchase`;
CREATE TABLE `wx_purchase`  (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '采购单ID',
  `employee_id` int(11) NOT NULL COMMENT '员工ID',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `supplier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商',
  `quantity` int(11) NOT NULL COMMENT '采购数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '采购金额',
  `status` int(11) NOT NULL COMMENT '状态：0-草稿，1-待审核，2-已审核，-1-审核不通过',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_employee_id`(`employee_id`) USING BTREE,
  INDEX `idx_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `fk_employee_id_purchase` FOREIGN KEY (`employee_id`) REFERENCES `wx_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_id_purchase` FOREIGN KEY (`product_id`) REFERENCES `wx_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采购单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for wx_sale
-- ----------------------------
DROP TABLE IF EXISTS `wx_sale`;
CREATE TABLE `wx_sale`  (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '销售单ID',
  `employee_id` int(11) NOT NULL COMMENT '员工ID',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `customer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名称',
  `quantity` int(11) NOT NULL COMMENT '销售数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '销售金额',
  `status` int(11) NOT NULL COMMENT '状态：0-草稿，1-待审核，2-已审核，-1-审核不通过',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_employee_id`(`employee_id`) USING BTREE,
  INDEX `idx_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `fk_employee_id_sale` FOREIGN KEY (`employee_id`) REFERENCES `wx_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_id_sale` FOREIGN KEY (`product_id`) REFERENCES `wx_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '销售单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_sale
-- ----------------------------

-- ----------------------------
-- Table structure for wx_stock
-- ----------------------------
DROP TABLE IF EXISTS `wx_stock`;
CREATE TABLE `wx_stock`  (
  `product_id` int(32) NOT NULL COMMENT '商品ID',
  `quantity` int(11) NOT NULL DEFAULT 0 COMMENT '库存数量',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`product_id`) USING BTREE,
  CONSTRAINT `fk_product_id_stock` FOREIGN KEY (`product_id`) REFERENCES `wx_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_stock
-- ----------------------------

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user`  (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `status` int(11) NOT NULL COMMENT '状态：1-正常，0-禁用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_user
-- ----------------------------
INSERT INTO `wx_user` VALUES (2, 'admin1', '123456', 'lilinxi015@163.com', '17733101039', 1, '2023-04-11 14:54:36', '2023-04-12 11:02:55');
INSERT INTO `wx_user` VALUES (3, 'admin3', '123456', 'lilinxi015@163.com', '17744937947', 1, '2023-04-11 14:54:55', '2023-04-11 14:54:55');
INSERT INTO `wx_user` VALUES (4, 'admin', '123456', 'lilinxi015@163.com', '17744937947', 1, '2023-04-11 16:26:12', '2023-04-11 16:26:12');

SET FOREIGN_KEY_CHECKS = 1;

