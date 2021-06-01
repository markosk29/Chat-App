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
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `notification_date` varchar(50) NOT NULL,
  `notification_message` varchar(100) NOT NULL,
  `notification_read` tinyint(1) NOT NULL,
  `notification_destination` int NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notification_destination` (`notification_destination`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`notification_destination`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'2021-06-1','Welcome to our chat app!',0,48),(2,'2021-06-1','Welcome to our chat app!',0,49),(3,'2021-06-1','Welcome to our chat app!',0,50),(4,'2021-06-1 | 03:10','Welcome to our chat app!',0,51),(5,'2021-6-01 | 03:11','Welcome to our chat app!',0,52),(6,'2021-05-01 | 03:17','Welcome to our chat app!',0,53),(7,'2021-06-01 | 03:19','Welcome to our chat app!',0,54),(8,'2021-6-1 3:28:38','You have joined the chat \' \'',0,53),(9,'2021-6-1 3:30:3','You have joined the chat \' \'',0,53),(10,' | 03:33','You have joined the chat \' cool chat\'',0,53),(11,'2021-06-01 | 03:36','You have joined the chat \' chat2\'.',0,53),(12,'2021-06-01 | 03:38','Welcome to our chat app!',1,55),(13,'2021-06-01 | 03:38','You have joined the chat \' group1\'.',1,55),(14,'2021-06-01 | 03:38','You have joined the chat \' group2\'.',1,55),(15,'2021-06-01 | 03:39','You have joined the chat \' group3\'.',1,55),(16,'2021-06-01 | 03:39','You have joined the chat \' group4\'.',1,55),(17,'2021-06-01 | 03:40','You have joined the chat \' group10\'.',1,55),(18,'2021-06-01 | 03:41','You have joined the chat \' group11\'.',1,55),(19,'2021-06-01 | 03:41','You have joined the chat \' group12\'.',1,55),(20,'2021-06-01 | 03:43','You have joined the chat \' group13\'.',1,55),(21,'2021-06-01 | 03:44','You have joined the chat \' group14\'.',1,55),(22,'2021-06-01 | 03:44','You have joined the chat \' group15\'.',1,55),(23,'2021-06-01 | 03:44','You have joined the chat \' group16\'.',1,55),(24,'2021-06-01 | 03:46','You have joined the chat \' group17\'.',1,55),(25,'2021-06-01 | 03:46','You have joined the chat \' group18\'.',1,55),(26,'2021-06-01 | 03:47','You have joined the chat \' group19\'.',1,55),(27,'2021-06-01 | 03:47','You have joined the chat \' group20\'.',1,55),(28,'2021-06-01 | 03:47','You have joined the chat \' group21\'.',1,55),(29,'2021-06-01 | 03:48','You have joined the chat \' group22\'.',1,55),(30,'2021-06-01 | 03:50','You have joined the chat \' group23\'.',1,55),(31,'2021-06-01 | 03:52','You have joined the chat \' asd\'.',1,55),(32,'2021-06-01 | 03:53','You have joined the chat \' 123\'.',1,55),(33,'2021-06-01 | 03:54','You have joined the chat \' a\'.',1,55),(34,'2021-06-01 | 03:55','You have joined the chat \' d\'.',1,55),(35,'2021-06-01 | 03:55','You have joined the chat \' e\'.',1,55),(36,'2021-06-01 | 03:55','You have joined the chat \' name1\'.',1,55),(37,'2021-06-01 | 03:55','You have joined the chat \' name2\'.',1,55),(38,'2021-06-01 | 04:03','You have joined the chat \' xd\'.',1,55),(39,'2021-06-01 | 04:03','You have joined the chat \' xd2\'.',1,55),(40,'2021-06-01 | 04:05','You have joined the chat \' w\'.',1,55),(41,'2021-06-01 | 04:06','You have joined the chat \' xx\'.',1,55),(42,'2021-06-01 | 04:06','You have joined the chat \' xxx\'.',1,55),(43,'2021-06-01 | 04:08','You have joined the chat \' q\'.',1,55),(44,'2021-06-01 | 04:08','You have joined the chat \' qqq\'.',1,55),(45,'2021-06-01 | 04:11','You have joined the chat \' t\'.',1,55),(46,'2021-06-01 | 04:11','You have joined the chat \' tt\'.',1,55),(47,'2021-06-01 | 04:11','You have joined the chat \' t\'.',1,55),(48,'2021-06-01 | 04:13','You have joined the chat \' r\'.',1,55),(49,'2021-06-01 | 04:13','You have joined the chat \' rr\'.',1,55),(50,'2021-06-01 | 04:13','You have joined the chat \' rr\'.',1,55),(51,'2021-06-01 | 04:13','You have joined the chat \' r\'.',0,55),(52,'2021-06-01 | 04:13','You have joined the chat \' r\'.',0,55),(53,'2021-06-01 | 04:13','You have joined the chat \' rr\'.',0,55),(54,'2021-06-01 | 04:13','You have joined the chat \' rr\'.',0,55),(55,'2021-06-01 | 04:13','You have joined the chat \' r\'.',0,55),(56,'2021-06-01 | 04:13','You have joined the chat \' rr\'.',0,55),(57,'2021-06-01 | 04:13','You have joined the chat \' r\'.',0,55),(58,'2021-06-01 | 04:13','You have joined the chat \' r\'.',0,55),(59,'2021-06-01 | 04:13','You have joined the chat \' r\'.',0,55),(60,'2021-06-01 | 04:17','You have joined the chat \' ff\'.',0,55),(61,'2021-06-01 | 04:17','You have joined the chat \' fff\'.',0,55),(62,'2021-06-01 | 04:17','You have joined the chat \' ff\'.',0,55),(63,'2021-06-01 | 04:18','You have joined the chat \' l\'.',0,55),(64,'2021-06-01 | 04:18','You have joined the chat \' lll\'.',0,55),(65,'2021-06-01 | 04:18','You have joined the chat \' l\'.',0,55),(66,'2021-06-01 | 15:59','You have joined the chat \' q\'.',0,55),(67,'2021-06-01 | 15:59','You have joined the chat \' qweq\'.',0,55),(68,'2021-06-01 | 15:59','You have joined the chat \' qweqweq\'.',0,55),(69,'2021-06-01 | 15:59','You have joined the chat \' asdadad\'.',0,55),(70,'2021-06-01 | 15:59','You have joined the chat \' asdsadad\'.',0,55),(71,'2021-06-01 | 15:59','You have joined the chat \' asdadasd\'.',0,55),(72,'2021-06-01 | 15:59','You have joined the chat \' adsadasdada\'.',0,55),(73,'2021-06-01 | 16:55','Welcome to our chat app!',1,56),(74,'2021-06-01 | 16:59','Welcome to our chat app!',0,57),(75,'2021-06-01 | 17:14','You have joined the chat \' a\'.',1,56),(76,'2021-06-01 | 17:14','You have joined the chat \' b\'.',1,56),(77,'2021-06-01 | 17:14','You have joined the chat \' c\'.',1,56),(78,'2021-06-01 | 17:15','You have joined the chat \' group1\'.',1,56),(79,'2021-06-01 | 17:15','You have joined the chat \' group2\'.',1,56),(80,'2021-06-01 | 17:15','You have joined the chat \' group3\'.',1,56),(81,'2021-06-01 | 17:15','You have joined the chat \' group4\'.',1,56),(82,'2021-06-01 | 17:15','You have joined the chat \' group5\'.',1,56),(83,'2021-06-01 | 17:16','You have joined the chat \' \'.',1,56),(84,'2021-06-01 | 21:35','You have been added to \'asd\' by \'ketchup\'.',0,55),(85,'2021-06-01 | 21:36','Welcome to our chat app!',0,58),(86,'2021-06-01 | 21:36','You have been added to \'asd\' by \'ketchup\'.',0,55),(87,'2021-06-01 | 21:39','You have joined the chat \' cool chat\'.',1,58),(88,'2021-06-01 | 21:39','You have been added to \'cool chat\' by \'aserehe\'.',0,56),(89,'2021-06-01 | 22:19','Username updated!',1,58),(90,'2021-06-01 | 22:19','Username updated!',1,58),(91,'2021-06-01 | 22:20','Username updated!',1,58),(92,'2021-06-01 | 22:21','Username updated!',1,58),(93,'2021-06-01 | 22:25','Username updated!',1,58),(94,'2021-06-01 | 22:25','Username updated!',1,58),(95,'2021-06-01 | 22:28','Username updated!',1,58),(96,'2021-06-01 | 22:28','Username updated!',1,58),(97,'2021-06-01 | 22:30','Username updated!',1,58),(98,'2021-06-01 | 22:30','Username updated!',1,58),(99,'2021-06-01 | 22:32','Username updated!',1,58),(100,'2021-06-01 | 22:32','Username updated!',1,58),(101,'2021-06-01 | 22:39','Username updated!',1,58),(102,'2021-06-01 | 22:40','Username updated!',0,58),(103,'2021-06-01 | 22:40','Password updated!',0,58);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
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
