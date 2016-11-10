-- MySQL dump 10.14  Distrib 5.5.50-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	5.5.50-MariaDB

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
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user` (
  `id` decimal(6,0) NOT NULL DEFAULT '0',
  `user_name` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ak_user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,'acollado','abc'),(4,'ilajunta','def'),(7,'nescrina','1234'),(64,'raulj','asdfg'),(66,'vlazauca','567'),(672,'jmas','qwerty'),(800,'albertop','zxcvb');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchangedticket`
--

DROP TABLE IF EXISTS `exchangedticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchangedticket` (
  `idChange` decimal(6,0) NOT NULL DEFAULT '0',
  `ticket` varchar(20) DEFAULT NULL,
  `restaurant` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`idChange`),
  KEY `FK_ticketChange` (`ticket`),
  KEY `FK_restaurantBescanvi` (`restaurant`),
  CONSTRAINT `FK_restaurantBescanvi` FOREIGN KEY (`restaurant`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `FK_ticketChange` FOREIGN KEY (`ticket`) REFERENCES `ticket` (`denomination`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchangedticket`
--

LOCK TABLES `exchangedticket` WRITE;
/*!40000 ALTER TABLE `exchangedticket` DISABLE KEYS */;
INSERT INTO `exchangedticket` VALUES (4,'WeekEnd Bussines',1490),(5,'Plantilla 1',1487),(6,'WeekEnd Bussines',1490),(7,'WeekEnd Bussines',1487),(9,'WeekEnd Bussines',1490),(10,'WeekEnd Bussines',1487),(13,'Diario VIP',1490),(14,'Diario VIP',1490),(15,'WeekEnd Bussines',1490),(17,'Diario VIP',1490),(18,'Diario VIP',1487),(19,'Diario VIP',1490),(20,'Diario VIP',1490),(21,'Diario VIP',1487),(22,'WeekEnd Bussines',1490),(23,'WeekEnd Bussines',1490),(25,'WeekEnd Bussines',1490),(26,'Diario VIP',1490),(27,'Diario VIP',1487);
/*!40000 ALTER TABLE `exchangedticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER insert_ticket BEFORE INSERT ON exchangedticket FOR EACH ROW

BEGIN

  IF NEW.ticket = 'WeekEnd Bussines' THEN

    IF (SELECT COUNT(*) FROM Restaurant, Waiter WHERE Restaurant.id = Waiter.maitre AND Restaurant.id = NEW.restaurant LIMIT 1) = 0 THEN
       SET NEW.idChange = NULL;
    END IF;

  END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `NIF` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(40) DEFAULT NULL,
  `surname` varchar(40) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `postal_code` varchar(5) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `dead_date` date DEFAULT NULL,
  PRIMARY KEY (`NIF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('10000000Z','Juan Eleuterio','Calzado Ferrando',NULL,NULL,'H',NULL,'1980-02-16'),('39867958X','Frumencio','Hamat Coulibary','C. Lepant 323, 1-1','43644',NULL,NULL,NULL),('61668732M','Adelsida','Gilete Gavara','C. Acacies 23, 1-2','25121',NULL,NULL,NULL),('70048245C','Egidio','Fite Dorador','C. Junta De Comerc 30, 2-2','08811',NULL,NULL,NULL),('77351882F','Bonaventura','Hilario Thies','C. Ricart 23, 4-3','08202',NULL,NULL,NULL),('80859452P','Talita','Amargan Pelliceu','C. Emerita Augusta 10, 2-1','25761',NULL,NULL,NULL),('80879780G','Agit','Alqueza Sagañoles','C. Floridablanca 131, 3-3','08934',NULL,NULL,NULL),('87250257X','Eustoquio','Kahlert Raspall','G.v. Corts Catalanes 986, 7-3','08257',NULL,NULL,NULL),('87250547R','Lucinia','Siahe Fedriani','C. Corsega 266, 2-2','08933',NULL,NULL,NULL),('87253820P','Bienbenida','Guijo Manterola','C. Unio 13, Pr-1','08390',NULL,NULL,NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `id` decimal(6,0) NOT NULL DEFAULT '0',
  `name` varchar(80) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `idSpecialty` decimal(3,0) DEFAULT NULL,
  `menuPrice` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_restName` (`idSpecialty`),
  CONSTRAINT `FK_restName` FOREIGN KEY (`idSpecialty`) REFERENCES `specialty` (`idSpecialty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1487,'El Cerrato ','C/General Franco 10',36,9.00),(1490,'El Cura ','Av. Gola Estany 1',10,28.00),(1493,'El Perol Plz ','Los Carrillos S/n',36,8.00),(1498,'Garbi ','Av. Jose Antonio 49 ',16,14.00);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialty` (
  `idSpecialty` decimal(3,0) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idSpecialty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (1,'Venezolano'),(2,'Wok'),(3,'Griego'),(4,'Catalan'),(5,'Coreano'),(6,'Tapas'),(7,'Castellano'),(8,'Gallego'),(9,'Sidreria'),(10,'Asador'),(11,'Extremeño'),(12,'Colombiano'),(13,'Italiano'),(14,'Uruguayo'),(15,'Vasco'),(16,'Arroceria'),(17,'Cordobes'),(18,'Brasileño'),(19,'Cerveceria'),(20,'Frances'),(21,'Japones'),(22,'Banquetes'),(23,'Asiatico'),(24,'Turco'),(25,'Marisqueria'),(26,'Andaluz'),(27,'Otros'),(28,'Peruano'),(29,'Argentino'),(30,'Asturiano'),(31,'Parrillada'),(32,'Cubano'),(33,'Taberna'),(34,'Mesón'),(35,'Montaditos'),(36,'Tapeo'),(37,'Libanes');
/*!40000 ALTER TABLE `specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `denomination` varchar(20) NOT NULL DEFAULT '',
  `ticketPrice` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`denomination`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('Desayuno',3.00),('Diario negocios',12.00),('Diario sencillo',8.50),('Diario VIP',16.00),('Medio Menú',5.00),('Plantilla 1',7.50),('Plantilla 10',12.00),('Plantilla 2',8.00),('Plantilla 3',8.50),('Plantilla 4',9.00),('Plantilla 5',9.50),('Plantilla 6',10.00),('Plantilla 7',10.50),('Plantilla 8',11.00),('Plantilla 9',11.50),('WeekEnd Bussines',32.00);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiter`
--

DROP TABLE IF EXISTS `waiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waiter` (
  `NIF` varchar(9) NOT NULL DEFAULT '',
  `restContr` decimal(6,0) DEFAULT NULL,
  `maitre` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`NIF`),
  UNIQUE KEY `AK_maitre` (`maitre`),
  KEY `FK_restContr` (`restContr`),
  CONSTRAINT `FK_maitre` FOREIGN KEY (`maitre`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `FK_NIF` FOREIGN KEY (`NIF`) REFERENCES `person` (`NIF`),
  CONSTRAINT `FK_restContr` FOREIGN KEY (`restContr`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiter`
--

LOCK TABLES `waiter` WRITE;
/*!40000 ALTER TABLE `waiter` DISABLE KEYS */;
INSERT INTO `waiter` VALUES ('39867958X',1490,1490),('61668732M',1490,NULL),('70048245C',1490,NULL),('77351882F',1490,NULL),('80859452P',1490,NULL),('80879780G',1490,NULL),('87250257X',1487,NULL);
/*!40000 ALTER TABLE `waiter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-08 16:18:02
