CREATE DATABASE  IF NOT EXISTS `notes_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `notes_db`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: notes_db
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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Ciencia'),(2,'Programacion'),(3,'Idiomas'),(4,'Entretenimiento'),(5,'Actualidad'),(6,'Filosofia'),(7,'Música'),(8,'Literatura'),(9,'Política'),(10,'Economía');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `erase_note` tinyint NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_notes_category_idx` (`category_id`),
  CONSTRAINT `FK_notes_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'Computación que potencia a la industria aeroespacial','2020-09-03','2021-04-04','In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.',1,2),(2,'Nuevamente investigadores del DC fueron premiados por Google','2020-03-05','2021-07-01','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',1,2),(3,'Matemática y fascinación','2020-09-30','2021-01-31','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',1,1),(4,'Ingeniería matemática y emprendedurismo','2020-07-18','2021-05-02','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',1,1),(5,'Matemática para la mochila','2020-11-15','2021-12-21','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',0,1),(6,'Desbordes humorísticos: estéticas plurales y liminales','2020-02-24','2021-10-23','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',0,6),(7,'The Doors: encuentran el demo original de “Riders on the Storm”','2020-04-19','2021-01-26','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',0,7),(8,'Tan viernes, tan ciencia','2020-06-01','2021-05-03','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',1,1),(9,'Furia de Gobierno con Contencioso por \"fugaducto\" de dólares en las cautelares para importadores','2020-04-23','2021-02-09','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',1,9),(10,'Por qué septiembre puede ser un mes positivo para invertir en criptomonedas','2020-05-10','2021-12-19','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',0,10);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_notes_idx` (`notes_id`),
  CONSTRAINT `FK_users_notes` FOREIGN KEY (`notes_id`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Noby Tunnicliffe','ntunnicliffe0@soup.io',1),(2,'Clo Rainey','crainey1@mozilla.com',2),(3,'Gordon Carvell','gcarvell2@theglobeandmail.com',3),(4,'Gerik Trimby','gtrimby3@sourceforge.net',4),(5,'Kathe Ruddom','kruddom4@ox.ac.uk',5),(6,'Marj Heigl','mheigl5@sfgate.com',6),(7,'Timmie Dabnor','tdabnor6@apache.org',7),(8,'Dominica Strangeway','dstrangeway7@ow.ly',8),(9,'Cecelia Gainseford','cgainseford8@ucsd.edu',9),(10,'Delmor Whissell','dwhissell9@shinystat.com',10);
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

-- Dump completed on 2021-09-03 14:36:31
