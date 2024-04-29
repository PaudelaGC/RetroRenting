CREATE DATABASE  IF NOT EXISTS `retrorenting` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `retrorenting`;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'calle caballero','53','','2','4','05037','Barcelona','Spain','Spain'),(8,'dfa','12','','','','ad','ad','ad','EspaÃ±a'),(9,'dfa','12','','','','ad','ad','ad','EspaÃ±a'),(10,'dfa','12','','','','ad','ad','ad','EspaÃ±a');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'Vendo Wii y Mario Galaxy','Hola, estoy poniendo mi Wii para alquilar, seran 7 dias y 40€','71gOWJnWXaL._AC_UF894,1000_QL80_.jpg',40,7,1,NULL,NULL),(33,12,'Post a vender','dfhahkf','adfa',10,7,0,'2024-04-29','2024-05-06'),(34,12,'Ejemplo','dadf','dfad',15,500,1,NULL,NULL),(35,13,'Nuevo item','Este es mi nuevo item','default',135,14,1,NULL,NULL),(36,13,'Nuevo item 2','La version mejorada','default',136,14,1,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (2,1,12,1,'2024-04-29'),(3,2,13,33,'2024-04-29'),(4,4,13,33,'2024-04-29'),(5,1,13,1,'2024-04-29'),(6,5,-1,1,'2024-04-29');
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
INSERT INTO `status` VALUES (1,'Pending'),(2,'Denied'),(3,'Accepted'),(4,'Completed'),(5,'Deleted');
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
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `idAddress` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (-1,'deleted','user','null','null','1999-11-11',-1),(1,'Nestor','Tur','nestor.tur.ntf@gmail.com','1234567','2002-08-23',1),(12,'Pau','GuillÃ©n Carranza','example@gmail.com','$2b$12$KZqnXv9ENhgpyoMY6j9jXef2pSeQetnG29NjUTlRxgZ1dInv7m8ui','1999-11-11',8),(13,'Nestor2','Nestor2','example2@gmail.com','$2b$12$mh7PcE4/7aGEqrKkB66YuuzSmOWQOE8zSipsI.jvp0ySsB0ouP5BC','1999-11-11',9),(14,'NEw','User','newuser@gmail.com','$2b$12$K15rWiUQ/NA.xYjKqmKututC2iedAZKdHl3zLn.voH45MB9CsmVri','1999-11-11',10);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29 14:08:36
