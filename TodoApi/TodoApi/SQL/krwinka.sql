CREATE DATABASE  IF NOT EXISTS `krwinka` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `krwinka`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: krwinka
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.10-MariaDB

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
-- Table structure for table `blood_centers`
--

DROP TABLE IF EXISTS `blood_centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blood_centers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_centers`
--

LOCK TABLES `blood_centers` WRITE;
/*!40000 ALTER TABLE `blood_centers` DISABLE KEYS */;
INSERT INTO `blood_centers` VALUES (1,'Centrum Katowice'),(2,'Centrum Chorzów');
/*!40000 ALTER TABLE `blood_centers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_groups`
--

DROP TABLE IF EXISTS `blood_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blood_groups` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_groups`
--

LOCK TABLES `blood_groups` WRITE;
/*!40000 ALTER TABLE `blood_groups` DISABLE KEYS */;
INSERT INTO `blood_groups` VALUES (1,'0 RH+'),(2,'0 RH-'),(3,'A RH+'),(4,'A RH-'),(5,'B RH+'),(6,'B RH-'),(7,'AB RH+'),(8,'AB RH-');
/*!40000 ALTER TABLE `blood_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doners`
--

DROP TABLE IF EXISTS `doners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doners` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Surname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Telephone` int(11) NOT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `City` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PostalCode` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `HouseNumber` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Pesel` bigint(11) NOT NULL,
  `HealthCardNo` int(11) NOT NULL,
  `BloodGroupId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  KEY `fk_blood_groups_idx` (`BloodGroupId`),
  CONSTRAINT `fk_blood_groups` FOREIGN KEY (`BloodGroupId`) REFERENCES `blood_groups` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doners`
--

LOCK TABLES `doners` WRITE;
/*!40000 ALTER TABLE `doners` DISABLE KEYS */;
INSERT INTO `doners` VALUES (1,'Łukasz','Taraszka',668462791,'luktar@gmail.com','Katowice','40-171','17/49',85041318453,123456,1),(2,'Basia','Tomczykiewicz',666555444,'basia@malpa.pl','Katowice','12-121','22B',72634918732,222222,2),(3,'Konrad','Podsiadło',111222333,'konrad@tectocom.com','Chorzów','32-333','1',84736261646,333333,3),(4,'Grzegorz','Stopyra',333222333,'grzegorz@bomba.com','Katowice','22-222','32/33',29384727373,444444,4),(5,'Zuzanna','Wojtach',111222111,'zuza@gmail.com','Katowice','11-333','6',99383747234,555555,5);
/*!40000 ALTER TABLE `doners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doners_blood_centers_map`
--

DROP TABLE IF EXISTS `doners_blood_centers_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doners_blood_centers_map` (
  `DonerId` int(11) NOT NULL,
  `BloodCenterId` int(11) NOT NULL,
  PRIMARY KEY (`DonerId`,`BloodCenterId`),
  KEY `fk_doners_idx` (`BloodCenterId`),
  CONSTRAINT `fk_blood_center` FOREIGN KEY (`BloodCenterId`) REFERENCES `blood_centers` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_doners` FOREIGN KEY (`DonerId`) REFERENCES `doners` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doners_blood_centers_map`
--

LOCK TABLES `doners_blood_centers_map` WRITE;
/*!40000 ALTER TABLE `doners_blood_centers_map` DISABLE KEYS */;
INSERT INTO `doners_blood_centers_map` VALUES (1,1),(1,2),(2,1),(2,2),(3,1),(3,2),(4,1),(4,2),(5,1),(5,2);
/*!40000 ALTER TABLE `doners_blood_centers_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TodoItems`
--

DROP TABLE IF EXISTS `TodoItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TodoItems` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `IsComplete` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TodoItems`
--

LOCK TABLES `TodoItems` WRITE;
/*!40000 ALTER TABLE `TodoItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `TodoItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'krwinka'
--

--
-- Dumping routines for database 'krwinka'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-17  1:00:59
