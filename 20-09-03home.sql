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
  `b_notice` int(11) NOT NULL COMMENT '게시글 / 공지글 여부',
  `b_refno` int(11) DEFAULT NULL,
  `b_depth` int(11) NOT NULL,
  `b_title` varchar(300) NOT NULL,
  `b_content` varchar(6000) NOT NULL,
  `b_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_writer` varchar(20) NOT NULL,
  `b_readcnt` int(11) DEFAULT NULL,
  `b_origin` int(11) NOT NULL,
  `b_secret` int(11) NOT NULL DEFAULT '0',
  `b_pwd` varchar(30) DEFAULT NULL,
  `b_bseq` int(11) NOT NULL DEFAULT '0' COMMENT '게시판 번호(boardKinds 테이블 참조)',
  PRIMARY KEY (`b_no`),
  KEY `FK_bseq` (`b_bseq`),
  CONSTRAINT `FK_bseq` FOREIGN KEY (`b_bseq`) REFERENCES `boardkinds` (`bk_bseq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시글테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (8,0,0,1,'두번째 원글 작성 테스트','1234','2020-08-31 04:56:36','wck',8,8,0,'',1),(9,0,8,2,'두번째 원글의 첫번째 답글','1313','2020-08-31 05:36:54','wck',7,8,0,'',1),(11,0,0,1,'수정용 글을 작성합니다.(관리자수정)','관리자가 게시글 내용을 수정하였습니다.','2020-08-31 08:03:31','user',20,11,0,'',1),(19,0,0,1,'1234','1234','2020-09-02 08:02:39','master',9,19,0,'',1),(21,0,0,1,'마스터계정 비밀글 등록','마스터계정으로 비밀글을 등록합니다','2020-09-02 08:06:42','master',6,21,1,'master1234',1),(22,1,0,1,'마스터계정 공지글등록','마스터계정으로 공지글을 등록합니다.','2020-09-02 08:07:01','master',0,22,0,'',1),(23,1,0,1,'공지글등록 테스트 2','공지글등록 테스트 2','2020-09-02 08:09:33','master',0,23,0,'',1),(24,0,0,1,'13','13','2020-09-03 08:05:08','admin',1,24,0,'',1),(25,0,0,1,'관리자 비밀글 수정','관리자 비밀글 !\r\n\r\n수정합니다.','2020-09-03 08:06:22','admin',4,25,1,'admin1234',1),(26,0,0,1,'유저 게시글 작성','유저 게시글 작성입니다.','2020-09-03 08:06:50','user',3,26,0,'',1),(27,0,0,1,'유저 비밀글 작성!','유저 비밀글 작성입니다.','2020-09-03 08:07:11','user',2,27,1,'12341234',1),(28,1,0,1,'관리자 공지글 작성 테스트','공지글 내용입니다.','2020-09-03 08:08:15','admin',0,28,0,'',1),(29,0,0,1,'세번째 게시판에 게시글 작성!','세번째 게시판에 게시글 작성!','2020-09-03 08:47:47','admin',2,29,0,'',3),(30,0,0,1,'세번째 게시판에 비밀글 작성!','1234','2020-09-03 08:48:10','admin',0,30,1,'1234',3),(31,0,0,1,'세번째 게시판에 유저 게시글 작성','1234','2020-09-03 08:49:01','wck',1,31,0,'',3),(32,0,0,1,'세번째 게시판에 유저 비밀글 등록','1234','2020-09-03 08:49:12','wck',1,32,1,'1234',3),(33,0,31,2,'세번째 게시판에 유저 답글작성','답글작성!','2020-09-03 08:55:01','wck',1,31,0,NULL,3),(34,0,0,1,'13131','131313','2020-09-03 09:15:39','wck',1,34,0,'',2),(35,0,0,1,'131313123215123','13131424515123145','2020-09-03 09:15:46','wck',1,35,0,'',2),(36,0,0,1,'첫번째 게시판에 게시글 작성','1234','2020-09-03 10:03:19','wck',0,36,0,'',1),(37,0,0,1,'더미게시글 1','더미게시글 2','2020-09-03 10:04:01','wck',0,37,0,'',1),(38,0,0,1,'더미게시글 3','더미게시글3','2020-09-03 10:04:20','wck',0,38,1,'wck1234',1),(39,0,0,1,'더미게시글 4','더미게시글 4','2020-09-03 10:04:28','wck',0,39,1,'1313',1),(40,0,0,1,'더미게시글 5','더미게시글 5','2020-09-03 10:04:55','wck',0,40,0,'',1),(41,0,0,1,'더미게시글 6','더미게시글 6','2020-09-03 10:05:09','user',0,41,0,'',1),(42,0,0,1,'더미게시글 7','더미게시글 7','2020-09-03 10:05:20','user',0,42,1,'1234',1),(43,0,0,1,'더미게시글 8','더미게시글 8','2020-09-03 10:05:33','user',0,43,0,'',1),(44,0,0,1,'더미게시글 9','더미게시글 9','2020-09-03 10:05:33','user',0,44,0,'',1),(45,0,0,1,'더미게시글 10','더미게시글 10','2020-09-03 10:05:33','user',0,45,0,'',1),(46,0,0,1,'더미게시글 11','더미게시글 11','2020-09-03 10:05:33','user',0,46,0,'',1),(47,0,0,1,'더미게시글 12','더미게시글 12','2020-09-03 10:05:33','user',0,47,0,'',1),(48,0,0,1,'더미게시글 13','더미게시글 13','2020-09-03 10:05:33','user',0,48,0,NULL,1),(49,0,0,1,'더미게시글 14','더미게시글 14','2020-09-03 10:05:33','user',0,49,0,NULL,1),(50,0,0,1,'더미게시글 15','더미게시글 15','2020-09-03 10:05:33','user',0,50,0,NULL,1),(51,0,0,1,'1234','1234','2020-09-03 13:31:25','wck',1,51,0,'',2);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boardkinds`
--

DROP TABLE IF EXISTS `boardkinds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boardkinds` (
  `bk_bseq` int(11) NOT NULL DEFAULT '0' COMMENT '게시판번호',
  `bk_type` int(11) NOT NULL DEFAULT '0' COMMENT '게시판유형',
  `bk_order` int(11) NOT NULL DEFAULT '0' COMMENT '게시판 노출순서',
  `bk_bname` varchar(100) NOT NULL DEFAULT '기본게시판' COMMENT '게시판이름',
  `bk_breply_YN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Y' COMMENT '게시판 답글 사용여부',
  `bk_bcomment_YN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Y' COMMENT '게시판 댓글 사용여부',
  `bk_bsecret_YN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Y' COMMENT '게시판 비밀글 사용여부',
  PRIMARY KEY (`bk_bseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boardkinds`
--

LOCK TABLES `boardkinds` WRITE;
/*!40000 ALTER TABLE `boardkinds` DISABLE KEYS */;
INSERT INTO `boardkinds` VALUES (1,0,1,'첫번째게시판','Y','Y','Y'),(2,1,2,'두번째게시판','N','Y','N'),(3,0,3,'세번째게시판','N','Y','N');
/*!40000 ALTER TABLE `boardkinds` ENABLE KEYS */;
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
INSERT INTO `comment` VALUES (1,'user','1313','2020-09-03 08:07:16',27);
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
  `b_no` int(11) NOT NULL,
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
INSERT INTO `history` VALUES ('wck',11),('wck',8),('wck',9),('user',11),('user',8),('user',9),('fusion1',11),('fusion1',9),('master',21),('master',19),('wck',21),('wck',19),('user',21),('user',19),('fusion1',19),('admin',21),('admin',19),('admin',11),('admin',9),('admin',25),('admin',24),('user',26),('user',27),('user',25),('admin',29),('wck',32),('wck',29),('wck',31),('wck',33),('wck',35),('wck',34),('wck',51);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
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
INSERT INTO `user` VALUES ('admin','1234','관리자','Y','Y','Y','Y','Y','Y','Y'),('fusion1','fusion1234','우치경','Y','Y','Y','Y','N','Y','N'),('fusion11','fusion1234','우치경','Y','Y','Y','Y','Y','Y','Y'),('fusion1234','fusion1234','우치경','Y','Y','Y','Y','Y','Y','Y'),('ktw1989','xodn1989','김태우','Y','N','N','N','N','N','N'),('master','master1234','마스터계정','Y','Y','Y','Y','Y','Y','Y'),('sjh1991','sjh1991','신지훈','N','N','N','N','N','N','N'),('syj1991','syj1991','송영주','N','N','N','N','N','N','N'),('user','1234','이용자','Y','Y','Y','Y','Y','Y','N'),('wck','1234','우치경','Y','Y','Y','Y','N','Y','N'),('wck1111','wck1111','우치경','N','N','N','N','N','N','N'),('wck1234','wck1234','우치경','Y','N','N','N','N','N','N'),('wck1991','wck1991','김철수','N','N','N','N','N','N','N'),('yhs1111','asd123','현수임','N','N','N','N','N','N','N'),('yhsyhs1','asd123','현수임','N','N','N','N','N','N','N');
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

-- Dump completed on 2020-09-03 22:34:28
