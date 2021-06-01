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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_username` varchar(150) NOT NULL,
  `account_password` varchar(300) NOT NULL,
  `account_email` varchar(150) NOT NULL,
  `account_phone` varchar(15) DEFAULT NULL,
  `account_date` date NOT NULL,
  `account_profilepic` varchar(50) DEFAULT NULL,
  `account_info` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (23,'marcel','d70d88cd9adf9f928472cc95f58b1415a985df03f4e23841304ea1d1db05433e','marcel@gmail.com',NULL,'2021-05-31',NULL,NULL),(24,'jeff','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff@gmail.com',NULL,'2021-06-01',NULL,NULL),(25,'jeff','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff@gmail.com',NULL,'2021-06-01',NULL,NULL),(26,'jeff100','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff100@gmail.com',NULL,'2021-06-01',NULL,NULL),(27,'jeff100','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff100@gmail.com',NULL,'2021-06-01',NULL,NULL),(28,'superjeff','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','superjeff@gmail.com',NULL,'2021-06-01',NULL,NULL),(29,'superjeff','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','superjeff@gmail.com',NULL,'2021-06-01',NULL,NULL),(30,'superjeff2','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','superjeff2@gmail.com',NULL,'2021-06-01',NULL,NULL),(31,'superjeff2','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','superjeff2@gmail.com',NULL,'2021-06-01',NULL,NULL),(32,'jeff3','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff3@gmail.com',NULL,'2021-06-01',NULL,NULL),(33,'jeff3','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff3@gmail.com',NULL,'2021-06-01',NULL,NULL),(34,'jeff4','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff4@gmail.com',NULL,'2021-06-01',NULL,NULL),(35,'jeff5','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff5@gmail.com',NULL,'2021-06-01',NULL,NULL),(36,'jeff8','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff8@gmail.com',NULL,'2021-06-01',NULL,NULL),(37,'jeff8','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff8@gmail.com',NULL,'2021-06-01',NULL,NULL),(38,'jeff9','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff9@gmail.com',NULL,'2021-06-01',NULL,NULL),(39,'jeff9','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff9@gmail.com',NULL,'2021-06-01',NULL,NULL),(40,'jeff10','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff10@gmail.com',NULL,'2021-06-01',NULL,NULL),(41,'jeff11','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff11@gmail.com',NULL,'2021-06-01',NULL,NULL),(42,'jeff11','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff11@gmail.com',NULL,'2021-06-01',NULL,NULL),(43,'jeff12','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff12@gmail.com',NULL,'2021-06-01',NULL,NULL),(44,'jeff12','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff12@gmail.com',NULL,'2021-06-01',NULL,NULL),(45,'jeff13','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff13@gmail.com',NULL,'2021-06-01',NULL,NULL),(46,'jeff14','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff14@gmail.com',NULL,'2021-06-01',NULL,NULL),(47,'jeff15','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff15@gmail.com',NULL,'2021-06-01',NULL,NULL),(48,'jeff16','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff16@gmail.com',NULL,'2021-06-01',NULL,NULL),(49,'jeff17','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff17@gmail.com',NULL,'2021-06-01',NULL,NULL),(50,'jeff18','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff18@gmail.com',NULL,'2021-06-01',NULL,NULL),(51,'jeff19','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff19@gmail.com',NULL,'2021-06-01',NULL,NULL),(52,'jeff20','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff20@gmail.com',NULL,'2021-06-01',NULL,NULL),(53,'jeff21','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff21@gmail.com',NULL,'2021-05-01',NULL,NULL),(54,'jeff23','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','jeff23@gmail.com',NULL,'2021-06-01',NULL,NULL),(55,'ketchup','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','ketchup@gmail.com',NULL,'2021-06-01',NULL,NULL),(56,'arnold','d70d88cd9adf9f928472cc95f58b1415a985df03f4e23841304ea1d1db05433e','arnold@gmail.com',NULL,'2021-06-01',NULL,NULL),(57,'arnold2','9d13390916faa8b68abbd745a3231cd84676bb62eafd7e6e9db0452d757accff','arnold2@gmail.com',NULL,'2021-06-01',NULL,NULL),(58,'aserehe','d70d88cd9adf9f928472cc95f58b1415a985df03f4e23841304ea1d1db05433e','aserehe@gmail.com',NULL,'2021-06-01',NULL,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
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
