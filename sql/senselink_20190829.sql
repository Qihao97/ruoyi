/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : housemanager

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-09-29 23:53:04
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- 1、设备信息表
-- ----------------------------
DROP TABLE IF EXISTS `sl_device`;
CREATE TABLE `sl_device` (
  id bigint(20) NOT NULL COMMENT '设备id',
  sn varchar(100) DEFAULT NULL COMMENT '设备sn号',
  name varchar(200) DEFAULT NULL COMMENT '设备名称',
  direction int(8) DEFAULT NULL COMMENT '设备方向',
   location varchar(255) DEFAULT NULL COMMENT '设备位置',
   ip varchar(255) DEFAULT NULL COMMENT '设备ip',
   status int(8) DEFAULT NULL COMMENT '设备在线状态',
    active   int(8) DEFAULT NULL COMMENT '假删除标志',
    type_id bigint(20) DEFAULT NULL COMMENT '设备类型id',
		description varchar(200) DEFAULT NULL COMMENT '设备描述',
		software_version varchar(100) DEFAULT NULL COMMENT '软件版本号',
		info varchar(200) DEFAULT NULL COMMENT '设备信息',
		company_id bigint(20) DEFAULT NULL COMMENT '公司id',
		group_count   int(8) DEFAULT NULL COMMENT '设备绑定的人员组数量',
		create_at varchar(50) DEFAULT NULL COMMENT '创建时间',
		update_at varchar(50) DEFAULT NULL COMMENT '更新时间',

  PRIMARY KEY (`id`)
)  engine=innodb  default charset=utf8 comment = '设备信息表';



-- ----------------------------
-- 2、设备类型表
-- ----------------------------
drop table if exists sl_device_type;
create table sl_device_type (
  id bigint(20) NOT NULL COMMENT '设备类型id',
  identifier varchar(200) DEFAULT NULL COMMENT '设备类型标识（简称）',
  name varchar(200) DEFAULT NULL COMMENT '设备类型名称',
  description varchar(200) DEFAULT NULL COMMENT '设备描述',
  create_at varchar(50) DEFAULT NULL COMMENT '创建时间',
	update_at varchar(50) DEFAULT NULL COMMENT '更新时间',
  primary key (id)
) engine=innodb  default charset=utf8 comment = '设备类型表';

-- ----------------------------
-- 3、人员组表
-- ----------------------------
drop table if exists sl_groups;
create table sl_groups (
	id bigint(20) NOT NULL COMMENT '人员组id',
  name varchar(200) DEFAULT NULL COMMENT '人员组名称',
  type 			int(8) DEFAULT null     COMMENT '人员组类型',
  primary key (id)
) engine=innodb  default charset=utf8 comment = '人员组表';


-- ----------------------------
-- 4、设备与人员组关联表
-- ----------------------------
drop table if exists sl_devicegroupsrel;
create table sl_devicegroupsrel (
	id bigint(20) NOT NULL COMMENT '设备与人员组关联id',
  groupid bigint(20) DEFAULT NULL COMMENT '人员组id',
  deviceid 			bigint(20) DEFAULT null     COMMENT '设备id',
  primary key (id)
) engine=innodb auto_increment=1 default charset=utf8 comment = '设备与人员组关联表';

