-- MySQL dump 10.13  Distrib 26.7.0, for macos26.6 (arm64)
--
-- Host: localhost    Database: Jamin
-- ------------------------------------------------------
-- Server version	26.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '06057192-ac47-11f1-a74e-7477f66c3add:1-155';

--
-- Current Database: `Jamin`
--

/*!40000 DROP DATABASE IF EXISTS `Jamin`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Jamin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Jamin`;

--
-- Table structure for table `Allergeen`
--

DROP TABLE IF EXISTS `Allergeen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Allergeen` (
  `Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  `Omschrijving` varchar(250) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Allergeen`
--

LOCK TABLES `Allergeen` WRITE;
/*!40000 ALTER TABLE `Allergeen` DISABLE KEYS */;
INSERT INTO `Allergeen` VALUES (1,'Gluten','Dit product bevat gluten',_binary '',NULL,'2026-09-17 15:11:24.849188','2026-09-17 15:11:24.849188'),(2,'Gelatine','Dit product bevat gelatine',_binary '',NULL,'2026-09-17 15:11:24.849211','2026-09-17 15:11:24.849212'),(3,'AZO-Kleurstof','Dit product bevat AZO-kleurstoffen',_binary '',NULL,'2026-09-17 15:11:24.849222','2026-09-17 15:11:24.849222'),(4,'Lactose','Dit product bevat lactose',_binary '',NULL,'2026-09-17 15:11:24.849228','2026-09-17 15:11:24.849228'),(5,'Soja','Dit product bevat soja',_binary '',NULL,'2026-09-17 15:11:24.849234','2026-09-17 15:11:24.849234');
/*!40000 ALTER TABLE `Allergeen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Leverancier`
--

DROP TABLE IF EXISTS `Leverancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Leverancier` (
  `Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  `ContactPersoon` varchar(50) NOT NULL,
  `LeverancierNummer` varchar(15) NOT NULL,
  `Mobiel` varchar(12) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Leverancier`
--

LOCK TABLES `Leverancier` WRITE;
/*!40000 ALTER TABLE `Leverancier` DISABLE KEYS */;
INSERT INTO `Leverancier` VALUES (1,'Venco','Bert van Linge','L1029384719','06-28493827',_binary '',NULL,'2026-09-17 15:11:24.851663','2026-09-17 15:11:24.851665'),(2,'Astra Sweets','Jasper del Monte','L1029284315','06-39398734',_binary '',NULL,'2026-09-17 15:11:24.851690','2026-09-17 15:11:24.851690'),(3,'Haribo','Sven Stalman','L1029324748','06-24383291',_binary '',NULL,'2026-09-17 15:11:24.851702','2026-09-17 15:11:24.851702'),(4,'Basset','Joyce Stelterberg','L1023845773','06-48293823',_binary '',NULL,'2026-09-17 15:11:24.851709','2026-09-17 15:11:24.851709'),(5,'De Bron','Remco Veenstra','L1023857736','06-34291234',_binary '',NULL,'2026-09-17 15:11:24.851716','2026-09-17 15:11:24.851716');
/*!40000 ALTER TABLE `Leverancier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Magazijn`
--

DROP TABLE IF EXISTS `Magazijn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Magazijn` (
  `Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` tinyint unsigned NOT NULL,
  `VerpakkingsEenheid` decimal(5,2) unsigned NOT NULL,
  `AantalAanwezig` smallint unsigned DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Magazijn_ProductId_Product_Id` (`ProductId`),
  CONSTRAINT `FK_Magazijn_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Magazijn`
--

LOCK TABLES `Magazijn` WRITE;
/*!40000 ALTER TABLE `Magazijn` DISABLE KEYS */;
INSERT INTO `Magazijn` VALUES (1,1,5.00,453,_binary '',NULL,'2026-09-17 15:11:24.856045','2026-09-17 15:11:24.856047'),(2,2,2.50,400,_binary '',NULL,'2026-09-17 15:11:24.856080','2026-09-17 15:11:24.856081'),(3,3,5.00,1,_binary '',NULL,'2026-09-17 15:11:24.856103','2026-09-17 15:11:24.856103'),(4,4,1.00,800,_binary '',NULL,'2026-09-17 15:11:24.856114','2026-09-17 15:11:24.856114'),(5,5,3.00,234,_binary '',NULL,'2026-09-17 15:11:24.856123','2026-09-17 15:11:24.856123'),(6,6,2.00,345,_binary '',NULL,'2026-09-17 15:11:24.856131','2026-09-17 15:11:24.856131'),(7,7,1.00,795,_binary '',NULL,'2026-09-17 15:11:24.856139','2026-09-17 15:11:24.856139'),(8,8,10.00,233,_binary '',NULL,'2026-09-17 15:11:24.856147','2026-09-17 15:11:24.856147'),(9,9,2.50,123,_binary '',NULL,'2026-09-17 15:11:24.856155','2026-09-17 15:11:24.856155'),(10,10,3.00,NULL,_binary '',NULL,'2026-09-17 15:11:24.856163','2026-09-17 15:11:24.856163'),(11,11,2.00,367,_binary '',NULL,'2026-09-17 15:11:24.856172','2026-09-17 15:11:24.856172'),(12,12,1.00,467,_binary '',NULL,'2026-09-17 15:11:24.856180','2026-09-17 15:11:24.856180'),(13,13,5.00,20,_binary '',NULL,'2026-09-17 15:11:24.856187','2026-09-17 15:11:24.856188');
/*!40000 ALTER TABLE `Magazijn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  `Barcode` varchar(13) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Mintnopjes','8719587231278',_binary '',NULL,'2026-09-17 15:11:24.846084','2026-09-17 15:11:24.846088'),(2,'Schoolkrijt','8719587326713',_binary '',NULL,'2026-09-17 15:11:24.846116','2026-09-17 15:11:24.846117'),(3,'Honingdrop','8719587327836',_binary '',NULL,'2026-09-17 15:11:24.846130','2026-09-17 15:11:24.846130'),(4,'Zure Beren','8719587321441',_binary '',NULL,'2026-09-17 15:11:24.846137','2026-09-17 15:11:24.846137'),(5,'Cola Flesjes','8719587321237',_binary '',NULL,'2026-09-17 15:11:24.846143','2026-09-17 15:11:24.846143'),(6,'Turtles','8719587322245',_binary '',NULL,'2026-09-17 15:11:24.846149','2026-09-17 15:11:24.846149'),(7,'Witte Muizen','8719587328256',_binary '',NULL,'2026-09-17 15:11:24.846155','2026-09-17 15:11:24.846155'),(8,'Reuzen Slangen','8719587325641',_binary '',NULL,'2026-09-17 15:11:24.846160','2026-09-17 15:11:24.846160'),(9,'Zoute Rijen','8719587322739',_binary '',NULL,'2026-09-17 15:11:24.846170','2026-09-17 15:11:24.846170'),(10,'Winegums','8719587327527',_binary '',NULL,'2026-09-17 15:11:24.846176','2026-09-17 15:11:24.846176'),(11,'Drop Munten','8719587322345',_binary '',NULL,'2026-09-17 15:11:24.846182','2026-09-17 15:11:24.846182'),(12,'Kruis Drop','8719587322265',_binary '',NULL,'2026-09-17 15:11:24.846187','2026-09-17 15:11:24.846187'),(13,'Zoute Ruitjes','8719587323256',_binary '',NULL,'2026-09-17 15:11:24.846193','2026-09-17 15:11:24.846193');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductPerAllergeen`
--

DROP TABLE IF EXISTS `ProductPerAllergeen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductPerAllergeen` (
  `Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` tinyint unsigned NOT NULL,
  `AllergeenId` tinyint unsigned NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ProductPerAllergeen_ProductId_Product_Id` (`ProductId`),
  KEY `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` (`AllergeenId`),
  CONSTRAINT `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` FOREIGN KEY (`AllergeenId`) REFERENCES `Allergeen` (`Id`),
  CONSTRAINT `FK_ProductPerAllergeen_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductPerAllergeen`
--

LOCK TABLES `ProductPerAllergeen` WRITE;
/*!40000 ALTER TABLE `ProductPerAllergeen` DISABLE KEYS */;
INSERT INTO `ProductPerAllergeen` VALUES (1,1,2,_binary '',NULL,'2026-09-17 15:11:24.860965','2026-09-17 15:11:24.860966'),(2,1,1,_binary '',NULL,'2026-09-17 15:11:24.860998','2026-09-17 15:11:24.860999'),(3,1,3,_binary '',NULL,'2026-09-17 15:11:24.861019','2026-09-17 15:11:24.861019'),(4,3,4,_binary '',NULL,'2026-09-17 15:11:24.861031','2026-09-17 15:11:24.861032'),(5,6,5,_binary '',NULL,'2026-09-17 15:11:24.861042','2026-09-17 15:11:24.861042'),(6,9,2,_binary '',NULL,'2026-09-17 15:11:24.861053','2026-09-17 15:11:24.861053'),(7,9,5,_binary '',NULL,'2026-09-17 15:11:24.861063','2026-09-17 15:11:24.861063'),(8,10,2,_binary '',NULL,'2026-09-17 15:11:24.861075','2026-09-17 15:11:24.861075'),(9,12,4,_binary '',NULL,'2026-09-17 15:11:24.861086','2026-09-17 15:11:24.861086'),(10,13,1,_binary '',NULL,'2026-09-17 15:11:24.861097','2026-09-17 15:11:24.861097'),(11,13,4,_binary '',NULL,'2026-09-17 15:11:24.861108','2026-09-17 15:11:24.861108'),(12,13,5,_binary '',NULL,'2026-09-17 15:11:24.861117','2026-09-17 15:11:24.861118');
/*!40000 ALTER TABLE `ProductPerAllergeen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductPerLeverancier`
--

DROP TABLE IF EXISTS `ProductPerLeverancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductPerLeverancier` (
  `Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `LeverancierId` tinyint unsigned NOT NULL,
  `ProductId` tinyint unsigned NOT NULL,
  `DatumLevering` date NOT NULL,
  `Aantal` smallint unsigned NOT NULL,
  `DatumEerstVolgendeLevering` date DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` (`LeverancierId`),
  KEY `FK_ProductPerLeverancier_ProductId_Product_Id` (`ProductId`),
  CONSTRAINT `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` FOREIGN KEY (`LeverancierId`) REFERENCES `Leverancier` (`Id`),
  CONSTRAINT `FK_ProductPerLeverancier_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductPerLeverancier`
--

LOCK TABLES `ProductPerLeverancier` WRITE;
/*!40000 ALTER TABLE `ProductPerLeverancier` DISABLE KEYS */;
INSERT INTO `ProductPerLeverancier` VALUES (1,1,1,'2024-10-09',23,'2024-10-16',_binary '',NULL,'2026-09-17 15:11:24.866785','2026-09-17 15:11:24.866786'),(2,1,1,'2024-10-18',21,'2024-10-25',_binary '',NULL,'2026-09-17 15:11:24.866821','2026-09-17 15:11:24.866821'),(3,1,2,'2024-10-09',12,'2024-10-16',_binary '',NULL,'2026-09-17 15:11:24.866840','2026-09-17 15:11:24.866840'),(4,1,3,'2024-10-10',11,'2024-10-17',_binary '',NULL,'2026-09-17 15:11:24.866854','2026-09-17 15:11:24.866854'),(5,2,4,'2024-10-14',16,'2024-10-21',_binary '',NULL,'2026-09-17 15:11:24.866866','2026-09-17 15:11:24.866866'),(6,2,4,'2024-10-21',23,'2024-10-28',_binary '',NULL,'2026-09-17 15:11:24.866878','2026-09-17 15:11:24.866878'),(7,2,5,'2024-10-14',45,'2024-10-21',_binary '',NULL,'2026-09-17 15:11:24.866889','2026-09-17 15:11:24.866890'),(8,2,6,'2024-10-14',30,'2024-10-21',_binary '',NULL,'2026-09-17 15:11:24.866902','2026-09-17 15:11:24.866902'),(9,3,7,'2024-10-12',12,'2024-10-19',_binary '',NULL,'2026-09-17 15:11:24.866914','2026-09-17 15:11:24.866914'),(10,3,7,'2024-10-19',23,'2024-10-26',_binary '',NULL,'2026-09-17 15:11:24.866925','2026-09-17 15:11:24.866925'),(11,3,8,'2024-10-10',12,'2024-10-17',_binary '',NULL,'2026-09-17 15:11:24.866937','2026-09-17 15:11:24.866937'),(12,3,9,'2024-10-11',1,'2024-10-18',_binary '',NULL,'2026-09-17 15:11:24.866948','2026-09-17 15:11:24.866948'),(13,4,10,'2024-10-16',24,'2024-10-30',_binary '',NULL,'2026-09-17 15:11:24.866959','2026-09-17 15:11:24.866960'),(14,5,11,'2024-10-10',47,'2024-10-17',_binary '',NULL,'2026-09-17 15:11:24.866971','2026-09-17 15:11:24.866971'),(15,5,11,'2024-10-19',60,'2024-10-26',_binary '',NULL,'2026-09-17 15:11:24.866982','2026-09-17 15:11:24.866983'),(16,5,12,'2024-10-11',45,NULL,_binary '',NULL,'2026-09-17 15:11:24.866993','2026-09-17 15:11:24.866993'),(17,5,13,'2024-10-12',23,NULL,_binary '',NULL,'2026-09-17 15:11:24.867004','2026-09-17 15:11:24.867004');
/*!40000 ALTER TABLE `ProductPerLeverancier` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-17 15:12:06
