-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: retrorenting
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(255) NOT NULL,
  `number` varchar(10) NOT NULL,
  `block` varchar(5) DEFAULT NULL,
  `door` varchar(10) DEFAULT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `postal_code` varchar(5) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'calle caballero','53','','2','4','05037','Barcelona','Spain','Spain'),(2,'Sants estacio','32',NULL,'1','1','03021','Barcelona','Spain','Spain');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_history`
--

DROP TABLE IF EXISTS `billing_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idRequest` int NOT NULL,
  `billingDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `BILLINGHISTORY_REQUESTS_FK_idx` (`id`),
  KEY `BILLINGHISTORY_REQUESTS_FK` (`idRequest`),
  CONSTRAINT `BILLINGHISTORY_REQUESTS_FK` FOREIGN KEY (`idRequest`) REFERENCES `requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_history`
--

LOCK TABLES `billing_history` WRITE;
/*!40000 ALTER TABLE `billing_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUser` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `duration` int NOT NULL,
  `available` tinyint NOT NULL,
  `lastRentDate` date DEFAULT NULL,
  `lastReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `POSTS_USERS_FK_idx` (`id`),
  KEY `POSTS_USERS_FK` (`idUser`),
  CONSTRAINT `POSTS_USERS_FK` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'Vendo Wii y Mario Galaxy','Hola, estoy poniendo mi Wii para alquilar, seran 7 dias y 40€','71gOWJnWXaL._AC_UF894,1000_QL80_.jpg',40,7,0,NULL,NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idStatus` int NOT NULL,
  `idUser` int NOT NULL,
  `idPost` int NOT NULL,
  `requestDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `REQUESTS_STATUS_FK_idx` (`id`),
  KEY `REQUESTS_USERS_FK_idx` (`id`),
  KEY `REQUESTS_POSTS_FK_idx` (`id`),
  KEY `REQUESTS_STATUS_FK` (`idStatus`),
  KEY `REQUESTS_USERS_FK_idx1` (`idUser`),
  KEY `REQUESTS_POSTS_FK` (`idPost`),
  CONSTRAINT `REQUESTS_POSTS_FK` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`),
  CONSTRAINT `REQUESTS_STATUS_FK` FOREIGN KEY (`idStatus`) REFERENCES `status` (`id`),
  CONSTRAINT `REQUESTS_USERS_FK` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,1,2,1,'2024-04-17');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Pending'),(2,'Denied'),(3,'Accepted'),(4,'Completed');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `idAddress` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `USERS_ADRESSES_FK_idx` (`idAddress`),
  CONSTRAINT `USERS_ADRESSES_FK` FOREIGN KEY (`idAddress`) REFERENCES `addresses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nestor','Tur','nestor.tur.ntf@gmail.com','1234567','2002-08-23',1),(2,'Pau','Guillen','pauguillen@nomesetucorreo.com','7654321','2000-12-21',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'retrorenting'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-19 11:28:56
