CREATE DATABASE  IF NOT EXISTS `nokia_tool_manager` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nokia_tool_manager`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: nokia_tool_manager
-- ------------------------------------------------------
-- Server version	5.6.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ask`
--

DROP TABLE IF EXISTS `ask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ask` (
  `ask-id` int(11) NOT NULL AUTO_INCREMENT,
  `sender-uid` int(11) NOT NULL,
  `tool-id` int(11) NOT NULL,
  `content` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`ask-id`),
  UNIQUE KEY `ask-id_UNIQUE` (`ask-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ask`
--

LOCK TABLES `ask` WRITE;
/*!40000 ALTER TABLE `ask` DISABLE KEYS */;
/*!40000 ALTER TABLE `ask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attention`
--

DROP TABLE IF EXISTS `attention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attention` (
  `attention-id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tool-id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`tool-id`),
  UNIQUE KEY `attention-id_UNIQUE` (`attention-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attention`
--

LOCK TABLES `attention` WRITE;
/*!40000 ALTER TABLE `attention` DISABLE KEYS */;
/*!40000 ALTER TABLE `attention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoryid_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'办公类'),(2,'开发类'),(3,'网络类');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment-id` int(11) NOT NULL AUTO_INCREMENT,
  `sender-uid` int(11) NOT NULL,
  `tool-id` int(11) NOT NULL,
  `content` text NOT NULL,
  `comment-time` int(11) NOT NULL,
  PRIMARY KEY (`sender-uid`,`tool-id`),
  UNIQUE KEY `comment-id_UNIQUE` (`comment-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `management` (
  `idmanagement` int(11) NOT NULL AUTO_INCREMENT,
  `user-id` int(11) NOT NULL,
  `category-id` int(11) NOT NULL,
  PRIMARY KEY (`user-id`,`category-id`),
  UNIQUE KEY `idmanagement_UNIQUE` (`idmanagement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_push`
--

DROP TABLE IF EXISTS `message_push`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_push` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `receiver` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `sendtime` int(11) NOT NULL,
  `link` text,
  `have-read` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`),
  UNIQUE KEY `idmessage_UNIQUE` (`idmessage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_push`
--

LOCK TABLES `message_push` WRITE;
/*!40000 ALTER TABLE `message_push` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_push` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `reply-id` int(11) NOT NULL AUTO_INCREMENT,
  `reply-sender` int(11) NOT NULL,
  `reply-type` int(11) NOT NULL DEFAULT '0',
  `ask-id` int(11) NOT NULL,
  `reply-target-user` int(11) DEFAULT NULL,
  `reply-time` int(11) NOT NULL,
  PRIMARY KEY (`reply-id`),
  UNIQUE KEY `reply-id_UNIQUE` (`reply-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag-id` int(11) NOT NULL AUTO_INCREMENT,
  `tag-name` varchar(90) NOT NULL,
  PRIMARY KEY (`tag-id`),
  UNIQUE KEY `tag-id_UNIQUE` (`tag-id`),
  UNIQUE KEY `tag-name_UNIQUE` (`tag-name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool` (
  `tool-id` int(11) NOT NULL AUTO_INCREMENT,
  `uploader` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `brief-intro` text,
  `description` mediumtext,
  `download-count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tool-id`),
  UNIQUE KEY `tool-id_UNIQUE` (`tool-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_file`
--

DROP TABLE IF EXISTS `tool_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool_file` (
  `file-id` int(11) NOT NULL AUTO_INCREMENT,
  `tool-id` int(11) NOT NULL,
  `version` varchar(90) NOT NULL,
  `upload-time` int(11) NOT NULL,
  `file-position` text NOT NULL,
  PRIMARY KEY (`file-id`),
  UNIQUE KEY `file-id_UNIQUE` (`file-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_file`
--

LOCK TABLES `tool_file` WRITE;
/*!40000 ALTER TABLE `tool_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_tag_relation`
--

DROP TABLE IF EXISTS `tool_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool_tag_relation` (
  `relation-id` int(11) NOT NULL AUTO_INCREMENT,
  `tool-id` int(11) NOT NULL,
  `tag-id` int(11) NOT NULL,
  PRIMARY KEY (`relation-id`),
  UNIQUE KEY `relation-id_UNIQUE` (`relation-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_tag_relation`
--

LOCK TABLES `tool_tag_relation` WRITE;
/*!40000 ALTER TABLE `tool_tag_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(90) NOT NULL,
  `password` varchar(60) NOT NULL,
  `department` varchar(60) DEFAULT NULL,
  `sex` int(11) NOT NULL DEFAULT '0',
  `self-intro` text,
  `job` varchar(60) DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zan`
--

DROP TABLE IF EXISTS `zan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zan` (
  `zan-id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tool-id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`tool-id`),
  UNIQUE KEY `zan-id_UNIQUE` (`zan-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zan`
--

LOCK TABLES `zan` WRITE;
/*!40000 ALTER TABLE `zan` DISABLE KEYS */;
/*!40000 ALTER TABLE `zan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nokia_tool_manager'
--

--
-- Dumping routines for database 'nokia_tool_manager'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-23 19:51:59
