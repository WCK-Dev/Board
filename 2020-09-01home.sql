-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: board
-- ------------------------------------------------------
-- Server version	8.0.18

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
  `b_no` int(11) NOT NULL COMMENT '글번호(PK)',
  `b_category` int(11) NOT NULL COMMENT '게시글 / 공지글 여부',
  `b_refno` int(11) DEFAULT NULL,
  `b_depth` int(11) NOT NULL,
  `b_title` varchar(300) NOT NULL,
  `b_content` varchar(6000) NOT NULL,
  `b_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_writer` varchar(20) NOT NULL,
  `b_readcnt` int(11) DEFAULT NULL,
  `b_order` int(11) NOT NULL,
  `b_commentCnt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`b_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시글테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,0,0,1,'원글 작성 테스트','원글을 작성합니다.\n\n감사합니다.','2020-08-31 01:03:07','wck',11,1,0),(2,0,1,2,'원글 작성 테스트 의 답글1','111','2020-08-31 01:03:19','wck',6,1,0),(3,0,1,2,'원글 작성 테스트 의 답글22','22','2020-08-31 01:03:25','wck',3,1,0),(4,0,1,2,'원글 작성 테스트 의 답글33','33','2020-08-31 01:03:33','wck',0,1,0),(5,0,2,3,'원글 작성 테스트 의 답글1 의 답글1','1234','2020-08-31 01:06:47','wck',2,1,0),(6,0,3,3,'원글 작성 테스트 의 답글22 의 답글1','1234','2020-08-31 01:06:57','wck',0,1,0),(7,0,2,3,'원글 작성 테스트 의 답글1 의 답글2','2','2020-08-31 01:07:03','wck',1,1,0),(8,0,0,1,'두번째 원글 작성 테스트','1234','2020-08-31 04:56:36','wck',3,8,0),(9,0,8,2,'두번째 원글의 첫번째 답글','1313','2020-08-31 05:36:54','wck',0,8,0),(10,0,0,1,'user의 원글작성','1212','2020-08-31 06:17:03','user',0,10,0),(11,0,0,1,'수정용 글을 작성합니다.(수정)','1234','2020-08-31 08:03:31','user',2,11,0),(12,0,0,1,'1313','1313','2020-08-31 08:20:54','user',142,12,0),(13,0,12,2,'1313 의 답글','333','2020-08-31 08:21:04','user',2,12,0),(14,0,0,1,'마지막원글','원글','2020-08-31 09:09:22','user',205,14,0),(15,0,14,2,'마지막원글 의 답글1','1','2020-08-31 09:14:04','user',2,14,0);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `c_no` int(11) NOT NULL,
  `c_writer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'unknown',
  `c_content` varchar(300) NOT NULL,
  `c_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_no` int(11) NOT NULL,
  PRIMARY KEY (`c_no`),
  KEY `FK1_bno` (`b_no`),
  CONSTRAINT `FK1_bno` FOREIGN KEY (`b_no`) REFERENCES `board` (`b_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='댓글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'wck','3333','2020-09-01 09:08:02',14),(2,'wck','테스트 댓글 작성입니다 111','2020-09-01 09:47:22',14),(3,'wck','131314555','2020-09-01 09:47:43',14),(4,'wck','131314555','2020-09-01 09:48:04',14),(5,'wck','412512413215','2020-09-01 09:48:22',14),(6,'wck','123123','2020-09-01 09:49:08',14),(7,'wck','3535','2020-09-01 09:49:16',14),(8,'wck','123415234123412315123123125','2020-09-01 12:02:53',14);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `p_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `depth` int(11) NOT NULL,
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
  `write_YN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N' COMMENT '글쓰기 권한 여부',
  `update_YN` varchar(50) NOT NULL DEFAULT 'N' COMMENT '글 수정 권한 여부',
  `delete_YN` varchar(50) NOT NULL DEFAULT 'N' COMMENT '글삭제 권한 여부',
  `reply_YN` varchar(50) NOT NULL DEFAULT 'N' COMMENT '답글 권한 여부',
  `comment_YN` varchar(50) NOT NULL DEFAULT 'N' COMMENT '댓글 권한 여부',
  `read_YN` varchar(50) NOT NULL DEFAULT 'N' COMMENT '게시판 진입 여부',
  `admin_YN` varchar(50) NOT NULL DEFAULT 'N' COMMENT '관리자 권한 여부',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='유저테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','1234','관리자','Y','Y','Y','Y','Y','Y','Y'),('fusion1','fusion1234','우치경','Y','Y','Y','Y','N','Y','N'),('fusion11','fusion1234','우치경','Y','Y','Y','Y','Y','Y','Y'),('fusion1234','fusion1234','우치경','Y','Y','Y','Y','Y','Y','Y'),('ktw1989','xodn1989','김태우','Y','N','N','N','N','N','N'),('sjh1991','sjh1991','신지훈','N','N','N','N','N','N','N'),('syj1991','syj1991','송영주','N','N','N','N','N','N','N'),('user','1234','이용자','Y','Y','Y','Y','Y','Y','Y'),('wck','1234','우치경','N','N','N','N','N','N','N'),('wck1111','wck1111','우치경','N','N','N','N','N','N','N'),('wck1234','wck1234','우치경','Y','N','N','N','N','N','N'),('wck1991','wck1991','김철수','N','N','N','N','N','N','N'),('yhs1111','asd123','현수임','N','N','N','N','N','N','N'),('yhsyhs1','asd123','현수임','N','N','N','N','N','N','N');
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

-- Dump completed on 2020-09-01 23:16:21
