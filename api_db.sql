-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: us-cdbr-east-05.cleardb.net    Database: heroku_3786788db311ecb
-- ------------------------------------------------------
-- Server version	5.6.50-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `year` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (4,'Perth show','2002','dallas@mail.com'),(14,'Perth show','2002','dallas@mail.com'),(24,'Perth show','2002','dallas@mail.com'),(34,'Perth show','2002','dallas@mail.com'),(44,'Perth show','2002','dallas@mail.com'),(54,'new show','2005','dallas@mail.com'),(64,'new show','2005','dallas@mail.com'),(74,'new show','2005','dallas@mail.com'),(84,'new show','2005','dallas@mail.com'),(94,'new show','2005','dallas@mail.com'),(104,'new cat 2 show','1900','dallas@mail.com'),(114,'new award 200','1964','dallas@mail.com'),(124,'new award 200','1964','dallas@mail.com'),(134,'Brisbane Feline','1998','dallas@mail.com'),(144,'sydney','2000','dallas@mail.com');
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cats`
--

DROP TABLE IF EXISTS `cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `breed` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `age` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `photo_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `breeder` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  CONSTRAINT `cats_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cats`
--

LOCK TABLES `cats` WRITE;
/*!40000 ALTER TABLE `cats` DISABLE KEYS */;
INSERT INTO `cats` VALUES (4,'Kitty','Tabby','6','https://picsum.photos/200','John','dallas@mail.com','2022-05-01 00:00:00'),(14,'Tom','Tom Cat','3','https://picsum.photos/200','James','dallas@mail.com','2022-05-02 00:00:00'),(24,'cat cat','feline','5','https://picsum.photos/200','Dallas','dallas@mail.com','2022-05-25 00:00:00'),(34,'Steve','Tabby','2','https://picsum.photos/200','James','dallas@mail.com','2022-05-25 00:00:00'),(44,'Tabby','cat','3','https://picsum.photos/200','Mark','dallas@mail.com','2022-05-25 00:00:00'),(54,'Tabby','Cat','6','https://picsum.photos/200','James','dallas@mail.com','2022-05-25 09:07:36'),(64,'Simon','Tom','5','https://picsum.photos/200','Sam','dallas@mail.com','2022-05-25 23:21:36');
/*!40000 ALTER TABLE `cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrants`
--

DROP TABLE IF EXISTS `entrants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrants` (
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `showID` int(11) DEFAULT NULL,
  `catID` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `entrantID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`entrantID`),
  KEY `catID` (`catID`),
  KEY `showID` (`showID`),
  KEY `email` (`email`),
  CONSTRAINT `entrants_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `cats` (`id`),
  CONSTRAINT `entrants_ibfk_2` FOREIGN KEY (`showID`) REFERENCES `shows` (`id`),
  CONSTRAINT `entrants_ibfk_3` FOREIGN KEY (`email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrants`
--

LOCK TABLES `entrants` WRITE;
/*!40000 ALTER TABLE `entrants` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iplist`
--

DROP TABLE IF EXISTS `iplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iplist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) DEFAULT NULL,
  `access` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iplist`
--

LOCK TABLES `iplist` WRITE;
/*!40000 ALTER TABLE `iplist` DISABLE KEYS */;
INSERT INTO `iplist` VALUES (4,'::1','allow','dallas@mail.com','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `iplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IP` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `sessionID` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `userType` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `URL` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_email` (`email`),
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1194 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (4,'::1','044-0a4JdRDFIkf7XOeZz4vY7EPHlZU4',NULL,NULL,'2022-06-06 00:24:42','POST','/api/awards/create'),(14,'::1','1GfZcWDj5OLlJHB2TBksd2Aw_QN78vd2',NULL,NULL,'2022-06-06 02:34:18','POST','/api/users/login'),(24,'::1','kuu6cShMM59CnySgJk72iS4UNTiMmfre',NULL,NULL,'2022-06-06 02:34:18','POST','/api/users/login'),(34,'::1','6ATodjk6y5Z7-glWFmk2txJivg_4y6L6',NULL,NULL,'2022-06-06 02:34:34','GET','/api/users'),(44,'::1','XgP4soAkg4SyvJP80B_ZIm0vSvD4qxr-',NULL,NULL,'2022-06-06 02:34:35','GET','/api/users'),(54,'::1','8hhN0VM_mLogvNlnEX5XZkGiw5zUscbm',NULL,NULL,'2022-06-06 02:34:56','GET','/api/users'),(64,'::1','6KGPtHK6HlP2EhI92jimYH6szpa2rZUk',NULL,NULL,'2022-06-06 02:34:57','GET','/api/users'),(74,'::1','z7Jyt9x3K9u287LBVHWY3nfejAoy-Ua9',NULL,NULL,'2022-06-06 02:35:00','GET','/api/users'),(84,'::1','ruTWFs_bP55x0ObfOA6ekhcBp4cd_gWe',NULL,NULL,'2022-06-06 02:35:01','GET','/api/users'),(94,'::1','zy9rRXTp2vz31poPt1Huow45AhT5vopp',NULL,NULL,'2022-06-06 02:35:08','GET','/api/users'),(104,'::1','kISr06f65H3i4c2qAAdlL2h8nss9HV2Y',NULL,NULL,'2022-06-06 02:35:08','GET','/api/users'),(114,'::1','5Whx9B3stVMFxwaMFYKOXK-vhBlbrFoX',NULL,NULL,'2022-06-06 02:59:22','GET','/api/users'),(124,'::1','4e8NmD0QcUJoFNHuul-d8UiildhZ2-DC',NULL,NULL,'2022-06-06 02:59:22','GET','/api/users'),(134,'::1','fL-ANiehEEpP-VhgPVrS7ILcniAey_Zk',NULL,NULL,'2022-06-06 03:05:09','GET','/api/users'),(144,'::1','4Pvy0Y44VUwqVpt0c7HKSE_oHouB8few',NULL,NULL,'2022-06-06 03:05:27','GET','/api/users'),(154,'::1','jUuG1tZqKipUoLFQhg-Gk3y0uGOyf6Tj',NULL,NULL,'2022-06-06 03:05:31','GET','/api/users'),(164,'::1','dyqZHi01CKFXPvqU-woD6WuryNhvI4nJ',NULL,NULL,'2022-06-06 03:05:32','GET','/api/users'),(174,'::1','P1dCVus2M2Fb7tmvWZD589KsdeFaaZ56',NULL,NULL,'2022-06-06 03:06:26','GET','/api/users'),(184,'::1','JSNq9JTXySUz-3MwdHqBcQ2YPie5hCv-',NULL,NULL,'2022-06-06 03:06:30','GET','/api/users'),(194,'::1','FXGVwKLnaewtVboF3uWwS_Jlm2OeeeS_',NULL,NULL,'2022-06-06 03:06:31','GET','/api/users'),(204,'::1','MSc5_NjTgMruwOJHvspP82uVP6I-Mur5',NULL,NULL,'2022-06-06 03:06:45','GET','/api/users'),(214,'::1','pRvpO8QDiq41Ki1DLvACXIMvbUJi3KbI',NULL,NULL,'2022-06-06 03:06:49','GET','/api/users'),(224,'::1','GUSGnt1-qNfppjqi5yD4MmcZ948sQ-jN',NULL,NULL,'2022-06-06 03:06:50','GET','/api/users'),(234,'::1','MnXIISmc-qjmUWe6w7TRqzbSKfwCQH0g',NULL,NULL,'2022-06-06 03:07:03','GET','/api/users'),(244,'::1','_ogt_wnpJBEeV6ai0mupP1H7lNZaBh1J',NULL,NULL,'2022-06-06 03:07:05','GET','/api/users'),(254,'::1','Q6Xum6zSVTqErAdQ-V14iOfRLM9rW5IG',NULL,NULL,'2022-06-06 03:07:06','GET','/api/users'),(264,'::1','dE3ZiTTNH9l2tpNGnxpHSrVXvzlDz8WD',NULL,NULL,'2022-06-06 03:07:50','GET','/api/users'),(274,'::1','33kN5n4eyyZf6hW1SaIC7tvgnddedIPZ',NULL,NULL,'2022-06-06 03:10:26','GET','/api/users'),(284,'::1','CPZnDVG5ZQRB8wZKsss0s8jv09QKAsSk',NULL,NULL,'2022-06-06 03:10:37','GET','/api/users'),(294,'::1','tC1AI8pwt_xtT8xfaAy0q0e0vsrLq9Zq',NULL,NULL,'2022-06-06 03:10:38','GET','/api/users'),(304,'::1','qJzOQcW17BYBsjjefSTXdU88oTQZw4kM',NULL,NULL,'2022-06-06 03:11:00','GET','/api/users'),(314,'::1','vHY7l79he5OhRourkkPqXWD2QDgACix1',NULL,NULL,'2022-06-06 03:11:01','GET','/api/users'),(324,'::1','906LZBEpmuR_x314bPTUqCmlgUQ0CikH',NULL,NULL,'2022-06-06 03:13:17','GET','/api/users'),(334,'::1','Xn1neLu3f3nInhX36u1Tyfggrte_4Z5M',NULL,NULL,'2022-06-06 03:13:20','GET','/api/users'),(344,'::1','DAI60ZlUA1Be2qLJ4CZ4rKKoAbsAQYh0',NULL,NULL,'2022-06-06 03:13:21','GET','/api/users'),(354,'::1','XUmWJn8EokY-qVh_Ys5mj6F5Vv7PaWWr',NULL,NULL,'2022-06-06 03:13:25','GET','/api/users'),(364,'::1','meaTt68hiju7Y1tr0sw4R2C8hvvwcIU1',NULL,NULL,'2022-06-06 03:13:26','GET','/api/users'),(374,'::1','jcyPQ8Sg8UKEHlwSKjsgfZE9A6bydlwM',NULL,NULL,'2022-06-06 03:17:08','GET','/api/users'),(384,'::1','dr4hxIYulQ_CiSDj2A-cBOUDtTXyvaCF',NULL,NULL,'2022-06-06 03:17:13','GET','/api/users'),(394,'::1','SzUVIGWHTQRyTx1ZvJ2EdYyIdXSXeLvl',NULL,NULL,'2022-06-06 03:17:13','GET','/api/users'),(404,'::1','zeRDvlR8ju33wnYtD8ycPQmLCdN-QmJV',NULL,NULL,'2022-06-06 03:17:19','GET','/api/users'),(414,'::1','6GW_mDs0Euqct8BakXDzdbOesEg4Z24S',NULL,NULL,'2022-06-06 03:17:20','GET','/api/users'),(424,'::1','QI8BpqazqQ6mp0O_CarFx5Upiw_Cjcnm',NULL,NULL,'2022-06-06 03:17:45','GET','/api/users'),(434,'::1','IaEvRVx0YEiGjPFSLE7sDtyQzpvJDRZB',NULL,NULL,'2022-06-06 03:17:50','GET','/api/users'),(444,'::1','svaU23tdEpsFzdFTzFLU5BDcVDTA3BbK',NULL,NULL,'2022-06-06 03:17:50','GET','/api/users'),(454,'::1','cbvbAcMTEEae_zMHB4_-QsNRjaIfcyJT',NULL,NULL,'2022-06-06 03:17:53','GET','/api/users'),(464,'::1','ErN6DV2_mSxsCzzuETOHYQ1wiqh54yI0',NULL,NULL,'2022-06-06 03:17:54','GET','/api/users'),(474,'::1','s2T8jkrptDciXxqgFZ_WuaudQL21uYC7',NULL,NULL,'2022-06-06 03:17:56','GET','/api/users'),(484,'::1','_f-S3ZvRBP5grBedgooDMt1vANQ-TS6p',NULL,NULL,'2022-06-06 03:17:56','GET','/api/users'),(494,'::1','q8cCxJU_oAaQldabfzTc9bGuWYqo_vp3',NULL,NULL,'2022-06-06 03:18:35','GET','/api/users'),(504,'::1','ZGq7N0qeHxSkNiI4hlhguJ_22Mzl37UI',NULL,NULL,'2022-06-06 03:18:40','GET','/api/users'),(514,'::1','Ox7WoDkaU1cP7jcUjrw6f2i9mTBynoJ6',NULL,NULL,'2022-06-06 03:18:40','GET','/api/users'),(524,'::1','Ip2sfKYZmz5GOkEGcli5M5wJF8NdAXF6',NULL,NULL,'2022-06-06 03:18:44','GET','/api/users'),(534,'::1','E1-3RqAe6FisZADccGPagUxVF7WycR_F',NULL,NULL,'2022-06-06 03:18:44','GET','/api/users'),(544,'::1','5DViyL4oePVj2akhhxlXBuL5gg3PUAoU',NULL,NULL,'2022-06-06 03:18:46','GET','/api/users'),(554,'::1','c-sktoonTHc99XABSCBuzq4RKuwozstj',NULL,NULL,'2022-06-06 03:18:47','GET','/api/users'),(564,'::1','hXHPO0BECuDKRPXYAq9yzTGLcp_RbDtC',NULL,NULL,'2022-06-06 03:19:12','GET','/api/users'),(574,'::1','zOG4GBlDeU6mV6B1hK6o9ow61PfGdWHY',NULL,NULL,'2022-06-06 03:19:55','GET','/api/users'),(584,'::1','SB42NhtaCOIjDVSHRgPg76BJGDLQWdas',NULL,NULL,'2022-06-06 03:19:58','GET','/api/users'),(594,'::1','28g_V1LRBQZkqhXXuwiIRIE8iYEOktTt',NULL,NULL,'2022-06-06 03:20:06','GET','/api/users'),(604,'::1','D9o8e51-TdKqC21vbrW8LUkuq7faHT03',NULL,NULL,'2022-06-06 03:20:07','GET','/api/users'),(614,'::1','LVy16a7LO4CTcPTgR8DEOwcoUoVczf7n',NULL,NULL,'2022-06-06 03:20:44','GET','/api/users'),(624,'::1','10W0QOKV_5pfpvxbLOlGQC9gDzvE-Zr9',NULL,NULL,'2022-06-06 03:23:01','GET','/api/users'),(634,'::1','ypSIrPFIJAniMbjotymJGQNycLJei_Mb',NULL,NULL,'2022-06-06 03:23:07','GET','/api/users'),(644,'::1','k53swNbxnBFyfj4eD6boDkYI_0bRnocQ',NULL,NULL,'2022-06-06 03:23:08','GET','/api/users'),(654,'::1','_4rrsqVLjPeNO6l9SP6m75vt3-7J_lb4',NULL,NULL,'2022-06-06 03:23:28','GET','/api/users'),(664,'::1','xh5N6Le1s_J8eL1vjLJz_6otcH5VhmuD',NULL,NULL,'2022-06-06 03:23:29','GET','/api/users'),(674,'::1','zbt_Gfif3RurZtNTDbEoSlQHVf4J_8Pc',NULL,NULL,'2022-06-06 03:24:08','GET','/api/users'),(684,'::1','CEfVDx08HW52MRMFkb3NDWxeI4Q0mv-D',NULL,NULL,'2022-06-06 03:24:12','GET','/api/users'),(694,'::1','xKCTEdG6OuDsCtZBWoNaCaYs27iRdH--',NULL,NULL,'2022-06-06 03:24:12','GET','/api/users'),(704,'::1','-aIW61qaoohnhs5dVD25uAKxSf0Ne3gd',NULL,NULL,'2022-06-06 03:24:46','GET','/api/users'),(714,'::1','uHCUZms5YRsykDfe3zlXgRm997JgjIjp',NULL,NULL,'2022-06-06 03:24:54','GET','/api/users'),(724,'::1','M5bNchI8L3nf81ciMayzDA2SGDc1LL9-',NULL,NULL,'2022-06-06 03:24:54','GET','/api/users'),(734,'::1','iWbmsy3T0H2L7sqQjvqw7e_efwC3n9sF',NULL,NULL,'2022-06-06 03:25:11','GET','/api/users'),(744,'::1','ZvkCBKhCzEulFkGf4l0izwf7HVZqhbK9',NULL,NULL,'2022-06-06 03:25:13','GET','/api/users'),(754,'::1','cfGs7B9KHNPtg6zf-5Q0LMMpUe98mRo_',NULL,NULL,'2022-06-06 03:25:14','GET','/api/users'),(764,'::1','A9nIQsok3g6_PgIsV88icd02PNHhg_BE',NULL,NULL,'2022-06-06 03:25:34','GET','/api/users'),(774,'::1','PYq_ohmCIUMpbiW4ni5XzPCg2hSUqxdG',NULL,NULL,'2022-06-06 03:25:42','GET','/api/users'),(784,'::1','IHlH1hM9eR_g9lGtpINuqmb3QRqS78u7',NULL,NULL,'2022-06-06 03:25:42','GET','/api/users'),(794,'::1','mfoV49jg8FjdYVYzfeDATlLqV0V5qX_2',NULL,NULL,'2022-06-06 03:26:20','GET','/api/users'),(804,'::1','lfeLwCMcijUKQrZh0754lcUqqWoPa_FM',NULL,NULL,'2022-06-06 03:26:38','GET','/api/users'),(814,'::1','Iksk2uwvNE1PYmib91MVfYk5jIpAExHB',NULL,NULL,'2022-06-06 03:28:07','GET','/api/users'),(824,'::1','aEz8kqS0NiaAx3uEjJN9u4XNa63RLZwa',NULL,NULL,'2022-06-06 03:28:26','GET','/api/users'),(834,'::1','-TfOznGueTx3r66qA2eCrImTuOHKiOCq',NULL,NULL,'2022-06-06 03:29:42','GET','/api/users'),(844,'::1','dMqk679l1lNucSWO8DHBTy1ikuGpRSmx',NULL,NULL,'2022-06-06 03:31:27','GET','/api/users'),(854,'::1','aKxgI9lDCMoT4d0ZG-93haVX8IiO114O',NULL,NULL,'2022-06-06 03:33:46','GET','/api/users'),(864,'::1','9VxXaUfA7bYCNgeql2l2nUviLW8LZjHv',NULL,NULL,'2022-06-06 03:33:46','GET','/api/users'),(874,'::1','3sI3LdL4ZwomHH60iYMiNm-cU5MagJID',NULL,NULL,'2022-06-06 03:34:12','GET','/api/users'),(884,'::1','NxzQUNWcOjOrpTmp_BbPkQ5QPaJGG7jA',NULL,NULL,'2022-06-06 03:49:30','GET','/api/users'),(894,'::1','mFgvgHJkk-Q1OSQ7JH4c3ozeA2DITXS4',NULL,NULL,'2022-06-06 03:49:30','GET','/api/users'),(904,'::1','7AMpZj8ypP70oFJkvU_45TBuGpOu0lHC',NULL,NULL,'2022-06-06 03:49:34','GET','/api/users'),(914,'::1','NPRthtgQPfVzUjKfKBPTEekgba6-UAGw',NULL,NULL,'2022-06-06 03:49:35','GET','/api/users'),(924,'::1','YYYXRnO1AGnbZQun6UmxaxLgubFhcdh3',NULL,NULL,'2022-06-06 03:50:14','GET','/api/users'),(934,'::1','4Hj1fpGD_KPcXvlrIcQ1HHHIW5WSsKK5',NULL,NULL,'2022-06-06 03:50:32','GET','/api/users'),(944,'::1','-_uFuyAjlpbx5fWMUxWlM5KWLhyv8r5h',NULL,NULL,'2022-06-06 03:50:40','GET','/api/users'),(954,'::1','gaYfZUW7RPcwrtKLjjx3QOZYoBElDUQT',NULL,NULL,'2022-06-06 03:50:40','GET','/api/users'),(964,'::1','jrhkWsAFbiBWVnLxL6lt-qYmrkVi7VXz',NULL,NULL,'2022-06-06 03:51:03','GET','/api/users'),(974,'::1','gPuHab3G0oGY9CZ-SkdYDeGsL6VWsvhq',NULL,NULL,'2022-06-06 03:51:23','GET','/api/users'),(984,'::1','_ScvdB0l1zyY0rgMJzgPcIygqZrTmMkj',NULL,NULL,'2022-06-06 03:52:39','GET','/api/users'),(994,'::1','8tlk2L-afwLyNzaxZ5gFFLA2pz-B8cvv',NULL,NULL,'2022-06-06 03:55:19','GET','/api/users'),(1004,'::1','9TpCOu9FwLZKSEniRPvKyF2jDM-jcOdV',NULL,NULL,'2022-06-06 04:08:10','GET','/api/users'),(1014,'::1','NJcAJDY5qEA2v_dDl2CAFyW4NbH20Zle',NULL,NULL,'2022-06-06 04:10:20','GET','/api/users'),(1024,'::1','sGq4L9DkG3130XX7vOg6r85_MoM1uKXx',NULL,NULL,'2022-06-06 04:13:02','GET','/api/users'),(1034,'::1','m4VyqASSFAm-m50oXGZWbvB6Ztsd9-mu',NULL,NULL,'2022-06-06 04:13:02','GET','/api/users'),(1044,'::1','PsTgz4ueSvpqxgs2ikFl0D39JwSV5FXs',NULL,NULL,'2022-06-06 04:13:56','GET','/api/users'),(1054,'::1','nnwV1U4kS1b7YPzBlpF4YWxAAkUgWhlx',NULL,NULL,'2022-06-06 04:14:08','GET','/api/users'),(1064,'::1','W3p-ZF4GG9WO4ZdY4ehPjkx_7f7PA5ng',NULL,NULL,'2022-06-06 04:14:27','GET','/api/users'),(1074,'::1','kYP8qTPCehQQBTjr_gfUvYAzGewRLt4w',NULL,NULL,'2022-06-06 04:15:10','GET','/api/users'),(1084,'::1','WHLlknpZfq5A-AaAFysfBtnsF1tn-GEZ',NULL,NULL,'2022-06-06 04:15:10','GET','/api/users'),(1094,'::1','HW5iVnnha-vZSLQNH7POm0BwANG-OtiH',NULL,NULL,'2022-06-08 10:39:04','GET','/api/users'),(1104,'::1','4UOiIfdaGorJQcUxHPYb9mln45Udi-4c',NULL,NULL,'2022-06-08 10:39:04','GET','/api/users'),(1114,'::1','S7IqUpH540JegCKzCqe8EonXGDsOpPyv',NULL,NULL,'2022-06-08 10:43:06','GET','/api/users'),(1124,'::1','-RhW1sy-B7-E9J6Ad1KNIlf0wn1cJFrG',NULL,NULL,'2022-06-08 10:43:07','GET','/api/users'),(1134,'::1','tdMvxYvWVbs9AMQmhmRpZl1rYhJuUX8o',NULL,NULL,'2022-06-08 10:43:54','GET','/api/users'),(1144,'::1','S9GIbrzTBTe9kYN1UW6Y1vKARIW9oEGu',NULL,NULL,'2022-06-08 10:43:55','GET','/api/users'),(1154,'::1','wTbeeXeL9uvymCxLtX3klGSBWyqWKtmH',NULL,NULL,'2022-06-08 11:12:05','GET','/api/catsEmail/dallas@mail.com'),(1164,'::1','T3H-7w2rn_RScz2K1goSSslAK_tOU9sW',NULL,NULL,'2022-06-08 11:12:05','GET','/api/users/dallas@mail.com'),(1174,'::1','cAME5oh8o-89ydB5tNw5EHsmzGuslxKm',NULL,NULL,'2022-06-08 11:12:06','GET','/api/users/dallas@mail.com'),(1184,'::1','Ue00IIqf5qO4T3Y1LkLUi2-fxJ5Kn4K9',NULL,NULL,'2022-06-08 11:12:05','GET','/api/catsEmail/dallas@mail.com');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `judges` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `date` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `council` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `ticket_price` int(11) DEFAULT NULL,
  `ticket_count` int(11) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (4,'Brisbane Cat Show','Brisbane','https://picsum.photos/200','Bruce','2022-04-26','Brisbane Cat Council',35,50,'2022-04-26 00:00:00'),(14,'Sydney Cat Show','Sydney','https://picsum.photos/200','Bruce','2022-04-26','Sydney Cat Council',35,50,'2022-04-26 00:00:00'),(24,'Melbourne Cat Show','Melbourne','https://picsum.photos/200','Bruce','2022-04-29','Victoria Cat Council',40,50,'2022-04-26 00:00:00'),(34,'Perth Show','Perth','https://picsum.photos/200','Bruce','2022-04-25','Perth Cat Council',40,50,'2022-05-02 00:00:00');
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `userType` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'user',
  `image` varchar(45) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('dallas@mail.com','$2b$06$2V4NTZnI3dULo3WIhIH9u.6feDIkPMzwXFTbAWsY5cNB4mTjOLJFO','dallas','4646546545465','admin','https://picsum.photos/200','2022-03-24 00:00:00','1'),('newuser@mail.com','$2b$06$P5ZrWr/v8QGyhYa42JvAU.zs3QEeV33N5geLmo/MTlJklphGeFSDC','Jim','0422222222','user','https://picsum.photos/200','2022-05-25 02:56:28','2');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 14:07:23
