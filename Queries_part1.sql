-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: localhost    Database: lab3_telecommunication_company
-- ------------------------------------------------------
-- Server version	8.0.41

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

CREATE DATABASE lab3;
USE lab3;

--
-- Table structure for table `assignments`
--
 
DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `assignment_number` int NOT NULL,
  `assignment_date` date DEFAULT NULL,
  `project_number` int NOT NULL,
  `employee_number` int NOT NULL,
  `assignment_job` varchar(100) DEFAULT NULL,
  `assignment_chg_hr` decimal(10,2) DEFAULT NULL,
  `assignment_hours` int DEFAULT NULL,
  `assignment_charge` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`assignment_number`),
  KEY `project_number` (`project_number`),
  KEY `employee_number` (`employee_number`),
  CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`project_number`) REFERENCES `projects` (`project_number`),
  CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`employee_number`) REFERENCES `employees` (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,'2025-01-10',101,1,'Network Maintenance',25.00,8,200.00),(2,'2025-02-11',102,2,'Fiber Installation',30.00,6,180.00),(3,'2025-03-12',103,3,'System Upgrade',35.00,7,245.00),(4,'2025-04-13',104,4,'Security Enhancement',40.00,5,200.00),(5,'2025-05-14',101,5,'5G Expansion',50.00,10,500.00),(6,'2025-06-10',102,1,'Fiber Installation',25.00,10,250.00);
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_number` int NOT NULL,
  `employee_last_name` varchar(50) DEFAULT NULL,
  `employee_first_name` varchar(50) DEFAULT NULL,
  `employee_initial` char(1) DEFAULT NULL,
  `job_code` int NOT NULL,
  `employee_hire_date` date DEFAULT NULL,
  `employee_years` int DEFAULT NULL,
  `employee_email` varchar(100) DEFAULT NULL,
  `employee_phone_number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`employee_number`),
  KEY `job_code` (`job_code`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`job_code`) REFERENCES `jobs` (`job_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Smith','John','A',1,'2020-06-15',5,'john.smith@telecom.com','123-456-7890'),(2,'Johnson','Emily','B',2,'2021-07-20',4,'emily.johnson@telecom.com','123-456-7891'),(3,'Brown','Michael','C',3,'2019-08-25',6,'michael.brown@telecom.com','123-456-7892'),(4,'Williams','Sarah','D',4,'2022-05-12',3,'sarah.williams@telecom.com','123-456-7893'),(5,'Jones','David','E',5,'2018-11-30',7,'david.jones@telecom.com','123-456-7894'),(6,'Garcia','Anna','F',6,'2017-03-18',8,'anna.garcia@telecom.com','123-456-7895'),(7,'Martinez','James','G',7,'2016-12-22',9,'james.martinez@telecom.com','123-456-7896'),(8,'Hernandez','Laura','H',8,'2020-09-14',5,'laura.hernandez@telecom.com','123-456-7897'),(9,'Lopez','Robert','I',9,'2015-08-01',10,'robert.lopez@telecom.com','123-456-7898'),(10,'Gonzalez','Maria','J',10,'2021-01-29',3,'maria.gonzalez@telecom.com','123-456-7899'),(11,'Taylor','Chris','K',2,'2019-10-10',5,'chris.taylor@telecom.com','123-456-7900'),(12,'Anderson','Jessica','L',2,'2020-04-15',4,'jessica.anderson@telecom.com','123-456-7901'),(13,'Thomas','Daniel','M',2,'2018-09-25',6,'daniel.thomas@telecom.com','123-456-7902'),(14,'Thompson','Johnson','M',2,'2018-10-02',6,'johnson.thompson@telecom.com','123-456-7932');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `job_code` int NOT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `job_chg_hour` decimal(10,2) DEFAULT NULL,
  `job_last_update` date DEFAULT NULL,
  PRIMARY KEY (`job_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Network Technician',25.00,'2024-03-01'),(2,'Field Engineer',30.00,'2024-03-02'),(3,'System Administrator',35.00,'2023-03-01'),(4,'Customer Support Specialist',20.00,'2023-03-02'),(5,'Telecom Manager',50.00,'2025-05-03'),(6,'IT Project Manager',45.00,'2025-02-03'),(7,'Cable Installer',22.00,'2025-03-01'),(8,'Security Analyst',40.00,'2025-01-02'),(9,'Wireless Engineer',38.00,'2025-01-04'),(10,'Data Analyst',32.00,'2025-03-05'),(11,'Operations Supervisor',42.00,'2022-08-05');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `project_number` int NOT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `project_value` decimal(15,2) DEFAULT NULL,
  `project_balance` decimal(15,2) DEFAULT NULL,
  `employee_number` int NOT NULL,
  PRIMARY KEY (`project_number`),
  KEY `employee_number` (`employee_number`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `employees` (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (101,'5G Network Expansion',100000.00,75000.00,5),(102,'Fiber Optic Installation',60000.00,40000.00,10),(103,'Customer Service System Upgrade',45000.00,25000.00,4),(104,'Network Security Enhancement',80000.00,55000.00,11);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-22 16:15:02
