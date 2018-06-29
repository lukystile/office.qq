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
INSERT INTO `auth_assignment` VALUES ('admin','1',1498575495),('user','10',1499959031),('user','11',1499961733),('user','12',1499961949),('user','13',1499962055),('user','14',1499962329),('user','15',1499964408),('user','16',1499964454),('user','17',1499965573),('user','18',1500049145),('user','5',1499444586),('user','6',1499612891),('user','7',1499612891),('user','8',1499958868),('user','9',1499958956);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biometrics_log`
--

LOCK TABLES `biometrics_log` WRITE;
/*!40000 ALTER TABLE `biometrics_log` DISABLE KEYS */;
INSERT INTO `biometrics_log` VALUES (1,18,'1499817600','80 kg','8%','60 kg','120 mm HG','80 mm HG','105 bpm'),(2,18,'1502323200','75 kg','5%','60 kg','120 mm HG','80 mm HG','95 bpm');
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
  CONSTRAINT `fk_week_id` FOREIGN KEY (`week_id`) REFERENCES `cardio_week` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardio_log`
--

LOCK TABLES `cardio_log` WRITE;
/*!40000 ALTER TABLE `cardio_log` DISABLE KEYS */;
INSERT INTO `cardio_log` VALUES (5,18,'1500508800','7.2 km/h','0.5 km/h','200 m','1°','184 bpm','16.2 km/h','100 ml/kg','5 000 m','177 bpm','14.6 km/h','100 ml/kg','145  bpm','8.0 km/h','medium','tired_legs'),(6,18,'1500608800','8.4 km/h','1.5 km/h','400 m','2°','174 bpm','18.6 km/h','110 ml/kg','6 000 m','167 bpm','17.6 km/h','100 ml/kg','147  bpm','9.0 km/h','medium','tired_legs');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardio_section`
--

LOCK TABLES `cardio_section` WRITE;
/*!40000 ALTER TABLE `cardio_section` DISABLE KEYS */;
INSERT INTO `cardio_section` VALUES (1,'Cardio Section','Lorem ipsum dolor sit amet'),(2,'Prepare cardio section','Prepare for cardio plan text.');
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
  CONSTRAINT `fk_week_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `cardio_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
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
INSERT INTO `exercise` VALUES (1,'Biceps Curl','Shoulders','Barbell','https://www.youtube.com/watch?v=ykJmrZ5v0Oo','Lorem ipsum',NULL),(2,'Push-up or Knee push-up','Chest','Bodyweight','https://www.youtube.com/watch?v=ykJmrZ5v0Oo','Text',NULL),(3,'Exercise 3','Chest','Bodyweight','https://www.youtube.com/watch?v=ykJmrZ5v0Oo','Lorm ipsum dolor sit amet','a:1:{i:0;s:1:\"1\";}'),(4,'Exercise 4','Shoulders','Bodyweight','','',NULL);
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
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
INSERT INTO `migration` VALUES ('m000000_000000_base',1498213475),('m130524_201442_init',1498213476),('m140506_102106_rbac_init',1498574739);
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
  `plan_name` varchar(45) NOT NULL,
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
INSERT INTO `nutrition_plan` VALUES (2,'Body Type 2','Text 1','Text 2','Text 3','Text 4','Text 5','Text 5','Text 6'),(3,'Body Type 3','Text 1','Text 2','Text 3','Text 4','Text 5','Text 5','Text 6'),(4,'Body Type 4','text','','','','','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrition_section`
--

LOCK TABLES `nutrition_section` WRITE;
/*!40000 ALTER TABLE `nutrition_section` DISABLE KEYS */;
INSERT INTO `nutrition_section` VALUES (3,'Benefits','Lorem ipsum dolor sit amet.'),(4,'Start Your Program','Start Your Program text');
/*!40000 ALTER TABLE `nutrition_section` ENABLE KEYS */;
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
INSERT INTO `strength_day` VALUES (1,3,'Week 1 \r\nDay 1\r\nTraning tips'),(2,3,'Week 1\r\nDay 2\r\ntraining tips'),(3,4,'Week 2\r\nDay 1\r\nTrining tips'),(4,5,'Tip Day 1 \r\nWeek 1'),(5,5,'Day 2 Week 1\r\nTips'),(6,6,'Day1 Week 2\r\nTRAINING  Tips\r\nLorem ipsum dolor sit amet'),(7,7,'Lorem'),(11,6,''),(13,12,''),(14,13,''),(15,14,''),(16,15,'Ttaertykjhgcf'),(17,16,'');
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
  `muscle_group` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `sets` varchar(45) DEFAULT NULL,
  `reps` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_strength_exercise_day_idx` (`day_id`),
  CONSTRAINT `fk_strength_exercise_day` FOREIGN KEY (`day_id`) REFERENCES `strength_day` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strength_exercise`
--

LOCK TABLES `strength_exercise` WRITE;
/*!40000 ALTER TABLE `strength_exercise` DISABLE KEYS */;
INSERT INTO `strength_exercise` VALUES (4,5,1,'Shoulders','Barbell','123','432','12kg'),(5,5,1,'Shoulders','Barbell','123','432','12kg'),(7,4,3,'Chest','Bodyweight','44','22','123kg'),(9,4,4,'Shoulders','Bodyweight','11','22','33kg'),(11,4,2,'Chest','Bodyweight','456','9876','456'),(12,4,1,'Shoulders','Barbell','qwerty','qwerty','qwerty'),(13,6,4,'Shoulders','Bodyweight','45','43','12kg'),(14,11,4,'Shoulders','Bodyweight','99','10','40kg'),(16,16,3,'Chest','Bodyweight','30','20','33kg'),(17,17,1,'Shoulders','Barbell','','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
INSERT INTO `strength_plan` VALUES (5,'Level','Shape muscles','Plan Desc','Details','Recheck'),(6,'Strength Training','Gain strength','PLAN DESCRIPTION','DETAILS','RECHEK'),(7,'Level','Muscles endurance','PLAN DESCRIPTION','DETAILS','RECHEK'),(10,'Shape Plan','Gain strength','Lorem','Ipsum','Dolor'),(11,'Plan for Shape cat','Gain strength','','',''),(12,'Shape Muscles plan','Shape muscles','awet','sgfs','wsfet'),(13,'Level','Tone muscles','','','');
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
INSERT INTO `strength_week` VALUES (3,5),(4,5),(5,6),(6,6),(7,7),(12,10),(13,11),(14,12),(15,12),(16,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lenlay','admin@whr.com','Super','Admin',NULL,'qp8CtS6UyG9IybBEQWvpWYOdJ6A05zVi','$2y$13$AAgGUIPB5OcTfgl1NtUz.u0HRUDyhwP4sDH/AMD47cPxrgKXzpExa',NULL,10,1498215977,1498215977,NULL),(5,'demo','demo@webbee.pro','Adeline','Hawkins','Coffee Truck','GFroufe8GHiAmgsBY7BFUPsm1-37P5pA','$2y$13$1BPqLmAbo/AtghZrg5FOQujlMENXVK3APprqb6AfbGJMrA4.BbO66',NULL,10,1499444586,1499680669,1499680669),(6,'demo2','demo2@webbee.pro','Russell','Ortega','Apple','AQE2f6kcf_kGe97fSlrlAJInvlCU9XiW','$2y$13$Abl/TuakPKmkFrJRQ8Ll/e0Zg6sSKefwSFG/zccSOPlwJvVignaja',NULL,10,1499612891,1499612891,1488599605),(7,'demo3','demo3@webbee.pro','Brandon','Lee','Samsung','AQE2f6kcf_kGe97fSlrlAJInvlCU9XiW','$2y$13$Abl/TuakPKmkFrJRQ8Ll/e0Zg6sSKefwSFG/zccSOPlwJvVignaja',NULL,10,1499612891,1499612891,1478599605),(12,'john@doe.com','john@doe.com','John','Doe',NULL,'CpYBA-oiHktUJZFNWVrrOZxNaUJH63Sf','$2y$13$XCZ7yz8KYUkfTmGBBF4ag.Iqh/gUJbKym1PfkAStOM3sQz9EiSQPi',NULL,10,1499961949,1499961949,NULL),(13,'qwe@weee.eee','qwe@weee.eee','Test','User',NULL,'uPzo6UM5Hyr0xuYBDljSI614BkOyD315','$2y$13$N3/qjbXIWyBQYxLTbxsixuDltOrNypjc/InGd79ZvSp.q4c1/Zc9y',NULL,10,1499962055,1499962055,NULL),(14,'ew@wert.re','ew@wert.re','qwrqre','wegwr',NULL,'pIJCu-1LpRFbwmOxshzqNdr2l5Nn4QPb','$2y$13$AGWFinNHWUYKyxgOfIKky.ZA4NpVf4gFb4qx26TRA0Raeph9hWrDy',NULL,10,1499962329,1499962329,NULL),(15,'ug@esgfwr.ewfe','ug@esgfwr.ewfe','12413t','uy',NULL,'E-TGEBS9FBdO1HaiXDOzPnMLivJUGPQm','$2y$13$uZypx6uM0NebR8oLvQ7CveWWFXjB2Uy25NprYj4ZX9tkgBRh5OxMC',NULL,10,1499964408,1499964408,NULL),(16,'qwe@sdg.cc','qwe@sdg.cc','qwer','tqwerty',NULL,'7i47RN4tI4g_meGCVoUvHeLY4UBai-Wp','$2y$13$8PRg0GRzBgxS1Muzf2US/uQhGkfxwNJLEh1SvkhXCZ.yzUWROUFaC',NULL,10,1499964454,1499964454,NULL),(17,'kuyk@uky.uf','kuyk@uky.uf','aeg','jkyugk','JHjdsejk','34t1iW7aS863mPU9jU6IiYZVKE6cO39n','$2y$13$d9/jnnp92p99tLvovKDL5.017EqR8H4zKQq3AAw7elYOqr0qnSzFO',NULL,10,1499965573,1499965573,NULL),(18,'last_test@user.com','last_test@user.com','LastNew','Test','Webbee.pro','BBN4i-Aglc-a6eHe9n6in3n-NHrbq5WK','$2y$13$HmwUnS6TssRTxT1Orv3ryuhPQ5N6WopvONBqMmRWbEsy1hdBuACzS',NULL,10,1500049145,1500157066,1500049412);
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
  CONSTRAINT `fk_user_week_id` FOREIGN KEY (`week_id`) REFERENCES `user_cardio_week` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cardio_day`
--

LOCK TABLES `user_cardio_day` WRITE;
/*!40000 ALTER TABLE `user_cardio_day` DISABLE KEYS */;
INSERT INTO `user_cardio_day` VALUES (11,12,'dynamic','90','1m','Tip1 \r\n\r\nWeek 1'),(12,13,'recovery','100','2m','Day 2 Tip1'),(13,13,'fat burner','120','5m','Day 2 Tip 2'),(14,13,'hiit','234','234','23tgadfbartjwrthhae\r\nh\r\nwrt\r\nhwr');
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
  `description` text,
  `details` text,
  `recheck` text,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_cardio_plan_idx` (`user_id`),
  KEY `fk_user_orig_plan_id_idx` (`plan_id`),
  CONSTRAINT `fk_user_id_cardio_plan` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_orig_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `cardio_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cardio_plan`
--

LOCK TABLES `user_cardio_plan` WRITE;
/*!40000 ALTER TABLE `user_cardio_plan` DISABLE KEYS */;
INSERT INTO `user_cardio_plan` VALUES (4,18,7,'LEVEL DESCRIPTION text','DETAILS text','RECHECK text');
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
  CONSTRAINT `fk_week_user_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `user_cardio_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cardio_week`
--

LOCK TABLES `user_cardio_week` WRITE;
/*!40000 ALTER TABLE `user_cardio_week` DISABLE KEYS */;
INSERT INTO `user_cardio_week` VALUES (12,4),(13,4);
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
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
INSERT INTO `user_meta` VALUES (1,5,'cardio_level','1'),(2,5,'strength_level','3'),(5,12,'phone','0987654321'),(6,12,'birthday','10.11.1990'),(7,12,'gender','male'),(8,13,'phone',''),(9,13,'birthday',''),(10,13,'gender',''),(11,14,'phone','345678654'),(12,14,'birthday',''),(13,14,'gender',''),(14,15,'phone','yg'),(15,15,'birthday','uy'),(16,15,'gender',''),(17,16,'phone','9763456'),(18,16,'birthday','10.11.1990'),(19,16,'gender','female'),(20,17,'phone','987654'),(21,17,'birthday','10.11.1990'),(22,17,'gender','male'),(23,18,'password','aIqjZBAZZ94C'),(24,18,'phone','098765432'),(25,18,'birthday','10.11.1990'),(26,18,'gender','male'),(27,18,'strength-coach','a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}'),(28,18,'strength-self-test','1'),(29,18,'cardio-coach','a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}'),(30,18,'cardio-self-test','5'),(31,18,'nutrition-coach','a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}'),(32,18,'nutrition-self-test-torso','2'),(33,18,'psihical-1','no'),(34,18,'psihical-2','no'),(35,18,'psihical-3','yes'),(36,18,'psihical-4','no'),(37,18,'psihical-5','no'),(38,18,'psihical-6','no'),(39,18,'psihical-7','no'),(40,18,'psihical-8','no'),(49,18,'nutrition-self-test-body','3');
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `fk_np_user_id_idx` (`user_id`),
  CONSTRAINT `fk_np_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_nutrition_plan`
--

LOCK TABLES `user_nutrition_plan` WRITE;
/*!40000 ALTER TABLE `user_nutrition_plan` DISABLE KEYS */;
INSERT INTO `user_nutrition_plan` VALUES (5,18,3,'Loose','2500 kcal','Active','Lorem ipsum \r\ndolor sit amet','Text 2','Text 3','Text 4','Text 5','Text 5','Text 6');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_strength_day`
--

LOCK TABLES `user_strength_day` WRITE;
/*!40000 ALTER TABLE `user_strength_day` DISABLE KEYS */;
INSERT INTO `user_strength_day` VALUES (19,14,'Tip Day 1 \r\nWeek 1'),(20,14,'Day 2 Week 1\r\nTips'),(21,15,'Day1 Week 2\r\nTRAINING  Tips\r\nLorem ipsum dolor sit amet'),(22,15,'');
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
  `muscle_group` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `sets` varchar(45) DEFAULT NULL,
  `reps` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_strength_exercise_day_idx` (`day_id`),
  CONSTRAINT `fk_user_strength_exercise_day` FOREIGN KEY (`day_id`) REFERENCES `user_strength_day` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_strength_exercise`
--

LOCK TABLES `user_strength_exercise` WRITE;
/*!40000 ALTER TABLE `user_strength_exercise` DISABLE KEYS */;
INSERT INTO `user_strength_exercise` VALUES (26,19,3,'Chest','Bodyweight','44','22','123kg'),(27,19,4,'Shoulders','Bodyweight','11','22','33kg'),(28,19,2,'Chest','Bodyweight','456','9876','456'),(29,19,1,'Shoulders','Barbell','qwerty','qwerty','qwerty'),(30,20,1,'Shoulders','Barbell','123','432','12kg'),(31,20,1,'Shoulders','Barbell','123','432','12kg'),(32,21,4,'Shoulders','Bodyweight','45','43','12kg'),(33,22,4,'Shoulders','Bodyweight','99','10','40kg');
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
  `category` varchar(45) DEFAULT NULL,
  `description` text,
  `details` text,
  `recheck` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_strength_plan`
--

LOCK TABLES `user_strength_plan` WRITE;
/*!40000 ALTER TABLE `user_strength_plan` DISABLE KEYS */;
INSERT INTO `user_strength_plan` VALUES (10,18,6,'Gain strength','PLAN DESCRIPTION','DETAILS','RECHEK');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_strength_week`
--

LOCK TABLES `user_strength_week` WRITE;
/*!40000 ALTER TABLE `user_strength_week` DISABLE KEYS */;
INSERT INTO `user_strength_week` VALUES (14,10),(15,10);
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

-- Dump completed on 2017-08-14  1:30:54
