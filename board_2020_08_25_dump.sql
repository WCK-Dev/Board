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
  `b_no` int NOT NULL COMMENT '글번호',
  `b_category` int NOT NULL COMMENT '공지글 / 게시글 여부',
  `b_grpno` int NOT NULL COMMENT '게시글 그룹(답글)',
  `b_grpord` int NOT NULL COMMENT '답글 정렬순서',
  `b_depth` int NOT NULL COMMENT '게시글 깊이(답글)',
  `b_title` varchar(300) NOT NULL DEFAULT '' COMMENT '게시글제목',
  `b_content` varchar(6000) NOT NULL DEFAULT '' COMMENT '게시글내용',
  `b_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '게시글작성일',
  `b_writer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '게시글작성자',
  `b_readcnt` int NOT NULL DEFAULT '0' COMMENT '게시글조회수',
  PRIMARY KEY (`b_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,0,1,0,0,'1234','1234','2020-08-25 08:50:33','wck',0),(2,0,2,0,0,'d123215412d','12d12d1234213','2020-08-25 08:50:46','wck',0),(3,0,3,0,0,'세번째 글 작성','3번글의 작성입니다\r\n\r\n감사합니다.','2020-08-25 08:51:01','wck',0),(4,0,4,0,0,'4번째 글 작성','4번글의 작성입니다 \r\n\r\n감사합니다.','2020-08-25 08:51:14','wck',0),(5,0,5,0,0,'5','5','2020-08-25 08:51:18','wck',0),(6,0,6,0,0,'6','6','2020-08-25 08:51:21','wck',0),(7,0,7,0,0,'7','7','2020-08-25 08:51:28','wck',0),(8,0,8,0,0,'8','8','2020-08-25 08:51:32','wck',0),(9,0,9,0,0,'9','9','2020-08-25 08:51:34','wck',0),(10,0,10,0,0,'10','10','2020-08-25 08:51:39','wck',0),(11,0,11,0,0,'11','11','2020-08-25 08:51:42','wck',0),(12,0,12,0,0,'12','12','2020-08-25 08:51:44','wck',0),(13,0,13,0,0,'13','13','2020-08-25 08:51:47','wck',0),(14,0,14,0,0,'14','14','2020-08-25 08:51:50','wck',0),(15,0,15,0,0,'15','15','2020-08-25 08:51:53','wck',0);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
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
INSERT INTO `user` VALUES ('','',''),('admin','1234','관리자'),('user','1234','이용자'),('wc1','1234','우치경'),('wck','1234','우치경'),('wck1','1234','우치경');
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

-- Dump completed on 2020-08-25 17:56:03
