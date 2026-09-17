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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '06057192-ac47-11f1-a74e-7477f66c3add:1-189';

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
  `Opmerking` varchar(250) DEFAULT NULL,
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
INSERT INTO `Allergeen` VALUES (1,'Gluten','Dit product bevat gluten',_binary '',NULL,'2026-09-17 15:18:06.836803','2026-09-17 15:18:06.836807'),(2,'Gelatine','Dit product bevat gelatine',_binary '',NULL,'2026-09-17 15:18:06.836850','2026-09-17 15:18:06.836851'),(3,'AZO-Kleurstof','Dit product bevat AZO-kleurstoffen',_binary '',NULL,'2026-09-17 15:18:06.836867','2026-09-17 15:18:06.836867'),(4,'Lactose','Dit product bevat lactose',_binary '',NULL,'2026-09-17 15:18:06.836874','2026-09-17 15:18:06.836874'),(5,'Soja','Dit product bevat soja',_binary '',NULL,'2026-09-17 15:18:06.836880','2026-09-17 15:18:06.836881');
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
  `Opmerking` varchar(250) DEFAULT NULL,
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
INSERT INTO `Leverancier` VALUES (1,'Venco','Bert van Linge','L1029384719','06-28493827',_binary '',NULL,'2026-09-17 15:18:06.841514','2026-09-17 15:18:06.841516'),(2,'Astra Sweets','Jasper del Monte','L1029284315','06-39398734',_binary '',NULL,'2026-09-17 15:18:06.841546','2026-09-17 15:18:06.841547'),(3,'Haribo','Sven Stalman','L1029324748','06-24383291',_binary '',NULL,'2026-09-17 15:18:06.841561','2026-09-17 15:18:06.841561'),(4,'Basset','Joyce Stelterberg','L1023845773','06-48293823',_binary '',NULL,'2026-09-17 15:18:06.841568','2026-09-17 15:18:06.841568'),(5,'De Bron','Remco Veenstra','L1023857736','06-34291234',_binary '',NULL,'2026-09-17 15:18:06.841575','2026-09-17 15:18:06.841575');
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
  `Opmerking` varchar(250) DEFAULT NULL,
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
INSERT INTO `Magazijn` VALUES (1,1,5.00,453,_binary '',NULL,'2026-09-17 15:18:06.847503','2026-09-17 15:18:06.847505'),(2,2,2.50,400,_binary '',NULL,'2026-09-17 15:18:06.847546','2026-09-17 15:18:06.847547'),(3,3,5.00,1,_binary '',NULL,'2026-09-17 15:18:06.847568','2026-09-17 15:18:06.847569'),(4,4,1.00,800,_binary '',NULL,'2026-09-17 15:18:06.847582','2026-09-17 15:18:06.847583'),(5,5,3.00,234,_binary '',NULL,'2026-09-17 15:18:06.847594','2026-09-17 15:18:06.847594'),(6,6,2.00,345,_binary '',NULL,'2026-09-17 15:18:06.847605','2026-09-17 15:18:06.847606'),(7,7,1.00,795,_binary '',NULL,'2026-09-17 15:18:06.847617','2026-09-17 15:18:06.847617'),(8,8,10.00,233,_binary '',NULL,'2026-09-17 15:18:06.847627','2026-09-17 15:18:06.847628'),(9,9,2.50,123,_binary '',NULL,'2026-09-17 15:18:06.847641','2026-09-17 15:18:06.847642'),(10,10,3.00,NULL,_binary '',NULL,'2026-09-17 15:18:06.847653','2026-09-17 15:18:06.847653'),(11,11,2.00,367,_binary '',NULL,'2026-09-17 15:18:06.847664','2026-09-17 15:18:06.847664'),(12,12,1.00,467,_binary '',NULL,'2026-09-17 15:18:06.847674','2026-09-17 15:18:06.847675'),(13,13,5.00,20,_binary '',NULL,'2026-09-17 15:18:06.847685','2026-09-17 15:18:06.847686');
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
  `Opmerking` varchar(250) DEFAULT NULL,
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
INSERT INTO `Product` VALUES (1,'Mintnopjes','8719587231278',_binary '',NULL,'2026-09-17 15:18:06.830244','2026-09-17 15:18:06.830257'),(2,'Schoolkrijt','8719587326713',_binary '',NULL,'2026-09-17 15:18:06.830325','2026-09-17 15:18:06.830326'),(3,'Honingdrop','8719587327836',_binary '',NULL,'2026-09-17 15:18:06.830355','2026-09-17 15:18:06.830355'),(4,'Zure Beren','8719587321441',_binary '',NULL,'2026-09-17 15:18:06.830366','2026-09-17 15:18:06.830366'),(5,'Cola Flesjes','8719587321237',_binary '',NULL,'2026-09-17 15:18:06.830376','2026-09-17 15:18:06.830376'),(6,'Turtles','8719587322245',_binary '',NULL,'2026-09-17 15:18:06.830385','2026-09-17 15:18:06.830386'),(7,'Witte Muizen','8719587328256',_binary '',NULL,'2026-09-17 15:18:06.830409','2026-09-17 15:18:06.830410'),(8,'Reuzen Slangen','8719587325641',_binary '',NULL,'2026-09-17 15:18:06.830422','2026-09-17 15:18:06.830423'),(9,'Zoute Rijen','8719587322739',_binary '',NULL,'2026-09-17 15:18:06.830432','2026-09-17 15:18:06.830432'),(10,'Winegums','8719587327527',_binary '',NULL,'2026-09-17 15:18:06.830441','2026-09-17 15:18:06.830441'),(11,'Drop Munten','8719587322345',_binary '',NULL,'2026-09-17 15:18:06.830450','2026-09-17 15:18:06.830450'),(12,'Kruis Drop','8719587322265',_binary '',NULL,'2026-09-17 15:18:06.830459','2026-09-17 15:18:06.830459'),(13,'Zoute Ruitjes','8719587323256',_binary '',NULL,'2026-09-17 15:18:06.830467','2026-09-17 15:18:06.830468');
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
  `Opmerking` varchar(250) DEFAULT NULL,
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
INSERT INTO `ProductPerAllergeen` VALUES (1,1,2,_binary '',NULL,'2026-09-17 15:18:06.854011','2026-09-17 15:18:06.854013'),(2,1,1,_binary '',NULL,'2026-09-17 15:18:06.854065','2026-09-17 15:18:06.854066'),(3,1,3,_binary '',NULL,'2026-09-17 15:18:06.854087','2026-09-17 15:18:06.854088'),(4,3,4,_binary '',NULL,'2026-09-17 15:18:06.854102','2026-09-17 15:18:06.854102'),(5,6,5,_binary '',NULL,'2026-09-17 15:18:06.854114','2026-09-17 15:18:06.854115'),(6,9,2,_binary '',NULL,'2026-09-17 15:18:06.854127','2026-09-17 15:18:06.854127'),(7,9,5,_binary '',NULL,'2026-09-17 15:18:06.854139','2026-09-17 15:18:06.854140'),(8,10,2,_binary '',NULL,'2026-09-17 15:18:06.854152','2026-09-17 15:18:06.854152'),(9,12,4,_binary '',NULL,'2026-09-17 15:18:06.854164','2026-09-17 15:18:06.854165'),(10,13,1,_binary '',NULL,'2026-09-17 15:18:06.854176','2026-09-17 15:18:06.854176'),(11,13,4,_binary '',NULL,'2026-09-17 15:18:06.854188','2026-09-17 15:18:06.854188'),(12,13,5,_binary '',NULL,'2026-09-17 15:18:06.854199','2026-09-17 15:18:06.854200');
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
  `Opmerking` varchar(250) DEFAULT NULL,
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
INSERT INTO `ProductPerLeverancier` VALUES (1,1,1,'2024-10-09',23,'2024-10-16',_binary '',NULL,'2026-09-17 15:18:06.861203','2026-09-17 15:18:06.861204'),(2,1,1,'2024-10-18',21,'2024-10-25',_binary '',NULL,'2026-09-17 15:18:06.861244','2026-09-17 15:18:06.861244'),(3,1,2,'2024-10-09',12,'2024-10-16',_binary '',NULL,'2026-09-17 15:18:06.861262','2026-09-17 15:18:06.861262'),(4,1,3,'2024-10-10',11,'2024-10-17',_binary '',NULL,'2026-09-17 15:18:06.861276','2026-09-17 15:18:06.861276'),(5,2,4,'2024-10-14',16,'2024-10-21',_binary '',NULL,'2026-09-17 15:18:06.861290','2026-09-17 15:18:06.861290'),(6,2,4,'2024-10-21',23,'2024-10-28',_binary '',NULL,'2026-09-17 15:18:06.861303','2026-09-17 15:18:06.861303'),(7,2,5,'2024-10-14',45,'2024-10-21',_binary '',NULL,'2026-09-17 15:18:06.861317','2026-09-17 15:18:06.861318'),(8,2,6,'2024-10-14',30,'2024-10-21',_binary '',NULL,'2026-09-17 15:18:06.861330','2026-09-17 15:18:06.861330'),(9,3,7,'2024-10-12',12,'2024-10-19',_binary '',NULL,'2026-09-17 15:18:06.861343','2026-09-17 15:18:06.861343'),(10,3,7,'2024-10-19',23,'2024-10-26',_binary '',NULL,'2026-09-17 15:18:06.861356','2026-09-17 15:18:06.861357'),(11,3,8,'2024-10-10',12,'2024-10-17',_binary '',NULL,'2026-09-17 15:18:06.861369','2026-09-17 15:18:06.861369'),(12,3,9,'2024-10-11',1,'2024-10-18',_binary '',NULL,'2026-09-17 15:18:06.861382','2026-09-17 15:18:06.861383'),(13,4,10,'2024-10-16',24,'2024-10-30',_binary '',NULL,'2026-09-17 15:18:06.861395','2026-09-17 15:18:06.861396'),(14,5,11,'2024-10-10',47,'2024-10-17',_binary '',NULL,'2026-09-17 15:18:06.861408','2026-09-17 15:18:06.861409'),(15,5,11,'2024-10-19',60,'2024-10-26',_binary '',NULL,'2026-09-17 15:18:06.861422','2026-09-17 15:18:06.861422'),(16,5,12,'2024-10-11',45,NULL,_binary '',NULL,'2026-09-17 15:18:06.861434','2026-09-17 15:18:06.861434'),(17,5,13,'2024-10-12',23,NULL,_binary '',NULL,'2026-09-17 15:18:06.861447','2026-09-17 15:18:06.861447');
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

-- Dump completed on 2026-09-17 15:18:06
