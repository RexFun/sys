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
-- Dumping data for table `tb_app`
--

LOCK TABLES `tb_app` WRITE;
/*!40000 ALTER TABLE `tb_app` DISABLE KEYS */;
INSERT INTO `tb_app` VALUES (1,'sys','统一应用管理平台','http://localhost:8686/sys','1','1',83),(3,'origami','折纸','http://localhost:8787/origami','1','2',84),(5,'testapp','testapp','','0','3',88);
/*!40000 ALTER TABLE `tb_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,0,27,3,'Category management','分类管理','2-1','1'),(2,0,2,3,'Model management','模型管理','2-2','1'),(3,0,3,1,'System management','系统管理','1-1','1'),(4,3,4,1,'Menu management','菜单管理','1-1-3','2'),(5,3,5,1,'Permit management','权限管理','1-1-2','2'),(6,3,6,1,'Role management','角色管理','1-1-4','2'),(7,3,7,1,'User management','用户管理','1-1-5','2'),(8,0,61,1,'test','test','1-2','1'),(9,8,62,1,'test-c','test-c','1-2-1','2'),(10,9,67,1,'test-c-c1','test-c-c1','1-2-1-1','2'),(12,3,75,1,'App management','应用管理','1-1-1','2'),(13,9,68,1,'test-c-c2','test-c-c2','1-2-1-2','2'),(14,0,18,3,'Image management','图片管理','2-3','1');
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_permit`
--

LOCK TABLES `tb_permit` WRITE;
/*!40000 ALTER TABLE `tb_permit` DISABLE KEYS */;
INSERT INTO `tb_permit` VALUES (2,84,3,'Model management','模型管理',1,'/admin/model/get.action','2-2'),(3,83,1,'System management','系统管理',1,'','1-1'),(4,3,1,'Menu management','菜单管理',1,'/admin/menu/get.action','1-1-3'),(5,3,1,'Permit management','权限管理',1,'/admin/permit/get.action','1-1-2'),(6,3,1,'Role management','角色管理',1,'/admin/role/get.action','1-1-4'),(7,3,1,'User management','用户管理',1,'/admin/user/get.action','1-1-5'),(13,2,3,'pbtn_add','添加',2,'/admin/model/add1.action','2-2-1'),(14,2,3,'pbtn_del','删除',2,'/admin/model/del.action','2-2-3'),(15,2,3,'pbtn_upd','修改',2,'/admin/model/upd1.action','2-2-4'),(16,2,3,'pbtn_query','查询',2,'/admin/model/getJson.action','2-2-6'),(17,2,3,'pbtn_getById','明细',2,'/admin/model/getById.action','2-2-7'),(18,84,3,'Image management','图片管理',1,'/admin/image/get.action','2-3'),(27,84,3,'Category management','分类管理',1,'/admin/category/get.action','2-1'),(28,27,3,'pbtn_add','添加',2,'/admin/category/add1.action','2-1-1'),(29,27,3,'pbtn_del','删除',2,'/admin/category/del.action','2-1-3'),(30,27,3,'pbtn_upd','修改',2,'/admin/category/upd1.action','2-1-4'),(31,27,3,'pbtn_query','查询',2,'/admin/category/getJson.action','2-1-6'),(32,27,3,'pbtn_getById','明细',2,'/admin/category/getById.action','2-1-7'),(33,5,1,'pbtn_add','添加',2,'/admin/permit/add1.action','2-1-1-1-1'),(34,5,1,'pbtn_del','删除',2,'/admin/permit/del.action','2-1-1-1-3'),(35,5,1,'pbtn_upd','修改',2,'/admin/permit/upd1.action','2-1-1-1-4'),(36,5,1,'pbtn_query','查询',2,'/admin/permit/getJson.action','2-1-1-1-6'),(37,5,1,'pbtn_getById','明细',2,'/admin/permit/getById.action','2-1-1-1-7'),(38,4,1,'pbtn_add','添加',2,'/admin/menu/add1.action','3-1-1-1-1'),(39,4,1,'pbtn_del','删除',2,'/admin/menu/del.action','3-1-1-1-3'),(40,4,1,'pbtn_upd','修改',2,'/admin/menu/upd1.action','3-1-1-1-4'),(41,4,1,'pbtn_query','查询',2,'/admin/menu/getJson.action','3-1-1-1-6'),(42,4,1,'pbtn_getById','明细',2,'/admin/menu/getById.action','3-1-1-1-7'),(43,6,1,'pbtn_add','添加',2,'/admin/role/add1.action','4-1-1-1-1'),(44,6,1,'pbtn_del','删除',2,'/admin/role/del.action','4-1-1-1-3'),(45,6,1,'pbtn_upd','修改',2,'/admin/role/upd1.action','4-1-1-1-4'),(46,6,1,'pbtn_query','查询',2,'/admin/role/getJson.action','4-1-1-1-6'),(47,6,1,'pbtn_getById','明细',2,'/admin/role/getById.action','4-1-1-1-7'),(48,7,1,'pbtn_add','添加',2,'/admin/user/add1.action','5-1-1-1-1'),(49,7,1,'pbtn_del','删除',2,'/admin/user/del.action','5-1-1-1-3'),(50,7,1,'pbtn_upd','修改',2,'/admin/user/upd1.action','5-1-1-1-4'),(51,7,1,'pbtn_query','查询',2,'/admin/user/getJson.action','5-1-1-1-6'),(52,7,1,'pbtn_getById','明细',2,'/admin/user/getById.action','5-1-1-1-7'),(58,6,1,'act_getPermitTreeNodesByRoleId','角色已关联权限',3,'/admin/role/getPermitTreeNodesByRoleId.action','4-1-1-1-7'),(59,83,1,'dict_getRoleTreeNodes','字典-角色',3,'/dict/getRoleTreeNodes.action','9003'),(60,7,1,'act_getRoleTreeNodesByUserId','用户已关联角色',3,'/admin/user/getRoleTreeNodesByUserId.action','5-1-1-1-7'),(61,83,1,'test','test',1,'','2-1'),(62,61,1,'test-c','test-c',1,'','2-1-1'),(67,62,1,'test-c-c1','test-c-c1',1,'','2-1-1-1'),(68,62,1,'test-c-c2','test-c-c2',1,'','2-1-1-2'),(69,27,3,'pbtn_add2','添加2',2,'/admin/category/add2.action','2-1-2'),(70,27,3,'pbtn_upd2','修改2',2,'/admin/category/upd2.action','2-1-5'),(71,5,1,'pbtn_add2','添加2',2,'/admin/permit/add2.action','2-1-1-1-2'),(72,5,1,'pbtn_upd2','修改2',2,'/admin/permit/upd2.action','2-1-1-1-5'),(73,4,1,'pbtn_upd2','修改2',2,'/admin/menu/upd2.action','3-1-1-1-5'),(74,4,1,'pbtn_add2','添加2',2,'/admin/menu/add2.action','3-1-1-1-2'),(75,3,1,'app management','应用管理',1,'/admin/app/get.action','1-1-1'),(76,75,1,'pbtn_add','添加',2,'/admin/app/add1.action','1-1-1-1-1'),(77,75,1,'pbtn_add2','添加2',2,'/admin/app/add2.action','1-1-1-1-2'),(78,75,1,'pbtn_del','删除',2,'/admin/app/del.action','1-1-1-1-3'),(79,75,1,'pbtn_upd','修改',2,'/admin/app/upd1.action','1-1-1-1-4'),(80,75,1,'pbtn_upd2','修改2',2,'/admin/app/upd2.action','1-1-1-1-5'),(81,75,1,'pbtn_query','查询',2,'/admin/app/getJson.action','1-1-1-1-6'),(82,75,1,'pbtn_getById','明细',2,'/admin/app/getById.action','1-1-1-1-7'),(83,0,1,'sys','统一应用管理平台',0,'http://localhost:8686/sys','1'),(84,0,3,'origami','折纸',0,'http://localhost:8787/origami','2'),(85,83,1,'dict_getAppTreeNodes','字典-应用',3,'/dict/getAppTreeNodes.action','9000'),(86,83,1,'dict_getMenuTreeNodes','字典-菜单',3,'/dict/getMenuTreeNodes.action','9002'),(87,83,1,'dict_getPermitTreeNodes','字典-权限',3,'/dict/getPermitTreeNodes.action','9001'),(88,0,NULL,'testapp','testapp',0,'','3'),(89,6,1,'pbtn_add2','添加2',2,'/admin/role/add2.action','4-1-1-1-2'),(90,6,1,'pbtn_upd2','修改2',2,'/admin/role/upd2.action','4-1-1-1-5'),(91,2,3,'pbtn_upd2','修改2',2,'/admin/model/upd2.action','2-2-5'),(92,7,1,'pbtn_add2','添加2',2,'/admin/user/add2.action','5-1-1-1-2'),(93,7,1,'pbtn_upd2','修改2',2,'/admin/user/upd2.action','5-1-1-1-5'),(94,18,3,'pbtn_add','添加',2,'/admin/image/add1.action','2-3-1'),(95,18,3,'pbtn_del','删除',2,'/admin/image/del.action','2-3-2'),(96,18,3,'pbtn_query','查询',2,'/admin/image/getJson.action','2-3-3'),(97,18,3,'pbtn_getById','明细',2,'/admin/image/getById.action','2-3-4'),(98,2,3,'pbtn_add2','添加2',2,'/admin/model/add2.action','2-2-2');
/*!40000 ALTER TABLE `tb_permit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (28,'sys_admin','系统管理员'),(34,'user','普通用户'),(35,'super_admin','超级管理员');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_role_permit_mapping`
--

LOCK TABLES `tb_role_permit_mapping` WRITE;
/*!40000 ALTER TABLE `tb_role_permit_mapping` DISABLE KEYS */;
INSERT INTO `tb_role_permit_mapping` VALUES (1426,28,83),(1427,28,3),(1428,28,5),(1429,28,35),(1430,28,72),(1431,28,36),(1432,28,37),(1433,28,4),(1434,28,38),(1435,28,39),(1436,28,40),(1437,28,41),(1438,28,42),(1439,28,7),(1440,28,51),(1441,28,52),(1442,28,60),(1443,28,59),(1444,28,84),(1445,28,27),(1446,28,28),(1447,28,69),(1448,28,29),(1449,28,30),(1450,28,70),(1451,28,31),(1452,28,32),(1453,28,2),(1454,28,16),(1455,28,17),(1456,28,18),(1476,34,83),(1477,34,3),(1478,34,75),(1479,34,81),(1480,34,82),(1481,34,5),(1482,34,36),(1483,34,37),(1484,34,4),(1485,34,41),(1486,34,42),(1487,34,6),(1488,34,46),(1489,34,47),(1490,34,58),(1491,34,7),(1492,34,51),(1493,34,52),(1494,34,60),(1495,34,84),(1496,34,27),(1497,34,31),(1498,34,32),(1499,34,2),(1500,34,16),(1501,34,17),(1649,35,83),(1650,35,3),(1651,35,75),(1652,35,76),(1653,35,77),(1654,35,78),(1655,35,79),(1656,35,80),(1657,35,81),(1658,35,82),(1659,35,5),(1660,35,33),(1661,35,71),(1662,35,34),(1663,35,35),(1664,35,72),(1665,35,36),(1666,35,37),(1667,35,4),(1668,35,38),(1669,35,74),(1670,35,39),(1671,35,40),(1672,35,73),(1673,35,41),(1674,35,42),(1675,35,6),(1676,35,43),(1677,35,89),(1678,35,44),(1679,35,45),(1680,35,90),(1681,35,46),(1682,35,47),(1683,35,58),(1684,35,7),(1685,35,48),(1686,35,92),(1687,35,49),(1688,35,50),(1689,35,93),(1690,35,51),(1691,35,52),(1692,35,60),(1693,35,61),(1694,35,62),(1695,35,67),(1696,35,68),(1697,35,85),(1698,35,87),(1699,35,86),(1700,35,59),(1701,35,84),(1702,35,27),(1703,35,28),(1704,35,69),(1705,35,29),(1706,35,30),(1707,35,70),(1708,35,31),(1709,35,32),(1710,35,2),(1711,35,13),(1712,35,98),(1713,35,14),(1714,35,15),(1715,35,91),(1716,35,16),(1717,35,17),(1718,35,18),(1719,35,94),(1720,35,95),(1721,35,96),(1722,35,97),(1723,35,88);
/*!40000 ALTER TABLE `tb_role_permit_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (2,'u1','u1','u1@qq.com','E10ADC3949BA59ABBE56E057F20F883E','2016-10-31 05:09:24'),(3,'u2','u2','u2@qq.com','E10ADC3949BA59ABBE56E057F20F883E','2016-11-02 03:33:30'),(4,'u3','u3','u3@qq.com','E10ADC3949BA59ABBE56E057F20F883E','2016-11-02 03:37:02'),(5,'root','root','','63A9F0EA7BB98050796B649E85481845',NULL),(7,'sysadmin1','系统管理员1','','E3CEB5881A0A1FDAAD01296D7554868D','2016-11-07 03:29:47'),(8,'u4','u4','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:24'),(9,'u5','u5','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:34'),(10,'u6','u6','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:42'),(11,'u7','u7','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:48'),(12,'u8','u8','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:55'),(13,'u9','u9','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:04'),(14,'u10','u10','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:20'),(15,'u11','u11','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:28'),(16,'u12','u12','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:35'),(17,'u13','u13','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:42'),(18,'u14','u14','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:51'),(19,'u15','u15','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:57'),(20,'u16','u16','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:07'),(21,'u17','u17','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:14'),(22,'u18','u18','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:22'),(23,'u19','u19','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:30'),(24,'u20','u20','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:38');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2017-05-17 18:10:24
