-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 192.168.83.137    Database: yii2advanced
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('admin','1',1498575495),('user','10',1499959031),('user','11',1499961733),('user','12',1499961949),('user','13',1499962055),('user','14',1499962329),('user','15',1499964408),('user','16',1499964454),('user','17',1499965573),('user','18',1500049145),('user','19',1502827251),('user','5',1499444586),('user','6',1499612891),('user','7',1499612891),('user','8',1499958868),('user','9',1499958956);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('admin',1,NULL,NULL,NULL,1498575495,1498575495),('user',1,NULL,NULL,NULL,1498575495,1498575495),('viewAdminPage',2,'View Admin',NULL,NULL,1498575495,1498575495);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('admin','viewAdminPage');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biometrics_log`
--

DROP TABLE IF EXISTS `biometrics_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biometrics_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `body_weight` varchar(45) DEFAULT NULL,
  `body_fat` varchar(45) DEFAULT NULL,
  `lean_bodymass` varchar(45) DEFAULT NULL,
  `blood_presure_systolic` varchar(45) DEFAULT NULL,
  `blood_presure_diastolic` varchar(45) DEFAULT NULL,
  `heart_rate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bio_log_user_id_idx` (`user_id`),
  CONSTRAINT `fk_bio_log_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biometrics_log`
--

LOCK TABLES `biometrics_log` WRITE;
/*!40000 ALTER TABLE `biometrics_log` DISABLE KEYS */;
INSERT INTO `biometrics_log` VALUES (1,18,'1499817600','80 kg','8%','60 kg','120 mm HG','80 mm HG','105 bpm'),(2,18,'1502323200','75 kg','5%','60 kg','120 mm HG','80 mm HG','95 bpm'),(3,18,'1502323200','','','','','','');
/*!40000 ALTER TABLE `biometrics_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardio_day`
--

DROP TABLE IF EXISTS `cardio_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardio_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_id` int(11) NOT NULL,
  `training_zone` varchar(15) NOT NULL,
  `suggested_bpm` varchar(45) DEFAULT NULL,
  `suggested_time` varchar(45) DEFAULT NULL,
  `training_tips` text,
  PRIMARY KEY (`id`),
  KEY `fk_week_id_idx` (`week_id`),
  CONSTRAINT `fk_week_id` FOREIGN KEY (`week_id`) REFERENCES `cardio_week` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardio_day`
--

LOCK TABLES `cardio_day` WRITE;
/*!40000 ALTER TABLE `cardio_day` DISABLE KEYS */;
INSERT INTO `cardio_day` VALUES (6,7,'dynamic','90','1m','Tip1'),(7,8,'recovery','100','2m','Day 2 Tip1'),(8,8,'fat burner','120','5m','Day 2 Tip 2'),(9,8,'hiit','234','234','23tgadfbartjwrthhae\r\nh\r\nwrt\r\nhwr');
/*!40000 ALTER TABLE `cardio_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardio_log`
--

DROP TABLE IF EXISTS `cardio_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardio_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `starting_speed` varchar(45) DEFAULT NULL,
  `speed_increase` varchar(45) DEFAULT NULL,
  `distance_interval` varchar(45) DEFAULT NULL,
  `incline` varchar(45) DEFAULT NULL,
  `max_heart_rate` varchar(45) DEFAULT NULL,
  `max_speed` varchar(45) DEFAULT NULL,
  `max_estimated_vo2` varchar(45) DEFAULT NULL,
  `max_distance` varchar(45) DEFAULT NULL,
  `anaerobic_heart_rate` varchar(45) DEFAULT NULL,
  `anaerobic_speed` varchar(45) DEFAULT NULL,
  `anaerobic_estimated_vo2` varchar(45) DEFAULT NULL,
  `aerobic_heart_rate` varchar(45) DEFAULT NULL,
  `aerobic_speed` varchar(45) DEFAULT NULL,
  `recovery` varchar(45) DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cardio_log_idx` (`user_id`),
  CONSTRAINT `fk_cardio_log` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardio_log`
--

LOCK TABLES `cardio_log` WRITE;
/*!40000 ALTER TABLE `cardio_log` DISABLE KEYS */;
INSERT INTO `cardio_log` VALUES (5,18,'1500508800','7.2 km/h','0.5 km/h','200 m','1°','184 bpm','16.2 km/h','100 ml/kg','5 000 m','177 bpm','14.6 km/h','100 ml/kg','145  bpm','8.0 km/h','medium','tired_legs'),(6,18,'1500608800','8.4 km/h','1.5 km/h','400 m','2°','174 bpm','18.6 km/h','110 ml/kg','6 000 m','167 bpm','17.6 km/h','100 ml/kg','147  bpm','9.0 km/h','medium','tired_legs'),(8,18,'1502841600','100','100','1223','123','123','123','123','123','123','123','123','123','123','medium','tired_legs');
/*!40000 ALTER TABLE `cardio_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardio_plan`
--

DROP TABLE IF EXISTS `cardio_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardio_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(150) NOT NULL,
  `description` text,
  `details` text,
  `recheck` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardio_plan`
--

LOCK TABLES `cardio_plan` WRITE;
/*!40000 ALTER TABLE `cardio_plan` DISABLE KEYS */;
INSERT INTO `cardio_plan` VALUES (7,'Level 1','LEVEL DESCRIPTION text','DETAILS text','RECHECK text');
/*!40000 ALTER TABLE `cardio_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardio_section`
--

DROP TABLE IF EXISTS `cardio_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardio_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardio_section`
--

LOCK TABLES `cardio_section` WRITE;
/*!40000 ALTER TABLE `cardio_section` DISABLE KEYS */;
INSERT INTO `cardio_section` VALUES (1,'Cardio Section','Lorem ipsum dolor sit amet');
/*!40000 ALTER TABLE `cardio_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardio_week`
--

DROP TABLE IF EXISTS `cardio_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardio_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_week_plan_id_idx` (`plan_id`),
  CONSTRAINT `fk_week_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `cardio_plan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardio_week`
--

LOCK TABLES `cardio_week` WRITE;
/*!40000 ALTER TABLE `cardio_week` DISABLE KEYS */;
INSERT INTO `cardio_week` VALUES (7,7),(8,7);
/*!40000 ALTER TABLE `cardio_week` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercise_name` varchar(150) NOT NULL,
  `muscle_group` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `description` text,
  `alternate` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'Biceps Curl','Shoulders','Barbell','https://www.youtube.com/watch?v=ykJmrZ5v0Oo','Lorem ipsum',NULL),(2,'Push-up or Knee push-up','Chest','Bodyweight','https://www.youtube.com/watch?v=ykJmrZ5v0Oo','Text','a:1:{i:0;s:1:\"1\";}');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filemanager_mediafile`
--

DROP TABLE IF EXISTS `filemanager_mediafile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filemanager_mediafile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `alt` text,
  `size` varchar(255) NOT NULL,
  `description` text,
  `thumbs` text,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filemanager_mediafile`
--

LOCK TABLES `filemanager_mediafile` WRITE;
/*!40000 ALTER TABLE `filemanager_mediafile` DISABLE KEYS */;
INSERT INTO `filemanager_mediafile` VALUES (1,'slide1.jpg','image/jpeg','/uploads/2017/08/slide1.jpg',NULL,'241280',NULL,'a:3:{s:5:\"small\";s:33:\"/uploads/2017/08/slide1-small.jpg\";s:6:\"medium\";s:34:\"/uploads/2017/08/slide1-medium.jpg\";s:5:\"large\";s:33:\"/uploads/2017/08/slide1-large.jpg\";}',1503065551,NULL),(2,'slide2.jpg','image/jpeg','/uploads/2017/08/slide2.jpg',NULL,'273811',NULL,'a:3:{s:5:\"small\";s:33:\"/uploads/2017/08/slide2-small.jpg\";s:6:\"medium\";s:34:\"/uploads/2017/08/slide2-medium.jpg\";s:5:\"large\";s:33:\"/uploads/2017/08/slide2-large.jpg\";}',1503067920,NULL),(3,'slide3.jpg','image/jpeg','/uploads/2017/08/slide3.jpg',NULL,'249822',NULL,'a:3:{s:5:\"small\";s:33:\"/uploads/2017/08/slide3-small.jpg\";s:6:\"medium\";s:34:\"/uploads/2017/08/slide3-medium.jpg\";s:5:\"large\";s:33:\"/uploads/2017/08/slide3-large.jpg\";}',1503068074,NULL),(4,'slide4.jpg','image/jpeg','/uploads/2017/08/slide4.jpg',NULL,'79948',NULL,'a:3:{s:5:\"small\";s:33:\"/uploads/2017/08/slide4-small.jpg\";s:6:\"medium\";s:34:\"/uploads/2017/08/slide4-medium.jpg\";s:5:\"large\";s:33:\"/uploads/2017/08/slide4-large.jpg\";}',1503068075,NULL);
/*!40000 ALTER TABLE `filemanager_mediafile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filemanager_mediafile_tag`
--

DROP TABLE IF EXISTS `filemanager_mediafile_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filemanager_mediafile_tag` (
  `mediafile_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  KEY `filemanager_mediafile_tag_mediafile_id__mediafile_id` (`mediafile_id`),
  KEY `filemanager_mediafile_tag_tag_id__tag_id` (`tag_id`),
  CONSTRAINT `filemanager_mediafile_tag_mediafile_id__mediafile_id` FOREIGN KEY (`mediafile_id`) REFERENCES `filemanager_mediafile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `filemanager_mediafile_tag_tag_id__tag_id` FOREIGN KEY (`tag_id`) REFERENCES `filemanager_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filemanager_mediafile_tag`
--

LOCK TABLES `filemanager_mediafile_tag` WRITE;
/*!40000 ALTER TABLE `filemanager_mediafile_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `filemanager_mediafile_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filemanager_owners`
--

DROP TABLE IF EXISTS `filemanager_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filemanager_owners` (
  `mediafile_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `owner_attribute` varchar(255) NOT NULL,
  PRIMARY KEY (`mediafile_id`,`owner_id`,`owner`,`owner_attribute`),
  CONSTRAINT `filemanager_owners_ref_mediafile` FOREIGN KEY (`mediafile_id`) REFERENCES `filemanager_mediafile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filemanager_owners`
--

LOCK TABLES `filemanager_owners` WRITE;
/*!40000 ALTER TABLE `filemanager_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `filemanager_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filemanager_tag`
--

DROP TABLE IF EXISTS `filemanager_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filemanager_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filemanager_tag`
--

LOCK TABLES `filemanager_tag` WRITE;
/*!40000 ALTER TABLE `filemanager_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `filemanager_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1498213475),('m130524_201442_init',1498213476),('m140506_102106_rbac_init',1498574739),('m141129_130551_create_filemanager_mediafile_table',1503059753),('m141203_173402_create_filemanager_owners_table',1503059753),('m141203_175538_add_filemanager_owners_ref_mediafile_fk',1503059753),('m160616_000010_add_filemanager_tags',1503059753);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrition_plan`
--

DROP TABLE IF EXISTS `nutrition_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutrition_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(150) NOT NULL,
  `body_type` text,
  `psy_profile` text,
  `dietary_profile` text,
  `foods_list` text,
  `scheduling_meals` text,
  `week_menu` text,
  `training_tips` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrition_plan`
--

LOCK TABLES `nutrition_plan` WRITE;
/*!40000 ALTER TABLE `nutrition_plan` DISABLE KEYS */;
INSERT INTO `nutrition_plan` VALUES (2,'Body Type 2','Text 1','Text 2','Text 3','Text 4','Text 5','Text 5','Text 6'),(3,'Body Type 3','Text 1','Text 2','Text 3','Text 4','Text 5','Text 5','Text 6');
/*!40000 ALTER TABLE `nutrition_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrition_section`
--

DROP TABLE IF EXISTS `nutrition_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutrition_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrition_section`
--

LOCK TABLES `nutrition_section` WRITE;
/*!40000 ALTER TABLE `nutrition_section` DISABLE KEYS */;
INSERT INTO `nutrition_section` VALUES (3,'Benefits','Lorem ipsum dolor sit amet.'),(4,'Start Your Program','Start Your Program text'),(5,'Section name test','Lorem ipsum dolor sit amet');
/*!40000 ALTER TABLE `nutrition_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'bio-account-body-fat','a:2:{s:5:\"title\";s:10:\"Biometrics\";s:7:\"content\";s:107:\"<p>Body Fat</p>\r\n<p>Lorem Ipsum dolor sit amet</p>\r\n<p><img src=\"/uploads/2017/08/slide1.jpg\" alt=\"\" /></p>\";}'),(2,'bio-lean-bodymass','a:2:{s:5:\"title\";s:10:\"Biometrics\";s:7:\"content\";s:13:\"Lean Bodymass\";}'),(3,'bio-blood-presure','a:2:{s:5:\"title\";s:10:\"Biometrics\";s:7:\"content\";s:13:\"Blood Presure\";}'),(4,'bio-resting-heart-rate','a:2:{s:5:\"title\";s:10:\"Biometrics\";s:7:\"content\";s:18:\"Resting Heart Rate\";}'),(5,'nutrition-activity-lvl','a:2:{s:5:\"title\";s:9:\"Nutrition\";s:7:\"content\";s:14:\"Activity Level\";}'),(6,'cardio-anaerobic-heart-rate','a:2:{s:5:\"title\";s:6:\"Cardio\";s:7:\"content\";s:20:\"Anaerobic Heart Rate\";}'),(7,'cardio-anaerobic-speed','a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}'),(8,'cardio-anaerobic-estimated-vo2','a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}'),(9,'cardio-aerobic-heart-rate','a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}'),(10,'cardio-aerobic-speed','a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}'),(11,'cardio-recovery','a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";}'),(12,'strength-level','a:2:{s:5:\"title\";s:8:\"Strength\";s:7:\"content\";s:14:\"Strength Level\";}');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strength_day`
--

DROP TABLE IF EXISTS `strength_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strength_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_id` int(11) NOT NULL,
  `training_tips` text,
  PRIMARY KEY (`id`),
  KEY `fk_strength_week_id_idx` (`week_id`),
  CONSTRAINT `fk_strength_week_id` FOREIGN KEY (`week_id`) REFERENCES `strength_week` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strength_day`
--

LOCK TABLES `strength_day` WRITE;
/*!40000 ALTER TABLE `strength_day` DISABLE KEYS */;
INSERT INTO `strength_day` VALUES (1,3,'Week 1 \r\nDay 1\r\nTraning tips'),(2,3,'Week 1\r\nDay 2\r\ntraining tips'),(3,4,'Week 2\r\nDay 1\r\nTrining tips'),(4,5,'Tip Day 1 \r\nWeek 1'),(5,5,'Day 2 Week 1\r\nTips'),(6,6,'Day1 Week 2\r\nTRAINING  Tips\r\nLorem ipsum dolor sit amet'),(7,7,'Lorem'),(11,6,''),(13,12,''),(17,16,'');
/*!40000 ALTER TABLE `strength_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strength_exercise`
--

DROP TABLE IF EXISTS `strength_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strength_exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `exercise_name` varchar(150) DEFAULT NULL,
  `muscle_group` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `sets` varchar(45) DEFAULT NULL,
  `reps` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_strength_exercise_day_idx` (`day_id`),
  CONSTRAINT `fk_strength_exercise_day` FOREIGN KEY (`day_id`) REFERENCES `strength_day` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strength_exercise`
--

LOCK TABLES `strength_exercise` WRITE;
/*!40000 ALTER TABLE `strength_exercise` DISABLE KEYS */;
INSERT INTO `strength_exercise` VALUES (4,5,1,'Biceps Curl','Shoulders','Barbell','123','432','12kg',2),(5,5,1,'Biceps Curl','Shoulders','Barbell','123','432','12kg',1),(7,4,3,'Exercise 3','Chest','Bodyweight','44','22','123kg',2),(9,4,4,'Exercise 4','Shoulders','Bodyweight','11','22','33kg',1),(11,4,2,'Push-up or Knee push-up','Chest','Bodyweight','456','9876','456',4),(12,4,1,'Biceps Curl','Shoulders','Barbell','qwerty','qwerty','qwerty',5),(13,6,4,'Exercise 4','Shoulders','Bodyweight','45','43','12kg',NULL),(14,11,4,'Exercise 4','Shoulders','Bodyweight','99','10','40kg',NULL),(18,4,2,'Push-up or Knee push-up','Chest','Bodyweight','10','10','10',3),(21,13,1,'Biceps Curl','Shoulders','Barbell','','','',NULL),(22,13,1,'Biceps Curl','Shoulders','Barbell','50','12','10 kg',NULL),(23,13,1,'Biceps Curl','Shoulders','Barbell','987','987','321',NULL);
/*!40000 ALTER TABLE `strength_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strength_log`
--

DROP TABLE IF EXISTS `strength_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strength_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `leg_extension` varchar(45) DEFAULT NULL,
  `leg_curls` varchar(45) DEFAULT NULL,
  `incline_bench_press` varchar(45) DEFAULT NULL,
  `lat_pulldown` varchar(45) DEFAULT NULL,
  `seated_shoulder_press` varchar(45) DEFAULT NULL,
  `triceps_pushdown` varchar(45) DEFAULT NULL,
  `biceps_curl` varchar(45) DEFAULT NULL,
  `leg_extension_rep` varchar(45) DEFAULT NULL,
  `leg_curls_rep` varchar(45) DEFAULT NULL,
  `incline_bench_press_rep` varchar(45) DEFAULT NULL,
  `lat_pulldown_rep` varchar(45) DEFAULT NULL,
  `seated_shoulder_press_rep` varchar(45) DEFAULT NULL,
  `triceps_pushdown_rep` varchar(45) DEFAULT NULL,
  `biceps_curl_rep` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_user_id_idx` (`user_id`),
  CONSTRAINT `fk_log_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strength_log`
--

LOCK TABLES `strength_log` WRITE;
/*!40000 ALTER TABLE `strength_log` DISABLE KEYS */;
INSERT INTO `strength_log` VALUES (1,1501545600,18,'10 kg','15 kg','20 kg','30 kg','40 kg','50 kg','60 kg','10','15','20','30','40','50','60'),(2,1502496000,18,'11 kg','22 kg','33 kg','','','','','11','22','','','','',''),(3,1502841600,18,'33 kg','44 kg','21 kg','23 kg','65 kg','30kg','10 kg','12','65','89','43','22','30','10');
/*!40000 ALTER TABLE `strength_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strength_plan`
--

DROP TABLE IF EXISTS `strength_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strength_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(150) NOT NULL,
  `category` varchar(45) NOT NULL,
  `description` text,
  `details` text,
  `recheck` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strength_plan`
--

LOCK TABLES `strength_plan` WRITE;
/*!40000 ALTER TABLE `strength_plan` DISABLE KEYS */;
INSERT INTO `strength_plan` VALUES (5,'Level','Shape muscles','Plan Desc','Details','Recheck'),(6,'Strength Training','Gain strength','PLAN DESCRIPTION','DETAILS','RECHEK'),(7,'Level','Muscles endurance','PLAN DESCRIPTION','DETAILS','RECHEK'),(10,'Shape Plan','Gain strength','Lorem','Ipsum','Dolor'),(13,'Level','Tone muscles','','','');
/*!40000 ALTER TABLE `strength_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strength_week`
--

DROP TABLE IF EXISTS `strength_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strength_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_strength_plan_id_idx` (`plan_id`),
  CONSTRAINT `fk_strength_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `strength_plan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strength_week`
--

LOCK TABLES `strength_week` WRITE;
/*!40000 ALTER TABLE `strength_week` DISABLE KEYS */;
INSERT INTO `strength_week` VALUES (3,5),(4,5),(5,6),(6,6),(7,7),(12,10),(16,13);
/*!40000 ALTER TABLE `strength_week` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `last_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@whr.com','admin@whr.com','Super','Administrator','','qp8CtS6UyG9IybBEQWvpWYOdJ6A05zVi','$2y$13$AAgGUIPB5OcTfgl1NtUz.u0HRUDyhwP4sDH/AMD47cPxrgKXzpExa',NULL,10,1498215977,1502723919,NULL),(18,'last_test@user.com','last_test@user.com','LastNew','Test','Webbee.pro','BBN4i-Aglc-a6eHe9n6in3n-NHrbq5WK','$2y$13$HmwUnS6TssRTxT1Orv3ryuhPQ5N6WopvONBqMmRWbEsy1hdBuACzS',NULL,10,1500049145,1502816875,1502816875),(19,'demo9@demo.demo','demo9@demo.demo','Demo','9','Twitch','NU9ecvWmCzNUXBJVcdIG9qRlKqJMJXLe','$2y$13$FgOHy4gmpmfpJEg228miIui57nrHbaYs0lTc0yboXbJYwjJb7sH3i',NULL,10,1502827251,1502827251,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cardio_day`
--

DROP TABLE IF EXISTS `user_cardio_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cardio_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_id` int(11) NOT NULL,
  `training_zone` varchar(15) NOT NULL,
  `suggested_bpm` varchar(45) DEFAULT NULL,
  `suggested_time` varchar(45) DEFAULT NULL,
  `training_tips` text,
  PRIMARY KEY (`id`),
  KEY `fk_user_week_id_idx` (`week_id`),
  CONSTRAINT `fk_user_week_id` FOREIGN KEY (`week_id`) REFERENCES `user_cardio_week` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cardio_day`
--

LOCK TABLES `user_cardio_day` WRITE;
/*!40000 ALTER TABLE `user_cardio_day` DISABLE KEYS */;
INSERT INTO `user_cardio_day` VALUES (19,16,'dynamic','90','1m','Tip1'),(20,17,'recovery','100','2m','Day 2 Tip1'),(21,17,'fat burner','120','5m','Day 2 Tip 2'),(22,17,'hiit','234','234','23tgadfbartjwrthhae\r\nh\r\nwrt\r\nhwr');
/*!40000 ALTER TABLE `user_cardio_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cardio_plan`
--

DROP TABLE IF EXISTS `user_cardio_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cardio_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `plan_name` varchar(150) DEFAULT NULL,
  `description` text,
  `details` text,
  `recheck` text,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_cardio_plan_idx` (`user_id`),
  KEY `fk_user_orig_plan_id_idx` (`plan_id`),
  CONSTRAINT `fk_user_id_cardio_plan` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_orig_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `cardio_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cardio_plan`
--

LOCK TABLES `user_cardio_plan` WRITE;
/*!40000 ALTER TABLE `user_cardio_plan` DISABLE KEYS */;
INSERT INTO `user_cardio_plan` VALUES (6,18,7,'Level 1','LEVEL DESCRIPTION text','DETAILS text','RECHECK text');
/*!40000 ALTER TABLE `user_cardio_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cardio_week`
--

DROP TABLE IF EXISTS `user_cardio_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cardio_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_week_user_plan_id_idx` (`plan_id`),
  CONSTRAINT `fk_week_user_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `user_cardio_plan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cardio_week`
--

LOCK TABLES `user_cardio_week` WRITE;
/*!40000 ALTER TABLE `user_cardio_week` DISABLE KEYS */;
INSERT INTO `user_cardio_week` VALUES (16,6),(17,6);
/*!40000 ALTER TABLE `user_cardio_week` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `meta_key` varchar(45) NOT NULL,
  `meta_value` text,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
INSERT INTO `user_meta` VALUES (23,18,'password','aIqjZBAZZ94C'),(24,18,'phone','098765432'),(25,18,'birthday','10.11.1990'),(26,18,'gender','male'),(27,18,'strength-coach','a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}'),(28,18,'strength-self-test','1'),(29,18,'cardio-coach','a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}'),(30,18,'cardio-self-test','5'),(31,18,'nutrition-coach','a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}'),(32,18,'nutrition-self-test-torso','2'),(33,18,'psihical-1','no'),(34,18,'psihical-2','no'),(35,18,'psihical-3','yes'),(36,18,'psihical-4','no'),(37,18,'psihical-5','no'),(38,18,'psihical-6','no'),(39,18,'psihical-7','no'),(40,18,'psihical-8','no'),(49,18,'nutrition-self-test-body','3'),(50,19,'password','UbOrebsgoWnZ'),(51,19,'phone','09876543'),(52,19,'birthday','10 Aug 2017'),(53,19,'gender','male'),(54,19,'strength-coach','a:2:{i:0;s:1:\"2\";i:1;s:1:\"4\";}'),(55,19,'strength-self-test','3'),(56,19,'cardio-self-test','5'),(57,19,'nutrition-coach','a:1:{i:0;s:1:\"2\";}'),(58,19,'nutrition-self-test-torso','2'),(59,19,'nutrition-self-test-body','3'),(60,19,'psihical-2','no'),(61,19,'psihical-4','no'),(62,19,'psihical-6','no'),(63,19,'psihical-8','yes'),(64,19,'cardio-coach','a:1:{i:0;s:1:\"2\";}'),(65,19,'psihical-3','no'),(66,19,'psihical-1','yes'),(67,19,'psihical-5','yes'),(68,19,'psihical-7','yes');
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_note`
--

DROP TABLE IF EXISTS `user_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `fk_user_notes_user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_notes_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_note`
--

LOCK TABLES `user_note` WRITE;
/*!40000 ALTER TABLE `user_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_nutrition_plan`
--

DROP TABLE IF EXISTS `user_nutrition_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_nutrition_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `plan_name` varchar(150) DEFAULT NULL,
  `nutrition_goal` varchar(45) NOT NULL,
  `energy_intake` varchar(45) DEFAULT NULL,
  `activity_level` varchar(45) DEFAULT NULL,
  `body_type` text,
  `psy_profile` text,
  `dietary_profile` text,
  `foods_list` text,
  `scheduling_meals` text,
  `week_menu` text,
  `training_tips` text,
  `user_nutrition_plancol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_np_user_id_idx` (`user_id`),
  CONSTRAINT `fk_np_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_nutrition_plan`
--

LOCK TABLES `user_nutrition_plan` WRITE;
/*!40000 ALTER TABLE `user_nutrition_plan` DISABLE KEYS */;
INSERT INTO `user_nutrition_plan` VALUES (8,18,2,'Body Type 2','Loose','','Active','Text 1','Text 2','Text 3','Text 4','Text 5','Text 5','Text 6',NULL);
/*!40000 ALTER TABLE `user_nutrition_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_strength_day`
--

DROP TABLE IF EXISTS `user_strength_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_strength_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_id` int(11) NOT NULL,
  `training_tips` text,
  PRIMARY KEY (`id`),
  KEY `fk_user_strength_week_id_idx` (`week_id`),
  CONSTRAINT `fk_user_strength_week_id` FOREIGN KEY (`week_id`) REFERENCES `user_strength_week` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_strength_day`
--

LOCK TABLES `user_strength_day` WRITE;
/*!40000 ALTER TABLE `user_strength_day` DISABLE KEYS */;
INSERT INTO `user_strength_day` VALUES (25,18,'');
/*!40000 ALTER TABLE `user_strength_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_strength_exercise`
--

DROP TABLE IF EXISTS `user_strength_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_strength_exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `exercise_name` varchar(150) DEFAULT NULL,
  `muscle_group` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `sets` varchar(45) DEFAULT NULL,
  `reps` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_strength_exercise_day_idx` (`day_id`),
  CONSTRAINT `fk_user_strength_exercise_day` FOREIGN KEY (`day_id`) REFERENCES `user_strength_day` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_strength_exercise`
--

LOCK TABLES `user_strength_exercise` WRITE;
/*!40000 ALTER TABLE `user_strength_exercise` DISABLE KEYS */;
INSERT INTO `user_strength_exercise` VALUES (36,25,1,'Biceps Curl','Shoulders','Barbell','','','',NULL),(37,25,1,'Biceps Curl','Shoulders','Barbell','50','12','10 kg',NULL),(38,25,1,'Biceps Curl','Shoulders','Barbell','987','987','321',NULL);
/*!40000 ALTER TABLE `user_strength_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_strength_plan`
--

DROP TABLE IF EXISTS `user_strength_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_strength_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `plan_name` varchar(150) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `description` text,
  `details` text,
  `recheck` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_strength_plan`
--

LOCK TABLES `user_strength_plan` WRITE;
/*!40000 ALTER TABLE `user_strength_plan` DISABLE KEYS */;
INSERT INTO `user_strength_plan` VALUES (12,18,10,'Shape Plan','Gain strength','Lorem','Ipsum','Dolor');
/*!40000 ALTER TABLE `user_strength_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_strength_week`
--

DROP TABLE IF EXISTS `user_strength_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_strength_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_strength_plan_id_idx` (`plan_id`),
  CONSTRAINT `fk_user_strength_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `user_strength_plan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_strength_week`
--

LOCK TABLES `user_strength_week` WRITE;
/*!40000 ALTER TABLE `user_strength_week` DISABLE KEYS */;
INSERT INTO `user_strength_week` VALUES (18,12);
/*!40000 ALTER TABLE `user_strength_week` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-22 21:10:00
