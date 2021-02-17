-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: student
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `postal_code` char(5) NOT NULL,
  `city` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`postal_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('46702','Gandia'),('46703','Benirredra'),('46710','Daimus'),('46723','Almoines'),('46727','Real_gandia');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll` (
  `reg` int NOT NULL,
  `subject_code` char(4) NOT NULL,
  `mark` float(3,1) unsigned DEFAULT NULL,
  PRIMARY KEY (`reg`,`subject_code`),
  KEY `subject_code` (`subject_code`),
  CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`reg`) REFERENCES `student` (`reg`),
  CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`subject_code`) REFERENCES `subject` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll`
--

LOCK TABLES `enroll` WRITE;
/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
INSERT INTO `enroll` VALUES (1,'ISO',7.0),(1,'LMI',6.0),(2,'BBDD',4.0),(3,'LMI',6.0),(4,'PAX',9.0);
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `reg` int NOT NULL AUTO_INCREMENT,
  `dni` char(9) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `birthdate` date NOT NULL,
  `street` varchar(60) DEFAULT NULL,
  `number` int unsigned DEFAULT NULL,
  `age` int unsigned DEFAULT NULL,
  `postal_code` char(5) DEFAULT NULL,
  PRIMARY KEY (`reg`),
  UNIQUE KEY `dni` (`dni`),
  KEY `postal_code` (`postal_code`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`postal_code`) REFERENCES `city` (`postal_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'11223344A','Raul','1998-12-23','Carrer Ample',3,21,'46723'),(2,'22334455B','Emilio','1965-08-16','Carrer Fondo',7,56,'46703'),(3,'44556677N','Xusep','1821-10-18','Carrer python',9,200,'46702'),(4,'69696969X','Carlos','1998-11-15','Carrer sql',5,21,'46723'),(5,'11111111A','Toni','2006-03-23','Carrer joventut',1,15,'46727');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentphone`
--

DROP TABLE IF EXISTS `studentphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentphone` (
  `phone` char(9) NOT NULL,
  `reg` int NOT NULL,
  PRIMARY KEY (`phone`),
  KEY `reg` (`reg`),
  CONSTRAINT `studentphone_ibfk_1` FOREIGN KEY (`reg`) REFERENCES `student` (`reg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentphone`
--

LOCK TABLES `studentphone` WRITE;
/*!40000 ALTER TABLE `studentphone` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `code` char(4) NOT NULL,
  `description` char(25) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('BBDD','the best subject'),('HDW','git status -s'),('ISO','linux sucks'),('LMI','Garrido hacker'),('PAX','alt f4');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-17 12:27:34
