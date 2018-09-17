/*
Navicat MySQL Data Transfer

Source Server         : 10.70.39.214
Source Server Version : 50560
Source Host           : 10.70.39.214:3306
Source Database       : hcpaas_bmp

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2018-08-25 11:07:22
*/


SET FOREIGN_KEY_CHECKS=0;
set character set utf8;
DROP DATABASE IF EXISTS `hcpaas_bmp`;
CREATE DATABASE `hcpaas_bmp`;
USE `hcpaas_bmp`;

-- ----------------------------
-- Table structure for relation_module_permission
-- ----------------------------
DROP TABLE IF EXISTS `relation_module_permission`;
CREATE TABLE `relation_module_permission` (
  `module_id` bigint(20) NOT NULL COMMENT '模块编号',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`module_id`,`permission_id`),
  KEY `FK_module_to_permission` (`permission_id`),
  CONSTRAINT `FK_module_to_permission` FOREIGN KEY (`permission_id`) REFERENCES `system_permission` (`permission_id`),
  CONSTRAINT `FK_permission_to_module` FOREIGN KEY (`module_id`) REFERENCES `system_module` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of relation_module_permission
-- ----------------------------
INSERT INTO `relation_module_permission` VALUES ('1', '1');
INSERT INTO `relation_module_permission` VALUES ('1', '2');
INSERT INTO `relation_module_permission` VALUES ('2', '2');
INSERT INTO `relation_module_permission` VALUES ('3', '2');
INSERT INTO `relation_module_permission` VALUES ('4', '2');
INSERT INTO `relation_module_permission` VALUES ('5', '2');
INSERT INTO `relation_module_permission` VALUES ('6', '2');
INSERT INTO `relation_module_permission` VALUES ('7', '2');
INSERT INTO `relation_module_permission` VALUES ('11', '2');
INSERT INTO `relation_module_permission` VALUES ('14', '2');
INSERT INTO `relation_module_permission` VALUES ('1', '3');
INSERT INTO `relation_module_permission` VALUES ('2', '3');
INSERT INTO `relation_module_permission` VALUES ('3', '3');
INSERT INTO `relation_module_permission` VALUES ('4', '3');
INSERT INTO `relation_module_permission` VALUES ('5', '3');
INSERT INTO `relation_module_permission` VALUES ('6', '3');
INSERT INTO `relation_module_permission` VALUES ('9', '3');
INSERT INTO `relation_module_permission` VALUES ('10', '3');
INSERT INTO `relation_module_permission` VALUES ('11', '3');
INSERT INTO `relation_module_permission` VALUES ('12', '3');
INSERT INTO `relation_module_permission` VALUES ('13', '3');

-- ----------------------------
-- Table structure for relation_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `relation_role_permission`;
CREATE TABLE `relation_role_permission` (
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FK_role_to_permission` (`permission_id`),
  CONSTRAINT `FK_permission_to_role` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`role_id`),
  CONSTRAINT `FK_role_to_permission` FOREIGN KEY (`permission_id`) REFERENCES `system_permission` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation_role_permission
-- ----------------------------
INSERT INTO `relation_role_permission` VALUES ('3', '1');
INSERT INTO `relation_role_permission` VALUES ('2', '2');
INSERT INTO `relation_role_permission` VALUES ('1', '3');

-- ----------------------------
-- Table structure for relation_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `relation_user_permission`;
CREATE TABLE `relation_user_permission` (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `FK_user_to_permission` (`permission_id`),
  CONSTRAINT `FK_permission_to_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_user_to_permission` FOREIGN KEY (`permission_id`) REFERENCES `system_permission` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation_user_permission
-- ----------------------------

-- ----------------------------
-- Table structure for relation_user_projects_items
-- ----------------------------
DROP TABLE IF EXISTS `relation_user_projects_items`;
CREATE TABLE `relation_user_projects_items` (
  `project_item_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`project_item_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation_user_projects_items
-- ----------------------------
INSERT INTO `relation_user_projects_items` VALUES ('91', '5');
INSERT INTO `relation_user_projects_items` VALUES ('93', '9');
INSERT INTO `relation_user_projects_items` VALUES ('95', '9');
INSERT INTO `relation_user_projects_items` VALUES ('97', '9');
INSERT INTO `relation_user_projects_items` VALUES ('99', '9');
INSERT INTO `relation_user_projects_items` VALUES ('101', '13');
INSERT INTO `relation_user_projects_items` VALUES ('103', '13');
INSERT INTO `relation_user_projects_items` VALUES ('103', '43');
INSERT INTO `relation_user_projects_items` VALUES ('105', '17');
INSERT INTO `relation_user_projects_items` VALUES ('107', '25');
INSERT INTO `relation_user_projects_items` VALUES ('109', '25');
INSERT INTO `relation_user_projects_items` VALUES ('111', '25');
INSERT INTO `relation_user_projects_items` VALUES ('113', '25');
INSERT INTO `relation_user_projects_items` VALUES ('121', '31');
INSERT INTO `relation_user_projects_items` VALUES ('123', '31');
INSERT INTO `relation_user_projects_items` VALUES ('125', '31');
INSERT INTO `relation_user_projects_items` VALUES ('127', '13');
INSERT INTO `relation_user_projects_items` VALUES ('127', '41');
INSERT INTO `relation_user_projects_items` VALUES ('127', '43');

-- ----------------------------
-- Table structure for relation_user_role
-- ----------------------------
DROP TABLE IF EXISTS `relation_user_role`;
CREATE TABLE `relation_user_role` (
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK_role_to_user` (`user_id`),
  CONSTRAINT `FK_role_to_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_user_to_role` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation_user_role
-- ----------------------------
INSERT INTO `relation_user_role` VALUES ('1', '1');
INSERT INTO `relation_user_role` VALUES ('2', '3');
INSERT INTO `relation_user_role` VALUES ('3', '5');
INSERT INTO `relation_user_role` VALUES ('2', '7');
INSERT INTO `relation_user_role` VALUES ('3', '9');
INSERT INTO `relation_user_role` VALUES ('2', '11');
INSERT INTO `relation_user_role` VALUES ('3', '13');
INSERT INTO `relation_user_role` VALUES ('2', '15');
INSERT INTO `relation_user_role` VALUES ('3', '17');
INSERT INTO `relation_user_role` VALUES ('3', '19');
INSERT INTO `relation_user_role` VALUES ('3', '21');
INSERT INTO `relation_user_role` VALUES ('2', '23');
INSERT INTO `relation_user_role` VALUES ('3', '25');
INSERT INTO `relation_user_role` VALUES ('3', '27');
INSERT INTO `relation_user_role` VALUES ('2', '29');
INSERT INTO `relation_user_role` VALUES ('3', '31');
INSERT INTO `relation_user_role` VALUES ('3', '33');
INSERT INTO `relation_user_role` VALUES ('2', '35');
INSERT INTO `relation_user_role` VALUES ('3', '37');
INSERT INTO `relation_user_role` VALUES ('3', '39');
INSERT INTO `relation_user_role` VALUES ('3', '41');
INSERT INTO `relation_user_role` VALUES ('3', '43');
INSERT INTO `relation_user_role` VALUES ('2', '45');
INSERT INTO `relation_user_role` VALUES ('3', '47');

-- ----------------------------
-- Table structure for relation_user_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `relation_user_usergroup`;
CREATE TABLE `relation_user_usergroup` (
  `user_group_id` bigint(20) NOT NULL COMMENT '角色编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`user_group_id`,`user_id`),
  KEY `FK_group_to_user` (`user_id`),
  CONSTRAINT `relation_user_usergroup_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `relation_user_usergroup_ibfk_2` FOREIGN KEY (`user_group_id`) REFERENCES `system_user_group` (`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation_user_usergroup
-- ----------------------------

-- ----------------------------
-- Table structure for relation_usergroup_permission
-- ----------------------------
DROP TABLE IF EXISTS `relation_usergroup_permission`;
CREATE TABLE `relation_usergroup_permission` (
  `user_group_id` bigint(20) NOT NULL COMMENT '角色编号',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`user_group_id`,`permission_id`),
  KEY `FK_usergroup_to_permission` (`permission_id`),
  CONSTRAINT `FK_permission_to_user_group` FOREIGN KEY (`user_group_id`) REFERENCES `system_user_group` (`user_group_id`),
  CONSTRAINT `FK_usergroup_to_permission` FOREIGN KEY (`permission_id`) REFERENCES `system_permission` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation_usergroup_permission
-- ----------------------------

-- ----------------------------
-- Table structure for relation_usergroup_role
-- ----------------------------
DROP TABLE IF EXISTS `relation_usergroup_role`;
CREATE TABLE `relation_usergroup_role` (
  `user_group_id` bigint(20) NOT NULL COMMENT '角色编号',
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_group_id`,`role_id`),
  KEY `FK_usergroup_to_role` (`role_id`),
  CONSTRAINT `FK_role_to_usergroup` FOREIGN KEY (`user_group_id`) REFERENCES `system_user_group` (`user_group_id`),
  CONSTRAINT `FK_usergroup_to_role` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation_usergroup_role
-- ----------------------------

-- ----------------------------
-- Table structure for system_module
-- ----------------------------
DROP TABLE IF EXISTS `system_module`;
CREATE TABLE `system_module` (
  `module_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `module_pid` bigint(20) DEFAULT NULL COMMENT '父模块ID',
  `module_name` varchar(80) NOT NULL COMMENT '模块名称',
  `module_url` varchar(1000) DEFAULT NULL COMMENT '模块URL',
  `module_order` int(6) DEFAULT NULL COMMENT '显示顺序',
  `module_type` int(2) DEFAULT NULL COMMENT '1:caas   2:bmp',
  `module_desc` varchar(255) DEFAULT NULL COMMENT '模块简介',
  `has_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  KEY `FK_parent_module` (`module_pid`),
  KEY `FK_parent_deleted_module` (`module_pid`,`has_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of system_module
-- ----------------------------
INSERT INTO `system_module` VALUES ('1', null, 'CMP菜单', '/wapi/,/base/,/omapi/auth/getLoginUser,/omapi/sysmgr/user/modify_password', '1', '1', null, '0');
INSERT INTO `system_module` VALUES ('2', null, '项目管理', '/omapi/business/bizMgr,/omapi/business/appConfigs,/omapi/business/application,/omapi/business/apps,/omapi/business/projects,/omapi/business/containers,/omapi/business/images,/omapi/business/monitor,/omapi/business/warns,/omapi/business/syslogs,/omapi/business/template,/omapi/business/volumes', '1', '2', null, '0');
INSERT INTO `system_module` VALUES ('3', null, '用户查询', '/omapi/sysmgr/user/query_page,/omapi/sysmgr/user/query_all_page,/omapi/sysmgr/user/query_by_id,/omapi/sysmgr/user/query_by_account,/omapi/sysmgr/user/copyPwd', '1', '2', null, '0');
INSERT INTO `system_module` VALUES ('4', null, '用户编辑', '/omapi/auth/register,/omapi/sysmgr/user/update_user,/omapi/sysmgr/user/delete_user,/omapi/sysmgr/user/lock_user,/omapi/sysmgr/user/release_lock_user,/omapi/sysmgr/user/modify_password', '1', '2', null, '0');
INSERT INTO `system_module` VALUES ('5', null, 'BMP通用', '/omapi/auth/getLoginUser,/omapi/sysmgr/user/modify_password', '1', '2', null, '0');
INSERT INTO `system_module` VALUES ('6', null, '项目查询', '/omapi/business/projectsBmp/query_page,/omapi/business/projectsBmp/query_by_id,/omapi/business/projectsItems/query_page,/omapi/business/projectsItems/query,/omapi/business/projectsItems/query_by_id,/omapi/business/projectsBmp/updateCreator', '1', '2', null, '0');
INSERT INTO `system_module` VALUES ('7', null, '项目编辑', '/omapi/business/projectsBmp/save,/omapi/business/projectsBmp/delete,/omapi/business/projectsItems/save,/omapi/business/projectsItems/delete,/omapi/business/projectsItems/getMaxPN', '1', '2', null, '0');
INSERT INTO `system_module` VALUES ('9', null, '消息管理', '/omapi/business/messages', '1', '2', null, '0');
INSERT INTO `system_module` VALUES ('10', null, '平台管理', '/omapi/business/appShop,/omapi/business/images/,/omapi/business/s2iEnvs/', '1', '2', null, '0');
INSERT INTO `system_module` VALUES ('11', null, '集群管理CM,SM', '/omapi/business/routes,/omapi/business/resourceReport,/omapi/business/apps/query,/omapi/business/apps/findOne', '1', '2', null, '0');
INSERT INTO `system_module` VALUES ('12', null, '仪表盘', '/omapi/business/dashboard', '1', '2', null, '0');
INSERT INTO `system_module` VALUES ('13', null, 'SM私有', '/omapi/sys/admin/,/omapi/auth/findAllLdapUsers,/omapi/business/os,/omapi/business/projects/createBuilder,/omapi/business/projects/createPlatform,/omapi/business/clusterMonitor,/wapi/cluster,/omapi/business/clusterWarning,/omapi/business/clusterWarningConfig,/omapi/business/nodeMonitor,/omapi/business/projectsItems/getMaxPN', '1', '2', null, '0');
INSERT INTO `system_module` VALUES ('14', null, 'CM私有', '/omapi/project/admin/,/omapi/business/dashboard/cm,/omapi/auth/findAllLdapUsers,/wapi/overviews/containerLogs,/omapi/business/os/query_os', '1', '2', null, '0');

-- ----------------------------
-- Table structure for system_permission
-- ----------------------------
DROP TABLE IF EXISTS `system_permission`;
CREATE TABLE `system_permission` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `permission_name` varchar(80) NOT NULL COMMENT '权限名称',
  `permission_desc` varchar(255) DEFAULT NULL COMMENT '权限简介',
  `permission_type` int(11) DEFAULT NULL COMMENT '1:菜单权限   2:其它权限',
  `has_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_permission
-- ----------------------------
INSERT INTO `system_permission` VALUES ('1', 'CU权限', null, '1', '0');
INSERT INTO `system_permission` VALUES ('2', 'CM权限', null, '2', '0');
INSERT INTO `system_permission` VALUES ('3', 'SM权限', null, '2', '0');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(80) NOT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL,
  `has_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('1', 'SM', null, '0');
INSERT INTO `system_role` VALUES ('2', 'CM', null, '0');
INSERT INTO `system_role` VALUES ('3', 'CU', null, '0');

-- ----------------------------
-- Table structure for system_user_group
-- ----------------------------
DROP TABLE IF EXISTS `system_user_group`;
CREATE TABLE `system_user_group` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户组编号',
  `user_group_pid` bigint(20) DEFAULT NULL COMMENT '父用户组编号',
  `user_group_name` varchar(80) NOT NULL COMMENT '用户组名称',
  `has_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_group_id`),
  KEY `FK_parent_user_group` (`user_group_pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_cluster_warning
-- ----------------------------
DROP TABLE IF EXISTS `t_cluster_warning`;
CREATE TABLE `t_cluster_warning` (
  `warning_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `node_name` varchar(100) DEFAULT NULL,
  `level` varchar(2) DEFAULT NULL COMMENT '1:一般 2:较重 3:严重 4:特别严重',
  `type` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_deal` tinyint(1) DEFAULT NULL,
  `is_origin` tinyint(1) DEFAULT NULL,
  `cluster_loc` varchar(8) DEFAULT NULL,
  `point` varchar(100) DEFAULT NULL COMMENT '监控点',
  `val` varchar(50) DEFAULT NULL COMMENT '报警值',
  PRIMARY KEY (`warning_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for t_cluster_warning_config
-- ----------------------------
DROP TABLE IF EXISTS `t_cluster_warning_config`;
CREATE TABLE `t_cluster_warning_config` (
  `warning_config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `node_name` varchar(50) DEFAULT NULL COMMENT '服务名称',
  `cpu` decimal(12,2) DEFAULT NULL COMMENT 'cpu预警',
  `mem` decimal(12,2) DEFAULT NULL COMMENT '内存预警',
  `net_send` decimal(12,2) DEFAULT NULL,
  `net_receive` decimal(12,2) DEFAULT NULL COMMENT '带宽预警',
  `vol` decimal(12,2) DEFAULT NULL COMMENT '存储预警',
  `contacts` varchar(2000) DEFAULT NULL COMMENT '联系人json',
  `warning_interval` int(11) DEFAULT NULL COMMENT '间隔时间',
  `warning_type` int(1) DEFAULT NULL COMMENT '1: 手机和邮箱 2: 仅手机 3: 仅邮箱',
  `warning_status` int(1) DEFAULT NULL COMMENT '1: 开启 0: 关闭',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `cluster_loc` int(8) DEFAULT NULL COMMENT '所属集群',
  `level` int(2) DEFAULT NULL COMMENT '1:一般 2:较重 3:严重 4:特别严重',
  `net_device` varchar(1000) DEFAULT NULL,
  `vol_mount_point` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`warning_config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_cluster_warning_config
-- ----------------------------

-- ----------------------------
-- Table structure for t_messages
-- ----------------------------
DROP TABLE IF EXISTS `t_messages`;
CREATE TABLE `t_messages` (
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message_title` varchar(50) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  `operator` bigint(20) DEFAULT NULL,
  `sender` bigint(20) DEFAULT NULL,
  `caas_ref_id` int(11) DEFAULT NULL,
  `message_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for t_projects
-- ----------------------------
DROP TABLE IF EXISTS `t_projects`;
CREATE TABLE `t_projects` (
  `project_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(50) DEFAULT NULL,
  `project_desc` varchar(500) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `has_deleted` tinyint(1) DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `max_cpu` varchar(50) DEFAULT '0',
  `max_mem` varchar(50) DEFAULT '0',
  `max_vol` varchar(50) DEFAULT '0',
  `used_cpu` varchar(50) DEFAULT '0',
  `used_mem` varchar(50) DEFAULT '0',
  `used_vol` varchar(50) DEFAULT '0',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for t_projects_items
-- ----------------------------
DROP TABLE IF EXISTS `t_projects_items`;
CREATE TABLE `t_projects_items` (
  `project_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_item_name` varchar(50) DEFAULT NULL,
  `project_item_desc` varchar(500) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `namespace` varchar(50) DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `has_deleted` tinyint(1) DEFAULT NULL,
  `max_cpu` varchar(50) DEFAULT '0',
  `max_mem` varchar(50) DEFAULT '0',
  `max_vol` varchar(50) DEFAULT '0',
  `max_net` varchar(50) DEFAULT NULL,
  `max_projects` varchar(50) DEFAULT NULL,
  `max_images` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`project_item_id`),
  UNIQUE KEY `IDX_NAMESPACE_DELETED` (`namespace`,`has_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `t_schedule_job`;
CREATE TABLE `t_schedule_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` varchar(64) NOT NULL COMMENT '任务编号',
  `job_name` varchar(256) NOT NULL COMMENT '任务名称',
  `job_class` varchar(256) NOT NULL COMMENT '任务执行类',
  `job_desc` varchar(2048) NOT NULL COMMENT '任务描述',
  `cron` varchar(64) NOT NULL COMMENT '定时表达式',
  `previous_fire_time` timestamp NULL DEFAULT NULL COMMENT '上次执行时间',
  `fire_time` timestamp NULL DEFAULT NULL COMMENT '触发时间',
  `next_fire_time` timestamp NULL DEFAULT NULL COMMENT '下次执行时间',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始执行时间',
  `start_job` int(11) NOT NULL DEFAULT '1' COMMENT '是否启动任务',
  `fail_reason` varchar(8000) DEFAULT NULL COMMENT '任务失败原因',
  `update_user` bigint(20) NOT NULL DEFAULT '1' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_t_schedule_job_job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务表';

-- ----------------------------
-- Records of t_schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(64) NOT NULL COMMENT '帐号',
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `password` varchar(256) DEFAULT NULL COMMENT '密码',
  `post` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `status` varchar(6) NOT NULL DEFAULT 'NORMAL' COMMENT 'NORMAL: 正常。LOCK: 锁定。DEL: 删除。',
  `remark` varchar(500) DEFAULT NULL,
  `manager_type` varchar(5) DEFAULT NULL COMMENT 'SM   CM  CU',
  `ldap_user` tinyint(4) DEFAULT '0' COMMENT '集团域登录',
  `last_pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后修改时间',
  `owner` bigint(20) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT '1' COMMENT '更新人',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `salt` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'superadmin', 'superadmin', '$2a$10$cUkq9CFkd2jJHmXq.3CYxOV7sdIFeMMFGkUG1tVM.HoxgpJLkxm3e', 'other', 'baifen', null, null, 'NORMAL', '超级管理员', 'SM', '0', '2018-06-29 15:11:34', null, null, '2018-06-29 15:11:34', 'F8H95u3MQmaqnILaCrTfxg==');


-- ----------------------------
-- Table structure for t_user_quotas
-- ----------------------------
DROP TABLE IF EXISTS `t_user_quotas`;
CREATE TABLE `t_user_quotas` (
  `quotas_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `max_cpu` varchar(50) DEFAULT '0',
  `max_mem` varchar(50) DEFAULT '0',
  `max_vol` varchar(50) DEFAULT '0',
  `used_cpu` varchar(50) DEFAULT '0',
  `used_mem` varchar(50) DEFAULT '0',
  `used_vol` varchar(50) DEFAULT '0',
  PRIMARY KEY (`quotas_id`),
  UNIQUE KEY `idx_quotas_user_id` (`user_id`)
) ENGINE=MEMORY AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_quotas
-- ----------------------------
INSERT INTO `t_user_quotas` VALUES ('1', '3', '2000', '3072000', '10240000', '100', '102400', '102400');
INSERT INTO `t_user_quotas` VALUES ('3', '7', '1000', '1024000', '1024000', '500', '512000', '512000');
INSERT INTO `t_user_quotas` VALUES ('5', '11', '1000', '1024000', '1024000', '500', '512000', '512000');
INSERT INTO `t_user_quotas` VALUES ('7', '15', '100', '204800', '102400', '20', '51200', '51200');
INSERT INTO `t_user_quotas` VALUES ('9', '23', '10000', '1024000', '1024000', '720', '737280', '737280');
INSERT INTO `t_user_quotas` VALUES ('11', '29', '333', '340992', '340992', '333', '340992', '340992');
INSERT INTO `t_user_quotas` VALUES ('13', '35', '50', '51200', '51200', null, null, null);
INSERT INTO `t_user_quotas` VALUES ('15', '45', '50', '51200', '51200', null, null, null);




CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`%` 
SQL SECURITY DEFINER 
VIEW `view_system_module`AS 
(select `m`.`module_id` AS `module_id`,`m`.`module_pid` AS `module_pid`,`m`.`module_url` AS `module_url` from `hcpaas_bmp`.`system_module` `m` where (`m`.`has_deleted` = 0)) ;
SET FOREIGN_KEY_CHECKS=1;
