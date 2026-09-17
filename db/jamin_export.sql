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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '06057192-ac47-11f1-a74e-7477f66c3add:1-110';

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
INSERT INTO `Allergeen` VALUES (1,'Gluten','Dit product bevat gluten',_binary '',NULL,'2026-09-17 14:49:55.134009','2026-09-17 14:49:55.134013'),(2,'Gelatine','Dit product bevat gelatine',_binary '',NULL,'2026-09-17 14:49:55.134055','2026-09-17 14:49:55.134055'),(3,'AZO-Kleurstof','Dit product bevat AZO-kleurstoffen',_binary '',NULL,'2026-09-17 14:49:55.134076','2026-09-17 14:49:55.134076'),(4,'Lactose','Dit product bevat lactose',_binary '',NULL,'2026-09-17 14:49:55.134083','2026-09-17 14:49:55.134083'),(5,'Soja','Dit product bevat soja',_binary '',NULL,'2026-09-17 14:49:55.134089','2026-09-17 14:49:55.134089');
/*!40000 ALTER TABLE `Allergeen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
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
INSERT INTO `Leverancier` VALUES (1,'Venco','Bert van Linge','L1029384719','06-28493827',_binary '',NULL,'2026-09-17 14:49:55.138634','2026-09-17 14:49:55.138639'),(2,'Astra Sweets','Jasper del Monte','L1029284315','06-39398734',_binary '',NULL,'2026-09-17 14:49:55.138673','2026-09-17 14:49:55.138673'),(3,'Haribo','Sven Stalman','L1029324748','06-24383291',_binary '',NULL,'2026-09-17 14:49:55.138688','2026-09-17 14:49:55.138689'),(4,'Basset','Joyce Stelterberg','L1023845773','06-48293823',_binary '',NULL,'2026-09-17 14:49:55.138696','2026-09-17 14:49:55.138696'),(5,'De Bron','Remco Veenstra','L1023857736','06-34291234',_binary '',NULL,'2026-09-17 14:49:55.138702','2026-09-17 14:49:55.138702');
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
INSERT INTO `Magazijn` VALUES (1,1,5.00,453,_binary '',NULL,'2026-09-17 14:49:55.143901','2026-09-17 14:49:55.143902'),(2,2,2.50,400,_binary '',NULL,'2026-09-17 14:49:55.143934','2026-09-17 14:49:55.143935'),(3,3,5.00,1,_binary '',NULL,'2026-09-17 14:49:55.143953','2026-09-17 14:49:55.143953'),(4,4,1.00,800,_binary '',NULL,'2026-09-17 14:49:55.143964','2026-09-17 14:49:55.143964'),(5,5,3.00,234,_binary '',NULL,'2026-09-17 14:49:55.143972','2026-09-17 14:49:55.143973'),(6,6,2.00,345,_binary '',NULL,'2026-09-17 14:49:55.143980','2026-09-17 14:49:55.143980'),(7,7,1.00,795,_binary '',NULL,'2026-09-17 14:49:55.143988','2026-09-17 14:49:55.143988'),(8,8,10.00,233,_binary '',NULL,'2026-09-17 14:49:55.143995','2026-09-17 14:49:55.143995'),(9,9,2.50,123,_binary '',NULL,'2026-09-17 14:49:55.144002','2026-09-17 14:49:55.144002'),(10,10,3.00,NULL,_binary '',NULL,'2026-09-17 14:49:55.144009','2026-09-17 14:49:55.144009'),(11,11,2.00,367,_binary '',NULL,'2026-09-17 14:49:55.144017','2026-09-17 14:49:55.144017'),(12,12,1.00,467,_binary '',NULL,'2026-09-17 14:49:55.144024','2026-09-17 14:49:55.144024'),(13,13,5.00,20,_binary '',NULL,'2026-09-17 14:49:55.144031','2026-09-17 14:49:55.144031');
/*!40000 ALTER TABLE `Magazijn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
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
INSERT INTO `Product` VALUES (1,'Mintnopjes','8719587231278',_binary '',NULL,'2026-09-17 14:49:55.128851','2026-09-17 14:49:55.128857'),(2,'Schoolkrijt','8719587326713',_binary '',NULL,'2026-09-17 14:49:55.128916','2026-09-17 14:49:55.128917'),(3,'Honingdrop','8719587327836',_binary '',NULL,'2026-09-17 14:49:55.128946','2026-09-17 14:49:55.128947'),(4,'Zure Beren','8719587321441',_binary '',NULL,'2026-09-17 14:49:55.128958','2026-09-17 14:49:55.128958'),(5,'Cola Flesjes','8719587321237',_binary '',NULL,'2026-09-17 14:49:55.128969','2026-09-17 14:49:55.128969'),(6,'Turtles','8719587322245',_binary '',NULL,'2026-09-17 14:49:55.128982','2026-09-17 14:49:55.128983'),(7,'Witte Muizen','8719587328256',_binary '',NULL,'2026-09-17 14:49:55.128992','2026-09-17 14:49:55.128993'),(8,'Reuzen Slangen','8719587325641',_binary '',NULL,'2026-09-17 14:49:55.129001','2026-09-17 14:49:55.129002'),(9,'Zoute Rijen','8719587322739',_binary '',NULL,'2026-09-17 14:49:55.129011','2026-09-17 14:49:55.129012'),(10,'Winegums','8719587327527',_binary '',NULL,'2026-09-17 14:49:55.129022','2026-09-17 14:49:55.129023'),(11,'Drop Munten','8719587322345',_binary '',NULL,'2026-09-17 14:49:55.129032','2026-09-17 14:49:55.129032'),(12,'Kruis Drop','8719587322265',_binary '',NULL,'2026-09-17 14:49:55.129041','2026-09-17 14:49:55.129041'),(13,'Zoute Ruitjes','8719587323256',_binary '',NULL,'2026-09-17 14:49:55.129051','2026-09-17 14:49:55.129052');
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
INSERT INTO `ProductPerAllergeen` VALUES (1,1,2,_binary '',NULL,'2026-09-17 14:49:55.150921','2026-09-17 14:49:55.150922'),(2,1,1,_binary '',NULL,'2026-09-17 14:49:55.150973','2026-09-17 14:49:55.150974'),(3,1,3,_binary '',NULL,'2026-09-17 14:49:55.151000','2026-09-17 14:49:55.151001'),(4,3,4,_binary '',NULL,'2026-09-17 14:49:55.151018','2026-09-17 14:49:55.151018'),(5,6,5,_binary '',NULL,'2026-09-17 14:49:55.151033','2026-09-17 14:49:55.151033'),(6,9,2,_binary '',NULL,'2026-09-17 14:49:55.151048','2026-09-17 14:49:55.151048'),(7,9,5,_binary '',NULL,'2026-09-17 14:49:55.151064','2026-09-17 14:49:55.151065'),(8,10,2,_binary '',NULL,'2026-09-17 14:49:55.151079','2026-09-17 14:49:55.151079'),(9,12,4,_binary '',NULL,'2026-09-17 14:49:55.151094','2026-09-17 14:49:55.151094'),(10,13,1,_binary '',NULL,'2026-09-17 14:49:55.151108','2026-09-17 14:49:55.151108'),(11,13,4,_binary '',NULL,'2026-09-17 14:49:55.151123','2026-09-17 14:49:55.151123'),(12,13,5,_binary '',NULL,'2026-09-17 14:49:55.151137','2026-09-17 14:49:55.151137');
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
INSERT INTO `ProductPerLeverancier` VALUES (1,1,1,'2024-10-09',23,'2024-10-16',_binary '',NULL,'2026-09-17 14:49:55.157691','2026-09-17 14:49:55.157692'),(2,1,1,'2024-10-18',21,'2024-10-25',_binary '',NULL,'2026-09-17 14:49:55.157726','2026-09-17 14:49:55.157727'),(3,1,2,'2024-10-09',12,'2024-10-16',_binary '',NULL,'2026-09-17 14:49:55.157746','2026-09-17 14:49:55.157746'),(4,1,3,'2024-10-10',11,'2024-10-17',_binary '',NULL,'2026-09-17 14:49:55.157760','2026-09-17 14:49:55.157761'),(5,2,4,'2024-10-14',16,'2024-10-21',_binary '',NULL,'2026-09-17 14:49:55.157774','2026-09-17 14:49:55.157774'),(6,2,4,'2024-10-21',23,'2024-10-28',_binary '',NULL,'2026-09-17 14:49:55.157788','2026-09-17 14:49:55.157788'),(7,2,5,'2024-10-14',45,'2024-10-21',_binary '',NULL,'2026-09-17 14:49:55.157816','2026-09-17 14:49:55.157816'),(8,2,6,'2024-10-14',30,'2024-10-21',_binary '',NULL,'2026-09-17 14:49:55.157829','2026-09-17 14:49:55.157830'),(9,3,7,'2024-10-12',12,'2024-10-19',_binary '',NULL,'2026-09-17 14:49:55.157843','2026-09-17 14:49:55.157843'),(10,3,7,'2024-10-19',23,'2024-10-26',_binary '',NULL,'2026-09-17 14:49:55.157855','2026-09-17 14:49:55.157856'),(11,3,8,'2024-10-10',12,'2024-10-17',_binary '',NULL,'2026-09-17 14:49:55.157868','2026-09-17 14:49:55.157868'),(12,3,9,'2024-10-11',1,'2024-10-18',_binary '',NULL,'2026-09-17 14:49:55.157881','2026-09-17 14:49:55.157881'),(13,4,10,'2024-10-16',24,'2024-10-30',_binary '',NULL,'2026-09-17 14:49:55.157894','2026-09-17 14:49:55.157894'),(14,5,11,'2024-10-10',47,'2024-10-17',_binary '',NULL,'2026-09-17 14:49:55.157907','2026-09-17 14:49:55.157907'),(15,5,11,'2024-10-19',60,'2024-10-26',_binary '',NULL,'2026-09-17 14:49:55.157924','2026-09-17 14:49:55.157925'),(16,5,12,'2024-10-11',45,NULL,_binary '',NULL,'2026-09-17 14:49:55.157937','2026-09-17 14:49:55.157937'),(17,5,13,'2024-10-12',23,NULL,_binary '',NULL,'2026-09-17 14:49:55.157950','2026-09-17 14:49:55.157950');
/*!40000 ALTER TABLE `ProductPerLeverancier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('7nRBW5Eb0AaGHgOXnFQ2Tu2DgWwVAMlJjid7mMsf',NULL,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJENU1HaFVRQ01LR2JxcllWalMwQ3NUS0xuU2Nubnl4TDQ0V3Q2bjJyIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOiJ3ZWxjb21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1789649489),('DWm4lThlrepHUKylwNZLLuJK9VkqvzfDaPERUQhM',NULL,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJOUU4zUm9zYURKR2JDc2ZIY3M0OUQyUlVrRTBOMHRrYVo4aUFIRG54IiwidXJsIjp7ImludGVuZGVkIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL21hZ2F6aWpuIn0sIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvbWFnYXppam4iLCJyb3V0ZSI6Im1hZ2F6aWpuLmluZGV4In0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1789649489),('IsU7wmt5Q1Z7CAGQQvD1wMZfHAhBivDSx6amKo8e',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Claude/2.110.1 Chrome/152.0.7977.76 Safari/537.36','eyJfdG9rZW4iOiJ1ak1jc1VjREFXakdCcHdQTW9lYm5FYzVXRHdCOHBtR1NZNHF3RVFEIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1789649493),('tycg25Wq3W2AbuPmTMFRyDSSdUsWNJQEcmUSiVEN',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Claude/2.110.1 Chrome/152.0.7977.76 Safari/537.36','eyJfdG9rZW4iOiJHZTk5aFVycGdDV25BNTlEMDVaMThYTVRqQk9pd0s0a1paZW9rUFJDIiwidXJsIjp7ImludGVuZGVkIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwMDBcL21hZ2F6aWpuIn0sIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvbG9naW4iLCJyb3V0ZSI6ImxvZ2luIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1789649652);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rolename` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Magazijnmedewerker','magazijnmedewerker@jamin.nl',NULL,'$2y$12$UvqzgKMmw29etz0tgTFmt.MiApnuWkMe6DUxcZfQIAHfPcOtiPeW2','magazijnmedewerker',NULL,'2026-09-17 10:50:29','2026-09-17 10:50:29'),(2,'Inkoper','inkoper@jamin.nl',NULL,'$2y$12$IucZJRbteWOqEGCu5vJsEOMeUh1QD63sL5n./.Dh.b3OjIJ8/AFJO','inkoper',NULL,'2026-09-17 10:50:29','2026-09-17 10:50:29'),(3,'Magazijnbeheerder','magazijnbeheerder@jamin.nl',NULL,'$2y$12$t/uUg4MmJOCjWVNDjyAOhege.JsV.WxKyHLUXjDZ2f23q8D98anXq','magazijnbeheerder',NULL,'2026-09-17 10:50:30','2026-09-17 10:50:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Jamin'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-17 14:54:36
