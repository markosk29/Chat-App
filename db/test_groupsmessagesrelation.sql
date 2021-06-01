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
-- Table structure for table `groupsmessagesrelation`
--

DROP TABLE IF EXISTS `groupsmessagesrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupsmessagesrelation` (
  `group_id` int NOT NULL,
  `message_id` int NOT NULL,
  UNIQUE KEY `group_id` (`group_id`,`message_id`),
  KEY `message_id` (`message_id`),
  CONSTRAINT `groupsmessagesrelation_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `chatgroups` (`group_id`),
  CONSTRAINT `groupsmessagesrelation_ibfk_2` FOREIGN KEY (`message_id`) REFERENCES `messages` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupsmessagesrelation`
--

LOCK TABLES `groupsmessagesrelation` WRITE;
/*!40000 ALTER TABLE `groupsmessagesrelation` DISABLE KEYS */;
INSERT INTO `groupsmessagesrelation` VALUES (19,25),(20,26),(50,27),(51,28),(25,29),(52,30),(53,31),(1,32),(54,33),(55,34),(56,35),(57,36),(58,37),(59,38),(60,39),(62,40),(63,41),(76,54),(77,55),(81,58),(82,59),(60,61),(53,62),(53,63),(57,64),(85,65),(86,65),(87,67),(88,68),(89,69),(90,70),(16,71),(25,72),(29,73),(33,74),(16,75),(16,76),(16,77),(17,78),(17,79),(18,80),(25,81),(26,82),(27,83),(28,84),(98,85),(28,86),(98,87),(16,89),(16,90),(16,91),(16,92),(23,93);
/*!40000 ALTER TABLE `groupsmessagesrelation` ENABLE KEYS */;
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
