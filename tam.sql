CREATE DATABASE  IF NOT EXISTS `tam` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tam`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tam
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auction_name` varchar(45) DEFAULT NULL,
  `registry_no` varchar(20) DEFAULT NULL,
  `coordinator_name` varchar(45) NOT NULL,
  `coordinator_surname` varchar(45) DEFAULT NULL,
  `orginization_name` varchar(45) DEFAULT NULL,
  `auction_date` datetime DEFAULT NULL,
  `contract_date` datetime DEFAULT NULL,
  `kick_off_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `estimated_cost` double DEFAULT NULL,
  `contract_amount` double DEFAULT NULL,
  `estimated_profit` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction_item`
--

DROP TABLE IF EXISTS `auction_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auction_id` int(11) NOT NULL,
  `item_name` varchar(45) NOT NULL,
  `item_fare` double NOT NULL DEFAULT '0',
  `İtem_count` int(11) NOT NULL DEFAULT '0',
  `total_amount` double NOT NULL,
  `supliyer_company` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `type` varchar(1) NOT NULL COMMENT 'M : Meterial\nS : Service',
  PRIMARY KEY (`id`),
  KEY `INX_AUCTION_ITEM_AUCTION_AUCTION_ID` (`auction_id`),
  CONSTRAINT `FK_AUCTION_ITEM_AUCTION_AUCTION_ID` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction_item`
--

LOCK TABLES `auction_item` WRITE;
/*!40000 ALTER TABLE `auction_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction_payment`
--

DROP TABLE IF EXISTS `auction_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auction_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL COMMENT 'C : Cost, amount is negative\nD : Deduction, amount is negative\nP : Payment, amount is positive',
  `ops_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `INX_BACKHAND_COST_AUCTION_AUCTION_ID` (`auction_id`),
  CONSTRAINT `FK_BACKHAND_COST_AUCTION_AUCTION_ID` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction_payment`
--

LOCK TABLES `auction_payment` WRITE;
/*!40000 ALTER TABLE `auction_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `code` varchar(3) NOT NULL,
  `name` varchar(45) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `INX_CITY_COUNTRY_COUNTRY_CODE` (`country_code`),
  CONSTRAINT `FK_CITY_COUNTRY_COUNTRY_CODE` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('ADA','Adana','TR'),('ADF','Adiyaman','TR'),('AFY','Afyon','TR'),('AJI','Agri','TR'),('AKZ','Aksaray','TR'),('ANK','Ankara','TR'),('AOE','Eskisehir','TR'),('ARA','Ardahan','TR'),('ASR','Kayseri','TR'),('AYT','Antalya','TR'),('BAL','Batman','TR'),('BDM','Bandirma','TR'),('BEC','Burdur','TR'),('BGG','Bingol','TR'),('BLD','Bilecik','TR'),('BPE','Bolu','TR'),('BTZ','Bursa','TR'),('BXN','Bodrum','TR'),('BYE','Bayburt','TR'),('BZI','Balikesir','TR'),('CII','Aydin','TR'),('CKZ','Canakkale','TR'),('CPK','Corum','TR'),('DIY','Diyarbakir','TR'),('DLM','Dalaman','TR'),('DNZ','Denizli','TR'),('DZC','Düzce','TR'),('EDN','Edirne','TR'),('EDO','Edremit','TR'),('ERC','Erzincan','TR'),('ERZ','Erzurum','TR'),('ESB','Ankara','TR'),('ESK','Eskisehir','TR'),('EZS','Elazig','TR'),('GIE','Giresun','TR'),('GKD','Gokceada','TR'),('GNY','Sanliurfa','TR'),('GZP','Gazipasa','TR'),('GZT','Gaziantep','TR'),('HTY','Hatay','TR'),('IGD','Igdir','TR'),('ISE','Isparta','TR'),('IST','Istanbul','TR'),('ITS','Bitlis','TR'),('IZM','Izmir','TR'),('KCM','Kahramanmaras','TR'),('KCO','Kocaeli','TR'),('KFS','Kastamonu','TR'),('KJE','Kilis','TR'),('KSY','Kars','TR'),('KTP','Karaman','TR'),('KVF','Karabük','TR'),('KYA','Konya','TR'),('KZR','Kutahya','TR'),('MDA','Manisa','TR'),('MLX','Malatya','TR'),('MQM','Mardin','TR'),('MSR','Mus','TR'),('MZH','Amasya','TR'),('NAV','Nevsehir','TR'),('NID','Nigde','TR'),('NKT','Sirnak','TR'),('NOP','Sinop','TR'),('OGU','Ordu Giresun','TR'),('ONQ','Zonguldak','TR'),('OSJ','Osmaniye','TR'),('QIN','Mersin Off-Line Point','TR'),('QOR','Ordu Off-Line Pt','TR'),('QRI','Rize Off-Line Pt','TR'),('QRQ','Marmaris Off-Line Pt','TR'),('QST','Izmit Off-Line Pt','TR'),('SBD','Sakarya','TR'),('SFQ','Sanliurfa','TR'),('SSX','Samsun','TR'),('SXZ','Siirt','TR'),('SZF','Carsamba','TR'),('TEQ','Tekirdag','TR'),('TJK','Tokat','TR'),('TUH','Tunceli','TR'),('TZX','Trabzon','TR'),('UAB','Adana','TR'),('USQ','Usak','TR'),('VAN','Van','TR'),('VAS','Sivas','TR'),('XHQ','Artvin Hopa Bus Station','TR'),('XKU','Kusadasi Off-Line Point','TR'),('YAF','Yalova','TR'),('YBU','Yozgat','TR'),('YEI','Bursa','TR'),('YKO','Hakkari','TR');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(18) DEFAULT NULL,
  `home_phone` varchar(18) DEFAULT NULL,
  `company_phone` varchar(18) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
INSERT INTO `contact_info` VALUES (1,'asfasfasfsdgsdg','+21 (321) 312-3123','+21 (321) 312-3213','+11 (111) 111-1111','afsdfgsdfgsdsdgsdgsafasfasasfas'),(2,'sdgsdgsd','+11 (111) 111-1111','+11 (111) 111-1111','+11 (111) 111-1111','asfsasdgsd'),(3,'sdgsdgsd','+11 (111) 111-1111','+11 (111) 111-1111','+11 (111) 111-1111','asfsasdgsdasfas'),(4,'sdgsdgsd','+23 (423) 432-4234','+11 (111) 111-1111','+11 (111) 111-1111','asfsasdgsdasfas'),(9,'öçnmbdxcvbnc','+11 (111) 111-1111','+11 (111) 111-1111','+11 (111) 111-1111','1ewrhgfsd'),(10,'dshfjgfdsdff','+12 (412) 412-4124','+12 (412) 412-5325','+12 (412) 512-5123','12q24qasdgf'),(11,'dfhgfjfdgh','+11 (111) 111-1111','+11 (111) 111-1111','+11 (111) 111-1111','sadghfjdxgfgjhkftrsdhfgjdfuy?yfjg'),(12,'dfhgfjfdgh','+11 (111) 111-1111','+11 (111) 111-1111','+11 (111) 111-1111','sadghfjdxgfgjhkftrsdhfgjdfuy?yfjg'),(13,'ghfdghfds','+11 (111) 111-1111','+11 (111) 111-1111','+11 (111) 111-1111','tghdfgjcgfd'),(14,'ghfdghfds','+11 (111) 111-1111','+11 (111) 111-1111','+11 (111) 111-1111','tghdfgjcgfd'),(15,'ghfdghfds','+11 (111) 111-1111','+11 (111) 111-1111','+11 (111) 111-1111','tghdfgjcgfd'),(16,'ghfdghfds','+11 (111) 111-1111','+11 (111) 111-1111','+11 (111) 111-1111','tghdfgjcgfd'),(17,'huseyinnakuzum@gmail.com','+90 (534) 783-2468','+90 (226) 321-5427','','sahil mah be?evler 1. sok akuzum apt kat 2/3 Yalova Merkez'),(18,'lkj?lbc','+94 (164) 651-6466','+46 (465) 435-6134','+46 (546) 546-5465','sa?ilgkdsg?idslg'),(19,'lkj?lbc','+94 (164) 651-6466','+46 (465) 435-6134','+46 (546) 546-5465','sa?ilgkdsg?idslglkzgjds?l'),(20,'6578790978','+12 (412) 512-5612','+12 (351) 263-2626','+12 (513) 262-3569','jslk?hjfdkjhdjf?lgdsmgsd?pkhsdhdsh'),(21,'6578790978sagsag','+12 (412) 512-5612','+12 (351) 263-2626','+12 (513) 262-3569','asdasgsa'),(22,'dsgdsfhdf','+12 (412) 412-4124','+24 (124) 124-1241','+12 (412) 412-4214','asfdsfgngfdsfgh'),(23,'ewoghkfdg?lkdf','+12 (525) 235-5325','+23 (634) 347-4554','+16 (354) 754-5364','opew?tpü?r?kpo'),(24,'asgsag','+12 (312) 312-3123','','','adsgfdh'),(25,'safadsdfg','+12 (321) 312-3123','','','sdgfdhgx'),(26,'aaaaa@gmail.com','+90 (522) 223-4344','+90 (121) 232-3434','+90 (212) 233-5445','asassssssasdalömdla\nöaslsalösla\nasdlajdksdks'),(27,'huseyinnakuzum@gmail.com','+90 (534) 783-2468','','','yalova'),(28,'huseyin_akuzum@hotmail.com','+90 (534) 783-2468','','','adres'),(29,'aliercan@gmail','+90 (524) 544-2455','','','hitit'),(30,'huseyin.akuzum@hititcs.com','+90 (516) 468-4667','','','ar?2'),(31,'asdsadsa','+12 (312) 312-4124','','','12412'),(32,'huseyinnakuzum@gmail.com','+90 (534) 783-2468','','','adres'),(33,'huseyin_akuzum@hotmail.com','+90 (534) 783-2468','','','yalova'),(34,'husampa@gmail.com','+90 (534) 783-2468','','','adres'),(35,'deneme@iu.edu.tr','+90 (533) 105-2513','','','adres'),(36,'asdasd','+12 (123) 123-1231','','','asdcas'),(37,'asfas','+21 (321) 312-3123','','','12fsaf'),(38,'dfgdfgdf','+32 (423) 523-5235','','','sdgd'),(39,'sagsdgsd','+21 (312) 312-3123','','','12321'),(40,'asfasgfas','+12 (312) 312-3123','','','123'),(41,'12321','+12 (313) 123-1231','','','123123'),(42,'213123','+12 (321) 312-3123','','','12321'),(43,'fsdgsd','+12 (312) 312-3123','','','123123'),(44,'wqeqwe','+21 (312) 123-1231','','','123123'),(45,'sdfsdfsd','+34 (123) 123-1231','','','1231'),(46,'2131312','+21 (312) 312-3123','','','123123'),(47,'dgdfdfgdf','+34 (234) 234-2342','','','23423'),(48,'afasfsa','+12 (312) 312-3123','','','1231212321'),(49,'dggdfg','+31 (423) 423-4234','','','23423'),(50,'rfsadfdsaf','+21 (421) 412-4124','','','asfasf'),(51,'ewtw','+14 (124) 234-2342','','','2342343'),(52,'2w21321','+32 (121) 321-3123','','','12312'),(53,'fdhbfdhd','+33 (253) 223-4324','','','dcdsacdsc'),(54,'2qqwrqw','+11 (111) 111-1111','','','111'),(55,'121','+21 (111) 111-1111','','','111'),(56,'asfasf','+22 (222) 222-2222','','','2222'),(57,'asdsad','+21 (122) 211-2121','','','1212121'),(58,'asdasdsa','+12 (312) 312-3123','','','12312312'),(59,'sdafsdfsdf','+21 (313) 124-1212','','','asfasf'),(60,'asdasd','+12 (312) 312-3123','','','asdsa'),(61,'sdgdsg','+12 (123) 123-1231','','','12312'),(62,'asfasf','+21 (312) 312-3123','','','12312'),(63,'ertreyre','+12 (412) 412-4124','','','124124'),(64,'dhdfhfg','+21 (123) 123-1232','','','sdgdsgf'),(65,'dasdasas','+12 (321) 321-3123','','','12321'),(66,'assdgsd','+21 (312) 312-3123','','','12312'),(67,'sdgddfhgd','+12 (312) 312-3123','','','12321'),(68,'sdgsdgsdg','+32 (141) 242-3423','','','234324'),(69,'sdgsdgsdg','+21 (213) 213-1231','','','12312'),(70,'dsfgdsfg','+21 (312) 321-3123','','','12312'),(71,'asdsdgsdg','+21 (312) 312-3123','','','aasdfsa'),(72,'qweqw','+12 (123) 123-1231','','','12312'),(73,'wqerwqeqw','+21 (312) 312-3123','','','sdgsdg'),(74,'321asfsd','+23 (123) 123-1231','','','12312'),(75,'asdasdasd','+12 (312) 312-3123','','','asfasfsd'),(76,'123124231','+23 (423) 423-4234','','','23423'),(77,'asfrsdg','+12 (312) 312-3123','','','12312123'),(78,'asdsadf','+12 (312) 312-3123','','','asfasfgsad'),(79,'asdasdfas','+12 (312) 321-3121','','','dgdsgsd'),(80,'sadgsdg','+21 (312) 421-4214','','','gfsdgsd'),(81,'12312312','+12 (312) 312-3123','','','sdgsd'),(82,'12412','+12 (312) 321-3121','','','123'),(83,'gsdgsd','+12 (312) 122-1121','','','12321');
/*!40000 ALTER TABLE `contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `code` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('AD','Andorra'),('AE','United Arab Emirates'),('AF','Afghanistan'),('AG','Antigua and Barbuda'),('AI','Anguilla'),('AL','Albania'),('AM','Armenia'),('AN','Antilles Nether'),('AO','Angola'),('AQ','Antarctica'),('AR','Argentina'),('AS','American Samoa'),('AT','Austria'),('AU','Australia'),('AW','Aruba'),('AX','Aland Islands'),('AZ','Azerbaijan'),('BA','Bosnia and Herzegovina'),('BB','Barbados'),('BD','Bangladesh'),('BE','Belgium'),('BF','Burkina Faso'),('BG','Bulgaria'),('BH','Bahrain'),('BI','Burundi'),('BJ','Benin'),('BL','Saint Barthelemy'),('BM','Bermuda'),('BN','Brunei Darussalam'),('BO','Bolivia'),('BQ','Bonaire'),('BR','Brazil'),('BS','Bahamas'),('BT','Bhutan'),('BW','Botswana'),('BY','Belarus'),('BZ','Belize'),('CA','Canada'),('CC','Cocos (Keeling) Islands'),('CD','Congo Democratic Republic of'),('CF','Central African Republic'),('CG','Congo'),('CH','Switzerland'),('CI','Cote d\'Ivoire'),('CK','Cook Islands'),('CL','Chile'),('CM','Cameroon'),('CN','China'),('CO','Colombia'),('CP','KKTC'),('CR','Costa Rica'),('CT','CEMALISTAN'),('CU','Cuba'),('CV','Cape Verde'),('CW','Curacao'),('CX','Christmas Island'),('CY','Cyprus'),('CZ','Czech Republic'),('DE','Germany'),('DJ','Djibouti'),('DK','Denmark'),('DM','Dominica'),('DO','Dominican Republic'),('DZ','Algeria'),('EC','Ecuador'),('EE','Estonia'),('EG','Egypt'),('ER','Eritrea'),('ES','Spain'),('ET','Ethiopia'),('FI','Finland'),('FJ','Fiji'),('FK','Falkland Islands'),('FM','Micronesia Federated States of'),('FO','Faroe Islands'),('FR','France'),('GA','Gabon'),('GB','United Kingdom'),('GD','Grenada'),('GE','Georgia'),('GF','French Guiana'),('GH','Ghana'),('GI','Gibraltar'),('GL','Greenland'),('GM','Gambia'),('GN','Guinea'),('GP','Guadeloupe'),('GQ','Equatorial Guinea'),('GR','Greece'),('GT','Guatemala'),('GU','Guam'),('GW','Guinea-Bissau'),('GY','Guyana'),('HK','Hong Kong (SAR) China'),('HN','Honduras'),('HR','Croatia'),('HT','Haiti'),('HU','Hungary'),('ID','Indonesia'),('IE','Ireland Republic of'),('IL','Israel'),('IN','India'),('IQ','Iraq'),('IR','Iran Islamic Republic of'),('IS','Iceland'),('IT','Italy'),('JM','Jamaica'),('JO','Jordan'),('JP','Japan'),('KE','Kenya'),('KG','Kyrgyzstan'),('KI','Kiribati'),('KM','Comoros'),('KN','Saint Kitts and Nevis'),('KP','Korea Democratic People\'s Repu'),('KR','Korea Republic of'),('KW','Kuwait'),('KY','Cayman Islands'),('KZ','Kazakhstan'),('LA','Lao People\'s Democratic Republ'),('LB','Lebanon'),('LC','Saint Lucia'),('LI','Liechtenstein'),('LK','Sri Lanka'),('LR','Liberia'),('LS','Lesotho'),('LT','Lithuania'),('LU','Luxembourg'),('LV','Latvia'),('LY','Libya'),('MA','Morocco'),('MC','Monaco'),('MD','Moldova Republic of'),('ME','Montenegro'),('MF','Saint Martin'),('MG','Madagascar'),('MH','Marshall Islands'),('MK','Macedonia Former Yugoslav Repu'),('ML','Mali'),('MM','Myanmar'),('MN','Mongolia'),('MO','Macao (SAR) China'),('MP','Northern Mariana Islands (exce'),('MQ','Martinique'),('MR','Mauritania'),('MS','Montserrat'),('MT','Malta'),('MU','Mauritius'),('MV','Maldives'),('MW','Malawi'),('MX','Mexico'),('MY','Malaysia'),('MZ','Mozambique'),('NA','Namibia'),('NC','New Caledonia'),('NE','Niger'),('NF','Norfolk Island'),('NG','Nigeria'),('NI','Nicaragua'),('NL','Netherlands'),('NO','Norway'),('NP','Nepal'),('NR','Nauru'),('NU','Niue'),('NZ','New Zealand'),('OM','Oman'),('PA','Panama'),('PE','Peru'),('PF','French Polynesia'),('PG','Papua New Guinea'),('PH','Philippines'),('PK','Pakistan'),('PL','Poland'),('PM','Saint Pierre and Miquelon'),('PN','PN'),('PR','Puerto Rico'),('PS','Palestinian Territory'),('PT','Portugal'),('PW','Palau'),('PY','Paraguay'),('QA','Qatar'),('RE','Reunion'),('RO','Romania'),('RS','Serbia'),('RU','Russian Federation'),('RW','Rwanda'),('SA','Saudi Arabia'),('SB','Solomon Islands'),('SC','Seychelles'),('SD','Sudan'),('SE','Sweden'),('SG','Singapore'),('SH','Saint Helena'),('SI','Slovenia'),('SJ','Svalbard and Jan Mayen'),('SK','Slovakia'),('SL','Sierra Leone'),('SM','San Marino'),('SN','Senegal'),('SO','Somalia'),('SR','Suriname'),('SS','South Sudan'),('ST','Sao Tome and Principe'),('SV','El Salvador'),('SX','St Maarten (Dutch Part)'),('SY','Syrian Arab Republic'),('SZ','Swaziland'),('TC','Turks and Caicos Islands'),('TD','Chad'),('TG','Togo'),('TH','Thailand'),('TJ','Tajikistan'),('TL','Timor-Leste'),('TM','Turkmenistan'),('TN','Tunisia'),('TO','Tonga'),('TR','Turkey'),('TT','Trinidad and Tobago'),('TV','Tuvalu'),('TW','Chinese Taipei'),('TZ','Tanzania United Republic of'),('UA','Ukraine'),('UG','Uganda'),('UM','United States Minor Outlying I'),('US','USA'),('UY','Uruguay'),('UZ','Uzbekistan'),('VA','Holy See'),('VC','St Vincent and the Grenadines'),('VE','Venezuela'),('VG','Virgin Islands'),('VI','Virgin Islands'),('VN','Viet Nam'),('VU','Vanuatu'),('WF','Wallis and Futuna Islands'),('WS','Samoa'),('XK','Kosova'),('XU','Russia/east Of Urals'),('XX','Pitcairn Islands'),('YE','Yemen'),('YT','Mayotte'),('YU','Yugoslavia'),('ZA','South Africa'),('ZM','Zambia'),('ZR','Zaire'),('ZW','Zimbabwe'),('ZZ','ZZ');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tkt_id` int(11) DEFAULT NULL,
  `cpn_no` int(1) DEFAULT NULL,
  `segment_id` int(11) DEFAULT NULL,
  `cpn_status` varchar(1) DEFAULT NULL,
  `record_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `INX_COUPON_SEG_ID` (`segment_id`),
  KEY `FK_COUPON_TICKET_TCKT_NO_idx` (`tkt_id`),
  CONSTRAINT `FK_COUNPO_SEGMENT_SEG_ID` FOREIGN KEY (`segment_id`) REFERENCES `segment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_COUPON_TICKET_TCKT_NO` FOREIGN KEY (`tkt_id`) REFERENCES `ticket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,114,0,58,NULL,'2017-09-27 19:37:36'),(2,115,0,58,NULL,'2017-09-27 19:38:16'),(3,115,0,59,NULL,'2017-09-27 19:38:16');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide`
--

DROP TABLE IF EXISTS `guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `kokart_no` int(11) NOT NULL,
  `fare` double NOT NULL,
  `currency` varchar(3) NOT NULL,
  `contact_info_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INX_GUIDE_CONTACT_INFO_CONTACT_INFO_ID` (`contact_info_id`),
  CONSTRAINT `FK_GUIDE_CONTACT_INFO_CONTACT_INFO_ID` FOREIGN KEY (`contact_info_id`) REFERENCES `contact_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide`
--

LOCK TABLES `guide` WRITE;
/*!40000 ALTER TABLE `guide` DISABLE KEYS */;
/*!40000 ALTER TABLE `guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city_code` varchar(3) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INX_HOTEL_CIYT_CITY_CODE` (`city_code`),
  CONSTRAINT `FK_HOTEL_CIYT_CITY_CODE` FOREIGN KEY (`city_code`) REFERENCES `city` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_fare`
--

DROP TABLE IF EXISTS `hotel_fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_fare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `room_type_code` varchar(20) NOT NULL,
  `buying_fare` double NOT NULL,
  `selling_fare` double NOT NULL,
  `gate_fare` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_HOTEl_FARE_HOTEL_HOTEL_ID_idx` (`hotel_id`),
  CONSTRAINT `FK_HOTEl_FARE_HOTEL_HOTEL_ID` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_fare`
--

LOCK TABLES `hotel_fare` WRITE;
/*!40000 ALTER TABLE `hotel_fare` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_reservation`
--

DROP TABLE IF EXISTS `hotel_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `traveler_id` int(11) NOT NULL,
  `pnr_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_until` date NOT NULL,
  `room_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `INX_HOTEL_RESERVATION_HOTEL_HOTEL_ID` (`hotel_id`),
  KEY `INX_HOTEL_RESERVATION_TRAVELER_TRAVELER_ID` (`traveler_id`),
  KEY `INX_HOTEL_RESERVATION_PNR_PNR_ID` (`pnr_id`),
  CONSTRAINT `FK_HOTEL_RESERVATION_HOTEL_HOTEL_ID` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_HOTEL_RESERVATION_PNR_PNR_ID` FOREIGN KEY (`pnr_id`) REFERENCES `pnr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_HOTEL_RESERVATION_TRAVELER_TRAVELER_ID` FOREIGN KEY (`traveler_id`) REFERENCES `pax` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_reservation`
--

LOCK TABLES `hotel_reservation` WRITE;
/*!40000 ALTER TABLE `hotel_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `museum`
--

DROP TABLE IF EXISTS `museum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `museum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `city_code` varchar(3) NOT NULL,
  `fare_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `INX_MUSEUM_CITY_CITY_CODE` (`city_code`),
  CONSTRAINT `FK_MUSEUM_CITY_CITY_CODE` FOREIGN KEY (`city_code`) REFERENCES `city` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museum`
--

LOCK TABLES `museum` WRITE;
/*!40000 ALTER TABLE `museum` DISABLE KEYS */;
/*!40000 ALTER TABLE `museum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `museum_fare`
--

DROP TABLE IF EXISTS `museum_fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `museum_fare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adult_fare` double NOT NULL,
  `child_fare` double NOT NULL,
  `discount_fare` double NOT NULL COMMENT 'student,teacher,senior discount',
  `museum_id` int(11) NOT NULL,
  `currency` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `INX_MUSEUM_FARE_MUSEUM_MUSEUM_ID` (`museum_id`),
  CONSTRAINT `FK_MUSEUM_FARE_MUSEUM_MUSEUM_ID` FOREIGN KEY (`museum_id`) REFERENCES `museum` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museum_fare`
--

LOCK TABLES `museum_fare` WRITE;
/*!40000 ALTER TABLE `museum_fare` DISABLE KEYS */;
/*!40000 ALTER TABLE `museum_fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pax`
--

DROP TABLE IF EXISTS `pax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `passport_no` varchar(45) DEFAULT NULL,
  `identification_number` int(11) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `record_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `pnr_id` int(11) NOT NULL,
  `contact_info_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INX_TRAVELER_NAME` (`name`,`surname`),
  KEY `INX_TRAVELER_PNR_PNR_ID` (`pnr_id`),
  KEY `INX_PAX_CONTACT_INFO_CONTACT_INFO_ID` (`contact_info_id`),
  CONSTRAINT `FK_PAX_CONTACT_INFO_CONTACT_INFO_ID` FOREIGN KEY (`contact_info_id`) REFERENCES `contact_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TRAVELER_PNR_PNR_ID` FOREIGN KEY (`pnr_id`) REFERENCES `pnr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pax`
--

LOCK TABLES `pax` WRITE;
/*!40000 ALTER TABLE `pax` DISABLE KEYS */;
INSERT INTO `pax` VALUES (13,'hüseyin','aküzüm','1991-07-21','1212312312',NULL,'hitit cs','2017-09-17 15:10:51',8,32),(14,'ötüken','aküzüm','1991-12-12','11111111111',NULL,'ötüken tekel','2017-09-17 15:13:59',9,33),(15,'huseyin','akuzum','2017-09-15','1111111115',NULL,'ötüken','2017-09-17 15:17:50',10,34),(16,'ötüken ','akuzum','2017-09-27','1111111115',NULL,'ötüken tekel','2017-09-17 15:18:03',10,34),(17,'aydo?an','aküzüm','1965-10-10','546516434',NULL,'yalova','2017-09-17 15:18:21',10,34),(18,'nejla','aküzüm','1970-01-01','465164646',NULL,'ev han?m?','2017-09-17 15:18:40',10,34),(19,'ahmet','mehmet','2011-01-01','21412412412',NULL,'i?siz','2017-09-17 15:19:00',10,34),(20,'ay?e','mey?e','1990-10-10','54646546',NULL,'yok','2017-09-17 15:19:21',10,34),(21,'husasen','ajumxh?','1996-06-24','15641646',NULL,'hitit','2017-09-18 15:12:33',11,35),(22,'dsfsdf','sdfsdf','2017-09-07','sdfsdf',NULL,'sdfsdf','2017-09-18 17:13:09',12,36),(23,'asdasdas','asfasfasf','2017-09-21','asfasf',NULL,'asfasf','2017-09-18 17:13:26',12,36),(24,'fgjfgjhfg','sdgfsdfg','2017-09-30','sdafsdf',NULL,'sdfsdfsd','2017-09-18 17:14:15',12,36),(25,'sdgsdgsdg','sdgsdgsdg','2017-09-21','sdafsd',NULL,'sdfsdfsd','2017-09-18 17:14:22',12,36),(26,'asfass','asfasf','2017-09-22','asfas',NULL,'asfasf','2017-09-18 17:16:33',12,36),(27,'asfasf','asfasf','2017-09-23','asfasf',NULL,'asfasf','2017-09-18 17:16:39',12,36),(28,'asfasf','asfasf','2017-09-07','asfasf',NULL,'asfasf','2017-09-18 17:20:01',13,37),(29,'sdgfsd','sdgsd','2017-09-15','asdas',NULL,'asdas','2017-09-18 17:20:09',13,37),(30,'324234','sdafsd','2017-09-21','sfsdf',NULL,'sdfsdf','2017-09-18 17:22:04',13,37),(31,'asfasf','fasfas','2017-09-22','asfas',NULL,'asfas','2017-09-18 17:23:05',13,37),(32,'asfasf','asfas','2017-09-28','afasdf',NULL,'asfasfa','2017-09-18 17:24:33',13,37),(33,'SDADSGDS','DGDFGDFG','2017-09-07','DGDFGDFG',NULL,'DFGDFGDFG','2017-09-20 13:59:29',14,38),(34,'DGDFGDFWE','RWERWERWE','2017-09-22','WERWER',NULL,'FGJHGKHGK','2017-09-20 13:59:36',14,38),(35,'GDFGDFG','RQWERWEQRWE','2017-09-14','WERW',NULL,'SDFSDFSD','2017-09-20 14:00:44',14,38),(36,'DSGSDGSD','GSDGSDG','2017-09-15','SDGDS',NULL,'SGSD','2017-09-20 14:11:10',15,39),(37,'ASDFASAS','ASDSADA','2017-09-07','ASDASDAS',NULL,'ASDASD','2017-09-22 13:10:14',16,40),(38,'123213','123123','2017-09-13','12321',NULL,'123123','2017-09-22 13:12:37',17,41),(39,'123213','12312312','2017-09-14','123123123',NULL,'123123','2017-09-22 13:14:02',18,42),(40,'DSGSDGSD','SDGDSGDFG','2017-09-12','DSGDGDFGDFG',NULL,'SFGSDFG','2017-09-22 13:14:56',19,43),(41,'ASDASD','ASDSAD','2017-09-12','SADASDA',NULL,'ADASDSA','2017-09-22 13:16:05',20,44),(42,'SDFF','SDFSDF','2017-09-14','DSSDFF',NULL,'ASDFSDFSD','2017-09-22 13:17:10',21,45),(43,'SDFSDF','SDFSDFSD','2017-09-21','SDFSDF',NULL,'SDFSDF','2017-09-22 13:18:47',22,46),(44,'DFGDF','DFGDFG','2017-09-13','DFGDFGDF',NULL,'GDFGDFG','2017-09-22 13:20:59',23,47),(45,'RWEREW','SDFDSFDSF','2017-09-13','SDFSDFSDF',NULL,'SDFSDFSD','2017-09-22 13:30:23',24,48),(46,'DDSGDFG','DFGDFG','2017-09-11','DFGDFG',NULL,'DFGDFG','2017-09-22 14:36:08',25,49),(47,'DSFDSFSD','ASFSAFS','2017-09-20','ASFSD',NULL,'SDFSDF','2017-09-22 15:10:37',26,50),(48,'FSBHDFD','DFSGFSDGDFG','2017-09-23','DFGSDGSD',NULL,'SDGSDDS','2017-09-25 14:03:22',27,51),(49,'ASDSAD','ASDASD','2017-09-29','ADASAS',NULL,'DASDAS','2017-09-25 14:07:00',28,52),(50,'FDHFDHGFD','DGFHGFHGF','2017-09-27','DFHFDH',NULL,'DFHFDH','2017-09-25 14:18:52',29,53),(51,'WWWWW','WWWWWW','2017-09-15','SAVSA',NULL,'WEQWE','2017-09-25 14:26:50',30,54),(53,'ASDASD','ASDASDASD','2017-09-15','ASDASD',NULL,'ASDASDSA','2017-09-25 14:51:19',32,56),(54,'SDASDA121SDQWQEQW','DASDAS','2017-09-22','ASASDA',NULL,'ASDAS','2017-09-25 14:56:19',33,57),(55,'ASDAS','ASDASD','2017-09-12','ASDASD',NULL,'ASDASD','2017-09-25 18:46:15',34,58),(56,'SDGFSDGSD','DFGDFG','2017-09-06','WEREW',NULL,'SDDSGDSG','2017-09-25 22:04:57',35,59),(57,'HUSEYIN','AKUZUM','1996-06-24','01AQ1265465',NULL,'HITIT','2017-09-25 22:05:31',35,59),(58,'ASDASD','ASDASD','2017-09-06','SADASD',NULL,'ASDASDA','2017-09-27 12:39:39',36,60),(59,'ASD','ASDA','2017-09-19','ASDAS',NULL,'ASDASD','2017-09-27 14:57:31',38,61),(60,'ASFAS','SAFAS','2017-09-12','ASFAS',NULL,'ASFASF','2017-09-27 15:15:34',39,62),(61,'SADASF','ASFSAF','2017-09-13','ASDFSA',NULL,'DASDSAD','2017-09-27 15:41:01',41,63),(62,'ASFASF','ASFSDF','2017-09-20','SDFSD',NULL,'SDFSDF','2017-09-27 15:46:41',42,64),(63,'21321321','123123','2017-09-21','21312',NULL,'12321','2017-09-27 15:48:58',43,65),(64,'ASDAS','ASDSA','2017-09-20','ASDAS',NULL,'ASDAS','2017-09-27 15:58:19',44,66),(65,'SFGSDGF','SDGSDG','2017-09-05','SGSDG',NULL,'SDGDSG','2017-09-27 16:01:19',45,67),(66,'ASFSA','ASFSA','2017-09-13','ASFASFAS',NULL,'ASFSA','2017-09-27 16:10:33',45,67),(67,'ASFSAF','ASFAS','2017-09-12','ASFSA',NULL,'ASFSAF','2017-09-27 16:10:38',45,67),(68,'SDGSDGSDG','DGDFGDFG','2017-09-05','DSFGSD',NULL,'SDGSDGS','2017-09-27 16:19:17',46,68),(69,'123213','12312','2017-09-20','12312',NULL,'12321','2017-09-27 16:31:21',47,69),(70,'AFDSF','21321','2017-09-22','ASDSA',NULL,'DASDAS','2017-09-27 16:33:10',48,70),(71,'SAFASFSD','SDFDSF','2017-09-13','SDFSDFSD',NULL,'SDFDSF','2017-09-27 16:45:35',49,71),(72,'SADASD','ASDASDA','2017-09-12','ASDSA',NULL,'ASDSADA','2017-09-27 16:49:49',50,72),(73,'12312312','SADASF','2017-09-12','ASFASFAS',NULL,'ASFASFA','2017-09-27 16:59:58',51,73),(74,'12312','ASFASFSD','2017-09-21','SDFSD',NULL,'SDFSDF','2017-09-27 17:15:51',52,74),(75,'SADASAS','ASFAS','2017-09-23','SDFSDF',NULL,'SDFSDF','2017-09-27 17:22:44',53,75),(76,'12312312','ASASFASF','2017-09-13','ASFASF',NULL,'FDSFSDF','2017-09-27 18:19:36',54,76),(77,'1232131','ASFSADFSAD','2017-09-18','ASFDSA',NULL,'FSDFDSF','2017-09-27 18:23:57',55,77),(78,'12312312','FDSFGSD','2017-09-12','SFASF',NULL,'DFGSDGSD','2017-09-27 18:27:06',56,78),(79,'HUSEYIN','AKUZUM','1996-06-24','AS4FGAS',NULL,'SD654','2017-09-27 19:25:35',57,79),(80,'FDSHDF','DFHDF','2017-09-12','DFHDF',NULL,'DFHDFHDF','2017-09-27 19:28:43',58,80),(81,'GFHFGFG','FGHFGH','2017-09-05','FGHFG',NULL,'FGHFG','2017-09-27 19:32:47',60,82),(82,'523523','23523523','2017-09-06','325',NULL,'2235235','2017-09-27 19:37:27',61,83);
/*!40000 ALTER TABLE `pax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_type` (
  `code` varchar(2) NOT NULL,
  `explanation` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES ('KK','KREDI KARTI'),('NK','NAKIT'),('PN','PUAN');
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnr`
--

DROP TABLE IF EXISTS `pnr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pnr_no` varchar(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `option_date` datetime DEFAULT NULL,
  `status` varchar(2) NOT NULL COMMENT 'OK : Active reservation\nCX : Canceled reservation',
  `type` varchar(2) DEFAULT NULL COMMENT 'OW : One way flight\nRT : Round trip flight\nHH : Hotel',
  `cancel_reason` varchar(200) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `record_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `INX_PNR_USER_USER_ID` (`user_id`),
  CONSTRAINT `FK_PNR_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnr`
--

LOCK TABLES `pnr` WRITE;
/*!40000 ALTER TABLE `pnr` DISABLE KEYS */;
INSERT INTO `pnr` VALUES (8,'111111',1,'2017-09-15 00:00:00','OK','OW',NULL,'Aktif uçu?','2017-09-17 15:08:59'),(9,'123456',1,'2017-09-08 00:00:00','OK','OW',NULL,'not','2017-09-17 15:13:13'),(10,'111112',1,'2017-09-21 00:00:00','OK','OW',NULL,'yok','2017-09-17 15:17:33'),(11,'999999',1,'2017-09-07 00:00:00','OK','OW',NULL,'yok','2017-09-18 15:11:23'),(12,'123412',1,'2017-09-14 00:00:00','OK','OW',NULL,'sadas','2017-09-18 17:13:02'),(13,'asfasf',1,'2017-09-20 00:00:00','OK','OW',NULL,'asfas','2017-09-18 17:19:58'),(14,'dsgsdg',1,'2017-09-21 00:00:00','OK','OW',NULL,'sgsd','2017-09-20 13:59:13'),(15,'fdsgsd',1,'2017-09-22 00:00:00','OK','OW',NULL,'sdgsd','2017-09-20 14:11:04'),(16,'asfgsd',1,'2017-09-14 00:00:00','OK','RT',NULL,'asgsdg','2017-09-22 13:10:12'),(17,'112312',1,'2017-09-14 00:00:00','OK','OW',NULL,'1231231','2017-09-22 13:12:30'),(18,'asdfas',1,'2017-09-06 00:00:00','OK','OW',NULL,'qsqweq','2017-09-22 13:13:56'),(19,'232132',1,'2017-09-14 00:00:00','OK','OW',NULL,'12312312','2017-09-22 13:14:46'),(20,'sdfsdf',1,'2017-09-06 00:00:00','OK','OW',NULL,'sdfsdf','2017-09-22 13:15:55'),(21,'asfasf',1,'2017-09-20 00:00:00','OK','OW',NULL,'sdfsdf','2017-09-22 13:16:59'),(22,'sfasfs',1,'2017-09-07 00:00:00','OK','OW',NULL,'asfasfsaf','2017-09-22 13:18:37'),(23,'fasfas',1,'2017-09-12 00:00:00','OK','OW',NULL,'asfas','2017-09-22 13:20:45'),(24,'asfsaf',1,'2017-09-15 00:00:00','OK','OW',NULL,'asfasf','2017-09-22 13:30:19'),(25,'fsgdfg',1,'2017-09-13 00:00:00','OK','OW',NULL,'dfgdfg','2017-09-22 14:35:59'),(26,'asasfa',1,'2017-09-28 00:00:00','OK','OW',NULL,'asfas','2017-09-22 15:10:27'),(27,'321432',1,'2017-09-15 00:00:00','OK','HH',NULL,'sfgsdgsdg','2017-09-25 14:03:03'),(28,'sdgsdg',1,'2017-09-22 00:00:00','OK','OW',NULL,'fdsfsd','2017-09-25 14:06:40'),(29,'hdhjjg',1,'2017-09-13 00:00:00','OK','OW',NULL,'vncbvn','2017-09-25 14:18:20'),(30,'aetewt',1,'2017-09-14 00:00:00','OK','OW',NULL,'sagdsg','2017-09-25 14:26:30'),(32,'213212',1,'2017-09-03 00:00:00','OK','OW',NULL,'aasff','2017-09-25 14:50:56'),(33,'gdfgds',1,'2017-09-20 00:00:00','OK','OW',NULL,'asdasdas','2017-09-25 14:52:38'),(34,'asdass',1,'2017-09-12 00:00:00','OK','OW',NULL,'asdasdasd','2017-09-25 18:45:52'),(35,'214331',1,'2017-09-19 00:00:00','OK','OW',NULL,'asdad','2017-09-25 22:04:03'),(36,'wsdasd',1,'2017-09-12 00:00:00','OK','OW',NULL,'asdsa','2017-09-27 12:39:18'),(37,'wsdasd',1,'2017-09-12 00:00:00','OK','OW',NULL,'asdsa','2017-09-27 12:40:04'),(38,'dgrsdg',1,'2017-09-11 00:00:00','OK','OW',NULL,'asasg','2017-09-27 14:56:52'),(39,'asfasf',1,'2017-09-05 00:00:00','OK','OW',NULL,'asfasf','2017-09-27 15:15:16'),(40,'sadsad',1,'2017-09-05 00:00:00','OK','OW',NULL,'asdad','2017-09-27 15:30:51'),(41,'34t335',1,'2017-09-19 00:00:00','OK','OW',NULL,'tertret','2017-09-27 15:40:40'),(42,'asfasf',1,'2017-09-06 00:00:00','OK','HH',NULL,'asfasfa','2017-09-27 15:46:20'),(43,'kkkkkk',1,'1111-11-11 00:00:00','OK','HH',NULL,'adssasada','2017-09-27 15:49:28'),(44,'asfdas',1,'2017-09-22 00:00:00','OK','OW',NULL,'asdfaf','2017-09-27 15:58:00'),(45,'sadasd',1,'2017-09-18 00:00:00','OK','OW',NULL,'asasf','2017-09-27 16:01:02'),(46,'dsgsdg',1,'2017-09-06 00:00:00','OK','OW',NULL,'dsgsdgsd','2017-09-27 16:18:53'),(47,'gasgas',1,'2017-09-20 00:00:00','OK','OW',NULL,'123412412','2017-09-27 16:30:57'),(48,'fhdfhd',1,'2017-09-13 00:00:00','OK','OW',NULL,'asdsa','2017-09-27 16:32:50'),(49,'123213',1,'2017-09-14 00:00:00','OK','OW',NULL,'sdgsdg','2017-09-27 16:45:13'),(50,'afasfa',1,'2017-09-06 00:00:00','OK','OW',NULL,'asasas','2017-09-27 16:49:30'),(51,'sdfsdf',1,'2017-09-13 00:00:00','OK','OW',NULL,'sdfsdfsd','2017-09-27 16:59:18'),(52,'312312',1,'2017-09-05 00:00:00','OK','OW',NULL,'12321312','2017-09-27 17:15:33'),(53,'asdasd',1,'2017-09-19 00:00:00','OK','OW',NULL,'asdasd','2017-09-27 17:22:23'),(54,'123125',1,'2017-09-27 00:00:00','OK','OW',NULL,'12124234','2017-09-27 18:19:14'),(55,'w21312',1,'2017-09-19 00:00:00','OK','OW',NULL,'12321','2017-09-27 18:23:37'),(56,'dsfsdg',1,'2017-09-05 00:00:00','OK','OW',NULL,'asfasgfasg','2017-09-27 18:26:44'),(57,'asfgas',1,'2017-09-13 00:00:00','OK','OW',NULL,'sagasg','2017-09-27 19:24:41'),(58,'asgasg',1,'2017-09-13 00:00:00','OK','OW',NULL,'asgas','2017-09-27 19:28:01'),(59,'ffdhdf',1,'2017-09-14 00:00:00','OK','OW',NULL,'dfgdf','2017-09-27 19:30:10'),(60,'gfjgfj',1,'2017-09-05 00:00:00','OK','OW',NULL,'sdgdgdsf','2017-09-27 19:33:04'),(61,'asgsdg',1,'2017-09-19 00:00:00','OK','OW',NULL,'sdgsdg','2017-09-27 19:37:05');
/*!40000 ALTER TABLE `pnr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `port` (
  `code` varchar(3) NOT NULL,
  `name` varchar(45) NOT NULL,
  `city_code` varchar(3) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_PORT_CITY_CITY_CODE_idx` (`city_code`),
  CONSTRAINT `FK_PORT_CITY_CITY_CODE` FOREIGN KEY (`city_code`) REFERENCES `city` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
INSERT INTO `port` VALUES ('ADA','Adana','ADA'),('ADF','Adiyaman','ADF'),('AFY','Afyon','AFY'),('AJI','Agri','AJI'),('ANK','Ankara Etimesgut Apt','QRQ'),('AOE','Eskisehir','AOE'),('ASR','Kayseri','ASR'),('AYT','Antalya','AYT'),('BAL','Batman','BAL'),('BDM','Bandirma','BDM'),('BGG','Bingol','BGG'),('BJV','Bodrum Milas Airport','BXN'),('BTZ','BURSA','BTZ'),('BXN','Bodrum Imsik Airport','BXN'),('BZI','Balikesir','BZI'),('CII','Aydin','CII'),('CKZ','Canakkale','CKZ'),('DIY','Diyarbakir','DIY'),('DLM','Dalaman','DLM'),('DNZ','Denizli','DNZ'),('EDO','Edremit','EDO'),('ERC','Erzincan','ERC'),('ERZ','Erzurum','ERZ'),('ESB','Ankara Esenboga Apt','ANK'),('ESK','Eskisehir2','ESK'),('ETI','Ankara','ANK'),('EZS','Elazig','EZS'),('GKD','Gokceada','GKD'),('GNY','Sanliurfa','GNY'),('GZP','Gazipasa','GZP'),('GZT','Gaziantep','GZT'),('HTY','Hatay','HTY'),('IGD','Igdir','IGD'),('ISE','Isparta','ISE'),('KCM','Kahramanmaras','KCM'),('KCO','Kocaeli','KCO'),('KFS','Kastamonu','KFS'),('KSY','Kars','KSY'),('KYA','Konya','KYA'),('KZR','Kutahya','KZR'),('MLX','Malatya','MLX'),('MQM','Mardin','MQM'),('MSR','Mus','MSR'),('MZH','Amasya','MZH'),('NAV','Nevsehir','NAV'),('NKT','Sirnak','NKT'),('NOP','Sinop','NOP'),('OGU','Ordu Giresun','TZX'),('ONQ','Zonguldak','ONQ'),('QIN','Mersin Off-Line Point','QIN'),('QOR','Ordu Off-Line Pt','QOR'),('QRI','Rize Off-Line Pt','QRI'),('QRQ','Marmaris Off-Line Pt','QRQ'),('QST','Izmit Off-Line Pt','QST'),('SAW','Istanbul Sabiha Gokcen Apt','IST'),('SFQ','Sanliurfa','SFQ'),('SSX','SAMSUN','SSX'),('SXZ','Siirt','SXZ'),('SZF','Samsun','SZF'),('TEQ','Tekirdag','TEQ'),('TJK','Tokat','TJK'),('TZX','Trabzon','TZX'),('USQ','Usak','USQ'),('VAN','Van','VAN'),('VAS','Sivas','VAS'),('XHQ','Artvin Hopa Bus Station','XHQ'),('XKU','Kusadasi Off-Line Point','XKU'),('XXX','INCIRLIK','ADA'),('YEI','Bursa','YEI'),('YKO','Hakkari','YKO');
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process` (
  `code` varchar(20) NOT NULL,
  `explanation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `explanation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UI_REGION_CODE` (`code`),
  KEY `INX_REGION_COUNTRY_COUNTRY_CODE` (`country_code`),
  CONSTRAINT `FK_REGION_COUNTRY_COUNTRY_CODE` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'A','TR','A');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restorant`
--

DROP TABLE IF EXISTS `restorant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restorant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `adsress` varchar(200) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restorant`
--

LOCK TABLES `restorant` WRITE;
/*!40000 ALTER TABLE `restorant` DISABLE KEYS */;
/*!40000 ALTER TABLE `restorant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `code` varchar(20) NOT NULL,
  `explanation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_process`
--

DROP TABLE IF EXISTS `role_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_process` (
  `role_code` varchar(20) NOT NULL,
  `process_code` varchar(20) NOT NULL,
  PRIMARY KEY (`role_code`,`process_code`),
  KEY `INX_ROLE_PROCESS_ROCESS_CODE` (`process_code`),
  CONSTRAINT `FK_ROLE_PROCESS_PROCESS_PROCESS_CODE` FOREIGN KEY (`process_code`) REFERENCES `process` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ROLE_PROCESS_ROLE_ROLE_CODE` FOREIGN KEY (`role_code`) REFERENCES `role` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_process`
--

LOCK TABLES `role_process` WRITE;
/*!40000 ALTER TABLE `role_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_type` (
  `room_type_code` varchar(20) NOT NULL,
  `explanation` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`room_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segment`
--

DROP TABLE IF EXISTS `segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aa_code` varchar(3) NOT NULL,
  `flt_no` varchar(4) NOT NULL,
  `dep_port` varchar(3) NOT NULL,
  `arr_port` varchar(3) NOT NULL,
  `dep_date` datetime NOT NULL,
  `record_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UI_SEGMENT_FLT` (`flt_no`,`dep_date`,`aa_code`,`dep_port`,`arr_port`),
  KEY `FK_SEGMENT_PORT_DEP_PORT_idx` (`dep_port`),
  KEY `FK_SEGMENT_PORT_ARR_PORT_idx` (`arr_port`),
  CONSTRAINT `FK_SEGMENT_PORT_ARR_PORT` FOREIGN KEY (`arr_port`) REFERENCES `port` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SEGMENT_PORT_DEP_PORT` FOREIGN KEY (`dep_port`) REFERENCES `port` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segment`
--

LOCK TABLES `segment` WRITE;
/*!40000 ALTER TABLE `segment` DISABLE KEYS */;
INSERT INTO `segment` VALUES (1,'adf','123','SAW','BGG','1998-01-20 00:00:00','2017-09-08 15:27:53'),(2,'afa','123','SAW','GKD','2017-09-13 00:00:00','2017-09-08 16:57:07'),(3,'trw','325','KCM','YKO','2017-09-06 00:00:00','2017-09-08 17:01:27'),(4,'pd','782','YKO','GKD','1196-06-24 00:00:00','2017-09-08 17:02:59'),(5,'dg','223','SAW','YKO','2015-01-24 00:00:00','2017-09-08 17:04:21'),(6,'dg','121','SAW','GKD','2015-01-24 00:00:00','2017-09-08 17:04:38'),(7,'gds','124','KSY','BAL','2017-09-11 00:00:00','2017-09-08 17:07:37'),(9,'saf','231','YKO','ADF','2017-09-21 00:00:00','2017-09-08 17:09:05'),(10,'ghk','325','SAW','MLX','2017-09-27 00:00:00','2017-09-08 17:12:27'),(11,'dfb','212','AJI','VAN','2017-09-20 00:00:00','2017-09-08 17:13:14'),(12,'pc','243','GKD','YKO','2017-09-21 00:00:00','2017-09-08 17:40:02'),(13,'dsd','242','KSY','YKO','2018-06-24 00:00:00','2017-09-14 02:46:22'),(14,'PC','232','QRI','ETI','2017-09-14 00:00:00','2017-09-14 02:47:48'),(15,'PC','111','GKD','SAW','2017-09-13 00:00:00','2017-09-15 09:56:09'),(16,'PC','210','SAW','QRI','2017-09-06 00:00:00','2017-09-15 09:57:36'),(17,'FDH','214','XKU','SAW','2017-09-11 00:00:00','2017-09-15 10:55:30'),(18,'SAF','123','SAW','GKD','2017-09-10 00:00:00','2017-09-15 15:38:07'),(19,'SAS','123','XKU','GKD','2017-09-13 00:00:00','2017-09-18 15:12:17'),(20,'ASD','123','GKD','KSY','2017-09-13 00:00:00','2017-09-18 17:43:51'),(21,'ASA','123','GKD','SAW','2017-09-12 00:00:00','2017-09-18 17:44:21'),(22,'ADA','123','SAW','KSY','2017-09-13 00:00:00','2017-09-18 17:45:30'),(23,'ASD','232','GKD','SAW','2017-09-05 00:00:00','2017-09-18 17:47:09'),(24,'ASD','213','XKU','SAW','2017-09-12 00:00:00','2017-09-18 17:49:37'),(25,'ADA','213','GKD','SAW','2017-09-27 00:00:00','2017-09-18 17:49:58'),(26,'GAS','213','XKU','SAW','2017-09-12 00:00:00','2017-09-20 13:54:29'),(27,'ASD','234','GKD','SAW','2017-09-26 00:00:00','2017-09-20 13:54:49'),(28,'RQQ','213','GKD','KSY','2017-09-06 00:00:00','2017-09-20 14:00:58'),(29,'WQS','231','GKD','SAW','2017-09-19 00:00:00','2017-09-20 14:11:09'),(30,'DSG','123','SAW','GKD','2017-09-13 00:00:00','2017-09-20 14:16:29'),(31,'SFA','221','SAW','GKD','2017-09-12 00:00:00','2017-09-20 14:36:38'),(32,'EAS','123','SAW','GKD','2017-09-07 00:00:00','2017-09-22 09:49:37'),(33,'SAD','213','SAW','GKD','2017-09-05 00:00:00','2017-09-22 09:55:20'),(34,'DFS','112','GKD','GKD','2014-01-01 00:00:00','2017-09-22 10:59:16'),(35,'SDF','232','SAW','GKD','2017-09-04 00:00:00','2017-09-25 14:03:20'),(36,'ASF','123','XKU','GKD','2017-09-11 00:00:00','2017-09-25 14:06:54'),(37,'DFH','332','SAW','GKD','2017-09-19 00:00:00','2017-09-25 14:18:41'),(38,'WWW','111','SAW','GKD','2017-09-11 00:00:00','2017-09-25 14:26:44'),(39,'AAA','111','GZP','SAW','2017-09-05 00:00:00','2017-09-25 14:36:33'),(40,'SDG','312','SAW','GKD','2017-09-19 00:00:00','2017-09-25 22:04:50'),(41,'GDS','212','YKO','QRI','2017-09-11 00:00:00','2017-09-25 22:05:11'),(42,'DFG','123','SAW','KSY','2017-09-11 00:00:00','2017-09-27 14:57:21'),(43,'SDF','123','SAW','GKD','2017-09-11 00:00:00','2017-09-27 15:40:54'),(44,'SFD','123','SAW','GKD','2017-09-19 00:00:00','2017-09-27 15:58:13'),(45,'SDF','342','SAW','GKD','2017-09-11 00:00:00','2017-09-27 16:31:16'),(46,'ASA','213','SAW','GKD','2017-09-11 00:00:00','2017-09-27 16:59:50'),(47,'FSD','231','SAW','XKU','2017-09-03 00:00:00','2017-09-27 17:15:46'),(48,'SDA','123','SAW','XKU','2017-09-12 00:00:00','2017-09-27 17:22:37'),(49,'ASD','312','SAW','GKD','2017-09-11 00:00:00','2017-09-27 18:19:28'),(50,'FSD','131','SAW','XKU','2017-09-10 00:00:00','2017-09-27 18:23:52'),(51,'DSA','123','SAW','XKU','2017-09-10 00:00:00','2017-09-27 18:27:00'),(52,'SDG','213','SAW','XKU','2017-09-11 00:00:00','2017-09-27 19:24:56'),(53,'DGD','214','GKD','KSY','2017-09-13 00:00:00','2017-09-27 19:25:23'),(54,'DFH','235','GKD','YKO','2017-09-03 00:00:00','2017-09-27 19:28:36'),(55,'ASD','423','SAW','GKD','2017-09-11 00:00:00','2017-09-27 19:30:34'),(56,'ADS','411','SAW','GKD','2017-09-05 00:00:00','2017-09-27 19:32:30'),(57,'BNM','321','ADA','GKD','2017-09-04 00:00:00','2017-09-27 19:32:43'),(58,'ASD','679','SAW','ADA','2017-09-11 00:00:00','2017-09-27 19:37:21'),(59,'GFH','123','ADA','KSY','2017-09-11 00:00:00','2017-09-27 19:38:07');
/*!40000 ALTER TABLE `segment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tkt_no` varchar(13) DEFAULT NULL,
  `status` varchar(2) DEFAULT 'OK',
  `dos` datetime DEFAULT NULL,
  `dor` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `buying_amount` double DEFAULT NULL,
  `buying_currency` varchar(3) DEFAULT NULL,
  `payment_type_code` varchar(2) DEFAULT NULL,
  `selling_amount` double DEFAULT NULL,
  `selling_currency` varchar(3) DEFAULT NULL,
  `traveler_id` int(11) DEFAULT NULL,
  `pnr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INX_TICKET_TRAVELER_ID` (`traveler_id`),
  KEY `INX_TICKET_DOS` (`dos`),
  KEY `INX_TICKET_USER_ID` (`user_id`),
  KEY `INX_TICKET_USER_PNR_ID` (`pnr_id`),
  KEY `FK_TICKET_PAYMENT_TYPE_PAYMENT_TYPE_CODE_idx` (`payment_type_code`),
  CONSTRAINT `FK_TICKET_PAYMENT_TYPE_PAYMENT_TYPE_CODE` FOREIGN KEY (`payment_type_code`) REFERENCES `payment_type` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TICKET_TRAVELER_TVL_ID` FOREIGN KEY (`traveler_id`) REFERENCES `pax` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TICKET_USER_PNR_ID` FOREIGN KEY (`pnr_id`) REFERENCES `pnr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TICKET_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (11,'3214234234234','OK','2017-09-27 00:00:00',NULL,1,0.023423,'RY',NULL,324230,'TR',55,34),(105,'1231231231231','OK',NULL,NULL,1,0.012312,'EU',NULL,12321,'EU',75,53),(106,'1231231231231','CX',NULL,NULL,1,0.021312,'RY',NULL,12312,'RY',75,53),(107,'2222222222222','OK',NULL,NULL,1,23230,'EU',NULL,232320,'EU',75,53),(108,'8709897970987','OK','2017-09-05 00:00:00','2017-09-11 00:00:00',1,678670,'TR',NULL,678678,'TR',75,53),(109,'2145324353453','OK','2017-09-04 00:00:00','2017-09-04 00:00:00',1,34534530,'EU',NULL,0.034534,'EU',75,53),(110,'1232321321312','','2017-09-26 00:00:00',NULL,1,0.0123,'TR',NULL,123210,'TR',75,53),(111,'1231231231231','CX','2017-09-04 00:00:00','2017-09-04 00:00:00',1,0.12321,'DL',NULL,0.012312,'DL',75,53),(112,'2132131232131','OK','2017-09-10 00:00:00',NULL,1,12321,'TR',NULL,123120,'TR',78,56),(113,'2314214124124','OK','2017-09-04 00:00:00','2017-09-04 00:00:00',1,124210,'EU',NULL,124210,'EU',79,57),(114,'3252352352352','OK','2017-09-12 00:00:00','2017-09-11 00:00:00',1,0.02352,'TR',NULL,235230,'TR',82,61),(115,'4235346534634','OK','2017-09-06 00:00:00','2017-09-12 00:00:00',1,3463460,'TR',NULL,346340,'TR',82,61);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_pax`
--

DROP TABLE IF EXISTS `tour_pax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour_pax` (
  `tour_id` int(11) NOT NULL,
  `pax_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`tour_id`,`pax_id`),
  KEY `INX_TOUR_PAX_PAX_PAX_ID` (`pax_id`),
  KEY `INX_TOUR_PAX_USER_USER_ID` (`user_id`),
  CONSTRAINT `FK_TOUR_PAX_PAX_PAX_ID` FOREIGN KEY (`pax_id`) REFERENCES `pax` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_PAX_TOUR_TOUR_ID` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_PAX_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_pax`
--

LOCK TABLES `tour_pax` WRITE;
/*!40000 ALTER TABLE `tour_pax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_pax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_restorant`
--

DROP TABLE IF EXISTS `tour_restorant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour_restorant` (
  `tour_id` int(11) NOT NULL AUTO_INCREMENT,
  `restorant_id` int(11) NOT NULL,
  `restorant_fare` double NOT NULL,
  `currency` varchar(3) NOT NULL,
  PRIMARY KEY (`tour_id`,`restorant_id`),
  KEY `INX_TOUR_RESTORANT_RESTORANT_REST_ID` (`restorant_id`),
  CONSTRAINT `FK_TOUR_RESTORANT_RESTORANT_REST_ID` FOREIGN KEY (`restorant_id`) REFERENCES `restorant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_RESTORANT_TOUR_TOUR_ID` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_restorant`
--

LOCK TABLES `tour_restorant` WRITE;
/*!40000 ALTER TABLE `tour_restorant` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_restorant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_tranportation_type`
--

DROP TABLE IF EXISTS `tour_tranportation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour_tranportation_type` (
  `code` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_tranportation_type`
--

LOCK TABLES `tour_tranportation_type` WRITE;
/*!40000 ALTER TABLE `tour_tranportation_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_tranportation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `disable` varchar(1) NOT NULL DEFAULT 'F',
  `record_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'root','root','root','0','2017-06-06 00:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_code` varchar(20) NOT NULL,
  KEY `INX_USER_ROLE_ROLE_CODE` (`role_code`),
  KEY `INX_USER_ROLE_USER_ID` (`user_id`),
  CONSTRAINT `FK_USER_ROLE_ROLE_ROLE_CODE` FOREIGN KEY (`role_code`) REFERENCES `role` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_USER_ROLE_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-16 18:12:11
