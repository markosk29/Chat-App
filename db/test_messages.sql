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
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_date` time NOT NULL,
  `message_sender_id` int NOT NULL,
  `message_content` varchar(500) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `message_sender_id` (`message_sender_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`message_sender_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (25,'03:55:02',55,'entered the chat'),(26,'03:55:03',55,'entered the chat'),(27,'03:55:48',55,'entered the chat'),(28,'03:55:55',55,'entered the chat'),(29,'03:59:20',55,'hhi'),(30,'04:03:42',55,'entered the chat'),(31,'04:03:43',55,'entered the chat'),(32,'04:05:09',55,'hi'),(33,'04:05:43',55,'entered the chat'),(34,'04:06:05',55,'entered the chat'),(35,'04:06:06',55,'entered the chat'),(36,'04:08:28',55,'entered the chat'),(37,'04:08:29',55,'entered the chat'),(38,'04:11:21',55,'entered the chat'),(39,'04:11:22',55,'entered the chat'),(40,'04:13:28',55,'entered the chat'),(41,'04:13:29',55,'entered the chat'),(42,'04:13:29',55,'entered the chat'),(43,'04:13:28',55,'entered the chat'),(44,'04:13:28',55,'entered the chat'),(45,'04:13:29',55,'entered the chat'),(46,'04:13:29',55,'entered the chat'),(47,'04:13:28',55,'entered the chat'),(48,'04:13:29',55,'entered the chat'),(49,'04:13:28',55,'entered the chat'),(50,'04:13:28',55,'entered the chat'),(51,'04:13:29',55,'entered the chat'),(52,'04:13:29',55,'entered the chat'),(53,'04:13:28',55,'entered the chat'),(54,'04:17:03',55,'entered the chat'),(55,'04:17:04',55,'entered the chat'),(56,'04:17:03',55,'entered the chat'),(57,'04:17:03',55,'entered the chat'),(58,'04:18:18',55,'entered the chat'),(59,'04:18:20',55,'entered the chat'),(60,'04:18:18',55,'entered the chat'),(61,'04:21:49',55,'aaaaaaaaaa'),(62,'04:21:53',55,'aaaaa'),(63,'04:21:56',55,'aa'),(64,'15:59:45',55,'entered the chat'),(65,'15:59:47',55,'entered the chat'),(66,'15:59:47',55,'entered the chat'),(67,'15:59:50',55,'entered the chat'),(68,'15:59:51',55,'entered the chat'),(69,'15:59:52',55,'entered the chat'),(70,'15:59:53',55,'entered the chat'),(71,'16:01:59',55,'asdad'),(72,'16:02:09',55,'adada'),(73,'16:10:55',55,'hi'),(74,'16:13:24',55,'a'),(75,'16:19:42',55,'qqqqqqqqqqqqqqqqq'),(76,'16:19:44',55,'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq'),(77,'17:14:43',56,'entered the chat'),(78,'17:14:44',56,'entered the chat'),(79,'17:14:49',56,'aaaaaa'),(80,'17:14:52',56,'entered the chat'),(81,'17:15:25',56,'entered the chat'),(82,'17:15:28',56,'entered the chat'),(83,'17:15:30',56,'entered the chat'),(84,'17:15:32',56,'entered the chat'),(85,'17:15:35',56,'entered the chat'),(86,'17:15:42',56,'asdada'),(87,'17:15:46',56,'asdada'),(88,'17:16:14',56,'entered the chat'),(89,'17:16:24',56,''),(90,'17:16:25',56,'ada'),(91,'21:19:47',55,'sup'),(92,'21:19:53',55,'hello'),(93,'21:39:42',58,'entered the chat');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
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
