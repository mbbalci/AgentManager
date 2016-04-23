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
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `tkt_no` varchar(13) NOT NULL,
  `status` varchar(2) NOT NULL,
  `dos` datetime NOT NULL,
  `dor` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `buying_amount` double NOT NULL,
  `buying_currency` varchar(3) NOT NULL,
  `payment_type_code` varchar(2) NOT NULL,
  `selling_amount` double NOT NULL,
  `selling_currency` varchar(3) NOT NULL,
  `traveler_id` int(11) NOT NULL,
  `pnr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tkt_no`),
  KEY `INX_TICKET_TRAVELER_ID` (`traveler_id`),
  KEY `INX_TICKET_DOS` (`dos`),
  KEY `INX_TICKET_USER_ID` (`user_id`),
  KEY `INX_TICKET_USER_PNR_ID` (`pnr_id`),
  KEY `FK_TICKET_PAYMENT_TYPE_PAYMENT_TYPE_CODE_idx` (`payment_type_code`),
  CONSTRAINT `FK_TICKET_PAYMENT_TYPE_PAYMENT_TYPE_CODE` FOREIGN KEY (`payment_type_code`) REFERENCES `payment_type` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TICKET_TRAVELER_TVL_ID` FOREIGN KEY (`traveler_id`) REFERENCES `pax` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TICKET_USER_PNR_ID` FOREIGN KEY (`pnr_id`) REFERENCES `pnr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TICKET_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-08 14:21:21
