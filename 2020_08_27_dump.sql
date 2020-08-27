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
  `b_content` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '게시글내용',
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
INSERT INTO `board` VALUES (1,0,1,0,0,'1234','1234','2020-08-24 20:50:33','wck',0),(2,0,2,0,0,'d123215412d','12d12d1234213','2020-08-25 08:50:46','wck',1),(3,0,3,0,0,'세번째 글 작성','3번글의 작성입니다\r\n\r\n감사합니다.','2020-08-24 08:51:01','wck',3),(4,0,4,0,0,'4번째 글 작성','4번글의 작성입니다 \r\n\r\n감사합니다.','2020-08-25 08:51:14','wck',15),(5,0,5,0,0,'5','5','2020-08-25 08:51:18','wck',0),(6,0,6,0,0,'6','6','2020-08-25 08:51:21','wck',3),(7,0,7,0,0,'7','7','2020-08-25 08:51:28','wck',2),(8,0,8,0,0,'8','8','2020-08-25 08:51:32','wck',4),(9,0,9,0,0,'9','9','2020-08-25 08:51:34','wck',1),(10,0,10,0,0,'10','10','2020-08-25 08:51:39','wck',0),(11,0,11,0,0,'11','11','2020-08-25 08:51:42','wck',2),(12,0,12,0,0,'12','12','2020-08-25 08:51:44','wck',0),(13,0,13,0,0,'13','13','2020-08-25 08:51:47','wck',1),(14,0,14,0,0,'14','14','2020-08-25 08:51:50','wck',0),(15,0,15,0,0,'15','15','2020-08-25 08:51:53','wck',1),(16,0,16,0,0,'1234','1234','2020-08-25 23:58:54','wck',8),(17,0,17,0,0,'1234','1234','2020-08-26 00:09:41','wck',0),(18,0,18,0,0,'1234','1234','2020-08-26 00:18:44','wck',0),(19,0,19,0,0,'1234','1234','2020-08-26 00:18:59','wck',2),(36,1,36,0,0,'두번쨰 공지글을 작성해봅니다123','공지글입니다.\r\n\r\n게시판 이용자들이 읽어야 할 내용을 기입합니다.123','2020-08-27 05:23:52','admin',1),(40,0,40,0,0,'ㅇ','ㅁㄴㅇ','2020-08-27 05:44:18','wck',1),(42,0,42,0,0,'123','123','2020-08-27 06:44:00','user',3),(43,0,43,0,0,'2424','2424','2020-08-27 06:44:08','user',7),(44,0,44,0,0,'1234','1234','2020-08-27 07:04:51','wck',2),(45,0,45,0,0,'1234','1234','2020-08-27 07:04:58','wck',2),(47,0,47,0,0,'ㄱㅂㄷㅈㅂㅇㄴㅁㅇ','ㅁㄴㅇㅁㄼㅈ','2020-08-27 07:23:32','user',7),(48,0,48,0,0,'12345','555','2020-08-27 07:24:35','user',4),(52,0,19,2,2,'RE: RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 R','RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE: 1234 RE','2020-08-27 08:32:37','yhsyhs',1),(56,0,56,0,0,'ㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇ','ㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇ','2020-08-27 08:36:18','yhsyhs',9),(59,1,59,0,0,'수정용 글을 작성합니다.(수정됨)','ㅇㅇㅇㅇㅇ','2020-08-27 08:40:06','admin',0),(62,0,56,1,1,'RE: ㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇ','12312314123','2020-08-27 08:48:55','yhsyhs',4),(64,1,64,0,0,'213','1234123','2020-08-27 08:50:29','admin',0),(65,0,65,0,0,'55555','555555','2020-08-27 09:00:26','wck',1),(66,0,66,0,0,'ㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇ','ㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇ','2020-08-27 09:00:36','wck',4),(67,1,67,0,0,'&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;','&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;&lt;/a&gt;','2020-08-27 09:07:17','admin',0),(68,1,68,0,0,'ㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴ','ㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁ','2020-08-27 09:08:07','admin',0);
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
INSERT INTO `user` VALUES ('','',''),('123123','123123','우치경'),('admin','1234','관리자'),('asdf','1234555','우치경'),('asdf111','asdf111','홍길동'),('djajdjajdj','asd123','키보드'),('dododolshossssssssss','asd123asd123asd123','다치마와'),('qwe','1234','김철수'),('qwerasdf','1234qwe','김철수'),('user','1234','이용자'),('vcvsda','1231234','김철수'),('wc1','1234','우치경'),('wck','1234','우치경'),('wck1','1234','우치경'),('wck123','123123','우치경'),('wck2323','12341234','우치경'),('yhsyhs','asd123','현수임'),('zxc','1234','홍길동');
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

-- Dump completed on 2020-08-27 18:19:46