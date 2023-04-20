-- 用户表，包含用户信息
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user`
(
    `id`          INT(32)     NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `name`        VARCHAR(50) NOT NULL COMMENT '用户名',
    `password`    VARCHAR(50) NOT NULL COMMENT '密码',
    `email`       VARCHAR(50) NOT NULL COMMENT '邮箱',
    `mobile`      VARCHAR(50) NOT NULL COMMENT '手机号',
    `status`      INT         NOT NULL COMMENT '状态：1-正常，0-禁用',
    `create_time` DATETIME    NOT NULL COMMENT '创建时间',
    `update_time` DATETIME    NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) COMMENT ='用户表';

-- 部门表，包含部门信息
DROP TABLE IF EXISTS `wx_department`;
CREATE TABLE `wx_department`
(
    `id`          INT(32)     NOT NULL AUTO_INCREMENT COMMENT '部门ID',
    `name`        VARCHAR(50) NOT NULL COMMENT '部门名称',
    `parent_id`   INT         NOT NULL DEFAULT 0 COMMENT '父级部门ID',
    `create_time` DATETIME    NOT NULL COMMENT '创建时间',
    `update_time` DATETIME    NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_parent_id` (`parent_id`),
    CONSTRAINT `fk_parent_id_department` FOREIGN KEY (`parent_id`) REFERENCES `wx_department` (`id`)
) COMMENT ='部门表';

-- 员工表，包含员工信息
DROP TABLE IF EXISTS `wx_employee`;
CREATE TABLE `wx_employee`
(
    `id`            INT(32)      NOT NULL AUTO_INCREMENT COMMENT '员工ID',
    `name`          VARCHAR(50)  NOT NULL COMMENT '员工姓名',
    `gender`        INT          NOT NULL DEFAULT 0 COMMENT '性别：0-未知，1-男，2-女',
    `age`           INT          NOT NULL COMMENT '年龄',
    `mobile`        VARCHAR(50)  NOT NULL COMMENT '手机号',
    `email`         VARCHAR(50)  NOT NULL COMMENT '邮箱',
    `address`       VARCHAR(200) NOT NULL COMMENT '地址',
    `department_id` INT          NOT NULL COMMENT '所属部门ID',
    `create_time`   DATETIME     NOT NULL COMMENT '创建时间',
    `update_time`   DATETIME     NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_department_id` (`department_id`),
    CONSTRAINT `fk_department_id_employee` FOREIGN KEY (`department_id`) REFERENCES `wx_department` (`id`)
) COMMENT ='员工信息表';


-- 商品分类表，包含商品分类信息
DROP TABLE IF EXISTS `wx_category`;
CREATE TABLE `wx_category`
(
    `id`          INT(32)     NOT NULL AUTO_INCREMENT COMMENT '分类ID',
    `name`        VARCHAR(50) NOT NULL COMMENT '分类名称',
    `parent_id`   INT         NOT NULL DEFAULT 0 COMMENT '父级分类ID',
    `create_time` DATETIME    NOT NULL COMMENT '创建时间',
    `update_time` DATETIME    NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_parent_id` (`parent_id`),
    CONSTRAINT `fk_parent_id_category` FOREIGN KEY (`parent_id`) REFERENCES `wx_category` (`id`)
) COMMENT ='商品分类表';

-- 商品表，包含商品信息
DROP TABLE IF EXISTS `wx_product`;
CREATE TABLE `wx_product`
(
    `id`          INT(32)        NOT NULL AUTO_INCREMENT COMMENT '商品ID',
    `name`        VARCHAR(50)    NOT NULL COMMENT '商品名称',
    `category_id` INT            NOT NULL COMMENT '所属分类ID',
    `price`       DECIMAL(10, 2) NOT NULL COMMENT '价格',
    `stock`       INT            NOT NULL DEFAULT 0 COMMENT '库存',
    `create_time` DATETIME       NOT NULL COMMENT '创建时间',
    `update_time` DATETIME       NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_category_id` (`category_id`),
    CONSTRAINT `fk_category_id_product` FOREIGN KEY (`category_id`) REFERENCES `wx_category` (`id`)
) COMMENT ='商品信息表';

-- 采购单表，包含采购单信息
DROP TABLE IF EXISTS `wx_purchase`;
CREATE TABLE `wx_purchase`
(
    `id`          INT(32)        NOT NULL AUTO_INCREMENT COMMENT '采购单ID',
    `employee_id` INT            NOT NULL COMMENT '员工ID',
    `product_id`  INT            NOT NULL COMMENT '商品ID',
    `supplier`    VARCHAR(50)    NOT NULL COMMENT '供应商',
    `quantity`    INT            NOT NULL COMMENT '采购数量',
    `amount`      DECIMAL(10, 2) NOT NULL COMMENT '采购金额',
    `status`      INT            NOT NULL COMMENT '状态：0-草稿，1-待审核，2-已审核，-1-审核不通过',
    `create_time` DATETIME       NOT NULL COMMENT '创建时间',
    `update_time` DATETIME       NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_employee_id` (`employee_id`),
    KEY `idx_product_id` (`product_id`),
    CONSTRAINT `fk_employee_id_purchase` FOREIGN KEY (`employee_id`) REFERENCES `wx_employee` (`id`),
    CONSTRAINT `fk_product_id_purchase` FOREIGN KEY (`product_id`) REFERENCES `wx_product` (`id`)
) COMMENT ='采购单表';

-- 销售单表，包含销售单信息
DROP TABLE IF EXISTS `wx_sale`;
CREATE TABLE `wx_sale`
(
    `id`          INT(32)        NOT NULL AUTO_INCREMENT COMMENT '销售单ID',
    `employee_id` INT            NOT NULL COMMENT '员工ID',
    `product_id`  INT            NOT NULL COMMENT '商品ID',
    `customer`    VARCHAR(50)    NOT NULL COMMENT '客户名称',
    `quantity`    INT            NOT NULL COMMENT '销售数量',
    `amount`      DECIMAL(10, 2) NOT NULL COMMENT '销售金额',
    `status`      INT            NOT NULL COMMENT '状态：0-草稿，1-待审核，2-已审核，-1-审核不通过',
    `create_time` DATETIME       NOT NULL COMMENT '创建时间',
    `update_time` DATETIME       NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_employee_id` (`employee_id`),
    KEY `idx_product_id` (`product_id`),
    CONSTRAINT `fk_employee_id_sale` FOREIGN KEY (`employee_id`) REFERENCES `wx_employee` (`id`),
    CONSTRAINT `fk_product_id_sale` FOREIGN KEY (`product_id`) REFERENCES `wx_product` (`id`)
) COMMENT ='销售单表';

-- 库存表，包含库存信息
DROP TABLE IF EXISTS `wx_stock`;
CREATE TABLE `wx_stock`
(
    `product_id`  INT(32)  NOT NULL COMMENT '商品ID',
    `quantity`    INT      NOT NULL DEFAULT 0 COMMENT '库存数量',
    `create_time` DATETIME NOT NULL COMMENT '创建时间',
    `update_time` DATETIME NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`product_id`),
    CONSTRAINT `fk_product_id_stock` FOREIGN KEY (`product_id`) REFERENCES `wx_product` (`id`)
) COMMENT ='库存表';
