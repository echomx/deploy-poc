/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
set character set utf8;

DROP DATABASE IF EXISTS `hcpaas_bmp`;
CREATE DATABASE `hcpaas_bmp`;
USE `hcpaas_bmp`;

DROP TABLE IF EXISTS `hcpaas_bmp`.`system_module`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`system_module` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

set character set utf8;
insert  into `system_module`(`module_id`,`module_pid`,`module_name`,`module_url`,`module_order`,`module_type`,`module_desc`,`has_deleted`) values 
(1,NULL,'CMP菜单','/wapi/,/base/,/omapi/auth/getLoginUser',1,1,NULL,0),
(2,NULL,'项目管理','/omapi/business/bizMgr,/omapi/business/appConfigs,/omapi/business/images,/omapi/business/application,/omapi/business/apps,/omapi/business/projects,/omapi/business/containers,/omapi/business/images,/omapi/business/monitor,/omapi/business/warns,/omapi/business/syslogs,/omapi/business/template,/omapi/business/volumes',1,2,NULL,0),
(3,NULL,'用户查询','/omapi/sysmgr/user/query_page,/omapi/sysmgr/user/query_all_page,/omapi/sysmgr/user/query_by_id,/omapi/sysmgr/user/query_by_account,/omapi/sysmgr/user/copyPwd',1,2,NULL,0),
(4,NULL,'用户编辑','/omapi/auth/register,/omapi/sysmgr/user/update_user,/omapi/sysmgr/user/delete_user,/omapi/sysmgr/user/lock_user,/omapi/sysmgr/user/release_lock_user,/omapi/sysmgr/user/modify_password',1,2,NULL,0),
(5,NULL,'BMP通用','/omapi/auth/getLoginUser,/omapi/sysmgr/user/modify_password',1,2,NULL,0),
(6,NULL,'项目查询','/omapi/business/projectsBmp/query_page,/omapi/business/projectsBmp/query_by_id,/omapi/business/projectsItems/query_page,/omapi/business/projectsItems/query,/omapi/business/projectsItems/query_by_id',1,2,NULL,0),
(7,NULL,'项目编辑','/omapi/business/projectsBmp/save,/omapi/business/projectsBmp/delete,/omapi/business/projectsItems/save,/omapi/business/projectsItems/delete',1,2,NULL,0),
(9,NULL,'消息管理','/omapi/business/messages',1,2,NULL,0),
(10,NULL,'应用商店管理','/omapi/business/appShop,/omapi/business/images/',1,2,NULL,0);

DROP TABLE IF EXISTS `hcpaas_bmp`.`system_permission`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`system_permission` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `permission_name` varchar(80) NOT NULL COMMENT '权限名称',
  `permission_desc` varchar(255) DEFAULT NULL COMMENT '权限简介',
  `permission_type` int(11) DEFAULT NULL COMMENT '1:菜单权限   2:其它权限',
  `has_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
set character set utf8;
insert  into `hcpaas_bmp`.`system_permission`(`permission_id`,`permission_name`,`permission_desc`,`permission_type`,`has_deleted`) values 
(1,'CU权限',NULL,1,0),
(2,'CM权限',NULL,2,0),
(3,'SM权限',NULL,2,0);


DROP TABLE IF EXISTS `hcpaas_bmp`.`system_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`system_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(80) NOT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL,
  `has_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

set character set utf8;
insert  into `hcpaas_bmp`.`system_role`(`role_id`,`role_name`,`remark`,`has_deleted`) values 
(1,'SM',NULL,0),
(2,'CM',NULL,0),
(3,'CU',NULL,0);


DROP TABLE IF EXISTS `hcpaas_bmp`.`system_user_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`system_user_group` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户组编号',
  `user_group_pid` bigint(20) DEFAULT NULL COMMENT '父用户组编号',
  `user_group_name` varchar(80) NOT NULL COMMENT '用户组名称',
  `has_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_group_id`),
  KEY `FK_parent_user_group` (`user_group_pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hcpaas_bmp`.`t_messages`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`t_messages` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hcpaas_bmp`.`t_projects`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`t_projects` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hcpaas_bmp`.`t_projects_items`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`t_projects_items` (
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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hcpaas_bmp`.`t_schedule_job`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`t_schedule_job` (
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


DROP TABLE IF EXISTS `hcpaas_bmp`.`t_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(64) NOT NULL COMMENT '帐号',
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `password` varchar(256) NOT NULL COMMENT '密码',
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

set character set utf8;
insert  into `hcpaas_bmp`.`t_user`(`id`,`account`,`name`,`password`,`post`,`department`,`phone`,`email`,`status`,`remark`,`manager_type`,`ldap_user`,`last_pwd_update_date`,`owner`,`update_user`,`update_date`,`salt`) values 
(1,'superadmin','superadmin','$2a$10$cUkq9CFkd2jJHmXq.3CYxOV7sdIFeMMFGkUG1tVM.HoxgpJLkxm3e','other','baifen',NULL,NULL,'NORMAL','超级管理员','SM',0,'2018-06-29 15:11:34',NULL,NULL,'2018-06-29 15:11:34','F8H95u3MQmaqnILaCrTfxg==');


DROP TABLE IF EXISTS `hcpaas_bmp`.`t_user_quotas`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`t_user_quotas` (
  `quotas_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `max_cpu` varchar(50) DEFAULT '0',
  `max_mem` varchar(50) DEFAULT '0',
  `max_vol` varchar(50) DEFAULT '0',
  `used_cpu` varchar(50) DEFAULT '0',
  `used_mem` varchar(50) DEFAULT '0',
  `used_vol` varchar(50) DEFAULT '0',
  PRIMARY KEY (`quotas_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hcpaas_bmp`.`relation_module_permission`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`relation_module_permission` (
  `module_id` bigint(20) NOT NULL COMMENT '模块编号',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`module_id`,`permission_id`),
  KEY `FK_module_to_permission` (`permission_id`),
  CONSTRAINT `FK_module_to_permission` FOREIGN KEY (`permission_id`) REFERENCES `system_permission` (`permission_id`),
  CONSTRAINT `FK_permission_to_module` FOREIGN KEY (`module_id`) REFERENCES `system_module` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
set character set utf8;
insert  into `hcpaas_bmp`.`relation_module_permission`(`module_id`,`permission_id`) values 
(1,1),
(2,2),
(3,2),
(4,2),
(5,2),
(6,2),
(7,2),
(3,3),
(4,3),
(5,3),
(6,3),
(9,3),
(10,3);


DROP TABLE IF EXISTS `hcpaas_bmp`.`relation_role_permission`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`relation_role_permission` (
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FK_role_to_permission` (`permission_id`),
  CONSTRAINT `FK_permission_to_role` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`role_id`),
  CONSTRAINT `FK_role_to_permission` FOREIGN KEY (`permission_id`) REFERENCES `system_permission` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

set character set utf8;
insert  into `hcpaas_bmp`.`relation_role_permission`(`role_id`,`permission_id`) values 
(3,1),
(2,2),
(1,3);


DROP TABLE IF EXISTS `hcpaas_bmp`.`relation_user_permission`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`relation_user_permission` (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `FK_user_to_permission` (`permission_id`),
  CONSTRAINT `FK_permission_to_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_user_to_permission` FOREIGN KEY (`permission_id`) REFERENCES `system_permission` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hcpaas_bmp`.`relation_user_projects_items`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`relation_user_projects_items` (
  `project_item_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`project_item_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hcpaas_bmp`.`relation_user_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`relation_user_role` (
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK_role_to_user` (`user_id`),
  CONSTRAINT `FK_role_to_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_user_to_role` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
set character set utf8;
insert  into `hcpaas_bmp`.`relation_user_role`(`role_id`,`user_id`) values 
(1,1);


DROP TABLE IF EXISTS `hcpaas_bmp`.`relation_user_usergroup`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`relation_user_usergroup` (
  `user_group_id` bigint(20) NOT NULL COMMENT '角色编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`user_group_id`,`user_id`),
  KEY `FK_group_to_user` (`user_id`),
  CONSTRAINT `relation_user_usergroup_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `relation_user_usergroup_ibfk_2` FOREIGN KEY (`user_group_id`) REFERENCES `system_user_group` (`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hcpaas_bmp`.`relation_usergroup_permission`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`relation_usergroup_permission` (
  `user_group_id` bigint(20) NOT NULL COMMENT '角色编号',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`user_group_id`,`permission_id`),
  KEY `FK_usergroup_to_permission` (`permission_id`),
  CONSTRAINT `FK_permission_to_user_group` FOREIGN KEY (`user_group_id`) REFERENCES `system_user_group` (`user_group_id`),
  CONSTRAINT `FK_usergroup_to_permission` FOREIGN KEY (`permission_id`) REFERENCES `system_permission` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `hcpaas_bmp`.`relation_usergroup_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `hcpaas_bmp`.`relation_usergroup_role` (
  `user_group_id` bigint(20) NOT NULL COMMENT '角色编号',
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_group_id`,`role_id`),
  KEY `FK_usergroup_to_role` (`role_id`),
  CONSTRAINT `FK_role_to_usergroup` FOREIGN KEY (`user_group_id`) REFERENCES `system_user_group` (`user_group_id`),
  CONSTRAINT `FK_usergroup_to_role` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

