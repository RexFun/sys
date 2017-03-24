-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: sys
-- ------------------------------------------------------
-- Server version	5.5.49

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_app`
--

DROP TABLE IF EXISTS `tb_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tc_code` varchar(45) DEFAULT NULL,
  `tc_name` varchar(45) DEFAULT NULL,
  `tc_url` varchar(200) DEFAULT NULL,
  `tc_status` varchar(1) DEFAULT NULL,
  `tc_order` varchar(10) DEFAULT NULL,
  `tc_permit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_app`
--

LOCK TABLES `tb_app` WRITE;
/*!40000 ALTER TABLE `tb_app` DISABLE KEYS */;
INSERT INTO `tb_app` VALUES (1,'sys','统一应用管理平台','http://localhost:8686/sys','1','1',83),(3,'origami','折纸','http://localhost:8787/origami','1','2',84),(5,'testapp','testapp','','1','3',88);
/*!40000 ALTER TABLE `tb_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menu`
--

DROP TABLE IF EXISTS `tb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL,
  `tc_permit_id` bigint(20) DEFAULT NULL,
  `tc_app_id` bigint(20) DEFAULT NULL,
  `tc_code` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_order` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `tc_level` varchar(1) CHARACTER SET utf8 DEFAULT '1' COMMENT '级别：0->根节点；1->一级节点；2->次级节点',
  PRIMARY KEY (`id`),
  KEY `fk_permit` (`tc_permit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,0,27,3,'Category management','分类管理','/admin/papercategory/get.action','2-1','1'),(2,0,2,3,'Model management','模型管理','/admin/papermodel/get.action','2-2','1'),(3,0,3,1,'System management','系统管理项','','1-1','1'),(4,3,4,1,'Menu management','菜单管理','/admin/menu/get.action','1-1-3','2'),(5,3,5,1,'Permit management','权限管理','/admin/permit/get.action','1-1-2','2'),(6,3,6,1,'Role management','角色管理','/admin/role/get.action','1-1-4','2'),(7,3,7,1,'User management','用户管理','/admin/user/get.action','1-1-5','2'),(8,0,61,1,'test','test','','1-2','1'),(9,8,62,1,'test-c','test-c','','1-2-1','2'),(10,9,67,1,'test-c-c1','test-c-c1','','1-2-1-1','2'),(12,3,75,1,'App management','应用管理','/admin/app/get.action','1-1-1','2'),(13,9,68,1,'test-c-c2','test-c-c2','','1-2-1-2','2');
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_permit`
--

DROP TABLE IF EXISTS `tb_permit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_permit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT '0',
  `tc_app_id` bigint(20) DEFAULT NULL,
  `tc_code` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_type` int(11) DEFAULT NULL COMMENT '1:菜单权限\n2:按钮权限',
  `tc_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_order` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permit`
--

LOCK TABLES `tb_permit` WRITE;
/*!40000 ALTER TABLE `tb_permit` DISABLE KEYS */;
INSERT INTO `tb_permit` VALUES (2,84,3,'Model management','模型管理',1,'/admin/papermodel/get.action','2-2'),(3,83,1,'System management','系统管理',1,'','1-1'),(4,3,1,'Menu management','菜单管理',1,'/admin/menu/get.action','1-1-3'),(5,3,1,'Permit management','权限管理',1,'/admin/permit/get.action','1-1-2'),(6,3,1,'Role management','角色管理',1,'/admin/role/get.action','1-1-4'),(7,3,1,'User management','用户管理',1,'/admin/user/get.action','1-1-5'),(13,2,3,'pbtn_add','添加',2,'/admin/model/add1.action','2-2-1'),(14,2,3,'pbtn_del','删除',2,'/admin/model/del.action','2-2-3'),(15,2,3,'pbtn_upd','修改',2,'/admin/model/upd1.action','2-2-4'),(16,2,3,'pbtn_query','查询',2,'/admin/model/getJson.action','2-2-5'),(17,2,3,'pbtn_getById','明细',2,'/admin/model/getById.action','2-2-6'),(18,2,3,'pbtn_getImages','图片',2,'/admin/image/get.action','2-2-7'),(27,84,3,'Category management','分类管理',1,'/admin/category/get.action','2-1'),(28,27,3,'pbtn_add','添加',2,'/admin/category/add1.action','2-1-1'),(29,27,3,'pbtn_del','删除',2,'/admin/category/del.action','2-1-3'),(30,27,3,'pbtn_upd','修改',2,'/admin/category/upd1.action','2-1-4'),(31,27,3,'pbtn_query','查询',2,'/admin/category/getJson.action','2-1-6'),(32,27,3,'pbtn_getById','明细',2,'/admin/category/getById.action','2-1-7'),(33,5,1,'pbtn_add','添加',2,'/admin/permit/add1.action','2-1-1-1-1'),(34,5,1,'pbtn_del','删除',2,'/admin/permit/del.action','2-1-1-1-3'),(35,5,1,'pbtn_upd','修改',2,'/admin/permit/upd1.action','2-1-1-1-4'),(36,5,1,'pbtn_query','查询',2,'/admin/permit/getJson.action','2-1-1-1-6'),(37,5,1,'pbtn_getById','明细',2,'/admin/permit/getById.action','2-1-1-1-7'),(38,4,1,'pbtn_add','添加',2,'/admin/menu/add1.action','3-1-1-1-1'),(39,4,1,'pbtn_del','删除',2,'/admin/menu/del.action','3-1-1-1-3'),(40,4,1,'pbtn_upd','修改',2,'/admin/menu/upd1.action','3-1-1-1-4'),(41,4,1,'pbtn_query','查询',2,'/admin/menu/getJson.action','3-1-1-1-6'),(42,4,1,'pbtn_getById','明细',2,'/admin/menu/getById.action','3-1-1-1-7'),(43,6,1,'pbtn_add','添加',2,'/admin/role/add1.action','4-1-1-1-1'),(44,6,1,'pbtn_del','删除',2,'/admin/role/del.action','4-1-1-1-3'),(45,6,1,'pbtn_upd','修改',2,'/admin/role/upd1.action','4-1-1-1-4'),(46,6,1,'pbtn_query','查询',2,'/admin/role/getJson.action','4-1-1-1-5'),(47,6,1,'pbtn_getById','明细',2,'/admin/role/getById.action','4-1-1-1-6'),(48,7,1,'pbtn_add','添加',2,'/admin/user/add1.action','5-1-1-1-1'),(49,7,1,'pbtn_del','删除',2,'/admin/user/del.action','5-1-1-1-3'),(50,7,1,'pbtn_upd','修改',2,'/admin/user/upd1.action','5-1-1-1-4'),(51,7,1,'pbtn_query','查询',2,'/admin/user/getJson.action','5-1-1-1-5'),(52,7,1,'pbtn_getById','明细',2,'/admin/user/getById.action','5-1-1-1-6'),(58,6,1,'act_getPermitTreeNodesByRoleId','角色已关联权限',3,'/admin/role/getPermitTreeNodesByRoleId.action','4-1-1-1-7'),(59,83,1,'dict_getRoleTreeNodes','字典-角色',3,'/dict/getRoleTreeNodes.action','9003'),(60,7,1,'act_getRoleTreeNodesByUserId','用户已关联角色',3,'/admin/user/getRoleTreeNodesByUserId.action','5-1-1-1-7'),(61,83,1,'test','test',1,'','2-1'),(62,61,1,'test-c','test-c',1,'','2-1-1'),(67,62,1,'test-c-c1','test-c-c1',1,'','2-1-1-1'),(68,62,1,'test-c-c2','test-c-c2',1,'','2-1-1-2'),(69,27,3,'pbtn_add2','添加2',2,'/admin/category/add2.action','2-1-2'),(70,27,3,'pbtn_upd2','修改2',2,'/admin/category/upd2.action','2-1-5'),(71,5,1,'pbtn_add2','添加2',2,'/admin/permit/add2.action','2-1-1-1-2'),(72,5,1,'pbtn_upd2','修改2',2,'/admin/permit/upd2.action','2-1-1-1-5'),(73,4,1,'pbtn_upd2','修改2',2,'/admin/menu/upd2.action','3-1-1-1-5'),(74,4,1,'pbtn_add2','添加2',2,'/admin/menu/add2.action','3-1-1-1-2'),(75,3,1,'app management','应用管理',1,'/admin/app/get.action','1-1-1'),(76,75,1,'pbtn_add','添加',2,'/admin/app/add1.action','1-1-1-1-1'),(77,75,1,'pbtn_add2','添加2',2,'/admin/app/add2.action','1-1-1-1-2'),(78,75,1,'pbtn_del','删除',2,'/admin/app/del.action','1-1-1-1-3'),(79,75,1,'pbtn_upd','修改',2,'/admin/app/upd1.action','1-1-1-1-4'),(80,75,1,'pbtn_upd2','修改2',2,'/admin/app/upd2.ac tion','1-1-1-1-5'),(81,75,1,'pbtn_query','查询',2,'/admin/app/getJson.action','1-1-1-1-6'),(82,75,1,'pbtn_getById','明细',2,'/admin/app/getById.action','1-1-1-1-7'),(83,0,1,'sys','统一应用管理平台',0,'http://localhost:8686/sys','1'),(84,0,3,'origami','折纸',0,'http://localhost:8787/origami','2'),(85,83,1,'dict_getAppTreeNodes','字典-应用',3,'/dict/getAppTreeNodes.action','9000'),(86,83,1,'dict_getMenuTreeNodes','字典-菜单',3,'/dict/getMenuTreeNodes.action','9002'),(87,83,1,'dict_getPermitTreeNodes','字典-权限',3,'/dict/getPermitTreeNodes.action','9001'),(88,0,NULL,'testapp','testapp',0,'','3');
/*!40000 ALTER TABLE `tb_permit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tc_code` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (28,'sysadmin','系统管理员'),(29,'r2','r2'),(31,'r4','r4'),(32,'r5','r5'),(33,'r3','r3'),(34,'普通用户','普通用户'),(35,'superadmin','超级管理员'),(36,'ttt','ttt');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_permit_mapping`
--

DROP TABLE IF EXISTS `tb_role_permit_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_permit_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tc_role_id` bigint(20) NOT NULL,
  `tc_permit_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permit` (`tc_permit_id`),
  KEY `fk_role` (`tc_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_permit_mapping`
--

LOCK TABLES `tb_role_permit_mapping` WRITE;
/*!40000 ALTER TABLE `tb_role_permit_mapping` DISABLE KEYS */;
INSERT INTO `tb_role_permit_mapping` VALUES (50,31,3),(51,31,4),(53,32,3),(54,32,4),(55,32,2),(61,33,2),(324,29,3),(325,29,4),(847,34,27),(848,34,28),(849,34,69),(850,34,29),(851,34,30),(852,34,70),(853,34,31),(854,34,32),(855,34,3),(856,34,5),(857,34,35),(858,34,36),(911,28,2),(912,28,16),(913,28,17),(914,28,18),(915,28,3),(916,28,5),(917,28,35),(918,28,72),(919,28,36),(920,28,37),(922,28,4),(923,28,38),(924,28,74),(925,28,39),(926,28,40),(927,28,73),(928,28,41),(929,28,42),(933,28,7),(934,28,51),(935,28,52),(936,28,59),(937,28,60),(1095,35,61),(1096,35,62),(1097,35,67),(1098,35,68),(1099,35,27),(1100,35,28),(1101,35,29),(1102,35,30),(1103,35,31),(1104,35,32),(1105,35,2),(1106,35,13),(1107,35,14),(1108,35,15),(1109,35,16),(1110,35,17),(1111,35,18),(1112,35,3),(1113,35,75),(1114,35,76),(1115,35,77),(1116,35,78),(1117,35,79),(1118,35,80),(1119,35,81),(1120,35,82),(1121,35,5),(1122,35,33),(1123,35,34),(1124,35,35),(1125,35,36),(1126,35,37),(1128,35,4),(1129,35,38),(1130,35,39),(1131,35,40),(1132,35,41),(1133,35,42),(1137,35,6),(1138,35,43),(1139,35,44),(1140,35,45),(1141,35,46),(1142,35,47),(1144,35,58),(1145,35,7),(1146,35,48),(1147,35,49),(1148,35,50),(1149,35,51),(1150,35,52),(1151,35,59),(1152,35,60);
/*!40000 ALTER TABLE `tb_role_permit_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tc_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_add_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (2,'u1','u1','u1@qq.com','E10ADC3949BA59ABBE56E057F20F883E','2016-10-31 05:09:24'),(3,'u2','u2','u2@qq.com','E10ADC3949BA59ABBE56E057F20F883E','2016-11-02 03:33:30'),(4,'u3','u3','u3@qq.com','E10ADC3949BA59ABBE56E057F20F883E','2016-11-02 03:37:02'),(5,'root','root','','63A9F0EA7BB98050796B649E85481845',NULL),(7,'sysadmin1','系统管理员1','','E3CEB5881A0A1FDAAD01296D7554868D','2016-11-07 03:29:47'),(8,'u4','u4','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:24'),(9,'u5','u5','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:34'),(10,'u6','u6','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:42'),(11,'u7','u7','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:48'),(12,'u8','u8','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:55'),(13,'u9','u9','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:04'),(14,'u10','u10','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:20'),(15,'u11','u11','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:28'),(16,'u12','u12','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:35'),(17,'u13','u13','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:42'),(18,'u14','u14','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:51'),(19,'u15','u15','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:57'),(20,'u16','u16','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:07'),(21,'u17','u17','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:14'),(22,'u18','u18','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:22'),(23,'u19','u19','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:30'),(24,'u20','u20','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:38');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_role_mapping`
--

DROP TABLE IF EXISTS `tb_user_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_role_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tc_user_id` bigint(20) NOT NULL,
  `tc_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role` (`tc_role_id`),
  KEY `fk_user` (`tc_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_role_mapping`
--

LOCK TABLES `tb_user_role_mapping` WRITE;
/*!40000 ALTER TABLE `tb_user_role_mapping` DISABLE KEYS */;
INSERT INTO `tb_user_role_mapping` VALUES (43,7,28),(47,3,34),(50,9,34),(51,10,34),(52,11,34),(53,12,34),(54,13,34),(55,14,34),(56,15,34),(57,16,34),(58,17,34),(59,18,34),(60,19,34),(61,20,34),(62,21,34),(63,22,34),(64,23,34),(65,24,34),(71,4,34),(72,8,34),(76,5,35),(79,2,34);
/*!40000 ALTER TABLE `tb_user_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sys'
--
/*!50003 DROP FUNCTION IF EXISTS `f_get_child_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_get_child_list`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET utf8 COLLATE utf8_unicode_ci
begin
	declare sChildList varchar(1000); 
	declare sChildTemp varchar(1000);
	set sChildTemp =cast(rootId as char);
    
    
WHILE sChildTemp is not null DO

	IF (sChildList is not null) THEN 
		SET sChildList = concat(sChildList,',',sChildTemp); 
	ELSE 
		SET sChildList = concat(sChildTemp); 
	END IF;

	SELECT group_concat(id) INTO sChildTemp FROM sys.tb_menu where FIND_IN_SET(pid,sChildTemp)>0;
END WHILE;
RETURN sChildList;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_get_parent_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_get_parent_list`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET utf8 COLLATE utf8_unicode_ci
begin
	declare sParentList varchar(1000); 
	declare sParentTemp varchar(1000);
	set sParentTemp =cast(rootId as char);
    
    
WHILE sParentTemp is not null DO

	IF (sParentList is not null) THEN 
		SET sParentList = concat(sParentTemp,',',sParentList); 
	ELSE 
		SET sParentList = concat(sParentTemp); 
	END IF;

	SELECT group_concat(pid) INTO sParentTemp FROM sys.tb_menu where FIND_IN_SET(id,sParentTemp)>0;
END WHILE;
RETURN sParentList;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_menu_get_by_userId_and_menuName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_menu_get_by_userId_and_menuName`(i_userId   INT,
																				i_menuName VARCHAR(100))
BEGIN
	DECLARE v_menuId_set VARCHAR(1000);
    -- 获取被搜索的菜单id集合
	SELECT group_concat(t.id)
	  INTO v_menuId_set 
	  FROM tb_menu t
	 INNER JOIN tb_role_permit_mapping t1 ON t.tc_permit_id = t1.tc_permit_id
	 INNER JOIN tb_user_role_mapping t2 ON t1.tc_role_id = t2.tc_role_id
			AND t2.tc_user_id = i_userId
	 WHERE t.tc_name LIKE CONCAT('%', i_menuName, '%');
	-- 返回结果集
    SELECT t.* FROM
    (
		SELECT t.*
		  FROM tb_menu t
		 WHERE FIND_IN_SET(t.id, F_GET_PARENT_LIST(v_menuId_set)) 
		UNION 
		SELECT t.*
		  FROM tb_menu t
		 WHERE FIND_IN_SET(t.id, F_GET_CHILD_LIST(v_menuId_set))
	)t
	ORDER BY t.tc_order;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-24 15:26:41
