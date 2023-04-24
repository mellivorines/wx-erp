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
CREATE TABLE `wx_category`
(
    `id`          int                                    NOT NULL AUTO_INCREMENT COMMENT '分类ID',
    `name`        varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
    `parent_id`   int                                    NOT NULL DEFAULT '0' COMMENT '父级分类ID',
    `create_time` datetime                               NOT NULL COMMENT '创建时间',
    `update_time` datetime                               NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_parent_id` (`parent_id`),
    CONSTRAINT `fk_parent_id_category` FOREIGN KEY (`parent_id`) REFERENCES `wx_category` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='商品分类表';

-- ----------------------------
-- Records of wx_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_department
-- ----------------------------
DROP TABLE IF EXISTS `wx_department`;
CREATE TABLE `wx_department`
(
    `id`          int                                    NOT NULL AUTO_INCREMENT COMMENT '部门ID',
    `name`        varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
    `parent_id`   int                                    NOT NULL DEFAULT '0' COMMENT '父级部门ID',
    `create_time` datetime                               NOT NULL COMMENT '创建时间',
    `update_time` datetime                               NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_parent_id` (`parent_id`),
    CONSTRAINT `fk_parent_id_department` FOREIGN KEY (`parent_id`) REFERENCES `wx_department` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='部门表';

-- ----------------------------
-- Records of wx_department
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_employee
-- ----------------------------
DROP TABLE IF EXISTS `wx_employee`;
CREATE TABLE `wx_employee`
(
    `id`            int                                     NOT NULL AUTO_INCREMENT COMMENT '员工ID',
    `name`          varchar(50) COLLATE utf8mb4_general_ci  NOT NULL COMMENT '员工姓名',
    `gender`        int                                     NOT NULL DEFAULT '0' COMMENT '性别：0-未知，1-男，2-女',
    `age`           int                                     NOT NULL COMMENT '年龄',
    `mobile`        varchar(50) COLLATE utf8mb4_general_ci  NOT NULL COMMENT '手机号',
    `email`         varchar(50) COLLATE utf8mb4_general_ci  NOT NULL COMMENT '邮箱',
    `address`       varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '地址',
    `department_id` int                                     NOT NULL COMMENT '所属部门ID',
    `create_time`   datetime                                NOT NULL COMMENT '创建时间',
    `update_time`   datetime                                NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_department_id` (`department_id`),
    CONSTRAINT `fk_department_id_employee` FOREIGN KEY (`department_id`) REFERENCES `wx_department` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='员工信息表';

-- ----------------------------
-- Records of wx_employee
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu`;
CREATE TABLE `wx_menu`
(
    `id`        int NOT NULL COMMENT '主键',
    `path`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路径',
    `name`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
    `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件',
    `redirect`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '重定向',
    `parent_id` int                                                           DEFAULT NULL COMMENT '父id',
    `meta_id`   int                                                           DEFAULT NULL COMMENT '元数据id',
    PRIMARY KEY (`id`),
    KEY `parent_id` (`parent_id`),
    KEY `META_ID` (`meta_id`),
    CONSTRAINT `META_ID` FOREIGN KEY (`meta_id`) REFERENCES `wx_meta` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `parent_id` FOREIGN KEY (`parent_id`) REFERENCES `wx_menu` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='菜单表';

-- ----------------------------
-- Records of wx_menu
-- ----------------------------
BEGIN;
INSERT INTO `wx_menu` (`id`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta_id`)
VALUES (1, '/home/index', 'home', '/home/index', NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for wx_meta
-- ----------------------------
DROP TABLE IF EXISTS `wx_meta`;
CREATE TABLE `wx_meta`
(
    `id`                int NOT NULL AUTO_INCREMENT COMMENT '主键',
    `icon`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
    `title`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
    `enable_link`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '允许链接',
    `enable_hide`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '允许隐藏',
    `enable_full`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '允许填充',
    `enable_affix`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `enable_keep_alive` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '允许保持',
    `active_menu`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '激活菜单',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='元数据表';

-- ----------------------------
-- Records of wx_meta
-- ----------------------------
BEGIN;
INSERT INTO `wx_meta` (`id`, `icon`, `title`, `enable_link`, `enable_hide`, `enable_full`, `enable_affix`,
                       `enable_keep_alive`, `active_menu`)
VALUES (1, 'HomeFilled', '首页', '', 'false', 'false', 'true', 'true', NULL);
COMMIT;

-- ----------------------------
-- Table structure for wx_product
-- ----------------------------
DROP TABLE IF EXISTS `wx_product`;
CREATE TABLE `wx_product`
(
    `id`          int                                    NOT NULL AUTO_INCREMENT COMMENT '商品ID',
    `name`        varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
    `category_id` int                                    NOT NULL COMMENT '所属分类ID',
    `price`       decimal(10, 2)                         NOT NULL COMMENT '价格',
    `stock`       int                                    NOT NULL DEFAULT '0' COMMENT '库存',
    `create_time` datetime                               NOT NULL COMMENT '创建时间',
    `update_time` datetime                               NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_category_id` (`category_id`),
    CONSTRAINT `fk_category_id_product` FOREIGN KEY (`category_id`) REFERENCES `wx_category` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='商品信息表';

-- ----------------------------
-- Records of wx_product
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_purchase
-- ----------------------------
DROP TABLE IF EXISTS `wx_purchase`;
CREATE TABLE `wx_purchase`
(
    `id`          int                                    NOT NULL AUTO_INCREMENT COMMENT '采购单ID',
    `employee_id` int                                    NOT NULL COMMENT '员工ID',
    `product_id`  int                                    NOT NULL COMMENT '商品ID',
    `supplier`    varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商',
    `quantity`    int                                    NOT NULL COMMENT '采购数量',
    `amount`      decimal(10, 2)                         NOT NULL COMMENT '采购金额',
    `status`      int                                    NOT NULL COMMENT '状态：0-草稿，1-待审核，2-已审核，-1-审核不通过',
    `create_time` datetime                               NOT NULL COMMENT '创建时间',
    `update_time` datetime                               NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_employee_id` (`employee_id`),
    KEY `idx_product_id` (`product_id`),
    CONSTRAINT `fk_employee_id_purchase` FOREIGN KEY (`employee_id`) REFERENCES `wx_employee` (`id`),
    CONSTRAINT `fk_product_id_purchase` FOREIGN KEY (`product_id`) REFERENCES `wx_product` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='采购单表';

-- ----------------------------
-- Records of wx_purchase
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_sale
-- ----------------------------
DROP TABLE IF EXISTS `wx_sale`;
CREATE TABLE `wx_sale`
(
    `id`          int                                    NOT NULL AUTO_INCREMENT COMMENT '销售单ID',
    `employee_id` int                                    NOT NULL COMMENT '员工ID',
    `product_id`  int                                    NOT NULL COMMENT '商品ID',
    `customer`    varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名称',
    `quantity`    int                                    NOT NULL COMMENT '销售数量',
    `amount`      decimal(10, 2)                         NOT NULL COMMENT '销售金额',
    `status`      int                                    NOT NULL COMMENT '状态：0-草稿，1-待审核，2-已审核，-1-审核不通过',
    `create_time` datetime                               NOT NULL COMMENT '创建时间',
    `update_time` datetime                               NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_employee_id` (`employee_id`),
    KEY `idx_product_id` (`product_id`),
    CONSTRAINT `fk_employee_id_sale` FOREIGN KEY (`employee_id`) REFERENCES `wx_employee` (`id`),
    CONSTRAINT `fk_product_id_sale` FOREIGN KEY (`product_id`) REFERENCES `wx_product` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='销售单表';

-- ----------------------------
-- Records of wx_sale
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_stock
-- ----------------------------
DROP TABLE IF EXISTS `wx_stock`;
CREATE TABLE `wx_stock`
(
    `product_id`  int      NOT NULL COMMENT '商品ID',
    `quantity`    int      NOT NULL DEFAULT '0' COMMENT '库存数量',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_time` datetime NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`product_id`),
    CONSTRAINT `fk_product_id_stock` FOREIGN KEY (`product_id`) REFERENCES `wx_product` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='库存表';

-- ----------------------------
-- Records of wx_stock
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user`
(
    `id`          int                                    NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `name`        varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
    `password`    varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
    `email`       varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
    `mobile`      varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
    `status`      int                                    NOT NULL COMMENT '状态：1-正常，0-禁用',
    `create_time` datetime                               NOT NULL COMMENT '创建时间',
    `update_time` datetime                               NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='用户表';

-- ----------------------------
-- Records of wx_user
-- ----------------------------
BEGIN;
INSERT INTO `wx_user` (`id`, `name`, `password`, `email`, `mobile`, `status`, `create_time`, `update_time`)
VALUES (1, 'admin', '123456', 'lilinxi015@163.com', '17733101039', 1, '2023-04-11 20:35:06', '2023-04-11 20:35:06');
INSERT INTO `wx_user` (`id`, `name`, `password`, `email`, `mobile`, `status`, `create_time`, `update_time`)
VALUES (2, 'admin1', '777888', 'lilinxi015@163.com', '17733101039', 1, '2023-04-11 20:35:21', '2023-04-11 20:35:21');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
