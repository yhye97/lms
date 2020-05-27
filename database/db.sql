-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: lms
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `cache_info`
--

DROP TABLE IF EXISTS `cache_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_info` (
  `grid_id` int(11) NOT NULL,
  `cache_size` double NOT NULL,
  `cache_left` double NOT NULL,
  PRIMARY KEY (`grid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_info`
--

LOCK TABLES `cache_info` WRITE;
/*!40000 ALTER TABLE `cache_info` DISABLE KEYS */;
INSERT INTO `cache_info` VALUES (1,137,137),(2,600,582),(3,3.1,867);
/*!40000 ALTER TABLE `cache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_location`
--

DROP TABLE IF EXISTS `cache_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_location` (
  `cache_id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_id` int(11) NOT NULL,
  `contents_id` int(11) NOT NULL,
  `s3_key` varchar(400) NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_location`
--

LOCK TABLES `cache_location` WRITE;
/*!40000 ALTER TABLE `cache_location` DISABLE KEYS */;
INSERT INTO `cache_location` VALUES (1,1,0,'\"\"');
/*!40000 ALTER TABLE `cache_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents` (
  `contents_id` int(11) NOT NULL AUTO_INCREMENT,
  `contents_name` varchar(45) NOT NULL,
  `contents_description` varchar(400) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  PRIMARY KEY (`contents_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,'elementary content','video for elementary students',1,3),(2,'korean','video for korean language',1,3),(3,'math','video for mathematics',1,3);
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ele`
--

DROP TABLE IF EXISTS `ele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ele` (
  `school_id` int(11) NOT NULL,
  `1st_stu_num` int(11) NOT NULL,
  `2nd_stu_num` int(11) NOT NULL,
  `3rd_stu_num` int(11) NOT NULL,
  `4th_stu_num` int(11) NOT NULL,
  `5th_stu_num` int(11) NOT NULL,
  `6th_stu_num` int(11) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ele`
--

LOCK TABLES `ele` WRITE;
/*!40000 ALTER TABLE `ele` DISABLE KEYS */;
INSERT INTO `ele` VALUES (1,121,100,111,105,99,143);
/*!40000 ALTER TABLE `ele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grid`
--

DROP TABLE IF EXISTS `grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grid` (
  `grid_id` int(11) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  PRIMARY KEY (`grid_id`),
  UNIQUE KEY `grid_id_UNIQUE` (`grid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grid`
--

LOCK TABLES `grid` WRITE;
/*!40000 ALTER TABLE `grid` DISABLE KEYS */;
INSERT INTO `grid` VALUES (1,9.18594536053351,45.47304470082458),(2,9.193139700323409,45.46987577194055),(3,9.195377006955539,45.46770952221271);
/*!40000 ALTER TABLE `grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `high`
--

DROP TABLE IF EXISTS `high`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `high` (
  `school_id` int(11) NOT NULL,
  `1st_stu_num` int(11) NOT NULL,
  `2nd_stu_num` int(11) NOT NULL,
  `3rd_stu_num` int(11) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `high`
--

LOCK TABLES `high` WRITE;
/*!40000 ALTER TABLE `high` DISABLE KEYS */;
/*!40000 ALTER TABLE `high` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `middle`
--

DROP TABLE IF EXISTS `middle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `middle` (
  `school_id` int(11) NOT NULL,
  `1st_stu_num` int(11) NOT NULL,
  `2nd_stu_num` int(11) NOT NULL,
  `3rd_stu_num` int(11) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `middle`
--

LOCK TABLES `middle` WRITE;
/*!40000 ALTER TABLE `middle` DISABLE KEYS */;
/*!40000 ALTER TABLE `middle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_info`
--

DROP TABLE IF EXISTS `school_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_info` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(100) NOT NULL,
  `school_type` int(11) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_info`
--

LOCK TABLES `school_info` WRITE;
/*!40000 ALTER TABLE `school_info` DISABLE KEYS */;
INSERT INTO `school_info` VALUES (1,'Kyunghee Elementary',1);
/*!40000 ALTER TABLE `school_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(100) NOT NULL,
  `user_pw` varchar(400) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `school_id` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','2','fds',1,2),('u','pw','Hazel',1,3),('u1','2d6aa48bb2c481c28357ffdb48166424','Hazel',1,3);
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

-- Dump completed on 2020-05-27 11:05:28
