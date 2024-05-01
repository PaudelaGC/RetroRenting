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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Caballero','53','','2','4','05037','Barcelona','Cataluña','España'),(8,'Gran Via','12','','','','08194','Barcelona','Cataluña','España'),(9,'Providencia','3','1','2','2','08193','Rubi','Cataluña','España'),(10,'Espiritu','155','','','','23191','Villa vieja','-','Argentina'),(11,'Clearwater','33','','5','8','37281','San Francisco','Oregon','Estados Unidos');
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'Wii + Mario Galaxy','El primer juego de la saga Mario Galaxy','mariogalaxy.jpg',10,30,1,NULL,NULL),(2,1,'Pokémon Rojo Fuego','Solo viene el juego la consola la vendí','redfire.jpg',25,60,0,'2024-04-28','2024-06-27'),(3,12,'Nintendo 64 con Super Mario 64','Por si alguien lo quiere probar, está chulo','mario64.jpg',5,7,1,NULL,NULL),(4,12,'Tekken 1994','Alguien se echa unas partidas conmigo?','tekken.jpg',1,1,1,NULL,NULL),(5,13,'ATARI PONG ORIGINAL','La primera consola del mundo! Quieres vivir la experiencia de probarla?','atari.jpg',10,1,1,NULL,NULL),(6,13,'Crash Bandicoot Racing PS1','Perfecto para jugar con amigos','crash.jpg',8,4,0,'2024-04-29','2024-05-03'),(7,14,'PSP','Solo tengo la consola, no vienen juegos','psp.jpg',5,12,1,NULL,NULL),(8,14,'Sonic Rush','Un juegazo de Sonic para la DS uno de los mejores','sonicrush.jpg',15,14,0,'2024-05-01','2024-05-15'),(9,15,'Gameboy y Pokémon pinball','Es la gameboy micro y es bastante pequeña y está un poco cascada, hay que tener cuidado','pokepinball.jpg',7,7,1,NULL,NULL),(10,15,'Zelda Ocarina of Time','Me lo he encontrado por un cajón y ya no tengo la consola así que no lo puedo aprovechar','zelda.jpg',25,45,1,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,1,1,4,'2024-04-24'),(21,1,13,3,'2024-04-24'),(22,2,1,8,'2024-04-24'),(23,3,1,9,'2024-04-24'),(24,1,15,1,'2024-04-24'),(25,3,14,1,'2024-04-24'),(26,1,12,10,'2024-04-24'),(27,1,1,5,'2024-05-01');
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
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `idAddress` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nestor','Tur','nestor.tur@gmail.com','$2b$12$mh7PcE4/7aGEqrKkB66YuuzSmOWQOE8zSipsI.jvp0ySsB0ouP5BC','2002-08-23',1),(12,'Pau','Guillén','pau.guillen@gmail.com','$2b$12$mh7PcE4/7aGEqrKkB66YuuzSmOWQOE8zSipsI.jvp0ySsB0ouP5BC','1999-12-19',8),(13,'Andres','Guastavino','andres.guastavino@gmail.com','$2b$12$mh7PcE4/7aGEqrKkB66YuuzSmOWQOE8zSipsI.jvp0ySsB0ouP5BC','1999-11-11',9),(14,'Ferran','Gómez','ferran.gomez@gmail.com','$2b$12$mh7PcE4/7aGEqrKkB66YuuzSmOWQOE8zSipsI.jvp0ySsB0ouP5BC','1999-11-11',10),(15,'Nerea','Ruiz','nerea.ruiz@gmail.com','$2b$12$mh7PcE4/7aGEqrKkB66YuuzSmOWQOE8zSipsI.jvp0ySsB0ouP5BC','1999-11-11',11);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'retrorenting'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `actualizar_alquileres` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `actualizar_alquileres` ON SCHEDULE EVERY 1 DAY STARTS '2024-05-01 14:46:14' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE posts
    SET available = TRUE, lastRentDate = NULL, lastReturnDate = NULL
    WHERE lastReturnDate <= CURRENT_DATE() AND available = FALSE */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-01 20:03:09
