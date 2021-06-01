-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `accountsgroupsrelation`
--

DROP TABLE IF EXISTS `accountsgroupsrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountsgroupsrelation` (
  `account_id` int NOT NULL,
  `group_id` int NOT NULL,
  UNIQUE KEY `account_id` (`account_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `accountsgroupsrelation_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `accountsgroupsrelation_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `chatgroups` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountsgroupsrelation`
--

LOCK TABLES `accountsgroupsrelation` WRITE;
/*!40000 ALTER TABLE `accountsgroupsrelation` DISABLE KEYS */;
INSERT INTO `accountsgroupsrelation` VALUES (53,1),(55,1),(56,1),(58,1),(55,16),(56,16),(56,17),(56,18),(55,19),(55,20),(53,22),(53,23),(56,23),(58,23),(53,24),(55,25),(56,25),(56,26),(55,27),(56,27),(55,28),(56,28),(55,29),(55,30),(55,31),(55,32),(55,33),(55,34),(55,35),(55,36),(55,37),(55,38),(55,39),(55,40),(55,41),(55,44),(55,46),(55,50),(55,51),(55,52),(55,53),(55,54),(55,55),(55,56),(55,57),(55,58),(55,59),(55,60),(55,62),(55,63),(55,76),(55,77),(55,81),(55,82),(55,85),(55,86),(55,87),(55,88),(55,89),(55,90),(56,98);
/*!40000 ALTER TABLE `accountsgroupsrelation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-01 23:06:38
