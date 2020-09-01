-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: board
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `b_no` int NOT NULL COMMENT '글번호(PK)',
  `b_category` int NOT NULL COMMENT '게시글 / 공지글 여부',
  `b_refno` int DEFAULT NULL,
  `b_depth` int NOT NULL,
  `b_title` varchar(300) NOT NULL,
  `b_content` varchar(6000) NOT NULL,
  `b_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_writer` varchar(20) NOT NULL,
  `b_readcnt` int DEFAULT NULL,
  `b_order` int NOT NULL,
  PRIMARY KEY (`b_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시글테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,0,0,1,'원글 작성 테스트','원글을 작성합니다.\n\n감사합니다.','2020-08-31 01:03:07','wck',5,1),(2,0,1,2,'원글 작성 테스트 의 답글1','111','2020-08-31 01:03:19','wck',5,1),(3,0,1,2,'원글 작성 테스트 의 답글22','22','2020-08-31 01:03:25','wck',3,1),(4,0,1,2,'원글 작성 테스트 의 답글33','33','2020-08-31 01:03:33','wck',0,1),(5,0,2,3,'원글 작성 테스트 의 답글1 의 답글1','1234','2020-08-31 01:06:47','wck',1,1),(6,0,3,3,'원글 작성 테스트 의 답글22 의 답글1','1234','2020-08-31 01:06:57','wck',0,1),(7,0,2,3,'원글 작성 테스트 의 답글1 의 답글2','2','2020-08-31 01:07:03','wck',1,1),(8,0,0,1,'두번째 원글 작성 테스트','1234','2020-08-31 04:56:36','wck',2,8),(9,0,8,2,'두번째 원글의 첫번째 답글','1313','2020-08-31 05:36:54','wck',0,8),(10,0,0,1,'user의 원글작성','1212','2020-08-31 06:17:03','user',0,10),(11,0,0,1,'수정용 글을 작성합니다.(수정)','1234','2020-08-31 08:03:31','user',0,11),(12,0,0,1,'1313','1313','2020-08-31 08:20:54','user',1,12),(13,0,12,2,'1313 의 답글','333','2020-08-31 08:21:04','user',0,12),(14,0,0,1,'마지막원글','원글','2020-08-31 09:09:22','user',4,14),(15,0,14,2,'마지막원글 의 답글1','1','2020-08-31 09:14:04','user',0,14);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` int NOT NULL,
  `p_id` int DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `depth` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,NULL,'동물',0),(2,1,'강아지',1),(3,1,'고양이',1),(5,NULL,'물건',0),(6,5,'가전제품',1),(7,6,'노트북',2),(8,6,'컴퓨터',2),(10,2,'용콩이',2);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '유저 아이디',
  `user_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '비밀번호',
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '유저명',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='유저테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('','',''),('admin','1234','관리자'),('fusion','fusion1234','우치경'),('fusion1','fusion1234','우치경'),('fusion1234','fusion1234','우치경'),('ktw1989','xodn1989','김태우'),('user','1234','이용자'),('wck','1234','우치경'),('wck1234','wck1234','우치경'),('yhsyhs','asd123','현수임');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-01  9:19:22
