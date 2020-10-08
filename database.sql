-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: testfk
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking`
(
    `booking_id`         int NOT NULL AUTO_INCREMENT,
    `user_id`            int NOT NULL,
    `number_of_adults`   int DEFAULT NULL,
    `number_of_children` int DEFAULT NULL,
    PRIMARY KEY (`booking_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 42
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking`
    DISABLE KEYS */;
INSERT INTO `Booking`
VALUES (1, 1, 1, 0),
       (22, 8, 2, 0),
       (23, 6, 1, 1),
       (24, 9, 1, 0),
       (27, 6, 10, 6),
       (28, 6, 2, 0),
       (30, 2, 5, 0),
       (31, 3, 3, 1),
       (32, 4, 4, 0),
       (33, 2, 3, 1),
       (34, 2, 2, 0),
       (35, 4, 4, 1),
       (36, 4, 3, 0),
       (37, 2, 2, 1);
/*!40000 ALTER TABLE `Booking`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Booking_service`
--

DROP TABLE IF EXISTS `Booking_service`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking_service`
(
    `booking_id`     int  NOT NULL,
    `sub_service_id` int  NOT NULL,
    `price`          int  NOT NULL,
    `target_date`    date NOT NULL,
    PRIMARY KEY (`booking_id`, `sub_service_id`, `target_date`),
    KEY `sub_service_id` (`sub_service_id`),
    KEY `Booking_service_Sub_service_timings_sub_service_id_date_fk` (`sub_service_id`, `target_date`),
    CONSTRAINT `Booking_service_Booking_booking_id_fk` FOREIGN KEY (`booking_id`) REFERENCES `Booking` (`booking_id`) ON DELETE CASCADE,
    CONSTRAINT `Booking_service_Sub_service_timings_sub_service_id_date_fk` FOREIGN KEY (`sub_service_id`, `target_date`) REFERENCES `Sub_service_timings` (`sub_service_id`, `date`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking_service`
--

LOCK TABLES `Booking_service` WRITE;
/*!40000 ALTER TABLE `Booking_service`
    DISABLE KEYS */;
INSERT INTO `Booking_service`
VALUES (28, 53, 1100, '2020-11-11'),
       (30, 1, 1100, '2020-11-11'),
       (30, 2, 1100, '2020-11-11'),
       (30, 3, 1100, '2020-11-11'),
       (30, 4, 5354, '2020-11-11'),
       (30, 5, 1100, '2020-11-11'),
       (30, 6, 1100, '2020-11-11'),
       (30, 7, 54654, '2020-11-11'),
       (30, 8, 1100, '2020-11-11'),
       (30, 9, 1100, '2020-11-11'),
       (30, 10, 1100, '2020-11-11'),
       (30, 11, 3543, '2020-11-11'),
       (30, 12, 1100, '2020-11-11'),
       (30, 13, 1100, '2020-11-11'),
       (30, 14, 1100, '2020-11-11'),
       (30, 15, 3543, '2020-11-11'),
       (30, 16, 1100, '2020-11-11'),
       (30, 17, 1100, '2020-11-11'),
       (30, 18, 1100, '2020-11-11'),
       (30, 20, 1100, '2020-11-11'),
       (30, 21, 3543, '2020-11-11'),
       (30, 22, 1100, '2020-11-11'),
       (30, 23, 1100, '2020-11-11'),
       (30, 24, 1100, '2020-11-11'),
       (30, 25, 9678, '2020-11-11'),
       (30, 26, 1100, '2020-11-11'),
       (30, 27, 1100, '2020-11-11'),
       (30, 28, 8788, '2020-11-11'),
       (30, 29, 1100, '2020-11-11'),
       (30, 30, 7896, '2020-11-11'),
       (30, 32, 1100, '2020-11-11'),
       (30, 33, 1100, '2020-11-11'),
       (30, 34, 1100, '2020-11-11'),
       (30, 38, 7896, '2020-11-11'),
       (30, 39, 1100, '2020-11-11'),
       (30, 40, 1100, '2020-11-11'),
       (30, 41, 1100, '2020-11-11'),
       (30, 42, 1100, '2020-11-11'),
       (30, 43, 7896, '2020-11-11'),
       (30, 44, 1100, '2020-11-11'),
       (30, 45, 1100, '2020-11-11'),
       (30, 46, 1100, '2020-11-11'),
       (30, 47, 8934, '2020-11-11'),
       (30, 48, 1100, '2020-11-11'),
       (30, 49, 3531, '2020-11-11'),
       (30, 50, 3531, '2020-11-11'),
       (30, 51, 3531, '2020-11-11'),
       (30, 52, 1100, '2020-11-11'),
       (30, 53, 1100, '2020-11-11'),
       (30, 54, 1100, '2020-11-11'),
       (30, 55, 1100, '2020-11-11'),
       (30, 56, 5444, '2020-11-11'),
       (30, 57, 1100, '2020-11-11'),
       (30, 58, 1100, '2020-11-11'),
       (30, 60, 4354, '2020-11-11'),
       (30, 61, 1100, '2020-11-11'),
       (30, 62, 1100, '2020-11-11'),
       (30, 63, 1100, '2020-11-11'),
       (30, 64, 8778, '2020-11-11'),
       (30, 65, 1100, '2020-11-11'),
       (30, 66, 88, '2020-11-11'),
       (30, 67, 1100, '2020-11-11'),
       (30, 68, 1100, '2020-11-11'),
       (30, 69, 1100, '2020-11-11'),
       (30, 70, 8877, '2020-11-11'),
       (30, 71, 1100, '2020-11-11'),
       (30, 72, 1100, '2020-11-11'),
       (30, 73, 8788, '2020-11-11'),
       (30, 74, 1100, '2020-11-11'),
       (31, 1, 1100, '2020-11-12'),
       (31, 2, 1100, '2020-11-12'),
       (31, 3, 1100, '2020-11-12'),
       (31, 4, 4323, '2020-11-12'),
       (31, 5, 1100, '2020-11-12'),
       (31, 6, 3423, '2020-11-12'),
       (31, 7, 54654, '2020-11-12'),
       (31, 8, 1100, '2020-11-12'),
       (31, 9, 23423, '2020-11-12'),
       (31, 10, 1100, '2020-11-12'),
       (31, 11, 3543, '2020-11-12'),
       (31, 12, 3243, '2020-11-12'),
       (31, 13, 1100, '2020-11-12'),
       (31, 14, 3433, '2020-11-12'),
       (31, 15, 3543, '2020-11-12'),
       (31, 16, 1100, '2020-11-12'),
       (31, 17, 1100, '2020-11-12'),
       (31, 18, 1100, '2020-11-12'),
       (31, 20, 1100, '2020-11-12'),
       (31, 21, 3543, '2020-11-12'),
       (31, 22, 1100, '2020-11-12'),
       (31, 23, 3322, '2020-11-12'),
       (31, 24, 1100, '2020-11-12'),
       (31, 25, 9678, '2020-11-12'),
       (31, 26, 1100, '2020-11-12'),
       (31, 27, 1100, '2020-11-12'),
       (31, 28, 8788, '2020-11-12'),
       (31, 29, 1100, '2020-11-12'),
       (31, 30, 7896, '2020-11-12'),
       (31, 32, 3434, '2020-11-12'),
       (31, 33, 1100, '2020-11-12'),
       (31, 34, 4343, '2020-11-12'),
       (31, 38, 7896, '2020-11-12'),
       (31, 39, 1100, '2020-11-12'),
       (31, 40, 3423, '2020-11-12'),
       (31, 41, 1100, '2020-11-12'),
       (31, 42, 1100, '2020-11-12'),
       (31, 43, 7896, '2020-11-12'),
       (31, 44, 1100, '2020-11-12'),
       (31, 45, 1100, '2020-11-12'),
       (31, 46, 1100, '2020-11-12'),
       (31, 47, 4234, '2020-11-12'),
       (31, 48, 1100, '2020-11-12'),
       (31, 49, 3531, '2020-11-12'),
       (31, 50, 3423, '2020-11-12'),
       (31, 51, 3531, '2020-11-12'),
       (31, 52, 1100, '2020-11-12'),
       (31, 53, 1100, '2020-11-12'),
       (31, 54, 1100, '2020-11-12'),
       (31, 55, 1100, '2020-11-12'),
       (31, 56, 5444, '2020-11-12'),
       (31, 57, 1100, '2020-11-12'),
       (31, 58, 1100, '2020-11-12'),
       (31, 60, 4354, '2020-11-12'),
       (31, 61, 1100, '2020-11-12'),
       (31, 62, 1100, '2020-11-12'),
       (31, 63, 4234, '2020-11-12'),
       (31, 64, 8778, '2020-11-12'),
       (31, 65, 1100, '2020-11-12'),
       (31, 66, 3333, '2020-11-12'),
       (31, 67, 1100, '2020-11-12'),
       (31, 68, 4324, '2020-11-12'),
       (31, 69, 1100, '2020-11-12'),
       (31, 70, 8877, '2020-11-12'),
       (31, 71, 1100, '2020-11-12'),
       (31, 72, 1100, '2020-11-12'),
       (31, 73, 8788, '2020-11-12'),
       (31, 74, 1100, '2020-11-12');
/*!40000 ALTER TABLE `Booking_service`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class_classification`
--

DROP TABLE IF EXISTS `Class_classification`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Class_classification`
(
    `class` varchar(255) NOT NULL,
    `order` varchar(255) NOT NULL,
    PRIMARY KEY (`order`, `class`),
    KEY `Class_classification_class_index` (`class`),
    CONSTRAINT `Class_classification_Kingdom_classification_class_fk` FOREIGN KEY (`class`) REFERENCES `Kingdom_classification` (`class`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class_classification`
--

LOCK TABLES `Class_classification` WRITE;
/*!40000 ALTER TABLE `Class_classification`
    DISABLE KEYS */;
INSERT INTO `Class_classification`
VALUES ('Aves', 'Accipitriformes'),
       ('Aves', 'Anseriformes'),
       ('Aves', 'Ciconiiformes'),
       ('Aves', 'Otidiformes'),
       ('Mammalia', 'Artiodactyla'),
       ('Mammalia', 'Carnivora'),
       ('mammalia', 'cervidae'),
       ('Mammalia', 'Chiroptera'),
       ('Mammalia', 'Felidae'),
       ('mammalia', 'perissodactyla'),
       ('Mammalia', 'Proboscidea'),
       ('Mammalia', 'Rodentia'),
       ('reptilia', 'crocodilia'),
       ('Reptilia', 'Squamata'),
       ('rosids', 'Fabales'),
       ('rosids', 'Rosales');
/*!40000 ALTER TABLE `Class_classification`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Crosses`
--

DROP TABLE IF EXISTS `Crosses`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Crosses`
(
    `feature_id` int NOT NULL,
    `trail_id`   int NOT NULL,
    PRIMARY KEY (`feature_id`, `trail_id`),
    KEY `trail_id` (`trail_id`),
    CONSTRAINT `Crosses_ibfk_1` FOREIGN KEY (`feature_id`) REFERENCES `Features` (`feature_id`),
    CONSTRAINT `Crosses_ibfk_3` FOREIGN KEY (`trail_id`) REFERENCES `Trail` (`feature_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Crosses`
--

LOCK TABLES `Crosses` WRITE;
/*!40000 ALTER TABLE `Crosses`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `Crosses`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Data`
--

DROP TABLE IF EXISTS `Data`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Data`
(
    `data_id`     int NOT NULL AUTO_INCREMENT,
    `description` longtext,
    `data_link`   varchar(255) DEFAULT NULL,
    `data_type`   varchar(255) DEFAULT NULL,
    PRIMARY KEY (`data_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Data`
--

LOCK TABLES `Data` WRITE;
/*!40000 ALTER TABLE `Data`
    DISABLE KEYS */;
INSERT INTO `Data`
VALUES (1, 'Detailed study on great indian bustard and their behaviour', 'dat1.json', 'JSON'),
       (2, 'Description on tigers found in India', 'dt1.json', 'JSON'),
       (3, 'Behaviour of Snakes', 'dat2.xls', 'Excel'),
       (4, 'Wildlife in Kanha National Park', 'dat3.xls', 'Excel');
/*!40000 ALTER TABLE `Data`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Demography`
--

DROP TABLE IF EXISTS `Demography`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Demography`
(
    `presence_id`      int       NOT NULL,
    `time_stamp`       timestamp NOT NULL,
    `total_population` int            DEFAULT NULL,
    `average_lifespan` decimal(10, 0) DEFAULT NULL,
    PRIMARY KEY (`presence_id`, `time_stamp`),
    CONSTRAINT `Demography_ibfk_1` FOREIGN KEY (`presence_id`) REFERENCES `Presence` (`presence_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Demography`
--

LOCK TABLES `Demography` WRITE;
/*!40000 ALTER TABLE `Demography`
    DISABLE KEYS */;
INSERT INTO `Demography`
VALUES (1, '2000-09-15 04:00:00', 137, 39),
       (1, '2001-10-11 00:00:00', 70, 27),
       (1, '2014-11-20 16:00:00', 105, 28),
       (1, '2020-10-04 06:01:57', 63, 12),
       (2, '2009-08-22 07:00:00', 113, 15),
       (2, '2013-04-12 19:00:00', 55, 37),
       (2, '2017-04-17 19:00:00', 92, 31),
       (2, '2017-11-25 06:00:00', 77, 34),
       (2, '2020-06-30 12:00:00', 28, 14),
       (3, '2001-03-13 17:00:00', 127, 37),
       (3, '2010-11-27 10:00:00', 47, 16),
       (3, '2018-07-01 12:00:00', 30, 15),
       (4, '2012-11-15 12:00:00', 106, 20),
       (4, '2013-04-19 00:00:00', 100, 10),
       (4, '2013-08-02 18:00:00', 58, 10),
       (4, '2015-05-14 19:00:00', 74, 23),
       (5, '2002-11-10 17:00:00', 95, 39),
       (5, '2003-11-03 12:00:00', 40, 28),
       (5, '2006-02-08 16:00:00', 69, 28),
       (5, '2007-01-02 07:00:00', 131, 36),
       (5, '2015-10-10 14:30:00', 44, 38),
       (6, '2000-09-18 18:00:00', 88, 16),
       (6, '2011-11-22 22:00:00', 55, 11),
       (6, '2017-03-15 15:45:00', 24, 13),
       (7, '2008-02-06 20:00:00', 45, 11),
       (7, '2013-09-11 15:00:00', 103, 36),
       (7, '2014-02-22 07:00:00', 137, 26),
       (7, '2016-03-04 15:00:00', 88, 13),
       (8, '2000-01-25 18:00:00', 66, 24),
       (8, '2006-07-17 06:00:00', 56, 20),
       (8, '2016-09-21 14:00:00', 47, 24),
       (8, '2017-09-07 19:00:00', 129, 17),
       (9, '2005-09-25 19:00:00', 57, 32),
       (9, '2012-01-18 14:00:00', 73, 16),
       (9, '2013-01-12 00:00:00', 138, 34),
       (9, '2018-10-27 14:00:00', 130, 13),
       (10, '2015-08-23 23:00:00', 73, 31),
       (11, '2008-06-17 15:00:00', 63, 32),
       (12, '2018-05-26 11:00:00', 73, 18),
       (13, '2015-02-28 10:00:00', 139, 21),
       (13, '2015-05-03 05:00:00', 41, 39),
       (14, '2008-04-21 20:00:00', 61, 28),
       (15, '2003-04-03 12:00:00', 122, 38),
       (16, '2004-09-07 02:00:00', 112, 31),
       (16, '2005-07-26 14:00:00', 81, 20),
       (16, '2016-06-01 10:00:00', 55, 12),
       (17, '2002-10-19 03:00:00', 97, 27),
       (17, '2003-04-07 04:00:00', 70, 11),
       (17, '2012-07-19 22:00:00', 83, 35),
       (18, '2001-05-26 09:00:00', 108, 13),
       (18, '2006-11-02 15:00:00', 77, 35),
       (18, '2009-08-22 13:00:00', 68, 15),
       (18, '2015-04-10 20:00:00', 81, 30),
       (19, '2004-02-18 11:00:00', 136, 25),
       (19, '2018-07-02 04:00:00', 103, 18),
       (20, '2000-04-08 09:00:00', 54, 15),
       (20, '2009-05-11 16:00:00', 107, 11),
       (20, '2015-03-26 00:00:00', 134, 25),
       (20, '2016-06-21 05:00:00', 92, 32),
       (21, '2011-01-12 01:00:00', 115, 20),
       (21, '2013-09-21 12:00:00', 61, 27),
       (22, '2007-06-10 11:00:00', 61, 28),
       (22, '2015-05-22 01:00:00', 54, 34),
       (22, '2016-01-13 09:00:00', 63, 36),
       (23, '2006-04-16 11:00:00', 60, 26),
       (24, '2001-03-18 12:00:00', 99, 35),
       (24, '2006-10-03 20:00:00', 57, 28),
       (24, '2011-03-01 10:00:00', 102, 12),
       (25, '2001-02-16 12:00:00', 56, 35),
       (25, '2005-09-13 15:00:00', 92, 28),
       (25, '2007-05-07 18:00:00', 95, 29),
       (25, '2013-10-22 17:00:00', 133, 27),
       (26, '2005-02-13 02:00:00', 113, 33),
       (26, '2005-08-19 08:00:00', 52, 21),
       (26, '2013-06-04 11:00:00', 53, 36),
       (28, '2020-01-01 00:00:00', 100, 20);
/*!40000 ALTER TABLE `Demography`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department`
(
    `contained_in`  varchar(4)   NOT NULL,
    `dep_number`    int          NOT NULL,
    `dep_name`      varchar(255) NOT NULL,
    `is_chaired_by` int DEFAULT NULL,
    PRIMARY KEY (`contained_in`, `dep_number`),
    KEY `is_chaired_by` (`is_chaired_by`),
    CONSTRAINT `Department_ibfk_1` FOREIGN KEY (`is_chaired_by`) REFERENCES `Employee` (`emp_id`),
    CONSTRAINT `Department_ibfk_2` FOREIGN KEY (`contained_in`) REFERENCES `National_Park` (`unit_code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department`
    DISABLE KEYS */;
INSERT INTO `Department`
VALUES ('CRBT', 1, 'Administration', 6),
       ('CRBT', 2, 'Maintainence', NULL),
       ('CRBT', 3, 'Protection', 5),
       ('CRBT', 4, 'Research', NULL),
       ('KNHA', 1, 'Admin', NULL),
       ('KNHA', 2, 'Research', NULL),
       ('KNHA', 3, 'Maintainence', NULL),
       ('KNHA', 4, 'Security', NULL),
       ('KZRG', 1, 'Administration', NULL),
       ('KZRG', 2, 'Protection', NULL),
       ('KZRG', 3, 'Planning', NULL),
       ('KZRG', 4, 'Maintainence', 7),
       ('KZRG', 5, 'Research', NULL);
/*!40000 ALTER TABLE `Department`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee`
(
    `emp_id`          int          NOT NULL AUTO_INCREMENT,
    `emp_name`        varchar(255) NOT NULL,
    `date_of_birth`   date                           DEFAULT NULL,
    `contact_number`  varchar(15)                    DEFAULT NULL,
    `emp_email`       varchar(255)                   DEFAULT NULL,
    `gender`          enum ('Male','Female','Other') DEFAULT NULL,
    `date_of_joining` date                           DEFAULT (now()),
    `role`            varchar(255)                   DEFAULT NULL,
    `works_for_dno`   int                            DEFAULT NULL,
    `national_park`   varchar(4)                     DEFAULT NULL,
    PRIMARY KEY (`emp_id`),
    UNIQUE KEY `emp_email` (`emp_email`),
    KEY `national_park` (`national_park`, `works_for_dno`),
    CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`national_park`, `works_for_dno`) REFERENCES `Department` (`contained_in`, `dep_number`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee`
    DISABLE KEYS */;
INSERT INTO `Employee`
VALUES (1, 'Michael Scott', '1977-01-01', '9321929192', 'Mike@email.com', 'Male', '2004-01-01', 'Supervisor', 1,
        'KZRG'),
       (2, 'James Halpert', '1999-01-01', '9399929192', 'jamesHap@email.com', 'Male', '2003-01-01', 'Ranger', 2,
        'KZRG'),
       (4, 'Pam', '1999-01-01', '9998989192', 'PamBeesly@email.com', 'Female', '2014-01-01', 'Director', 1, 'KNHA'),
       (5, 'Dwight', '1993-01-01', '9999999999', 'DwightDangerSchrute@email.com', 'Male', '2004-03-01', 'Manager', 3,
        'CRBT'),
       (6, 'Ben Wyatt', '1992-01-01', '3712893219', 'calzonesrule@email.com', 'Male', '2004-01-01', 'Head of planning',
        3, 'KNHA'),
       (7, 'Leslie Knope', '1999-01-01', '9399919212', 'lesterknopf@email.com', 'Female', '2000-01-01', 'Parks Person',
        1, 'CRBT'),
       (8, 'April Ludgate', '1992-01-01', '9399991921', 'jackolantern@email.com', 'Female', '2017-01-01', 'Evil Hag', 4,
        'KZRG'),
       (9, 'kk', '2000-02-02', '1234567890', 'kk@k.com', 'Male', '2000-02-02', 'kk', 1, 'CRBT'),
       (10, 'kannav mehta', '2000-01-01', '1234567890', 'kannav@email.com', 'Male', '2020-01-01', 'project designer', 1,
        'CRBT');
/*!40000 ALTER TABLE `Employee`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Family_classification`
--

DROP TABLE IF EXISTS `Family_classification`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Family_classification`
(
    `family` varchar(255) NOT NULL,
    `genus`  varchar(255) NOT NULL,
    PRIMARY KEY (`genus`, `family`),
    KEY `family` (`family`),
    CONSTRAINT `Family_classification_ibfk_1` FOREIGN KEY (`family`) REFERENCES `Order_classification` (`family`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Family_classification`
--

LOCK TABLES `Family_classification` WRITE;
/*!40000 ALTER TABLE `Family_classification`
    DISABLE KEYS */;
INSERT INTO `Family_classification`
VALUES ('anatidae', 'aix'),
       ('cervinae', 'axis'),
       ('cervinae', 'rusa'),
       ('Ciconiidae', 'Leptoptilos'),
       ('colubridae', 'boiga'),
       ('Elephantidae', 'Elephas'),
       ('Fabaceae', 'Saraca'),
       ('felidae', 'Neofelis'),
       ('felidae', 'Panthera'),
       ('gavialidae', 'gavialis'),
       ('Moraceae', 'Ficus'),
       ('Otididae', 'Ardeotis'),
       ('Pythonidae', 'Malayopython'),
       ('Pythonidae', 'Python'),
       ('rhinocerotidae', 'rhinoceros');
/*!40000 ALTER TABLE `Family_classification`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feature_Feedback`
--

DROP TABLE IF EXISTS `Feature_Feedback`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Feature_Feedback`
(
    `user_id`    int NOT NULL,
    `feature_id` int NOT NULL,
    `rating`     decimal(10, 0) DEFAULT NULL COMMENT 'between 1 and 5',
    `remarks`    longtext,
    `date`       datetime       DEFAULT NULL,
    PRIMARY KEY (`user_id`, `feature_id`),
    KEY `feature_id` (`feature_id`),
    CONSTRAINT `Feature_Feedback_Features_feature_id_fk` FOREIGN KEY (`feature_id`) REFERENCES `Features` (`feature_id`) ON DELETE CASCADE,
    CONSTRAINT `Feature_Feedback_User_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feature_Feedback`
--

LOCK TABLES `Feature_Feedback` WRITE;
/*!40000 ALTER TABLE `Feature_Feedback`
    DISABLE KEYS */;
INSERT INTO `Feature_Feedback`
VALUES (1, 1, 4, 'Very good', '2018-01-30 00:00:00'),
       (1, 2, 3, 'cool', '2017-01-30 00:00:00'),
       (2, 1, 1, 'didnt like it', '2018-01-23 00:00:00'),
       (2, 22, 4, 'awesome', '2018-02-13 00:00:00'),
       (3, 2, 2, 'ok ok', '2016-03-24 00:00:00'),
       (3, 6, 4, 'niiceee', '2018-01-11 00:00:00'),
       (4, 4, 3, 'Very very nice', '2012-08-14 00:00:00'),
       (6, 11, 4, 'superb', '2018-05-30 00:00:00'),
       (6, 15, 4, 'Nice! but small rooms.', '2020-10-08 09:22:16'),
       (8, 13, 5, 'loved it', '2018-06-12 00:00:00');
/*!40000 ALTER TABLE `Feature_Feedback`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feature_images`
--

DROP TABLE IF EXISTS `Feature_images`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Feature_images`
(
    `feature_id` int NOT NULL,
    `image_id`   int NOT NULL,
    `image`      longblob,
    PRIMARY KEY (`feature_id`, `image_id`),
    CONSTRAINT `Feature_images_ibfk_1` FOREIGN KEY (`feature_id`) REFERENCES `Features` (`feature_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feature_images`
--

LOCK TABLES `Feature_images` WRITE;
/*!40000 ALTER TABLE `Feature_images`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `Feature_images`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Features`
--

DROP TABLE IF EXISTS `Features`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Features`
(
    `feature_id`   int          NOT NULL AUTO_INCREMENT,
    `feature_name` varchar(255) NOT NULL,
    `availability` int          DEFAULT NULL,
    `geohash`      varchar(255) DEFAULT NULL,
    PRIMARY KEY (`feature_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 28
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Features`
--

LOCK TABLES `Features` WRITE;
/*!40000 ALTER TABLE `Features`
    DISABLE KEYS */;
INSERT INTO `Features`
VALUES (1, 'Lodging', 1, 'gygeryuyui'),
       (2, 'Trail', 1, 'gygerthyuj'),
       (3, 'Trail', 1, 'gygeryuyuk'),
       (4, 'Lodging', 0, 'gygeryuyus'),
       (5, 'View Point', 0, 'gygeryuyuq'),
       (6, 'Lodging', 1, 'oikjioppqr'),
       (7, 'Trail', 1, 'oikjioppqf'),
       (8, 'View Point', 1, 'oikjioppqk'),
       (9, 'Lodging', 0, 'oikjioppqt'),
       (10, 'View Point', 1, 'oikjioppqk'),
       (11, 'View Point', 1, 'hhopuhjkok'),
       (12, 'Public Facility', 1, 'hhopuhjkoy'),
       (13, 'Public Facility', 1, 'erikuhjnok'),
       (14, 'Washroom', 1, 'erikuhjnoj'),
       (15, 'Lodging', 1, 'erikuhjnoi'),
       (16, 'Trail', 1, 'erikuhjnoo'),
       (17, 'Trail', 1, 'hhikuhjnjk'),
       (18, 'Lodging', 0, 'hhikuhjnjs'),
       (19, 'View Point', 0, 'hhikuhjnjq'),
       (20, 'Lodging', 1, 'hhikuhjnjr'),
       (21, 'Trail', 1, 'hhikuhjnjf'),
       (22, 'View Point', 1, 'gyyghhetwk'),
       (23, 'Lodging', 0, 'gyyghhetwt'),
       (24, 'View Point', 1, 'gyyghhetwk'),
       (25, 'View Point', 1, 'gyyghhetwk'),
       (26, 'Public Facility', 1, 'gyyghhetwy'),
       (27, 'Public Facility', 1, 'gyyghhetwk');
/*!40000 ALTER TABLE `Features`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feeds_on`
--

DROP TABLE IF EXISTS `Feeds_on`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Feeds_on`
(
    `predator_genus`         varchar(255) DEFAULT NULL,
    `predator_specific_name` varchar(255) DEFAULT NULL,
    `prey_genus`             varchar(255) DEFAULT NULL,
    `prey_specific_name`     varchar(255) DEFAULT NULL,
    KEY `predator_genus` (`predator_genus`, `predator_specific_name`),
    KEY `prey_genus` (`prey_genus`, `prey_specific_name`),
    CONSTRAINT `Feeds_on_ibfk_1` FOREIGN KEY (`predator_genus`) REFERENCES `Species` (`genus`),
    CONSTRAINT `Feeds_on_ibfk_2` FOREIGN KEY (`prey_genus`) REFERENCES `Species` (`genus`),
    CONSTRAINT `Feeds_on_ibfk_3` FOREIGN KEY (`predator_genus`, `predator_specific_name`) REFERENCES `Species` (`genus`, `specific_name`),
    CONSTRAINT `Feeds_on_ibfk_4` FOREIGN KEY (`prey_genus`, `prey_specific_name`) REFERENCES `Species` (`genus`, `specific_name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feeds_on`
--

LOCK TABLES `Feeds_on` WRITE;
/*!40000 ALTER TABLE `Feeds_on`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `Feeds_on`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kingdom_classification`
--

DROP TABLE IF EXISTS `Kingdom_classification`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Kingdom_classification`
(
    `kingdom` varchar(255) NOT NULL,
    `class`   varchar(255) NOT NULL,
    PRIMARY KEY (`kingdom`, `class`),
    KEY `Kingdom_classification_class_index` (`class`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kingdom_classification`
--

LOCK TABLES `Kingdom_classification` WRITE;
/*!40000 ALTER TABLE `Kingdom_classification`
    DISABLE KEYS */;
INSERT INTO `Kingdom_classification`
VALUES ('Plantae', 'Angiosperms'),
       ('Animalia', 'Aves'),
       ('Animalia', 'Mammalia'),
       ('Animalia', 'Reptilia'),
       ('Plantae', 'Rosids');
/*!40000 ALTER TABLE `Kingdom_classification`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lodging`
--

DROP TABLE IF EXISTS `Lodging`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lodging`
(
    `feature_id`       int          NOT NULL,
    `name`             varchar(255) NOT NULL,
    `person_in_charge` varchar(255) NOT NULL,
    `capacity`         int         DEFAULT NULL,
    `occupancy`        int         DEFAULT NULL,
    `contact_number`   varchar(15) DEFAULT NULL,
    PRIMARY KEY (`feature_id`),
    CONSTRAINT `Lodging_ibfk_1` FOREIGN KEY (`feature_id`) REFERENCES `Features` (`feature_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lodging`
--

LOCK TABLES `Lodging` WRITE;
/*!40000 ALTER TABLE `Lodging`
    DISABLE KEYS */;
INSERT INTO `Lodging`
VALUES (1, 'Oyo Hotel', 'raj', 35, 10, '8876885431'),
       (4, 'Radisson Hotel', 'sanchit', 20, 19, '8836885431'),
       (6, 'Travelodge', 'sanchit', 25, 18, '8876884431'),
       (9, 'Knights Inn', 'shami', 30, 30, '8876885031'),
       (15, 'Oyo clubhouse', 'raj', 35, 10, '8876285431'),
       (20, 'Taj Banjara', 'sanchit', 200, 190, '8836225431'),
       (23, 'Treebo', 'gurkirat', 25, 18, '8876882431');
/*!40000 ALTER TABLE `Lodging`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `National_Park`
--

DROP TABLE IF EXISTS `National_Park`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `National_Park`
(
    `unit_code`   varchar(4)   NOT NULL,
    `name`        varchar(255) NOT NULL,
    `region_code` varchar(255) NOT NULL,
    `boundary`    geometry       DEFAULT NULL,
    `latitude`    decimal(10, 6) DEFAULT NULL,
    `longitude`   decimal(10, 6) DEFAULT NULL,
    PRIMARY KEY (`unit_code`),
    UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `National_Park`
--

LOCK TABLES `National_Park` WRITE;
/*!40000 ALTER TABLE `National_Park`
    DISABLE KEYS */;
INSERT INTO `National_Park`
VALUES ('CRBT', 'Jim Corbet National Park', 'UK', NULL, 29.548599, 78.935303),
       ('KLDO', 'Keoladeo National Park', 'RJ', NULL, 27.159269, 77.523200),
       ('KNHA', 'Kanha National Park', 'MP', NULL, 22.333333, 80.633333),
       ('KZRG', 'Kaziranga National Park', 'AS', NULL, 26.575863, 93.167046),
       ('MNAS', 'Manas National Park', 'AS', NULL, 26.659424, 91.001129);
/*!40000 ALTER TABLE `National_Park`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_classification`
--

DROP TABLE IF EXISTS `Order_classification`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_classification`
(
    `order`  varchar(255) NOT NULL,
    `family` varchar(255) NOT NULL,
    PRIMARY KEY (`family`, `order`),
    KEY `order` (`order`),
    CONSTRAINT `Order_classification_ibfk_1` FOREIGN KEY (`order`) REFERENCES `Class_classification` (`order`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_classification`
--

LOCK TABLES `Order_classification` WRITE;
/*!40000 ALTER TABLE `Order_classification`
    DISABLE KEYS */;
INSERT INTO `Order_classification`
VALUES ('anseriformes', 'anatidae'),
       ('carnivora', 'felidae'),
       ('cervidae', 'cervinae'),
       ('ciconiiformes', 'Ciconiidae'),
       ('crocodilia', 'gavialidae'),
       ('Fabales', 'Fabaceae'),
       ('Otidiformes', 'Otididae'),
       ('perissodactyla', 'rhinocerotidae'),
       ('Proboscidea', 'Elephantidae'),
       ('Rosales', 'Moraceae'),
       ('squamata', 'colubridae'),
       ('Squamata', 'Pythonidae');
/*!40000 ALTER TABLE `Order_classification`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permit`
--

DROP TABLE IF EXISTS `Permit`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Permit`
(
    `permit_id`              int  NOT NULL AUTO_INCREMENT,
    `permit_expiration_date` date NOT NULL,
    PRIMARY KEY (`permit_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permit`
--

LOCK TABLES `Permit` WRITE;
/*!40000 ALTER TABLE `Permit`
    DISABLE KEYS */;
INSERT INTO `Permit`
VALUES (1, '2024-02-28'),
       (2, '2022-04-15'),
       (3, '2023-10-10'),
       (4, '2023-01-31'),
       (5, '2022-12-01'),
       (6, '2020-12-31'),
       (7, '2021-05-07'),
       (8, '2021-09-15'),
       (9, '2020-10-30'),
       (10, '2023-06-20');
/*!40000 ALTER TABLE `Permit`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Presence`
--

DROP TABLE IF EXISTS `Presence`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Presence`
(
    `presence_id`        int NOT NULL AUTO_INCREMENT,
    `genus`              varchar(255)                      DEFAULT NULL,
    `specific_name`      varchar(255)                      DEFAULT NULL,
    `national_park`      varchar(4)                        DEFAULT NULL,
    `nativeness`         tinyint(1)                        DEFAULT NULL,
    `is_attraction`      tinyint(1)                        DEFAULT NULL,
    `abundance`          enum ('rare','common','uncommon') DEFAULT NULL,
    `record_status`      enum ('Verified','Non Verified')  DEFAULT NULL,
    `record_time`        date                              DEFAULT NULL,
    `occurrence`         enum ('Full Year','Seasonal')     DEFAULT NULL,
    `current_population` int                               DEFAULT NULL,
    PRIMARY KEY (`presence_id`),
    KEY `genus` (`genus`, `specific_name`),
    KEY `national_park` (`national_park`),
    CONSTRAINT `Presence_ibfk_1` FOREIGN KEY (`national_park`) REFERENCES `National_Park` (`unit_code`),
    CONSTRAINT `Presence_ibfk_2` FOREIGN KEY (`genus`, `specific_name`) REFERENCES `Species` (`genus`, `specific_name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Presence`
--

LOCK TABLES `Presence` WRITE;
/*!40000 ALTER TABLE `Presence`
    DISABLE KEYS */;
INSERT INTO `Presence`
VALUES (1, 'Panthera', 'tigris', 'CRBT', 1, 1, 'common', 'Verified', '2010-06-30', 'Full Year', 125),
       (2, 'Panthera', 'tigris', 'KLDO', 1, 1, 'uncommon', 'Verified', '2015-01-31', 'Full Year', 124),
       (3, 'Panthera', 'tigris', 'MNAS', 1, 1, 'uncommon', 'Verified', '2020-09-30', 'Full Year', 124),
       (4, 'Ficus', 'religiosa', 'KNHA', 1, 0, 'common', 'Verified', '2016-12-31', 'Full Year', 22),
       (5, 'Python', 'molurus', 'KLDO', 1, 0, 'uncommon', 'Non Verified', '2015-08-20', 'Seasonal', 44),
       (6, 'Ardeotis', 'nigriceps', 'KLDO', 1, 1, 'rare', 'Non Verified', '2010-10-10', 'Seasonal', 56),
       (7, 'Python', 'molurus', 'KNHA', 1, 0, 'uncommon', 'Verified', '2018-11-15', 'Full Year', 232),
       (8, 'Python', 'molurus', 'MNAS', 1, 0, 'rare', 'Non Verified', '2018-11-15', 'Full Year', 67),
       (9, 'rhinoceros', 'unicornis', 'KZRG', 1, 1, 'rare', 'Non Verified', '2020-01-01', 'Full Year', 100),
       (10, 'axis', 'axis', 'KLDO', 1, NULL, 'common', 'Verified', '2010-06-17', 'Full Year', NULL),
       (11, 'rusa', 'unicolor', 'KLDO', 0, 0, 'uncommon', 'Verified', '2015-07-14', 'Seasonal', NULL),
       (12, 'panthera', 'pardus', 'KLDO', 1, 1, 'rare', 'Verified', '2018-01-17', 'Full Year', NULL),
       (13, 'Axis', 'axis', 'CRBT', 1, 0, 'common', 'Verified', '2010-10-16', 'Full Year', 2000),
       (14, 'Axis', 'axis', 'KNHA', 1, 0, 'common', 'Verified', '2010-10-16', 'Full Year', 1500),
       (15, 'Axis', 'axis', 'KZRG', 1, 0, 'common', 'Verified', '2010-10-16', 'Full Year', 3000),
       (16, 'Rusa', 'unicolor', 'KNHA', 1, 0, 'common', 'Verified', '2015-07-14', 'Full Year', 800),
       (17, 'Rusa', 'unicolor', 'MNAS', 0, 0, 'common', 'Verified', '2015-07-14', 'Full Year', 1200),
       (18, 'Rusa', 'unicolor', 'KZRG', 0, 0, 'uncommon', 'Verified', '2015-07-14', 'Full Year', 1100),
       (19, 'Rusa', 'unicolor', 'CRBT', 1, 0, 'uncommon', 'Verified', '2015-07-14', 'Seasonal', 700),
       (20, 'Panthera', 'pardus', 'CRBT', 1, 1, 'uncommon', 'Verified', '2018-01-17', 'Seasonal', 54),
       (21, 'Panthera', 'pardus', 'KZRG', 1, 1, 'rare', 'Verified', '2018-01-17', 'Seasonal', 41),
       (22, 'Panthera', 'pardus', 'KNHA', 1, 1, 'rare', 'Verified', '2018-01-17', 'Seasonal', 32),
       (23, 'gavialis', 'gangeticus', 'MNAS', 1, 1, 'uncommon', 'Non Verified', '2012-02-28', 'Full Year', NULL),
       (24, 'Gavialis', 'gangeticus', 'CRBT', 0, 1, 'rare', 'Verified', '2012-03-01', 'Seasonal', 47),
       (25, 'Gavialis', 'gangeticus', 'KLDO', 0, 0, 'rare', 'Verified', '2012-04-01', 'Seasonal', 53),
       (26, 'panthera', 'leo', 'CRBT', 0, 1, 'rare', 'Verified', '2020-01-02', 'Seasonal', 15),
       (27, 'aix', 'sponsa', 'CRBT', 1, 1, 'common', NULL, '2000-01-01', 'Seasonal', NULL),
       (28, 'boiga', 'trigonata', 'KLDO', 1, 0, 'common', 'Verified', '1990-01-01', 'Full Year', NULL);
/*!40000 ALTER TABLE `Presence`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Public_Facilities`
--

DROP TABLE IF EXISTS `Public_Facilities`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Public_Facilities`
(
    `feature_id`       int          NOT NULL,
    `name`             varchar(255) NOT NULL,
    `person_in_charge` varchar(255) NOT NULL,
    PRIMARY KEY (`feature_id`),
    CONSTRAINT `Public_Facilities_ibfk_1` FOREIGN KEY (`feature_id`) REFERENCES `Features` (`feature_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Public_Facilities`
--

LOCK TABLES `Public_Facilities` WRITE;
/*!40000 ALTER TABLE `Public_Facilities`
    DISABLE KEYS */;
INSERT INTO `Public_Facilities`
VALUES (12, 'cafeteria', 'kannav'),
       (13, 'gift-shop', 'triansh'),
       (26, 'cafeteria', 'kannav'),
       (27, 'gift-shop', 'triansh');
/*!40000 ALTER TABLE `Public_Facilities`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Published`
--

DROP TABLE IF EXISTS `Published`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Published`
(
    `ISBN_number`        int NOT NULL,
    `publishing_journal` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`ISBN_number`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Published`
--

LOCK TABLES `Published` WRITE;
/*!40000 ALTER TABLE `Published`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `Published`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Report`
--

DROP TABLE IF EXISTS `Report`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Report`
(
    `report_title`      varchar(255) NOT NULL,
    `parent_data`       int          NOT NULL,
    `publishing_status` int DEFAULT NULL,
    PRIMARY KEY (`report_title`, `parent_data`),
    KEY `parent_data` (`parent_data`),
    KEY `publishing_status` (`publishing_status`),
    CONSTRAINT `Report_ibfk_1` FOREIGN KEY (`parent_data`) REFERENCES `Data` (`data_id`) ON DELETE CASCADE,
    CONSTRAINT `Report_ibfk_2` FOREIGN KEY (`publishing_status`) REFERENCES `Published` (`ISBN_number`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report`
--

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `Report`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Report_coauthors`
--

DROP TABLE IF EXISTS `Report_coauthors`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Report_coauthors`
(
    `report_title`       varchar(255) NOT NULL,
    `report_parent_data` int          NOT NULL,
    `coauthor_name`      varchar(255) NOT NULL,
    PRIMARY KEY (`report_title`, `report_parent_data`, `coauthor_name`),
    KEY `report` (`report_parent_data`),
    CONSTRAINT `Report_coauthors_ibfk_1` FOREIGN KEY (`report_title`, `report_parent_data`) REFERENCES `Report` (`report_title`, `parent_data`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report_coauthors`
--

LOCK TABLES `Report_coauthors` WRITE;
/*!40000 ALTER TABLE `Report_coauthors`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `Report_coauthors`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Researcher`
--

DROP TABLE IF EXISTS `Researcher`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Researcher`
(
    `researcher_id`   int          NOT NULL AUTO_INCREMENT,
    `name`            varchar(255) NOT NULL,
    `contact_number`  varchar(15)  DEFAULT NULL,
    `email`           varchar(255) NOT NULL,
    `university_name` varchar(255) DEFAULT NULL,
    `permit`          int          DEFAULT NULL,
    PRIMARY KEY (`researcher_id`),
    KEY `permit` (`permit`),
    CONSTRAINT `Researcher_ibfk_1` FOREIGN KEY (`permit`) REFERENCES `Permit` (`permit_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Researcher`
--

LOCK TABLES `Researcher` WRITE;
/*!40000 ALTER TABLE `Researcher`
    DISABLE KEYS */;
INSERT INTO `Researcher`
VALUES (1, 'Sarah Resendes', '7343976663', 'sarahresendes1411@rediff.com', 'Franklin and Marshall College', 1),
       (2, 'Sunday Holladay', '8588261321', 'holladay.sunday@gmail.com', 'Brigham Young University', 2),
       (3, 'Joey Mershon', '5564105941', 'joeymer12@yahoo.com', 'University of Texas, Austin', 3),
       (4, 'Chuck Colpitts', '6653294177', 'chuck23@hotmail.com', 'University of California, Berkeley', 4),
       (5, 'Jesusa Touchton', '8778670185', 'touchtonjesusa@gmail.com', 'Grinnell College', 5);
/*!40000 ALTER TABLE `Researcher`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service_Feature`
--

DROP TABLE IF EXISTS `Service_Feature`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Service_Feature`
(
    `service_id` int NOT NULL,
    `feature_id` int NOT NULL,
    PRIMARY KEY (`service_id`, `feature_id`),
    KEY `feature_id` (`feature_id`),
    CONSTRAINT `Service_Feature_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `Services` (`service_id`) ON DELETE CASCADE,
    CONSTRAINT `Service_Feature_ibfk_2` FOREIGN KEY (`feature_id`) REFERENCES `Features` (`feature_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service_Feature`
--

LOCK TABLES `Service_Feature` WRITE;
/*!40000 ALTER TABLE `Service_Feature`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `Service_Feature`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service_Feedback`
--

DROP TABLE IF EXISTS `Service_Feedback`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Service_Feedback`
(
    `user_id`    int NOT NULL,
    `service_id` int NOT NULL,
    `rating`     int      DEFAULT NULL COMMENT 'between 1 and 5',
    `remarks`    longtext,
    `date`       datetime DEFAULT NULL,
    PRIMARY KEY (`user_id`, `service_id`),
    KEY `service_id` (`service_id`),
    CONSTRAINT `Service_Feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE,
    CONSTRAINT `Service_Feedback_ibfk_5` FOREIGN KEY (`service_id`) REFERENCES `Services` (`service_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service_Feedback`
--

LOCK TABLES `Service_Feedback` WRITE;
/*!40000 ALTER TABLE `Service_Feedback`
    DISABLE KEYS */;
INSERT INTO `Service_Feedback`
VALUES (1, 1, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 2, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 3, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 4, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 5, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 6, 3, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 7, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 8, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 9, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 10, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 11, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 12, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 13, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 14, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 15, 3, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 16, 4, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 17, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 18, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 20, 3, 'Nah, don\'t try!', '2020-01-01 00:00:00'),
       (1, 21, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 22, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 23, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 24, 4, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 25, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 26, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 27, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 28, 3, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 29, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 30, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 32, 4, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 33, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 34, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 35, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 36, 3, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 37, 4, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 38, 5, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 39, 4, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (1, 40, 4, 'Nice! Must Try', '2020-01-01 00:00:00'),
       (2, 1, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 2, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 3, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 4, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 5, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 6, 5, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 7, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 8, 3, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 9, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 10, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 11, 3, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 12, 5, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 13, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 14, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 15, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 16, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 17, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 18, 5, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 20, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 21, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 22, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 23, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 24, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 25, 5, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 26, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 27, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 28, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 29, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 30, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 32, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 33, 5, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 34, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 35, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 36, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 37, 5, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 38, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 39, 4, 'Nice! But could be better', '2020-02-02 00:00:00'),
       (2, 40, 4, 'Nice! But could be better', '2020-02-02 00:00:00');
/*!40000 ALTER TABLE `Service_Feedback`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Services`
--

DROP TABLE IF EXISTS `Services`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Services`
(
    `service_id`  int          NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) NOT NULL,
    `description` longtext,
    `provided_by` varchar(4) DEFAULT NULL,
    PRIMARY KEY (`service_id`),
    KEY `provided_by` (`provided_by`),
    CONSTRAINT `Services_ibfk_1` FOREIGN KEY (`provided_by`) REFERENCES `National_Park` (`unit_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 42
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Services`
--

LOCK TABLES `Services` WRITE;
/*!40000 ALTER TABLE `Services`
    DISABLE KEYS */;
INSERT INTO `Services`
VALUES (1, 'Canter Safari', 'Nice wildlife tour with a bunch of people', 'KLDO'),
       (2, 'Jeep Safari', 'Family wildlife tour', 'KLDO'),
       (3, 'Night Trekking', 'See how the forest looks in night', 'MNAS'),
       (4, 'Forest Hiking', 'Lets explore deep jungle', 'KNHA'),
       (5, 'Long Day Trekking', 'How fun would it be to see wildlife that close', 'CRBT'),
       (6, 'Jeep Safari', 'Family wildlife tour', 'KNHA'),
       (7, 'Jeep Safari', 'Family wildlife tour', 'CRBT'),
       (8, 'River Rafting', 'Enjoy rafting in the river', 'MNAS'),
       (9, 'Canter Safari', 'Nice wildlife tour with a bunch of people', 'KZRG'),
       (10, 'Canoeing', 'A good recreational activity', 'CRBT'),
       (11, 'Boating', 'Enjoy the views from a lake', 'KNHA'),
       (12, 'River Rafting', 'Enjoy rafting in the river', 'KZRG'),
       (13, 'Explore Museums', 'Lot to know about history', 'KZRG'),
       (14, 'Explore Museums', 'Lot to know about history', 'KNHA'),
       (15, 'Visit forts', 'a tour to historical monuments', 'KLDO'),
       (16, 'Bird Watching', 'Know more about various species of birds', 'KLDO'),
       (17, 'Bird Watching', 'Know more about various species of birds', 'MNAS'),
       (18, 'Visiting gardens', 'A tour to botanical and flower gardens', 'CRBT'),
       (20, 'Canter Safari', 'Nice wildlife tour with a bunch of people', 'KNHA'),
       (21, 'Jeep Safari', 'Family wildlife tour', 'MNAS'),
       (22, 'Night Trekking', 'See how the forest looks in night', 'KZRG'),
       (23, 'Forest Hiking', 'Lets explore deep jungle', 'CRBT'),
       (24, 'Long Day Trekking', 'How fun would it be to see wildlife that close', 'MNAS'),
       (25, 'Jeep Safari', 'Family wildlife tour', 'KZRG'),
       (26, 'Jeep Safari', 'Family wildlife tour', 'MNAS'),
       (27, 'River Rafting', 'Enjoy rafting in the river', 'CRBT'),
       (28, 'Canter Safari', 'Nice wildlife tour with a bunch of people', 'CRBT'),
       (29, 'Canoeing', 'A good recreational activity', 'MNAS'),
       (30, 'Boating', 'Enjoy the views from a lake', 'CRBT'),
       (32, 'Explore Museums', 'Lot to know about history', 'CRBT'),
       (33, 'Explore Museums', 'Lot to know about history', 'MNAS'),
       (34, 'Visit forts', 'a tour to historical monuments', 'KZRG'),
       (35, 'Bird Watching', 'Know more about various species of birds', 'KZRG'),
       (36, 'Bird Watching', 'Know more about various species of birds', 'CRBT'),
       (37, 'Visiting gardens', 'A tour to botanical and flower gardens', 'KZRG'),
       (38, 'River Rafting', 'A fun and frolic experience for all', 'KNHA'),
       (39, 'Visiting gardens', 'A tour to botanical and flower gardens', 'KLDO'),
       (40, 'Forest Hiking', 'Lets explore deep jungle', 'KLDO');
/*!40000 ALTER TABLE `Services`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Species`
--

DROP TABLE IF EXISTS `Species`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Species`
(
    `genus`            varchar(255)                                                                                                                              NOT NULL,
    `specific_name`    varchar(255)                                                                                                                              NOT NULL,
    `taxonomy_code`    varchar(10)                                                                                                                               NOT NULL,
    `name`             varchar(255)                                                                                                                              NOT NULL,
    `vulnerability`    enum ('Extinct','Extinct from wild','Critically Endangered','Endangered','Vulnerable','Near Threatened','Least Concern','Data Deficient') NOT NULL,
    `average_lifespan` decimal(10, 0) DEFAULT NULL,
    PRIMARY KEY (`genus`, `specific_name`),
    UNIQUE KEY `taxonomy_code` (`taxonomy_code`),
    UNIQUE KEY `name` (`name`),
    CONSTRAINT `Species_ibfk_1` FOREIGN KEY (`genus`) REFERENCES `Family_classification` (`genus`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Species`
--

LOCK TABLES `Species` WRITE;
/*!40000 ALTER TABLE `Species`
    DISABLE KEYS */;
INSERT INTO `Species`
VALUES ('aix', 'sponsa', '77836', 'wood duck', 'Least Concern', NULL),
       ('Ardeotis', 'nigriceps', '172692', 'Great Indian Bustard', 'Critically Endangered', 12),
       ('axis', 'axis', '65342', 'spotted deer', 'Least Concern', 23),
       ('boiga', 'trigonata', 'TSN 232823', 'indian gamma snake', 'Least Concern', NULL),
       ('Ficus', 'religiosa', '66387', 'Peepal Tree', 'Least Concern', 1000),
       ('gavialis', 'gangeticus', '84676', 'gharial', 'Critically Endangered', 40),
       ('Leptoptilos', 'dubius', '1940340', 'Greater adjutant', 'Endangered', 35),
       ('Panthera', 'leo', '83386', 'Asiatic lion', 'Endangered', 18),
       ('panthera', 'pardus', '73622', 'leopard', 'Vulnerable', 15),
       ('Panthera', 'tigris', '74535', 'Royal Bengal Tiger', 'Endangered', 10),
       ('Python', 'molurus', '621282', 'Indian rock python', 'Vulnerable', 38),
       ('rhinoceros', 'unicornis', '1234567891', 'indian rhinoceros', 'Vulnerable', NULL),
       ('rusa', 'unicolor', '73673', 'sambar deer', 'Least Concern', 24),
       ('Saraca', 'asoca', '1073321', 'Ashoka Tree', 'Vulnerable', 50);
/*!40000 ALTER TABLE `Species`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Species_habitats`
--

DROP TABLE IF EXISTS `Species_habitats`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Species_habitats`
(
    `presence_id`     int                                                                    NOT NULL,
    `type_of_habitat` enum ('Marshland','Desert','Savannah','Mountainous','Forest','Tundra') NOT NULL,
    PRIMARY KEY (`presence_id`, `type_of_habitat`),
    CONSTRAINT `Species_habitats_ibfk_1` FOREIGN KEY (`presence_id`) REFERENCES `Presence` (`presence_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Species_habitats`
--

LOCK TABLES `Species_habitats` WRITE;
/*!40000 ALTER TABLE `Species_habitats`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `Species_habitats`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Species_names`
--

DROP TABLE IF EXISTS `Species_names`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Species_names`
(
    `name`        varchar(255) NOT NULL,
    `common_name` varchar(255) NOT NULL,
    PRIMARY KEY (`name`, `common_name`),
    CONSTRAINT `Species_names_ibfk_1` FOREIGN KEY (`name`) REFERENCES `Species` (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Species_names`
--

LOCK TABLES `Species_names` WRITE;
/*!40000 ALTER TABLE `Species_names`
    DISABLE KEYS */;
INSERT INTO `Species_names`
VALUES ('Asiatic Lion', 'Lion'),
       ('Asiatic Lion', 'Sher'),
       ('Great Indian Bustard', 'Indian bustard'),
       ('Peepal tree', 'ashwattha tree'),
       ('Peepal tree', 'bodhi tree'),
       ('Royal Bengal Tiger', 'Baagh'),
       ('Royal Bengal Tiger', 'Bengal Tiger');
/*!40000 ALTER TABLE `Species_names`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Study`
--

DROP TABLE IF EXISTS `Study`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Study`
(
    `study_id`      int NOT NULL AUTO_INCREMENT,
    `national_park` varchar(4)   DEFAULT NULL,
    `researcher`    int          DEFAULT NULL,
    `type`          varchar(255) DEFAULT NULL,
    `start_date`    date         DEFAULT NULL,
    PRIMARY KEY (`study_id`),
    KEY `national_park` (`national_park`),
    KEY `researcher` (`researcher`),
    CONSTRAINT `Study_ibfk_1` FOREIGN KEY (`researcher`) REFERENCES `Researcher` (`researcher_id`),
    CONSTRAINT `Study_ibfk_2` FOREIGN KEY (`national_park`) REFERENCES `National_Park` (`unit_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Study`
--

LOCK TABLES `Study` WRITE;
/*!40000 ALTER TABLE `Study`
    DISABLE KEYS */;
INSERT INTO `Study`
VALUES (1, 'KNHA', 3, 'Case Study', '2016-03-10'),
       (2, 'CRBT', 4, 'Correlational Study', '2018-07-01'),
       (3, 'KLDO', 1, 'Experimental Study', '2015-10-15');
/*!40000 ALTER TABLE `Study`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Study_data`
--

DROP TABLE IF EXISTS `Study_data`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Study_data`
(
    `study_id` int NOT NULL,
    `data_id`  int NOT NULL,
    PRIMARY KEY (`study_id`, `data_id`),
    KEY `data_id` (`data_id`),
    CONSTRAINT `Study_data_ibfk_1` FOREIGN KEY (`study_id`) REFERENCES `Study` (`study_id`) ON DELETE CASCADE,
    CONSTRAINT `Study_data_ibfk_2` FOREIGN KEY (`data_id`) REFERENCES `Data` (`data_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Study_data`
--

LOCK TABLES `Study_data` WRITE;
/*!40000 ALTER TABLE `Study_data`
    DISABLE KEYS */;
INSERT INTO `Study_data`
VALUES (3, 1),
       (3, 2),
       (1, 3),
       (2, 4);
/*!40000 ALTER TABLE `Study_data`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Study_species`
--

DROP TABLE IF EXISTS `Study_species`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Study_species`
(
    `study_id`      int          NOT NULL,
    `genus`         varchar(255) NOT NULL,
    `specific_name` varchar(255) NOT NULL,
    PRIMARY KEY (`study_id`, `genus`, `specific_name`),
    KEY `genus` (`genus`, `specific_name`),
    CONSTRAINT `Study_species_ibfk_1` FOREIGN KEY (`study_id`) REFERENCES `Study` (`study_id`),
    CONSTRAINT `Study_species_ibfk_7` FOREIGN KEY (`genus`, `specific_name`) REFERENCES `Species` (`genus`, `specific_name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Study_species`
--

LOCK TABLES `Study_species` WRITE;
/*!40000 ALTER TABLE `Study_species`
    DISABLE KEYS */;
INSERT INTO `Study_species`
VALUES (3, 'Ardeotis', 'nigriceps'),
       (1, 'Panthera', 'tigris'),
       (3, 'Panthera', 'tigris'),
       (1, 'Python', 'molurus'),
       (2, 'Python', 'molurus');
/*!40000 ALTER TABLE `Study_species`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sub_service`
--

DROP TABLE IF EXISTS `Sub_service`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sub_service`
(
    `sub_service_id` int NOT NULL AUTO_INCREMENT,
    `service_id`     int  DEFAULT NULL,
    `timings`        time DEFAULT NULL,
    PRIMARY KEY (`sub_service_id`),
    KEY `service_id` (`service_id`),
    CONSTRAINT `Sub_service_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `Services` (`service_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 75
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sub_service`
--

LOCK TABLES `Sub_service` WRITE;
/*!40000 ALTER TABLE `Sub_service`
    DISABLE KEYS */;
INSERT INTO `Sub_service`
VALUES (1, 1, '06:00:00'),
       (2, 1, '16:00:00'),
       (3, 2, '06:00:00'),
       (4, 2, '16:00:00'),
       (5, 3, '19:00:00'),
       (6, 3, '19:30:00'),
       (7, 3, '20:00:00'),
       (8, 4, '13:30:00'),
       (9, 4, '14:30:00'),
       (10, 4, '10:00:00'),
       (11, 5, '09:00:00'),
       (12, 6, '07:00:00'),
       (13, 6, '16:00:00'),
       (14, 7, '07:00:00'),
       (15, 7, '17:00:00'),
       (16, 8, '13:00:00'),
       (17, 8, '14:00:00'),
       (18, 9, '07:00:00'),
       (20, 10, '16:00:00'),
       (21, 11, '16:00:00'),
       (22, 12, '15:00:00'),
       (23, 13, '10:00:00'),
       (24, 13, '14:00:00'),
       (25, 14, '10:00:00'),
       (26, 14, '14:00:00'),
       (27, 15, '09:00:00'),
       (28, 16, '06:30:00'),
       (29, 17, '06:30:00'),
       (30, 18, '10:30:00'),
       (32, 18, '15:00:00'),
       (33, 12, '10:00:00'),
       (34, 12, '13:00:00'),
       (38, 20, '06:00:00'),
       (39, 20, '16:00:00'),
       (40, 21, '06:00:00'),
       (41, 21, '16:00:00'),
       (42, 22, '19:00:00'),
       (43, 22, '19:30:00'),
       (44, 22, '20:00:00'),
       (45, 23, '10:00:00'),
       (46, 23, '13:30:00'),
       (47, 23, '14:30:00'),
       (48, 24, '09:00:00'),
       (49, 25, '07:00:00'),
       (50, 25, '16:00:00'),
       (51, 26, '07:00:00'),
       (52, 26, '17:00:00'),
       (53, 27, '13:00:00'),
       (54, 27, '14:00:00'),
       (55, 28, '07:00:00'),
       (56, 28, '16:00:00'),
       (57, 29, '16:00:00'),
       (58, 30, '16:00:00'),
       (60, 32, '13:00:00'),
       (61, 32, '15:00:00'),
       (62, 32, '10:00:00'),
       (63, 33, '14:00:00'),
       (64, 33, '10:00:00'),
       (65, 34, '14:00:00'),
       (66, 34, '09:00:00'),
       (67, 35, '06:30:00'),
       (68, 36, '06:30:00'),
       (69, 37, '10:30:00'),
       (70, 38, '12:30:00'),
       (71, 38, '15:00:00'),
       (72, 38, '09:00:00'),
       (73, 39, '10:00:00'),
       (74, 39, '11:00:00');
/*!40000 ALTER TABLE `Sub_service`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sub_service_timings`
--

DROP TABLE IF EXISTS `Sub_service_timings`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sub_service_timings`
(
    `sub_service_id` int  NOT NULL,
    `availability`   int            DEFAULT NULL,
    `capacity`       int            DEFAULT NULL,
    `date`           date NOT NULL,
    `price`          decimal(10, 2) DEFAULT NULL,
    PRIMARY KEY (`sub_service_id`, `date`),
    CONSTRAINT `Sub_service_timings_Sub_service_sub_service_id_fk` FOREIGN KEY (`sub_service_id`) REFERENCES `Sub_service` (`sub_service_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sub_service_timings`
--

LOCK TABLES `Sub_service_timings` WRITE;
/*!40000 ALTER TABLE `Sub_service_timings`
    DISABLE KEYS */;
INSERT INTO `Sub_service_timings`
VALUES (1, 0, 10, '2018-10-12', 1100.00),
       (1, 24, 24, '2020-11-10', 1700.00),
       (1, 12, 12, '2020-11-11', 1100.00),
       (1, 24, 24, '2020-11-12', 1700.00),
       (1, 24, 24, '2020-11-13', 1700.00),
       (1, 12, 12, '2020-11-14', 1100.00),
       (1, 24, 24, '2020-11-15', 1700.00),
       (2, 0, 10, '2018-10-12', 1100.00),
       (2, 19, 19, '2020-11-10', 1700.00),
       (2, 15, 15, '2020-11-11', 900.00),
       (2, 12, 12, '2020-11-12', 1100.00),
       (2, 24, 24, '2020-11-13', 1700.00),
       (2, 12, 12, '2020-11-14', 1100.00),
       (2, 24, 24, '2020-11-15', 1700.00),
       (3, 0, 10, '2018-10-12', 999.00),
       (3, 9, 9, '2020-11-10', 2700.00),
       (3, 5, 5, '2020-11-11', 900.00),
       (3, 19, 19, '2020-11-12', 1700.00),
       (3, 24, 24, '2020-11-13', 1700.00),
       (3, 12, 12, '2020-11-14', 1100.00),
       (3, 24, 24, '2020-11-15', 1700.00),
       (4, 0, 10, '2018-10-12', 999.00),
       (4, 3, 3, '2020-11-10', 2600.00),
       (4, 16, 16, '2020-11-11', 1100.00),
       (4, 15, 15, '2020-11-12', 900.00),
       (5, 0, 10, '2018-10-12', 999.00),
       (5, 7, 7, '2020-11-10', 200.00),
       (5, 7, 7, '2020-11-11', 2600.00),
       (5, 9, 9, '2020-11-12', 2700.00),
       (6, 0, 10, '2018-10-12', 999.00),
       (6, 25, 25, '2020-11-10', 2600.00),
       (6, 15, 15, '2020-11-11', 2800.00),
       (6, 5, 5, '2020-11-12', 900.00),
       (7, 0, 10, '2018-10-12', 999.00),
       (7, 12, 12, '2020-11-10', 1700.00),
       (7, 24, 24, '2020-11-11', 1500.00),
       (7, 3, 3, '2020-11-12', 2600.00),
       (8, 0, 10, '2018-10-12', 999.00),
       (8, 16, 16, '2020-11-10', 2000.00),
       (8, 12, 12, '2020-11-11', 2800.00),
       (8, 16, 16, '2020-11-12', 1100.00),
       (9, 0, 10, '2018-10-12', 1700.00),
       (9, 23, 23, '2020-11-10', 700.00),
       (9, 18, 18, '2020-11-11', 100.00),
       (9, 7, 7, '2020-11-12', 200.00),
       (10, 0, 10, '2018-10-12', 1700.00),
       (10, 25, 25, '2020-11-10', 700.00),
       (10, 10, 10, '2020-11-11', 2600.00),
       (10, 7, 7, '2020-11-12', 2600.00),
       (11, 0, 10, '2018-10-12', 1700.00),
       (11, 14, 14, '2020-11-10', 1200.00),
       (11, 12, 13, '2020-11-11', 100.00),
       (11, 25, 25, '2020-11-12', 2600.00),
       (12, 0, 10, '2018-10-12', 1700.00),
       (12, 1, 1, '2020-11-10', 1100.00),
       (12, 5, 5, '2020-11-11', 700.00),
       (12, 15, 15, '2020-11-12', 2800.00),
       (13, 0, 10, '2018-10-12', 1700.00),
       (13, 8, 8, '2020-11-10', 800.00),
       (13, 14, 14, '2020-11-11', 1600.00),
       (13, 12, 12, '2020-11-12', 1700.00),
       (14, 0, 10, '2018-10-12', 1700.00),
       (14, 1, 1, '2020-11-10', 200.00),
       (14, 14, 14, '2020-11-11', 1000.00),
       (14, 24, 24, '2020-11-12', 1500.00),
       (15, 0, 10, '2018-10-12', 1700.00),
       (15, 9, 9, '2020-11-10', 1100.00),
       (15, 19, 19, '2020-11-11', 1400.00),
       (15, 16, 16, '2020-11-12', 2000.00),
       (16, 0, 10, '2018-10-12', 1700.00),
       (16, 13, 13, '2020-11-10', 2200.00),
       (16, 15, 15, '2020-11-11', 2300.00),
       (16, 12, 12, '2020-11-12', 2800.00),
       (17, 0, 10, '2018-10-12', 1700.00),
       (17, 17, 17, '2020-11-10', 1100.00),
       (17, 26, 26, '2020-11-11', 2800.00),
       (17, 23, 23, '2020-11-12', 700.00),
       (18, 0, 10, '2018-10-12', 1700.00),
       (18, 16, 16, '2020-11-10', 1800.00),
       (18, 17, 17, '2020-11-11', 2000.00),
       (18, 18, 18, '2020-11-12', 100.00),
       (20, 0, 10, '2018-10-12', 1700.00),
       (20, 26, 26, '2020-11-10', 2800.00),
       (20, 20, 20, '2020-11-11', 1500.00),
       (20, 10, 10, '2020-11-12', 2600.00),
       (21, 0, 10, '2018-10-12', 1700.00),
       (21, 26, 26, '2020-11-10', 2900.00),
       (21, 8, 8, '2020-11-11', 1900.00),
       (21, 14, 14, '2020-11-12', 1200.00),
       (22, 0, 10, '2018-10-12', 1700.00),
       (22, 6, 6, '2020-11-10', 1500.00),
       (22, 19, 19, '2020-11-11', 1500.00),
       (22, 13, 13, '2020-11-12', 100.00),
       (23, 0, 10, '2018-10-12', 1700.00),
       (23, 8, 8, '2020-11-10', 2000.00),
       (23, 26, 26, '2020-11-11', 1300.00),
       (23, 1, 1, '2020-11-12', 1100.00),
       (24, 0, 10, '2018-10-12', 1100.00),
       (24, 15, 15, '2020-11-10', 600.00),
       (24, 8, 8, '2020-11-11', 1100.00),
       (24, 5, 5, '2020-11-12', 700.00),
       (25, 0, 10, '2018-10-12', 1100.00),
       (25, 9, 9, '2020-11-10', 500.00),
       (25, 24, 24, '2020-11-11', 2900.00),
       (25, 8, 8, '2020-11-12', 800.00),
       (26, 0, 10, '2018-10-12', 1100.00),
       (26, 12, 12, '2020-11-10', 1700.00),
       (26, 7, 7, '2020-11-11', 300.00),
       (26, 14, 14, '2020-11-12', 1600.00),
       (27, 0, 10, '2018-10-12', 1100.00),
       (27, 22, 22, '2020-11-10', 2200.00),
       (27, 17, 17, '2020-11-11', 200.00),
       (27, 1, 1, '2020-11-12', 200.00),
       (28, 0, 10, '2018-10-12', 1100.00),
       (28, 19, 19, '2020-11-10', 100.00),
       (28, 15, 15, '2020-11-11', 1400.00),
       (28, 14, 14, '2020-11-12', 1000.00),
       (29, 0, 10, '2018-10-12', 1100.00),
       (29, 10, 10, '2020-11-10', 2700.00),
       (29, 13, 13, '2020-11-11', 100.00),
       (29, 9, 9, '2020-11-12', 1100.00),
       (30, 0, 10, '2018-10-12', 1100.00),
       (30, 24, 24, '2020-11-10', 200.00),
       (30, 8, 8, '2020-11-11', 700.00),
       (30, 19, 19, '2020-11-12', 1400.00),
       (32, 0, 10, '2018-10-12', 1100.00),
       (32, 21, 21, '2020-11-10', 200.00),
       (32, 11, 11, '2020-11-11', 1600.00),
       (32, 20, 20, '2020-11-12', 2000.00),
       (33, 0, 10, '2018-10-12', 1100.00),
       (33, 24, 24, '2020-11-10', 1700.00),
       (33, 12, 12, '2020-11-11', 1100.00),
       (33, 24, 24, '2020-11-12', 1700.00),
       (33, 24, 24, '2020-11-13', 1700.00),
       (33, 12, 12, '2020-11-14', 1100.00),
       (33, 24, 24, '2020-11-15', 1700.00),
       (34, 0, 10, '2018-10-12', 723.00),
       (34, 19, 19, '2020-11-10', 1700.00),
       (34, 15, 15, '2020-11-11', 900.00),
       (34, 12, 12, '2020-11-12', 1100.00),
       (34, 24, 24, '2020-11-13', 1700.00),
       (34, 12, 12, '2020-11-14', 1100.00),
       (34, 24, 24, '2020-11-15', 1700.00),
       (38, 0, 10, '2018-10-12', 723.00),
       (38, 25, 25, '2020-11-10', 2600.00),
       (38, 15, 15, '2020-11-11', 2800.00),
       (38, 5, 5, '2020-11-12', 900.00),
       (39, 0, 10, '2018-10-12', 723.00),
       (39, 12, 12, '2020-11-10', 1700.00),
       (39, 24, 24, '2020-11-11', 1500.00),
       (39, 3, 3, '2020-11-12', 2600.00),
       (40, 0, 10, '2018-10-12', 723.00),
       (40, 16, 16, '2020-11-10', 2000.00),
       (40, 12, 12, '2020-11-11', 2800.00),
       (40, 16, 16, '2020-11-12', 1100.00),
       (41, 0, 10, '2018-10-12', 723.00),
       (41, 23, 23, '2020-11-10', 700.00),
       (41, 18, 18, '2020-11-11', 100.00),
       (41, 7, 7, '2020-11-12', 200.00),
       (42, 0, 10, '2018-10-12', 723.00),
       (42, 25, 25, '2020-11-10', 700.00),
       (42, 10, 10, '2020-11-11', 2600.00),
       (42, 7, 7, '2020-11-12', 2600.00),
       (43, 0, 10, '2018-10-12', 723.00),
       (43, 14, 14, '2020-11-10', 1200.00),
       (43, 13, 13, '2020-11-11', 100.00),
       (43, 25, 25, '2020-11-12', 2600.00),
       (44, 0, 10, '2018-10-12', 723.00),
       (44, 1, 1, '2020-11-10', 1100.00),
       (44, 4, 5, '2020-11-11', 700.00),
       (44, 15, 15, '2020-11-12', 2800.00),
       (45, 0, 10, '2018-10-12', 723.00),
       (45, 8, 8, '2020-11-10', 800.00),
       (45, 14, 14, '2020-11-11', 1600.00),
       (45, 12, 12, '2020-11-12', 1700.00),
       (46, 0, 10, '2018-10-12', 723.00),
       (46, 1, 1, '2020-11-10', 200.00),
       (46, 14, 14, '2020-11-11', 1000.00),
       (46, 24, 24, '2020-11-12', 1500.00),
       (47, 0, 10, '2018-10-12', 723.00),
       (47, 9, 9, '2020-11-10', 1100.00),
       (47, 19, 19, '2020-11-11', 1400.00),
       (47, 16, 16, '2020-11-12', 2000.00),
       (48, 0, 10, '2018-10-12', 723.00),
       (48, 13, 13, '2020-11-10', 2200.00),
       (48, 15, 15, '2020-11-11', 2300.00),
       (48, 12, 12, '2020-11-12', 2800.00),
       (49, 0, 10, '2018-10-12', 723.00),
       (49, 17, 17, '2020-11-10', 1100.00),
       (49, 26, 26, '2020-11-11', 2800.00),
       (49, 23, 23, '2020-11-12', 700.00),
       (50, 0, 10, '2018-10-12', 723.00),
       (50, 16, 16, '2020-11-10', 1800.00),
       (50, 17, 17, '2020-11-11', 2000.00),
       (50, 18, 18, '2020-11-12', 100.00),
       (51, 0, 10, '2018-10-12', 723.00),
       (51, 8, 8, '2020-11-10', 2400.00),
       (51, 17, 17, '2020-11-11', 1400.00),
       (51, 25, 25, '2020-11-12', 700.00),
       (52, 0, 10, '2018-10-12', 723.00),
       (52, 26, 26, '2020-11-10', 2800.00),
       (52, 20, 20, '2020-11-11', 1500.00),
       (52, 10, 10, '2020-11-12', 2600.00),
       (53, 0, 10, '2018-10-12', 723.00),
       (53, 26, 26, '2020-11-10', 2900.00),
       (53, 7, 8, '2020-11-11', 1900.00),
       (53, 14, 14, '2020-11-12', 1200.00),
       (54, 0, 10, '2018-10-12', 723.00),
       (54, 6, 6, '2020-11-10', 1500.00),
       (54, 19, 19, '2020-11-11', 1500.00),
       (54, 13, 13, '2020-11-12', 100.00),
       (55, 0, 10, '2018-10-12', 723.00),
       (55, 8, 8, '2020-11-10', 2000.00),
       (55, 26, 26, '2020-11-11', 1300.00),
       (55, 1, 1, '2020-11-12', 1100.00),
       (56, 0, 10, '2018-10-12', 723.00),
       (56, 15, 15, '2020-11-10', 600.00),
       (56, 8, 8, '2020-11-11', 1100.00),
       (56, 5, 5, '2020-11-12', 700.00),
       (57, 0, 10, '2018-10-12', 723.00),
       (57, 9, 9, '2020-11-10', 500.00),
       (57, 24, 24, '2020-11-11', 2900.00),
       (57, 8, 8, '2020-11-12', 800.00),
       (58, 0, 10, '2018-10-12', 723.00),
       (58, 12, 12, '2020-11-10', 1700.00),
       (58, 6, 7, '2020-11-11', 300.00),
       (58, 14, 14, '2020-11-12', 1600.00),
       (60, 0, 10, '2018-10-12', 723.00),
       (60, 19, 19, '2020-11-10', 100.00),
       (60, 15, 15, '2020-11-11', 1400.00),
       (60, 14, 14, '2020-11-12', 1000.00),
       (61, 0, 10, '2018-10-12', 1100.00),
       (61, 10, 10, '2020-11-10', 2700.00),
       (61, 13, 13, '2020-11-11', 100.00),
       (61, 9, 9, '2020-11-12', 1100.00),
       (62, 0, 10, '2018-10-12', 1100.00),
       (62, 24, 24, '2020-11-10', 200.00),
       (62, 7, 8, '2020-11-11', 700.00),
       (62, 19, 19, '2020-11-12', 1400.00),
       (63, 0, 10, '2018-10-12', 1100.00),
       (63, 22, 22, '2020-11-10', 1800.00),
       (63, 7, 7, '2020-11-11', 900.00),
       (63, 13, 13, '2020-11-12', 2200.00),
       (64, 0, 10, '2018-10-12', 999.00),
       (64, 21, 21, '2020-11-10', 200.00),
       (64, 11, 11, '2020-11-11', 1600.00),
       (64, 20, 20, '2020-11-12', 2000.00),
       (65, 0, 10, '2018-10-12', 999.00),
       (65, 8, 8, '2020-11-10', 2000.00),
       (65, 26, 26, '2020-11-11', 1300.00),
       (65, 1, 1, '2020-11-12', 1100.00),
       (66, 0, 10, '2018-10-12', 999.00),
       (66, 15, 15, '2020-11-10', 600.00),
       (66, 8, 8, '2020-11-11', 1100.00),
       (66, 5, 5, '2020-11-12', 700.00),
       (67, 0, 10, '2018-10-12', 999.00),
       (67, 9, 9, '2020-11-10', 500.00),
       (67, 24, 24, '2020-11-11', 2900.00),
       (67, 8, 8, '2020-11-12', 800.00),
       (68, 0, 10, '2018-10-12', 999.00),
       (68, 12, 12, '2020-11-10', 1700.00),
       (68, 7, 7, '2020-11-11', 300.00),
       (68, 14, 14, '2020-11-12', 1600.00),
       (69, 0, 10, '2018-10-12', 999.00),
       (69, 22, 22, '2020-11-10', 2200.00),
       (69, 17, 17, '2020-11-11', 200.00),
       (69, 1, 1, '2020-11-12', 200.00),
       (70, 0, 10, '2018-10-12', 999.00),
       (70, 19, 19, '2020-11-10', 100.00),
       (70, 15, 15, '2020-11-11', 1400.00),
       (70, 14, 14, '2020-11-12', 1000.00),
       (71, 0, 10, '2018-10-12', 999.00),
       (71, 10, 10, '2020-11-10', 2700.00),
       (71, 13, 13, '2020-11-11', 100.00),
       (71, 9, 9, '2020-11-12', 1100.00),
       (72, 0, 10, '2018-10-12', 1100.00),
       (72, 24, 24, '2020-11-10', 200.00),
       (72, 8, 8, '2020-11-11', 700.00),
       (72, 19, 19, '2020-11-12', 1400.00),
       (73, 0, 10, '2018-10-12', 1100.00),
       (73, 22, 22, '2020-11-10', 1800.00),
       (73, 7, 7, '2020-11-11', 900.00),
       (73, 13, 13, '2020-11-12', 2200.00),
       (74, 0, 10, '2018-10-12', 1100.00),
       (74, 21, 21, '2020-11-10', 200.00),
       (74, 11, 11, '2020-11-11', 1600.00),
       (74, 20, 20, '2020-11-12', 2000.00);
/*!40000 ALTER TABLE `Sub_service_timings`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trail`
--

DROP TABLE IF EXISTS `Trail`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trail`
(
    `feature_id`   int          NOT NULL,
    `name`         varchar(255) NOT NULL,
    `length`       decimal(10, 0) DEFAULT NULL,
    `spatial_data` geometry       DEFAULT NULL,
    PRIMARY KEY (`feature_id`),
    CONSTRAINT `Trail_ibfk_1` FOREIGN KEY (`feature_id`) REFERENCES `Features` (`feature_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trail`
--

LOCK TABLES `Trail` WRITE;
/*!40000 ALTER TABLE `Trail`
    DISABLE KEYS */;
INSERT INTO `Trail`
VALUES (2, 'Boo Hoff Trail', 10,
        _binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�?\0\0\0\0\0\0\�?\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@'),
       (3, 'Mary\'s Rock Trail', 12,
        _binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�?\0\0\0\0\0\0\0@\0\0\0\0\0\0@\0\0\0\0\0\0@\0\0\0\0\0\0\"@\0\0\0\0\0\0@\0\0\0\0\0\0$@\0\0\0\0\0\0@'),
       (7, 'Bumpass Hell Trail', 11,
        _binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�?\0\0\0\0\0\0\0@\0\0\0\0\0\0@\0\0\0\0\0\0 @\0\0\0\0\0\0$@\0\0\0\0\0\01@');
/*!40000 ALTER TABLE `Trail`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transaction`
(
    `transaction_id`      int       NOT NULL AUTO_INCREMENT,
    `price`               int       NOT NULL,
    `date_of_transaction` timestamp NULL                                                                    DEFAULT NULL,
    `pay_method`          enum ('mobile transfer','credit card','net banking','cash','cheque','debit card') DEFAULT NULL,
    `booking_id`          int                                                                               DEFAULT NULL,
    PRIMARY KEY (`transaction_id`),
    KEY `Transaction_Booking_booking_id_fk` (`booking_id`),
    CONSTRAINT `Transaction_Booking_booking_id_fk` FOREIGN KEY (`booking_id`) REFERENCES `Booking` (`booking_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction`
    DISABLE KEYS */;
INSERT INTO `Transaction`
VALUES (1, 2200, '2020-10-04 10:07:17', 'cheque', 1);
/*!40000 ALTER TABLE `Transaction`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User`
(
    `user_id`        int          NOT NULL AUTO_INCREMENT,
    `username`       varchar(255) NOT NULL,
    `email`          varchar(255) NOT NULL,
    `password`       varchar(255) NOT NULL,
    `contact_number` varchar(15) DEFAULT NULL,
    `date_of_birth`  date        DEFAULT NULL,
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `email` (`email`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User`
    DISABLE KEYS */;
INSERT INTO `User`
VALUES (1, 'Mekhi Schmeler', 'lindgren.ezra@morrlibsu.ga', 'abcd', '4358822482', '2020-10-15'),
       (2, 'Jalen Barton', 'fhettinger@noblechevy.com', 'abcd', '2054577447', '2020-10-20'),
       (3, 'Favian Nolan', 'aliya45@meliece.com', 'abcd', '8242065279', '2020-10-14'),
       (4, 'Fritz Lockman', 'eyon.wehner@malomies.com', 'abcd', '2751300966', '2020-10-23'),
       (5, 'Lane Von', 'kjast@kingleo.us', 'abcd', '3847866482', '2020-10-30'),
       (6, 'kannav mehta', 'kannav@email.com', 'abcd', '1234567890', '2000-01-01'),
       (7, 'triansh', 'triansh@email.com', 'abcd', '9982443531', '2000-10-10'),
       (8, 'suchitra', 'suchitra@email.com', 'abcd', '1234567890', '2000-01-01'),
       (9, 'ta', 'ta@dna.ta', 'tahumain', '1234567890', '2020-01-01'),
       (10, 'Raj', 'raj@email.com', 'abcd', '8291379721', '2020-01-10');
/*!40000 ALTER TABLE `User`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ViewPoints`
--

DROP TABLE IF EXISTS `ViewPoints`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ViewPoints`
(
    `feature_id` int          NOT NULL,
    `name`       varchar(255) NOT NULL,
    PRIMARY KEY (`feature_id`),
    CONSTRAINT `ViewPoints_ibfk_1` FOREIGN KEY (`feature_id`) REFERENCES `Features` (`feature_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ViewPoints`
--

LOCK TABLES `ViewPoints` WRITE;
/*!40000 ALTER TABLE `ViewPoints`
    DISABLE KEYS */;
INSERT INTO `ViewPoints`
VALUES (5, 'Stony Hill Overlook'),
       (8, 'Yosemite Falls'),
       (10, 'Snake River Overlook'),
       (11, 'Hurricane Ridge Visitor Center'),
       (19, 'New World Overlook'),
       (22, 'Old Monk Falls'),
       (24, 'Death Lake Overlook'),
       (25, 'Orchid Visitor Center');
/*!40000 ALTER TABLE `ViewPoints`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Volunteer`
--

DROP TABLE IF EXISTS `Volunteer`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Volunteer`
(
    `volunteer_permit_id` int        NOT NULL AUTO_INCREMENT,
    `user_id`             int      DEFAULT NULL,
    `emp_incharge`        int      DEFAULT NULL,
    `dep_number`          int      DEFAULT NULL,
    `period`              datetime DEFAULT (now()),
    `job_description`     longtext,
    `national_park`       varchar(4) NOT NULL,
    PRIMARY KEY (`volunteer_permit_id`),
    KEY `user_id` (`user_id`),
    KEY `emp_incharge` (`emp_incharge`),
    KEY `national_park` (`national_park`, `dep_number`),
    CONSTRAINT `Volunteer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
    CONSTRAINT `Volunteer_ibfk_2` FOREIGN KEY (`national_park`, `dep_number`) REFERENCES `Department` (`contained_in`, `dep_number`),
    CONSTRAINT `Volunteer_ibfk_3` FOREIGN KEY (`emp_incharge`) REFERENCES `Employee` (`emp_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Volunteer`
--

LOCK TABLES `Volunteer` WRITE;
/*!40000 ALTER TABLE `Volunteer`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `Volunteer`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zone`
--

DROP TABLE IF EXISTS `Zone`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zone`
(
    `belongs_to`  varchar(4) NOT NULL,
    `zone_number` int        NOT NULL,
    `contact`     varchar(15) DEFAULT NULL,
    PRIMARY KEY (`zone_number`, `belongs_to`),
    KEY `belongs_to` (`belongs_to`),
    CONSTRAINT `Zone_ibfk_1` FOREIGN KEY (`belongs_to`) REFERENCES `National_Park` (`unit_code`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zone`
--

LOCK TABLES `Zone` WRITE;
/*!40000 ALTER TABLE `Zone`
    DISABLE KEYS */;
INSERT INTO `Zone`
VALUES ('CRBT', 1, '999999999'),
       ('KNHA', 1, '932787833'),
       ('KZRG', 1, '932032131'),
       ('CRBT', 2, '993009833'),
       ('KNHA', 2, '932232132'),
       ('CRBT', 3, '898329833');
/*!40000 ALTER TABLE `Zone`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zone_contains`
--

DROP TABLE IF EXISTS `Zone_contains`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zone_contains`
(
    `zone_number` int        NOT NULL,
    `feature_id`  int        NOT NULL,
    `belongs_to`  varchar(4) NOT NULL,
    PRIMARY KEY (`zone_number`, `feature_id`, `belongs_to`),
    KEY `feature_id` (`feature_id`),
    KEY `Zone_contains_Zone_zone_number_belongs_to_fk` (`zone_number`, `belongs_to`),
    CONSTRAINT `Zone_contains_ibfk_2` FOREIGN KEY (`feature_id`) REFERENCES `Features` (`feature_id`),
    CONSTRAINT `Zone_contains_Zone_zone_number_belongs_to_fk` FOREIGN KEY (`zone_number`, `belongs_to`) REFERENCES `Zone` (`zone_number`, `belongs_to`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zone_contains`
--

LOCK TABLES `Zone_contains` WRITE;
/*!40000 ALTER TABLE `Zone_contains`
    DISABLE KEYS */;
INSERT INTO `Zone_contains`
VALUES (1, 1, 'CRBT'),
       (1, 2, 'CRBT'),
       (1, 3, 'CRBT'),
       (1, 4, 'CRBT'),
       (1, 5, 'CRBT'),
       (2, 6, 'CRBT'),
       (2, 7, 'CRBT'),
       (2, 8, 'CRBT'),
       (2, 9, 'CRBT'),
       (3, 10, 'CRBT'),
       (3, 11, 'CRBT'),
       (3, 12, 'CRBT'),
       (1, 13, 'KNHA'),
       (1, 14, 'KNHA'),
       (1, 15, 'KNHA'),
       (1, 16, 'KNHA'),
       (2, 17, 'KNHA'),
       (2, 18, 'KNHA'),
       (2, 19, 'KNHA'),
       (2, 20, 'KNHA'),
       (2, 21, 'KNHA'),
       (1, 22, 'KZRG'),
       (1, 23, 'KZRG'),
       (1, 24, 'KZRG'),
       (1, 25, 'KZRG'),
       (1, 26, 'KZRG'),
       (1, 27, 'KZRG');
/*!40000 ALTER TABLE `Zone_contains`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zone_terrain`
--

DROP TABLE IF EXISTS `Zone_terrain`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zone_terrain`
(
    `national_park` varchar(4)                                                             NOT NULL,
    `zone_number`   int                                                                    NOT NULL,
    `terrain`       enum ('Marshland','Desert','Savannah','Mountainous','Forest','Tundra') NOT NULL,
    PRIMARY KEY (`zone_number`, `terrain`, `national_park`),
    KEY `national_park` (`national_park`),
    KEY `Zone_terrain_ibfk_1` (`zone_number`, `national_park`),
    CONSTRAINT `Zone_terrain_ibfk_1` FOREIGN KEY (`zone_number`, `national_park`) REFERENCES `Zone` (`zone_number`, `belongs_to`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zone_terrain`
--

LOCK TABLES `Zone_terrain` WRITE;
/*!40000 ALTER TABLE `Zone_terrain`
    DISABLE KEYS */;
INSERT INTO `Zone_terrain`
VALUES ('CRBT', 1, 'Marshland'),
       ('CRBT', 1, 'Forest'),
       ('KNHA', 2, 'Desert'),
       ('KNHA', 2, 'Savannah'),
       ('KZRG', 1, 'Mountainous');
/*!40000 ALTER TABLE `Zone_terrain`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2020-10-08 21:58:23
