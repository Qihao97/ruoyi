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
-- 1、学生信息表
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_no` bigint(20) NOT NULL COMMENT '学号',
  `student_name` varchar(100) NOT NULL COMMENT '学生姓名',
  `student_sex` varchar(10) DEFAULT NULL COMMENT '性别',
   `student_college` varchar(255) DEFAULT NULL COMMENT '院系班级',
    `student_specialty` varchar(255) DEFAULT NULL COMMENT '专业',
     `specialty_no` varchar(255) DEFAULT NULL COMMENT '学科专业码',
     `id_num` varchar(50) DEFAULT NULL COMMENT '身份证号',
       birthday   datetime        DEFAULT NULL  comment '出生日期',

  `student_grade` varchar(10) DEFAULT NULL COMMENT '年级',


  `school_system` int(1) DEFAULT NULL COMMENT '学制',
  `enter_year` int(10) DEFAULT NULL COMMENT '入学年份',
  `graduate_year` int(10) DEFAULT NULL COMMENT '毕业年份',
  `student_type` varchar(50) DEFAULT NULL COMMENT '研究生、本科生',
  `phone_num` varchar(50) DEFAULT NULL COMMENT '手机号',

  `college_no` varchar(100) DEFAULT NULL COMMENT '学院编号，备用',
  `specialty` varchar(100) DEFAULT NULL COMMENT '专业编号',
  PRIMARY KEY (`studentno`)
)  engine=innodb auto_increment=100 default charset=utf8 comment = '学生信息表';



-- ----------------------------
-- 1、宿舍表
-- ----------------------------
drop table if exists sg_dorm;
create table sg_dorm (
  dorm_id 			int(11) 		not null auto_increment    comment '宿舍id',
  parent_id 		int(11) 		default 0 			       comment '父宿舍id',
  ancestors 		varchar(50)     default '' 			       comment '祖级列表',
  dorm_name 		varchar(30) 	default '' 				   comment '宿舍名称',
  order_num 		int(4) 			default 0 			       comment '显示顺序',
  leader            varchar(20)     default null               comment '宿舍负责人',
  phone             varchar(11)     default null               comment '联系电话',
  status 			char(1) 		default '0' 			   comment '宿舍状态（0正常 1停用）',
  del_flag			char(1) 		default '0' 			   comment '删除标志（0代表存在 2代表删除）',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time 	    datetime                                   comment '创建时间',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新时间',
  primary key (dorm_id)
) engine=innodb auto_increment=200 default charset=utf8 comment = '宿舍表';

-- ----------------------------
-- 2、教职工/学生信息表
-- ----------------------------
drop table if exists sg_user;
create table sg_user (
  user_id 			varchar(50) 		not null     comment '用户ID：教职工的工号、学生的学号',
  dormt_id 			int(11) 		default null			   comment '宿舍ID',
  user_name 		varchar(30) 	default null 				   comment '用户名称',
  user_type 		varchar(2) 	    default '00' 		       comment '用户类型（00学生、01教职工、02其他）',
  email  			varchar(50) 	default '' 				   comment '用户邮箱',
  phonenumber  		varchar(11) 	default '' 				   comment '手机号码',
  idumber  		varchar(20) 	default '' 				   comment '身份号码',
  sex  		        char(1) 	    default '0' 			   comment '用户性别（0男 1女 2未知）',
  avatar1            varchar(100) 	default '' 				   comment '头像路径',
  avatar2            varchar(100) 	default '' 				   comment '头像路径',
  avatar3            varchar(100) 	default '' 				   comment '头像路径',
  avatar4            varchar(100) 	default '' 				   comment '头像路径',
  avatar5            varchar(100) 	default '' 				   comment '头像路径',
  avatar6            varchar(100) 	default '' 				   comment '头像路径',
  login_status 			char(1) 		default '0' 			   comment '帐号状态（0用户ID设为登录账号、1用户ID不是登录账号）',
  del_flag			char(1) 		default '0' 			   comment '删除标志（0代表存在 2代表删除）',
  login_ip          varchar(50)     default ''                 comment '最后登陆IP',
  login_date        datetime                                   comment '最后登陆时间',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time 	    datetime                                   comment '创建时间',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新时间',
  remark 		    varchar(500) 	default '' 				   comment '备注',
  primary key (user_id)
) engine=innodb auto_increment=100 default charset=utf8 comment = '用户信息表';

-- ----------------------------
-- Table structure for apply_enclosure
-- ----------------------------
DROP TABLE IF EXISTS `apply_enclosure`;
CREATE TABLE `apply_enclosure` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请编号主键',
  `applyid` varchar(255) NOT NULL COMMENT '申请ID',
  `filepath` varchar(255) NOT NULL COMMENT '附件文件路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_enclosure
-- ----------------------------

-- ----------------------------
-- Table structure for apply_room_relat
-- ----------------------------
DROP TABLE IF EXISTS `apply_room_relat`;
CREATE TABLE `apply_room_relat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请编号主键',
  `applyid` varchar(255) NOT NULL COMMENT '申请ID',
  `roomid` varchar(255) NOT NULL COMMENT '房间ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_room_relat
-- ----------------------------

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `campus` varchar(255) DEFAULT NULL COMMENT '所在校区',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `buildingnumber` int(11) DEFAULT NULL COMMENT '楼号',
  `buildingyear` date DEFAULT NULL COMMENT '建筑年份',
  `buildingarea` double DEFAULT NULL COMMENT '建筑面积',
  `userablearea` double DEFAULT NULL COMMENT '使用面积',
  `roomnumber` int(11) DEFAULT NULL COMMENT '房间数',
  `managermentunit` varchar(255) DEFAULT NULL COMMENT '管理单位',
  `classify` varchar(255) DEFAULT NULL COMMENT '分类',
  `reserved1` varchar(255) DEFAULT NULL COMMENT '预留字段',
  `reserved2` varchar(255) DEFAULT NULL COMMENT '预留字段',
  `reserved3` varchar(255) DEFAULT NULL COMMENT '预留字段',
  `reserved4` varchar(255) DEFAULT NULL COMMENT '预留字段',
  `classifyid` int(11) DEFAULT NULL,
  `office` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdx42gridvhxdjw7fhv0ho7qv2` (`classifyid`),
  CONSTRAINT `FKdx42gridvhxdjw7fhv0ho7qv2` FOREIGN KEY (`classifyid`) REFERENCES `building_classify` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES ('25', '桃李园校区', '1号楼', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `building` VALUES ('26', '文化路校区', '12号楼', '12', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for building_classify
-- ----------------------------
DROP TABLE IF EXISTS `building_classify`;
CREATE TABLE `building_classify` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '行政区划名称',
  `parentid` int(11) DEFAULT NULL COMMENT '父级id',
  `level` int(1) DEFAULT NULL COMMENT '级别',
  `sortnum` int(3) DEFAULT NULL COMMENT '排序',
  `descri` varchar(255) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of building_classify
-- ----------------------------
INSERT INTO `building_classify` VALUES ('1', '公用房', '0', '0', '1', null, null, '2018-08-15 08:58:41');
INSERT INTO `building_classify` VALUES ('2', '教研用房', '1', '1', '1', null, null, '2018-08-15 08:59:19');
INSERT INTO `building_classify` VALUES ('3', '行政用房', '1', '1', '2', null, null, '2018-08-15 08:59:47');
INSERT INTO `building_classify` VALUES ('4', '学生宿舍', '1', '1', '3', null, null, '2018-08-15 09:00:10');
INSERT INTO `building_classify` VALUES ('5', '食堂用房', '1', '1', '4', null, null, '2018-08-15 09:00:37');
INSERT INTO `building_classify` VALUES ('6', '附属用房', '1', '1', '5', null, null, '2018-08-15 09:00:54');
INSERT INTO `building_classify` VALUES ('7', '经营用房', '1', '1', '6', null, null, '2018-08-15 09:01:15');
INSERT INTO `building_classify` VALUES ('8', '教室', '1', '2', '1', null, null, '2018-08-15 09:03:18');
INSERT INTO `building_classify` VALUES ('9', '图书馆', '1', '2', '2', null, null, '2018-08-15 09:03:37');
INSERT INTO `building_classify` VALUES ('10', '实验室', '1', '2', '3', null, null, '2018-08-15 09:03:56');
INSERT INTO `building_classify` VALUES ('11', '专用科研用房', '1', '2', '4', null, null, '2018-08-15 09:04:38');
INSERT INTO `building_classify` VALUES ('12', '体育馆', '1', '2', '5', null, null, '2018-08-15 09:04:56');
INSERT INTO `building_classify` VALUES ('13', '校级行政房', '2', '2', '1', null, null, '2018-08-15 09:05:46');
INSERT INTO `building_classify` VALUES ('14', '院系行政房', '2', '2', '2', null, null, '2018-08-15 09:06:12');
INSERT INTO `building_classify` VALUES ('15', '本专科宿舍', '3', '2', '1', null, null, '2018-08-15 09:06:56');
INSERT INTO `building_classify` VALUES ('16', '研究生宿舍', '3', '2', '2', null, null, '2018-08-15 09:07:21');
INSERT INTO `building_classify` VALUES ('17', '值班室', '3', '2', '3', null, null, '2018-08-15 09:07:36');
INSERT INTO `building_classify` VALUES ('18', '团委', '3', '2', '4', null, null, '2018-08-15 09:07:50');
INSERT INTO `building_classify` VALUES ('19', '学生会', '3', '2', '5', null, null, '2018-08-15 09:08:10');
INSERT INTO `building_classify` VALUES ('20', '卫生间', '3', '2', '6', null, null, '2018-08-15 09:08:25');
INSERT INTO `building_classify` VALUES ('21', '水房', '3', '2', '7', null, null, '2018-08-15 09:09:04');
INSERT INTO `building_classify` VALUES ('22', '配电室', '3', '2', '8', null, null, '2018-08-15 09:09:19');
INSERT INTO `building_classify` VALUES ('23', '洗衣房', '3', '2', '9', null, null, '2018-08-15 09:09:45');
INSERT INTO `building_classify` VALUES ('24', '其他', '3', '2', '10', null, null, '2018-08-15 09:09:56');
INSERT INTO `building_classify` VALUES ('25', '学生食堂', '4', '2', '1', null, null, '2018-08-15 09:10:19');
INSERT INTO `building_classify` VALUES ('26', '教工食堂', '4', '2', '2', null, null, '2018-08-15 09:10:53');
INSERT INTO `building_classify` VALUES ('27', '医院用房', '5', '2', '1', null, null, '2018-08-15 09:11:22');
INSERT INTO `building_classify` VALUES ('28', '生活附属用房', '5', '2', '2', null, null, '2018-08-15 09:11:44');
INSERT INTO `building_classify` VALUES ('29', '其他附属用房', '5', '2', '3', null, null, '2018-08-15 09:12:01');
INSERT INTO `building_classify` VALUES ('30', '宾馆', '6', '2', '1', null, null, '2018-08-15 09:12:15');
INSERT INTO `building_classify` VALUES ('31', '商业用房', '6', '2', '2', null, null, '2018-08-15 09:12:31');
INSERT INTO `building_classify` VALUES ('32', '产业用房', '6', '2', '3', null, null, '2018-08-15 09:12:55');

-- ----------------------------
-- Table structure for building_floor
-- ----------------------------
DROP TABLE IF EXISTS `building_floor`;
CREATE TABLE `building_floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `buildnumber` int(11) DEFAULT NULL COMMENT '楼号',
  `floor` int(11) NOT NULL COMMENT '层号',
  `roomnumber` int(11) DEFAULT NULL COMMENT '房间数',
  `plan` varchar(255) DEFAULT NULL COMMENT '平面图（图片路径）',
  `buildnum` int(11) DEFAULT NULL,
  `roomnum` int(11) DEFAULT NULL,
  `buildingid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfdh71e64nvurgjwx897q9pyfb` (`buildingid`),
  CONSTRAINT `FKfdh71e64nvurgjwx897q9pyfb` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of building_floor
-- ----------------------------
INSERT INTO `building_floor` VALUES ('1', '1', '1', null, null, null, null, '25');
INSERT INTO `building_floor` VALUES ('2', '1', '2', null, null, null, null, '25');
INSERT INTO `building_floor` VALUES ('3', '12', '1', null, null, null, null, '26');

-- ----------------------------
-- Table structure for building_room
-- ----------------------------
DROP TABLE IF EXISTS `building_room`;
CREATE TABLE `building_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `roomid` varchar(11) NOT NULL COMMENT '房间号',
  `useunit` varchar(255) DEFAULT NULL COMMENT '使用单位',
  `roomnature` varchar(255) DEFAULT NULL COMMENT '房间性质',
  `deposit` varchar(255) DEFAULT NULL COMMENT '房间存放物体',
  `usearea` double DEFAULT NULL COMMENT '使用面积',
  `buildarea` double DEFAULT NULL COMMENT '建筑面积',
  `audittime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '使用面积审核时间',
  `classifyid` int(11) DEFAULT NULL COMMENT '房间分类id,关联分类',
  `buildingfloorid` int(11) DEFAULT NULL,
  `ids` tinyblob,
  PRIMARY KEY (`id`),
  KEY `FK22uyxtcruv7ubdgah8y1n9m0` (`classifyid`),
  KEY `FKfxqo1j2kyosxkyyso5svclyhp` (`buildingfloorid`),
  CONSTRAINT `FK22uyxtcruv7ubdgah8y1n9m0` FOREIGN KEY (`classifyid`) REFERENCES `building_classify` (`id`),
  CONSTRAINT `FKfxqo1j2kyosxkyyso5svclyhp` FOREIGN KEY (`buildingfloorid`) REFERENCES `building_floor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of building_room
-- ----------------------------
INSERT INTO `building_room` VALUES ('140', '1101', '信管学院', null, null, '64.5', '64.5', null, '4', '1', null);
INSERT INTO `building_room` VALUES ('141', '1102', '信管学院', null, null, '64.5', '64.5', null, '4', '1', null);
INSERT INTO `building_room` VALUES ('142', '1103', '农学院', null, null, '64.5', '64.5', null, '4', '1', null);
INSERT INTO `building_room` VALUES ('143', '1201', '农学院', null, null, '64.5', '64.5', null, '4', '2', null);
INSERT INTO `building_room` VALUES ('144', '1202', '农学院', null, null, '64.5', '64.5', null, '4', '2', null);
INSERT INTO `building_room` VALUES ('145', '1203', '信管学院', null, null, '64.5', '64.5', null, '4', '2', null);
INSERT INTO `building_room` VALUES ('146', '1204', '信管学院', null, null, '64.5', '64.5', null, '4', '2', null);
INSERT INTO `building_room` VALUES ('147', '101', '研究生院院长', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('148', '101', '研究生院副院长', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('149', '102', '学位与发展规划处', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('150', '208', '研究生院院长', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('151', '209', '研究生院副院长', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('152', '210', '学位与发展规划处', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('153', '211', '财务处', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('154', '212', '财务处', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('155', '213', '财务处结算中心', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('156', '214', '财务处结算中心', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('157', '215', '值班室', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('158', '216', '保卫处', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('159', '217', '保卫处', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('160', '218', '保卫处', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('161', '219', '保卫处', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('162', '220', '保卫处', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('163', '221', '保卫处', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('164', '222', '保卫处', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('165', '223', '车队', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('166', '224', '财务处', null, null, '21.6', '21.6', null, '4', '3', null);
INSERT INTO `building_room` VALUES ('167', '225', '财务处', null, null, null, null, null, '4', '3', null);

-- ----------------------------
-- Table structure for hibernate_sequences
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequences`;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) NOT NULL,
  `sequence_next_hi_value` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequences
-- ----------------------------

-- ----------------------------
-- Table structure for room_application
-- ----------------------------
DROP TABLE IF EXISTS `room_application`;
CREATE TABLE `room_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请编号主键',
  `faculty` varchar(255) DEFAULT NULL COMMENT '申请院系',
  `classify` varchar(255) DEFAULT NULL COMMENT '房屋类型',
  `approvalstaffnum` varchar(255) DEFAULT NULL COMMENT '审批人职工号',
  `applystaffnum` varchar(255) DEFAULT NULL COMMENT '操作人职工号',
  `housenum` varchar(255) DEFAULT NULL COMMENT '房间号',
  `filepath` varchar(500) DEFAULT NULL COMMENT '扫描件路径',
  `applytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提出申请时间',
  `audittime` datetime DEFAULT NULL COMMENT '审核时间',
  `auditresult` varchar(255) DEFAULT NULL COMMENT '审核结果',
  `enclosure` tinyblob,
  `ids` tinyblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_application
-- ----------------------------
INSERT INTO `room_application` VALUES ('1', '信管学院', '教室', '总务处', null, '1101', '/uploadimg/201809211613190x1024a0a0.jpg', '2018-09-21 16:42:21', '2018-09-29 10:18:39', '通过', null, null);
INSERT INTO `room_application` VALUES ('2', '信管学院', '教室', '总务处', null, '220', '/uploadimg/20180921164218app16.png', '2018-09-21 18:38:38', '2018-09-22 12:22:29', '通过', null, null);
INSERT INTO `room_application` VALUES ('6', '信管学院', '教室', '总务处', null, '33', '/uploadimg/20180922103114002QPzvNty6HqGLbWvTf9&690.png', '2018-09-22 10:31:24', '2018-09-29 10:18:38', '通过', null, null);
INSERT INTO `room_application` VALUES ('7', '经管学院', '实验室', '总务处', null, '111', '/uploadimg/20180922112622app16.png', '2018-09-22 11:26:28', '2018-09-22 12:02:57', '通过', null, null);

-- ----------------------------
-- Table structure for room_distribution
-- ----------------------------
DROP TABLE IF EXISTS `room_distribution`;
CREATE TABLE `room_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请编号主键',
  `faculty` varchar(255) DEFAULT NULL COMMENT '申请院系',
  `housenum` varchar(255) DEFAULT NULL COMMENT '房间号',
  `campus` varchar(255) DEFAULT NULL COMMENT '所在校区',
  `buildingname` varchar(255) DEFAULT NULL COMMENT '楼的名称',
  `buildingnumber` int(11) DEFAULT NULL COMMENT '楼号',
  `floor` int(11) DEFAULT NULL COMMENT '层号',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_distribution
-- ----------------------------



-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1617106001', '蔡梦梦', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106002', '曹欣然', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106003', '程雅田', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106004', '姜亚晴', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106005', '李建峰', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106006', '梁瑞', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106007', '林玉芳', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106008', '孟怡凡', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106009', '宋佳佳', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106010', '王霞', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106011', '徐荣', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106012', '张丹月', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106013', '张慧敏', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106014', '赵真', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106015', '翟效俊', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106016', '焦杨皓', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106017', '赖阳阳', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106018', '李程秀', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106019', '李选一', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106020', '李亚博', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106021', '李鑫涛', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106022', '刘杰', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106023', '王奎', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106024', '薛明', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106025', '杨广涛', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106026', '余永乐', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106027', '张奥钦', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106028', '张博文', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106029', '张恩博', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106030', '张旭', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106031', '陈柳', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106032', '崔秀明', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106033', '翟佳雯', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106034', '耿春露', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106035', '关梦娇', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106036', '韩鑫', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106037', '刘月月', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106038', '尚毓鑫', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106039', '苏贝宁', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106040', '王冬月', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106041', '王梦丽', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106042', '吴佳宁', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106043', '徐静雯', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106044', '张泳鑫', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106045', '闫瑞婷', '女', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106046', '李怀港', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106047', '李森', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106048', '李世豪', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106049', '刘峰', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106050', '刘明宇', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106051', '吕佩锦', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106052', '潘港澳', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106053', '秦海宾', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106054', '阮腾飞', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106055', '王帅鹏', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106056', '王一凡', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106057', '王银坤', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106058', '韦浩', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);
INSERT INTO `student` VALUES ('1617106059', '张强', '男', '资环学院', '土壤治理', '4', '2016', '2020', '本科生', null, null, null);

-- ----------------------------
-- Table structure for student_bunk
-- ----------------------------
DROP TABLE IF EXISTS `student_bunk`;
CREATE TABLE `student_bunk` (
  `bunkno` bigint(11) NOT NULL COMMENT '床位编号 宿舍编号+编号01,02的形式',
  `dormid` int(11) NOT NULL COMMENT '宿舍编号，关联到student_dorm',
  `studentno` bigint(20) DEFAULT '0' COMMENT '学生学号，关联学生表，空床位为0',
  PRIMARY KEY (`bunkno`),
  KEY `FK78wcs5ol4n9nrsyo6r9l59obi` (`studentno`),
  KEY `FK53iv79kedpgbrvifbkscfwck9` (`dormid`),
  CONSTRAINT `FK53iv79kedpgbrvifbkscfwck9` FOREIGN KEY (`dormid`) REFERENCES `student_dorm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_bunk
-- ----------------------------
INSERT INTO `student_bunk` VALUES ('14710101', '147', '0');
INSERT INTO `student_bunk` VALUES ('14710102', '147', '0');
INSERT INTO `student_bunk` VALUES ('14710103', '147', '0');
INSERT INTO `student_bunk` VALUES ('14710104', '147', '0');
INSERT INTO `student_bunk` VALUES ('14710105', '147', '0');
INSERT INTO `student_bunk` VALUES ('14710106', '147', '0');
INSERT INTO `student_bunk` VALUES ('14810101', '148', '0');
INSERT INTO `student_bunk` VALUES ('14810102', '148', '0');
INSERT INTO `student_bunk` VALUES ('14810103', '148', '0');
INSERT INTO `student_bunk` VALUES ('14810104', '148', '0');
INSERT INTO `student_bunk` VALUES ('14810105', '148', '0');
INSERT INTO `student_bunk` VALUES ('14810106', '148', '0');
INSERT INTO `student_bunk` VALUES ('14910201', '149', '0');
INSERT INTO `student_bunk` VALUES ('14910202', '149', '0');
INSERT INTO `student_bunk` VALUES ('14910203', '149', '0');
INSERT INTO `student_bunk` VALUES ('14910204', '149', '0');
INSERT INTO `student_bunk` VALUES ('14910205', '149', '0');
INSERT INTO `student_bunk` VALUES ('14910206', '149', '0');
INSERT INTO `student_bunk` VALUES ('15020801', '150', '0');
INSERT INTO `student_bunk` VALUES ('15020802', '150', '0');
INSERT INTO `student_bunk` VALUES ('15020803', '150', '0');
INSERT INTO `student_bunk` VALUES ('15020804', '150', '0');
INSERT INTO `student_bunk` VALUES ('15020805', '150', '0');
INSERT INTO `student_bunk` VALUES ('15020806', '150', '0');
INSERT INTO `student_bunk` VALUES ('15120901', '151', '0');
INSERT INTO `student_bunk` VALUES ('15120902', '151', '0');
INSERT INTO `student_bunk` VALUES ('15120903', '151', '0');
INSERT INTO `student_bunk` VALUES ('15120904', '151', '0');
INSERT INTO `student_bunk` VALUES ('15120905', '151', '0');
INSERT INTO `student_bunk` VALUES ('15120906', '151', '0');
INSERT INTO `student_bunk` VALUES ('15221001', '152', '0');
INSERT INTO `student_bunk` VALUES ('15221002', '152', '0');
INSERT INTO `student_bunk` VALUES ('15221003', '152', '0');
INSERT INTO `student_bunk` VALUES ('15221004', '152', '0');
INSERT INTO `student_bunk` VALUES ('15221005', '152', '0');
INSERT INTO `student_bunk` VALUES ('15221006', '152', '0');
INSERT INTO `student_bunk` VALUES ('15321101', '153', '0');
INSERT INTO `student_bunk` VALUES ('15321102', '153', '0');
INSERT INTO `student_bunk` VALUES ('15321103', '153', '0');
INSERT INTO `student_bunk` VALUES ('15321104', '153', '0');
INSERT INTO `student_bunk` VALUES ('15321105', '153', '0');
INSERT INTO `student_bunk` VALUES ('15321106', '153', '0');
INSERT INTO `student_bunk` VALUES ('15421201', '154', '0');
INSERT INTO `student_bunk` VALUES ('15421202', '154', '0');
INSERT INTO `student_bunk` VALUES ('15421203', '154', '0');
INSERT INTO `student_bunk` VALUES ('15421204', '154', '0');
INSERT INTO `student_bunk` VALUES ('15421205', '154', '0');
INSERT INTO `student_bunk` VALUES ('15421206', '154', '0');
INSERT INTO `student_bunk` VALUES ('15521301', '155', '0');
INSERT INTO `student_bunk` VALUES ('15521302', '155', '0');
INSERT INTO `student_bunk` VALUES ('15521303', '155', '0');
INSERT INTO `student_bunk` VALUES ('15521304', '155', '0');
INSERT INTO `student_bunk` VALUES ('15521305', '155', '0');
INSERT INTO `student_bunk` VALUES ('15521306', '155', '0');
INSERT INTO `student_bunk` VALUES ('15621401', '156', '0');
INSERT INTO `student_bunk` VALUES ('15621402', '156', '0');
INSERT INTO `student_bunk` VALUES ('15621403', '156', '0');
INSERT INTO `student_bunk` VALUES ('15621404', '156', '0');
INSERT INTO `student_bunk` VALUES ('15621405', '156', '0');
INSERT INTO `student_bunk` VALUES ('15621406', '156', '0');
INSERT INTO `student_bunk` VALUES ('15721501', '157', '0');
INSERT INTO `student_bunk` VALUES ('15721502', '157', '0');
INSERT INTO `student_bunk` VALUES ('15721503', '157', '0');
INSERT INTO `student_bunk` VALUES ('15721504', '157', '0');
INSERT INTO `student_bunk` VALUES ('15721505', '157', '0');
INSERT INTO `student_bunk` VALUES ('15721506', '157', '0');
INSERT INTO `student_bunk` VALUES ('15821601', '158', '0');
INSERT INTO `student_bunk` VALUES ('15821602', '158', '0');
INSERT INTO `student_bunk` VALUES ('15821603', '158', '0');
INSERT INTO `student_bunk` VALUES ('15821604', '158', '0');
INSERT INTO `student_bunk` VALUES ('15821605', '158', '0');
INSERT INTO `student_bunk` VALUES ('15821606', '158', '0');
INSERT INTO `student_bunk` VALUES ('15921701', '159', '0');
INSERT INTO `student_bunk` VALUES ('15921702', '159', '0');
INSERT INTO `student_bunk` VALUES ('15921703', '159', '0');
INSERT INTO `student_bunk` VALUES ('15921704', '159', '0');
INSERT INTO `student_bunk` VALUES ('15921705', '159', '0');
INSERT INTO `student_bunk` VALUES ('15921706', '159', '0');
INSERT INTO `student_bunk` VALUES ('16021801', '160', '0');
INSERT INTO `student_bunk` VALUES ('16021802', '160', '0');
INSERT INTO `student_bunk` VALUES ('16021803', '160', '0');
INSERT INTO `student_bunk` VALUES ('16021804', '160', '0');
INSERT INTO `student_bunk` VALUES ('16021805', '160', '0');
INSERT INTO `student_bunk` VALUES ('16021806', '160', '0');
INSERT INTO `student_bunk` VALUES ('16121901', '161', '0');
INSERT INTO `student_bunk` VALUES ('16121902', '161', '0');
INSERT INTO `student_bunk` VALUES ('16121903', '161', '0');
INSERT INTO `student_bunk` VALUES ('16121904', '161', '0');
INSERT INTO `student_bunk` VALUES ('16121905', '161', '0');
INSERT INTO `student_bunk` VALUES ('16121906', '161', '0');
INSERT INTO `student_bunk` VALUES ('16222001', '162', '0');
INSERT INTO `student_bunk` VALUES ('16222002', '162', '0');
INSERT INTO `student_bunk` VALUES ('16222003', '162', '0');
INSERT INTO `student_bunk` VALUES ('16222004', '162', '0');
INSERT INTO `student_bunk` VALUES ('16222005', '162', '0');
INSERT INTO `student_bunk` VALUES ('16222006', '162', '0');
INSERT INTO `student_bunk` VALUES ('16322101', '163', '0');
INSERT INTO `student_bunk` VALUES ('16322102', '163', '0');
INSERT INTO `student_bunk` VALUES ('16322103', '163', '0');
INSERT INTO `student_bunk` VALUES ('16322104', '163', '0');
INSERT INTO `student_bunk` VALUES ('16322105', '163', '0');
INSERT INTO `student_bunk` VALUES ('16322106', '163', '0');
INSERT INTO `student_bunk` VALUES ('16422201', '164', '0');
INSERT INTO `student_bunk` VALUES ('16422202', '164', '0');
INSERT INTO `student_bunk` VALUES ('16422203', '164', '0');
INSERT INTO `student_bunk` VALUES ('16422204', '164', '0');
INSERT INTO `student_bunk` VALUES ('16422205', '164', '0');
INSERT INTO `student_bunk` VALUES ('16422206', '164', '0');
INSERT INTO `student_bunk` VALUES ('16522301', '165', '0');
INSERT INTO `student_bunk` VALUES ('16522302', '165', '0');
INSERT INTO `student_bunk` VALUES ('16522303', '165', '0');
INSERT INTO `student_bunk` VALUES ('16522304', '165', '0');
INSERT INTO `student_bunk` VALUES ('16522305', '165', '0');
INSERT INTO `student_bunk` VALUES ('16522306', '165', '0');
INSERT INTO `student_bunk` VALUES ('16622401', '166', '0');
INSERT INTO `student_bunk` VALUES ('16622402', '166', '0');
INSERT INTO `student_bunk` VALUES ('16622403', '166', '0');
INSERT INTO `student_bunk` VALUES ('16622404', '166', '0');
INSERT INTO `student_bunk` VALUES ('16622405', '166', '0');
INSERT INTO `student_bunk` VALUES ('16622406', '166', '0');
INSERT INTO `student_bunk` VALUES ('140110101', '140', '0');
INSERT INTO `student_bunk` VALUES ('140110102', '140', '0');
INSERT INTO `student_bunk` VALUES ('140110103', '140', '0');
INSERT INTO `student_bunk` VALUES ('140110104', '140', '0');
INSERT INTO `student_bunk` VALUES ('140110105', '140', '0');
INSERT INTO `student_bunk` VALUES ('140110106', '140', '0');
INSERT INTO `student_bunk` VALUES ('141110201', '141', '0');
INSERT INTO `student_bunk` VALUES ('141110202', '141', '0');
INSERT INTO `student_bunk` VALUES ('141110203', '141', '0');
INSERT INTO `student_bunk` VALUES ('141110204', '141', '0');
INSERT INTO `student_bunk` VALUES ('141110205', '141', '0');
INSERT INTO `student_bunk` VALUES ('141110206', '141', '0');
INSERT INTO `student_bunk` VALUES ('142110301', '142', '0');
INSERT INTO `student_bunk` VALUES ('142110302', '142', '0');
INSERT INTO `student_bunk` VALUES ('142110303', '142', '0');
INSERT INTO `student_bunk` VALUES ('142110304', '142', '0');
INSERT INTO `student_bunk` VALUES ('142110305', '142', '0');
INSERT INTO `student_bunk` VALUES ('142110306', '142', '0');
INSERT INTO `student_bunk` VALUES ('143120101', '143', '0');
INSERT INTO `student_bunk` VALUES ('143120102', '143', '0');
INSERT INTO `student_bunk` VALUES ('143120103', '143', '0');
INSERT INTO `student_bunk` VALUES ('143120104', '143', '0');
INSERT INTO `student_bunk` VALUES ('143120105', '143', '0');
INSERT INTO `student_bunk` VALUES ('143120106', '143', '0');
INSERT INTO `student_bunk` VALUES ('144120201', '144', '0');
INSERT INTO `student_bunk` VALUES ('144120202', '144', '0');
INSERT INTO `student_bunk` VALUES ('144120203', '144', '0');
INSERT INTO `student_bunk` VALUES ('144120204', '144', '0');
INSERT INTO `student_bunk` VALUES ('144120205', '144', '0');
INSERT INTO `student_bunk` VALUES ('144120206', '144', '0');
INSERT INTO `student_bunk` VALUES ('145120301', '145', '0');
INSERT INTO `student_bunk` VALUES ('145120302', '145', '0');
INSERT INTO `student_bunk` VALUES ('145120303', '145', '0');
INSERT INTO `student_bunk` VALUES ('145120304', '145', '0');
INSERT INTO `student_bunk` VALUES ('145120305', '145', '0');
INSERT INTO `student_bunk` VALUES ('145120306', '145', '0');
INSERT INTO `student_bunk` VALUES ('146120401', '146', '0');
INSERT INTO `student_bunk` VALUES ('146120402', '146', '0');
INSERT INTO `student_bunk` VALUES ('146120403', '146', '0');
INSERT INTO `student_bunk` VALUES ('146120404', '146', '0');
INSERT INTO `student_bunk` VALUES ('146120405', '146', '0');
INSERT INTO `student_bunk` VALUES ('146120406', '146', '0');

-- ----------------------------
-- Table structure for student_dorm
-- ----------------------------
DROP TABLE IF EXISTS `student_dorm`;
CREATE TABLE `student_dorm` (
  `id` int(11) NOT NULL COMMENT '宿舍编号，同房间编号，即使主键又是外键',
  `dormnum` int(4) DEFAULT NULL COMMENT '床位数',
  `dormremaining` int(4) DEFAULT NULL COMMENT '剩余床位数',
  `dormproperty` varchar(10) DEFAULT NULL COMMENT '宿舍性质，男、女',
  PRIMARY KEY (`id`),
  CONSTRAINT `FKpphpm7uugc02kmni3w06un62v` FOREIGN KEY (`id`) REFERENCES `building_room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_dorm
-- ----------------------------
INSERT INTO `student_dorm` VALUES ('140', '6', '6', '男');
INSERT INTO `student_dorm` VALUES ('141', '6', '6', '男');
INSERT INTO `student_dorm` VALUES ('142', '6', '6', '男');
INSERT INTO `student_dorm` VALUES ('143', '6', '6', '男');
INSERT INTO `student_dorm` VALUES ('144', '6', '6', '男');
INSERT INTO `student_dorm` VALUES ('145', '6', '6', '男');
INSERT INTO `student_dorm` VALUES ('146', '6', '6', '男');
INSERT INTO `student_dorm` VALUES ('147', '6', '4', '男');
INSERT INTO `student_dorm` VALUES ('148', '6', '4', '男');
INSERT INTO `student_dorm` VALUES ('149', '6', '4', '男');
INSERT INTO `student_dorm` VALUES ('150', '6', '4', '男');
INSERT INTO `student_dorm` VALUES ('151', '6', '4', '男');
INSERT INTO `student_dorm` VALUES ('152', '6', '4', '男');
INSERT INTO `student_dorm` VALUES ('153', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('154', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('155', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('156', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('157', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('158', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('159', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('160', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('161', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('162', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('163', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('164', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('165', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('166', '6', '4', '女');
INSERT INTO `student_dorm` VALUES ('167', null, null, null);

-- ----------------------------
-- Table structure for student_log
-- ----------------------------
DROP TABLE IF EXISTS `student_log`;
CREATE TABLE `student_log` (
  `studentno` bigint(20) NOT NULL COMMENT '学号',
  `studentname` varchar(100) NOT NULL COMMENT '学生姓名',
  `studentsex` varchar(10) DEFAULT NULL,
  `studentcollege` varchar(255) DEFAULT NULL COMMENT '学院',
  `studentspecialty` varchar(255) DEFAULT NULL COMMENT '专业',
  `schoolsystem` int(1) DEFAULT NULL COMMENT '学制',
  `entryyear` int(10) DEFAULT NULL COMMENT '入学年份',
  `graduateyear` int(10) DEFAULT NULL COMMENT '毕业年份',
  `studenttype` varchar(50) DEFAULT NULL COMMENT '研究生、本科生',
  `collegeno` int(20) DEFAULT NULL COMMENT '学院编号，备用',
  `specialty` int(20) DEFAULT NULL COMMENT '专业编号',
  `bunkno` bigint(20) DEFAULT '0',
  PRIMARY KEY (`studentno`),
  KEY `FKqceigsyb0kj72ttciv7uw6aou` (`bunkno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_log
-- ----------------------------
INSERT INTO `student_log` VALUES ('231423512451', '2314', '女', '', '', '4', null, null, null, null, null, '121303');
INSERT INTO `student_log` VALUES ('324123421341', '爱魏晨', '男', '', '', '4', null, null, null, null, null, '121302');
INSERT INTO `student_log` VALUES ('412341333333', '玩儿', '男', '委屈', '委屈二', '4', '2014', '2018', null, null, null, '121304');
INSERT INTO `student_log` VALUES ('451451512341', '32413', '男', '123413', '', '4', null, null, null, null, null, '121301');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `mobile` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `comefrom` varchar(255) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `creationip` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `globalid` int(11) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `iswithavatar` varchar(255) DEFAULT NULL,
  `lastlogindate` datetime DEFAULT NULL,
  `lastloginip` varchar(255) DEFAULT NULL,
  `loginerrorcount` int(11) DEFAULT NULL,
  `loginerrordate` datetime DEFAULT NULL,
  `logins` int(11) DEFAULT NULL,
  `membergroupid` int(11) DEFAULT NULL,
  `msn` varchar(255) DEFAULT NULL,
  `orgid` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prevlogindate` datetime DEFAULT NULL,
  `prevloginip` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `qqopenid` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `validationdate` datetime DEFAULT NULL,
  `validationkey` varchar(255) DEFAULT NULL,
  `validationtype` varchar(255) DEFAULT NULL,
  `weibouid` varchar(255) DEFAULT NULL,
  `weixin` varchar(255) DEFAULT NULL,
  `weixinopenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
