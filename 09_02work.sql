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
  `b_notice` int NOT NULL COMMENT '게시글 / 공지글 여부',
  `b_refno` int DEFAULT NULL,
  `b_depth` int NOT NULL,
  `b_title` varchar(300) NOT NULL,
  `b_content` varchar(6000) NOT NULL,
  `b_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_writer` varchar(20) NOT NULL,
  `b_readcnt` int DEFAULT NULL,
  `b_origin` int NOT NULL,
  `b_secret` int NOT NULL DEFAULT '0',
  `b_pwd` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`b_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시글테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,0,0,1,'원글 작성 테스트','원글을 작성합니다.\n\n감사합니다.','2020-08-31 01:03:07','wck',29,1,0,NULL),(2,0,1,2,'원글 작성 테스트 의 답글1','111','2020-08-31 01:03:19','wck',11,1,0,NULL),(3,0,1,2,'원글 작성 테스트 의 답글22','22','2020-08-31 01:03:25','wck',4,1,0,NULL),(4,0,1,2,'원글 작성 테스트 의 답글33','33','2020-08-31 01:03:33','wck',2,1,0,NULL),(5,0,2,3,'원글 작성 테스트 의 답글1 의 답글1','1234','2020-08-31 01:06:47','wck',4,1,0,NULL),(6,0,3,3,'원글 작성 테스트 의 답글22 의 답글1','1234','2020-08-31 01:06:57','wck',1,1,0,NULL),(7,0,2,3,'원글 작성 테스트 의 답글1 의 답글2','2','2020-08-31 01:07:03','wck',2,1,0,NULL),(8,0,0,1,'두번째 원글 작성 테스트','1234','2020-08-31 04:56:36','wck',7,8,0,NULL),(9,0,8,2,'두번째 원글의 첫번째 답글','1313','2020-08-31 05:36:54','wck',5,8,0,NULL),(10,0,0,1,'user의 원글작성','1212','2020-08-31 06:17:03','user',2,10,0,NULL),(11,0,0,1,'수정용 글을 작성합니다.(수정)','1234','2020-08-31 08:03:31','user',16,11,0,NULL),(12,0,0,1,'1313','1313','2020-08-31 08:20:54','user',144,12,0,NULL),(13,0,12,2,'1313 의 답글','333','2020-08-31 08:21:04','user',6,12,0,NULL),(14,0,0,1,'마지막원글','원글','2020-08-31 09:09:22','user',228,14,0,NULL),(15,0,14,2,'마지막원글 의 답글1','1','2020-08-31 09:14:04','user',9,14,0,NULL),(16,0,0,1,'일반글 작성 테스트','일반글 작성 테스트\n\n입니다.','2020-09-02 04:43:57','wck',58,16,0,''),(17,0,16,2,'일반글 작성 테스트 의 답글','1313','2020-09-02 04:44:08','wck',13,16,0,NULL),(18,0,0,1,'비밀글 작성 테스트!','비밀글 작성 테스트\n\n입니다.','2020-09-02 04:44:30','wck',30,18,1,'wck1234'),(19,0,0,1,'1234','1234','2020-09-02 08:02:39','master',4,19,0,''),(21,0,0,1,'마스터계정 비밀글 등록','마스터계정으로 비밀글을 등록합니다','2020-09-02 08:06:42','master',2,21,1,'master1234'),(22,1,0,1,'마스터계정 공지글등록','마스터계정으로 공지글을 등록합니다.','2020-09-02 08:07:01','master',0,22,0,NULL),(23,1,0,1,'공지글등록 테스트 2','공지글등록 테스트 2','2020-09-02 08:09:33','master',0,23,0,NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `c_no` int NOT NULL,
  `c_writer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'unknown',
  `c_content` varchar(300) NOT NULL,
  `c_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_no` int NOT NULL,
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
INSERT INTO `comment` VALUES (1,'wck','3333','2020-09-01 09:08:02',14),(2,'wck','테스트 댓글 작성입니다 111','2020-09-01 09:47:22',14),(3,'wck','131314555','2020-09-01 09:47:43',14),(4,'wck','131314555','2020-09-01 09:48:04',14),(5,'wck','412512413215','2020-09-01 09:48:22',14),(6,'wck','123123','2020-09-01 09:49:08',14),(7,'wck','3535','2020-09-01 09:49:16',14),(8,'wck','','2020-09-02 02:50:19',1),(9,'wck','1313','2020-09-02 02:54:31',1),(10,'wck','','2020-09-02 02:54:49',1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `user_id` varchar(20) NOT NULL DEFAULT '',
  `b_no` int NOT NULL,
  KEY `FK_user_id` (`user_id`),
  KEY `FK_b_no` (`b_no`),
  CONSTRAINT `FK_b_no` FOREIGN KEY (`b_no`) REFERENCES `board` (`b_no`) ON DELETE CASCADE,
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='읽은 유저 / 읽은 게시글 기록 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES ('wck',11),('wck',1),('wck',8),('wck',9),('wck',14),('wck',2),('wck',10),('user',15),('user',10),('user',13),('user',14),('user',11),('user',8),('user',9),('user',1),('user',2),('user',5),('user',3),('user',6),('user',7),('user',4),('fusion1',14),('fusion1',15),('fusion1',12),('fusion1',13),('fusion1',11),('fusion1',9),('fusion1',2),('fusion1',5),('wck',13),('wck',16),('wck',18),('user',18),('user',16),('user',17),('sjh1991',18),('master',21),('master',19),('master',16),('wck',21),('wck',17),('admin',16),('admin',19),('admin',17),('wck',15);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
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
INSERT INTO `user` VALUES ('admin','1234','관리자','Y','Y','Y','Y','Y','Y','Y'),('fusion1','fusion1234','우치경','Y','Y','Y','Y','N','Y','N'),('fusion11','fusion1234','우치경','Y','Y','Y','Y','Y','Y','Y'),('fusion1234','fusion1234','우치경','Y','Y','Y','Y','Y','Y','Y'),('ktw1989','xodn1989','김태우','Y','N','N','N','N','N','N'),('master','master1234','마스터계정','Y','Y','Y','Y','Y','Y','Y'),('sjh1991','sjh1991','신지훈','N','N','N','N','N','N','N'),('syj1991','syj1991','송영주','N','N','N','N','N','N','N'),('user','1234','이용자','Y','Y','Y','Y','Y','Y','Y'),('wck','1234','우치경','Y','Y','Y','Y','N','N','N'),('wck1111','wck1111','우치경','N','N','N','N','N','N','N'),('wck1234','wck1234','우치경','Y','N','N','N','N','N','N'),('wck1991','wck1991','김철수','N','N','N','N','N','N','N'),('yhs1111','asd123','현수임','N','N','N','N','N','N','N'),('yhsyhs1','asd123','현수임','N','N','N','N','N','N','N');
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

-- Dump completed on 2020-09-02 17:53:59
