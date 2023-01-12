CREATE DATABASE  IF NOT EXISTS `obtsp_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `obtsp_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: obtsp_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Temporary view structure for view `bus_company`
--

DROP TABLE IF EXISTS `bus_company`;
/*!50001 DROP VIEW IF EXISTS `bus_company`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bus_company` AS SELECT 
 1 AS `bus_ID`,
 1 AS `capacity`,
 1 AS `count_available_seat`,
 1 AS `plate_number`,
 1 AS `company_id`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buses` (
  `bus_ID` int NOT NULL AUTO_INCREMENT,
  `capacity` int NOT NULL,
  `count_available_seat` int NOT NULL,
  `plate_number` varchar(255) NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`bus_ID`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `buses_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `company_ID` int NOT NULL AUTO_INCREMENT,
  `count_bus` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `bus_code` varchar(255) NOT NULL,
  PRIMARY KEY (`company_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_ID` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(255) NOT NULL,
  `Minit` varchar(255) DEFAULT NULL,
  `Lname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_ID` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `booking_id` int NOT NULL,
  `amount_paid` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`payment_ID`),
  UNIQUE KEY `date_UNIQUE` (`date`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `route_ID` int NOT NULL AUTO_INCREMENT,
  `date` varchar(255) NOT NULL,
  `travel_time` varchar(255) DEFAULT NULL,
  `fromm` varchar(255) NOT NULL,
  `too` varchar(255) NOT NULL,
  `bus_id` int NOT NULL,
  PRIMARY KEY (`route_ID`),
  KEY `bus_id` (`bus_id`),
  CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_tickets`
--

DROP TABLE IF EXISTS `search_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_tickets` (
  `ID` int NOT NULL,
  `bus_ID` int NOT NULL,
  `capacity` int NOT NULL,
  `count_available_seat` int NOT NULL,
  `plate_number` varchar(255) NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `fromm` varchar(255) NOT NULL,
  `too` varchar(255) NOT NULL,
  `ticket_price` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `seat_ID` int NOT NULL AUTO_INCREMENT,
  `windows_side` varchar(255) NOT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `number` int NOT NULL,
  `ticket_id` int NOT NULL,
  `bus_id` int NOT NULL,
  PRIMARY KEY (`seat_ID`),
  KEY `ticket_id` (`ticket_id`),
  KEY `bus_id` (`bus_id`),
  CONSTRAINT `seats_ibfk_10` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `seats_ibfk_9` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `ticket_search`
--

DROP TABLE IF EXISTS `ticket_search`;
/*!50001 DROP VIEW IF EXISTS `ticket_search`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ticket_search` AS SELECT 
 1 AS `bus_ID`,
 1 AS `capacity`,
 1 AS `count_available_seat`,
 1 AS `plate_number`,
 1 AS `company_id`,
 1 AS `name`,
 1 AS `fromm`,
 1 AS `too`,
 1 AS `ticket_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ticket_ID` int NOT NULL AUTO_INCREMENT,
  `ticket_price` varchar(255) NOT NULL,
  `seat_number` varchar(255) DEFAULT NULL,
  `customer_id` int NOT NULL,
  `bus_id` int NOT NULL,
  `route_id` int NOT NULL,
  PRIMARY KEY (`ticket_ID`),
  KEY `customer_id` (`customer_id`),
  KEY `bus_id` (`bus_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `tickets_ibfk_13` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_14` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_15` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'obtsp_db'
--

--
-- Dumping routines for database 'obtsp_db'
--

--
-- Final view structure for view `bus_company`
--

/*!50001 DROP VIEW IF EXISTS `bus_company`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bus_company` AS select `b`.`bus_ID` AS `bus_ID`,`b`.`capacity` AS `capacity`,`b`.`count_available_seat` AS `count_available_seat`,`b`.`plate_number` AS `plate_number`,`b`.`company_id` AS `company_id`,`c`.`name` AS `name` from (`buses` `b` join `companies` `c` on((`b`.`company_id` = `c`.`company_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ticket_search`
--

/*!50001 DROP VIEW IF EXISTS `ticket_search`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ticket_search` AS select `b`.`bus_ID` AS `bus_ID`,`b`.`capacity` AS `capacity`,`b`.`count_available_seat` AS `count_available_seat`,`b`.`plate_number` AS `plate_number`,`b`.`company_id` AS `company_id`,`c`.`name` AS `name`,`r`.`fromm` AS `fromm`,`r`.`too` AS `too`,`t`.`ticket_price` AS `ticket_price` from (((`buses` `b` join `companies` `c`) join `routes` `r`) join `tickets` `t` on(((`b`.`company_id` = `c`.`company_ID`) and (`r`.`bus_id` = `b`.`bus_ID`) and (`t`.`bus_id` = `b`.`bus_ID`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-04  2:30:20
