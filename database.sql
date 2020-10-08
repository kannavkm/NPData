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
  AUTO_INCREMENT = 24
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
       (23, 6, 1, 1);
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
       ('Mammalia', 'Chiroptera'),
       ('Mammalia', 'Felidae'),
       ('mammalia', 'perissodactyla'),
       ('Mammalia', 'Proboscidea'),
       ('Mammalia', 'Rodentia'),
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
VALUES (1, '2020-10-04 06:01:57', 1212, 12),
       (2, '2020-06-30 12:00:00', 28, 14),
       (3, '2018-07-01 12:00:00', 30, 15),
       (5, '2015-10-10 14:30:00', 44, 38),
       (6, '2017-03-15 15:45:00', 24, 13);
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
  AUTO_INCREMENT = 10
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
       (9, 'kk', '2000-02-02', '1234567890', 'kk@k.com', 'Male', '2000-02-02', 'kk', 1, 'CRBT');
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
VALUES ('Ciconiidae', 'Leptoptilos'),
       ('Elephantidae', 'Elephas'),
       ('Fabaceae', 'Saraca'),
       ('felidae', 'Neofelis'),
       ('felidae', 'Panthera'),
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
VALUES ('carnivora', 'felidae'),
       ('ciconiiformes', 'Ciconiidae'),
       ('Fabales', 'Fabaceae'),
       ('Otidiformes', 'Otididae'),
       ('perissodactyla', 'rhinocerotidae'),
       ('Proboscidea', 'Elephantidae'),
       ('Rosales', 'Moraceae'),
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
  AUTO_INCREMENT = 10
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
VALUES (1, 'Panthera', 'tigris', 'CRBT', 1, 1, 'uncommon', 'Verified', '2010-06-30', 'Full Year', 124),
       (2, 'Panthera', 'tigris', 'KLDO', 1, 1, 'uncommon', 'Verified', '2015-01-31', 'Full Year', 124),
       (3, 'Panthera', 'tigris', 'MNAS', 1, 1, 'uncommon', 'Verified', '2020-09-30', 'Full Year', 124),
       (4, 'Ficus', 'religiosa', 'KNHA', 1, 0, 'common', 'Verified', '2016-12-31', 'Full Year', 22),
       (5, 'Python', 'molurus', 'KLDO', 1, 0, 'uncommon', 'Non Verified', '2015-08-20', 'Seasonal', 44),
       (6, 'Ardeotis', 'nigriceps', 'KLDO', 1, 1, 'rare', 'Non Verified', '2010-10-10', 'Seasonal', 56),
       (7, 'Python', 'molurus', 'KNHA', 1, 0, 'uncommon', 'Verified', '2018-11-15', 'Full Year', 232),
       (9, 'rhinoceros', 'unicornis', 'CRBT', 1, 1, 'rare', 'Non Verified', '2020-01-01', 'Full Year', 100);
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
  AUTO_INCREMENT = 19
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
       (18, 'Visiting gardens', 'A tour to botanical and flower gardens', 'CRBT');
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
VALUES ('Ardeotis', 'nigriceps', '172692', 'Great Indian Bustard', 'Critically Endangered', 12),
       ('Ficus', 'religiosa', '66387', 'Peepal Tree', 'Least Concern', 1000),
       ('Leptoptilos', 'dubius', '1940340', 'Greater adjutant', 'Endangered', 35),
       ('Panthera', 'leo', '83386', 'Asiatic lion', 'Endangered', 18),
       ('Panthera', 'tigris', '74535', 'Royal Bengal Tiger', 'Endangered', 10),
       ('Python', 'molurus', '621282', 'Indian rock python', 'Vulnerable', 38),
       ('rhinoceros', 'unicornis', '1234567891', 'indian rhinoceros', 'Vulnerable', NULL),
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
  AUTO_INCREMENT = 33
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
       (19, 9, '16:00:00'),
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
       (31, 18, '12:30:00'),
       (32, 18, '15:00:00');
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
VALUES (1, 15, 24, '2020-11-10', 1700.00),
       (1, 5, 12, '2020-11-11', 1100.00),
       (1, 15, 24, '2020-11-12', 1700.00),
       (2, 16, 19, '2020-11-10', 1700.00),
       (2, 15, 15, '2020-11-11', 900.00),
       (2, 5, 12, '2020-11-12', 1100.00),
       (3, 7, 9, '2020-11-10', 2700.00),
       (3, 1, 5, '2020-11-11', 900.00),
       (3, 16, 19, '2020-11-12', 1700.00),
       (4, 2, 3, '2020-11-10', 2600.00),
       (4, 7, 16, '2020-11-11', 1100.00),
       (4, 15, 15, '2020-11-12', 900.00),
       (5, 6, 7, '2020-11-10', 200.00),
       (5, 0, 7, '2020-11-11', 2600.00),
       (5, 7, 9, '2020-11-12', 2700.00),
       (6, 18, 25, '2020-11-10', 2600.00),
       (6, 11, 15, '2020-11-11', 2800.00),
       (6, 1, 5, '2020-11-12', 900.00),
       (7, 11, 12, '2020-11-10', 1700.00),
       (7, 17, 24, '2020-11-11', 1500.00),
       (7, 2, 3, '2020-11-12', 2600.00),
       (8, 14, 16, '2020-11-10', 2000.00),
       (8, 12, 12, '2020-11-11', 2800.00),
       (8, 7, 16, '2020-11-12', 1100.00),
       (9, 16, 23, '2020-11-10', 700.00),
       (9, 15, 18, '2020-11-11', 100.00),
       (9, 6, 7, '2020-11-12', 200.00),
       (10, 18, 25, '2020-11-10', 700.00),
       (10, 9, 10, '2020-11-11', 2600.00),
       (10, 0, 7, '2020-11-12', 2600.00),
       (11, 6, 14, '2020-11-10', 1200.00),
       (11, 11, 13, '2020-11-11', 100.00),
       (11, 18, 25, '2020-11-12', 2600.00),
       (12, 0, 1, '2020-11-10', 1100.00),
       (12, 1, 5, '2020-11-11', 700.00),
       (12, 11, 15, '2020-11-12', 2800.00),
       (13, 5, 8, '2020-11-10', 800.00),
       (13, 9, 14, '2020-11-11', 1600.00),
       (13, 11, 12, '2020-11-12', 1700.00),
       (14, 0, 1, '2020-11-10', 200.00),
       (14, 10, 14, '2020-11-11', 1000.00),
       (14, 17, 24, '2020-11-12', 1500.00),
       (15, 8, 9, '2020-11-10', 1100.00),
       (15, 11, 19, '2020-11-11', 1400.00),
       (15, 14, 16, '2020-11-12', 2000.00),
       (16, 13, 13, '2020-11-10', 2200.00),
       (16, 10, 15, '2020-11-11', 2300.00),
       (16, 12, 12, '2020-11-12', 2800.00),
       (17, 14, 17, '2020-11-10', 1100.00),
       (17, 19, 26, '2020-11-11', 2800.00),
       (17, 16, 23, '2020-11-12', 700.00),
       (18, 9, 16, '2020-11-10', 1800.00),
       (18, 11, 17, '2020-11-11', 2000.00),
       (18, 15, 18, '2020-11-12', 100.00),
       (19, 6, 8, '2020-11-10', 2400.00),
       (19, 14, 17, '2020-11-11', 1400.00),
       (19, 18, 25, '2020-11-12', 700.00),
       (20, 19, 26, '2020-11-10', 2800.00),
       (20, 18, 20, '2020-11-11', 1500.00),
       (20, 9, 10, '2020-11-12', 2600.00),
       (21, 17, 26, '2020-11-10', 2900.00),
       (21, 5, 8, '2020-11-11', 1900.00),
       (21, 6, 14, '2020-11-12', 1200.00),
       (22, 5, 6, '2020-11-10', 1500.00),
       (22, 15, 19, '2020-11-11', 1500.00),
       (22, 11, 13, '2020-11-12', 100.00),
       (23, 8, 8, '2020-11-10', 2000.00),
       (23, 18, 26, '2020-11-11', 1300.00),
       (23, 0, 1, '2020-11-12', 1100.00),
       (24, 7, 15, '2020-11-10', 600.00),
       (24, 0, 8, '2020-11-11', 1100.00),
       (24, 1, 5, '2020-11-12', 700.00),
       (25, 6, 9, '2020-11-10', 500.00),
       (25, 19, 24, '2020-11-11', 2900.00),
       (25, 5, 8, '2020-11-12', 800.00),
       (26, 7, 12, '2020-11-10', 1700.00),
       (26, 0, 7, '2020-11-11', 300.00),
       (26, 9, 14, '2020-11-12', 1600.00),
       (27, 17, 22, '2020-11-10', 2200.00),
       (27, 16, 17, '2020-11-11', 200.00),
       (27, 0, 1, '2020-11-12', 200.00),
       (28, 11, 19, '2020-11-10', 100.00),
       (28, 13, 15, '2020-11-11', 1400.00),
       (28, 10, 14, '2020-11-12', 1000.00),
       (29, 8, 10, '2020-11-10', 2700.00),
       (29, 11, 13, '2020-11-11', 100.00),
       (29, 8, 9, '2020-11-12', 1100.00),
       (30, 16, 24, '2020-11-10', 200.00),
       (30, 2, 8, '2020-11-11', 700.00),
       (30, 11, 19, '2020-11-12', 1400.00),
       (31, 15, 22, '2020-11-10', 1800.00),
       (31, 0, 7, '2020-11-11', 900.00),
       (31, 13, 13, '2020-11-12', 2200.00),
       (32, 15, 21, '2020-11-10', 200.00),
       (32, 7, 11, '2020-11-11', 1600.00),
       (32, 19, 20, '2020-11-12', 2000.00);
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
       (16, 'Bumpass Hell Trail', 11,
        _binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�?\0\0\0\0\0\0\0@\0\0\0\0\0\0@\0\0\0\0\0\0 @\0\0\0\0\0\0$@\0\0\0\0\0\01@'),
       (17, 'New world Trail', 12,
        _binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�?\0\0\0\0\0\0\0@\0\0\0\0\0\0@\0\0\0\0\0\0 @\0\0\0\0\0\0$@\0\0\0\0\0\01@'),
       (21, 'Today Trail', 11,
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
  AUTO_INCREMENT = 9
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
       (8, 'suchitra', 'suchitra@email.com', 'abcd', '1234567890', '2000-01-01');
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

-- Dump completed on 2020-10-08 14:53:18
