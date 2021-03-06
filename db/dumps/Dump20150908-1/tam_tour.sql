-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tam
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coordinator` varchar(45) NOT NULL,
  `route` varchar(45) NOT NULL,
  `dep_date` date NOT NULL,
  `ret_date` date NOT NULL,
  `transportation_type_code` varchar(2) DEFAULT NULL,
  `transportation_fare` double DEFAULT NULL,
  `hotel_fare` double DEFAULT NULL,
  `catering_on_vehicle` varchar(200) DEFAULT NULL,
  `catering_on_vehicle_fare` double DEFAULT NULL,
  `policy_no` int(11) DEFAULT NULL,
  `policy_amount` double DEFAULT NULL,
  `selling_amount` double NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `note` varchar(600) DEFAULT NULL,
  `guide_id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `museum_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `record_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `INX_TOUR_TRANPORTATION_TYPE_TT_CODE` (`transportation_type_code`),
  KEY `INX_TOUR_GUIDE_GUIDE_ID` (`guide_id`),
  KEY `INX_TOUR_HOTEL_HOTEL_ID` (`hotel_id`),
  KEY `INX_TOUR_MUSEUM_MUSEUM_ID` (`museum_id`),
  KEY `INX_TOUR_USER_USER_ID` (`user_id`),
  CONSTRAINT `FK_TOUR_GUIDE_GUIDE_ID` FOREIGN KEY (`guide_id`) REFERENCES `guide` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_HOTEL_HOTEL_ID` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_MUSEUM_MUSEUM_ID` FOREIGN KEY (`museum_id`) REFERENCES `museum` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_TRANPORTATION_TYPE_TT_CODE` FOREIGN KEY (`transportation_type_code`) REFERENCES `tour_tranportation_type` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-08 14:21:22
