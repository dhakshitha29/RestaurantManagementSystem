-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: vnr_restaurant
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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS bill;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE bill (
  bill_id int NOT NULL,
  bill_amount decimal(10,2) DEFAULT NULL,
  waiter_id int DEFAULT NULL,
  payment_mode varchar(50) DEFAULT NULL,
  customer_name varchar(100) DEFAULT NULL,
  PRIMARY KEY (bill_id),
  KEY waiter_id (waiter_id),
  CONSTRAINT bill_ibfk_1 FOREIGN KEY (waiter_id) REFERENCES waiter (waiter_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES bill WRITE;
/*!40000 ALTER TABLE bill DISABLE KEYS */;
INSERT INTO bill VALUES (1,50.00,1,'Card','Rahul Gupta'),(2,75.00,3,'Cash','Priya Sharma'),(3,60.00,2,'Cash','Kriti Patel'),(4,45.00,4,'Card','Alok Singh'),(5,30.00,5,'Card','Ayesha Reddy'),(6,55.00,6,'Cash','Ravi Verma');
/*!40000 ALTER TABLE bill ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS chef;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE chef (
  chef_id int NOT NULL,
  chef_name varchar(100) DEFAULT NULL,
  chef_salary decimal(10,2) DEFAULT NULL,
  speciality varchar(100) DEFAULT NULL,
  joining_date date DEFAULT NULL,
  PRIMARY KEY (chef_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES chef WRITE;
/*!40000 ALTER TABLE chef DISABLE KEYS */;
INSERT INTO chef VALUES (1,'Rajesh Kumar',4500.00,'Indian Cuisine','2023-03-15'),(2,'Priya Singh',4200.00,'Indian Cuisine','2023-05-20'),(3,'Amit Sharma',4800.00,'Indian Cuisine','2022-12-10'),(4,'Ananya Das',4000.00,'Indian Cuisine','2024-01-02'),(5,'Vikram Patel',4700.00,'Indian Cuisine','2023-08-18'),(6,'Neha Rao',4300.00,'Indian Cuisine','2023-10-05');
/*!40000 ALTER TABLE chef ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS customer;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE customer (
  customer_id int NOT NULL,
  customer_name varchar(100) DEFAULT NULL,
  contact_number varchar(20) DEFAULT NULL,
  order_id int DEFAULT NULL,
  rating decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES customer WRITE;
/*!40000 ALTER TABLE customer DISABLE KEYS */;
INSERT INTO customer VALUES (1,'Rahul Gupta','1234567890',1,4.50),(2,'Priya Sharma','9876543210',2,4.20),(3,'Kriti Patel','9998887776',3,4.80),(4,'Alok Singh','1112223334',4,4.00),(5,'Ayesha Reddy','4445556677',5,4.30),(6,'Ravi Verma','3332221110',6,4.60);
/*!40000 ALTER TABLE customer ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS menu;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE menu (
  menu_id int NOT NULL,
  food_item varchar(100) DEFAULT NULL,
  quantity int DEFAULT NULL,
  price decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (menu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES menu WRITE;
/*!40000 ALTER TABLE menu DISABLE KEYS */;
INSERT INTO menu VALUES (1,'Butter Chicken',10,12.99),(2,'Palak Paneer',8,10.99),(3,'Biryani',15,14.99),(4,'Tandoori Chicken',12,13.99),(5,'Chole Bhature',10,9.99),(6,'Naan',20,3.99);
/*!40000 ALTER TABLE menu ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS orders;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE orders (
  order_id int DEFAULT NULL,
  num_of_items int DEFAULT NULL,
  menu_id int DEFAULT NULL,
  customer_id int NOT NULL,
  PRIMARY KEY (customer_id),
  KEY menu_id (menu_id),
  CONSTRAINT orders_ibfk_1 FOREIGN KEY (menu_id) REFERENCES menu (menu_id),
  CONSTRAINT orders_ibfk_2 FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES orders WRITE;
/*!40000 ALTER TABLE orders DISABLE KEYS */;
INSERT INTO orders VALUES (1,2,1,1),(2,3,3,2),(3,1,6,3),(4,2,4,4),(5,1,5,5),(6,3,2,6);
/*!40000 ALTER TABLE orders ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_reservation`
--

DROP TABLE IF EXISTS table_reservation;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE table_reservation (
  table_no int NOT NULL,
  customer_id int DEFAULT NULL,
  booking_time timestamp NULL DEFAULT NULL,
  PRIMARY KEY (table_no),
  KEY customer_id (customer_id),
  CONSTRAINT table_reservation_ibfk_1 FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_reservation`
--

LOCK TABLES table_reservation WRITE;
/*!40000 ALTER TABLE table_reservation DISABLE KEYS */;
INSERT INTO table_reservation VALUES (1,1,'2024-01-03 12:30:00'),(2,2,'2024-01-04 14:00:00'),(3,3,'2024-01-05 14:30:00'),(4,4,'2024-01-06 12:15:00'),(5,5,'2024-01-07 13:00:00'),(6,6,'2024-01-08 13:30:00');
/*!40000 ALTER TABLE table_reservation ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiter`
--

DROP TABLE IF EXISTS waiter;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE waiter (
  waiter_id int NOT NULL,
  waiter_name varchar(100) DEFAULT NULL,
  waiter_salary decimal(10,2) DEFAULT NULL,
  joining_date date DEFAULT NULL,
  rating decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (waiter_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiter`
--

LOCK TABLES waiter WRITE;
/*!40000 ALTER TABLE waiter DISABLE KEYS */;
INSERT INTO waiter VALUES (1,'Arun Kumar',2500.00,'2023-01-10',4.50),(2,'Sneha Patel',2600.00,'2023-02-05',4.20),(3,'Rahul Sharma',2700.00,'2023-04-20',4.80),(4,'Pooja Singh',2550.00,'2023-07-15',4.00),(5,'Kiran Mehta',2450.00,'2023-09-30',4.30),(6,'Divya Gupta',2650.00,'2023-11-25',4.60);
/*!40000 ALTER TABLE waiter ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-19 18:51:14
