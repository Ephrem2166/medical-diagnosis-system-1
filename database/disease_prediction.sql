-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: localhost    Database: disease_prediction
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
-- Current Database: `disease_prediction`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `disease_prediction` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `disease_prediction`;

--
-- Table structure for table `symptoms_attribute`
--

DROP TABLE IF EXISTS `symptoms_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symptoms_attribute` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Symptom` varchar(255) NOT NULL,
  `Site` enum('required','optional','not_required') NOT NULL,
  `Onset` enum('required','optional','not_required') NOT NULL,
  `Pattern` enum('required','optional','not_required') NOT NULL,
  `Duration` enum('required','optional','not_required') NOT NULL,
  `Severity` enum('required','optional','not_required') NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptoms_attribute`
--

LOCK TABLES `symptoms_attribute` WRITE;
/*!40000 ALTER TABLE `symptoms_attribute` DISABLE KEYS */;
INSERT INTO `symptoms_attribute` VALUES (1,'fever','not_required','optional','optional','required','optional'),(2,'chill','not_required','optional','optional','required','optional'),(3,'sweat','not_required','not_required','optional','required','not_required'),(4,'weak','not_required','not_required','optional','required','not_required'),(5,'headache','not_required','optional','optional','optional','optional'),(6,'pain','required','required','optional','required','optional'),(7,'spot','required','not_required','not_required','required','not_required');
/*!40000 ALTER TABLE `symptoms_attribute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-13  9:27:42
