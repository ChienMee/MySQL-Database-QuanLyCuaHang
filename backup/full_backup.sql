-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: qlycuahang_ps27765
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cuahang`
--

DROP TABLE IF EXISTS `cuahang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuahang` (
  `macuahang` varchar(28) NOT NULL,
  `tencuahang` varchar(100) DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `sodienthoai` varchar(14) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`macuahang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuahang`
--

LOCK TABLES `cuahang` WRITE;
/*!40000 ALTER TABLE `cuahang` DISABLE KEYS */;
INSERT INTO `cuahang` VALUES ('CH001','CH1','Quận 1','123456780','ahyonhaseyo@gmail.com'),('CH002','CH2','Quận 3','123456781',''),('CH003','CH3','Quận 3','123456782',''),('CH004','CH4','Quận 10','123456783',''),('CH005','CH5','Quận 5','123456784','');
/*!40000 ALTER TABLE `cuahang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaihang`
--

DROP TABLE IF EXISTS `loaihang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaihang` (
  `maloaihang` varchar(28) NOT NULL,
  `tenloaihang` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`maloaihang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaihang`
--

LOCK TABLES `loaihang` WRITE;
/*!40000 ALTER TABLE `loaihang` DISABLE KEYS */;
INSERT INTO `loaihang` VALUES ('LH001','thời trang'),('LH002','đồ gia dụng'),('LH003','thiết bị điện tử'),('LH004','sản phẩm y tế'),('LH005','thực phẩm');
/*!40000 ALTER TABLE `loaihang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mathang`
--

DROP TABLE IF EXISTS `mathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mathang` (
  `mamathang` varchar(28) NOT NULL,
  `tenmathang` varchar(100) DEFAULT NULL,
  `donvitinh` varchar(100) DEFAULT NULL,
  `dongia` int DEFAULT NULL,
  `maloaihang` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`mamathang`),
  KEY `maloaihang` (`maloaihang`),
  CONSTRAINT `mathang_ibfk_1` FOREIGN KEY (`maloaihang`) REFERENCES `loaihang` (`maloaihang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mathang`
--

LOCK TABLES `mathang` WRITE;
/*!40000 ALTER TABLE `mathang` DISABLE KEYS */;
INSERT INTO `mathang` VALUES ('MH001','Áo ADASH','chiếc',20000,'LH001'),('MH002','Quần Nice','chiếc',24000,'LH001'),('MH003','Ifall','chiếc',220000,'LH003'),('MH004','Xamsunderland Void S20 Ultimate','chiếc',225000,'LH003'),('MH005','WiWi','chiếc',200000,'LH003'),('MH006','XiaoU U11','chiếc',244000,'LH003'),('MH007','Dopamine','hộp',20000,'LH004'),('MH008','Bánh 3,14zza','cái',29000,'LH005'),('MH009','nón BalenciaGAS','cái',22000,'LH001'),('MH010','Jumpo Vape','cái',20000,'LH003'),('MH011','miếng dán hạ hỏa Sasuke','hộp',20000,'LH004'),('MH012','bộ nồi Inox Moon House','bộ',42220000,'LH002'),('MH014','chổi quét nhà Moon House','cây',220000,'LH002'),('MH015','Bộ dụng cụ làm bếp Tutu Nana','bộ',20000,'LH002'),('MH016','đồng phục học sinh','chiếc',810180,'LH001');
/*!40000 ALTER TABLE `mathang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieuxuatchitiet`
--

DROP TABLE IF EXISTS `phieuxuatchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieuxuatchitiet` (
  `mamathang` varchar(28) NOT NULL,
  `sophieuxuat` varchar(28) NOT NULL,
  `dongia` int DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  PRIMARY KEY (`mamathang`,`sophieuxuat`),
  KEY `sophieuxuat` (`sophieuxuat`),
  CONSTRAINT `phieuxuatchitiet_ibfk_1` FOREIGN KEY (`mamathang`) REFERENCES `mathang` (`mamathang`),
  CONSTRAINT `phieuxuatchitiet_ibfk_2` FOREIGN KEY (`sophieuxuat`) REFERENCES `phieuxuathang` (`sophieuxuat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieuxuatchitiet`
--

LOCK TABLES `phieuxuatchitiet` WRITE;
/*!40000 ALTER TABLE `phieuxuatchitiet` DISABLE KEYS */;
INSERT INTO `phieuxuatchitiet` VALUES ('MH001','PX001',20000,1),('MH002','PX001',24000,1),('MH002','PX003',24000,1),('MH003','PX002',220000,5),('MH004','PX002',225000,1),('MH005','PX003',225000,2),('MH007','PX004',20000,8),('MH009','PX007',22000,2),('MH011','PX008',20000,4),('MH014','PX006',220000,1),('MH015','PX005',20000,1);
/*!40000 ALTER TABLE `phieuxuatchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieuxuathang`
--

DROP TABLE IF EXISTS `phieuxuathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieuxuathang` (
  `sophieuxuat` varchar(28) NOT NULL,
  `thanhtien` int DEFAULT NULL,
  `ngaylapphieu` date DEFAULT NULL,
  `ngayxuatphieu` date DEFAULT NULL,
  `macuahang` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`sophieuxuat`),
  KEY `macuahang` (`macuahang`),
  CONSTRAINT `phieuxuathang_ibfk_1` FOREIGN KEY (`macuahang`) REFERENCES `cuahang` (`macuahang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieuxuathang`
--

LOCK TABLES `phieuxuathang` WRITE;
/*!40000 ALTER TABLE `phieuxuathang` DISABLE KEYS */;
INSERT INTO `phieuxuathang` VALUES ('PX001',44000,'2021-01-01','2021-01-02','CH001'),('PX002',1325000,'2021-04-11','2021-04-12','CH005'),('PX003',474000,'2021-05-01','2021-05-03','CH003'),('PX004',160000,'2021-07-02','2021-07-03','CH004'),('PX005',20000,'2022-07-02','2022-07-04','CH001'),('PX006',220000,'2022-08-09','2022-08-10','CH002'),('PX007',44000,'2022-08-11','2023-08-12','CH004'),('PX008',80000,'2022-09-14','2023-09-15','CH004'),('PX009',NULL,'2022-10-01','2023-10-02','CH005'),('PX010',NULL,'2022-10-01','2023-10-02','CH005'),('PX011',NULL,'2023-02-04','2023-04-12','CH001'),('PX012',NULL,'2023-03-01','2023-04-12','CH004');
/*!40000 ALTER TABLE `phieuxuathang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-12 12:59:26
