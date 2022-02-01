-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: didi1
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `basic_order_info_for_users`
--

DROP TABLE IF EXISTS `basic_order_info_for_users`;
/*!50001 DROP VIEW IF EXISTS `basic_order_info_for_users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `basic_order_info_for_users` AS SELECT 
 1 AS `user_id`,
 1 AS `order_type`,
 1 AS `order_time`,
 1 AS `to_address`,
 1 AS `from_address`,
 1 AS `order_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `camera_records`
--

DROP TABLE IF EXISTS `camera_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camera_records` (
  `record_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `camera_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `file_size` bigint unsigned DEFAULT NULL,
  `file_duration` time NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `record_id` (`record_id`),
  KEY `order_id` (`order_id`),
  KEY `camera_id` (`camera_id`),
  CONSTRAINT `camera_records_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  CONSTRAINT `camera_records_ibfk_2` FOREIGN KEY (`camera_id`) REFERENCES `cameras` (`camera_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera_records`
--

LOCK TABLES `camera_records` WRITE;
/*!40000 ALTER TABLE `camera_records` DISABLE KEYS */;
INSERT INTO `camera_records` VALUES (1,1,1,12302,'00:37:38','2021-03-22 12:46:50'),(2,2,1,12302,'00:37:38','2021-03-22 12:46:50'),(3,3,2,20130,'00:40:26','2021-04-13 22:51:49'),(4,4,4,10973,'00:32:13','2021-02-17 09:55:28'),(5,5,4,10932,'00:32:13','2021-02-17 09:55:28'),(6,6,4,10829,'00:32:13','2021-02-17 09:55:28'),(7,4,5,973,'00:14:30','2021-10-02 13:27:21'),(8,5,5,821,'00:14:30','2021-10-02 13:27:21'),(9,6,5,924,'00:14:30','2021-10-02 13:27:21'),(11,1,6,NULL,'00:37:38','2021-12-16 19:33:47'),(12,2,6,NULL,'00:37:38','2021-12-16 19:33:47');
/*!40000 ALTER TABLE `camera_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cameras`
--

DROP TABLE IF EXISTS `cameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cameras` (
  `camera_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`camera_id`),
  UNIQUE KEY `camera_id` (`camera_id`),
  KEY `driver_id` (`driver_id`),
  CONSTRAINT `cameras_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cameras`
--

LOCK TABLES `cameras` WRITE;
/*!40000 ALTER TABLE `cameras` DISABLE KEYS */;
INSERT INTO `cameras` VALUES (1,18),(2,18),(3,19),(4,20),(5,20),(6,20),(7,21),(8,21);
/*!40000 ALTER TABLE `cameras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_colors`
--

DROP TABLE IF EXISTS `car_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_colors` (
  `color_id` int unsigned NOT NULL AUTO_INCREMENT,
  `color_name` varchar(50) NOT NULL,
  PRIMARY KEY (`color_id`),
  UNIQUE KEY `color_name` (`color_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_colors`
--

LOCK TABLES `car_colors` WRITE;
/*!40000 ALTER TABLE `car_colors` DISABLE KEYS */;
INSERT INTO `car_colors` VALUES (1,'black'),(7,'blue'),(8,'brown'),(6,'golden'),(10,'green'),(3,'grey'),(13,'orange'),(11,'pink'),(9,'purple'),(5,'red'),(2,'silver'),(4,'white'),(12,'yellow');
/*!40000 ALTER TABLE `car_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_tail_photos`
--

DROP TABLE IF EXISTS `car_tail_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_tail_photos` (
  `photo_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_size` bigint unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `photo_id` (`photo_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `car_tail_photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_tail_photos`
--

LOCK TABLES `car_tail_photos` WRITE;
/*!40000 ALTER TABLE `car_tail_photos` DISABLE KEYS */;
INSERT INTO `car_tail_photos` VALUES (1,12,'2021-12-14 21:25:38','2021-12-14 21:25:38',18),(2,37,'2021-12-14 21:25:38','2021-12-14 21:25:38',19),(3,115,'2021-12-14 21:25:38','2021-12-14 21:25:38',20),(4,26,'2021-12-16 21:41:22','2021-12-16 21:41:22',21);
/*!40000 ALTER TABLE `car_tail_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_codes`
--

DROP TABLE IF EXISTS `city_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_codes` (
  `city_code` int unsigned NOT NULL,
  `city_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`city_code`),
  UNIQUE KEY `city_code` (`city_code`),
  UNIQUE KEY `city_name` (`city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_codes`
--

LOCK TABLES `city_codes` WRITE;
/*!40000 ALTER TABLE `city_codes` DISABLE KEYS */;
INSERT INTO `city_codes` VALUES (2309,'七台河市'),(4602,'三亚市'),(3504,'三明市'),(4112,'三门峡市'),(3100,'上海市'),(3611,'上饶市'),(4419,'东莞市'),(3705,'东营市'),(6405,'中卫市'),(4420,'中山市'),(6229,'临夏州'),(1410,'临汾市'),(3713,'临沂市'),(5309,'临沧市'),(2106,'丹东市'),(3311,'丽水市'),(5307,'丽江市'),(1509,'乌兰察布市'),(1503,'乌海市'),(6501,'乌鲁木齐市'),(5111,'乐山市'),(3604,'九江市'),(4453,'云浮市'),(3416,'亳州市'),(2307,'伊春市'),(6540,'伊犁州'),(4406,'佛山市'),(2308,'佳木斯市'),(1306,'保定市'),(5305,'保山市'),(4115,'信阳市'),(6530,'克孜勒苏州'),(6502,'克拉玛依市'),(3415,'六安市'),(5202,'六盘水市'),(6201,'兰州市'),(1522,'兴安盟'),(5110,'内江市'),(5134,'凉山州'),(1502,'包头市'),(1100,'北京市'),(4505,'北海市'),(4203,'十堰市'),(3201,'南京市'),(5113,'南充市'),(4501,'南宁市'),(3507,'南平市'),(3601,'南昌市'),(3206,'南通市'),(4113,'南阳市'),(6527,'博尔塔拉州'),(3502,'厦门市'),(2305,'双鸭山市'),(3310,'台州市'),(3401,'合肥市'),(3608,'吉安市'),(2202,'吉林市'),(6521,'吐鲁番市'),(1411,'吕梁市'),(6403,'吴忠市'),(4116,'周口市'),(1507,'呼伦贝尔市'),(1501,'呼和浩特市'),(6532,'和田地区'),(4212,'咸宁市'),(6104,'咸阳市'),(6522,'哈密市'),(2301,'哈尔滨市'),(1302,'唐山市'),(4114,'商丘市'),(6110,'商洛市'),(6531,'喀什地区'),(3304,'嘉兴市'),(6202,'嘉峪关市'),(2203,'四平市'),(6404,'固原市'),(6542,'塔城地区'),(2327,'大兴安岭市'),(1402,'大同市'),(2306,'大庆市'),(5329,'大理州'),(2102,'大连市'),(6205,'天水市'),(1200,'天津市'),(1401,'太原市'),(3710,'威海市'),(4313,'娄底市'),(4209,'孝感市'),(3509,'宁德市'),(3302,'宁波市'),(3408,'安庆市'),(6109,'安康市'),(4105,'安阳市'),(5204,'安顺市'),(6211,'定西市'),(5115,'宜宾市'),(4205,'宜昌市'),(3609,'宜春市'),(6103,'宝鸡市'),(3418,'宣城市'),(3413,'宿州市'),(3213,'宿迁市'),(5405,'山南市'),(4306,'岳阳市'),(4514,'崇左市'),(5119,'巴中市'),(1508,'巴彦淖尔市'),(6528,'巴音郭楞州'),(3204,'常州市'),(4307,'常德市'),(6208,'平凉市'),(4104,'平顶山市'),(5108,'广元市'),(5116,'广安市'),(4401,'广州市'),(6210,'庆阳市'),(1310,'廊坊市'),(6106,'延安市'),(2224,'延边州'),(4102,'开封市'),(1307,'张家口市'),(4308,'张家界市'),(6207,'张掖市'),(3203,'徐州市'),(5331,'德宏州'),(3714,'德州市'),(5106,'德阳市'),(1409,'忻州市'),(4312,'怀化市'),(5333,'怒江州'),(4228,'恩施州'),(4413,'惠州市'),(5101,'成都市'),(3210,'扬州市'),(1308,'承德市'),(3610,'抚州市'),(2104,'抚顺市'),(5401,'拉萨市'),(4452,'揭阳市'),(5104,'攀枝花市'),(5326,'文山州'),(4107,'新乡市'),(3605,'新余市'),(3202,'无锡市'),(5402,'日喀则市'),(3711,'日照市'),(5301,'昆明市'),(6523,'昌吉州'),(5403,'昌都市'),(5306,'昭通市'),(1407,'晋中市'),(1405,'晋城市'),(5308,'普洱市'),(3602,'景德镇市'),(5303,'曲靖市'),(1406,'朔州市'),(2113,'朝阳市'),(2105,'本溪市'),(4513,'来宾市'),(3301,'杭州市'),(2207,'松原市'),(5404,'林芝市'),(6326,'果洛州'),(3704,'枣庄市'),(4502,'柳州市'),(4302,'株洲市'),(4503,'桂林市'),(4414,'梅州市'),(4504,'梧州市'),(5323,'楚雄州'),(6108,'榆林市'),(6206,'武威市'),(4201,'武汉市'),(5205,'毕节市'),(4311,'永州市'),(6107,'汉中市'),(4405,'汕头市'),(4415,'汕尾市'),(4407,'江门市'),(3417,'池州市'),(2101,'沈阳市'),(1309,'沧州市'),(4512,'河池市'),(4416,'河源市'),(3505,'泉州市'),(3709,'泰安市'),(3212,'泰州市'),(5105,'泸州市'),(4103,'洛阳市'),(3701,'济南市'),(3708,'济宁市'),(6321,'海东市'),(6322,'海北州'),(6325,'海南州'),(4601,'海口市'),(6328,'海西州'),(3703,'淄博市'),(3406,'淮北市'),(3404,'淮南市'),(3208,'淮安市'),(4403,'深圳市'),(4418,'清远市'),(3303,'温州市'),(6105,'渭南市'),(3305,'湖州市'),(4303,'湘潭市'),(4331,'湘西州'),(4408,'湛江市'),(3411,'滁州市'),(3506,'漳州市'),(3707,'潍坊市'),(4451,'潮州市'),(4109,'濮阳市'),(3706,'烟台市'),(4108,'焦作市'),(2310,'牡丹江市'),(4509,'玉林市'),(6327,'玉树州'),(5304,'玉溪市'),(4404,'珠海市'),(6230,'甘南州'),(5133,'甘孜州'),(2208,'白城市'),(2206,'白山市'),(6204,'白银市'),(4510,'百色市'),(4309,'益阳市'),(3209,'盐城市'),(2111,'盘锦市'),(5114,'眉山市'),(6402,'石嘴山市'),(1301,'石家庄市'),(3501,'福州市'),(1303,'秦皇岛市'),(5325,'红河州'),(3306,'绍兴市'),(2312,'绥化市'),(5107,'绵阳市'),(3715,'聊城市'),(4412,'肇庆市'),(5103,'自贡市'),(3309,'舟山市'),(3402,'芜湖市'),(3205,'苏州市'),(4409,'茂名市'),(4210,'荆州市'),(4208,'荆门市'),(3503,'莆田市'),(3712,'莱芜'),(3717,'菏泽市'),(3603,'萍乡市'),(2108,'营口市'),(2114,'葫芦岛市'),(3403,'蚌埠市'),(1311,'衡水市'),(4304,'衡阳市'),(3308,'衢州市'),(4206,'襄阳市'),(5328,'西双版纳州'),(6301,'西宁市'),(6101,'西安市'),(4110,'许昌市'),(4508,'贵港市'),(5201,'贵阳市'),(4511,'贺州市'),(5120,'资阳市'),(3607,'赣州市'),(1504,'赤峰市'),(2204,'辽源市'),(2110,'辽阳市'),(5117,'达州市'),(1408,'运城市'),(3207,'连云港市'),(5334,'迪庆州'),(2205,'通化市'),(1505,'通辽市'),(5109,'遂宁市'),(5203,'遵义市'),(1305,'邢台市'),(5406,'那曲市'),(1304,'邯郸市'),(4305,'邵阳市'),(4101,'郑州市'),(4310,'郴州市'),(1506,'鄂尔多斯市'),(4207,'鄂州市'),(6209,'酒泉市'),(5000,'重庆市'),(3307,'金华市'),(6203,'金昌市'),(4507,'钦州市'),(2112,'铁岭市'),(5206,'铜仁市'),(6102,'铜川市'),(3407,'铜陵市'),(6401,'银川市'),(1525,'锡林郭勒盟'),(2107,'锦州市'),(2201,'长春市'),(4301,'长沙市'),(1404,'长治市'),(2109,'阜新市'),(3412,'阜阳市'),(4506,'防城港市'),(4417,'阳江市'),(1403,'阳泉市'),(6529,'阿克苏地区'),(6543,'阿勒泰地区'),(5132,'阿坝州'),(1529,'阿拉善盟'),(5425,'阿里地区'),(6212,'陇南市'),(4213,'随州市'),(5118,'雅安市'),(3702,'青岛市'),(2103,'鞍山市'),(4402,'韶关市'),(3405,'马鞍山市'),(4117,'驻马店市'),(2303,'鸡西市'),(4106,'鹤壁市'),(2304,'鹤岗市'),(3606,'鹰潭市'),(4211,'黄冈市'),(6323,'黄南州'),(3410,'黄山市'),(4202,'黄石市'),(2311,'黑河市'),(5226,'黔东南州'),(5227,'黔南州'),(5223,'黔西南州'),(2302,'齐齐哈尔市'),(3508,'龙岩市');
/*!40000 ALTER TABLE `city_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `detail_order_info_for_users`
--

DROP TABLE IF EXISTS `detail_order_info_for_users`;
/*!50001 DROP VIEW IF EXISTS `detail_order_info_for_users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detail_order_info_for_users` AS SELECT 
 1 AS `user_id`,
 1 AS `order_id`,
 1 AS `nick_name`,
 1 AS `photo_id`,
 1 AS `plate_id`,
 1 AS `car_model`,
 1 AS `car_color_id`,
 1 AS `Name_exp_8`,
 1 AS `price`,
 1 AS `basic_points`,
 1 AS `consumer_points`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `document_status`
--

DROP TABLE IF EXISTS `document_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_status` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `passport_id` tinyint(1) DEFAULT '0',
  `driving_licence` tinyint(1) DEFAULT '0',
  `student_authenticate` tinyint(1) DEFAULT '0',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `inx_passport_exists` (`passport_id`),
  KEY `inx_driving_licence_exists` (`driving_licence`),
  CONSTRAINT `document_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_status`
--

LOCK TABLES `document_status` WRITE;
/*!40000 ALTER TABLE `document_status` DISABLE KEYS */;
INSERT INTO `document_status` VALUES (1,0,0,0,'2021-12-15 19:34:18'),(11,1,0,0,'2021-12-15 15:49:39'),(12,1,0,0,'2021-12-14 20:13:35'),(13,1,0,0,'2021-12-14 20:13:35'),(14,1,0,0,'2021-12-14 20:13:35'),(15,0,0,0,'2021-12-14 19:43:38'),(16,0,0,0,'2021-12-14 19:43:39'),(17,1,0,0,'2021-12-14 20:13:35'),(18,1,1,0,'2021-12-14 21:33:18'),(19,1,1,0,'2021-12-14 21:33:18'),(20,1,1,0,'2021-12-14 21:33:18'),(21,1,1,0,'2021-12-16 20:48:11'),(22,0,0,0,'2021-12-14 19:43:45'),(23,1,0,0,'2021-12-14 20:13:35'),(24,0,0,0,'2021-12-14 19:43:47'),(25,1,0,1,'2021-12-16 19:53:25'),(26,0,0,0,'2021-12-14 19:43:49'),(27,1,0,1,'2021-12-16 19:53:25');
/*!40000 ALTER TABLE `document_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_type_id` bigint unsigned NOT NULL,
  `is_vehicle_owner` tinyint(1) DEFAULT '0',
  `city_id` int unsigned NOT NULL,
  `vehicle_license_id` bigint unsigned DEFAULT NULL,
  `car_tail_photo_id` bigint unsigned DEFAULT NULL,
  `driving_license_id` bigint unsigned NOT NULL,
  `car_color_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_valid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `driving_license_id` (`driving_license_id`),
  UNIQUE KEY `car_tail_photo_id` (`car_tail_photo_id`),
  KEY `order_type_id` (`order_type_id`),
  KEY `city_id` (`city_id`),
  KEY `vehicle_license_id` (`vehicle_license_id`),
  KEY `car_color_id` (`car_color_id`),
  CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `drivers_ibfk_2` FOREIGN KEY (`order_type_id`) REFERENCES `order_types` (`order_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `drivers_ibfk_3` FOREIGN KEY (`city_id`) REFERENCES `city_codes` (`city_code`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `drivers_ibfk_4` FOREIGN KEY (`vehicle_license_id`) REFERENCES `vehicle_licenses` (`vehicle_license_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `drivers_ibfk_5` FOREIGN KEY (`car_tail_photo_id`) REFERENCES `car_tail_photos` (`photo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `drivers_ibfk_6` FOREIGN KEY (`driving_license_id`) REFERENCES `driving_licenses` (`driving_license_id`) ON UPDATE CASCADE,
  CONSTRAINT `drivers_ibfk_7` FOREIGN KEY (`car_color_id`) REFERENCES `car_colors` (`color_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (18,1,1,3301,4,1,4,4,'2021-12-15 17:06:15','2021-12-15 17:06:15',1),(19,2,1,3301,5,2,5,3,'2021-12-15 17:06:15','2021-12-15 17:06:15',1),(20,3,1,3301,6,3,6,5,'2021-12-15 17:06:15','2021-12-15 17:06:15',1),(21,2,1,3301,7,4,10,7,'2021-12-16 21:45:19','2021-12-16 21:45:19',1);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `basic_validation_driver_insert` BEFORE INSERT ON `drivers` FOR EACH ROW BEGIN 
IF NEW.user_id != (SELECT user_id FROM driving_licenses WHERE driving_license_id = NEW.driving_license_id) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'YOU CAN NOT USE THIS DRIVING LICENSE';
END IF;
IF NEW.is_vehicle_owner = 0 THEN 
SET NEW.is_valid =
(SELECT 
CASE 
WHEN date_of_first_issue <= (current_timestamp-INTERVAL 3 YEAR)
AND TIMESTAMPDIFF(YEAR, birthday, NOW()) >= 21 
AND TIMESTAMPDIFF(YEAR, birthday, NOW()) <= 65
THEN TRUE
ELSE FALSE 
END AS is_valid
FROM  driving_licenses WHERE user_id = NEW.user_id);

IF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'driver rent')
THEN 
SET NEW.is_valid =
(SELECT 
CASE 
WHEN date_of_first_issue <= (current_timestamp-INTERVAL 5 YEAR)
AND license_class_id <= (SELECT id FROM license_classes WHERE name = 'C1')
AND TIMESTAMPDIFF(YEAR, birthday, NOW()) >= 25 
AND TIMESTAMPDIFF(YEAR, birthday, NOW()) <= 50
THEN TRUE
ELSE FALSE
END AS is_valid
FROM driving_licenses WHERE user_id = NEW.user_id);
END IF;
ELSE 
IF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'express') 
OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'special')
OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'luxury')
OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'sharing car')
THEN 
SET NEW.is_valid = 
(SELECT 
CASE
WHEN pc.plate_code = (SELECT LEFT(plate_id, 2) FROM vehicle_licenses WHERE user_id = NEW.user_id )
THEN TRUE 
ELSE FALSE 
END AS is_valid
FROM city_codes cc JOIN plate_codes pc ON cc.city_name = pc.city_name 
WHERE cc.city_code = NEW.city_id);
END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `drivers_basic_info`
--

DROP TABLE IF EXISTS `drivers_basic_info`;
/*!50001 DROP VIEW IF EXISTS `drivers_basic_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `drivers_basic_info` AS SELECT 
 1 AS `driver_id`,
 1 AS `nick_name`,
 1 AS `order_type`,
 1 AS `gender`,
 1 AS `birthday_decode`,
 1 AS `photo_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `driving_licenses`
--

DROP TABLE IF EXISTS `driving_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driving_licenses` (
  `driving_license_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(200) NOT NULL,
  `gender` enum('F','M') NOT NULL,
  `nationality` varchar(200) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` date NOT NULL,
  `date_of_first_issue` date NOT NULL,
  `license_class_id` int unsigned NOT NULL,
  `from_valid_period` date NOT NULL,
  `to_valid_period` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`driving_license_id`),
  UNIQUE KEY `driving_license_id` (`driving_license_id`),
  KEY `license_class_id` (`license_class_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `driving_licenses_ibfk_1` FOREIGN KEY (`license_class_id`) REFERENCES `license_classes` (`license_class_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `driving_licenses_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driving_licenses`
--

LOCK TABLES `driving_licenses` WRITE;
/*!40000 ALTER TABLE `driving_licenses` DISABLE KEYS */;
INSERT INTO `driving_licenses` VALUES (4,'歧丹丹','F','汉','浙江省杭州市上城区','1979-05-20','2019-11-28',7,'2019-11-28','2025-11-28','2021-12-14 21:19:54','2021-12-14 21:19:54',18),(5,'似玉石','M','汉','浙江省杭州市上城区','1982-09-16','2011-11-09',7,'2017-07-30','2023-07-30','2021-12-14 21:19:54','2021-12-14 21:19:54',19),(6,'字天晴','F','汉','浙江省杭州市上城区','1988-11-07','2012-04-09',7,'2018-02-12','2024-02-12','2021-12-14 21:19:54','2021-12-14 21:19:54',20),(10,'六明远','M','汉','浙江省杭州市上城区','1978-03-27','1999-09-13',7,'2021-01-12','2027-01-12','2021-12-16 20:48:11','2021-12-16 20:48:11',21);
/*!40000 ALTER TABLE `driving_licenses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `basic_validation_driving_license_insert` BEFORE INSERT ON `driving_licenses` FOR EACH ROW BEGIN 
IF TIMESTAMPDIFF(MONTH, NOW(), NEW.to_valid_period) < 7 THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO VALID DRIVING PERIOD';
ELSEIF (TIMESTAMPDIFF(YEAR, NEW.birthday, NOW()) < 18 OR TIMESTAMPDIFF(YEAR, NEW.birthday, NOW()) > 70) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO VALID AGE';
ELSEIF TIMESTAMPDIFF(YEAR, NEW.date_of_first_issue, NOW()) < 1 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO VALID PEDIOD OF DRIVING TIME';
ELSEIF NEW.license_class_id > (SELECT license_class_id FROM license_classes WHERE class_name = 'C2') THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO VALID LICENSE CLASS';
ELSEIF (SELECT full_name FROM passports WHERE user_id = NEW.user_id) IS NULL THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO PASSPORT INFO'; 
ELSEIF NEW.full_name != (SELECT full_name FROM passports WHERE user_id = NEW.user_id) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'MISMATCH FULLNAME WITH PASSPORT FULLNAME'; 
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tables_update_after_driving_license_insert` AFTER INSERT ON `driving_licenses` FOR EACH ROW BEGIN 
UPDATE document_status 
SET document_status.driving_licence = TRUE 
WHERE document_status.user_id = NEW.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `license_car_photos`
--

DROP TABLE IF EXISTS `license_car_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_car_photos` (
  `vehicle_license_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_size` bigint unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`vehicle_license_id`),
  UNIQUE KEY `vehicle_license_id` (`vehicle_license_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `license_car_photos_ibfk_1` FOREIGN KEY (`vehicle_license_id`) REFERENCES `vehicle_licenses` (`vehicle_license_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `license_car_photos_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_car_photos`
--

LOCK TABLES `license_car_photos` WRITE;
/*!40000 ALTER TABLE `license_car_photos` DISABLE KEYS */;
INSERT INTO `license_car_photos` VALUES (4,124,'2021-12-14 21:24:15','2021-12-14 21:24:15',18),(5,100,'2021-12-14 21:24:15','2021-12-14 21:24:15',19),(6,12,'2021-12-14 21:24:15','2021-12-14 21:24:15',20),(7,230,'2021-12-16 21:37:03','2021-12-16 21:37:03',21);
/*!40000 ALTER TABLE `license_car_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_classes`
--

DROP TABLE IF EXISTS `license_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_classes` (
  `license_class_id` int unsigned NOT NULL AUTO_INCREMENT,
  `class_name` char(2) NOT NULL,
  PRIMARY KEY (`license_class_id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_classes`
--

LOCK TABLES `license_classes` WRITE;
/*!40000 ALTER TABLE `license_classes` DISABLE KEYS */;
INSERT INTO `license_classes` VALUES (1,'A1'),(2,'A2'),(3,'A3'),(4,'B1'),(5,'B2'),(6,'C1'),(7,'C2'),(8,'C3'),(9,'C4'),(10,'C5');
/*!40000 ALTER TABLE `license_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_codes`
--

DROP TABLE IF EXISTS `location_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_codes` (
  `code` double unsigned DEFAULT NULL,
  `city_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_codes`
--

LOCK TABLES `location_codes` WRITE;
/*!40000 ALTER TABLE `location_codes` DISABLE KEYS */;
INSERT INTO `location_codes` VALUES (110000,'北京市'),(110101,'东城区'),(110102,'西城区'),(110105,'朝阳区'),(110106,'丰台区'),(110107,'石景山区'),(110108,'海淀区'),(110109,'门头沟区'),(110111,'房山区'),(110112,'通州区'),(110113,'顺义区'),(110114,'昌平区'),(110115,'大兴区'),(110116,'怀柔区'),(110117,'平谷区'),(110228,'密云区'),(110229,'延庆区'),(120000,'天津市'),(120101,'和平区'),(120102,'河东区'),(120103,'河西区'),(120104,'南开区'),(120105,'河北区'),(120106,'红桥区'),(120110,'东丽区'),(120111,'西青区'),(120112,'津南区'),(120113,'北辰区'),(120114,'武清区'),(120115,'宝坻区'),(120116,'滨海新区'),(120221,'宁河区'),(120223,'静海区'),(120225,'蓟州区'),(130000,'河北省'),(130100,'石家庄市'),(130102,'长安区'),(130103,'桥东区'),(130104,'桥西区'),(130105,'新华区'),(130107,'井陉矿区'),(130108,'裕华区'),(130109,'藁城区'),(130110,'鹿泉区'),(130111,'栾城区'),(130121,'井陉县'),(130123,'正定县'),(130125,'行唐县'),(130126,'灵寿县'),(130127,'高邑县'),(130128,'深泽县'),(130129,'赞皇县'),(130130,'无极县'),(130131,'平山县'),(130132,'元氏县'),(130133,'赵县'),(130181,'辛集市'),(130183,'晋州市'),(130184,'新乐市'),(130200,'唐山市'),(130202,'路南区'),(130203,'路北区'),(130204,'古冶区'),(130205,'开平区'),(130207,'丰南区'),(130208,'丰润区'),(130209,'曹妃甸区'),(130224,'滦南县'),(130225,'乐亭县'),(130227,'迁西县'),(130229,'玉田县'),(130281,'遵化市'),(130283,'迁安市'),(130284,'滦州市'),(130300,'秦皇岛市'),(130302,'海港区'),(130303,'山海关区'),(130304,'北戴河区'),(130306,'抚宁区'),(130321,'青龙县'),(130322,'昌黎县'),(130324,'卢龙县'),(130400,'邯郸市'),(130402,'邯山区'),(130403,'丛台区'),(130404,'复兴区'),(130406,'峰峰矿区'),(130407,'肥乡区'),(130408,'永年区'),(130423,'临漳县'),(130424,'成安县'),(130425,'大名县'),(130426,'涉县'),(130427,'磁县'),(130430,'邱县'),(130431,'鸡泽县'),(130432,'广平县'),(130433,'馆陶县'),(130434,'魏县'),(130435,'曲周县'),(130481,'武安市'),(130500,'邢台市'),(130502,'桥东区'),(130503,'桥西区'),(130521,'邢台县'),(130522,'临城县'),(130523,'内丘县'),(130524,'柏乡县'),(130525,'隆尧县'),(130526,'任县'),(130527,'南和县'),(130528,'宁晋县'),(130529,'巨鹿县'),(130530,'新河县'),(130531,'广宗县'),(130532,'平乡县'),(130533,'威县'),(130534,'清河县'),(130535,'临西县'),(130581,'南宫市'),(130582,'沙河市'),(130600,'保定市'),(130600,'保定市'),(130602,'竞秀区'),(130604,'南市区'),(130606,'莲池区'),(130607,'满城区'),(130608,'清苑区'),(130609,'徐水区'),(130623,'涞水县'),(130624,'阜平县'),(130626,'定兴县'),(130627,'唐县'),(130628,'高阳县'),(130629,'容城县'),(130630,'涞源县'),(130631,'望都县'),(130632,'安新县'),(130633,'易县'),(130634,'曲阳县'),(130635,'蠡县'),(130636,'顺平县'),(130637,'博野县'),(130638,'雄县'),(130681,'涿州市'),(130682,'定州市'),(130683,'安国市'),(130684,'高碑店市'),(130700,'张家口市'),(130702,'桥东区'),(130703,'桥西区'),(130705,'宣化区'),(130706,'下花园区'),(130708,'万全区'),(130709,'崇礼区'),(130721,'宣化县'),(130722,'张北县'),(130723,'康保县'),(130724,'沽源县'),(130725,'尚义县'),(130726,'蔚县'),(130727,'阳原县'),(130728,'怀安县'),(130730,'怀来县'),(130731,'涿鹿县'),(130732,'赤城县'),(130800,'承德市'),(130802,'双桥区'),(130803,'双滦区'),(130804,'鹰手营子矿区'),(130821,'承德县'),(130822,'兴隆县'),(130823,'平泉市'),(130824,'滦平县'),(130825,'隆化县'),(130826,'丰宁满族自治县'),(130827,'宽城县'),(130828,'围场县'),(130900,'沧州市'),(130902,'新华区'),(130903,'运河区'),(130921,'沧县'),(130922,'青县'),(130923,'东光县'),(130924,'海兴县'),(130925,'盐山县'),(130926,'肃宁县'),(130927,'南皮县'),(130928,'吴桥县'),(130929,'献县'),(130930,'孟村回族自治县'),(130981,'泊头市'),(130982,'任丘市'),(130983,'黄骅市'),(130984,'河间市'),(131000,'廊坊市'),(131002,'安次区'),(131003,'广阳区'),(131022,'固安县'),(131023,'永清县'),(131024,'香河县'),(131025,'大城县'),(131026,'文安县'),(131028,'大厂回族自治县'),(131081,'霸州市'),(131082,'三河市'),(131100,'衡水市'),(131102,'桃城区'),(131103,'冀州市'),(131121,'枣强县'),(131122,'武邑县'),(131123,'武强县'),(131124,'饶阳县'),(131125,'安平县'),(131126,'故城县'),(131127,'景县'),(131128,'阜城县'),(131182,'深州市'),(140000,'山西省'),(140100,'太原市'),(140105,'小店区'),(140106,'迎泽区'),(140107,'杏花岭区'),(140108,'尖草坪区'),(140109,'万柏林区'),(140110,'晋源区'),(140121,'清徐县'),(140122,'阳曲县'),(140123,'娄烦县'),(140181,'古交市'),(140200,'大同市'),(140203,'矿区'),(140212,'新荣区'),(140213,'平城区'),(140214,'云冈区'),(140215,'云州区'),(140221,'阳高县'),(140222,'天镇县'),(140223,'广灵县'),(140224,'灵丘县'),(140225,'浑源县'),(140226,'左云县'),(140300,'阳泉市'),(140302,'城区'),(140303,'矿区'),(140311,'郊区'),(140321,'平定县'),(140322,'盂县'),(140400,'长治市'),(140403,'潞州区'),(140404,'上党区'),(140405,'屯留区'),(140406,'潞城区'),(140411,'郊区'),(140423,'襄垣县'),(140425,'平顺县'),(140426,'黎城县'),(140427,'壶关县'),(140428,'长子县'),(140429,'武乡县'),(140430,'沁县'),(140431,'沁源县'),(140500,'晋城市'),(140502,'城区'),(140521,'沁水县'),(140522,'阳城县'),(140524,'陵川县'),(140525,'泽州县'),(140581,'高平市'),(140600,'朔州市'),(140602,'朔城区'),(140603,'平鲁区'),(140621,'山阴县'),(140622,'应县'),(140623,'右玉县'),(140624,'怀仁市'),(140700,'晋中市'),(140702,'榆次区'),(140721,'榆社县'),(140722,'左权县'),(140723,'和顺县'),(140724,'昔阳县'),(140725,'寿阳县'),(140726,'太谷县'),(140727,'祁县'),(140728,'平遥县'),(140729,'灵石县'),(140781,'介休市'),(140800,'运城市'),(140802,'盐湖区'),(140821,'临猗县'),(140822,'万荣县'),(140823,'闻喜县'),(140824,'稷山县'),(140825,'新绛县'),(140826,'绛县'),(140827,'垣曲县'),(140828,'夏县'),(140829,'平陆县'),(140830,'芮城县'),(140881,'永济市'),(140882,'河津市'),(140900,'忻州市'),(140902,'忻府区'),(140921,'定襄县'),(140922,'五台县'),(140923,'代县'),(140924,'繁峙县'),(140925,'宁武县'),(140926,'静乐县'),(140927,'神池县'),(140928,'五寨县'),(140929,'岢岚县'),(140930,'河曲县'),(140931,'保德县'),(140932,'偏关县'),(140981,'原平市'),(141000,'临汾市'),(141002,'尧都区'),(141021,'曲沃县'),(141022,'翼城县'),(141023,'襄汾县'),(141024,'洪洞县'),(141025,'古县'),(141026,'安泽县'),(141027,'浮山县'),(141028,'吉县'),(141029,'乡宁县'),(141030,'大宁县'),(141031,'隰县'),(141032,'永和县'),(141033,'蒲县'),(141034,'汾西县'),(141081,'侯马市'),(141082,'霍州市'),(141100,'吕梁市'),(141102,'离石区'),(141121,'文水县'),(141122,'交城县'),(141123,'兴县'),(141124,'临县'),(141125,'柳林县'),(141126,'石楼县'),(141127,'岚县'),(141128,'方山县'),(141129,'中阳县'),(141130,'交口县'),(141181,'孝义市'),(141182,'汾阳市'),(150000,'内蒙古'),(150100,'呼和浩特市'),(150102,'新城区'),(150103,'回民区'),(150104,'玉泉区'),(150105,'赛罕区'),(150121,'土默特左旗'),(150122,'托克托县'),(150123,'和林格尔县'),(150124,'清水河县'),(150125,'武川县'),(150200,'包头市'),(150202,'东河区'),(150203,'昆都仑区'),(150204,'青山区'),(150205,'石拐区'),(150206,'白云鄂博矿区'),(150207,'九原区'),(150221,'土默特右旗'),(150222,'固阳县'),(150223,'达尔罕旗'),(150300,'乌海市'),(150302,'海勃湾区'),(150303,'海南区'),(150304,'乌达区'),(150400,'赤峰市'),(150402,'红山区'),(150403,'元宝山区'),(150404,'松山区'),(150421,'阿鲁旗'),(150422,'巴林左旗'),(150423,'巴林右旗'),(150424,'林西县'),(150425,'克什克腾旗'),(150426,'翁牛特旗'),(150428,'喀喇沁旗'),(150429,'宁城县'),(150430,'敖汉旗'),(150500,'通辽市'),(150502,'科尔沁区'),(150521,'科尔沁左翼中旗'),(150522,'科尔沁左翼后旗'),(150523,'开鲁县'),(150524,'库伦旗'),(150525,'奈曼旗'),(150526,'扎鲁特旗'),(150571,'经济技术开发区'),(150581,'霍林郭勒市'),(150600,'鄂尔多斯市'),(150602,'东胜区'),(150603,'康巴什区'),(150621,'达拉特旗'),(150622,'准格尔旗'),(150623,'鄂托克前旗'),(150624,'鄂托克旗'),(150625,'杭锦旗'),(150626,'乌审旗'),(150627,'伊金霍洛旗'),(150700,'呼伦贝尔市'),(150702,'海拉尔区'),(150703,'扎赉诺尔区'),(150721,'阿荣旗'),(150722,'莫力达瓦旗'),(150723,'鄂伦春自治旗'),(150724,'鄂温克族自治旗'),(150725,'陈巴尔虎旗'),(150726,'新巴尔虎左旗'),(150727,'新巴尔虎右旗'),(150781,'满洲里市'),(150782,'牙克石市'),(150783,'扎兰屯市'),(150784,'额尔古纳市'),(150785,'根河市'),(150800,'巴彦淖尔市'),(150802,'临河区'),(150821,'五原县'),(150822,'磴口县'),(150823,'乌拉特前旗'),(150824,'乌拉特中旗'),(150825,'乌拉特后旗'),(150826,'杭锦后旗'),(150900,'乌兰察布市'),(150902,'集宁区'),(150921,'卓资县'),(150922,'化德县'),(150923,'商都县'),(150924,'兴和县'),(150925,'凉城县'),(150926,'察哈尔右翼前旗'),(150927,'察哈尔右翼中旗'),(150928,'察哈尔右翼后旗'),(150929,'四子王旗'),(150981,'丰镇市'),(152200,'兴安盟'),(152201,'乌兰浩特市'),(152202,'阿尔山市'),(152221,'科尔沁右翼前旗'),(152222,'科尔沁右翼中旗'),(152223,'扎赉特旗'),(152224,'突泉县'),(152500,'锡林郭勒盟'),(152501,'二连浩特市'),(152502,'锡林浩特市'),(152522,'阿巴嘎旗'),(152523,'苏尼特左旗'),(152524,'苏尼特右旗'),(152525,'东乌珠穆沁旗'),(152526,'西乌珠穆沁旗'),(152527,'太仆寺旗'),(152528,'镶黄旗'),(152529,'正镶白旗'),(152530,'正蓝旗'),(152531,'多伦县'),(152571,'乌拉盖管委会'),(152900,'阿拉善盟'),(152921,'阿拉善左旗'),(152922,'阿拉善右旗'),(152923,'额济纳旗'),(152971,'经济开发区'),(210000,'辽宁省'),(210100,'沈阳市'),(210102,'和平区'),(210103,'沈河区'),(210104,'大东区'),(210105,'皇姑区'),(210106,'铁西区'),(210111,'苏家屯区'),(210112,'浑南区'),(210113,'沈北新区'),(210114,'于洪区'),(210115,'辽中区'),(210123,'康平县'),(210124,'法库县'),(210181,'新民市'),(210200,'大连市'),(210203,'西岗区'),(210204,'沙河口区'),(210211,'甘井子区'),(210212,'旅顺口区'),(210213,'金州区'),(210214,'普兰店区'),(210224,'长海县'),(210281,'瓦房店市'),(210283,'庄河市'),(210300,'鞍山市'),(210302,'铁东区'),(210303,'铁西区'),(210304,'立山区'),(210311,'千山区'),(210321,'台安县'),(210323,'岫岩满族自治县'),(210381,'海城市'),(210400,'抚顺市'),(210402,'新抚区'),(210403,'东洲区'),(210404,'望花区'),(210411,'顺城区'),(210421,'抚顺县'),(210422,'新宾满族自治县'),(210423,'清原满族自治县'),(210500,'本溪市'),(210502,'平山区'),(210503,'溪湖区'),(210504,'明山区'),(210505,'南芬区'),(210521,'本溪满族自治县'),(210522,'桓仁满族自治县'),(210600,'丹东市'),(210602,'元宝区'),(210603,'振兴区'),(210604,'振安区'),(210624,'宽甸满族自治县'),(210681,'东港市'),(210682,'凤城市'),(210700,'锦州市'),(210702,'古塔区'),(210703,'凌河区'),(210711,'太和区'),(210726,'黑山县'),(210727,'义县'),(210781,'凌海市'),(210782,'北镇市'),(210800,'营口市'),(210802,'站前区'),(210803,'西市区'),(210804,'鲅鱼圈区'),(210811,'老边区'),(210881,'盖州市'),(210882,'大石桥市'),(210900,'阜新市'),(210902,'海州区'),(210903,'新邱区'),(210904,'太平区'),(210905,'清河门区'),(210911,'细河区'),(210921,'阜新蒙古族自治县'),(210922,'彰武县'),(211000,'辽阳市'),(211002,'白塔区'),(211003,'文圣区'),(211004,'宏伟区'),(211005,'弓长岭区'),(211011,'太子河区'),(211021,'辽阳县'),(211081,'灯塔市'),(211100,'盘锦市'),(211102,'双台子区'),(211103,'兴隆台区'),(211104,'大洼区'),(211122,'盘山县'),(211200,'铁岭市'),(211202,'银州区'),(211204,'清河区'),(211221,'铁岭县'),(211223,'西丰县'),(211224,'昌图县'),(211281,'调兵山市'),(211282,'开原市'),(211300,'朝阳市'),(211302,'双塔区'),(211303,'龙城区'),(211321,'朝阳县'),(211322,'建平县'),(211324,'喀左县'),(211381,'北票市'),(211382,'凌源市'),(211400,'葫芦岛市'),(211402,'连山区'),(211403,'龙港区'),(211404,'南票区'),(211421,'绥中县'),(211422,'建昌县'),(211481,'兴城市'),(220000,'吉林省'),(220100,'长春市'),(220102,'南关区'),(220103,'宽城区'),(220104,'朝阳区'),(220105,'二道区'),(220106,'绿园区'),(220112,'双阳区'),(220113,'九台区'),(220122,'农安县'),(220182,'榆树市'),(220183,'德惠市'),(220200,'吉林市'),(220202,'昌邑区'),(220203,'龙潭区'),(220204,'船营区'),(220211,'丰满区'),(220221,'永吉县'),(220281,'蛟河市'),(220282,'桦甸市'),(220283,'舒兰市'),(220284,'磐石市'),(220300,'四平市'),(220302,'铁西区'),(220303,'铁东区'),(220322,'梨树县'),(220323,'伊通满族自治县'),(220381,'公主岭市'),(220382,'双辽市'),(220400,'辽源市'),(220402,'龙山区'),(220403,'西安区'),(220421,'东丰县'),(220422,'东辽县'),(220500,'通化市'),(220502,'东昌区'),(220503,'二道江区'),(220521,'通化县'),(220523,'辉南县'),(220524,'柳河县'),(220581,'梅河口市'),(220582,'集安市'),(220600,'白山市'),(220602,'浑江区'),(220605,'江源区'),(220621,'抚松县'),(220622,'靖宇县'),(220623,'长白县'),(220681,'临江市'),(220700,'松原市'),(220702,'宁江区'),(220721,'前郭尔罗斯县'),(220722,'长岭县'),(220723,'乾安县'),(220781,'扶余市'),(220800,'白城市'),(220802,'洮北区'),(220821,'镇赉县'),(220822,'通榆县'),(220881,'洮南市'),(220882,'大安市'),(222400,'延边州'),(222401,'延吉市'),(222402,'图们市'),(222403,'敦化市'),(222404,'珲春市'),(222405,'龙井市'),(222406,'和龙市'),(222424,'汪清县'),(222426,'安图县'),(230000,'黑龙江'),(230100,'哈尔滨市'),(230102,'道里区'),(230103,'南岗区'),(230104,'道外区'),(230108,'平房区'),(230109,'松北区'),(230110,'香坊区'),(230111,'呼兰区'),(230112,'阿城区'),(230113,'双城区'),(230123,'依兰县'),(230124,'方正县'),(230125,'宾县'),(230126,'巴彦县'),(230127,'木兰县'),(230128,'通河县'),(230129,'延寿县'),(230183,'尚志市'),(230184,'五常市'),(230200,'齐齐哈尔市'),(230202,'龙沙区'),(230203,'建华区'),(230204,'铁锋区'),(230205,'昂昂溪区'),(230206,'富拉尔基区'),(230207,'碾子山区'),(230208,'梅里斯达斡尔族区'),(230221,'龙江县'),(230223,'依安县'),(230224,'泰来县'),(230225,'甘南县'),(230227,'富裕县'),(230229,'克山县'),(230230,'克东县'),(230231,'拜泉县'),(230281,'讷河市'),(230300,'鸡西市'),(230302,'鸡冠区'),(230303,'恒山市'),(230304,'滴道区'),(230305,'梨树区'),(230306,'城子河区'),(230307,'麻山区'),(230321,'鸡东县'),(230381,'虎林市'),(230382,'密山市'),(230400,'鹤岗市'),(230402,'向阳区'),(230403,'工农区'),(230404,'南山区'),(230405,'兴安区'),(230406,'东山区'),(230407,'兴山区'),(230421,'萝北县'),(230422,'绥滨县'),(230500,'双鸭山市'),(230502,'尖山区'),(230503,'岭东区'),(230505,'四方台区'),(230506,'宝山区'),(230521,'集贤县'),(230522,'友谊县'),(230523,'宝清县'),(230524,'饶河县'),(230600,'大庆市'),(230602,'萨尔图区'),(230603,'龙凤区'),(230604,'让胡路区'),(230605,'红岗区'),(230606,'大同区'),(230621,'肇州县'),(230622,'肇源县'),(230623,'林甸县'),(230624,'杜尔伯特蒙县'),(230671,'高新技术产业开发区'),(230700,'伊春市'),(230703,'南岔县del'),(230707,'丰林县'),(230708,'美溪区'),(230709,'金林区DEL'),(230710,'五营区'),(230714,'乌伊岭区'),(230715,'红星区'),(230717,'伊美区'),(230718,'乌翠区'),(230719,'友好区'),(230722,'嘉荫县'),(230723,'汤旺县'),(230724,'丰林县'),(230725,'大箐山县'),(230726,'南岔县'),(230751,'金林区'),(230781,'铁力市'),(230800,'佳木斯市'),(230803,'向阳区'),(230804,'前进区'),(230805,'东风区'),(230811,'郊区'),(230822,'桦南县'),(230826,'桦川县'),(230828,'汤原县'),(230881,'同江市'),(230882,'富锦市'),(230883,'抚远市'),(230900,'七台河市'),(230902,'新兴区'),(230903,'桃山市'),(230904,'茄子河区'),(230921,'勃利县'),(231000,'牡丹江市'),(231002,'东安区'),(231003,'阳明区'),(231004,'爱民区'),(231005,'西安区'),(231025,'林口县'),(231081,'绥芬河市'),(231083,'海林市'),(231084,'宁安市'),(231085,'穆棱市'),(231086,'东宁市'),(231100,'黑河市'),(231102,'爱辉区'),(231121,'嫩江市'),(231123,'逊克县'),(231124,'孙吴县'),(231181,'北安市'),(231182,'五大连池市'),(231200,'绥化市'),(231202,'北林区'),(231221,'望奎县'),(231222,'兰西县'),(231223,'青冈县'),(231224,'庆安县'),(231225,'明水县'),(231226,'绥棱县'),(231281,'安达市'),(231282,'肇东市'),(231283,'海伦市'),(232700,'大兴安岭市'),(232701,'漠河市'),(232721,'呼玛县'),(232722,'塔河县'),(232761,'加格达奇区'),(232762,'松岭区'),(232763,'新林区'),(232764,'呼中区'),(310000,'上海市'),(310101,'黄浦区'),(310104,'徐汇区'),(310105,'长宁区'),(310106,'静安区'),(310107,'普陀区'),(310109,'虹口区'),(310110,'杨浦区'),(310112,'闵行区'),(310113,'宝山区'),(310114,'嘉定区'),(310115,'浦东新区'),(310116,'金山区'),(310117,'松江区'),(310118,'青浦区'),(310120,'奉贤区'),(310230,'崇明区'),(320000,'江苏省'),(320100,'南京市'),(320102,'玄武区'),(320104,'秦淮区'),(320105,'建邺区'),(320106,'鼓楼区'),(320111,'浦口区'),(320113,'栖霞区'),(320114,'雨花台区'),(320115,'江宁区'),(320116,'六合区'),(320124,'溧水区'),(320125,'高淳区'),(320200,'无锡市'),(320205,'锡山区'),(320206,'惠山区'),(320211,'滨湖区'),(320213,'梁溪区'),(320214,'新吴区'),(320281,'江阴市'),(320282,'宜兴市'),(320300,'徐州市'),(320302,'鼓楼区'),(320303,'云龙区'),(320305,'贾汪区'),(320311,'泉山区'),(320312,'铜山区'),(320321,'丰县'),(320322,'沛县'),(320324,'睢宁县'),(320381,'新沂市'),(320382,'邳州市'),(320400,'常州市'),(320402,'天宁区'),(320404,'钟楼区'),(320411,'新北区'),(320412,'武进区'),(320481,'溧阳市'),(320482,'金坛区'),(320500,'苏州市'),(320505,'虎丘区'),(320506,'吴中区'),(320507,'相城区'),(320508,'姑苏区'),(320509,'吴江区'),(320581,'常熟市'),(320582,'张家港市'),(320583,'昆山市'),(320585,'太仓市'),(320600,'南通市'),(320602,'崇川区'),(320611,'港闸区'),(320612,'通州区'),(320621,'海安市'),(320623,'如东市'),(320681,'启东市'),(320682,'如皋市'),(320684,'海门市'),(320700,'连云港市'),(320703,'连云区'),(320706,'海州区'),(320721,'赣榆区'),(320722,'东海县'),(320723,'灌云县'),(320724,'灌南县'),(320800,'淮安市'),(320803,'淮安区'),(320804,'淮阴区'),(320812,'清江浦区'),(320826,'涟水县'),(320829,'洪泽区'),(320830,'盱眙县'),(320831,'金湖县'),(320900,'盐城市'),(320902,'亭湖区'),(320903,'盐都区'),(320904,'大丰区'),(320921,'响水县'),(320922,'滨海县'),(320923,'阜宁县'),(320924,'射阳县'),(320925,'建湖县'),(320981,'东台市'),(321000,'扬州市'),(321002,'广陵区'),(321003,'邗江区'),(321012,'江都区'),(321023,'宝应县'),(321081,'仪征市'),(321084,'高邮市'),(321101,'镇江市'),(321102,'京口区'),(321111,'润州区'),(321112,'丹徒区'),(321181,'丹阳市'),(321182,'扬中市'),(321183,'句容市'),(321200,'泰州市'),(321202,'海陵区'),(321203,'高港区'),(321281,'兴化市'),(321282,'靖江市'),(321283,'泰兴市'),(321284,'姜堰区'),(321300,'宿迁市'),(321302,'宿城区'),(321311,'宿豫区'),(321322,'沭阳县'),(321323,'泗阳县'),(321324,'泗洪县'),(330000,'浙江省'),(330100,'杭州市'),(330102,'上城区'),(330103,'下城区'),(330104,'江干区'),(330105,'拱墅区'),(330106,'西湖区'),(330108,'滨江区'),(330109,'萧山区'),(330110,'余杭区'),(330111,'富阳区'),(330112,'临安区'),(330122,'桐庐县'),(330127,'淳安县'),(330182,'建德市'),(330200,'宁波市'),(330203,'海曙区'),(330205,'江北区'),(330206,'北仑区'),(330211,'镇海区'),(330212,'鄞州区'),(330213,'奉化区'),(330225,'象山县'),(330226,'宁海县'),(330281,'余姚市'),(330282,'慈溪市'),(330300,'温州市'),(330302,'鹿城区'),(330303,'龙湾区'),(330304,'瓯海区'),(330322,'洞头区'),(330324,'永嘉县'),(330326,'平阳县'),(330327,'苍南县'),(330328,'文成县'),(330329,'泰顺县'),(330381,'瑞安市'),(330382,'乐清市'),(330383,'龙港市'),(330400,'嘉兴市'),(330402,'南湖区'),(330411,'秀洲区'),(330421,'嘉善县'),(330424,'海盐县'),(330481,'海宁市'),(330482,'平湖市'),(330483,'桐乡市'),(330500,'湖州市'),(330502,'吴兴区'),(330503,'南浔区'),(330521,'德清县'),(330522,'长兴县'),(330523,'安吉县'),(330600,'绍兴市'),(330602,'越城区'),(330621,'柯桥区'),(330624,'新昌县'),(330681,'诸暨市'),(330682,'上虞区'),(330683,'嵊州市'),(330700,'金华市'),(330702,'婺城区'),(330703,'金东区'),(330723,'武义县'),(330726,'浦江县'),(330727,'磐安县'),(330781,'兰溪市'),(330782,'义乌市'),(330783,'东阳市'),(330784,'永康市'),(330800,'衢州市'),(330802,'柯城区'),(330803,'衢江区'),(330822,'常山县'),(330824,'开化县'),(330825,'龙游县'),(330881,'江山市'),(330900,'舟山市'),(330902,'定海区'),(330903,'普陀区'),(330921,'岱山县'),(330922,'嵊泗县'),(331000,'台州市'),(331002,'椒江区'),(331003,'黄岩区'),(331004,'路桥区'),(331021,'玉环市'),(331022,'三门县'),(331023,'天台县'),(331024,'仙居县'),(331081,'温岭市'),(331082,'临海市'),(331100,'丽水市'),(331102,'莲都区'),(331121,'青田县'),(331122,'缙云县'),(331123,'遂昌县'),(331124,'松阳县'),(331125,'云和县'),(331126,'庆元县'),(331127,'景宁县'),(331181,'龙泉市'),(340000,'安徽省'),(340100,'合肥市'),(340102,'瑶海区'),(340103,'庐阳区'),(340104,'蜀山区'),(340111,'包河区'),(340121,'长丰县'),(340122,'肥东县'),(340123,'肥西县'),(340124,'庐江县'),(340181,'巢湖市'),(340200,'芜湖市'),(340202,'镜湖区'),(340203,'弋江区'),(340207,'鸠江区'),(340208,'三山区'),(340221,'芜湖县'),(340222,'繁昌县'),(340223,'南陵县'),(340225,'无为县'),(340300,'蚌埠市'),(340302,'龙子湖区'),(340303,'蚌山区'),(340304,'禹会区'),(340311,'淮上区'),(340321,'怀远县'),(340322,'五河县'),(340323,'固镇县'),(340400,'淮南市'),(340402,'大通区'),(340403,'田家庵区'),(340404,'谢家集区'),(340405,'八公山区'),(340406,'潘集区'),(340421,'凤台县'),(340422,'寿县'),(340500,'马鞍山市'),(340502,'博望区'),(340503,'花山区'),(340504,'雨山区'),(340521,'当涂县'),(340522,'含山县'),(340600,'淮北市'),(340602,'杜集区'),(340603,'相山区'),(340604,'烈山区'),(340621,'濉溪县'),(340700,'铜陵市'),(340702,'铜官区'),(340706,'义安区'),(340711,'郊区'),(340722,'枞阳县'),(340800,'安庆市'),(340802,'迎江区'),(340803,'大观区'),(340811,'宜秀区'),(340822,'怀宁县'),(340824,'潜山市'),(340825,'太湖县'),(340826,'宿松县'),(340827,'望江县'),(340828,'岳西县'),(340881,'桐城市'),(341000,'黄山市'),(341002,'屯溪区'),(341003,'黄山区'),(341004,'徽州区'),(341021,'歙县'),(341022,'休宁县'),(341023,'黟县'),(341024,'祁门县'),(341100,'滁州市'),(341102,'琅琊区'),(341103,'南谯区'),(341122,'来安县'),(341124,'全椒县'),(341125,'定远县'),(341126,'凤阳县'),(341181,'天长市'),(341182,'明光市'),(341200,'阜阳市'),(341202,'颍州区'),(341203,'颍东区'),(341204,'颍泉区'),(341221,'临泉县'),(341222,'太和县'),(341225,'阜南县'),(341226,'颍上县'),(341282,'界首市'),(341300,'宿州市'),(341302,'埇桥区'),(341321,'砀山县'),(341322,'萧县'),(341323,'灵璧县'),(341324,'泗县'),(341424,'和县'),(341500,'六安市'),(341502,'金安区'),(341503,'裕安区'),(341504,'叶集区'),(341522,'霍邱县'),(341523,'舒城县'),(341524,'金寨县'),(341525,'霍山县'),(341600,'亳州市'),(341602,'谯城区'),(341621,'涡阳县'),(341622,'蒙城县'),(341623,'利辛县'),(341700,'池州市'),(341702,'贵池区'),(341721,'东至县'),(341722,'石台县'),(341723,'青阳县'),(341800,'宣城市'),(341802,'宣州区'),(341821,'郎溪县'),(341823,'泾县'),(341824,'绩溪县'),(341825,'旌德县'),(341881,'宁国市'),(341882,'广德市'),(350000,'福建省'),(350100,'福州市'),(350102,'鼓楼区'),(350103,'台江区'),(350104,'仓山区'),(350105,'马尾区'),(350111,'晋安区'),(350112,'长乐区'),(350121,'闽侯县'),(350122,'连江县'),(350123,'罗源县'),(350124,'闽清县'),(350125,'永泰县'),(350128,'平潭县'),(350181,'福清市'),(350200,'厦门市'),(350203,'思明区'),(350205,'海沧区'),(350206,'湖里区'),(350211,'集美区'),(350212,'同安区'),(350213,'翔安区'),(350300,'莆田市'),(350302,'城厢区'),(350303,'涵江区'),(350304,'荔城区'),(350305,'秀屿区'),(350322,'仙游县'),(350400,'三明市'),(350402,'梅列区'),(350403,'三元区'),(350421,'明溪县'),(350423,'清流县'),(350424,'宁化县'),(350425,'大田县'),(350426,'尤溪县'),(350427,'沙县'),(350428,'将乐县'),(350429,'泰宁县'),(350430,'建宁县'),(350481,'永安市'),(350500,'泉州市'),(350502,'鲤城区'),(350503,'丰泽区'),(350504,'洛江区'),(350505,'泉港区'),(350521,'惠安县'),(350524,'安溪县'),(350525,'永春县'),(350526,'德化县'),(350527,'金门县'),(350581,'石狮市'),(350582,'晋江市'),(350583,'南安市'),(350600,'漳州市'),(350602,'芗城区'),(350603,'龙文区'),(350622,'云霄县'),(350623,'漳浦县'),(350624,'诏安县'),(350625,'长泰县'),(350626,'东山县'),(350627,'南靖县'),(350628,'平和县'),(350629,'华安县'),(350681,'龙海市'),(350700,'南平市'),(350702,'延平区'),(350703,'建阳区'),(350721,'顺昌县'),(350722,'浦城县'),(350723,'光泽县'),(350724,'松溪县'),(350725,'政和县'),(350781,'邵武市'),(350782,'武夷山市'),(350783,'建瓯市'),(350800,'龙岩市'),(350802,'新罗区'),(350803,'永定区'),(350821,'长汀县'),(350823,'上杭县'),(350824,'武平县'),(350825,'连城县'),(350881,'漳平市'),(350900,'宁德市'),(350902,'蕉城区'),(350921,'霞浦县'),(350922,'古田县'),(350923,'屏南县'),(350924,'寿宁县'),(350925,'周宁县'),(350926,'柘荣县'),(350981,'福安市'),(350982,'福鼎市'),(360000,'江西省'),(360100,'南昌市'),(360102,'东湖区'),(360103,'西湖区'),(360104,'青云谱区'),(360105,'湾里区'),(360111,'青山湖区'),(360121,'南昌县'),(360122,'新建区'),(360123,'安义县'),(360124,'进贤县'),(360200,'景德镇市'),(360202,'昌江区'),(360203,'珠山区'),(360222,'浮梁县'),(360281,'乐平市'),(360300,'萍乡市'),(360302,'安源区'),(360313,'湘东区'),(360321,'莲花县'),(360322,'上栗县'),(360323,'芦溪县'),(360400,'九江市'),(360402,'濂溪区'),(360403,'浔阳区'),(360421,'柴桑区'),(360423,'武宁县'),(360424,'修水县'),(360425,'永修县'),(360426,'德安县'),(360427,'庐山市'),(360428,'都昌县'),(360429,'湖口县'),(360430,'彭泽县'),(360481,'瑞昌市'),(360482,'共青城市'),(360500,'新余市'),(360502,'渝水区'),(360521,'分宜县'),(360600,'鹰潭市'),(360602,'月湖区'),(360603,'余江区'),(360681,'贵溪市'),(360700,'赣州市'),(360702,'章贡区'),(360704,'赣县区'),(360722,'信丰县'),(360723,'大余县'),(360724,'上犹县'),(360725,'崇义县'),(360726,'安远县'),(360727,'龙南县'),(360728,'定南县'),(360729,'全南县'),(360730,'宁都县'),(360731,'于都县'),(360732,'兴国县'),(360733,'会昌县'),(360734,'寻乌县'),(360735,'石城县'),(360781,'瑞金市'),(360782,'南康区'),(360800,'吉安市'),(360802,'吉州区'),(360803,'青原区'),(360821,'吉安县'),(360822,'吉水县'),(360823,'峡江县'),(360824,'新干县'),(360825,'永丰县'),(360826,'泰和县'),(360827,'遂川县'),(360828,'万安县'),(360829,'安福县'),(360830,'永新县'),(360881,'井冈山市'),(360900,'宜春市'),(360902,'袁州区'),(360921,'奉新县'),(360922,'万载县'),(360923,'上高县'),(360924,'宜丰县'),(360925,'靖安县'),(360926,'铜鼓县'),(360981,'丰城市'),(360982,'樟树市'),(360983,'高安市'),(361000,'抚州市'),(361002,'临川区'),(361003,'东乡区'),(361021,'南城县'),(361022,'黎川县'),(361023,'南丰县'),(361024,'崇仁县'),(361025,'乐安县'),(361026,'宜黄县'),(361027,'金溪县'),(361028,'资溪县'),(361030,'广昌县'),(361100,'上饶市'),(361102,'信州区'),(361121,'上饶县'),(361122,'广丰区'),(361123,'玉山县'),(361124,'铅山县'),(361125,'横峰县'),(361126,'弋阳县'),(361127,'余干县'),(361128,'鄱阳县'),(361129,'万年县'),(361130,'婺源县'),(361181,'德兴市'),(370000,'山东省'),(370100,'济南市'),(370102,'历下区'),(370103,'市中区'),(370104,'槐荫区'),(370105,'天桥区'),(370112,'历城区'),(370113,'长清区'),(370114,'章丘区'),(370124,'平阴县'),(370125,'济阳区'),(370126,'商河县'),(370200,'青岛市'),(370202,'市南区'),(370203,'市北区'),(370211,'黄岛区'),(370212,'崂山区'),(370213,'李沧区'),(370214,'城阳区'),(370281,'胶州市'),(370282,'即墨区'),(370283,'平度市'),(370285,'莱西市'),(370300,'淄博市'),(370302,'淄川区'),(370303,'张店区'),(370304,'博山区'),(370305,'临淄区'),(370306,'周村区'),(370321,'桓台县'),(370322,'高青县'),(370323,'沂源县'),(370400,'枣庄市'),(370402,'市中区'),(370403,'薛城区'),(370404,'峄城区'),(370405,'台儿庄区'),(370406,'山亭区'),(370481,'滕州市'),(370500,'东营市'),(370502,'东营区'),(370503,'河口区'),(370505,'垦利区'),(370522,'利津县'),(370523,'广饶县'),(370600,'烟台市'),(370602,'芝罘区'),(370611,'福山区'),(370612,'牟平区'),(370613,'莱山区'),(370634,'长岛县'),(370681,'龙口市'),(370682,'莱阳市'),(370683,'莱州市'),(370684,'蓬莱市'),(370685,'招远市'),(370686,'栖霞市'),(370687,'海阳市'),(370700,'潍坊市'),(370702,'潍城区'),(370703,'寒亭区'),(370704,'坊子区'),(370705,'奎文区'),(370724,'临朐县'),(370725,'昌乐县'),(370781,'青州市'),(370782,'诸城市'),(370783,'寿光市'),(370784,'安丘市'),(370785,'高密市'),(370786,'昌邑市'),(370800,'济宁市'),(370802,'市中区'),(370811,'任城区'),(370812,'兖州区'),(370826,'微山县'),(370827,'鱼台县'),(370828,'金乡县'),(370829,'嘉祥县'),(370830,'汶上县'),(370831,'泗水县'),(370832,'梁山县'),(370881,'曲阜市'),(370883,'邹城市'),(370900,'泰安市'),(370902,'泰山区'),(370911,'岱岳区'),(370921,'宁阳县'),(370923,'东平县'),(370982,'新泰市'),(370983,'肥城市'),(371000,'威海市'),(371002,'环翠区'),(371081,'文登区'),(371082,'荣成市'),(371083,'乳山市'),(371100,'日照市'),(371102,'东港区'),(371103,'岚山区'),(371121,'五莲县'),(371122,'莒县'),(371200,'莱芜'),(371202,'莱芜区'),(371203,'钢城区'),(371300,'临沂市'),(371302,'兰山区'),(371311,'罗庄区'),(371312,'河东区'),(371321,'沂南县'),(371322,'郯城县'),(371323,'沂水县'),(371324,'兰陵县'),(371325,'费县'),(371326,'平邑县'),(371327,'莒南县'),(371328,'蒙阴县'),(371329,'临沭县'),(371400,'德州市'),(371402,'德城区'),(371403,'陵城区'),(371422,'宁津县'),(371423,'庆云县'),(371424,'临邑县'),(371425,'齐河县'),(371426,'平原县'),(371427,'夏津县'),(371428,'武城县'),(371481,'乐陵市'),(371482,'禹城市'),(371500,'聊城市'),(371502,'东昌府区'),(371521,'阳谷县'),(371522,'莘县'),(371523,'茌平县'),(371524,'东阿县'),(371525,'冠县'),(371526,'高唐县'),(371581,'临清市'),(371602,'滨城区'),(371603,'沾化区'),(371621,'惠民县'),(371622,'阳信县'),(371623,'无棣县'),(371625,'博兴县'),(371626,'邹平市'),(371700,'菏泽市'),(371702,'牡丹区'),(371703,'定陶区'),(371721,'曹县'),(371722,'单县'),(371723,'成武县'),(371724,'巨野县'),(371725,'郓城县'),(371726,'鄄城县'),(371728,'东明县'),(410000,'河南省'),(410100,'郑州市'),(410102,'中原区'),(410103,'二七区'),(410104,'管城回族区'),(410105,'金水区'),(410106,'上街区'),(410108,'惠济区'),(410122,'中牟县'),(410181,'巩义市'),(410182,'荥阳市'),(410183,'新密市'),(410184,'新郑市'),(410185,'登封市'),(410200,'开封市'),(410202,'龙亭区'),(410203,'顺河回族区'),(410204,'鼓楼区'),(410205,'禹王台区'),(410211,'金明区'),(410212,'祥符区'),(410221,'杞县'),(410222,'通许县'),(410223,'尉氏县'),(410225,'兰考县'),(410300,'洛阳市'),(410302,'老城区'),(410303,'西工区'),(410304,'瀍河区'),(410305,'涧西区'),(410306,'吉利区'),(410311,'洛龙区'),(410322,'孟津县'),(410323,'新安县'),(410324,'栾川县'),(410325,'嵩县'),(410326,'汝阳县'),(410327,'宜阳县'),(410328,'洛宁县'),(410329,'伊川县'),(410381,'偃师市'),(410400,'平顶山市'),(410402,'新华区'),(410403,'卫东区'),(410404,'石龙区'),(410411,'湛河区'),(410421,'宝丰县'),(410422,'叶县'),(410423,'鲁山县'),(410425,'郏县'),(410481,'舞钢市'),(410482,'汝州市'),(410500,'安阳市'),(410502,'文峰区'),(410503,'北关区'),(410505,'殷都区'),(410506,'龙安区'),(410522,'安阳县'),(410523,'汤阴县'),(410526,'滑县'),(410527,'内黄县'),(410581,'林州市'),(410600,'鹤壁市'),(410602,'鹤山区'),(410603,'山城区'),(410611,'淇滨区'),(410621,'浚县'),(410622,'淇县'),(410700,'新乡市'),(410702,'红旗区'),(410703,'卫滨区'),(410704,'凤泉区'),(410711,'牧野区'),(410721,'新乡县'),(410724,'获嘉县'),(410725,'原阳县'),(410726,'延津县'),(410727,'封丘县'),(410728,'长垣县'),(410781,'卫辉市'),(410782,'辉县市'),(410800,'焦作市'),(410802,'解放区'),(410803,'中站区'),(410804,'马村区'),(410811,'山阳区'),(410821,'修武县'),(410822,'博爱县'),(410823,'武陟县'),(410825,'温县'),(410882,'沁阳市'),(410883,'孟州市'),(410900,'濮阳市'),(410902,'华龙区'),(410922,'清丰县'),(410923,'南乐县'),(410926,'范县'),(410927,'台前县'),(410928,'濮阳县'),(411000,'许昌市'),(411002,'魏都区'),(411003,'建安区'),(411024,'鄢陵县'),(411025,'襄城县'),(411081,'禹州市'),(411082,'长葛市'),(411102,'源汇区'),(411103,'郾城区'),(411104,'召陵区'),(411121,'舞阳县'),(411122,'临颍县'),(411200,'三门峡市'),(411202,'湖滨区'),(411221,'渑池县'),(411222,'陕州区'),(411224,'卢氏县'),(411281,'义马市'),(411282,'灵宝市'),(411300,'南阳市'),(411302,'宛城区'),(411303,'卧龙区'),(411321,'南召县'),(411322,'方城县'),(411323,'西峡县'),(411324,'镇平县'),(411325,'内乡县'),(411326,'淅川县'),(411327,'社旗县'),(411328,'唐河县'),(411329,'新野县'),(411330,'桐柏县'),(411381,'邓州市'),(411400,'商丘市'),(411402,'梁园区'),(411403,'睢阳区'),(411421,'民权县'),(411422,'睢县'),(411423,'宁陵县'),(411424,'柘城县'),(411425,'虞城县'),(411426,'夏邑县'),(411481,'永城市'),(411500,'信阳市'),(411502,'浉河区'),(411503,'平桥区'),(411521,'罗山县'),(411522,'光山县'),(411523,'新县'),(411524,'商城县'),(411525,'固始县'),(411526,'潢川县'),(411527,'淮滨县'),(411528,'息县'),(411600,'周口市'),(411602,'川汇区'),(411603,'淮阳区'),(411621,'扶沟县'),(411622,'西华县'),(411623,'商水县'),(411624,'沈丘县'),(411625,'郸城县'),(411627,'太康县'),(411628,'鹿邑县'),(411681,'项城市'),(411700,'驻马店市'),(411702,'驿城区'),(411721,'西平县'),(411722,'上蔡县'),(411723,'平舆县'),(411724,'正阳县'),(411725,'确山县'),(411726,'泌阳县'),(411727,'汝南县'),(411728,'遂平县'),(411729,'新蔡县'),(419001,'济源市'),(420000,'湖北省'),(420100,'武汉市'),(420102,'江岸区'),(420103,'江汉区'),(420104,'硚口区'),(420105,'汉阳区'),(420106,'武昌区'),(420107,'青山区'),(420111,'洪山区'),(420112,'东西湖区'),(420113,'汉南区'),(420114,'蔡甸区'),(420115,'江夏区'),(420116,'黄陂区'),(420117,'新洲区'),(420200,'黄石市'),(420202,'黄石港区'),(420203,'西塞山区'),(420204,'下陆区'),(420205,'铁山区'),(420222,'阳新县'),(420281,'大冶市'),(420300,'十堰市'),(420302,'茅箭区'),(420303,'张湾区'),(420304,'郧阳区'),(420322,'郧西县'),(420323,'竹山县'),(420324,'竹溪县'),(420325,'房县'),(420381,'丹江口市'),(420500,'宜昌市'),(420502,'西陵区'),(420503,'伍家岗区'),(420504,'点军区'),(420505,'猇亭区'),(420506,'夷陵区'),(420525,'远安县'),(420526,'兴山县'),(420527,'秭归县'),(420528,'长阳县'),(420529,'五峰县'),(420581,'宜都市'),(420582,'当阳市'),(420583,'枝江市'),(420600,'襄阳市'),(420602,'襄城区'),(420606,'樊城区'),(420607,'襄州区'),(420624,'南漳县'),(420625,'谷城县'),(420626,'保康县'),(420682,'老河口市'),(420683,'枣阳市'),(420684,'宜城市'),(420700,'鄂州市'),(420702,'梁子湖区'),(420703,'华容区'),(420704,'鄂城区'),(420800,'荆门市'),(420802,'东宝区'),(420804,'掇刀区'),(420821,'京山市'),(420822,'沙洋县'),(420881,'钟祥市'),(420900,'孝感市'),(420902,'孝南区'),(420921,'孝昌县'),(420922,'大悟县'),(420923,'云梦县'),(420981,'应城市'),(420982,'安陆市'),(420984,'汉川市'),(421000,'荆州市'),(421002,'沙市区'),(421003,'荆州区'),(421022,'公安县'),(421023,'监利县'),(421024,'江陵县'),(421071,'荆州经济技术开发区'),(421081,'石首市'),(421083,'洪湖市'),(421087,'松滋市'),(421100,'黄冈市'),(421102,'黄州区'),(421121,'团风县'),(421122,'红安县'),(421123,'罗田县'),(421124,'英山县'),(421125,'浠水县'),(421126,'蕲春县'),(421127,'黄梅县'),(421181,'麻城市'),(421182,'武穴市'),(421200,'咸宁市'),(421202,'咸安区'),(421221,'嘉鱼县'),(421222,'通城县'),(421223,'崇阳县'),(421224,'通山县'),(421281,'赤壁市'),(421300,'随州市'),(421303,'曾都区'),(421321,'随县'),(421381,'广水市'),(422800,'恩施州'),(422801,'恩施市'),(422802,'利川市'),(422822,'建始县'),(422823,'巴东县'),(422825,'宣恩县'),(422826,'咸丰县'),(422827,'来凤县'),(422828,'鹤峰县'),(429004,'仙桃市'),(429005,'潜江市'),(429006,'天门市'),(429021,'神农架林区'),(430000,'湖南省'),(430100,'长沙市'),(430102,'芙蓉区'),(430103,'天心区'),(430104,'岳麓区'),(430105,'开福区'),(430111,'雨花区'),(430112,'望城区'),(430121,'长沙县'),(430181,'浏阳市'),(430182,'宁乡市'),(430200,'株洲市'),(430202,'荷塘区'),(430203,'芦淞区'),(430204,'石峰区'),(430211,'天元区'),(430212,'渌口区'),(430223,'攸县'),(430224,'茶陵县'),(430225,'炎陵县'),(430271,'云龙示范区'),(430281,'醴陵市'),(430300,'湘潭市'),(430302,'雨湖区'),(430304,'岳塘区'),(430321,'湘潭县'),(430371,'高新技术产业园区'),(430372,'昭山示范区'),(430373,'九华示范区'),(430381,'湘乡市'),(430382,'韶山市'),(430400,'衡阳市'),(430405,'珠晖区'),(430406,'雁峰区'),(430407,'石鼓区'),(430408,'蒸湘区'),(430412,'南岳区'),(430421,'衡阳县'),(430422,'衡南县'),(430423,'衡山县'),(430424,'衡东县'),(430426,'祁东县'),(430481,'耒阳市'),(430482,'常宁市'),(430500,'邵阳市'),(430502,'双清区'),(430503,'大祥区'),(430511,'北塔区'),(430522,'新邵县'),(430523,'邵阳县'),(430524,'隆回县'),(430525,'洞口县'),(430527,'绥宁县'),(430528,'新宁县'),(430529,'城步苗族自治县'),(430581,'武冈市'),(430582,'邵东市'),(430600,'岳阳市'),(430602,'岳阳楼区'),(430603,'云溪区'),(430611,'君山区'),(430621,'岳阳县'),(430623,'华容县'),(430624,'湘阴县'),(430626,'平江县'),(430681,'汨罗市'),(430682,'临湘市'),(430700,'常德市'),(430702,'武陵区'),(430703,'鼎城区'),(430721,'安乡县'),(430722,'汉寿县'),(430723,'澧县'),(430724,'临澧县'),(430725,'桃源县'),(430726,'石门县'),(430781,'津市市'),(430800,'张家界市'),(430802,'永定区'),(430811,'武陵源区'),(430821,'慈利县'),(430822,'桑植县'),(430900,'益阳市'),(430902,'资阳区'),(430903,'赫山区'),(430921,'南县'),(430922,'桃江县'),(430923,'安化县'),(430971,'大通湖管理区'),(430972,'高新技术产业园区'),(430981,'沅江市'),(431000,'郴州市'),(431002,'北湖区'),(431003,'苏仙区'),(431021,'桂阳县'),(431022,'宜章县'),(431023,'永兴县'),(431024,'嘉禾县'),(431025,'临武县'),(431026,'汝城县'),(431027,'桂东县'),(431028,'安仁县'),(431081,'资兴市'),(431100,'永州市'),(431102,'零陵区'),(431103,'冷水滩区'),(431121,'祁阳县'),(431122,'东安县'),(431123,'双牌县'),(431124,'道县'),(431125,'江永县'),(431126,'宁远县'),(431127,'蓝山县'),(431128,'新田县'),(431129,'江华县'),(431200,'怀化市'),(431202,'鹤城区'),(431221,'中方县'),(431222,'沅陵县'),(431223,'辰溪县'),(431224,'溆浦县'),(431225,'会同县'),(431226,'麻阳县'),(431227,'新晃县'),(431228,'芷江县'),(431229,'靖州县'),(431230,'通道县'),(431281,'洪江市'),(431300,'娄底市'),(431302,'娄星区'),(431321,'双峰县'),(431322,'新化县'),(431381,'冷水江市'),(431382,'涟源市'),(433100,'湘西州'),(433101,'吉首市'),(433122,'泸溪县'),(433123,'凤凰县'),(433124,'花垣县'),(433125,'保靖县'),(433126,'古丈县'),(433127,'永顺县'),(433130,'龙山县'),(440000,'广东省'),(440100,'广州市'),(440103,'荔湾区'),(440104,'越秀区'),(440105,'海珠区'),(440106,'天河区'),(440111,'白云区'),(440112,'黄埔区'),(440113,'番禺区'),(440114,'花都区'),(440115,'南沙区'),(440116,'萝岗区'),(440117,'从化区'),(440118,'增城区'),(440200,'韶关市'),(440203,'武江区'),(440204,'浈江区'),(440205,'曲江区'),(440222,'始兴县'),(440224,'仁化县'),(440229,'翁源县'),(440232,'乳源县'),(440233,'新丰县'),(440281,'乐昌市'),(440282,'南雄市'),(440300,'深圳市'),(440303,'罗湖区'),(440304,'福田区'),(440305,'南山区'),(440306,'宝安区'),(440307,'龙岗区'),(440308,'盐田区'),(440309,'龙华区'),(440310,'坪山区'),(440311,'光明区'),(440400,'珠海市'),(440402,'香洲区'),(440403,'斗门区'),(440404,'金湾区'),(440500,'汕头市'),(440507,'龙湖区'),(440511,'金平区'),(440512,'濠江区'),(440513,'潮阳区'),(440514,'潮南区'),(440515,'澄海区'),(440523,'南澳县'),(440600,'佛山市'),(440604,'禅城区'),(440605,'南海区'),(440606,'顺德区'),(440607,'三水区'),(440608,'高明区'),(440700,'江门市'),(440703,'蓬江区'),(440704,'江海区'),(440705,'新会区'),(440781,'台山市'),(440783,'开平市'),(440784,'鹤山市'),(440785,'恩平市'),(440800,'湛江市'),(440802,'赤坎区'),(440803,'霞山区'),(440804,'坡头区'),(440811,'麻章区'),(440823,'遂溪县'),(440825,'徐闻县'),(440881,'廉江市'),(440882,'雷州市'),(440883,'吴川市'),(440900,'茂名市'),(440902,'茂南区'),(440903,'茂港区'),(440904,'电白区'),(440981,'高州市'),(440982,'化州市'),(440983,'信宜市'),(441200,'肇庆市'),(441202,'端州区'),(441203,'鼎湖区'),(441204,'高要区'),(441223,'广宁县'),(441224,'怀集县'),(441225,'封开县'),(441226,'德庆县'),(441284,'四会市'),(441300,'惠州市'),(441302,'惠城区'),(441303,'惠阳区'),(441322,'博罗县'),(441323,'惠东县'),(441324,'龙门县'),(441400,'梅州市'),(441402,'梅江区'),(441421,'梅县区'),(441422,'大埔县'),(441423,'丰顺县'),(441424,'五华县'),(441426,'平远县'),(441427,'蕉岭县'),(441481,'兴宁市'),(441500,'汕尾市'),(441502,'城区'),(441521,'海丰县'),(441523,'陆河县'),(441581,'陆丰市'),(441600,'河源市'),(441602,'源城区'),(441621,'紫金县'),(441622,'龙川县'),(441623,'连平县'),(441624,'和平县'),(441625,'东源县'),(441700,'阳江市'),(441702,'江城区'),(441704,'阳东区'),(441721,'阳西县'),(441781,'阳春市'),(441800,'清远市'),(441802,'清城区'),(441803,'清新区'),(441821,'佛冈县'),(441823,'阳山县'),(441825,'连山县'),(441826,'连南县'),(441881,'英德市'),(441882,'连州市'),(441900,'东莞市'),(442000,'中山市'),(445100,'潮州市'),(445102,'湘桥区'),(445103,'潮安区'),(445122,'饶平县'),(445200,'揭阳市'),(445202,'榕城区'),(445203,'揭东区'),(445222,'揭西县'),(445224,'惠来县'),(445281,'普宁市'),(445300,'云浮市'),(445302,'云城区'),(445303,'云安区'),(445321,'新兴县'),(445322,'郁南县'),(445381,'罗定市'),(450000,'广西'),(450100,'南宁市'),(450102,'兴宁区'),(450103,'青秀区'),(450105,'江南区'),(450107,'西乡塘区'),(450108,'良庆区'),(450109,'邕宁区'),(450122,'武鸣区'),(450123,'隆安县'),(450124,'马山县'),(450125,'上林县'),(450126,'宾阳县'),(450127,'横县'),(450200,'柳州市'),(450202,'城中区'),(450203,'鱼峰区'),(450204,'柳南区'),(450205,'柳北区'),(450206,'柳江区'),(450222,'柳城县'),(450223,'鹿寨县'),(450224,'融安县'),(450225,'融水县'),(450226,'三江县'),(450300,'桂林市'),(450302,'秀峰区'),(450303,'叠彩区'),(450304,'象山区'),(450305,'七星区'),(450311,'雁山区'),(450312,'临桂区'),(450321,'阳朔县'),(450323,'灵川县'),(450324,'全州县'),(450325,'兴安县'),(450326,'永福县'),(450327,'灌阳县'),(450328,'龙胜县'),(450329,'资源县'),(450330,'平乐县'),(450331,'荔浦县'),(450332,'恭城县'),(450400,'梧州市'),(450403,'万秀区'),(450404,'龙圩区'),(450405,'长洲区'),(450421,'苍梧县'),(450422,'藤县'),(450423,'蒙山县'),(450481,'岑溪市'),(450500,'北海市'),(450502,'海城区'),(450503,'银海区'),(450512,'铁山港区'),(450521,'合浦县'),(450600,'防城港市'),(450602,'港口区'),(450603,'防城区'),(450621,'上思县'),(450681,'东兴市'),(450700,'钦州市'),(450702,'钦南区'),(450703,'钦北区'),(450721,'灵山县'),(450722,'浦北区'),(450800,'贵港市'),(450802,'港北区'),(450803,'港南区'),(450804,'覃塘区'),(450821,'平南县'),(450881,'桂平市'),(450900,'玉林市'),(450902,'玉州区'),(450921,'容县'),(450922,'陆川县'),(450923,'博白县'),(450924,'兴业县'),(450981,'北流市'),(451000,'百色市'),(451002,'右江区'),(451003,'田阳区'),(451022,'田东县'),(451023,'平果县'),(451024,'德保县'),(451025,'靖西市'),(451026,'那坡县'),(451027,'凌云县'),(451028,'乐业县'),(451029,'田林县'),(451030,'西林县'),(451031,'隆林县'),(451100,'贺州市'),(451102,'八步区'),(451103,'平桂区'),(451121,'昭平县'),(451122,'钟山县'),(451123,'富川县'),(451200,'河池市'),(451202,'金城江区'),(451203,'宜州区'),(451221,'南丹县'),(451222,'天蛾县'),(451223,'凤山县'),(451224,'东兰县'),(451225,'罗城县'),(451226,'环江县'),(451227,'巴马县'),(451228,'都安县'),(451229,'大化县'),(451300,'来宾市'),(451302,'兴宾区'),(451321,'忻城县'),(451322,'象州县'),(451323,'武宣县'),(451324,'金秀县'),(451381,'合山市'),(451400,'崇左市'),(451402,'江州区'),(451421,'扶绥县'),(451422,'宁明县'),(451423,'龙州县'),(451424,'大新县'),(451425,'天等县'),(451481,'凭祥市'),(460000,'海南省'),(460100,'海口市'),(460105,'秀英区'),(460106,'龙华区'),(460107,'琼山区'),(460108,'美兰区'),(460200,'三亚市'),(469001,'五指山市'),(469002,'琼海市'),(469003,'儋州市'),(469005,'文昌市'),(469006,'万宁市'),(469007,'东方市'),(469021,'定安县'),(469022,'屯昌县'),(469023,'澄迈县'),(469024,'临高县'),(469025,'白沙县'),(469026,'昌江县'),(469027,'乐东县'),(469028,'陵水县'),(469029,'保亭县'),(469030,'琼中县'),(469034,'西沙群岛'),(469034,'西沙群岛'),(469032,'南沙群岛'),(469034,'西沙群岛'),(500000,'重庆市'),(500101,'万州区'),(500102,'涪陵区'),(500103,'渝中区'),(500104,'大渡口区'),(500105,'江北区'),(500106,'沙坪坝区'),(500107,'九龙坡区'),(500108,'南岸区'),(500109,'北碚区'),(500112,'渝北区'),(500113,'巴南区'),(500114,'黔江区'),(500115,'长寿区'),(500116,'江津区'),(500117,'合川区'),(500118,'永川区'),(500119,'南川区'),(500120,'璧山区'),(500151,'铜梁区'),(500152,'潼南区'),(500153,'荣昌区'),(500154,'开州区'),(500155,'梁平区'),(500156,'武隆区'),(500229,'城口县'),(500230,'丰都县'),(500231,'垫江县'),(500233,'忠县'),(500235,'云阳县'),(500236,'奉节县'),(500237,'巫山县'),(500238,'巫溪县'),(500240,'石柱县'),(500241,'秀山县'),(500242,'酉阳县'),(500243,'彭水县'),(510000,'四川省'),(510100,'成都市'),(510104,'锦江区'),(510105,'青羊区'),(510106,'金牛区'),(510107,'武侯区'),(510108,'成华区'),(510112,'龙泉驿区'),(510113,'青白江区'),(510114,'新都区'),(510115,'温江区'),(510116,'双流区'),(510117,'郫都区'),(510121,'金堂县'),(510129,'大邑县'),(510131,'蒲江县'),(510132,'新津县'),(510181,'都江堰市'),(510182,'彭州市'),(510183,'邛崃市'),(510184,'崇州市'),(510185,'简阳市'),(510300,'自贡市'),(510302,'自流井区'),(510303,'贡井区'),(510304,'大安区'),(510311,'沿滩区'),(510321,'荣县'),(510322,'富顺县'),(510400,'攀枝花市'),(510402,'东区'),(510403,'西区'),(510411,'仁和区'),(510421,'米易县'),(510422,'盐边县'),(510500,'泸州市'),(510502,'江阳区'),(510503,'纳溪区'),(510504,'龙马潭区'),(510521,'泸县'),(510522,'合江县'),(510524,'叙永县'),(510525,'古蔺县'),(510600,'德阳市'),(510603,'旌阳区'),(510604,'罗江区'),(510623,'中江县'),(510681,'广汉市'),(510682,'什邡市'),(510683,'绵竹市'),(510700,'绵阳市'),(510703,'涪城区'),(510704,'游仙区'),(510705,'安州区'),(510722,'三台县'),(510723,'盐亭县'),(510725,'梓潼县'),(510726,'北川县'),(510727,'平武县'),(510781,'江油市'),(510800,'广元市'),(510802,'利州区'),(510811,'昭化区'),(510812,'朝天区'),(510821,'旺苍县'),(510822,'青川县'),(510823,'剑阁县'),(510824,'苍溪县'),(510900,'遂宁市'),(510903,'船山区'),(510904,'安居区'),(510921,'蓬溪县'),(510922,'射洪市'),(510923,'大英县'),(511000,'内江市'),(511002,'市中区'),(511011,'东兴区'),(511024,'威远县'),(511025,'资中县'),(511071,'经济开发区'),(511083,'隆昌市'),(511100,'乐山市'),(511102,'市中区'),(511111,'沙湾区'),(511112,'五通桥区'),(511113,'金口河区'),(511123,'犍为县'),(511124,'井研县'),(511126,'夹江县'),(511129,'沐川县'),(511132,'峨边彝族自治县'),(511133,'马边彝族自治县'),(511181,'峨眉山市'),(511300,'南充市'),(511302,'顺庆区'),(511303,'高坪区'),(511304,'嘉陵区'),(511321,'南部县'),(511322,'营山县'),(511323,'蓬安县'),(511324,'仪陇县'),(511325,'西充县'),(511381,'阆中市'),(511400,'眉山市'),(511402,'东坡区'),(511403,'彭山区'),(511421,'仁寿县'),(511423,'洪雅县'),(511424,'丹棱县'),(511425,'青神县'),(511500,'宜宾市'),(511502,'翠屏区'),(511503,'南溪区'),(511504,'叙州区'),(511523,'江安县'),(511524,'长宁县'),(511525,'高县'),(511526,'珙县'),(511527,'筠连县'),(511528,'兴文县'),(511529,'屏山县'),(511600,'广安市'),(511602,'广安区'),(511603,'前锋区'),(511621,'岳池县'),(511622,'武胜县'),(511623,'邻水县'),(511681,'华蓥市'),(511700,'达州市'),(511702,'通川区'),(511703,'达川区'),(511722,'宣汉县'),(511723,'开江县'),(511724,'大竹县'),(511725,'渠县'),(511781,'万源市'),(511800,'雅安市'),(511802,'雨城区'),(511821,'名山区'),(511822,'荥经县'),(511823,'汉源县'),(511824,'石棉县'),(511825,'天全县'),(511826,'芦山县'),(511827,'宝兴县'),(511900,'巴中市'),(511902,'巴州区'),(511903,'恩阳区'),(511921,'通江县'),(511922,'南江县'),(511923,'平昌县'),(512000,'资阳市'),(512002,'雁江区'),(512021,'安岳县'),(512022,'乐至县'),(513200,'阿坝州'),(513201,'马尔康市'),(513221,'汶川县'),(513222,'理县'),(513223,'茂县'),(513224,'松潘县'),(513225,'九寨沟县'),(513226,'金川县'),(513227,'小金县'),(513228,'黑水县'),(513230,'壤塘县'),(513231,'阿坝县'),(513232,'若尔盖县'),(513233,'红原县'),(513300,'甘孜州'),(513321,'康定市'),(513322,'泸定县'),(513323,'丹巴县'),(513324,'九龙县'),(513325,'雅江县'),(513326,'道孚县'),(513327,'炉霍县'),(513328,'甘孜县'),(513329,'新龙县'),(513330,'德格县'),(513331,'白玉县'),(513332,'石渠县'),(513333,'色达县'),(513334,'理塘县'),(513335,'巴塘县'),(513336,'乡城县'),(513337,'稻城县'),(513338,'得荣县'),(513400,'凉山州'),(513401,'西昌市'),(513422,'木里县'),(513423,'盐源县'),(513424,'德昌县'),(513425,'会理县'),(513426,'会东县'),(513427,'宁南县'),(513428,'普格县'),(513429,'布拖县'),(513430,'金阳县'),(513431,'昭觉县'),(513432,'喜德县'),(513433,'冕宁县'),(513434,'越西县'),(513435,'甘洛县'),(513436,'美姑县'),(513437,'雷波县'),(520000,'贵州省'),(520100,'贵阳市'),(520102,'南明区'),(520103,'云岩区'),(520111,'花溪区'),(520112,'乌当区'),(520113,'白云区'),(520114,'观山湖区'),(520121,'开阳县'),(520122,'息烽县'),(520123,'修文县'),(520181,'清镇市'),(520200,'六盘水市'),(520201,'钟山区'),(520203,'六枝特区'),(520221,'水城县'),(520222,'盘州市'),(520300,'遵义市'),(520302,'红花岗区'),(520303,'汇川区'),(520321,'播州区'),(520322,'桐梓县'),(520323,'绥阳县'),(520324,'正安县'),(520325,'道真县'),(520326,'务川县'),(520327,'凤冈县'),(520328,'湄潭县'),(520329,'余庆县'),(520330,'习水县'),(520381,'赤水市'),(520382,'仁怀市'),(520400,'安顺市'),(520402,'西秀区'),(520403,'平坝区'),(520422,'普定县'),(520423,'镇宁县'),(520424,'关岭县'),(520425,'紫云县'),(520500,'毕节市'),(520502,'七星关区'),(520521,'大方县'),(520522,'黔西县'),(520523,'金沙县'),(520524,'织金县'),(520525,'纳雍县'),(520526,'威宁县'),(520527,'赫章县'),(520600,'铜仁市'),(520602,'碧江区'),(520603,'万山区'),(520621,'江口县'),(520622,'玉屏县'),(520623,'石阡县'),(520624,'思南县'),(520625,'印江县'),(520626,'德江县'),(520627,'沿河县'),(520628,'松桃县'),(522300,'黔西南州'),(522301,'兴义市'),(522322,'兴仁市'),(522323,'普安县'),(522324,'晴隆县'),(522325,'贞丰县'),(522326,'望谟县'),(522327,'册亨县'),(522328,'安龙县'),(522600,'黔东南州'),(522601,'凯里市'),(522622,'黄平县'),(522623,'施秉县'),(522624,'三穗县'),(522626,'岑巩县'),(522627,'天柱县'),(522628,'锦屏县'),(522629,'剑河县'),(522630,'台江县'),(522631,'黎平县'),(522632,'榕江县'),(522633,'从江县'),(522634,'雷山县'),(522635,'麻江县'),(522636,'丹寨县'),(522700,'黔南州'),(522701,'都匀市'),(522702,'福泉市'),(522722,'荔波县'),(522723,'贵定县'),(522725,'瓮安县'),(522726,'独山县'),(522727,'平塘县'),(522728,'罗甸县'),(522729,'长顺县'),(522730,'龙里县'),(522731,'惠水县'),(522732,'三都县'),(530000,'云南省'),(530100,'昆明市'),(530102,'五华区'),(530103,'盘龙区'),(530111,'官渡区'),(530112,'西山区'),(530113,'东川区'),(530121,'呈贡区'),(530122,'晋宁区'),(530124,'富民县'),(530125,'宜良县'),(530126,'石林彝族自治县'),(530127,'嵩明县'),(530128,'禄劝县'),(530129,'寻甸县'),(530181,'安宁市'),(530300,'曲靖市'),(530302,'麒麟区'),(530303,'沾益区'),(530304,'马龙区'),(530322,'陆良县'),(530323,'师宗县'),(530324,'罗平县'),(530325,'富源县'),(530326,'会泽县'),(530381,'宣威市'),(530400,'玉溪市'),(530402,'红塔区'),(530403,'江川区'),(530422,'澄江县'),(530423,'通海县'),(530424,'华宁县'),(530425,'易门县'),(530426,'峨山县'),(530427,'新平县'),(530428,'元江县'),(530500,'保山市'),(530502,'隆阳区'),(530521,'施甸县'),(530523,'龙陵县'),(530524,'昌宁县'),(530581,'腾冲市'),(530600,'昭通市'),(530602,'昭阳区'),(530621,'鲁甸县'),(530622,'巧家县'),(530623,'盐津县'),(530624,'大关县'),(530625,'永善县'),(530626,'绥江县'),(530627,'镇雄县'),(530628,'彝良县'),(530629,'威信县'),(530630,'水富县'),(530700,'丽江市'),(530702,'古城区'),(530721,'玉龙县'),(530722,'永胜县'),(530723,'华坪县'),(530724,'宁蒗县'),(530800,'普洱市'),(530802,'思茅区'),(530821,'宁洱县'),(530822,'墨江县'),(530823,'景东县'),(530824,'景谷县'),(530825,'镇沅县'),(530826,'江城县'),(530827,'孟连县'),(530828,'澜沧县'),(530829,'西盟县'),(530900,'临沧市'),(530902,'临翔区'),(530921,'凤庆县'),(530922,'云县'),(530923,'永德县'),(530924,'镇康县'),(530925,'双江县'),(530926,'耿马县'),(530927,'沧源县'),(532300,'楚雄州'),(532301,'楚雄市'),(532322,'双柏县'),(532323,'牟定县'),(532324,'南华县'),(532325,'姚安县'),(532326,'大姚县'),(532327,'永仁县'),(532328,'元谋县'),(532329,'武定县'),(532331,'禄丰县'),(532500,'红河州'),(532501,'个旧市'),(532502,'开远市'),(532503,'蒙自市'),(532523,'屏边县'),(532524,'建水县'),(532525,'石屏县'),(532526,'弥勒市'),(532527,'泸西县'),(532528,'元阳县'),(532529,'红河县'),(532530,'金平县'),(532531,'绿春县'),(532532,'河口县'),(532600,'文山州'),(532601,'文山市'),(532622,'砚山县'),(532623,'西畴县'),(532624,'麻栗坡县'),(532625,'马关县'),(532626,'丘北县'),(532627,'广南县'),(532628,'富宁县'),(532800,'西双版纳州'),(532801,'景洪市'),(532822,'勐海县'),(532823,'勐腊县'),(532900,'大理州'),(532901,'大理市'),(532922,'漾濞县'),(532923,'祥云县'),(532924,'宾川县'),(532925,'弥渡县'),(532926,'南涧县'),(532927,'巍山县'),(532928,'永平县'),(532929,'云龙县'),(532930,'洱源县'),(532931,'剑川县'),(532932,'鹤庆县'),(533100,'德宏州'),(533102,'瑞丽市'),(533103,'芒市'),(533122,'梁河县'),(533123,'盈江县'),(533124,'陇川县'),(533300,'怒江州'),(533321,'泸水市'),(533323,'福贡县'),(533324,'贡山县'),(533325,'兰坪县'),(533400,'迪庆州'),(533421,'香格里拉市'),(533422,'德钦县'),(533423,'维西傈僳族自治县'),(540000,'西藏'),(540100,'拉萨市'),(540102,'城关区'),(540103,'堆龙德庆区'),(540104,'达孜区'),(540121,'林周县'),(540122,'当雄县'),(540123,'尼木县'),(540124,'曲水县'),(540127,'墨竹工卡县'),(540200,'日喀则市'),(540202,'桑珠孜区'),(540221,'南木林县'),(540222,'江孜县'),(540223,'定日县'),(540224,'萨迦县'),(540225,'拉孜县'),(540226,'昂仁县'),(540227,'谢通门县'),(540228,'白朗县'),(540229,'仁布县'),(540230,'康马县'),(540231,'定结县'),(540232,'仲巴县'),(540233,'亚东县'),(540234,'吉隆县'),(540235,'聂拉木县'),(540236,'萨嘎县'),(540237,'岗巴县'),(540300,'昌都市'),(540302,'卡若区'),(540321,'江达县'),(540322,'贡觉县'),(540323,'类乌齐县'),(540324,'丁青县'),(540325,'察雅县'),(540326,'八宿县'),(540327,'左贡县'),(540328,'芒康县'),(540329,'洛隆县'),(540330,'边坝县'),(540400,'林芝市'),(540402,'巴宜区'),(540421,'工布江达县'),(540422,'米林县'),(540423,'墨脱县'),(540424,'波密县'),(540425,'察隅县'),(540426,'朗县'),(540500,'山南市'),(540502,'乃东区'),(540521,'扎囊县'),(540522,'贡嘎县'),(540523,'桑日县'),(540524,'琼结县'),(540525,'曲松县'),(540526,'措美县'),(540527,'洛扎县'),(540528,'加查县'),(540529,'隆子县'),(540530,'错那县'),(540531,'浪卡子县'),(540600,'那曲市'),(540602,'色尼区'),(540621,'嘉黎县'),(540622,'比如县'),(540623,'聂荣县'),(540624,'安多县'),(540625,'申扎县'),(540626,'索县'),(540627,'班戈县'),(540628,'巴青县'),(540629,'尼玛县'),(540630,'双湖县'),(542500,'阿里地区'),(542521,'普兰县'),(542522,'札达县'),(542523,'噶尔县'),(542524,'日土县'),(542525,'革吉县'),(542526,'改则县'),(542527,'措勤县'),(610000,'陕西省'),(610100,'西安市'),(610102,'新城区'),(610103,'碑林区'),(610104,'莲湖区'),(610111,'灞桥区'),(610112,'未央区'),(610113,'雁塔区'),(610114,'阎良区'),(610115,'临潼区'),(610116,'长安区'),(610117,'高陵区'),(610118,'鄠邑区'),(610122,'蓝田县'),(610124,'周至县'),(610200,'铜川市'),(610202,'王益区'),(610203,'印台区'),(610204,'耀州区'),(610222,'宜君县'),(610300,'宝鸡市'),(610302,'渭滨区'),(610303,'金台区'),(610304,'陈仓区'),(610322,'凤翔县'),(610323,'岐山县'),(610324,'扶风县'),(610326,'眉县'),(610327,'陇县'),(610328,'千阳县'),(610329,'麟游县'),(610330,'凤县'),(610331,'太白县'),(610400,'咸阳市'),(610402,'秦都区'),(610403,'杨陵区'),(610404,'渭城区'),(610422,'三原县'),(610423,'泾阳县'),(610424,'乾县'),(610425,'礼泉县'),(610426,'永寿县'),(610428,'长武县'),(610429,'旬邑县'),(610430,'淳化县'),(610431,'武功县'),(610481,'兴平市'),(610482,'彬州市'),(610500,'渭南市'),(610502,'临渭区'),(610522,'潼关县'),(610521,'大荔县'),(610521,'大荔县'),(610524,'合阳县'),(610525,'澄城县'),(610526,'蒲城县'),(610527,'白水县'),(610528,'富平县'),(610581,'韩城市'),(610582,'华阴市'),(610600,'延安市'),(610602,'宝塔区'),(610603,'安塞区'),(610621,'延长县'),(610622,'延川县'),(610623,'子长市'),(610625,'志丹县'),(610626,'吴起县'),(610627,'甘泉县'),(610628,'富县'),(610629,'洛川县'),(610630,'宜川县'),(610631,'黄龙县'),(610632,'黄陵县'),(610700,'汉中市'),(610702,'汉台区'),(610703,'南郑区'),(610722,'城固县'),(610723,'洋县'),(610724,'西乡县'),(610725,'勉县'),(610726,'宁强县'),(610727,'略阳县'),(610728,'镇巴县'),(610729,'留坝县'),(610730,'佛坪县'),(610800,'榆林市'),(610802,'榆阳区'),(610803,'横山区'),(610822,'府谷县'),(610824,'靖边县'),(610825,'定边县'),(610826,'绥德县'),(610827,'米脂县'),(610828,'佳县'),(610829,'吴堡县'),(610830,'清涧县'),(610831,'子洲县'),(610881,'神木市'),(610900,'安康市'),(610902,'汉滨区'),(610921,'汉阴县'),(610922,'石泉县'),(610923,'宁陕县'),(610924,'紫阳县'),(610925,'岚皋县'),(610926,'平利县'),(610927,'镇坪县'),(610928,'旬阳县'),(610929,'白河县'),(611000,'商洛市'),(611002,'商州区'),(611021,'洛南县'),(611022,'丹凤县'),(611023,'商南县'),(611024,'山阳县'),(611025,'镇安县'),(611026,'柞水县'),(620000,'甘肃省'),(620100,'兰州市'),(620102,'城关区'),(620103,'七里河区'),(620104,'西固区'),(620105,'安宁区'),(620111,'红古区'),(620121,'永登县'),(620122,'皋兰县'),(620123,'榆中县'),(620171,'兰州新区'),(620200,'嘉峪关市'),(620300,'金昌市'),(620302,'金川区'),(620321,'永昌县'),(620400,'白银市'),(620402,'白银区'),(620403,'平川区'),(620421,'靖远县'),(620422,'会宁县'),(620423,'景泰县'),(620500,'天水市'),(620502,'秦州区'),(620503,'麦积区'),(620521,'清水县'),(620522,'秦安县'),(620523,'甘谷县'),(620524,'武山县'),(620525,'张家川回族自治县'),(620600,'武威市'),(620602,'凉州区'),(620621,'民勤县'),(620622,'古浪县'),(620623,'天祝藏族自治县'),(620700,'张掖市'),(620702,'甘州区'),(620721,'肃南县'),(620722,'民乐县'),(620723,'临泽县'),(620724,'高台县'),(620725,'山丹县'),(620800,'平凉市'),(620802,'崆峒区'),(620821,'泾川县'),(620822,'灵台县'),(620823,'崇信县'),(620824,'华亭市'),(620825,'庄浪县'),(620826,'静宁县'),(620900,'酒泉市'),(620902,'肃州区'),(620921,'金塔县'),(620922,'瓜州县'),(620923,'肃北县'),(620924,'阿克塞县'),(620981,'玉门市'),(620982,'敦煌市'),(621000,'庆阳市'),(621002,'西峰区'),(621021,'庆城县'),(621022,'环县'),(621023,'华池县'),(621024,'合水县'),(621025,'正宁县'),(621026,'宁县'),(621027,'镇原县'),(621100,'定西市'),(621102,'安定区'),(621121,'通渭县'),(621122,'陇西县'),(621123,'渭源县'),(621124,'临洮县'),(621125,'漳县'),(621126,'岷县'),(621200,'陇南市'),(621202,'武都区'),(621221,'成县'),(621222,'文县'),(621223,'宕昌县'),(621224,'康县'),(621225,'西和县'),(621226,'礼县'),(621227,'徽县'),(621228,'两当县'),(622900,'临夏州'),(622901,'临夏市'),(622921,'临夏县'),(622922,'康乐县'),(622923,'永靖县'),(622924,'广河县'),(622925,'和政县'),(622926,'东乡族自治县'),(622927,'积石山县'),(623000,'甘南州'),(623001,'合作市'),(623021,'临潭县'),(623022,'卓尼县'),(623023,'舟曲县'),(623024,'迭部县'),(623025,'玛曲县'),(623026,'碌曲县'),(623027,'夏河县'),(630000,'青海省'),(630100,'西宁市'),(630102,'城东区'),(630103,'城中区'),(630104,'城西区'),(630105,'城北区'),(630121,'大通县'),(630122,'湟中县'),(630123,'湟源县'),(632001,'乐都区'),(632100,'海东市'),(632121,'平安区'),(632122,'民和县'),(632126,'互助县'),(632127,'化隆回族自治县'),(632128,'循化撒拉族自治县'),(632200,'海北州'),(632221,'门源回族自治县'),(632222,'祁连县'),(632223,'海晏县'),(632224,'刚察县'),(632300,'黄南州'),(632321,'同仁县'),(632322,'尖扎县'),(632323,'泽库县'),(632324,'河南蒙古族自治县'),(632500,'海南州'),(632521,'共和县'),(632522,'同德县'),(632523,'贵德县'),(632524,'兴海县'),(632525,'贵南县'),(632600,'果洛州'),(632621,'玛沁县'),(632622,'班玛县'),(632623,'甘德县'),(632624,'达日县'),(632625,'久治县'),(632626,'玛多县'),(632700,'玉树州'),(632701,'玉树市'),(632722,'杂多县'),(632723,'称多县'),(632724,'治多县'),(632725,'囊谦县'),(632726,'曲麻莱县'),(632800,'海西州'),(632801,'格尔木市'),(632802,'德令哈市'),(632821,'乌兰县'),(632822,'都兰县'),(632823,'天峻县'),(632824,'冷湖行委'),(632825,'大柴旦行委'),(632826,'茫崖行委'),(640000,'宁夏省'),(640100,'银川市'),(640104,'兴庆区'),(640105,'西夏区'),(640106,'金凤区'),(640121,'永宁县'),(640122,'贺兰县'),(640181,'灵武市'),(640200,'石嘴山市'),(640202,'大武口区'),(640205,'惠农区'),(640221,'平罗县'),(640300,'吴忠市'),(640302,'利通区'),(640303,'红寺堡区'),(640323,'盐池县'),(640324,'同心县'),(640381,'青铜峡市'),(640400,'固原市'),(640402,'原州区'),(640422,'西吉县'),(640423,'隆德县'),(640424,'泾源县'),(640425,'彭阳县'),(640500,'中卫市'),(640502,'沙坡头区'),(640521,'中宁县'),(640522,'海原县'),(650000,'新疆'),(650100,'乌鲁木齐市'),(650102,'天山区'),(650103,'沙依巴克区'),(650104,'新市区'),(650105,'水磨沟区'),(650106,'头屯河区'),(650107,'达坂城区'),(650109,'米东区'),(650121,'乌鲁木齐县'),(650200,'克拉玛依市'),(650202,'独山子区'),(650203,'克拉玛依区'),(650204,'白碱滩区'),(650205,'乌尔禾区'),(650402,'高昌区'),(650421,'鄯善县'),(650422,'托克逊县'),(650502,'伊州区'),(650521,'巴里坤县'),(650522,'伊吾县'),(652100,'吐鲁番市'),(652200,'哈密市'),(652300,'昌吉州'),(652700,'博尔塔拉州'),(652702,'阿拉山口市'),(652800,'巴音郭楞州'),(652900,'阿克苏地区'),(653000,'克孜勒苏州'),(653100,'喀什地区'),(653101,'喀什市'),(653121,'疏附县'),(653122,'疏勒县'),(653123,'英吉沙县'),(653124,'泽普县'),(653125,'莎车县'),(653126,'叶城县'),(653127,'麦盖提县'),(653128,'岳普湖县'),(653129,'伽师县'),(653130,'巴楚县'),(653131,'塔什库尔干塔吉克县'),(653200,'和田地区'),(653226,'于田县'),(654000,'伊犁州'),(654002,'伊宁市'),(654003,'奎屯市'),(654004,'霍尔果斯市'),(654021,'伊宁县'),(654022,'察布县'),(654023,'霍城县'),(654024,'巩留县'),(654025,'新源县'),(654026,'昭苏县'),(654027,'特克斯县'),(654028,'尼勒克县'),(654200,'塔城地区'),(654202,'乌苏市'),(654300,'阿勒泰地区');
/*!40000 ALTER TABLE `location_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_levels`
--

DROP TABLE IF EXISTS `member_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_levels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `level_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `level_name` (`level_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_levels`
--

LOCK TABLES `member_levels` WRITE;
/*!40000 ALTER TABLE `member_levels` DISABLE KEYS */;
INSERT INTO `member_levels` VALUES (5,'black gold'),(6,'black gold PLUS'),(4,'diamond'),(2,'gold'),(3,'white gold'),(1,'white silver');
/*!40000 ALTER TABLE `member_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (3,'closed'),(2,'complete'),(1,'in the process');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_types`
--

DROP TABLE IF EXISTS `order_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_types` (
  `order_type_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`order_type_id`),
  UNIQUE KEY `order_type_id` (`order_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_types`
--

LOCK TABLES `order_types` WRITE;
/*!40000 ALTER TABLE `order_types` DISABLE KEYS */;
INSERT INTO `order_types` VALUES (8,'driver rent'),(1,'express'),(5,'hitchhiker'),(3,'luxury'),(6,'sharing car'),(2,'special'),(4,'taxi'),(7,'third party car');
/*!40000 ALTER TABLE `order_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_type_id` bigint unsigned NOT NULL,
  `user_id_1` bigint unsigned NOT NULL,
  `driver_id` bigint unsigned NOT NULL,
  `from_address` varchar(150) NOT NULL,
  `to_address` varchar(150) NOT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  `order_status` int unsigned NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `distance` int DEFAULT NULL,
  `payment_status` tinyint(1) DEFAULT '0',
  `basic_points` int unsigned DEFAULT NULL,
  `consumer_points` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `order_type_id` (`order_type_id`),
  KEY `driver_id` (`driver_id`),
  KEY `order_status` (`order_status`),
  KEY `inx_user_driver` (`user_id_1`,`driver_id`),
  KEY `inx_order_price` (`price`),
  KEY `price` (`price`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_type_id`) REFERENCES `order_types` (`order_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`order_status`) REFERENCES `order_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ck_address_diff` CHECK ((`from_address` <> `to_address`))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,12,18,'杭州市银泰百货-北1门','杭州东站',18.75,2,'2021-03-22 12:46:48',2,1,5,2,'2021-03-22 12:09:10','2021-03-22 12:46:48'),(2,2,17,19,'杭州市Carbon法国餐厅（北山十号）西侧','富源商务酒店',53.68,2,'2021-04-13 22:51:48',4,1,5,8,'2021-04-13 22:10:14','2021-04-13 22:51:48'),(3,2,14,19,'杭州环城西路/省府路路口','宜尚PLUS酒店',NULL,3,NULL,NULL,0,NULL,NULL,'2021-05-22 18:09:14','2021-05-22 18:09:59'),(4,3,16,20,'杭州国际博览中心-5号门西','优能科技园',82.83,2,'2021-02-17 09:55:27',7,1,5,35,'2021-02-17 09:23:14','2021-02-17 09:55:27'),(5,3,13,20,'杭州世纪访-西北门','天云花园',60.19,2,'2021-12-15 20:54:02',5,1,5,25,'2021-12-15 20:50:26','2021-12-15 20:56:23'),(6,1,14,18,'杭州市某地方','杭州东其他地方',32.75,2,'2021-04-22 12:46:48',4,1,5,4,'2021-04-22 12:09:10','2021-04-22 12:46:48'),(7,2,13,21,'杭州市某地方','杭州东其他地方',NULL,1,NULL,NULL,0,NULL,NULL,'2021-12-16 21:57:46','2021-12-16 21:57:46');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_order_insert` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
IF NEW.user_id_1 = NEW.driver_id THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NOT VALID DATA';
ELSEIF (SELECT is_valid FROM drivers d WHERE user_id = NEW.driver_id) = 0 THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NOT VALID DRIVER';
ELSEIF (SELECT order_status FROM orders WHERE user_id_1 = NEW.user_id_1 ORDER BY updated_at DESC LIMIT 1) = 1 THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'PREVIOS ORDER DID NOT PAIDED';
ELSEIF NEW.driver_id NOT IN (SELECT user_id FROM drivers) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'WRONG DRIVER_ID';
ELSEIF NEW.order_type_id != (SELECT order_type_id FROM drivers WHERE user_id = NEW.driver_id) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'THIS DRIVER CAN NOT SERVE THIS TYPE OF ORDER';
ELSEIF NEW.order_status = 3 AND NEW.payment_status = 1 THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CENCELED ORDER CAN NOT BE PAIDED';
ELSE 
SET NEW.order_status = COALESCE(NEW.order_status, 1);
IF NEW.payment_status = 1 THEN 
IF NEW.distance IS NULL OR NEW.price IS NULL OR NEW.price = 0 OR NEW.delivered_at IS NULL THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NOT ENOUGH INFO FOR COMPLETE ORDER';
ELSE 
SET NEW.order_status = 2;

IF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'express') OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'sharing car') THEN 
SET NEW.consumer_points = NEW.distance;
ELSEIF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'special') THEN 
SET NEW.consumer_points = NEW.distance * 2;
ELSEIF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'luxury') THEN 
SET NEW.consumer_points = NEW.distance * 5;
ELSEIF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'taxi') OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'third party car') THEN
SET NEW.consumer_points = NEW.distance * 1.5;
END IF;

SET NEW.basic_points = 5;

UPDATE user_points
SET basic_points = basic_points + 5
WHERE user_id = NEW.user_id_1;

UPDATE user_points 
SET consumers_points = consumers_points + NEW.consumer_points
WHERE user_id = NEW.user_id_1;
END IF;
END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_insert_camera` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
DECLARE c_id, d_id INT;
DECLARE is_end INT DEFAULT 0;

DECLARE curcat CURSOR FOR SELECT * FROM cameras WHERE driver_id = NEW.driver_id;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;
  
IF NEW.delivered_at IS NOT NULL AND NEW.distance IS NOT NULL THEN 
  OPEN curcat;

  cycle : LOOP
FETCH curcat INTO c_id, d_id;
IF is_end THEN LEAVE cycle;
END IF;
INSERT INTO camera_records(record_id, camera_id, order_id, file_duration, created_at)
VALUES (NULL, c_id, NEW.order_id, timediff(NEW.delivered_at, NEW.created_at), now());
  END LOOP cycle;

  CLOSE curcat;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_order_update` BEFORE UPDATE ON `orders` FOR EACH ROW BEGIN
	IF NEW.payment_status = 1 AND OLD.payment_status = 0 THEN
		IF NEW.distance IS NULL OR NEW.price IS NULL OR NEW.price = 0 OR NEW.delivered_at IS NULL THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NOT ENOUGH INFO FOR COMPLETE ORDER';
		ELSE 
			SET NEW.order_status = 2;
			
			IF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'express') OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'sharing car') THEN 
				SET NEW.consumer_points = NEW.distance;
			ELSEIF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'special') THEN 
				SET NEW.consumer_points = NEW.distance * 2;
			ELSEIF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'luxury') THEN 
				SET NEW.consumer_points = NEW.distance * 5;
			ELSEIF NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'taxi') OR NEW.order_type_id = (SELECT order_type_id FROM order_types WHERE name = 'third party car') THEN
				SET NEW.consumer_points = NEW.distance * 1.5;
			END IF;
				
			SET NEW.basic_points = 5;
			
			UPDATE user_points
			SET basic_points = basic_points + 5
			WHERE user_id = NEW.user_id_1;
				
			UPDATE user_points 
			SET consumers_points = consumers_points + NEW.consumer_points
			WHERE user_id = NEW.user_id_1;
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_update_camera` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
DECLARE c_id, d_id INT;
DECLARE is_end INT DEFAULT 0;

DECLARE curcat CURSOR FOR SELECT * FROM cameras WHERE driver_id = NEW.driver_id;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;
  
IF NEW.delivered_at IS NOT NULL 
AND NEW.distance IS NOT NULL 
AND (OLD.delivered_at IS NULL OR OLD.distance IS NULL)
THEN 
  OPEN curcat;

  cycle : LOOP
FETCH curcat INTO c_id, d_id;
IF is_end THEN LEAVE cycle;
END IF;
INSERT INTO camera_records(record_id, camera_id, order_id, file_duration, created_at)
VALUES (NULL, c_id, NEW.order_id, timediff(NEW.delivered_at, NEW.created_at), now());
  END LOOP cycle;

  CLOSE curcat;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `orders_count_by_month`
--

DROP TABLE IF EXISTS `orders_count_by_month`;
/*!50001 DROP VIEW IF EXISTS `orders_count_by_month`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orders_count_by_month` AS SELECT 
 1 AS `year`,
 1 AS `month`,
 1 AS `total_orders`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `passports`
--

DROP TABLE IF EXISTS `passports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passports` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(5) NOT NULL,
  `passport_id` varchar(18) NOT NULL,
  `gender` enum('F','M') NOT NULL,
  `birthday` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nationality` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `passport_id` (`passport_id`),
  KEY `inx_passport_gender` (`gender`),
  KEY `inx_passport_age` (`birthday`),
  CONSTRAINT `passports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passports`
--

LOCK TABLES `passports` WRITE;
/*!40000 ALTER TABLE `passports` DISABLE KEYS */;
INSERT INTO `passports` VALUES (11,'张三','110101199003072674','M','1990-03-07','2021-12-14 20:13:35','2021-12-14 20:13:35','汉','北京市市辖区东城区'),(12,'宁颀秀','410302200701122441','F','2007-01-12','2021-12-14 20:13:35','2021-12-14 20:13:35','汉','河南省洛阳市老城区'),(13,'舒元','230102198603249110','F','1986-03-24','2021-12-14 20:13:35','2021-12-14 20:13:35','汉','黑龙江省哈尔滨市道里区'),(14,'祝嘉赐','230102200510054170','M','2005-10-05','2021-12-14 20:13:35','2021-12-14 20:13:35','汉','黑龙江省哈尔滨市道里区'),(17,'及梓婷','410302198501022956','F','1985-01-02','2021-12-14 20:13:35','2021-12-14 20:13:35','汉','河南省洛阳市老城区'),(18,'歧丹丹','230102197905203447','F','1979-05-20','2021-12-14 20:13:35','2021-12-14 20:13:35','汉','黑龙江省哈尔滨市道里区'),(19,'似玉石','330102198209166433','M','1982-09-16','2021-12-14 20:13:35','2021-12-14 20:13:35','汉','浙江省杭州市上城区'),(20,'字天晴','13060919881107662X','F','1988-11-07','2021-12-14 20:13:35','2021-12-14 20:13:35','汉','河北省保定市徐水区'),(21,'六明远','330102197803278898','M','1978-03-27','2021-12-14 20:13:35','2021-12-14 20:13:35','汉','浙江省杭州市上城区'),(23,'伦雪','36010219930603255X','M','1993-06-03','2021-12-14 20:13:35','2021-12-14 20:13:35','汉','江西省南晶市东湖区'),(25,'孟兴怀','330102200009153259','M','2000-09-15','2021-12-14 20:13:35','2021-12-14 20:13:35','汉','浙江省杭州市上城区'),(27,'李四','130609199802179429','F','1998-02-17','2021-12-14 20:13:35','2021-12-14 20:13:35','汉','河北省保定市徐水区');
/*!40000 ALTER TABLE `passports` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tables_update_after_passport_insert` AFTER INSERT ON `passports` FOR EACH ROW BEGIN 
UPDATE document_status 
SET document_status.passport_id = TRUE 
WHERE document_status.user_id = NEW.user_id;

UPDATE user_points
SET user_points.basic_points = user_points.basic_points + 40
WHERE user_points.user_id = NEW.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plate_codes`
--

DROP TABLE IF EXISTS `plate_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plate_codes` (
  `plate_code` varchar(100) DEFAULT NULL,
  `city_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plate_codes`
--

LOCK TABLES `plate_codes` WRITE;
/*!40000 ALTER TABLE `plate_codes` DISABLE KEYS */;
INSERT INTO `plate_codes` VALUES ('藏A','拉萨市'),('藏C','山南地区'),('川A','成都市'),('川B','绵阳市'),('川C','自贡市'),('川D','攀枝花'),('川E','泸州市'),('川F','德阳市'),('川H','广元市'),('川J','遂宁市'),('川K','内江市'),('川L','乐山市'),('川M','资阳市'),('川Q','宜宾市'),('川R','南充市'),('川S','达州市'),('川T','雅安市'),('川U','阿坝藏族'),('川W','凉山州'),('川X','广安市'),('川Y','巴中市'),('川Z','眉山市'),('鄂A','武汉市'),('鄂B','黄石市'),('鄂C','十堰市'),('鄂D','荆州市'),('鄂E','宜昌市'),('鄂F','襄樊市'),('鄂F','襄阳市'),('鄂G','鄂州市'),('鄂H','荆门市'),('鄂J','黄冈市'),('鄂K','孝感市'),('鄂L','咸宁市'),('鄂M','仙桃市'),('鄂N','潜江市'),('鄂P','神农架林区'),('鄂Q','恩施州'),('鄂R','天门市'),('鄂S','随州市'),('甘A','兰州市'),('甘C','金昌市'),('甘D','白银市'),('甘E','天水市'),('甘G','张掖市'),('甘J','定西市'),('甘K','陇南市'),('甘M','庆阳市'),('甘N','临夏州'),('甘P','甘南州'),('赣A','南昌市'),('赣B','赣州市'),('赣C','宜春市'),('赣D','吉安市'),('赣E','上饶市'),('赣F','抚州市'),('赣G','九江市'),('赣H','景德镇市'),('赣J','萍乡市'),('赣K','新余市'),('赣L','鹰潭市'),('贵A','贵阳市'),('贵B','六盘水市'),('贵C','遵义市'),('贵D','铜仁地区'),('贵E','黔西南州'),('贵F','毕节地区'),('贵G','安顺市'),('贵H','黔东南州'),('贵J','黔南州'),('桂A','南宁市'),('桂B','柳州市'),('桂C','桂林市'),('桂D','梧州市'),('桂E','北海市'),('桂F','崇左市'),('桂G','来宾市'),('桂J','贺州市'),('桂K','玉林市'),('桂L','百色市'),('桂M','河池市'),('桂N','钦州市'),('桂P','防城港市'),('桂R','贵港市'),('黑A','哈尔滨市'),('黑B','齐齐哈尔市'),('黑C','牡丹江市'),('黑D','佳木斯市'),('黑E','大庆市'),('黑F','伊春市'),('黑G','鸡西市'),('黑H','鹤岗市'),('黑J','双鸭山市'),('黑K','七台河市'),('黑L','哈尔滨市'),('黑M','绥化市'),('黑N','黑河市'),('沪A','上海市'),('沪B','上海市'),('沪C','上海市'),('沪D','上海市'),('沪E','上海市'),('沪F','上海市'),('沪G','上海市'),('沪H','上海市'),('沪J','上海市'),('沪K','上海市'),('沪L','上海市'),('沪M','上海市'),('沪N','上海市'),('沪R','上海市'),('吉A','长春市'),('吉B','吉林市'),('吉C','四平市'),('吉D','辽源市'),('吉E','通化市'),('吉F','白山市'),('吉G','白城市'),('吉H','延吉市'),('吉J','松原市'),('吉K','白山市'),('冀A','石家庄市'),('冀B','唐山市'),('冀C','秦皇岛市'),('冀D','邯郸市'),('冀E','邢台市'),('冀F','保定市'),('冀G','张家口市'),('冀H','承德市'),('冀J','沧州市'),('冀R','廊坊市'),('冀T','衡水市'),('津A','天津市'),('津B','天津市'),('津C','天津市'),('津D','天津市'),('津E','天津市'),('津F','天津市'),('津G','天津市'),('津H','天津市'),('津J','天津市'),('津K','天津市'),('津L','天津市'),('津M','天津市'),('津N','天津市'),('津Q','天津市'),('津R','天津市'),('晋A','太原市'),('晋B','大同市'),('晋C','阳泉市'),('晋D','长治市'),('晋E','晋城市'),('晋F','朔州市'),('晋H','忻州市'),('晋J','吕梁市'),('晋K','晋中市'),('晋L','临汾市'),('晋M','运城市'),('京A','北京市'),('京B','北京市'),('京C','北京市'),('京D','北京市'),('京E','北京市'),('京F','北京市'),('京G','北京市'),('京H','北京市'),('京J','北京市'),('京K','北京市'),('京L','北京市'),('京M','北京市'),('京N','北京市'),('京P','北京市'),('京Q','北京市'),('京R','北京市'),('京V','北京市'),('京Y','北京市'),('辽A','沈阳市'),('辽B','大连市'),('辽C','鞍山市'),('辽D','抚顺市'),('辽E','本溪市'),('辽F','丹东市'),('辽G','锦州市'),('辽H','营口市'),('辽J','阜新市'),('辽K','辽阳市'),('辽L','盘锦市'),('辽M','铁岭市'),('辽N','朝阳市'),('辽P','葫芦岛市'),('鲁A','济南市'),('鲁B','青岛市'),('鲁C','淄博市'),('鲁D','枣庄市'),('鲁E','东营市'),('鲁F','烟台市'),('鲁G','潍坊市'),('鲁H','济宁市'),('鲁J','泰安市'),('鲁K','威海市'),('鲁L','日照市'),('鲁M','滨州市'),('鲁N','德州市'),('鲁P','聊城市'),('鲁Q','临沂市'),('鲁R','菏泽市'),('鲁S','莱芜市'),('鲁U','青岛市'),('鲁V','潍坊市'),('鲁Y','烟台市'),('蒙A','呼和浩特市'),('蒙B','包头市'),('蒙C','乌海市'),('蒙D','赤峰市'),('蒙G','通辽市'),('蒙H','锡林郭勒盟'),('蒙J','乌兰察布市'),('蒙K','鄂尔多斯市'),('蒙L','巴彦淖尔市'),('蒙M','阿拉善盟'),('闽A','福州市'),('闽B','莆田市'),('闽C','泉州市'),('闽D','厦门市'),('闽E','漳州市'),('闽F','龙岩市'),('闽G','三明市'),('闽H','南平市'),('闽J','宁德市'),('闽K','福州市'),('宁A','银川市'),('宁B','石嘴山市'),('宁C','吴忠市'),('宁D','固原市'),('宁E','中卫市'),('青A','西宁市'),('青B','海东地区'),('青C','海北州'),('青E','海南州'),('青H','海西州'),('琼A','海口市'),('琼B','三亚市'),('琼C','琼海市'),('琼D','五指山市'),('琼E','海口市'),('陕A','西安市'),('陕B','铜川市'),('陕C','宝鸡市'),('陕D','咸阳市'),('陕E','渭南市'),('陕F','汉中市'),('陕G','安康市'),('陕H','商洛市'),('陕J','延安市'),('陕K','榆林市'),('陕V','西安市'),('苏A','南京市'),('苏B','无锡市'),('苏C','徐州市'),('苏D','常州市'),('苏E','苏州市'),('苏F','南通市'),('苏G','连云港市'),('苏H','淮安市'),('苏J','盐城市'),('苏K','扬州市'),('苏L','镇江市'),('苏M','泰州市'),('苏N','宿迁市'),('皖A','合肥市'),('皖B','芜湖市'),('皖C','蚌埠市'),('皖D','淮南市'),('皖E','马鞍山市'),('皖F','淮北市'),('皖G','铜陵市'),('皖H','安庆市'),('皖J','黄山市'),('皖K','阜阳市'),('皖L','宿州市'),('皖M','滁州市'),('皖N','六安市'),('皖P','宣城市'),('皖Q','巢湖市'),('皖R','池州市'),('皖S','亳州市'),('湘A','长沙市'),('湘B','株洲市'),('湘C','湘潭市'),('湘D','衡阳市'),('湘E','邵阳市'),('湘F','岳阳市'),('湘G','张家界市'),('湘H','益阳市'),('湘J','常德市'),('湘K','娄底市'),('湘L','郴州市'),('湘M','永州市'),('湘N','怀化市'),('湘U','湘西州'),('新A','乌鲁木齐市'),('新B','昌吉州'),('新G','塔城地区'),('新M','巴音郭楞州'),('新Q','喀什地区'),('新R','和田地区'),('渝A','重庆市'),('渝B','重庆市'),('渝C','重庆市'),('渝F','重庆市'),('渝G','重庆市'),('渝H','重庆市'),('豫A','郑州市'),('豫B','开封市'),('豫C','洛阳市'),('豫D','平顶山市'),('豫E','安阳市'),('豫F','鹤壁市'),('豫G','新乡市'),('豫H','焦作市'),('豫J','濮阳市'),('豫K','许昌市'),('豫L','漯河市'),('豫M','三门峡市'),('豫N','商丘市'),('豫P','周口市'),('豫Q','驻马店市'),('豫R','南阳市'),('豫S','信阳市'),('豫U','济源市'),('粤A','广州市'),('粤B','深圳市'),('粤C','珠海市'),('粤D','汕头市'),('粤E','佛山市'),('粤F','韶关市'),('粤G','湛江市'),('粤H','肇庆市'),('粤J','江门市'),('粤K','茂名市'),('粤L','惠州市'),('粤M','梅州市'),('粤N','汕尾市'),('粤P','河源市'),('粤Q','阳江市'),('粤R','清远市'),('粤S','东莞市'),('粤T','中山市'),('粤U','潮州市'),('粤V','揭阳市'),('粤W','云浮市'),('粤X','佛山市'),('粤Y','佛山市'),('云A','昆明市'),('云B','昆明市'),('云C','昭通市'),('云D','曲靖市'),('云E','楚雄州'),('云F','玉溪市'),('云G','红河州'),('云H','文山州'),('云J','普洱市'),('云K','西双版纳州'),('云L','大理市'),('云L','大理州'),('云M','保山市'),('云N','德宏州'),('云P','丽江市'),('云Q','怒江州'),('云R','迪庆州'),('云S','临沧市'),('浙A','杭州市'),('浙B','宁波市'),('浙C','温州市'),('浙D','绍兴市'),('浙E','湖州市'),('浙F','嘉兴市'),('浙G','金华市'),('浙H','衢州市'),('浙J','台州市'),('浙K','丽水市'),('浙L','舟山市');
/*!40000 ALTER TABLE `plate_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_photos`
--

DROP TABLE IF EXISTS `profile_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_photos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `photo_size` bigint unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `profile_photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_photos`
--

LOCK TABLES `profile_photos` WRITE;
/*!40000 ALTER TABLE `profile_photos` DISABLE KEYS */;
INSERT INTO `profile_photos` VALUES (1,12,234,'2021-12-14 19:54:59','2021-12-14 19:54:59'),(2,18,183,'2021-12-14 19:54:59','2021-12-14 19:54:59'),(3,21,39,'2021-12-14 19:54:59','2021-12-14 19:54:59'),(4,15,61,'2021-12-14 19:54:59','2021-12-14 19:54:59');
/*!40000 ALTER TABLE `profile_photos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `profile_photo_insert` AFTER INSERT ON `profile_photos` FOR EACH ROW BEGIN 
UPDATE profiles 
SET profiles.profile_photo_id = NEW.id
WHERE profiles.user_id = NEW.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(200) DEFAULT NULL,
  `profile_photo_id` bigint unsigned DEFAULT NULL,
  `gender` enum('F','M') DEFAULT 'M',
  `birthday_decode` enum('50','60','70','80','90','00') DEFAULT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `profession` varchar(200) DEFAULT NULL,
  `self_discription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `profile_photo_id` (`profile_photo_id`),
  KEY `birthday_decode_idx` (`birthday_decode`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `profiles_ibfk_2` FOREIGN KEY (`profile_photo_id`) REFERENCES `profile_photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Didi company',NULL,'M',NULL,NULL,NULL,NULL,NULL),(11,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL),(12,NULL,1,'M',NULL,NULL,NULL,NULL,NULL),(13,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL),(14,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL),(15,NULL,4,'M',NULL,NULL,NULL,NULL,NULL),(16,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL),(17,'Lize',NULL,'F',NULL,NULL,NULL,NULL,NULL),(18,'歧女士',2,'F','70',NULL,NULL,NULL,NULL),(19,'似先生',NULL,'M','80',NULL,NULL,NULL,NULL),(20,'字女士',NULL,'F','80',NULL,NULL,NULL,NULL),(21,NULL,3,'M',NULL,NULL,NULL,NULL,NULL),(22,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL),(23,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL),(24,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL),(25,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL),(26,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL),(27,NULL,NULL,'M',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province_codes`
--

DROP TABLE IF EXISTS `province_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province_codes` (
  `code` int unsigned NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province_codes`
--

LOCK TABLES `province_codes` WRITE;
/*!40000 ALTER TABLE `province_codes` DISABLE KEYS */;
INSERT INTO `province_codes` VALUES (11,'北京市'),(12,'天津市'),(13,'河北省'),(14,'山西省'),(15,'内蒙古'),(21,'辽宁省'),(22,'吉林省'),(23,'黑龙江'),(31,'上海市'),(32,'江苏省'),(33,'浙江省'),(34,'安徽省'),(35,'福建省'),(36,'江西省'),(37,'山东省'),(41,'河南省'),(42,'湖北省'),(43,'湖南省'),(44,'广东省'),(45,'广西'),(46,'海南省'),(50,'重庆市'),(51,'四川省'),(52,'贵州省'),(53,'云南省'),(54,'西藏'),(61,'陕西省'),(62,'甘肃省'),(63,'青海省'),(64,'宁夏省'),(65,'新疆');
/*!40000 ALTER TABLE `province_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `use_characters`
--

DROP TABLE IF EXISTS `use_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `use_characters` (
  `use_character_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`use_character_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `use_characters`
--

LOCK TABLES `use_characters` WRITE;
/*!40000 ALTER TABLE `use_characters` DISABLE KEYS */;
INSERT INTO `use_characters` VALUES (2,'business passenger cars'),(4,'business trucks'),(1,'non-business passenger cars'),(3,'non-business trucks');
/*!40000 ALTER TABLE `use_characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_points`
--

DROP TABLE IF EXISTS `user_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_points` (
  `user_id` bigint unsigned NOT NULL,
  `member_level_id` int unsigned NOT NULL DEFAULT '1',
  `basic_points` int NOT NULL DEFAULT '0',
  `consumers_points` int NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `user_id` (`user_id`),
  KEY `member_level_id` (`member_level_id`),
  CONSTRAINT `user_points_ibfk_1` FOREIGN KEY (`member_level_id`) REFERENCES `member_levels` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_points_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_points`
--

LOCK TABLES `user_points` WRITE;
/*!40000 ALTER TABLE `user_points` DISABLE KEYS */;
INSERT INTO `user_points` VALUES (1,1,0,0,'2021-12-15 19:34:18'),(11,1,40,0,'2021-12-14 20:13:35'),(12,1,45,2,'2021-12-15 19:44:51'),(13,1,45,25,'2021-12-15 20:56:23'),(14,1,45,4,'2021-12-16 19:33:47'),(15,2,156,0,'2021-12-15 21:54:32'),(16,1,5,35,'2021-12-15 19:44:51'),(17,1,45,8,'2021-12-15 19:44:51'),(18,1,40,0,'2021-12-14 20:13:35'),(19,1,40,0,'2021-12-14 20:13:35'),(20,1,40,0,'2021-12-14 20:13:35'),(21,1,40,0,'2021-12-14 20:13:35'),(22,1,0,0,'2021-12-14 19:43:45'),(23,1,40,0,'2021-12-14 20:13:35'),(24,1,0,0,'2021-12-14 19:43:47'),(25,1,40,0,'2021-12-14 20:13:35'),(26,1,0,0,'2021-12-14 19:43:49'),(27,1,40,0,'2021-12-14 20:13:35');
/*!40000 ALTER TABLE `user_points` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_user_points` BEFORE UPDATE ON `user_points` FOR EACH ROW BEGIN
IF NEW.basic_points != OLD.basic_points THEN 
IF NEW.basic_points > 149 AND NEW.basic_points < 300 THEN 
SET NEW.member_level_id = 2;
ELSEIF NEW.basic_points >= 300 AND NEW.basic_points < 800 THEN 
SET NEW.member_level_id = 3;
ELSEIF NEW.basic_points >= 800 AND NEW.basic_points < 1800 THEN 
SET NEW.member_level_id = 4;
ELSEIF NEW.basic_points >= 1800 AND NEW.basic_points < 3800 THEN 
SET NEW.member_level_id = 5;
ELSEIF NEW.basic_points >= 3800 THEN 
SET NEW.member_level_id = 6;
END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone` char(11) NOT NULL,
  `password_hash` varchar(65) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'4000000999','$2y$10$RT23.uUlpLfWwErqPClOtOHAJUJ32rJwWVeC8j312.cXgsg0iBac2','2021-12-15 19:34:18','2021-12-15 19:34:18'),(11,'12345678988','$2y$10$uMMeUS56STleGZs380TTV./YlFGnv8/ANfHirh8y6GzFUN249A7xO','2021-12-14 19:43:34','2021-12-14 19:43:34'),(12,'12235673998','$2y$10$kKMMZEbr.LLCRoCNk6Vl..bZhB3FqhEEzTqo778LsZKh7NxWFCi8u','2021-12-14 19:43:35','2021-12-14 19:43:35'),(13,'19483330228','$2y$10$A3veo9kiNGykYjXt.bTNPO/OM97KyxhHEccf.Kd187MZpdv3CIVei','2021-12-14 19:43:36','2021-12-14 19:43:36'),(14,'19205339882','$2y$10$RTGK.uUlpLfWwErqPClOtOHAJUJq7rJwWVeC8j3HP.cXgsg0iBac2','2021-12-14 19:43:37','2021-12-14 19:43:37'),(15,'19364882004','$2y$10$wifbbkYUNDoxhZmkGYwy5.ezubAUexYozdxeEkULZaZ.IxqHo04MK','2021-12-14 19:43:38','2021-12-14 19:43:38'),(16,'13572044876','$2y$10$ZsAkplLpOl5TZcLwvLH9Puons0Xovl9fDSj9uQ8ZDUNaqYfGAQRQ6','2021-12-14 19:43:39','2021-12-14 19:43:39'),(17,'13755038299','$2y$10$.NIEANqWL2rzWk2wDSsALOQXlaihVKiGN3pewIhupRwNVhV3WpzYm','2021-12-14 19:43:40','2021-12-14 19:43:40'),(18,'13056293004','$2y$10$MgIvG85pqaOHPuNGvpyFg.PMrrTQa0OdqvqH9Q8JGgl5h1Aa7PUea','2021-12-14 19:43:41','2021-12-14 19:43:41'),(19,'13450321333','$2y$10$.6.SWZGzghCV7DvaJ0auc.Ff9llCecz/Fg53hwjK8EeMearz56fhi','2021-12-14 19:43:42','2021-12-14 19:43:42'),(20,'19302454392','$2y$10$DFFbWebUpHUXy/5VJUZXjOu5hrOJbcFYygdv/OwVzt9tCci4KOuzm','2021-12-14 19:43:43','2021-12-14 19:43:43'),(21,'19346583241','$2y$10$BKnhozb9humtPXzyTuHQ0.ee7Tspctb3W.LpdeYTki5jfTRKJPYQy','2021-12-14 19:43:44','2021-12-14 19:43:44'),(22,'19263826352','$2y$10$Tlrpd7ENgczodbXLG3RJluBQmUX.XQ70FC97xx5VKkIG7Fw0TFrm6','2021-12-14 19:43:45','2021-12-14 19:43:45'),(23,'13940398843','$2y$10$Tlrpd7ENgczod2XLG3RJluBQmUX.XQ70FC97xx5VKkIG7Fw0TFrm6','2021-12-14 19:43:46','2021-12-14 19:43:46'),(24,'13928403321','$2y$10$.NIEANqWL2rz1k2w3SsALOQXlaihVKiGN3pewIhupRwNVhV3WpzYm','2021-12-14 19:43:47','2021-12-14 19:43:47'),(25,'16932836490','$2y$10$XXaXVMaVo3QNhaccu5sou.OE8w8tSCpazalSPvzZrORLLwXGTggzW','2021-12-14 19:43:48','2021-12-14 19:43:48'),(26,'19373928311','$2y$10$Jxnva0nQ845ERk0ORCIQreRISzEtCtEVTP9cxirWLFcHiAEhg2p0a','2021-12-14 19:43:49','2021-12-14 19:43:49'),(27,'10323248232','$2y$10$TSQUUo0JIb5q3CqjUltqWubOfyhKkkoxYMwhJQUNnv24jaE2Z/lc2','2021-12-14 19:43:50','2021-12-14 19:43:50');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tables_of_new_user_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN 
INSERT INTO user_points(user_id) VALUES (NEW.id);
INSERT INTO document_status(user_id) VALUES (NEW.id);
INSERT INTO profiles(user_id) VALUES (NEW.id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vehicle_licenses`
--

DROP TABLE IF EXISTS `vehicle_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_licenses` (
  `vehicle_license_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plate_id` varchar(8) NOT NULL,
  `vehicle_type_id` int unsigned NOT NULL,
  `owner_fullname` varchar(200) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `model` varchar(80) DEFAULT NULL,
  `use_character_id` int unsigned NOT NULL,
  `VIN` varchar(17) DEFAULT NULL,
  `engine_id` varchar(8) DEFAULT NULL,
  `police_register_date` date NOT NULL,
  `license_register_date` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`vehicle_license_id`),
  UNIQUE KEY `vehicle_license_id` (`vehicle_license_id`),
  UNIQUE KEY `plate_id` (`plate_id`),
  UNIQUE KEY `engine_id` (`engine_id`),
  KEY `vehicle_type_id` (`vehicle_type_id`),
  KEY `use_character_id` (`use_character_id`),
  KEY `inx_owner_fullname` (`owner_fullname`),
  KEY `user_id` (`user_id`),
  KEY `plate_id_2` (`plate_id`),
  CONSTRAINT `vehicle_licenses_ibfk_1` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`vehicle_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vehicle_licenses_ibfk_2` FOREIGN KEY (`use_character_id`) REFERENCES `use_characters` (`use_character_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vehicle_licenses_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_licenses`
--

LOCK TABLES `vehicle_licenses` WRITE;
/*!40000 ALTER TABLE `vehicle_licenses` DISABLE KEYS */;
INSERT INTO `vehicle_licenses` VALUES (4,'浙AD89122',3,'歧丹丹','浙江省杭州市上城区','BMW7200HL',1,'LBV8V3120482H4245','20459211','2016-03-21','2019-11-28','2021-12-14 21:20:22','2021-12-14 21:20:22',18),(5,'浙AK391M2',3,'似玉石','浙江省杭州市上城区','SC7081C',1,'DHNV32OS020031321','32048273','2002-12-13','2003-11-09','2021-12-14 21:20:22','2021-12-14 21:20:22',19),(6,'浙AS273K1',3,'字天晴','浙江省杭州市上城区','EQ3100FE',1,'SK392H402N123B54D','3945298','2008-08-22','2018-02-01','2021-12-14 21:20:22','2021-12-14 21:20:22',20),(7,'浙AD89121',3,'六明远','浙江省杭州市上城区','BH7164AX',1,'1937F93JS720S0K37','62039484','2009-08-12','2009-09-01','2021-12-16 21:35:07','2021-12-16 21:35:07',21);
/*!40000 ALTER TABLE `vehicle_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_types`
--

DROP TABLE IF EXISTS `vehicle_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_types` (
  `vehicle_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `discription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vehicle_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_types`
--

LOCK TABLES `vehicle_types` WRITE;
/*!40000 ALTER TABLE `vehicle_types` DISABLE KEYS */;
INSERT INTO `vehicle_types` VALUES (1,'Large passenger car','длина автомобиля не менее 6 м или количество пассажиров не менее 20 человек. Если количество пассажиров переменное, определяется верхний предел.'),(2,'Medium passenger car','длина автомобиля меньше 6 м, а количество пассажиров больше 9 и меньше 20.'),(3,'Small passenger car','длина транспортного средства составляет менее 6 м, а количество пассажиров не превышает 9 человек.'),(4,'Mini passenger car','длина автомобиля меньше или равна 3,5 м, а общий объем цилиндра двигателя меньше или равен 1 литру.'),(5,'Heavy Cargo','длина транспортного средства больше или равна 6 м, а общая масса больше или равна 12000 кг.'),(6,'Medium Cargo','длина транспортного средства больше или равна 6 м, а общая масса больше или равна 4500 кг и меньше 12000 кг.'),(7,'Lightweight Cargo','длина автомобиля составляет менее 6 м, а общая масса - менее 4500 кг.'),(8,'Mini Cargo','длина транспортного средства не превышает 3,5 м, а общая масса не превышает 1800 кг.'),(9,'Other','');
/*!40000 ALTER TABLE `vehicle_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `wallet_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `wallet_balance` decimal(11,2) DEFAULT '0.00',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`wallet_id`),
  UNIQUE KEY `wallet_id` (`wallet_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (1,1,49.65,'2021-12-15 19:35:33','2021-12-16 19:36:30'),(10,20,114.41,'2021-12-15 17:13:14','2021-12-15 20:56:23'),(11,19,2542.94,'2021-12-15 17:13:14','2021-12-15 19:44:51'),(12,18,1241.20,'2021-12-15 17:13:14','2021-12-16 19:36:30');
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `basic_order_info_for_users`
--

/*!50001 DROP VIEW IF EXISTS `basic_order_info_for_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `basic_order_info_for_users` AS select `o`.`user_id_1` AS `user_id`,(select `ot`.`name` from `order_types` `ot` where (`ot`.`order_type_id` = `o`.`order_type_id`)) AS `order_type`,`time_format_from_now`(`o`.`created_at`) AS `order_time`,`o`.`to_address` AS `to_address`,`o`.`from_address` AS `from_address`,(select `os`.`name` from `order_status` `os` where (`os`.`id` = `o`.`order_status`)) AS `order_status` from `orders` `o` order by `o`.`user_id_1`,`o`.`created_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `detail_order_info_for_users`
--

/*!50001 DROP VIEW IF EXISTS `detail_order_info_for_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detail_order_info_for_users` AS select `o`.`user_id_1` AS `user_id`,`o`.`order_id` AS `order_id`,concat(left(`p`.`full_name`,1),'师傅') AS `nick_name`,(select `pp`.`id` from `profile_photos` `pp` where (`pp`.`user_id` = `o`.`user_id_1`)) AS `photo_id`,`vl`.`plate_id` AS `plate_id`,`vl`.`model` AS `car_model`,`d`.`car_color_id` AS `car_color_id`,(case when `o`.`payment_status` then 'payment successful' else 'unpaid' end) AS `Name_exp_8`,`o`.`price` AS `price`,`o`.`basic_points` AS `basic_points`,`o`.`consumer_points` AS `consumer_points` from (((`orders` `o` join `drivers` `d` on((`o`.`driver_id` = `d`.`user_id`))) join `passports` `p` on((`p`.`user_id` = `d`.`user_id`))) join `vehicle_licenses` `vl` on((`d`.`user_id` = `vl`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `drivers_basic_info`
--

/*!50001 DROP VIEW IF EXISTS `drivers_basic_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `drivers_basic_info` AS select `drivers`.`user_id` AS `driver_id`,(case `passports`.`gender` when 'M' then concat(left(`passports`.`full_name`,1),'先生') else concat(left(`passports`.`full_name`,1),'女士') end) AS `nick_name`,`ot`.`name` AS `order_type`,`passports`.`gender` AS `gender`,(case substr(`passports`.`birthday`,3,1) when 5 then '50' when 6 then '60' when 7 then '70' when 8 then '80' when 9 then '90' else '00' end) AS `birthday_decode`,`pp`.`id` AS `photo_id` from (((`drivers` join `passports` on((`drivers`.`user_id` = `passports`.`user_id`))) join `order_types` `ot` on((`drivers`.`order_type_id` = `ot`.`order_type_id`))) join `profile_photos` `pp` on((`pp`.`user_id` = `passports`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_count_by_month`
--

/*!50001 DROP VIEW IF EXISTS `orders_count_by_month`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_count_by_month` AS select year(`orders`.`delivered_at`) AS `year`,monthname(`orders`.`delivered_at`) AS `month`,count(0) AS `total_orders`,sum(`orders`.`price`) AS `total_price` from `orders` where (`orders`.`order_status` = 2) group by `month` order by year(`orders`.`delivered_at`),month(`orders`.`delivered_at`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-26 12:39:10
