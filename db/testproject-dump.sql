-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: testproject
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add comment',1,'add_comment'),(2,'Can change comment',1,'change_comment'),(3,'Can delete comment',1,'delete_comment'),(4,'Can view comment',1,'view_comment'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add captcha store',8,'add_captchastore'),(30,'Can change captcha store',8,'change_captchastore'),(31,'Can delete captcha store',8,'delete_captchastore'),(32,'Can view captcha store',8,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$PBjaItXQvxTm$onQKF+ic00uo4lC4pJMWsCO9pYGIyvBmtVOhSdw0XNs=','2019-07-09 12:35:29.037622',1,'admin','','','admin@gmail.com',1,1,'2019-07-09 12:35:14.173888');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (225,'XQVE','xqve','8368aaf131396cfc0c8a5a9bcb199e915b1210c1','2019-07-11 13:22:57.011019'),(226,'KHPR','khpr','712a05d285bb0cdea33c8d4314e9e3650257f718','2019-07-11 13:23:05.246049'),(227,'OFXT','ofxt','f08223a27acf6bd0f52d47bc165b7eace227f674','2019-07-11 13:34:23.940872');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_comment`
--

DROP TABLE IF EXISTS `comments_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `home_page` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `user_browser` longtext NOT NULL,
  `user_ip` char(39) NOT NULL,
  `published_date` datetime(6) DEFAULT NULL,
  `path` longtext,
  PRIMARY KEY (`id`),
  KEY `comments_comment_user_name_7c141bff` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_comment`
--

LOCK TABLES `comments_comment` WRITE;
/*!40000 ALTER TABLE `comments_comment` DISABLE KEYS */;
INSERT INTO `comments_comment` VALUES (1,'user','as@asd.com','','123','Chrome 75.0.3770','127.0.0.1','2019-07-10 11:47:35.604042','1001'),(2,'user2','as@asd.com','','1234','Chrome 75.0.3770','127.0.0.1','2019-07-10 11:48:00.399202','1002'),(3,'auser','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','12','Chrome 75.0.3770','127.0.0.1','2019-07-10 11:48:40.991347','1003'),(4,'buser','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','122','Chrome 75.0.3770','127.0.0.1','2019-07-10 12:04:42.294897','1004'),(5,'cuser','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','anser to auser','Chrome 75.0.3770','127.0.0.1','2019-07-10 12:05:18.916260','1003005'),(6,'user2','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','answer to auser','Chrome 75.0.3770','127.0.0.1','2019-07-10 12:05:48.873204','1003006'),(7,'illia','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','answer to auser','Chrome 75.0.3770','127.0.0.1','2019-07-10 12:08:01.458048','1003007'),(8,'illia','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','fresh comment','Chrome 75.0.3770','127.0.0.1','2019-07-10 12:11:09.347710','1008'),(9,'user2','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','123','Chrome 75.0.3770','127.0.0.1','2019-07-10 18:45:05.688847','1009'),(10,'Akhtyrtsev','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','Answer to fresh comment','Chrome 75.0.3770','127.0.0.1','2019-07-10 18:52:01.986900','1008010'),(11,'user','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','<p>Paragraf</p>','Chrome 75.0.3770','127.0.0.1','2019-07-11 11:50:03.168575','1011'),(12,'user','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','<p>Paragraf</p>','Chrome 75.0.3770','127.0.0.1','2019-07-11 11:54:10.308537','1012'),(13,'user','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','рус','Chrome 75.0.3770','127.0.0.1','2019-07-11 12:06:50.723371','1013'),(14,'user','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','<p>Paragraf</p>','Chrome 75.0.3770','127.0.0.1','2019-07-11 12:09:22.141917','1014'),(15,'user','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','<p>Paragraf</p>','Chrome 75.0.3770','127.0.0.1','2019-07-11 12:11:03.154412','1015'),(16,'user','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','<p>Paragraf</p>','Chrome 75.0.3770','127.0.0.1','2019-07-11 12:20:45.038944','1016'),(17,'user3','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','<p>Paragraf</p>','Chrome 75.0.3770','127.0.0.1','2019-07-11 12:26:34.067725','1017'),(18,'user','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','<b>Joel</b> <button>is</button> a <span>slug</span>','Chrome 75.0.3770','127.0.0.1','2019-07-11 12:29:21.266939','1018'),(19,'user','as@asd.com','https://www.google.com/search?q=gthtjdlbr&oq=g&aqs=chrome.0.69i59l3j69i60l3.768j0j7&sourceid=chrome&ie=UTF-8','<p>Paragraf</p>','Chrome 75.0.3770','127.0.0.1','2019-07-11 12:42:56.866466','1019');
/*!40000 ALTER TABLE `comments_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-07-09 12:36:08.451084','7','123',3,'',1,1),(2,'2019-07-09 12:36:08.543257','6','test captcha',3,'',1,1),(3,'2019-07-09 12:36:08.598671','5','answer to answer 1',3,'',1,1),(4,'2019-07-09 12:36:08.788461','4','answer 2 to comment 1',3,'',1,1),(5,'2019-07-09 12:36:08.821075','3','answer to comment 1',3,'',1,1),(6,'2019-07-09 12:36:08.855170','2','comment2',3,'',1,1),(7,'2019-07-09 12:36:08.887882','1','comment 1',3,'',1,1),(8,'2019-07-10 11:44:00.509935','13','123',3,'',1,1),(9,'2019-07-10 11:44:00.565463','12','answer',3,'',1,1),(10,'2019-07-10 11:44:00.609368','11','answer',3,'',1,1),(11,'2019-07-10 11:44:00.743010','10','123',3,'',1,1),(12,'2019-07-10 11:44:00.776458','9','qw',3,'',1,1),(13,'2019-07-10 11:44:00.820982','8','Comment text',3,'',1,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(8,'captcha','captchastore'),(1,'comments','comment'),(6,'contenttypes','contenttype'),(7,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-07-06 16:10:22.505247'),(2,'auth','0001_initial','2019-07-06 16:10:24.316220'),(3,'admin','0001_initial','2019-07-06 16:10:31.067515'),(4,'admin','0002_logentry_remove_auto_add','2019-07-06 16:10:32.611755'),(5,'admin','0003_logentry_add_action_flag_choices','2019-07-06 16:10:32.671230'),(6,'contenttypes','0002_remove_content_type_name','2019-07-06 16:10:33.673028'),(7,'auth','0002_alter_permission_name_max_length','2019-07-06 16:10:33.808442'),(8,'auth','0003_alter_user_email_max_length','2019-07-06 16:10:33.942084'),(9,'auth','0004_alter_user_username_opts','2019-07-06 16:10:34.001082'),(10,'auth','0005_alter_user_last_login_null','2019-07-06 16:10:34.600255'),(11,'auth','0006_require_contenttypes_0002','2019-07-06 16:10:34.633193'),(12,'auth','0007_alter_validators_add_error_messages','2019-07-06 16:10:34.678014'),(13,'auth','0008_alter_user_username_max_length','2019-07-06 16:10:34.789986'),(14,'auth','0009_alter_user_last_name_max_length','2019-07-06 16:10:34.901550'),(15,'auth','0010_alter_group_name_max_length','2019-07-06 16:10:35.013209'),(16,'auth','0011_update_proxy_permissions','2019-07-06 16:10:35.059160'),(17,'sessions','0001_initial','2019-07-06 16:10:35.429458'),(18,'comments','0001_initial','2019-07-06 16:22:23.174505'),(19,'comments','0002_auto_20190707_1755','2019-07-07 17:55:48.476252'),(20,'comments','0003_auto_20190708_0834','2019-07-08 08:34:45.015619'),(21,'comments','0004_auto_20190708_0855','2019-07-08 08:55:19.219383'),(22,'comments','0002_auto_20190708_1032','2019-07-08 10:32:54.218012'),(23,'comments','0003_auto_20190708_1038','2019-07-08 10:38:44.075115'),(24,'comments','0004_comment_published_date','2019-07-08 10:52:35.355729'),(25,'comments','0005_auto_20190708_1640','2019-07-08 16:41:01.048725'),(26,'comments','0002_comment_path','2019-07-09 08:11:15.733849'),(27,'comments','0003_remove_comment_parent_id','2019-07-09 08:46:22.201621'),(28,'captcha','0001_initial','2019-07-09 12:20:50.235304');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('yb0yn5tf026ztxh5g9vjijgwwv6un1pi','M2QxMWVjOTk5ODBkZWExMzQzNTYxZjMzODJlYmI2ODQ2ZTljYWZjNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNmVhZDc0OWQ2YzgxNzA2Yzk3ODBlNDMwNmIwODgzMDAzMmE4NDQyIn0=','2019-07-23 12:35:29.083256');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-11 18:44:54
