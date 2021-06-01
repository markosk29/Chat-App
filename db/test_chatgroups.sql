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
-- Table structure for table `chatgroups`
--

DROP TABLE IF EXISTS `chatgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatgroups` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatgroups`
--

LOCK TABLES `chatgroups` WRITE;
/*!40000 ALTER TABLE `chatgroups` DISABLE KEYS */;
INSERT INTO `chatgroups` VALUES (1,'asd'),(2,'asd2'),(3,'asd'),(4,'www'),(5,'awww'),(6,'grouuup'),(7,'aww'),(16,'a'),(17,'b'),(18,'c'),(19,'d'),(20,'e'),(21,'asd'),(22,'my chat'),(23,'cool chat'),(24,'chat2'),(25,'group1'),(26,'group2'),(27,'group3'),(28,'group4'),(29,'group10'),(30,'group11'),(31,'group12'),(32,'group13'),(33,'group14'),(34,'group15'),(35,'group16'),(36,'group17'),(37,'group18'),(38,'group19'),(39,'group20'),(40,'group21'),(41,'group22'),(42,'group22'),(43,'group21'),(44,'group23'),(45,'asd'),(46,'123'),(47,'a'),(48,'d'),(49,'e'),(50,'name1'),(51,'name2'),(52,'xd'),(53,'xd2'),(54,'w'),(55,'xx'),(56,'xxx'),(57,'q'),(58,'qqq'),(59,'t'),(60,'tt'),(61,'t'),(62,'r'),(63,'rr'),(64,'rr'),(65,'r'),(66,'r'),(67,'rr'),(68,'r'),(69,'rr'),(70,'rr'),(71,'r'),(72,'r'),(73,'rr'),(74,'rr'),(75,'r'),(76,'ff'),(77,'fff'),(78,'ff'),(79,'fff'),(80,'fff'),(81,'l'),(82,'lll'),(83,'l'),(84,'q'),(85,'qweq'),(86,'qweqweq'),(87,'asdadad'),(88,'asdsadad'),(89,'asdadasd'),(90,'adsadasdada'),(91,'a'),(92,'b'),(93,'c'),(94,'group1'),(95,'group2'),(96,'group3'),(97,'group4'),(98,'group5'),(100,'cool chat');
/*!40000 ALTER TABLE `chatgroups` ENABLE KEYS */;
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
