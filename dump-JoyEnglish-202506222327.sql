-- MySQL dump 10.13  Distrib 8.4.2, for Win64 (x86_64)
--
-- Host: localhost    Database: JoyEnglish
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB-ubu2404

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
-- Table structure for table `Classes`
--

DROP TABLE IF EXISTS `Classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Classes` (
  `ClassID` varchar(10) NOT NULL,
  `ClassName` varchar(50) NOT NULL,
  `Tuition` decimal(8,2) DEFAULT NULL,
  `Schedule` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classes`
--

LOCK TABLES `Classes` WRITE;
/*!40000 ALTER TABLE `Classes` DISABLE KEYS */;
INSERT INTO `Classes` VALUES ('C01','Puppy',9000.00,'每週二、五 16:30-18:30'),('C02','Sun',9000.00,'每週二、五 16:30-18:30'),('C03','Grass',10800.00,'每週一、四 16:30-18:30'),('C04','Nike',14400.00,'每週六 09:00-12:00'),('C05','Capybara',10800.00,'每週一、四 19:00-21:00');
/*!40000 ALTER TABLE `Classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmergencyContacts`
--

DROP TABLE IF EXISTS `EmergencyContacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmergencyContacts` (
  `ContactID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(10) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Relation` varchar(20) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ContactID`),
  KEY `idx_emergency_student` (`StudentID`),
  CONSTRAINT `EmergencyContacts_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmergencyContacts`
--

LOCK TABLES `EmergencyContacts` WRITE;
/*!40000 ALTER TABLE `EmergencyContacts` DISABLE KEYS */;
INSERT INTO `EmergencyContacts` VALUES (1,'S001','吳媽媽','母親','0912123456'),(2,'S002','蘇先生','父親','0923456789'),(3,'S002','洪小姐','母親','0911222333'),(4,'S003','侯媽媽','母親','0933444555'),(5,'S004','蔡爸爸','父親','0955666777'),(6,'S005','林先生','父親','0911999888'),(7,'S006','林先生','父親','0911999888'),(8,'S007','林小姐','姑姑','0988333845'),(9,'S008','黃先生','父親','0925816119'),(10,'S009','陳小姐','母親','0903618097'),(11,'S010','楊小姐','母親','0937256372');
/*!40000 ALTER TABLE `EmergencyContacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enrollment`
--

DROP TABLE IF EXISTS `Enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Enrollment` (
  `EnrollID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(10) DEFAULT NULL,
  `ClassID` varchar(10) DEFAULT NULL,
  `Term` varchar(20) DEFAULT NULL,
  `EnrollDate` date NOT NULL,
  PRIMARY KEY (`EnrollID`),
  KEY `ClassID` (`ClassID`),
  KEY `idx_enroll_student_class` (`StudentID`,`ClassID`),
  CONSTRAINT `Enrollment_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`StudentID`),
  CONSTRAINT `Enrollment_ibfk_2` FOREIGN KEY (`ClassID`) REFERENCES `Classes` (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enrollment`
--

LOCK TABLES `Enrollment` WRITE;
/*!40000 ALTER TABLE `Enrollment` DISABLE KEYS */;
INSERT INTO `Enrollment` VALUES (1,'S001','C01','2025春季','2025-03-01'),(2,'S002','C01','2025春季','2025-03-02'),(3,'S003','C02','2025春季','2025-03-03'),(4,'S004','C02','2025春季','2025-03-03'),(5,'S005','C02','2025春季','2025-03-04'),(6,'S006','C03','2025春季','2025-03-01'),(7,'S007','C03','2025春季','2025-03-01'),(8,'S008','C04','2025春季','2025-03-05'),(9,'S009','C04','2025春季','2025-03-06'),(10,'S010','C05','2025春季','2025-03-07'),(12,'S010','C01','2025春季','2025-06-18');
/*!40000 ALTER TABLE `Enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `EnrollID` int(11) DEFAULT NULL,
  `Amount` decimal(8,2) NOT NULL,
  `PayDate` date NOT NULL,
  `Method` varchar(20) DEFAULT NULL,
  `StudentID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `EnrollID` (`EnrollID`),
  KEY `idx_payment_student` (`StudentID`),
  KEY `idx_payment_date` (`PayDate`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`EnrollID`) REFERENCES `Enrollment` (`EnrollID`),
  CONSTRAINT `fk_payment_student` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,1,9000.00,'2025-03-05','現金','S001'),(2,2,9000.00,'2025-03-06','轉帳','S002'),(3,3,9000.00,'2025-03-06','轉帳','S003'),(4,4,9000.00,'2025-03-06','現金','S004'),(5,5,9000.00,'2025-03-07','現金','S005'),(6,6,10800.00,'2025-03-05','信用卡','S006'),(7,7,10800.00,'2025-03-06','轉帳','S007'),(8,8,14400.00,'2025-03-08','現金','S008'),(9,9,14400.00,'2025-03-09','轉帳','S009'),(10,10,10800.00,'2025-03-10','信用卡','S010'),(11,12,9000.00,'2025-06-18','現金','S010'),(12,1,9000.00,'2025-06-18','轉帳','S001');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER trg_PaymentLog_AfterInsert
AFTER INSERT ON Payment
FOR EACH ROW
INSERT INTO PaymentLog (StudentID, LogMessage, CreatedAt)
VALUES (
  NEW.StudentID,
  CONCAT('完成繳費，金額：', NEW.Amount, '，方式：', NEW.Method),
  NOW()
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `PaymentLog`
--

DROP TABLE IF EXISTS `PaymentLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaymentLog` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(10) DEFAULT NULL,
  `LogMessage` text DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentLog`
--

LOCK TABLES `PaymentLog` WRITE;
/*!40000 ALTER TABLE `PaymentLog` DISABLE KEYS */;
INSERT INTO `PaymentLog` VALUES (1,'S001','完成繳費，金額：9000.00，方式：轉帳','2025-06-22 10:44:39');
/*!40000 ALTER TABLE `PaymentLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `PaymentSummary`
--

DROP TABLE IF EXISTS `PaymentSummary`;
/*!50001 DROP VIEW IF EXISTS `PaymentSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `PaymentSummary` AS SELECT 
 1 AS `StudentID`,
 1 AS `EnglishName`,
 1 AS `ClassName`,
 1 AS `Amount`,
 1 AS `PayDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `StudentID` varchar(10) NOT NULL,
  `ChineseName` varchar(50) NOT NULL,
  `EnglishName` varchar(50) NOT NULL,
  `Gender` char(1) DEFAULT NULL CHECK (`Gender` in ('M','F')),
  `BirthDate` date NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `ClassID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `idx_students_classid` (`ClassID`),
  CONSTRAINT `Students_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `Classes` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES ('S001','吳品霏','Nova','F','2017-01-23','新北市蘆洲區中正路123號5樓','C01'),('S002','蘇宣羽','Ivy','F','2017-07-18','新北市蘆洲區光華路71號8樓','C01'),('S003','侯宥均','Yoda','F','2015-05-09','新北市蘆洲區光復路59號2樓','C02'),('S004','蔡澔宇','Alston','M','2017-03-10','新北市蘆洲區中正路310號3樓','C02'),('S005','林廷叡','Ryan','M','2015-08-26','新北市蘆洲區中山二路20號5樓','C02'),('S006','林廷安','Ting','F','2013-11-05','新北市蘆洲區中山二路20號5樓','C03'),('S007','江亮穎','Bella','F','2013-10-29','新北市蘆洲區中原路102號9樓','C03'),('S008','黃晟齊','Nicky','M','2011-05-01','新北市蘆洲區三民路100號5樓之1','C04'),('S009','黃宥瑄','Amy','F','2010-12-31','新北市蘆洲區中正路132號1樓','C04'),('S010','姜郁祺','Linda','F','2015-08-22','新北市蘆洲區長榮路82號2樓','C05');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teachers`
--

DROP TABLE IF EXISTS `Teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teachers` (
  `TeacherID` varchar(10) NOT NULL,
  `ChineseName` varchar(50) NOT NULL,
  `EnglishName` varchar(50) NOT NULL,
  `Gender` char(1) DEFAULT NULL CHECK (`Gender` in ('M','F')),
  `BirthDate` date NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `HourlyRate` decimal(6,2) DEFAULT NULL,
  `Phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teachers`
--

LOCK TABLES `Teachers` WRITE;
/*!40000 ALTER TABLE `Teachers` DISABLE KEYS */;
INSERT INTO `Teachers` VALUES ('T001','林品希','Stephanie','F','1988-06-15','新北市三重區重新路一段10號',600.00,'0911222333'),('T002','李建宏','Tony','M','1990-12-02','新北市蘆洲區永樂街25號',650.00,'0922333444'),('T003','陳筠潔','Amy','F','1992-03-28','台北市大同區承德路五段88號',700.00,'0933444555'),('T004','楊啟瑞','Leo','M','1985-09-10','新北市新莊區民安西路55號',620.00,'0966888999');
/*!40000 ALTER TABLE `Teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teaches`
--

DROP TABLE IF EXISTS `Teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teaches` (
  `TeacherID` varchar(10) NOT NULL,
  `ClassID` varchar(10) NOT NULL,
  `HoursWorked` int(11) DEFAULT 0,
  PRIMARY KEY (`TeacherID`,`ClassID`),
  KEY `ClassID` (`ClassID`),
  CONSTRAINT `Teaches_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `Teachers` (`TeacherID`),
  CONSTRAINT `Teaches_ibfk_2` FOREIGN KEY (`ClassID`) REFERENCES `Classes` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teaches`
--

LOCK TABLES `Teaches` WRITE;
/*!40000 ALTER TABLE `Teaches` DISABLE KEYS */;
INSERT INTO `Teaches` VALUES ('T001','C02',10),('T001','C03',12),('T002','C02',8),('T003','C01',10),('T003','C04',14),('T004','C05',16);
/*!40000 ALTER TABLE `Teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkHours`
--

DROP TABLE IF EXISTS `WorkHours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkHours` (
  `WorkID` int(11) NOT NULL AUTO_INCREMENT,
  `TeacherID` varchar(10) DEFAULT NULL,
  `WorkDate` date NOT NULL,
  `Hours` decimal(4,1) NOT NULL,
  PRIMARY KEY (`WorkID`),
  KEY `idx_workhours_teacher_date` (`TeacherID`,`WorkDate`),
  KEY `idx_workdate` (`WorkDate`),
  CONSTRAINT `WorkHours_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `Teachers` (`TeacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkHours`
--

LOCK TABLES `WorkHours` WRITE;
/*!40000 ALTER TABLE `WorkHours` DISABLE KEYS */;
INSERT INTO `WorkHours` VALUES (1,'T001','2025-03-03',2.0),(2,'T001','2025-03-04',1.0),(3,'T001','2025-03-06',2.0),(4,'T001','2025-03-07',1.0),(5,'T002','2025-03-04',1.0),(6,'T002','2025-03-07',1.0),(7,'T003','2025-03-04',2.0),(8,'T003','2025-03-07',2.0),(9,'T003','2025-03-08',3.0),(10,'T004','2025-03-03',2.0),(11,'T004','2025-03-06',2.0);
/*!40000 ALTER TABLE `WorkHours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'JoyEnglish'
--
/*!50003 DROP PROCEDURE IF EXISTS `CalcSalary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CalcSalary`(IN tid VARCHAR(10))
BEGIN
  SELECT 
    t.TeacherID, 
    t.EnglishName, 
    SUM(w.Hours * t.HourlyRate) AS MonthlySalary
  FROM 
    Teachers t
    JOIN WorkHours w ON t.TeacherID = w.TeacherID
  WHERE 
    t.TeacherID = tid
  GROUP BY 
    t.TeacherID, t.EnglishName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `PaymentSummary`
--

/*!50001 DROP VIEW IF EXISTS `PaymentSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `PaymentSummary` AS select `s`.`StudentID` AS `StudentID`,`s`.`EnglishName` AS `EnglishName`,`c`.`ClassName` AS `ClassName`,`p`.`Amount` AS `Amount`,`p`.`PayDate` AS `PayDate` from (((`Students` `s` join `Payment` `p` on(`s`.`StudentID` = `p`.`StudentID`)) join `Enrollment` `e` on(`s`.`StudentID` = `e`.`StudentID`)) join `Classes` `c` on(`e`.`ClassID` = `c`.`ClassID`)) */;
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

-- Dump completed on 2025-06-22 23:27:03
