-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: textbook_marketplace
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `BookInfo`
--

DROP TABLE IF EXISTS `BookInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BookInfo` (
  `BookInfoID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Author` varchar(255) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  PRIMARY KEY (`BookInfoID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookInfo`
--

LOCK TABLES `BookInfo` WRITE;
/*!40000 ALTER TABLE `BookInfo` DISABLE KEYS */;
INSERT INTO `BookInfo` VALUES (1,'Introduction to Algorithms','Thomas H. Cormen','9780262033848'),(2,'Clean Code','Robert C. Martin','9780132350884'),(3,'The Pragmatic Programmer','Andrew Hunt','9780201616224'),(4,'Design Patterns','Erich Gamma','9780201633610'),(5,'Artificial Intelligence: A Modern Approach','Stuart Russell','9780136042594'),(6,'Database System Concepts','Abraham Silberschatz','9780073523323');
/*!40000 ALTER TABLE `BookInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BookListings`
--

DROP TABLE IF EXISTS `BookListings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BookListings` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `BookInfoID` int NOT NULL,
  `SellerID` int NOT NULL,
  `Price` decimal(8,2) NOT NULL,
  `BookCondition` varchar(50) NOT NULL,
  `ListingDate` date NOT NULL,
  PRIMARY KEY (`BookID`),
  KEY `BookInfoID` (`BookInfoID`),
  KEY `SellerID` (`SellerID`),
  CONSTRAINT `BookListings_ibfk_1` FOREIGN KEY (`BookInfoID`) REFERENCES `BookInfo` (`BookInfoID`),
  CONSTRAINT `BookListings_ibfk_2` FOREIGN KEY (`SellerID`) REFERENCES `Users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookListings`
--

LOCK TABLES `BookListings` WRITE;
/*!40000 ALTER TABLE `BookListings` DISABLE KEYS */;
INSERT INTO `BookListings` VALUES (1,1,1,79.95,'Good','2025-06-02'),(2,2,2,45.00,'Very Good','2025-06-05'),(3,3,3,39.50,'Like New','2025-06-05'),(4,4,4,59.99,'Acceptable','2025-06-06'),(5,5,5,88.00,'New','2025-06-06'),(6,6,6,50.25,'Good','2025-06-07');
/*!40000 ALTER TABLE `BookListings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Locations` (
  `LocationID` int NOT NULL AUTO_INCREMENT,
  `City` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
INSERT INTO `Locations` VALUES (1,'Adelaide','SA','Australia'),(2,'Melbourne','VIC','Australia'),(3,'Sydney','NSW','Australia'),(4,'Brisbane','QLD','Australia'),(5,'Perth','WA','Australia'),(6,'Hobart','TAS','Australia');
/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Messages` (
  `MessageID` int NOT NULL AUTO_INCREMENT,
  `SellerID` int NOT NULL,
  `BookID` int NOT NULL,
  `BuyerID` int NOT NULL,
  `MessageText` text NOT NULL,
  `SentAt` datetime NOT NULL,
  PRIMARY KEY (`MessageID`),
  KEY `SellerID` (`SellerID`),
  KEY `BuyerID` (`BuyerID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `Messages_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `Users` (`UserID`),
  CONSTRAINT `Messages_ibfk_2` FOREIGN KEY (`BuyerID`) REFERENCES `Users` (`UserID`),
  CONSTRAINT `Messages_ibfk_3` FOREIGN KEY (`BookID`) REFERENCES `BookListings` (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
INSERT INTO `Messages` VALUES (1,3,3,1,'Hi, how old is this book?','2025-06-19 03:45:45'),(2,2,2,1,'hello','2025-06-19 03:51:59'),(3,4,4,1,'hi ','2025-06-19 03:59:28'),(4,2,2,1,'HELLO','2025-06-19 04:08:51'),(5,1,1,1,'HELLO','2025-06-19 04:09:00'),(6,3,3,1,'Hi is this book still available?','2025-06-19 08:12:48'),(7,1,1,1,'Hi again, is this book available?','2025-06-19 08:13:12');
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Purchases`
--

DROP TABLE IF EXISTS `Purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Purchases` (
  `PurchaseID` int NOT NULL AUTO_INCREMENT,
  `BuyerID` int NOT NULL,
  `BookID` int NOT NULL,
  `PurchaseDate` date NOT NULL,
  PRIMARY KEY (`PurchaseID`),
  KEY `BuyerID` (`BuyerID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `Purchases_ibfk_1` FOREIGN KEY (`BuyerID`) REFERENCES `Users` (`UserID`),
  CONSTRAINT `Purchases_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `BookListings` (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Purchases`
--

LOCK TABLES `Purchases` WRITE;
/*!40000 ALTER TABLE `Purchases` DISABLE KEYS */;
INSERT INTO `Purchases` VALUES (1,1,1,'2025-06-02'),(2,2,2,'2025-06-06'),(3,3,3,'2025-06-06'),(4,4,4,'2025-06-07'),(5,5,5,'2025-06-07'),(6,6,6,'2025-06-08');
/*!40000 ALTER TABLE `Purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `LocationID` int NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `LocationID` (`LocationID`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `Locations` (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Alice Johnson','alice@example.com','hashedpassword123',1),(2,'Bob Smith','bob@example.com','securepass456',1),(3,'Clara Lee','clara@example.com','password789',1),(4,'David Tan','david@example.com','david123',1),(5,'Emma Wong','emma@example.com','emmaSecure!',1),(6,'Frank Zhao','frank@example.com','zhaoPass22',1);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-19  8:17:57
