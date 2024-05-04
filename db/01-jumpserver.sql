-- MySQL dump 10.13  Distrib 8.4.0, for Linux (x86_64)
--
-- Host: mysql    Database: jumpserver
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `accounts_account`
--

DROP TABLE IF EXISTS `accounts_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `id` char(32) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `connectivity` varchar(16) NOT NULL,
  `date_verified` datetime(6) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `secret_type` varchar(16) NOT NULL,
  `_secret` longtext,
  `privileged` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` int NOT NULL,
  `source` varchar(30) NOT NULL,
  `asset_id` char(32) NOT NULL,
  `su_from_id` char(32) DEFAULT NULL,
  `source_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_account_name_asset_id_d07d7988_uniq` (`name`,`asset_id`),
  UNIQUE KEY `accounts_account_username_asset_id_secret_type_1892cc9f_uniq` (`username`,`asset_id`,`secret_type`),
  KEY `accounts_account_asset_id_d77d9aa0_fk_assets_asset_id` (`asset_id`),
  KEY `accounts_account_su_from_id_1845461a_fk_accounts_account_id` (`su_from_id`),
  KEY `accounts_account_org_id_4b4ddfef` (`org_id`),
  KEY `accounts_account_username_b5f69a28` (`username`),
  CONSTRAINT `accounts_account_asset_id_d77d9aa0_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`),
  CONSTRAINT `accounts_account_su_from_id_1845461a_fk_accounts_account_id` FOREIGN KEY (`su_from_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account`
--

LOCK TABLES `accounts_account` WRITE;
/*!40000 ALTER TABLE `accounts_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_accountbackupautomation`
--

DROP TABLE IF EXISTS `accounts_accountbackupautomation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accountbackupautomation` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `id` char(32) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `is_periodic` tinyint(1) NOT NULL,
  `interval` int DEFAULT NULL,
  `crontab` varchar(128) DEFAULT NULL,
  `types` json NOT NULL,
  `backup_type` varchar(128) NOT NULL,
  `is_password_divided_by_email` tinyint(1) NOT NULL,
  `is_password_divided_by_obj_storage` tinyint(1) NOT NULL,
  `zip_encrypt_password` varchar(8192) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_accountbackupautomation_name_org_id_937e07da_uniq` (`name`,`org_id`),
  KEY `accounts_accountbackupautomation_org_id_77176035` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accountbackupautomation`
--

LOCK TABLES `accounts_accountbackupautomation` WRITE;
/*!40000 ALTER TABLE `accounts_accountbackupautomation` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accountbackupautomation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_accountbackupautomation_obj_recipients_part_one`
--

DROP TABLE IF EXISTS `accounts_accountbackupautomation_obj_recipients_part_one`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accountbackupautomation_obj_recipients_part_one` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountbackupautomation_id` char(32) NOT NULL,
  `replaystorage_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_accountbackupau_accountbackupautomation__2e4736c1_uniq` (`accountbackupautomation_id`,`replaystorage_id`),
  KEY `accounts_accountback_replaystorage_id_77acadb8_fk_terminal_` (`replaystorage_id`),
  CONSTRAINT `accounts_accountback_accountbackupautomat_9a6ac236_fk_accounts_` FOREIGN KEY (`accountbackupautomation_id`) REFERENCES `accounts_accountbackupautomation` (`id`),
  CONSTRAINT `accounts_accountback_replaystorage_id_77acadb8_fk_terminal_` FOREIGN KEY (`replaystorage_id`) REFERENCES `terminal_replaystorage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accountbackupautomation_obj_recipients_part_one`
--

LOCK TABLES `accounts_accountbackupautomation_obj_recipients_part_one` WRITE;
/*!40000 ALTER TABLE `accounts_accountbackupautomation_obj_recipients_part_one` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accountbackupautomation_obj_recipients_part_one` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_accountbackupautomation_obj_recipients_part_two`
--

DROP TABLE IF EXISTS `accounts_accountbackupautomation_obj_recipients_part_two`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accountbackupautomation_obj_recipients_part_two` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountbackupautomation_id` char(32) NOT NULL,
  `replaystorage_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_accountbackupau_accountbackupautomation__90caabac_uniq` (`accountbackupautomation_id`,`replaystorage_id`),
  KEY `accounts_accountback_replaystorage_id_69612dd7_fk_terminal_` (`replaystorage_id`),
  CONSTRAINT `accounts_accountback_accountbackupautomat_3b6a82cc_fk_accounts_` FOREIGN KEY (`accountbackupautomation_id`) REFERENCES `accounts_accountbackupautomation` (`id`),
  CONSTRAINT `accounts_accountback_replaystorage_id_69612dd7_fk_terminal_` FOREIGN KEY (`replaystorage_id`) REFERENCES `terminal_replaystorage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accountbackupautomation_obj_recipients_part_two`
--

LOCK TABLES `accounts_accountbackupautomation_obj_recipients_part_two` WRITE;
/*!40000 ALTER TABLE `accounts_accountbackupautomation_obj_recipients_part_two` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accountbackupautomation_obj_recipients_part_two` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_accountbackupautomation_recipients_part_one`
--

DROP TABLE IF EXISTS `accounts_accountbackupautomation_recipients_part_one`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accountbackupautomation_recipients_part_one` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountbackupautomation_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_accountbackupau_accountbackupautomation__9c171250_uniq` (`accountbackupautomation_id`,`user_id`),
  KEY `accounts_accountback_user_id_7941d06d_fk_users_use` (`user_id`),
  CONSTRAINT `accounts_accountback_accountbackupautomat_0f67ee29_fk_accounts_` FOREIGN KEY (`accountbackupautomation_id`) REFERENCES `accounts_accountbackupautomation` (`id`),
  CONSTRAINT `accounts_accountback_user_id_7941d06d_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accountbackupautomation_recipients_part_one`
--

LOCK TABLES `accounts_accountbackupautomation_recipients_part_one` WRITE;
/*!40000 ALTER TABLE `accounts_accountbackupautomation_recipients_part_one` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accountbackupautomation_recipients_part_one` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_accountbackupautomation_recipients_part_two`
--

DROP TABLE IF EXISTS `accounts_accountbackupautomation_recipients_part_two`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accountbackupautomation_recipients_part_two` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountbackupautomation_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_accountbackupau_accountbackupautomation__dcfb1cf3_uniq` (`accountbackupautomation_id`,`user_id`),
  KEY `accounts_accountback_user_id_ec8f721d_fk_users_use` (`user_id`),
  CONSTRAINT `accounts_accountback_accountbackupautomat_79324469_fk_accounts_` FOREIGN KEY (`accountbackupautomation_id`) REFERENCES `accounts_accountbackupautomation` (`id`),
  CONSTRAINT `accounts_accountback_user_id_ec8f721d_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accountbackupautomation_recipients_part_two`
--

LOCK TABLES `accounts_accountbackupautomation_recipients_part_two` WRITE;
/*!40000 ALTER TABLE `accounts_accountbackupautomation_recipients_part_two` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accountbackupautomation_recipients_part_two` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_accountbackupexecution`
--

DROP TABLE IF EXISTS `accounts_accountbackupexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accountbackupexecution` (
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `date_start` datetime(6) NOT NULL,
  `timedelta` double DEFAULT NULL,
  `trigger` varchar(128) NOT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `is_success` tinyint(1) NOT NULL,
  `plan_id` char(32) NOT NULL,
  `snapshot` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_accountback_plan_id_2e3e5373_fk_accounts_` (`plan_id`),
  KEY `accounts_accountbackupexecution_org_id_fca2a281` (`org_id`),
  CONSTRAINT `accounts_accountback_plan_id_2e3e5373_fk_accounts_` FOREIGN KEY (`plan_id`) REFERENCES `accounts_accountbackupautomation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accountbackupexecution`
--

LOCK TABLES `accounts_accountbackupexecution` WRITE;
/*!40000 ALTER TABLE `accounts_accountbackupexecution` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accountbackupexecution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_accounttemplate`
--

DROP TABLE IF EXISTS `accounts_accounttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accounttemplate` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `id` char(32) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `secret_type` varchar(16) NOT NULL,
  `_secret` longtext,
  `privileged` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `su_from_id` char(32) DEFAULT NULL,
  `auto_push` tinyint(1) NOT NULL,
  `push_params` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `secret_strategy` varchar(16) NOT NULL,
  `password_rules` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_accounttemplate_name_org_id_d399e665_uniq` (`name`,`org_id`),
  KEY `accounts_accounttemplate_org_id_92efd0a8` (`org_id`),
  KEY `accounts_accounttemplate_username_379784d9` (`username`),
  KEY `accounts_accounttemp_su_from_id_695954f2_fk_accounts_` (`su_from_id`),
  CONSTRAINT `accounts_accounttemp_su_from_id_695954f2_fk_accounts_` FOREIGN KEY (`su_from_id`) REFERENCES `accounts_accounttemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accounttemplate`
--

LOCK TABLES `accounts_accounttemplate` WRITE;
/*!40000 ALTER TABLE `accounts_accounttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accounttemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_accounttemplate_platforms`
--

DROP TABLE IF EXISTS `accounts_accounttemplate_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accounttemplate_platforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accounttemplate_id` char(32) NOT NULL,
  `platform_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_accounttemplate_accounttemplate_id_platf_640c92a2_uniq` (`accounttemplate_id`,`platform_id`),
  KEY `accounts_accounttemp_platform_id_2bd7c470_fk_assets_pl` (`platform_id`),
  CONSTRAINT `accounts_accounttemp_accounttemplate_id_c6c5dec6_fk_accounts_` FOREIGN KEY (`accounttemplate_id`) REFERENCES `accounts_accounttemplate` (`id`),
  CONSTRAINT `accounts_accounttemp_platform_id_2bd7c470_fk_assets_pl` FOREIGN KEY (`platform_id`) REFERENCES `assets_platform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accounttemplate_platforms`
--

LOCK TABLES `accounts_accounttemplate_platforms` WRITE;
/*!40000 ALTER TABLE `accounts_accounttemplate_platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accounttemplate_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_changesecretautomation`
--

DROP TABLE IF EXISTS `accounts_changesecretautomation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_changesecretautomation` (
  `baseautomation_ptr_id` char(32) NOT NULL,
  `secret_type` varchar(16) NOT NULL,
  `secret_strategy` varchar(16) NOT NULL,
  `secret` longtext,
  `password_rules` json NOT NULL,
  `ssh_key_change_strategy` varchar(16) NOT NULL,
  PRIMARY KEY (`baseautomation_ptr_id`),
  CONSTRAINT `accounts_changesecre_baseautomation_ptr_i_55ccffbc_fk_assets_ba` FOREIGN KEY (`baseautomation_ptr_id`) REFERENCES `assets_baseautomation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_changesecretautomation`
--

LOCK TABLES `accounts_changesecretautomation` WRITE;
/*!40000 ALTER TABLE `accounts_changesecretautomation` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_changesecretautomation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_changesecretautomation_recipients`
--

DROP TABLE IF EXISTS `accounts_changesecretautomation_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_changesecretautomation_recipients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `changesecretautomation_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_changesecretaut_changesecretautomation_i_e3af8d02_uniq` (`changesecretautomation_id`,`user_id`),
  KEY `accounts_changesecre_user_id_9861c38f_fk_users_use` (`user_id`),
  CONSTRAINT `accounts_changesecre_changesecretautomati_10753100_fk_accounts_` FOREIGN KEY (`changesecretautomation_id`) REFERENCES `accounts_changesecretautomation` (`baseautomation_ptr_id`),
  CONSTRAINT `accounts_changesecre_user_id_9861c38f_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_changesecretautomation_recipients`
--

LOCK TABLES `accounts_changesecretautomation_recipients` WRITE;
/*!40000 ALTER TABLE `accounts_changesecretautomation_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_changesecretautomation_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_changesecretrecord`
--

DROP TABLE IF EXISTS `accounts_changesecretrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_changesecretrecord` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `id` char(32) NOT NULL,
  `old_secret` longtext,
  `new_secret` longtext,
  `date_started` datetime(6) DEFAULT NULL,
  `date_finished` datetime(6) DEFAULT NULL,
  `status` varchar(16) NOT NULL,
  `error` longtext,
  `account_id` char(32) DEFAULT NULL,
  `asset_id` char(32) DEFAULT NULL,
  `execution_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_changesecre_account_id_e263b671_fk_accounts_` (`account_id`),
  KEY `accounts_changesecretrecord_asset_id_65430b74_fk_assets_asset_id` (`asset_id`),
  KEY `accounts_changesecre_execution_id_bbde8815_fk_assets_au` (`execution_id`),
  CONSTRAINT `accounts_changesecre_account_id_e263b671_fk_accounts_` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `accounts_changesecre_execution_id_bbde8815_fk_assets_au` FOREIGN KEY (`execution_id`) REFERENCES `assets_automationexecution` (`id`),
  CONSTRAINT `accounts_changesecretrecord_asset_id_65430b74_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_changesecretrecord`
--

LOCK TABLES `accounts_changesecretrecord` WRITE;
/*!40000 ALTER TABLE `accounts_changesecretrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_changesecretrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_gatheraccountsautomation`
--

DROP TABLE IF EXISTS `accounts_gatheraccountsautomation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_gatheraccountsautomation` (
  `baseautomation_ptr_id` char(32) NOT NULL,
  `is_sync_account` tinyint(1) NOT NULL,
  PRIMARY KEY (`baseautomation_ptr_id`),
  CONSTRAINT `accounts_gatheraccou_baseautomation_ptr_i_365a6666_fk_assets_ba` FOREIGN KEY (`baseautomation_ptr_id`) REFERENCES `assets_baseautomation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_gatheraccountsautomation`
--

LOCK TABLES `accounts_gatheraccountsautomation` WRITE;
/*!40000 ALTER TABLE `accounts_gatheraccountsautomation` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_gatheraccountsautomation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_gatheraccountsautomation_recipients`
--

DROP TABLE IF EXISTS `accounts_gatheraccountsautomation_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_gatheraccountsautomation_recipients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gatheraccountsautomation_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_gatheraccountsa_gatheraccountsautomation_d785d290_uniq` (`gatheraccountsautomation_id`,`user_id`),
  KEY `accounts_gatheraccou_user_id_50254711_fk_users_use` (`user_id`),
  CONSTRAINT `accounts_gatheraccou_gatheraccountsautoma_fca5dd4d_fk_accounts_` FOREIGN KEY (`gatheraccountsautomation_id`) REFERENCES `accounts_gatheraccountsautomation` (`baseautomation_ptr_id`),
  CONSTRAINT `accounts_gatheraccou_user_id_50254711_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_gatheraccountsautomation_recipients`
--

LOCK TABLES `accounts_gatheraccountsautomation_recipients` WRITE;
/*!40000 ALTER TABLE `accounts_gatheraccountsautomation_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_gatheraccountsautomation_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_gatheredaccount`
--

DROP TABLE IF EXISTS `accounts_gatheredaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_gatheredaccount` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `id` char(32) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `present` tinyint(1) NOT NULL,
  `date_last_login` datetime(6) DEFAULT NULL,
  `username` varchar(32) NOT NULL,
  `address_last_login` varchar(39) NOT NULL,
  `asset_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_gatheredaccount_username_asset_id_1ae01c0f_uniq` (`username`,`asset_id`),
  KEY `accounts_gatheredaccount_asset_id_710a010a_fk_assets_asset_id` (`asset_id`),
  KEY `accounts_gatheredaccount_org_id_c8c5ae08` (`org_id`),
  KEY `accounts_gatheredaccount_username_0eedc6ee` (`username`),
  CONSTRAINT `accounts_gatheredaccount_asset_id_710a010a_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_gatheredaccount`
--

LOCK TABLES `accounts_gatheredaccount` WRITE;
/*!40000 ALTER TABLE `accounts_gatheredaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_gatheredaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_historicalaccount`
--

DROP TABLE IF EXISTS `accounts_historicalaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_historicalaccount` (
  `id` char(32) NOT NULL,
  `secret_type` varchar(16) NOT NULL,
  `_secret` longtext,
  `version` int NOT NULL,
  `history_id` int NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `accounts_historicala_history_user_id_882408fa_fk_users_use` (`history_user_id`),
  KEY `accounts_historicalaccount_id_5fcc9bec` (`id`),
  KEY `accounts_historicalaccount_history_date_316e758b` (`history_date`),
  CONSTRAINT `accounts_historicala_history_user_id_882408fa_fk_users_use` FOREIGN KEY (`history_user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_historicalaccount`
--

LOCK TABLES `accounts_historicalaccount` WRITE;
/*!40000 ALTER TABLE `accounts_historicalaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_historicalaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_pushaccountautomation`
--

DROP TABLE IF EXISTS `accounts_pushaccountautomation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_pushaccountautomation` (
  `baseautomation_ptr_id` char(32) NOT NULL,
  `secret_type` varchar(16) NOT NULL,
  `secret_strategy` varchar(16) NOT NULL,
  `secret` longtext,
  `password_rules` json NOT NULL,
  `ssh_key_change_strategy` varchar(16) NOT NULL,
  `triggers` json NOT NULL,
  `username` varchar(128) NOT NULL,
  `action` varchar(16) NOT NULL,
  PRIMARY KEY (`baseautomation_ptr_id`),
  CONSTRAINT `accounts_pushaccount_baseautomation_ptr_i_cabe9ea5_fk_assets_ba` FOREIGN KEY (`baseautomation_ptr_id`) REFERENCES `assets_baseautomation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_pushaccountautomation`
--

LOCK TABLES `accounts_pushaccountautomation` WRITE;
/*!40000 ALTER TABLE `accounts_pushaccountautomation` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_pushaccountautomation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_verifyaccountautomation`
--

DROP TABLE IF EXISTS `accounts_verifyaccountautomation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_verifyaccountautomation` (
  `baseautomation_ptr_id` char(32) NOT NULL,
  PRIMARY KEY (`baseautomation_ptr_id`),
  CONSTRAINT `accounts_verifyaccou_baseautomation_ptr_i_318f0963_fk_assets_ba` FOREIGN KEY (`baseautomation_ptr_id`) REFERENCES `assets_baseautomation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_verifyaccountautomation`
--

LOCK TABLES `accounts_verifyaccountautomation` WRITE;
/*!40000 ALTER TABLE `accounts_verifyaccountautomation` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_verifyaccountautomation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_virtualaccount`
--

DROP TABLE IF EXISTS `accounts_virtualaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_virtualaccount` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `alias` varchar(128) NOT NULL,
  `secret_from_login` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_virtualaccount_alias_org_id_847a87d6_uniq` (`alias`,`org_id`),
  KEY `accounts_virtualaccount_org_id_6ae8edaa` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_virtualaccount`
--

LOCK TABLES `accounts_virtualaccount` WRITE;
/*!40000 ALTER TABLE `accounts_virtualaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_virtualaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls_commandfilteracl`
--

DROP TABLE IF EXISTS `acls_commandfilteracl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acls_commandfilteracl` (
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `priority` int NOT NULL,
  `action` varchar(64) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `comment` longtext NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `accounts` json NOT NULL DEFAULT (_utf8mb3'[]'),
  `assets` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `users` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `acls_commandfilteracl_name_org_id_00af4220_uniq` (`name`,`org_id`),
  KEY `acls_commandfilteracl_org_id_b8fbeff4` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls_commandfilteracl`
--

LOCK TABLES `acls_commandfilteracl` WRITE;
/*!40000 ALTER TABLE `acls_commandfilteracl` DISABLE KEYS */;
/*!40000 ALTER TABLE `acls_commandfilteracl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls_commandfilteracl_command_groups`
--

DROP TABLE IF EXISTS `acls_commandfilteracl_command_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acls_commandfilteracl_command_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commandfilteracl_id` char(32) NOT NULL,
  `commandgroup_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acls_commandfilteracl_co_commandfilteracl_id_comm_40a164cc_uniq` (`commandfilteracl_id`,`commandgroup_id`),
  KEY `acls_commandfilterac_commandgroup_id_e20d150b_fk_acls_comm` (`commandgroup_id`),
  CONSTRAINT `acls_commandfilterac_commandfilteracl_id_87647a9d_fk_acls_comm` FOREIGN KEY (`commandfilteracl_id`) REFERENCES `acls_commandfilteracl` (`id`),
  CONSTRAINT `acls_commandfilterac_commandgroup_id_e20d150b_fk_acls_comm` FOREIGN KEY (`commandgroup_id`) REFERENCES `acls_commandgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls_commandfilteracl_command_groups`
--

LOCK TABLES `acls_commandfilteracl_command_groups` WRITE;
/*!40000 ALTER TABLE `acls_commandfilteracl_command_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `acls_commandfilteracl_command_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls_commandfilteracl_reviewers`
--

DROP TABLE IF EXISTS `acls_commandfilteracl_reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acls_commandfilteracl_reviewers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commandfilteracl_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acls_commandfilteracl_re_commandfilteracl_id_user_b4d70d79_uniq` (`commandfilteracl_id`,`user_id`),
  KEY `acls_commandfilterac_user_id_deb79bbc_fk_users_use` (`user_id`),
  CONSTRAINT `acls_commandfilterac_commandfilteracl_id_2c7001a2_fk_acls_comm` FOREIGN KEY (`commandfilteracl_id`) REFERENCES `acls_commandfilteracl` (`id`),
  CONSTRAINT `acls_commandfilterac_user_id_deb79bbc_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls_commandfilteracl_reviewers`
--

LOCK TABLES `acls_commandfilteracl_reviewers` WRITE;
/*!40000 ALTER TABLE `acls_commandfilteracl_reviewers` DISABLE KEYS */;
/*!40000 ALTER TABLE `acls_commandfilteracl_reviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls_commandgroup`
--

DROP TABLE IF EXISTS `acls_commandgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acls_commandgroup` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(16) NOT NULL,
  `content` longtext NOT NULL,
  `comment` longtext NOT NULL,
  `ignore_case` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acls_commandgroup_org_id_name_3d9df455_uniq` (`org_id`,`name`),
  KEY `acls_commandgroup_org_id_b5b46362` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls_commandgroup`
--

LOCK TABLES `acls_commandgroup` WRITE;
/*!40000 ALTER TABLE `acls_commandgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `acls_commandgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls_connectmethodacl`
--

DROP TABLE IF EXISTS `acls_connectmethodacl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acls_connectmethodacl` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `priority` int NOT NULL,
  `action` varchar(64) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `users` json NOT NULL,
  `connect_methods` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls_connectmethodacl`
--

LOCK TABLES `acls_connectmethodacl` WRITE;
/*!40000 ALTER TABLE `acls_connectmethodacl` DISABLE KEYS */;
/*!40000 ALTER TABLE `acls_connectmethodacl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls_connectmethodacl_reviewers`
--

DROP TABLE IF EXISTS `acls_connectmethodacl_reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acls_connectmethodacl_reviewers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `connectmethodacl_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acls_connectmethodacl_re_connectmethodacl_id_user_12f32736_uniq` (`connectmethodacl_id`,`user_id`),
  KEY `acls_connectmethodac_user_id_10422014_fk_users_use` (`user_id`),
  CONSTRAINT `acls_connectmethodac_connectmethodacl_id_02a7e52a_fk_acls_conn` FOREIGN KEY (`connectmethodacl_id`) REFERENCES `acls_connectmethodacl` (`id`),
  CONSTRAINT `acls_connectmethodac_user_id_10422014_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls_connectmethodacl_reviewers`
--

LOCK TABLES `acls_connectmethodacl_reviewers` WRITE;
/*!40000 ALTER TABLE `acls_connectmethodacl_reviewers` DISABLE KEYS */;
/*!40000 ALTER TABLE `acls_connectmethodacl_reviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls_loginacl`
--

DROP TABLE IF EXISTS `acls_loginacl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acls_loginacl` (
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `priority` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `comment` longtext NOT NULL,
  `action` varchar(64) NOT NULL,
  `rules` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `updated_by` varchar(128) DEFAULT NULL,
  `users` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `acls_loginacl_name_29d38294_uniq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls_loginacl`
--

LOCK TABLES `acls_loginacl` WRITE;
/*!40000 ALTER TABLE `acls_loginacl` DISABLE KEYS */;
/*!40000 ALTER TABLE `acls_loginacl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls_loginacl_reviewers`
--

DROP TABLE IF EXISTS `acls_loginacl_reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acls_loginacl_reviewers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loginacl_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acls_loginacl_reviewers_loginacl_id_user_id_f5316a9b_uniq` (`loginacl_id`,`user_id`),
  KEY `acls_loginacl_reviewers_user_id_9ab0d726_fk_users_user_id` (`user_id`),
  CONSTRAINT `acls_loginacl_reviewers_loginacl_id_79f293a0_fk_acls_loginacl_id` FOREIGN KEY (`loginacl_id`) REFERENCES `acls_loginacl` (`id`),
  CONSTRAINT `acls_loginacl_reviewers_user_id_9ab0d726_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls_loginacl_reviewers`
--

LOCK TABLES `acls_loginacl_reviewers` WRITE;
/*!40000 ALTER TABLE `acls_loginacl_reviewers` DISABLE KEYS */;
/*!40000 ALTER TABLE `acls_loginacl_reviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls_loginassetacl`
--

DROP TABLE IF EXISTS `acls_loginassetacl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acls_loginassetacl` (
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `priority` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `comment` longtext NOT NULL,
  `action` varchar(64) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `accounts` json NOT NULL DEFAULT (_utf8mb3'[]'),
  `assets` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `users` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `rules` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `acls_loginassetacl_name_org_id_59405bfe_uniq` (`name`,`org_id`),
  KEY `acls_loginassetacl_org_id_3ff345c7` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls_loginassetacl`
--

LOCK TABLES `acls_loginassetacl` WRITE;
/*!40000 ALTER TABLE `acls_loginassetacl` DISABLE KEYS */;
/*!40000 ALTER TABLE `acls_loginassetacl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls_loginassetacl_reviewers`
--

DROP TABLE IF EXISTS `acls_loginassetacl_reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acls_loginassetacl_reviewers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loginassetacl_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acls_loginassetacl_revie_loginassetacl_id_user_id_d4269138_uniq` (`loginassetacl_id`,`user_id`),
  KEY `acls_loginassetacl_reviewers_user_id_9b8bcd8d_fk_users_user_id` (`user_id`),
  CONSTRAINT `acls_loginassetacl_r_loginassetacl_id_4e95e191_fk_acls_logi` FOREIGN KEY (`loginassetacl_id`) REFERENCES `acls_loginassetacl` (`id`),
  CONSTRAINT `acls_loginassetacl_reviewers_user_id_9b8bcd8d_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls_loginassetacl_reviewers`
--

LOCK TABLES `acls_loginassetacl_reviewers` WRITE;
/*!40000 ALTER TABLE `acls_loginassetacl_reviewers` DISABLE KEYS */;
/*!40000 ALTER TABLE `acls_loginassetacl_reviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications_application`
--

DROP TABLE IF EXISTS `applications_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications_application` (
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `category` varchar(16) NOT NULL,
  `type` varchar(16) NOT NULL,
  `attrs` json NOT NULL,
  `comment` longtext NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `applications_application_org_id_name_f4819bcf_uniq` (`org_id`,`name`),
  KEY `applications_application_org_id_8d1171cd` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications_application`
--

LOCK TABLES `applications_application` WRITE;
/*!40000 ALTER TABLE `applications_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_adminuser`
--

DROP TABLE IF EXISTS `assets_adminuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_adminuser` (
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(512) DEFAULT NULL,
  `private_key` longtext,
  `public_key` longtext,
  `comment` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `become` tinyint(1) NOT NULL,
  `become_method` varchar(4) NOT NULL,
  `become_user` varchar(64) NOT NULL,
  `_become_pass` varchar(128) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_adminuser_name_org_id_f4143466_uniq` (`name`,`org_id`),
  KEY `assets_adminuser_org_id_887b62b3` (`org_id`),
  KEY `assets_adminuser_username_7d5d7a4c` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_adminuser`
--

LOCK TABLES `assets_adminuser` WRITE;
/*!40000 ALTER TABLE `assets_adminuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_adminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_asset`
--

DROP TABLE IF EXISTS `assets_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_asset` (
  `id` char(32) NOT NULL,
  `address` varchar(767) NOT NULL,
  `name` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `domain_id` char(32) DEFAULT NULL,
  `org_id` varchar(36) NOT NULL,
  `platform_id` int NOT NULL,
  `connectivity` varchar(16) NOT NULL,
  `date_verified` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `custom_info` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `gathered_info` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_asset_org_id_hostname_13a2c598_uniq` (`org_id`,`name`),
  KEY `assets_asset_ip_ceeb994c` (`address`),
  KEY `assets_asset_domain_id_bda54057_fk_assets_domain_id` (`domain_id`),
  KEY `assets_asset_org_id_f25200c7` (`org_id`),
  KEY `assets_asset_platform_id_b2b0830c_fk_assets_platform_id` (`platform_id`),
  CONSTRAINT `assets_asset_domain_id_bda54057_fk_assets_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `assets_domain` (`id`),
  CONSTRAINT `assets_asset_platform_id_b2b0830c_fk_assets_platform_id` FOREIGN KEY (`platform_id`) REFERENCES `assets_platform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_asset`
--

LOCK TABLES `assets_asset` WRITE;
/*!40000 ALTER TABLE `assets_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_asset_nodes`
--

DROP TABLE IF EXISTS `assets_asset_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_asset_nodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` char(32) NOT NULL,
  `node_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_asset_nodes_asset_id_node_id_f4aa1161_uniq` (`asset_id`,`node_id`),
  KEY `assets_asset_nodes_node_id_bfe6279c_fk_assets_node_id` (`node_id`),
  CONSTRAINT `assets_asset_nodes_asset_id_8f05f3ee_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`),
  CONSTRAINT `assets_asset_nodes_node_id_bfe6279c_fk_assets_node_id` FOREIGN KEY (`node_id`) REFERENCES `assets_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_asset_nodes`
--

LOCK TABLES `assets_asset_nodes` WRITE;
/*!40000 ALTER TABLE `assets_asset_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_asset_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_assetgroup`
--

DROP TABLE IF EXISTS `assets_assetgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_assetgroup` (
  `id` char(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `created_by` varchar(32) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_assetgroup`
--

LOCK TABLES `assets_assetgroup` WRITE;
/*!40000 ALTER TABLE `assets_assetgroup` DISABLE KEYS */;
INSERT INTO `assets_assetgroup` VALUES ('a748708267f64e0baa4d3d55b3f5882c','Default','System','2024-05-03 19:33:05.916345','');
/*!40000 ALTER TABLE `assets_assetgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_automationexecution`
--

DROP TABLE IF EXISTS `assets_automationexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_automationexecution` (
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `status` varchar(16) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_start` datetime(6) DEFAULT NULL,
  `date_finished` datetime(6) DEFAULT NULL,
  `snapshot` longtext,
  `trigger` varchar(128) NOT NULL,
  `automation_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_automationexe_automation_id_9e4a308b_fk_assets_ba` (`automation_id`),
  KEY `assets_automationexecution_org_id_a68372e6` (`org_id`),
  KEY `assets_automationexecution_date_start_87e25a00` (`date_start`),
  CONSTRAINT `assets_automationexe_automation_id_9e4a308b_fk_assets_ba` FOREIGN KEY (`automation_id`) REFERENCES `assets_baseautomation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_automationexecution`
--

LOCK TABLES `assets_automationexecution` WRITE;
/*!40000 ALTER TABLE `assets_automationexecution` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_automationexecution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_baseautomation`
--

DROP TABLE IF EXISTS `assets_baseautomation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_baseautomation` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `id` char(32) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `is_periodic` tinyint(1) NOT NULL,
  `interval` int DEFAULT NULL,
  `crontab` varchar(128) DEFAULT NULL,
  `accounts` json NOT NULL,
  `type` varchar(16) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `params` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_baseautomation_org_id_name_type_7abb1169_uniq` (`org_id`,`name`,`type`),
  KEY `assets_baseautomation_org_id_90cdbb4e` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_baseautomation`
--

LOCK TABLES `assets_baseautomation` WRITE;
/*!40000 ALTER TABLE `assets_baseautomation` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_baseautomation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_baseautomation_assets`
--

DROP TABLE IF EXISTS `assets_baseautomation_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_baseautomation_assets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `baseautomation_id` char(32) NOT NULL,
  `asset_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_baseautomation_as_baseautomation_id_asset__c61bf0b9_uniq` (`baseautomation_id`,`asset_id`),
  KEY `assets_baseautomatio_asset_id_0704a331_fk_assets_as` (`asset_id`),
  CONSTRAINT `assets_baseautomatio_asset_id_0704a331_fk_assets_as` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`),
  CONSTRAINT `assets_baseautomatio_baseautomation_id_39e8581c_fk_assets_ba` FOREIGN KEY (`baseautomation_id`) REFERENCES `assets_baseautomation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_baseautomation_assets`
--

LOCK TABLES `assets_baseautomation_assets` WRITE;
/*!40000 ALTER TABLE `assets_baseautomation_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_baseautomation_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_baseautomation_nodes`
--

DROP TABLE IF EXISTS `assets_baseautomation_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_baseautomation_nodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `baseautomation_id` char(32) NOT NULL,
  `node_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_baseautomation_no_baseautomation_id_node_i_bd718cde_uniq` (`baseautomation_id`,`node_id`),
  KEY `assets_baseautomation_nodes_node_id_11df5b5b_fk_assets_node_id` (`node_id`),
  CONSTRAINT `assets_baseautomatio_baseautomation_id_5c9eea85_fk_assets_ba` FOREIGN KEY (`baseautomation_id`) REFERENCES `assets_baseautomation` (`id`),
  CONSTRAINT `assets_baseautomation_nodes_node_id_11df5b5b_fk_assets_node_id` FOREIGN KEY (`node_id`) REFERENCES `assets_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_baseautomation_nodes`
--

LOCK TABLES `assets_baseautomation_nodes` WRITE;
/*!40000 ALTER TABLE `assets_baseautomation_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_baseautomation_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_cloud`
--

DROP TABLE IF EXISTS `assets_cloud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_cloud` (
  `asset_ptr_id` char(32) NOT NULL,
  PRIMARY KEY (`asset_ptr_id`),
  CONSTRAINT `assets_cloud_asset_ptr_id_44d12f5e_fk_assets_asset_id` FOREIGN KEY (`asset_ptr_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_cloud`
--

LOCK TABLES `assets_cloud` WRITE;
/*!40000 ALTER TABLE `assets_cloud` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_cloud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_custom`
--

DROP TABLE IF EXISTS `assets_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_custom` (
  `asset_ptr_id` char(32) NOT NULL,
  PRIMARY KEY (`asset_ptr_id`),
  CONSTRAINT `assets_custom_asset_ptr_id_c9ab0d9d_fk_assets_asset_id` FOREIGN KEY (`asset_ptr_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_custom`
--

LOCK TABLES `assets_custom` WRITE;
/*!40000 ALTER TABLE `assets_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_database`
--

DROP TABLE IF EXISTS `assets_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_database` (
  `asset_ptr_id` char(32) NOT NULL,
  `db_name` varchar(1024) NOT NULL,
  `allow_invalid_cert` tinyint(1) NOT NULL,
  `ca_cert` longtext NOT NULL,
  `client_cert` longtext NOT NULL,
  `client_key` longtext NOT NULL,
  `use_ssl` tinyint(1) NOT NULL,
  PRIMARY KEY (`asset_ptr_id`),
  CONSTRAINT `assets_database_asset_ptr_id_cbfecc96_fk_assets_asset_id` FOREIGN KEY (`asset_ptr_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_database`
--

LOCK TABLES `assets_database` WRITE;
/*!40000 ALTER TABLE `assets_database` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_database` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_device`
--

DROP TABLE IF EXISTS `assets_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_device` (
  `asset_ptr_id` char(32) NOT NULL,
  PRIMARY KEY (`asset_ptr_id`),
  CONSTRAINT `assets_device_asset_ptr_id_fc7eff6e_fk_assets_asset_id` FOREIGN KEY (`asset_ptr_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_device`
--

LOCK TABLES `assets_device` WRITE;
/*!40000 ALTER TABLE `assets_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_domain`
--

DROP TABLE IF EXISTS `assets_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_domain` (
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `comment` longtext NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `org_id` varchar(36) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_domain_org_id_name_f058d44e_uniq` (`org_id`,`name`),
  KEY `assets_domain_org_id_50f4640b` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_domain`
--

LOCK TABLES `assets_domain` WRITE;
/*!40000 ALTER TABLE `assets_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_favoriteasset`
--

DROP TABLE IF EXISTS `assets_favoriteasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_favoriteasset` (
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `asset_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_favoriteasset_user_id_asset_id_872412e3_uniq` (`user_id`,`asset_id`),
  KEY `assets_favoriteasset_asset_id_ac2ed019_fk_assets_asset_id` (`asset_id`),
  CONSTRAINT `assets_favoriteasset_asset_id_ac2ed019_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`),
  CONSTRAINT `assets_favoriteasset_user_id_7809bc5b_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_favoriteasset`
--

LOCK TABLES `assets_favoriteasset` WRITE;
/*!40000 ALTER TABLE `assets_favoriteasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_favoriteasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_gatherfactsautomation`
--

DROP TABLE IF EXISTS `assets_gatherfactsautomation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_gatherfactsautomation` (
  `baseautomation_ptr_id` char(32) NOT NULL,
  PRIMARY KEY (`baseautomation_ptr_id`),
  CONSTRAINT `assets_gatherfactsau_baseautomation_ptr_i_4f797d64_fk_assets_ba` FOREIGN KEY (`baseautomation_ptr_id`) REFERENCES `assets_baseautomation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_gatherfactsautomation`
--

LOCK TABLES `assets_gatherfactsautomation` WRITE;
/*!40000 ALTER TABLE `assets_gatherfactsautomation` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_gatherfactsautomation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_gpt`
--

DROP TABLE IF EXISTS `assets_gpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_gpt` (
  `asset_ptr_id` char(32) NOT NULL,
  `proxy` varchar(128) NOT NULL,
  PRIMARY KEY (`asset_ptr_id`),
  CONSTRAINT `assets_gpt_asset_ptr_id_b92bbec5_fk_assets_asset_id` FOREIGN KEY (`asset_ptr_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_gpt`
--

LOCK TABLES `assets_gpt` WRITE;
/*!40000 ALTER TABLE `assets_gpt` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_gpt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_host`
--

DROP TABLE IF EXISTS `assets_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_host` (
  `asset_ptr_id` char(32) NOT NULL,
  PRIMARY KEY (`asset_ptr_id`),
  CONSTRAINT `assets_host_asset_ptr_id_d0801966_fk_assets_asset_id` FOREIGN KEY (`asset_ptr_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_host`
--

LOCK TABLES `assets_host` WRITE;
/*!40000 ALTER TABLE `assets_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_label`
--

DROP TABLE IF EXISTS `assets_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_label` (
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` varchar(128) NOT NULL,
  `category` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `comment` longtext NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `org_id` varchar(36) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_label_name_value_org_id_ca0b35a2_uniq` (`name`,`value`,`org_id`),
  KEY `assets_label_org_id_2a425d25` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_label`
--

LOCK TABLES `assets_label` WRITE;
/*!40000 ALTER TABLE `assets_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_node`
--

DROP TABLE IF EXISTS `assets_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_node` (
  `id` char(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` varchar(128) NOT NULL,
  `child_mark` int NOT NULL,
  `date_create` datetime(6) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `assets_amount` int NOT NULL,
  `parent_key` varchar(64) NOT NULL,
  `full_value` varchar(4096) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `assets_node_org_id_400c35cb` (`org_id`),
  KEY `assets_node_parent_key_1d05e1aa` (`parent_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_node`
--

LOCK TABLES `assets_node` WRITE;
/*!40000 ALTER TABLE `assets_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_pingautomation`
--

DROP TABLE IF EXISTS `assets_pingautomation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_pingautomation` (
  `baseautomation_ptr_id` char(32) NOT NULL,
  PRIMARY KEY (`baseautomation_ptr_id`),
  CONSTRAINT `assets_pingautomatio_baseautomation_ptr_i_175d6fb0_fk_assets_ba` FOREIGN KEY (`baseautomation_ptr_id`) REFERENCES `assets_baseautomation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_pingautomation`
--

LOCK TABLES `assets_pingautomation` WRITE;
/*!40000 ALTER TABLE `assets_pingautomation` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_pingautomation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_platform`
--

DROP TABLE IF EXISTS `assets_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_platform` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(32) NOT NULL,
  `charset` varchar(8) NOT NULL,
  `meta` longtext,
  `internal` tinyint(1) NOT NULL,
  `comment` longtext NOT NULL,
  `category` varchar(32) NOT NULL,
  `domain_enabled` tinyint(1) NOT NULL,
  `su_enabled` tinyint(1) NOT NULL,
  `su_method` varchar(32) DEFAULT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `custom_fields` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_platform`
--

LOCK TABLES `assets_platform` WRITE;
/*!40000 ALTER TABLE `assets_platform` DISABLE KEYS */;
INSERT INTO `assets_platform` VALUES (1,'Linux','linux','utf-8','{}',1,'','host',1,1,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(2,'Unix','unix','utf-8','{}',1,'','host',1,1,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(3,'macOS','unix','utf-8','{}',1,'','host',1,1,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(4,'BSD','unix','utf-8','{}',1,'','host',1,1,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(5,'Windows','windows','utf-8','{}',1,'','host',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(6,'Windows2016','windows','utf-8','{\"security\": \"any\"}',0,'','host',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(7,'Other','other','utf-8','{}',0,'','host',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(8,'Windows-RDP','windows','utf-8','{\"security\": \"rdp\"}',1,'','host',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(9,'Windows-TLS','windows','utf-8','{\"security\": \"tls\"}',1,'','host',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(10,'AIX','unix','utf-8','{}',1,'','host',1,1,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(11,'Gateway','linux','utf-8','{}',1,'','host',1,1,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(12,'RemoteAppHost','windows','utf-8','{}',1,'','host',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(13,'General','general','utf-8','{}',1,'','device',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(14,'Cisco','general','utf-8','{}',1,'','device',1,1,'enable',NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(15,'Huawei','general','utf-8','{}',1,'','device',1,1,'super',NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(16,'H3C','general','utf-8','{}',1,'','device',1,1,'super_level',NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(17,'MySQL','mysql','utf-8','{}',1,'','database',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(18,'MariaDB','mariadb','utf-8','{}',1,'','database',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(19,'PostgreSQL','postgresql','utf-8','{}',1,'','database',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(20,'Oracle','oracle','utf-8','{}',1,'','database',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(21,'SQLServer','sqlserver','utf-8','{}',1,'','database',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(22,'ClickHouse','clickhouse','utf-8','{}',1,'','database',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(23,'MongoDB','mongodb','utf-8','{}',1,'','database',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(24,'Redis','redis','utf-8','{}',1,'','database',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(25,'Redis6+','redis','utf-8','{}',1,'','database',1,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(26,'Website','website','utf-8','{}',1,'','web',0,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(27,'Vmware-vSphere','private','utf-8','{}',1,'','cloud',0,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(28,'Kubernetes','k8s','utf-8','{}',1,'','cloud',0,0,NULL,NULL,'2024-05-03 19:34:38.872768','2024-05-03 19:34:38.937182',NULL,NULL),(29,'ChatGPT','chatgpt','utf-8','{}',1,'ChatGPT','gpt',0,0,NULL,'System','2024-05-03 19:34:43.412811','2024-05-03 19:34:43.412835','System','[]'),(30,'DB2','db2','utf-8','{}',1,'DB2','database',1,0,NULL,'System','2024-05-03 19:35:05.822462','2024-05-03 19:35:05.822484','System','[]');
/*!40000 ALTER TABLE `assets_platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_platformautomation`
--

DROP TABLE IF EXISTS `assets_platformautomation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_platformautomation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ansible_enabled` tinyint(1) NOT NULL,
  `ansible_config` json NOT NULL,
  `ping_enabled` tinyint(1) NOT NULL,
  `ping_method` varchar(32) DEFAULT NULL,
  `gather_facts_enabled` tinyint(1) NOT NULL,
  `gather_facts_method` longtext,
  `change_secret_enabled` tinyint(1) NOT NULL,
  `change_secret_method` longtext,
  `push_account_enabled` tinyint(1) NOT NULL,
  `push_account_method` longtext,
  `verify_account_enabled` tinyint(1) NOT NULL,
  `verify_account_method` longtext,
  `gather_accounts_enabled` tinyint(1) NOT NULL,
  `gather_accounts_method` longtext,
  `change_secret_params` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `gather_accounts_params` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `gather_facts_params` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `ping_params` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `push_account_params` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `verify_account_params` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `platform_id` int DEFAULT NULL,
  `remove_account_enabled` tinyint(1) NOT NULL,
  `remove_account_method` longtext,
  `remove_account_params` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `platform_id` (`platform_id`),
  CONSTRAINT `assets_platformautom_platform_id_032a082f_fk_assets_pl` FOREIGN KEY (`platform_id`) REFERENCES `assets_platform` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_platformautomation`
--

LOCK TABLES `assets_platformautomation` WRITE;
/*!40000 ALTER TABLE `assets_platformautomation` DISABLE KEYS */;
INSERT INTO `assets_platformautomation` VALUES (1,1,'{\"ansible_connection\": \"smart\"}',1,'posix_ping',1,'gather_facts_posix',1,'change_secret_posix',1,'push_account_posix',1,'verify_account_posix',1,'gather_accounts_posix','{}','{}','{}','{}','{\"home\": \"\", \"sudo\": \"/bin/whoami\", \"shell\": \"/bin/bash\", \"groups\": \"\"}','{}',1,1,'remove_account_posix','{}'),(2,1,'{\"ansible_connection\": \"smart\"}',1,'posix_ping',1,'gather_facts_posix',1,'change_secret_posix',1,'push_account_posix',1,'verify_account_posix',1,'gather_accounts_posix','{}','{}','{}','{}','{\"home\": \"\", \"sudo\": \"/bin/whoami\", \"shell\": \"/bin/bash\", \"groups\": \"\"}','{}',11,1,'remove_account_posix','{}'),(3,1,'{\"ansible_connection\": \"smart\"}',1,'posix_ping',1,'gather_facts_posix',1,'change_secret_posix',1,'push_account_posix',1,'verify_account_posix',1,'gather_accounts_posix','{}','{}','{}','{}','{\"home\": \"\", \"sudo\": \"/bin/whoami\", \"shell\": \"/bin/bash\", \"groups\": \"\"}','{}',2,1,'remove_account_posix','{}'),(4,1,'{\"ansible_connection\": \"smart\"}',1,'posix_ping',1,'gather_facts_posix',1,'change_secret_posix',1,'push_account_posix',1,'verify_account_posix',1,'gather_accounts_posix','{}','{}','{}','{}','{\"home\": \"\", \"sudo\": \"/bin/whoami\", \"shell\": \"/bin/bash\", \"groups\": \"\"}','{}',3,1,'remove_account_posix','{}'),(5,1,'{\"ansible_connection\": \"smart\"}',1,'posix_ping',1,'gather_facts_posix',1,'change_secret_posix',1,'push_account_posix',1,'verify_account_posix',1,'gather_accounts_posix','{}','{}','{}','{}','{\"home\": \"\", \"sudo\": \"/bin/whoami\", \"shell\": \"/bin/bash\", \"groups\": \"\"}','{}',4,1,'remove_account_posix','{}'),(6,1,'{\"ansible_connection\": \"smart\"}',1,'posix_ping',1,'gather_facts_posix',1,'change_secret_aix',1,'push_account_aix',1,'verify_account_posix',1,'gather_accounts_posix','{}','{}','{}','{}','{\"home\": \"\", \"sudo\": \"/bin/whoami\", \"shell\": \"/bin/bash\", \"groups\": \"\"}','{}',10,1,'remove_account_posix','{}'),(7,1,'{\"ansible_connection\": \"ssh\", \"ansible_shell_type\": \"cmd\"}',1,'ping_by_rdp',1,'gather_facts_windows',1,'change_secret_local_windows',1,'push_account_local_windows',1,'verify_account_by_rdp',1,'gather_accounts_windows','{}','{}','{}','{}','{\"groups\": \"Users,Remote Desktop Users\"}','{}',5,1,'remove_account_windows','{}'),(8,1,'{\"ansible_connection\": \"ssh\", \"ansible_shell_type\": \"cmd\"}',1,'win_ping',1,'gather_facts_windows',1,'change_secret_local_windows',1,'push_account_local_windows',1,'verify_account_windows',1,'gather_accounts_windows','{}','{}','{}','{}','{\"groups\": \"Users,Remote Desktop Users\"}','{}',9,1,'remove_account_windows','{}'),(9,1,'{\"ansible_connection\": \"ssh\", \"ansible_shell_type\": \"cmd\"}',1,'win_ping',1,'gather_facts_windows',1,'change_secret_local_windows',1,'push_account_local_windows',1,'verify_account_windows',1,'gather_accounts_windows','{}','{}','{}','{}','{\"groups\": \"Users,Remote Desktop Users\"}','{}',8,1,'remove_account_windows','{}'),(10,1,'{\"ansible_connection\": \"ssh\", \"ansible_shell_type\": \"cmd\"}',1,'win_ping',1,'gather_facts_windows',1,'change_secret_local_windows',1,'push_account_local_windows',1,'verify_account_windows',1,'gather_accounts_windows','{}','{}','{}','{}','{\"groups\": \"Users,Remote Desktop Users\"}','{}',12,1,'remove_account_windows','{}'),(11,1,'{\"ansible_connection\": \"local\", \"first_connect_delay\": 0.5}',1,'ping_by_ssh',0,NULL,1,'change_secret_by_ssh',0,NULL,1,'verify_account_by_ssh',0,NULL,'{}','{}','{}','{}','{}','{}',13,0,NULL,'{}'),(12,1,'{\"ansible_connection\": \"local\", \"first_connect_delay\": 0.5}',1,'ping_by_ssh',0,NULL,1,'change_secret_by_ssh',0,NULL,1,'verify_account_by_ssh',0,NULL,'{}','{}','{}','{}','{}','{}',14,0,NULL,'{}'),(13,1,'{\"ansible_connection\": \"local\", \"first_connect_delay\": 0.5}',1,'ping_by_ssh',0,NULL,1,'change_secret_by_ssh',0,NULL,1,'verify_account_by_ssh',0,NULL,'{}','{}','{}','{}','{}','{}',15,0,NULL,'{}'),(14,1,'{\"ansible_connection\": \"local\", \"first_connect_delay\": 0.5}',1,'ping_by_ssh',0,NULL,1,'change_secret_by_ssh',0,NULL,1,'verify_account_by_ssh',0,NULL,'{}','{}','{}','{}','{}','{}',16,0,NULL,'{}'),(15,1,'{\"ansible_connection\": \"local\"}',1,'mysql_ping',0,NULL,1,'change_secret_mysql',1,'push_account_mysql',1,'verify_account_mysql',1,'gather_accounts_mysql','{}','{}','{}','{}','{}','{}',17,1,'remove_account_mysql','{}'),(16,1,'{\"ansible_connection\": \"local\"}',1,'mysql_ping',0,NULL,1,'change_secret_mysql',1,'push_account_mysql',1,'verify_account_mysql',1,'gather_accounts_mysql','{}','{}','{}','{}','{}','{}',18,1,'remove_account_mysql','{}'),(17,1,'{\"ansible_connection\": \"local\"}',1,'ping_postgresql',0,NULL,1,'change_secret_postgresql',1,'push_account_postgresql',1,'verify_account_postgresql',1,'gather_accounts_postgresql','{}','{}','{}','{}','{}','{}',19,1,'remove_account_postgresql','{}'),(18,1,'{\"ansible_connection\": \"local\"}',1,'oracle_ping',0,NULL,1,'change_secret_oracle',1,'push_account_oracle',1,'verify_account_oracle',1,'gather_accounts_oracle','{}','{}','{}','{}','{}','{}',20,1,'remove_account_oracle','{}'),(19,1,'{\"ansible_connection\": \"local\"}',1,'sqlserver_ping',0,NULL,1,'change_secret_sqlserver',1,'push_account_sqlserver',1,'verify_account_sqlserver',1,NULL,'{}','{}','{}','{}','{}','{}',21,1,'remove_account_sqlserver','{}'),(20,0,'{\"ansible_connection\": \"local\"}',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,'{}','{}','{}','{}','{}','{}',22,0,NULL,'{}'),(21,1,'{\"ansible_connection\": \"local\"}',1,'mongodb_ping',0,NULL,1,'change_secret_mongodb',1,'push_account_mongodb',1,'verify_account_mongodb',1,'gather_accounts_mongodb','{}','{}','{}','{}','{}','{}',23,1,'remove_account_mongodb','{}'),(22,0,'{\"ansible_connection\": \"local\"}',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,'{}','{}','{}','{}','{}','{}',24,0,NULL,'{}'),(23,0,'{\"ansible_connection\": \"local\"}',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,'{}','{}','{}','{}','{}','{}',25,0,NULL,'{}'),(24,0,'{}',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,'{}','{}','{}','{}','{}','{}',26,0,NULL,'{}'),(25,0,'{}',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,'{}','{}','{}','{}','{}','{}',27,0,NULL,'{}'),(26,0,'{}',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,'{}','{}','{}','{}','{}','{}',28,0,NULL,'{}'),(27,1,'{\"ansible_connection\": \"smart\", \"ansible_shell_type\": \"cmd\"}',1,'ping_by_rdp',1,'gather_facts_windows',1,'change_secret_local_windows',1,'push_account_local_windows',1,'verify_account_by_rdp',1,'gather_accounts_windows','{}','{}','{}','{}','{\"groups\": \"Users,Remote Desktop Users\"}','{}',6,1,'remove_account_windows','{}'),(28,0,'{\"ansible_connection\": \"smart\"}',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,'{}','{}','{}','{}','{}','{}',7,0,NULL,'{}'),(29,0,'{}',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,'{}','{}','{}','{}','{}','{}',29,0,NULL,'{}'),(30,0,'{}',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,'{}','{}','{}','{}','{}','{}',30,0,NULL,'{}');
/*!40000 ALTER TABLE `assets_platformautomation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_platformprotocol`
--

DROP TABLE IF EXISTS `assets_platformprotocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_platformprotocol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `port` int NOT NULL,
  `setting` json NOT NULL,
  `platform_id` int NOT NULL,
  `default` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_platformproto_platform_id_b77e3926_fk_assets_pl` (`platform_id`),
  CONSTRAINT `assets_platformproto_platform_id_b77e3926_fk_assets_pl` FOREIGN KEY (`platform_id`) REFERENCES `assets_platform` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_platformprotocol`
--

LOCK TABLES `assets_platformprotocol` WRITE;
/*!40000 ALTER TABLE `assets_platformprotocol` DISABLE KEYS */;
INSERT INTO `assets_platformprotocol` VALUES (1,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',1,0,0,1,1),(2,'telnet',23,'{}',1,0,0,0,1),(3,'vnc',5900,'{}',1,0,0,0,1),(4,'rdp',3389,'{\"console\": false, \"security\": \"any\"}',1,0,0,0,1),(5,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',11,0,0,1,1),(6,'telnet',23,'{}',11,0,0,0,1),(7,'vnc',5900,'{}',11,0,0,0,1),(8,'rdp',3389,'{\"console\": false, \"security\": \"any\"}',11,0,0,0,1),(9,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',2,0,0,1,1),(10,'telnet',23,'{}',2,0,0,0,1),(11,'vnc',5900,'{}',2,0,0,0,1),(12,'rdp',3389,'{\"console\": false, \"security\": \"any\"}',2,0,0,0,1),(13,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',3,0,0,1,1),(14,'telnet',23,'{}',3,0,0,0,1),(15,'vnc',5900,'{}',3,0,0,0,1),(16,'rdp',3389,'{\"console\": false, \"security\": \"any\"}',3,0,0,0,1),(17,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',4,0,0,1,1),(18,'telnet',23,'{}',4,0,0,0,1),(19,'vnc',5900,'{}',4,0,0,0,1),(20,'rdp',3389,'{\"console\": false, \"security\": \"any\"}',4,0,0,0,1),(21,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',10,0,0,1,1),(22,'telnet',23,'{}',10,0,0,0,1),(23,'vnc',5900,'{}',10,0,0,0,1),(24,'rdp',3389,'{\"console\": false, \"security\": \"any\"}',10,0,0,0,1),(25,'rdp',3389,'{\"console\": false, \"security\": \"any\"}',5,0,0,1,1),(26,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',5,0,0,0,1),(27,'vnc',5900,'{}',5,0,0,0,1),(28,'rdp',3389,'{\"console\": false, \"security\": \"tls\"}',9,0,0,1,1),(29,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',9,0,0,0,1),(30,'vnc',5900,'{}',9,0,0,0,1),(31,'rdp',3389,'{\"console\": false, \"security\": \"rdp\"}',8,0,0,1,1),(32,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',8,0,0,0,1),(33,'vnc',5900,'{}',8,0,0,0,1),(34,'rdp',3389,'{\"console\": false, \"security\": \"any\"}',12,0,0,1,1),(35,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',12,1,0,0,1),(36,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',13,0,0,1,1),(37,'telnet',23,'{}',13,0,0,0,1),(38,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',14,0,0,1,1),(39,'telnet',23,'{}',14,0,0,0,1),(40,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',15,0,0,1,1),(41,'telnet',23,'{}',15,0,0,0,1),(42,'ssh',22,'{\"sftp_home\": \"/tmp\", \"sftp_enabled\": true}',16,0,0,1,1),(43,'telnet',23,'{}',16,0,0,0,1),(44,'mysql',3306,'{}',17,0,0,1,1),(45,'mariadb',3306,'{}',18,0,0,1,1),(46,'postgresql',5432,'{}',19,0,0,1,1),(47,'oracle',1521,'{}',20,0,0,1,1),(48,'sqlserver',1433,'{}',21,0,0,1,1),(49,'clickhouse',9000,'{}',22,0,0,1,1),(50,'mongodb',27017,'{}',23,0,0,1,1),(51,'redis',6379,'{\"auth_username\": false}',24,0,0,1,1),(52,'redis',6379,'{\"auth_username\": true}',25,0,0,1,1),(53,'http',80,'{\"safe_mode\": false, \"submit_selector\": \"id=login_button\", \"password_selector\": \"name=password\", \"username_selector\": \"name=username\"}',26,0,0,1,1),(54,'http',80,'{\"safe_mode\": false, \"submit_selector\": \"id=login_button\", \"password_selector\": \"name=password\", \"username_selector\": \"name=username\"}',27,0,0,1,1),(55,'k8s',443,'{}',28,0,0,1,1),(56,'rdp',3389,'{\"console\": false, \"security\": \"any\", \"ad_domain\": \"\"}',6,1,0,1,1),(57,'ssh',22,'{\"old_ssh_version\": false}',6,1,0,0,1),(58,'sftp',22,'{\"sftp_home\": \"/tmp\"}',6,1,0,0,1),(59,'vnc',5900,'{}',6,1,0,0,1),(60,'winrm',5985,'{\"use_ssl\": false}',6,1,0,0,1),(61,'ssh',22,'{\"old_ssh_version\": false}',7,1,0,1,1),(62,'sftp',22,'{\"sftp_home\": \"/tmp\"}',7,1,0,0,1),(63,'telnet',23,'{\"success_prompt\": \"success|成功|#|>|\\\\$\", \"password_prompt\": \"password:\", \"username_prompt\": \"username:|login:\"}',7,1,0,0,1),(64,'vnc',5900,'{}',7,1,0,0,1),(65,'rdp',3389,'{\"console\": false, \"security\": \"any\", \"ad_domain\": \"\"}',7,1,0,0,1),(66,'winrm',5985,'{\"use_ssl\": false}',5,0,0,0,0),(67,'winrm',5985,'{\"use_ssl\": false}',8,0,0,0,0),(68,'winrm',5985,'{\"use_ssl\": false}',9,0,0,0,0),(69,'winrm',5985,'{}',12,0,0,0,0),(70,'chatgpt',443,'{\"api_mode\": \"gpt-3.5-turbo\"}',29,0,0,1,1),(71,'sftp',22,'{\"sftp_home\": \"/tmp\"}',1,1,0,0,1),(72,'sftp',22,'{\"sftp_home\": \"/tmp\"}',11,1,0,0,1),(73,'db2',50000,'{}',30,0,0,1,1);
/*!40000 ALTER TABLE `assets_platformprotocol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_protocol`
--

DROP TABLE IF EXISTS `assets_protocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_protocol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `port` int NOT NULL,
  `asset_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_protocol_asset_id_e66dbaeb_fk_assets_asset_id` (`asset_id`),
  CONSTRAINT `assets_protocol_asset_id_e66dbaeb_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_protocol`
--

LOCK TABLES `assets_protocol` WRITE;
/*!40000 ALTER TABLE `assets_protocol` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_protocol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_systemuser`
--

DROP TABLE IF EXISTS `assets_systemuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_systemuser` (
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(512) DEFAULT NULL,
  `private_key` longtext,
  `public_key` longtext,
  `comment` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `priority` int NOT NULL,
  `protocol` varchar(16) NOT NULL,
  `auto_push` tinyint(1) NOT NULL,
  `sudo` longtext NOT NULL,
  `shell` varchar(64) NOT NULL,
  `login_mode` varchar(10) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `username_same_with_user` tinyint(1) NOT NULL,
  `sftp_root` varchar(128) NOT NULL,
  `token` longtext NOT NULL DEFAULT (_utf8mb3''),
  `home` varchar(4096) NOT NULL,
  `system_groups` varchar(4096) NOT NULL,
  `ad_domain` varchar(256) NOT NULL,
  `type` varchar(16) NOT NULL,
  `su_enabled` tinyint(1) NOT NULL,
  `su_from_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_systemuser_name_org_id_de6b5256_uniq` (`name`,`org_id`),
  KEY `assets_systemuser_org_id_02b6c1a7` (`org_id`),
  KEY `assets_systemuser_username_f420b3a1` (`username`),
  KEY `assets_systemuser_su_from_id_1300766b_fk_assets_systemuser_id` (`su_from_id`),
  CONSTRAINT `assets_systemuser_su_from_id_1300766b_fk_assets_systemuser_id` FOREIGN KEY (`su_from_id`) REFERENCES `assets_systemuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_systemuser`
--

LOCK TABLES `assets_systemuser` WRITE;
/*!40000 ALTER TABLE `assets_systemuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_systemuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_web`
--

DROP TABLE IF EXISTS `assets_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_web` (
  `asset_ptr_id` char(32) NOT NULL,
  `autofill` varchar(16) NOT NULL,
  `password_selector` varchar(128) NOT NULL,
  `submit_selector` varchar(128) NOT NULL,
  `username_selector` varchar(128) NOT NULL,
  `script` json NOT NULL,
  PRIMARY KEY (`asset_ptr_id`),
  CONSTRAINT `assets_web_asset_ptr_id_c7c00478_fk_assets_asset_id` FOREIGN KEY (`asset_ptr_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_web`
--

LOCK TABLES `assets_web` WRITE;
/*!40000 ALTER TABLE `assets_web` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits_activitylog`
--

DROP TABLE IF EXISTS `audits_activitylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audits_activitylog` (
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `type` varchar(2) DEFAULT NULL,
  `resource_id` varchar(36) NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `detail` longtext NOT NULL,
  `detail_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_activitylog_org_id_64d1c757` (`org_id`),
  KEY `audits_activitylog_resource_id_c800d06d` (`resource_id`),
  KEY `audits_activitylog_datetime_e5189044` (`datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits_activitylog`
--

LOCK TABLES `audits_activitylog` WRITE;
/*!40000 ALTER TABLE `audits_activitylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `audits_activitylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits_ftplog`
--

DROP TABLE IF EXISTS `audits_ftplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audits_ftplog` (
  `id` char(32) NOT NULL,
  `user` varchar(128) NOT NULL,
  `remote_addr` varchar(128) DEFAULT NULL,
  `asset` varchar(1024) NOT NULL,
  `account` varchar(128) NOT NULL,
  `operate` varchar(16) NOT NULL,
  `filename` varchar(1024) NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `date_start` datetime(6) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `has_file` tinyint(1) NOT NULL,
  `session` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_ftplog_org_id_de02081f` (`org_id`),
  KEY `audits_ftplog_date_start_1672920a` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits_ftplog`
--

LOCK TABLES `audits_ftplog` WRITE;
/*!40000 ALTER TABLE `audits_ftplog` DISABLE KEYS */;
/*!40000 ALTER TABLE `audits_ftplog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits_operatelog`
--

DROP TABLE IF EXISTS `audits_operatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audits_operatelog` (
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `user` varchar(128) NOT NULL,
  `action` varchar(16) NOT NULL,
  `resource_type` varchar(64) NOT NULL,
  `resource` varchar(128) NOT NULL,
  `remote_addr` varchar(128) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `resource_id` varchar(128) NOT NULL,
  `diff` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_operatelog_org_id_2ee40268` (`org_id`),
  KEY `audits_operatelog_datetime_360b2242` (`datetime`),
  KEY `audits_operatelog_resource_id_64e409c0` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits_operatelog`
--

LOCK TABLES `audits_operatelog` WRITE;
/*!40000 ALTER TABLE `audits_operatelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `audits_operatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits_passwordchangelog`
--

DROP TABLE IF EXISTS `audits_passwordchangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audits_passwordchangelog` (
  `id` char(32) NOT NULL,
  `user` varchar(128) NOT NULL,
  `change_by` varchar(128) NOT NULL,
  `remote_addr` varchar(128) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits_passwordchangelog`
--

LOCK TABLES `audits_passwordchangelog` WRITE;
/*!40000 ALTER TABLE `audits_passwordchangelog` DISABLE KEYS */;
INSERT INTO `audits_passwordchangelog` VALUES ('f525d49a34af4837b382299550914fef','Administrator(admin)','Administrator(admin)','172.10.10.1','2024-05-03 19:45:22.113802');
/*!40000 ALTER TABLE `audits_passwordchangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits_userloginlog`
--

DROP TABLE IF EXISTS `audits_userloginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audits_userloginlog` (
  `id` char(32) NOT NULL,
  `username` varchar(128) NOT NULL,
  `type` varchar(2) NOT NULL,
  `ip` char(39) NOT NULL,
  `city` varchar(254) DEFAULT NULL,
  `user_agent` varchar(254) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `mfa` smallint NOT NULL,
  `reason` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `backend` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_userloginlog_datetime_165fc15a` (`datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits_userloginlog`
--

LOCK TABLES `audits_userloginlog` WRITE;
/*!40000 ALTER TABLE `audits_userloginlog` DISABLE KEYS */;
INSERT INTO `audits_userloginlog` VALUES ('00d279eeb1a44c92af6e8a5347d04c8f','Administrator(admin)','W','172.10.10.1','未知','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36','2024-05-03 19:45:27.488889',0,'',1,'Password');
/*!40000 ALTER TABLE `audits_userloginlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits_usersession`
--

DROP TABLE IF EXISTS `audits_usersession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audits_usersession` (
  `id` char(32) NOT NULL,
  `ip` char(39) NOT NULL,
  `key` varchar(128) NOT NULL,
  `city` varchar(254) DEFAULT NULL,
  `user_agent` varchar(254) DEFAULT NULL,
  `type` varchar(2) NOT NULL,
  `backend` varchar(32) NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_usersession_user_id_38846be8_fk_users_user_id` (`user_id`),
  CONSTRAINT `audits_usersession_user_id_38846be8_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits_usersession`
--

LOCK TABLES `audits_usersession` WRITE;
/*!40000 ALTER TABLE `audits_usersession` DISABLE KEYS */;
INSERT INTO `audits_usersession` VALUES ('1f3df26a332543babfa1949d8ab4b10c','172.10.10.1','o72805l3t7no1pbffm6vqzqfsncm5qos','未知','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36','W','Password','2024-05-03 19:45:27.488889','15e6ac8a16464d68a66f565af10e2921');
/*!40000 ALTER TABLE `audits_usersession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=683 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Organization',17,'add_organization'),(2,'Can change Organization',17,'change_organization'),(3,'Can delete Organization',17,'delete_organization'),(4,'Can view Organization',17,'view_organization'),(5,'Can view root org',17,'view_rootorg'),(6,'Can view all joined org',17,'view_alljoinedorg'),(7,'Can add User',18,'add_user'),(8,'Can change User',18,'change_user'),(9,'Can delete User',18,'delete_user'),(10,'Can view User',18,'view_user'),(11,'Can invite user',18,'invite_user'),(12,'Can remove user',18,'remove_user'),(13,'Can match user',18,'match_user'),(14,'Can add User group',19,'add_usergroup'),(15,'Can change User group',19,'change_usergroup'),(16,'Can delete User group',19,'delete_usergroup'),(17,'Can view User group',19,'view_usergroup'),(18,'Can add User password history',20,'add_userpasswordhistory'),(19,'Can change User password history',20,'change_userpasswordhistory'),(20,'Can delete User password history',20,'delete_userpasswordhistory'),(21,'Can view User password history',20,'view_userpasswordhistory'),(22,'Can add Preference',21,'add_preference'),(23,'Can change Preference',21,'change_preference'),(24,'Can delete Preference',21,'delete_preference'),(25,'Can view Preference',21,'view_preference'),(26,'Can add Admin user',22,'add_adminuser'),(27,'Can change Admin user',22,'change_adminuser'),(28,'Can delete Admin user',22,'delete_adminuser'),(29,'Can view Admin user',22,'view_adminuser'),(30,'Can add Asset',1,'add_asset'),(31,'Can change Asset',1,'change_asset'),(32,'Can delete Asset',1,'delete_asset'),(33,'Can view Asset',1,'view_asset'),(34,'Can refresh asset hardware info',1,'refresh_assethardwareinfo'),(35,'Can test asset connectivity',1,'test_assetconnectivity'),(36,'Can match asset',1,'match_asset'),(37,'Can change asset nodes',1,'change_assetnodes'),(38,'Can add Asset group',23,'add_assetgroup'),(39,'Can change Asset group',23,'change_assetgroup'),(40,'Can delete Asset group',23,'delete_assetgroup'),(41,'Can view Asset group',23,'view_assetgroup'),(42,'Can add System user',24,'add_systemuser'),(43,'Can change System user',24,'change_systemuser'),(44,'Can delete System user',24,'delete_systemuser'),(45,'Can view System user',24,'view_systemuser'),(46,'Can match system user',24,'match_systemuser'),(47,'Can add Label',25,'add_label'),(48,'Can change Label',25,'change_label'),(49,'Can delete Label',25,'delete_label'),(50,'Can view Label',25,'view_label'),(51,'Can add Node',12,'add_node'),(52,'Can change Node',12,'change_node'),(53,'Can delete Node',12,'delete_node'),(54,'Can view Node',12,'view_node'),(55,'Can match node',12,'match_node'),(56,'Can add Domain',26,'add_domain'),(57,'Can change Domain',26,'change_domain'),(58,'Can delete Domain',26,'delete_domain'),(59,'Can view Domain',26,'view_domain'),(60,'Can add Favorite asset',27,'add_favoriteasset'),(61,'Can change Favorite asset',27,'change_favoriteasset'),(62,'Can delete Favorite asset',27,'delete_favoriteasset'),(63,'Can view Favorite asset',27,'view_favoriteasset'),(64,'Can add Platform',28,'add_platform'),(65,'Can change Platform',28,'change_platform'),(66,'Can delete Platform',28,'delete_platform'),(67,'Can view Platform',28,'view_platform'),(68,'Can add Host',6,'add_host'),(69,'Can change Host',6,'change_host'),(70,'Can delete Host',6,'delete_host'),(71,'Can view Host',6,'view_host'),(72,'Can add Database',29,'add_database'),(73,'Can change Database',29,'change_database'),(74,'Can delete Database',29,'delete_database'),(75,'Can view Database',29,'view_database'),(76,'Can add Device',30,'add_device'),(77,'Can change Device',30,'change_device'),(78,'Can delete Device',30,'delete_device'),(79,'Can view Device',30,'view_device'),(80,'Can add Cloud',31,'add_cloud'),(81,'Can change Cloud',31,'change_cloud'),(82,'Can delete Cloud',31,'delete_cloud'),(83,'Can view Cloud',31,'view_cloud'),(84,'Can add Web',32,'add_web'),(85,'Can change Web',32,'change_web'),(86,'Can delete Web',32,'delete_web'),(87,'Can view Web',32,'view_web'),(88,'Can add platform protocol',33,'add_platformprotocol'),(89,'Can change platform protocol',33,'change_platformprotocol'),(90,'Can delete platform protocol',33,'delete_platformprotocol'),(91,'Can view platform protocol',33,'view_platformprotocol'),(92,'Can add platform automation',34,'add_platformautomation'),(93,'Can change platform automation',34,'change_platformautomation'),(94,'Can delete platform automation',34,'delete_platformautomation'),(95,'Can view platform automation',34,'view_platformautomation'),(96,'Can add protocol',35,'add_protocol'),(97,'Can change protocol',35,'change_protocol'),(98,'Can delete protocol',35,'delete_protocol'),(99,'Can view protocol',35,'view_protocol'),(100,'Can add Gateway',7,'add_gateway'),(101,'Can change Gateway',7,'change_gateway'),(102,'Can delete Gateway',7,'delete_gateway'),(103,'Can view Gateway',7,'view_gateway'),(104,'Can add Automation task',2,'add_baseautomation'),(105,'Can change Automation task',2,'change_baseautomation'),(106,'Can delete Automation task',2,'delete_baseautomation'),(107,'Can view Automation task',2,'view_baseautomation'),(108,'Can add Automation task execution',4,'add_automationexecution'),(109,'Can change Automation task execution',4,'change_automationexecution'),(110,'Can delete Automation task execution',4,'delete_automationexecution'),(111,'Can view Automation task execution',4,'view_automationexecution'),(112,'Can add Asset automation task',8,'add_assetbaseautomation'),(113,'Can change Asset automation task',8,'change_assetbaseautomation'),(114,'Can delete Asset automation task',8,'delete_assetbaseautomation'),(115,'Can view Asset automation task',8,'view_assetbaseautomation'),(116,'Can add Gather asset facts',36,'add_gatherfactsautomation'),(117,'Can change Gather asset facts',36,'change_gatherfactsautomation'),(118,'Can delete Gather asset facts',36,'delete_gatherfactsautomation'),(119,'Can view Gather asset facts',36,'view_gatherfactsautomation'),(120,'Can add Ping asset',37,'add_pingautomation'),(121,'Can change Ping asset',37,'change_pingautomation'),(122,'Can delete Ping asset',37,'delete_pingautomation'),(123,'Can view Ping asset',37,'view_pingautomation'),(124,'Can add Custom asset',38,'add_custom'),(125,'Can change Custom asset',38,'change_custom'),(126,'Can delete Custom asset',38,'delete_custom'),(127,'Can view Custom asset',38,'view_custom'),(128,'Can add Web',39,'add_gpt'),(129,'Can change Web',39,'change_gpt'),(130,'Can delete Web',39,'delete_gpt'),(131,'Can view Web',39,'view_gpt'),(132,'Can add Account',40,'add_account'),(133,'Can change Account',40,'change_account'),(134,'Can delete Account',40,'delete_account'),(135,'Can view Account',40,'view_account'),(136,'Can view asset account secret',40,'view_accountsecret'),(137,'Can view asset history account',40,'view_historyaccount'),(138,'Can view asset history account secret',40,'view_historyaccountsecret'),(139,'Can verify account',40,'verify_account'),(140,'Can push account',40,'push_account'),(141,'Can remove account',40,'remove_account'),(142,'Can add historical Account',41,'add_historicalaccount'),(143,'Can change historical Account',41,'change_historicalaccount'),(144,'Can delete historical Account',41,'delete_historicalaccount'),(145,'Can view historical Account',41,'view_historicalaccount'),(146,'Can add Account template',42,'add_accounttemplate'),(147,'Can change Account template',42,'change_accounttemplate'),(148,'Can delete Account template',42,'delete_accounttemplate'),(149,'Can view Account template',42,'view_accounttemplate'),(150,'Can view asset account template secret',42,'view_accounttemplatesecret'),(151,'Can change asset account template secret',42,'change_accounttemplatesecret'),(152,'Can add Account backup plan',43,'add_accountbackupautomation'),(153,'Can change Account backup plan',43,'change_accountbackupautomation'),(154,'Can delete Account backup plan',43,'delete_accountbackupautomation'),(155,'Can view Account backup plan',43,'view_accountbackupautomation'),(156,'Can add Account automation task',3,'add_accountbaseautomation'),(157,'Can change Account automation task',3,'change_accountbaseautomation'),(158,'Can delete Account automation task',3,'delete_accountbaseautomation'),(159,'Can view Account automation task',3,'view_accountbaseautomation'),(160,'Can add Automation execution',5,'add_automationexecution'),(161,'Can change Automation execution',5,'change_automationexecution'),(162,'Can delete Automation execution',5,'delete_automationexecution'),(163,'Can view Automation execution',5,'view_automationexecution'),(164,'Can view change secret execution',5,'view_changesecretexecution'),(165,'Can add change secret execution',5,'add_changesecretexecution'),(166,'Can view gather accounts execution',5,'view_gatheraccountsexecution'),(167,'Can add gather accounts execution',5,'add_gatheraccountsexecution'),(168,'Can view push account execution',5,'view_pushaccountexecution'),(169,'Can add push account execution',5,'add_pushaccountexecution'),(170,'Can add Push asset account',44,'add_pushaccountautomation'),(171,'Can change Push asset account',44,'change_pushaccountautomation'),(172,'Can delete Push asset account',44,'delete_pushaccountautomation'),(173,'Can view Push asset account',44,'view_pushaccountautomation'),(174,'Can add Gather asset accounts',45,'add_gatheraccountsautomation'),(175,'Can change Gather asset accounts',45,'change_gatheraccountsautomation'),(176,'Can delete Gather asset accounts',45,'delete_gatheraccountsautomation'),(177,'Can view Gather asset accounts',45,'view_gatheraccountsautomation'),(178,'Can add Verify asset account',46,'add_verifyaccountautomation'),(179,'Can change Verify asset account',46,'change_verifyaccountautomation'),(180,'Can delete Verify asset account',46,'delete_verifyaccountautomation'),(181,'Can view Verify asset account',46,'view_verifyaccountautomation'),(182,'Can add Change secret record',47,'add_changesecretrecord'),(183,'Can change Change secret record',47,'change_changesecretrecord'),(184,'Can delete Change secret record',47,'delete_changesecretrecord'),(185,'Can view Change secret record',47,'view_changesecretrecord'),(186,'Can add Account backup execution',48,'add_accountbackupexecution'),(187,'Can change Account backup execution',48,'change_accountbackupexecution'),(188,'Can delete Account backup execution',48,'delete_accountbackupexecution'),(189,'Can view Account backup execution',48,'view_accountbackupexecution'),(190,'Can add Change secret automation',49,'add_changesecretautomation'),(191,'Can change Change secret automation',49,'change_changesecretautomation'),(192,'Can delete Change secret automation',49,'delete_changesecretautomation'),(193,'Can view Change secret automation',49,'view_changesecretautomation'),(194,'Can add Gather account automation',50,'add_gatheredaccount'),(195,'Can change Gather account automation',50,'change_gatheredaccount'),(196,'Can delete Gather account automation',50,'delete_gatheredaccount'),(197,'Can view Gather account automation',50,'view_gatheredaccount'),(198,'Can add virtual account',51,'add_virtualaccount'),(199,'Can change virtual account',51,'change_virtualaccount'),(200,'Can delete virtual account',51,'delete_virtualaccount'),(201,'Can view virtual account',51,'view_virtualaccount'),(272,'Can add Asset permission',52,'add_assetpermission'),(273,'Can change Asset permission',52,'change_assetpermission'),(274,'Can delete Asset permission',52,'delete_assetpermission'),(275,'Can view Asset permission',52,'view_assetpermission'),(276,'Can add user asset granted tree node relation',53,'add_userassetgrantedtreenoderelation'),(277,'Can change user asset granted tree node relation',53,'change_userassetgrantedtreenoderelation'),(278,'Can delete user asset granted tree node relation',53,'delete_userassetgrantedtreenoderelation'),(279,'Can view user asset granted tree node relation',53,'view_userassetgrantedtreenoderelation'),(280,'Can add perm node',13,'add_permnode'),(281,'Can change perm node',13,'change_permnode'),(282,'Can delete perm node',13,'delete_permnode'),(283,'Can view perm node',13,'view_permnode'),(284,'Can add Permed asset',14,'add_permedasset'),(285,'Can change Permed asset',14,'change_permedasset'),(286,'Can delete Permed asset',14,'delete_permedasset'),(287,'Can view Permed asset',14,'view_permedasset'),(288,'Can view my assets',14,'view_myassets'),(289,'Can view user assets',14,'view_userassets'),(290,'Can view usergroup assets',14,'view_usergroupassets'),(291,'Can add Permed account',54,'add_permedaccount'),(292,'Can change Permed account',54,'change_permedaccount'),(293,'Can delete Permed account',54,'delete_permedaccount'),(294,'Can view Permed account',54,'view_permedaccount'),(295,'Can add Celery Task',55,'add_celerytask'),(296,'Can change Celery Task',55,'change_celerytask'),(297,'Can delete Celery Task',55,'delete_celerytask'),(298,'Can view Celery Task',55,'view_celerytask'),(299,'Can view task monitor',55,'view_taskmonitor'),(300,'Can add Celery Task Execution',56,'add_celerytaskexecution'),(301,'Can change Celery Task Execution',56,'change_celerytaskexecution'),(302,'Can delete Celery Task Execution',56,'delete_celerytaskexecution'),(303,'Can view Celery Task Execution',56,'view_celerytaskexecution'),(304,'Can add Job',57,'add_job'),(305,'Can change Job',57,'change_job'),(306,'Can delete Job',57,'delete_job'),(307,'Can view Job',57,'view_job'),(308,'Can add playbook',58,'add_playbook'),(309,'Can change playbook',58,'change_playbook'),(310,'Can delete playbook',58,'delete_playbook'),(311,'Can view playbook',58,'view_playbook'),(312,'Can add Job Execution',9,'add_jobexecution'),(313,'Can change Job Execution',9,'change_jobexecution'),(314,'Can delete Job Execution',9,'delete_jobexecution'),(315,'Can view Job Execution',9,'view_jobexecution'),(316,'Can add historical Job',59,'add_historicaljob'),(317,'Can change historical Job',59,'change_historicaljob'),(318,'Can delete historical Job',59,'delete_historicaljob'),(319,'Can view historical Job',59,'view_historicaljob'),(320,'Can add Adhoc',60,'add_adhoc'),(321,'Can change Adhoc',60,'change_adhoc'),(322,'Can delete Adhoc',60,'delete_adhoc'),(323,'Can view Adhoc',60,'view_adhoc'),(324,'Can add System setting',61,'add_setting'),(325,'Can change System setting',61,'change_setting'),(326,'Can delete System setting',61,'delete_setting'),(327,'Can view System setting',61,'view_setting'),(328,'Can change email setting',61,'change_email'),(329,'Can change auth setting',61,'change_auth'),(330,'Can change auth ops',61,'change_ops'),(331,'Can change auth ticket',61,'change_ticket'),(332,'Can change virtual app setting',61,'change_virtualapp'),(333,'Can change auth announcement',61,'change_announcement'),(334,'Can change vault setting',61,'change_vault'),(335,'Can change chat ai setting',61,'change_chatai'),(336,'Can change system msg sub setting',61,'change_systemmsgsubscription'),(337,'Can change sms setting',61,'change_sms'),(338,'Can change security setting',61,'change_security'),(339,'Can change clean setting',61,'change_clean'),(340,'Can change interface setting',61,'change_interface'),(341,'Can change license setting',61,'change_license'),(342,'Can change terminal setting',61,'change_terminal'),(343,'Can change other setting',61,'change_other'),(344,'Can add Chat prompt',62,'add_chatprompt'),(345,'Can change Chat prompt',62,'change_chatprompt'),(346,'Can delete Chat prompt',62,'delete_chatprompt'),(347,'Can view Chat prompt',62,'view_chatprompt'),(348,'Can add Command record',63,'add_command'),(349,'Can change Command record',63,'change_command'),(350,'Can delete Command record',63,'delete_command'),(351,'Can view Command record',63,'view_command'),(352,'Can add Session record',64,'add_session'),(353,'Can change Session record',64,'change_session'),(354,'Can delete Session record',64,'delete_session'),(355,'Can view Session record',64,'view_session'),(356,'Can monitor session',64,'monitor_session'),(357,'Can share session',64,'share_session'),(358,'Can terminate session',64,'terminate_session'),(359,'Can validate session action perm',64,'validate_sessionactionperm'),(360,'Can add Status',65,'add_status'),(361,'Can change Status',65,'change_status'),(362,'Can delete Status',65,'delete_status'),(363,'Can view Status',65,'view_status'),(364,'Can add Task',66,'add_task'),(365,'Can change Task',66,'change_task'),(366,'Can delete Task',66,'delete_task'),(367,'Can view Task',66,'view_task'),(368,'Can add Terminal',67,'add_terminal'),(369,'Can change Terminal',67,'change_terminal'),(370,'Can delete Terminal',67,'delete_terminal'),(371,'Can view Terminal',67,'view_terminal'),(372,'Can view terminal config',67,'view_terminalconfig'),(373,'Can add Command storage',68,'add_commandstorage'),(374,'Can change Command storage',68,'change_commandstorage'),(375,'Can delete Command storage',68,'delete_commandstorage'),(376,'Can view Command storage',68,'view_commandstorage'),(377,'Can add Replay storage',69,'add_replaystorage'),(378,'Can change Replay storage',69,'change_replaystorage'),(379,'Can delete Replay storage',69,'delete_replaystorage'),(380,'Can view Replay storage',69,'view_replaystorage'),(381,'Can add Session sharing',70,'add_sessionsharing'),(382,'Can change Session sharing',70,'change_sessionsharing'),(383,'Can delete Session sharing',70,'delete_sessionsharing'),(384,'Can view Session sharing',70,'view_sessionsharing'),(385,'Can add super session sharing',70,'add_supersessionsharing'),(386,'Can add Session join record',71,'add_sessionjoinrecord'),(387,'Can change Session join record',71,'change_sessionjoinrecord'),(388,'Can delete Session join record',71,'delete_sessionjoinrecord'),(389,'Can view Session join record',71,'view_sessionjoinrecord'),(390,'Can add Session replay',72,'add_sessionreplay'),(391,'Can change Session replay',72,'change_sessionreplay'),(392,'Can delete Session replay',72,'delete_sessionreplay'),(393,'Can view Session replay',72,'view_sessionreplay'),(394,'Can upload session replay',72,'upload_sessionreplay'),(395,'Can download session replay',72,'download_sessionreplay'),(396,'Can add Endpoint',73,'add_endpoint'),(397,'Can change Endpoint',73,'change_endpoint'),(398,'Can delete Endpoint',73,'delete_endpoint'),(399,'Can view Endpoint',73,'view_endpoint'),(400,'Can add Endpoint rule',74,'add_endpointrule'),(401,'Can change Endpoint rule',74,'change_endpointrule'),(402,'Can delete Endpoint rule',74,'delete_endpointrule'),(403,'Can view Endpoint rule',74,'view_endpointrule'),(404,'Can add Applet',75,'add_applet'),(405,'Can change Applet',75,'change_applet'),(406,'Can delete Applet',75,'delete_applet'),(407,'Can view Applet',75,'view_applet'),(408,'Can add Hosting',76,'add_applethost'),(409,'Can change Hosting',76,'change_applethost'),(410,'Can delete Hosting',76,'delete_applethost'),(411,'Can view Hosting',76,'view_applethost'),(412,'Can add applet publication',77,'add_appletpublication'),(413,'Can change applet publication',77,'change_appletpublication'),(414,'Can delete applet publication',77,'delete_appletpublication'),(415,'Can view applet publication',77,'view_appletpublication'),(416,'Can add applet host deployment',78,'add_applethostdeployment'),(417,'Can change applet host deployment',78,'change_applethostdeployment'),(418,'Can delete applet host deployment',78,'delete_applethostdeployment'),(419,'Can view applet host deployment',78,'view_applethostdeployment'),(420,'Can add app provider',79,'add_appprovider'),(421,'Can change app provider',79,'change_appprovider'),(422,'Can delete app provider',79,'delete_appprovider'),(423,'Can view app provider',79,'view_appprovider'),(424,'Can add Virtual app',80,'add_virtualapp'),(425,'Can change Virtual app',80,'change_virtualapp'),(426,'Can delete Virtual app',80,'delete_virtualapp'),(427,'Can view Virtual app',80,'view_virtualapp'),(428,'Can add Virtual app publication',81,'add_virtualapppublication'),(429,'Can change Virtual app publication',81,'change_virtualapppublication'),(430,'Can delete Virtual app publication',81,'delete_virtualapppublication'),(431,'Can view Virtual app publication',81,'view_virtualapppublication'),(432,'Can add File transfer log',82,'add_ftplog'),(433,'Can change File transfer log',82,'change_ftplog'),(434,'Can delete File transfer log',82,'delete_ftplog'),(435,'Can view File transfer log',82,'view_ftplog'),(436,'Can add Operate log',83,'add_operatelog'),(437,'Can change Operate log',83,'change_operatelog'),(438,'Can delete Operate log',83,'delete_operatelog'),(439,'Can view Operate log',83,'view_operatelog'),(440,'Can add Password change log',84,'add_passwordchangelog'),(441,'Can change Password change log',84,'change_passwordchangelog'),(442,'Can delete Password change log',84,'delete_passwordchangelog'),(443,'Can view Password change log',84,'view_passwordchangelog'),(444,'Can add User login log',85,'add_userloginlog'),(445,'Can change User login log',85,'change_userloginlog'),(446,'Can delete User login log',85,'delete_userloginlog'),(447,'Can view User login log',85,'view_userloginlog'),(448,'Can add Activity log',86,'add_activitylog'),(449,'Can change Activity log',86,'change_activitylog'),(450,'Can delete Activity log',86,'delete_activitylog'),(451,'Can view Activity log',86,'view_activitylog'),(452,'Can add Job audit log',10,'add_joblog'),(453,'Can change Job audit log',10,'change_joblog'),(454,'Can delete Job audit log',10,'delete_joblog'),(455,'Can view Job audit log',10,'view_joblog'),(456,'Can add User session',87,'add_usersession'),(457,'Can change User session',87,'change_usersession'),(458,'Can delete User session',87,'delete_usersession'),(459,'Can view User session',87,'view_usersession'),(460,'Offline user session',87,'offline_usersession'),(461,'Can add Access key',88,'add_accesskey'),(462,'Can change Access key',88,'change_accesskey'),(463,'Can delete Access key',88,'delete_accesskey'),(464,'Can view Access key',88,'view_accesskey'),(465,'Can add Private Token',89,'add_privatetoken'),(466,'Can change Private Token',89,'change_privatetoken'),(467,'Can delete Private Token',89,'delete_privatetoken'),(468,'Can view Private Token',89,'view_privatetoken'),(469,'Can add SSO token',90,'add_ssotoken'),(470,'Can change SSO token',90,'change_ssotoken'),(471,'Can delete SSO token',90,'delete_ssotoken'),(472,'Can view SSO token',90,'view_ssotoken'),(473,'Can add Connection token',91,'add_connectiontoken'),(474,'Can change Connection token',91,'change_connectiontoken'),(475,'Can delete Connection token',91,'delete_connectiontoken'),(476,'Can view Connection token',91,'view_connectiontoken'),(477,'Can expire connection token',91,'expire_connectiontoken'),(478,'Can reuse connection token',91,'reuse_connectiontoken'),(479,'Can add Super connection token',92,'add_superconnectiontoken'),(480,'Can change Super connection token',92,'change_superconnectiontoken'),(481,'Can delete Super connection token',92,'delete_superconnectiontoken'),(482,'Can view Super connection token',92,'view_superconnectiontoken'),(483,'Can view super connection token secret',92,'view_superconnectiontokensecret'),(484,'Can add Temporary token',93,'add_temptoken'),(485,'Can change Temporary token',93,'change_temptoken'),(486,'Can delete Temporary token',93,'delete_temptoken'),(487,'Can view Temporary token',93,'view_temptoken'),(488,'Can add passkey',94,'add_passkey'),(489,'Can change passkey',94,'change_passkey'),(490,'Can delete passkey',94,'delete_passkey'),(491,'Can view passkey',94,'view_passkey'),(492,'Can add Application',95,'add_application'),(493,'Can change Application',95,'change_application'),(494,'Can delete Application',95,'delete_application'),(495,'Can view Application',95,'view_application'),(496,'Can match application',95,'match_application'),(497,'Can add Ticket',15,'add_ticket'),(498,'Can change Ticket',15,'change_ticket'),(499,'Can delete Ticket',15,'delete_ticket'),(500,'Can view Ticket',15,'view_ticket'),(501,'Can add Comment',96,'add_comment'),(502,'Can change Comment',96,'change_comment'),(503,'Can delete Comment',96,'delete_comment'),(504,'Can view Comment',96,'view_comment'),(505,'Can add Ticket flow approval rule',97,'add_approvalrule'),(506,'Can change Ticket flow approval rule',97,'change_approvalrule'),(507,'Can delete Ticket flow approval rule',97,'delete_approvalrule'),(508,'Can view Ticket flow approval rule',97,'view_approvalrule'),(509,'Can add Ticket step',98,'add_ticketstep'),(510,'Can change Ticket step',98,'change_ticketstep'),(511,'Can delete Ticket step',98,'delete_ticketstep'),(512,'Can view Ticket step',98,'view_ticketstep'),(513,'Can add Ticket flow',99,'add_ticketflow'),(514,'Can change Ticket flow',99,'change_ticketflow'),(515,'Can delete Ticket flow',99,'delete_ticketflow'),(516,'Can view Ticket flow',99,'view_ticketflow'),(517,'Can add Ticket assignee',100,'add_ticketassignee'),(518,'Can change Ticket assignee',100,'change_ticketassignee'),(519,'Can delete Ticket assignee',100,'delete_ticketassignee'),(520,'Can view Ticket assignee',100,'view_ticketassignee'),(521,'Can add Ticket session relation',101,'add_ticketsession'),(522,'Can change Ticket session relation',101,'change_ticketsession'),(523,'Can delete Ticket session relation',101,'delete_ticketsession'),(524,'Can view Ticket session relation',101,'view_ticketsession'),(525,'Can add Super ticket',16,'add_superticket'),(526,'Can change Super ticket',16,'change_superticket'),(527,'Can delete Super ticket',16,'delete_superticket'),(528,'Can view Super ticket',16,'view_superticket'),(529,'Can add Apply Login Ticket',102,'add_applyloginticket'),(530,'Can change Apply Login Ticket',102,'change_applyloginticket'),(531,'Can delete Apply Login Ticket',102,'delete_applyloginticket'),(532,'Can view Apply Login Ticket',102,'view_applyloginticket'),(533,'Can add Apply Login Asset Ticket',103,'add_applyloginassetticket'),(534,'Can change Apply Login Asset Ticket',103,'change_applyloginassetticket'),(535,'Can delete Apply Login Asset Ticket',103,'delete_applyloginassetticket'),(536,'Can view Apply Login Asset Ticket',103,'view_applyloginassetticket'),(537,'Can add Apply Command Ticket',104,'add_applycommandticket'),(538,'Can change Apply Command Ticket',104,'change_applycommandticket'),(539,'Can delete Apply Command Ticket',104,'delete_applycommandticket'),(540,'Can view Apply Command Ticket',104,'view_applycommandticket'),(541,'Can add Apply Asset Ticket',105,'add_applyassetticket'),(542,'Can change Apply Asset Ticket',105,'change_applyassetticket'),(543,'Can delete Apply Asset Ticket',105,'delete_applyassetticket'),(544,'Can view Apply Asset Ticket',105,'view_applyassetticket'),(545,'Can add Login acl',106,'add_loginacl'),(546,'Can change Login acl',106,'change_loginacl'),(547,'Can delete Login acl',106,'delete_loginacl'),(548,'Can view Login acl',106,'view_loginacl'),(549,'Can add Login asset acl',107,'add_loginassetacl'),(550,'Can change Login asset acl',107,'change_loginassetacl'),(551,'Can delete Login asset acl',107,'delete_loginassetacl'),(552,'Can view Login asset acl',107,'view_loginassetacl'),(553,'Can add Command group',108,'add_commandgroup'),(554,'Can change Command group',108,'change_commandgroup'),(555,'Can delete Command group',108,'delete_commandgroup'),(556,'Can view Command group',108,'view_commandgroup'),(557,'Can add Command acl',109,'add_commandfilteracl'),(558,'Can change Command acl',109,'change_commandfilteracl'),(559,'Can delete Command acl',109,'delete_commandfilteracl'),(560,'Can view Command acl',109,'view_commandfilteracl'),(561,'Can add Connect method acl',110,'add_connectmethodacl'),(562,'Can change Connect method acl',110,'change_connectmethodacl'),(563,'Can delete Connect method acl',110,'delete_connectmethodacl'),(564,'Can view Connect method acl',110,'view_connectmethodacl'),(565,'Can add User message',111,'add_usermsgsubscription'),(566,'Can change User message',111,'change_usermsgsubscription'),(567,'Can delete User message',111,'delete_usermsgsubscription'),(568,'Can view User message',111,'view_usermsgsubscription'),(569,'Can add System message',112,'add_systemmsgsubscription'),(570,'Can change System message',112,'change_systemmsgsubscription'),(571,'Can delete System message',112,'delete_systemmsgsubscription'),(572,'Can view System message',112,'view_systemmsgsubscription'),(573,'Can add message content',113,'add_messagecontent'),(574,'Can change message content',113,'change_messagecontent'),(575,'Can delete message content',113,'delete_messagecontent'),(576,'Can view message content',113,'view_messagecontent'),(577,'Can add site message',114,'add_sitemessage'),(578,'Can change site message',114,'change_sitemessage'),(579,'Can delete site message',114,'delete_sitemessage'),(580,'Can view site message',114,'view_sitemessage'),(581,'Can view console view',115,'view_console'),(582,'Can view audit view',115,'view_audit'),(583,'Can view workbench view',115,'view_workbench'),(584,'Can view web terminal',115,'view_webterminal'),(585,'Can view file manager',115,'view_filemanager'),(586,'Can view System Tools',115,'view_systemtools'),(587,'Can add Role',116,'add_role'),(588,'Can change Role',116,'change_role'),(589,'Can delete Role',116,'delete_role'),(590,'Can view Role',116,'view_role'),(591,'Can add content type',117,'add_contenttype'),(592,'Can change content type',117,'change_contenttype'),(593,'Can delete content type',117,'delete_contenttype'),(594,'Can view content type',117,'view_contenttype'),(595,'Can add Permissions',118,'add_permission'),(596,'Can change Permissions',118,'change_permission'),(597,'Can delete Permissions',118,'delete_permission'),(598,'Can view Permissions',118,'view_permission'),(599,'Can add Role binding',119,'add_rolebinding'),(600,'Can change Role binding',119,'change_rolebinding'),(601,'Can delete Role binding',119,'delete_rolebinding'),(602,'Can view Role binding',119,'view_rolebinding'),(603,'Can add Organization role binding',120,'add_orgrolebinding'),(604,'Can change Organization role binding',120,'change_orgrolebinding'),(605,'Can delete Organization role binding',120,'delete_orgrolebinding'),(606,'Can view Organization role binding',120,'view_orgrolebinding'),(607,'Can add System role binding',121,'add_systemrolebinding'),(608,'Can change System role binding',121,'change_systemrolebinding'),(609,'Can delete System role binding',121,'delete_systemrolebinding'),(610,'Can view System role binding',121,'view_systemrolebinding'),(611,'Can add Organization role',122,'add_orgrole'),(612,'Can change Organization role',122,'change_orgrole'),(613,'Can delete Organization role',122,'delete_orgrole'),(614,'Can view Organization role',122,'view_orgrole'),(615,'Can add System role',123,'add_systemrole'),(616,'Can change System role',123,'change_systemrole'),(617,'Can delete System role',123,'delete_systemrole'),(618,'Can view System role',123,'view_systemrole'),(619,'Can add Label',124,'add_label'),(620,'Can change Label',124,'change_label'),(621,'Can delete Label',124,'delete_label'),(622,'Can view Label',124,'view_label'),(623,'Can add Labeled resource',125,'add_labeledresource'),(624,'Can change Labeled resource',125,'change_labeledresource'),(625,'Can delete Labeled resource',125,'delete_labeledresource'),(626,'Can view Labeled resource',125,'view_labeledresource'),(627,'Can add proxy granting ticket',126,'add_proxygrantingticket'),(628,'Can change proxy granting ticket',126,'change_proxygrantingticket'),(629,'Can delete proxy granting ticket',126,'delete_proxygrantingticket'),(630,'Can view proxy granting ticket',126,'view_proxygrantingticket'),(631,'Can add session ticket',127,'add_sessionticket'),(632,'Can change session ticket',127,'change_sessionticket'),(633,'Can delete session ticket',127,'delete_sessionticket'),(634,'Can view session ticket',127,'view_sessionticket'),(635,'Can add captcha store',128,'add_captchastore'),(636,'Can change captcha store',128,'change_captchastore'),(637,'Can delete captcha store',128,'delete_captchastore'),(638,'Can view captcha store',128,'view_captchastore'),(639,'Can add crontab',129,'add_crontabschedule'),(640,'Can change crontab',129,'change_crontabschedule'),(641,'Can delete crontab',129,'delete_crontabschedule'),(642,'Can view crontab',129,'view_crontabschedule'),(643,'Can add interval',130,'add_intervalschedule'),(644,'Can change interval',130,'change_intervalschedule'),(645,'Can delete interval',130,'delete_intervalschedule'),(646,'Can view interval',130,'view_intervalschedule'),(647,'Can add periodic task',131,'add_periodictask'),(648,'Can change periodic task',131,'change_periodictask'),(649,'Can delete periodic task',131,'delete_periodictask'),(650,'Can view periodic task',131,'view_periodictask'),(651,'Can add periodic tasks',132,'add_periodictasks'),(652,'Can change periodic tasks',132,'change_periodictasks'),(653,'Can delete periodic tasks',132,'delete_periodictasks'),(654,'Can view periodic tasks',132,'view_periodictasks'),(655,'Can add solar event',133,'add_solarschedule'),(656,'Can change solar event',133,'change_solarschedule'),(657,'Can delete solar event',133,'delete_solarschedule'),(658,'Can view solar event',133,'view_solarschedule'),(659,'Can add clocked',134,'add_clockedschedule'),(660,'Can change clocked',134,'change_clockedschedule'),(661,'Can delete clocked',134,'delete_clockedschedule'),(662,'Can view clocked',134,'view_clockedschedule'),(663,'Can add permission',135,'add_permission'),(664,'Can change permission',135,'change_permission'),(665,'Can delete permission',135,'delete_permission'),(666,'Can view permission',135,'view_permission'),(667,'Can add group',136,'add_group'),(668,'Can change group',136,'change_group'),(669,'Can delete group',136,'delete_group'),(670,'Can view group',136,'view_group'),(671,'Can add log entry',137,'add_logentry'),(672,'Can change log entry',137,'change_logentry'),(673,'Can delete log entry',137,'delete_logentry'),(674,'Can view log entry',137,'view_logentry'),(675,'Can add content type',138,'add_contenttype'),(676,'Can change content type',138,'change_contenttype'),(677,'Can delete content type',138,'delete_contenttype'),(678,'Can view content type',138,'view_contenttype'),(679,'Can add session',139,'add_session'),(680,'Can change session',139,'change_session'),(681,'Can delete session',139,'delete_session'),(682,'Can view session',139,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_accesskey`
--

DROP TABLE IF EXISTS `authentication_accesskey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_accesskey` (
  `id` char(32) NOT NULL,
  `secret` varchar(36) NOT NULL,
  `user_id` char(32) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_last_used` datetime(6) DEFAULT NULL,
  `ip_group` json NOT NULL DEFAULT (_utf8mb3'["*"]'),
  PRIMARY KEY (`id`),
  KEY `users_accesskey_user_id_d1fb7a71_fk_users_user_id` (`user_id`),
  CONSTRAINT `users_accesskey_user_id_d1fb7a71_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_accesskey`
--

LOCK TABLES `authentication_accesskey` WRITE;
/*!40000 ALTER TABLE `authentication_accesskey` DISABLE KEYS */;
INSERT INTO `authentication_accesskey` VALUES ('00554a3051944bf0b33c93479966d38e','I7ZP5fhJrxRWZVS5L2mwKysQ36Jvc3KmNQ0Q','fd79e57a44ae4f019f1d5f73aa6c03f9','2024-05-03 19:43:34.124694',1,'2024-05-03 19:47:15.556280','[\"*\"]'),('166c11b463484684ad2b2a926c987e91','2h5TwpzLUYN5bQ7cuE52BpV6vy67u5gYTak0','12c404846ff5448bb4ca29c022bad500','2024-05-03 19:43:40.780686',1,NULL,'[\"*\"]'),('1c0b95851e564933afa9686e9ac2108b','84iLXXQGtaSJI2YIZtgEJ0DRVmcAzqnGzwAj','84efa71cc3204088829b796ccbf1811f','2024-05-03 19:43:35.560029',1,'2024-05-03 19:44:35.720922','[\"*\"]'),('23834215755f49e69abe40681c3837b1','PUtJkJKQ0CSaCi0zXyhdTNVyQXbRtbD1z1O4','c6d99c23718548708613d8eefb3b12d8','2024-05-03 19:43:34.390412',1,'2024-05-03 19:45:45.557984','[\"*\"]'),('2f4630d264fc4be4adf17dbbf775e102','PZioQCc8ZaErrgYsKqEtZZOJmk2lbjxHdFxn','a2db1ceb33c24ff6ab33fd5d681a3794','2024-05-03 19:43:31.017082',1,NULL,'[\"*\"]'),('55f54753640846b39327a863afa857d4','mUJ6cNlwG305XD7LlFoFiXOCXWF9mGfOjj5n','1e597c6f1ce84818b3986aaef1e8f8c4','2024-05-03 19:42:50.065058',1,NULL,'[\"*\"]'),('6fdfebd57b9f40a0937e9f8c79c82e2a','M076t0sHSb3x9MqdZtmHEjOgICdnuxDOFUIB','a032aa0e42dd4a5aa6d162cb4a9aec87','2024-05-03 19:35:51.670270',1,NULL,'[\"*\"]'),('8200d481532a48de8abf0e3af944eafe','oDrR0istRqhmPsPhQlg1gMC6D9ojie5aNm4U','4cc1b8c528b248d2944931d3f8a9e467','2024-05-03 19:43:34.381576',1,'2024-05-03 19:47:15.586618','[\"*\"]'),('c07ab21b11934390af63c46a726a7cbe','GvZaOILfB3P36vILpHyHSCHFMrqoBBrVE8Pg','0b5880bfd1c24e9e81d0e9c01a95f8f3','2024-05-03 19:43:34.168992',1,'2024-05-03 19:47:15.556280','[\"*\"]'),('e17c38e6d76e4dcda92de90422d14ced','0HgGzBPXN4dCFnBNPdHKxM7renSm7gPy5bqo','a4b1119db81148cbadbe43ddbaa6318e','2024-05-03 19:40:35.534521',1,NULL,'[\"*\"]');
/*!40000 ALTER TABLE `authentication_accesskey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_connectiontoken`
--

DROP TABLE IF EXISTS `authentication_connectiontoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_connectiontoken` (
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `asset_id` char(32) DEFAULT NULL,
  `asset_display` varchar(128) NOT NULL,
  `date_expired` datetime(6) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `value` varchar(64) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `user_display` varchar(128) NOT NULL,
  `account` varchar(128) NOT NULL,
  `protocol` varchar(16) NOT NULL,
  `input_username` varchar(128) NOT NULL,
  `input_secret` longtext NOT NULL,
  `connect_method` varchar(32) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `from_ticket_id` char(32) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_reusable` tinyint(1) NOT NULL,
  `connect_options` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_ticket_id` (`from_ticket_id`),
  KEY `authentication_conne_asset_id_8dad7e84_fk_assets_as` (`asset_id`),
  KEY `authentication_connectiontoken_user_id_08533d74_fk_users_user_id` (`user_id`),
  KEY `authentication_connectiontoken_org_id_ad630aa2` (`org_id`),
  CONSTRAINT `authentication_conne_asset_id_8dad7e84_fk_assets_as` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`),
  CONSTRAINT `authentication_conne_from_ticket_id_10462d91_fk_tickets_a` FOREIGN KEY (`from_ticket_id`) REFERENCES `tickets_applyloginassetticket` (`ticket_ptr_id`),
  CONSTRAINT `authentication_connectiontoken_user_id_08533d74_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_connectiontoken`
--

LOCK TABLES `authentication_connectiontoken` WRITE;
/*!40000 ALTER TABLE `authentication_connectiontoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_connectiontoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_passkey`
--

DROP TABLE IF EXISTS `authentication_passkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_passkey` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `id` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `added_on` datetime(6) NOT NULL,
  `date_last_used` datetime(6) DEFAULT NULL,
  `credential_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credential_id` (`credential_id`),
  KEY `authentication_passkey_user_id_eea4b831_fk_users_user_id` (`user_id`),
  CONSTRAINT `authentication_passkey_user_id_eea4b831_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_passkey`
--

LOCK TABLES `authentication_passkey` WRITE;
/*!40000 ALTER TABLE `authentication_passkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_passkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_privatetoken`
--

DROP TABLE IF EXISTS `authentication_privatetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_privatetoken` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` char(32) NOT NULL,
  `date_last_used` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_privatetoken_user_id_b42fd08b_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_privatetoken`
--

LOCK TABLES `authentication_privatetoken` WRITE;
/*!40000 ALTER TABLE `authentication_privatetoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_privatetoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_ssotoken`
--

DROP TABLE IF EXISTS `authentication_ssotoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_ssotoken` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `authkey` char(32) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` char(32) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`authkey`),
  KEY `authentication_ssotoken_user_id_eda7c917` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_ssotoken`
--

LOCK TABLES `authentication_ssotoken` WRITE;
/*!40000 ALTER TABLE `authentication_ssotoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_ssotoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_temptoken`
--

DROP TABLE IF EXISTS `authentication_temptoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_temptoken` (
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `username` varchar(128) NOT NULL,
  `secret` varchar(64) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `date_verified` datetime(6) DEFAULT NULL,
  `date_expired` datetime(6) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_temptoken`
--

LOCK TABLES `authentication_temptoken` WRITE;
/*!40000 ALTER TABLE `authentication_temptoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_temptoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captcha_captchastore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_cas_ng_proxygrantingticket`
--

DROP TABLE IF EXISTS `django_cas_ng_proxygrantingticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_cas_ng_proxygrantingticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_key` varchar(736) DEFAULT NULL,
  `pgtiou` varchar(255) DEFAULT NULL,
  `pgt` varchar(255) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_cas_ng_proxygrant_session_key_user_id_4cd2ea19_uniq` (`session_key`,`user_id`),
  KEY `django_cas_ng_proxyg_user_id_f833edd2_fk_users_use` (`user_id`),
  CONSTRAINT `django_cas_ng_proxyg_user_id_f833edd2_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_cas_ng_proxygrantingticket`
--

LOCK TABLES `django_cas_ng_proxygrantingticket` WRITE;
/*!40000 ALTER TABLE `django_cas_ng_proxygrantingticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_cas_ng_proxygrantingticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_cas_ng_sessionticket`
--

DROP TABLE IF EXISTS `django_cas_ng_sessionticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_cas_ng_sessionticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_key` varchar(736) NOT NULL,
  `ticket` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_cas_ng_sessionticket`
--

LOCK TABLES `django_cas_ng_sessionticket` WRITE;
/*!40000 ALTER TABLE `django_cas_ng_sessionticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_cas_ng_sessionticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_clockedschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_clockedschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_clockedschedule`
--

LOCK TABLES `django_celery_beat_clockedschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_crontabschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_crontabschedule`
--

LOCK TABLES `django_celery_beat_crontabschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` DISABLE KEYS */;
INSERT INTO `django_celery_beat_crontabschedule` VALUES (1,'0','4','*','*','*','Asia/Shanghai'),(2,'0','14','*','*','*','Asia/Shanghai'),(3,'0','10','*','*','*','Asia/Shanghai'),(4,'0','2','*','*','*','Asia/Shanghai'),(5,'0','0','*','*','*','Asia/Shanghai');
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_intervalschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `every` int NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_intervalschedule`
--

LOCK TABLES `django_celery_beat_intervalschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` DISABLE KEYS */;
INSERT INTO `django_celery_beat_intervalschedule` VALUES (1,3600,'seconds'),(2,600,'seconds'),(3,86400,'seconds');
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictask`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int DEFAULT NULL,
  `interval_id` int DEFAULT NULL,
  `solar_id` int DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int unsigned DEFAULT NULL,
  `headers` longtext NOT NULL DEFAULT (_utf8mb3'{}'),
  `clocked_id` int DEFAULT NULL,
  `expire_seconds` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`),
  CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`),
  CONSTRAINT `django_celery_beat_periodictask_chk_1` CHECK ((`total_run_count` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_2` CHECK ((`priority` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_3` CHECK ((`expire_seconds` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictask`
--

LOCK TABLES `django_celery_beat_periodictask` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictask` DISABLE KEYS */;
INSERT INTO `django_celery_beat_periodictask` VALUES (1,'celery.backend_cleanup','celery.backend_cleanup','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2024-05-03 19:43:48.461027','',1,NULL,NULL,0,NULL,NULL,'{}',NULL,43200),(2,'check_password_expired_periodic','users.tasks.check_password_expired','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2024-05-03 19:43:48.749997','',3,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(3,'check_user_expired_periodic','users.tasks.check_user_expired','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2024-05-03 19:43:48.785481','',2,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(4,'assets.tasks.nodes_amount.check_node_assets_amount_period_task','assets.tasks.nodes_amount.check_node_assets_amount_period_task','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2024-05-03 19:43:48.814104','',4,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(5,'accounts.tasks.remove_account.clean_historical_accounts','accounts.tasks.remove_account.clean_historical_accounts','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2024-05-03 19:43:48.862497','',4,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(6,'users.signal_handlers.clean_expired_user_session_period','users.signal_handlers.clean_expired_user_session_period','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2024-05-03 19:43:48.890365','',4,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(7,'users.tasks.check_unused_users','users.tasks.check_unused_users','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2024-05-03 19:43:48.911757','',2,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(8,'perms.tasks.check_asset_permission_expired','perms.tasks.check_asset_permission_expired','[]','{}',NULL,NULL,NULL,NULL,1,'2024-05-03 19:43:48.948317',0,'2024-05-03 19:43:48.951059','',NULL,1,NULL,0,NULL,NULL,'{}',NULL,NULL),(9,'perms.tasks.check_asset_permission_will_expired','perms.tasks.check_asset_permission_will_expired','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2024-05-03 19:43:48.973396','',3,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(10,'ops.tasks.check_server_performance_period','ops.tasks.check_server_performance_period','[]','{}',NULL,NULL,NULL,NULL,1,'2024-05-03 19:43:48.994682',0,'2024-05-03 19:43:48.997709','',NULL,1,NULL,0,NULL,NULL,'{}',NULL,NULL),(11,'ops.tasks.clean_up_unexpected_jobs','ops.tasks.clean_up_unexpected_jobs','[]','{}',NULL,NULL,NULL,NULL,1,'2024-05-03 19:43:49.017121',0,'2024-05-03 19:43:49.020088','',NULL,1,NULL,0,NULL,NULL,'{}',NULL,NULL),(12,'ops.tasks.clean_job_execution_period','ops.tasks.clean_job_execution_period','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2024-05-03 19:43:49.045427','',4,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(13,'terminal.tasks.delete_terminal_status_period','terminal.tasks.delete_terminal_status_period','[]','{}',NULL,NULL,NULL,NULL,1,'2024-05-03 19:43:49.066791',0,'2024-05-03 19:43:49.069691','',NULL,1,NULL,0,NULL,NULL,'{}',NULL,NULL),(14,'terminal.tasks.clean_orphan_session','terminal.tasks.clean_orphan_session','[]','{}',NULL,NULL,NULL,NULL,1,'2024-05-03 19:43:49.110574',0,'2024-05-03 19:43:49.113425','',NULL,2,NULL,0,NULL,NULL,'{}',NULL,NULL),(15,'terminal.tasks.check_command_replay_storage_connectivity','terminal.tasks.check_command_replay_storage_connectivity','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2024-05-03 19:43:49.154284','',5,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(16,'audits.tasks.clean_audits_log_period','audits.tasks.clean_audits_log_period','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2024-05-03 19:43:49.180330','',4,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(17,'authentication.tasks.clean_django_sessions','authentication.tasks.clean_django_sessions','[]','{}',NULL,NULL,NULL,NULL,1,'2024-05-03 19:43:49.220170',0,'2024-05-03 19:43:49.223555','',NULL,3,NULL,0,NULL,NULL,'{}',NULL,NULL);
/*!40000 ALTER TABLE `django_celery_beat_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictasks`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictasks`
--

LOCK TABLES `django_celery_beat_periodictasks` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` DISABLE KEYS */;
INSERT INTO `django_celery_beat_periodictasks` VALUES (1,'2024-05-03 19:43:49.232407');
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_solarschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_solarschedule`
--

LOCK TABLES `django_celery_beat_solarschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (40,'accounts','account'),(43,'accounts','accountbackupautomation'),(48,'accounts','accountbackupexecution'),(3,'accounts','accountbaseautomation'),(42,'accounts','accounttemplate'),(5,'accounts','automationexecution'),(49,'accounts','changesecretautomation'),(47,'accounts','changesecretrecord'),(45,'accounts','gatheraccountsautomation'),(50,'accounts','gatheredaccount'),(41,'accounts','historicalaccount'),(44,'accounts','pushaccountautomation'),(46,'accounts','verifyaccountautomation'),(51,'accounts','virtualaccount'),(109,'acls','commandfilteracl'),(108,'acls','commandgroup'),(110,'acls','connectmethodacl'),(106,'acls','loginacl'),(107,'acls','loginassetacl'),(137,'admin','logentry'),(95,'applications','application'),(22,'assets','adminuser'),(1,'assets','asset'),(8,'assets','assetbaseautomation'),(23,'assets','assetgroup'),(4,'assets','automationexecution'),(2,'assets','baseautomation'),(31,'assets','cloud'),(38,'assets','custom'),(29,'assets','database'),(30,'assets','device'),(26,'assets','domain'),(27,'assets','favoriteasset'),(7,'assets','gateway'),(36,'assets','gatherfactsautomation'),(39,'assets','gpt'),(6,'assets','host'),(25,'assets','label'),(12,'assets','node'),(37,'assets','pingautomation'),(28,'assets','platform'),(34,'assets','platformautomation'),(33,'assets','platformprotocol'),(35,'assets','protocol'),(24,'assets','systemuser'),(32,'assets','web'),(86,'audits','activitylog'),(82,'audits','ftplog'),(10,'audits','joblog'),(83,'audits','operatelog'),(84,'audits','passwordchangelog'),(85,'audits','userloginlog'),(87,'audits','usersession'),(136,'auth','group'),(135,'auth','permission'),(88,'authentication','accesskey'),(91,'authentication','connectiontoken'),(94,'authentication','passkey'),(89,'authentication','privatetoken'),(90,'authentication','ssotoken'),(92,'authentication','superconnectiontoken'),(93,'authentication','temptoken'),(128,'captcha','captchastore'),(138,'contenttypes','contenttype'),(126,'django_cas_ng','proxygrantingticket'),(127,'django_cas_ng','sessionticket'),(134,'django_celery_beat','clockedschedule'),(129,'django_celery_beat','crontabschedule'),(130,'django_celery_beat','intervalschedule'),(131,'django_celery_beat','periodictask'),(132,'django_celery_beat','periodictasks'),(133,'django_celery_beat','solarschedule'),(124,'labels','label'),(125,'labels','labeledresource'),(113,'notifications','messagecontent'),(114,'notifications','sitemessage'),(112,'notifications','systemmsgsubscription'),(111,'notifications','usermsgsubscription'),(60,'ops','adhoc'),(55,'ops','celerytask'),(56,'ops','celerytaskexecution'),(59,'ops','historicaljob'),(57,'ops','job'),(11,'ops','jobauditlog'),(9,'ops','jobexecution'),(58,'ops','playbook'),(17,'orgs','organization'),(52,'perms','assetpermission'),(54,'perms','permedaccount'),(14,'perms','permedasset'),(13,'perms','permnode'),(53,'perms','userassetgrantedtreenoderelation'),(117,'rbac','contenttype'),(115,'rbac','menupermission'),(122,'rbac','orgrole'),(120,'rbac','orgrolebinding'),(118,'rbac','permission'),(116,'rbac','role'),(119,'rbac','rolebinding'),(123,'rbac','systemrole'),(121,'rbac','systemrolebinding'),(139,'sessions','session'),(62,'settings','chatprompt'),(61,'settings','setting'),(75,'terminal','applet'),(76,'terminal','applethost'),(78,'terminal','applethostdeployment'),(77,'terminal','appletpublication'),(79,'terminal','appprovider'),(63,'terminal','command'),(68,'terminal','commandstorage'),(73,'terminal','endpoint'),(74,'terminal','endpointrule'),(69,'terminal','replaystorage'),(64,'terminal','session'),(71,'terminal','sessionjoinrecord'),(72,'terminal','sessionreplay'),(70,'terminal','sessionsharing'),(65,'terminal','status'),(66,'terminal','task'),(67,'terminal','terminal'),(80,'terminal','virtualapp'),(81,'terminal','virtualapppublication'),(105,'tickets','applyassetticket'),(104,'tickets','applycommandticket'),(103,'tickets','applyloginassetticket'),(102,'tickets','applyloginticket'),(97,'tickets','approvalrule'),(96,'tickets','comment'),(16,'tickets','superticket'),(15,'tickets','ticket'),(100,'tickets','ticketassignee'),(99,'tickets','ticketflow'),(101,'tickets','ticketsession'),(98,'tickets','ticketstep'),(21,'users','preference'),(18,'users','user'),(19,'users','usergroup'),(20,'users','userpasswordhistory');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=565 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-03 19:32:48.842974'),(2,'contenttypes','0002_remove_content_type_name','2024-05-03 19:32:48.993813'),(3,'auth','0001_initial','2024-05-03 19:32:49.767448'),(4,'auth','0002_alter_permission_name_max_length','2024-05-03 19:32:49.906795'),(5,'auth','0003_alter_user_email_max_length','2024-05-03 19:32:49.918192'),(6,'auth','0004_alter_user_username_opts','2024-05-03 19:32:49.929347'),(7,'auth','0005_alter_user_last_login_null','2024-05-03 19:32:49.940647'),(8,'auth','0006_require_contenttypes_0002','2024-05-03 19:32:49.949764'),(9,'auth','0007_alter_validators_add_error_messages','2024-05-03 19:32:49.962534'),(10,'auth','0008_alter_user_username_max_length','2024-05-03 19:32:49.974909'),(11,'users','0001_initial','2024-05-03 19:32:51.351324'),(12,'terminal','0001_initial','2024-05-03 19:32:51.713674'),(13,'terminal','0002_auto_20171228_0025','2024-05-03 19:32:52.298260'),(14,'terminal','0003_auto_20171230_0308','2024-05-03 19:32:52.417139'),(15,'terminal','0004_session_remote_addr','2024-05-03 19:32:52.461073'),(16,'terminal','0005_auto_20180122_1154','2024-05-03 19:32:52.591630'),(17,'terminal','0006_auto_20180123_1037','2024-05-03 19:32:52.610672'),(18,'terminal','0007_session_date_last_active','2024-05-03 19:32:52.675565'),(19,'terminal','0008_auto_20180307_1603','2024-05-03 19:32:52.724733'),(20,'terminal','0009_auto_20180326_0957','2024-05-03 19:32:52.753446'),(21,'terminal','0010_auto_20180423_1140','2024-05-03 19:32:52.835979'),(22,'terminal','0011_auto_20180807_1116','2024-05-03 19:32:53.070080'),(23,'terminal','0012_auto_20180816_1652','2024-05-03 19:32:53.080997'),(24,'terminal','0013_auto_20181123_1113','2024-05-03 19:32:53.100800'),(25,'terminal','0014_auto_20181226_1441','2024-05-03 19:32:53.121157'),(26,'terminal','0015_auto_20190923_1529','2024-05-03 19:32:53.134807'),(27,'terminal','0016_commandstorage_replaystorage','2024-05-03 19:32:53.289451'),(28,'common','0001_initial','2024-05-03 19:32:53.360896'),(29,'common','0002_auto_20180111_1407','2024-05-03 19:32:53.450554'),(30,'common','0003_setting_category','2024-05-03 19:32:53.521455'),(31,'common','0004_setting_encrypted','2024-05-03 19:32:53.583525'),(32,'common','0005_auto_20190221_1902','2024-05-03 19:32:53.598205'),(33,'common','0006_auto_20190304_1515','2024-05-03 19:32:53.635717'),(34,'settings','0001_initial','2024-05-03 19:32:53.645690'),(35,'terminal','0017_auto_20191125_0931','2024-05-03 19:32:53.712403'),(36,'terminal','0018_auto_20191202_1010','2024-05-03 19:32:54.520542'),(37,'terminal','0019_auto_20191206_1000','2024-05-03 19:32:54.530468'),(38,'terminal','0020_auto_20191218_1721','2024-05-03 19:32:54.542889'),(39,'terminal','0021_auto_20200213_1316','2024-05-03 19:32:54.594189'),(40,'terminal','0022_session_is_success','2024-05-03 19:32:54.702673'),(41,'terminal','0023_command_risk_level','2024-05-03 19:32:54.795041'),(42,'terminal','0024_auto_20200715_1713','2024-05-03 19:32:54.811395'),(43,'terminal','0025_auto_20200810_1735','2024-05-03 19:32:54.826248'),(44,'terminal','0026_auto_20201027_1905','2024-05-03 19:32:54.857235'),(45,'terminal','0027_auto_20201102_1651','2024-05-03 19:32:54.936744'),(46,'terminal','0028_auto_20201110_1918','2024-05-03 19:32:55.075437'),(47,'terminal','0029_auto_20201116_1757','2024-05-03 19:32:55.329775'),(48,'terminal','0030_terminal_type','2024-05-03 19:32:55.413672'),(49,'terminal','0031_auto_20210113_1356','2024-05-03 19:32:55.426638'),(50,'terminal','0032_auto_20210302_1853','2024-05-03 19:32:55.443316'),(51,'terminal','0033_auto_20210324_1008','2024-05-03 19:32:55.459267'),(52,'terminal','0034_auto_20210406_1434','2024-05-03 19:32:55.618043'),(53,'terminal','0035_auto_20210517_1448','2024-05-03 19:32:55.635880'),(54,'terminal','0036_auto_20210604_1124','2024-05-03 19:32:55.646070'),(55,'terminal','0037_auto_20210623_1748','2024-05-03 19:32:55.776778'),(56,'terminal','0038_task_kwargs','2024-05-03 19:32:55.929187'),(57,'terminal','0039_auto_20210805_1552','2024-05-03 19:32:55.943959'),(58,'terminal','0040_sessionjoinrecord_sessionsharing','2024-05-03 19:32:57.049668'),(59,'terminal','0041_auto_20211105_1605','2024-05-03 19:32:57.063772'),(60,'terminal','0042_auto_20211229_1619','2024-05-03 19:32:57.078027'),(61,'terminal','0043_auto_20220217_2135','2024-05-03 19:32:57.307821'),(62,'terminal','0044_auto_20220223_1539','2024-05-03 19:32:57.323180'),(63,'terminal','0045_auto_20220228_1144','2024-05-03 19:32:57.350759'),(64,'terminal','0046_auto_20220228_1744','2024-05-03 19:32:57.361248'),(65,'terminal','0047_auto_20220302_1951','2024-05-03 19:32:57.375940'),(66,'terminal','0048_endpoint_endpointrule','2024-05-03 19:32:57.685798'),(67,'terminal','0049_endpoint_redis_port','2024-05-03 19:32:57.755974'),(68,'terminal','0050_auto_20220606_1745','2024-05-03 19:32:57.772630'),(69,'terminal','0051_sessionsharing_users','2024-05-03 19:32:57.975125'),(70,'terminal','0052_auto_20220713_1417','2024-05-03 19:32:58.085933'),(71,'terminal','0053_auto_20221009_1755','2024-05-03 19:32:58.306960'),(72,'users','0002_auto_20171225_1157','2024-05-03 19:33:00.623491'),(73,'users','0003_auto_20180101_0046','2024-05-03 19:33:00.632068'),(74,'users','0004_auto_20180125_1218','2024-05-03 19:33:00.641774'),(75,'users','0005_auto_20180306_1804','2024-05-03 19:33:00.650238'),(76,'users','0006_auto_20180411_1135','2024-05-03 19:33:00.659665'),(77,'users','0007_auto_20180419_1036','2024-05-03 19:33:00.668479'),(78,'users','0008_auto_20180425_1516','2024-05-03 19:33:00.678226'),(79,'users','0009_auto_20180517_1537','2024-05-03 19:33:00.689579'),(80,'users','0010_auto_20180606_1505','2024-05-03 19:33:00.700641'),(81,'users','0011_user_source','2024-05-03 19:33:00.711133'),(82,'users','0012_auto_20180710_1641','2024-05-03 19:33:00.720682'),(83,'users','0013_auto_20180807_1116','2024-05-03 19:33:00.729131'),(84,'users','0014_auto_20180816_1652','2024-05-03 19:33:00.739296'),(85,'users','0015_auto_20181105_1112','2024-05-03 19:33:00.750963'),(86,'users','0016_auto_20181109_1505','2024-05-03 19:33:00.759664'),(87,'users','0017_auto_20181123_1113','2024-05-03 19:33:00.770386'),(88,'users','0018_auto_20190107_1912','2024-05-03 19:33:00.780541'),(89,'users','0019_auto_20190304_1459','2024-05-03 19:33:00.790852'),(90,'users','0020_auto_20190612_1825','2024-05-03 19:33:00.807051'),(91,'users','0021_auto_20190625_1104','2024-05-03 19:33:01.612304'),(92,'users','0022_auto_20190625_1105','2024-05-03 19:33:01.770698'),(93,'users','0023_auto_20190724_1525','2024-05-03 19:33:01.786837'),(94,'users','0024_auto_20191118_1612','2024-05-03 19:33:01.840984'),(95,'users','0025_auto_20200206_1216','2024-05-03 19:33:01.857496'),(96,'users','0026_auto_20200508_2105','2024-05-03 19:33:01.872587'),(97,'users','0027_auto_20200616_1503','2024-05-03 19:33:01.889618'),(98,'users','0028_auto_20200728_1805','2024-05-03 19:33:01.905619'),(99,'users','0029_auto_20200814_1650','2024-05-03 19:33:01.920391'),(100,'users','0030_auto_20200819_2041','2024-05-03 19:33:01.934848'),(101,'users','0031_auto_20201118_1801','2024-05-03 19:33:02.112745'),(102,'tickets','0001_initial','2024-05-03 19:33:03.092660'),(103,'tickets','0002_auto_20200728_1146','2024-05-03 19:33:03.224031'),(104,'tickets','0003_auto_20200804_1551','2024-05-03 19:33:03.242361'),(105,'tickets','0004_ticket_comment','2024-05-03 19:33:03.418042'),(106,'tickets','0005_ticket_meta_confirmed_system_users','2024-05-03 19:33:03.445643'),(107,'tickets','0006_auto_20201023_1628','2024-05-03 19:33:03.463433'),(108,'tickets','0007_auto_20201224_1821','2024-05-03 19:33:05.245034'),(109,'assets','0001_initial','2024-05-03 19:33:06.810838'),(110,'perms','0001_initial','2024-05-03 19:33:07.876455'),(111,'assets','0002_auto_20180105_1807','2024-05-03 19:33:10.455679'),(112,'assets','0003_auto_20180109_2331','2024-05-03 19:33:10.464249'),(113,'assets','0004_auto_20180125_1218','2024-05-03 19:33:10.473864'),(114,'assets','0005_auto_20180126_1637','2024-05-03 19:33:10.482564'),(115,'assets','0006_auto_20180130_1502','2024-05-03 19:33:10.491697'),(116,'assets','0007_auto_20180225_1815','2024-05-03 19:33:10.501253'),(117,'assets','0008_auto_20180306_1804','2024-05-03 19:33:10.514913'),(118,'assets','0009_auto_20180307_1212','2024-05-03 19:33:10.524654'),(119,'assets','0010_auto_20180307_1749','2024-05-03 19:33:12.696651'),(120,'assets','0011_auto_20180326_0957','2024-05-03 19:33:12.705486'),(121,'assets','0012_auto_20180404_1302','2024-05-03 19:33:12.717786'),(122,'assets','0013_auto_20180411_1135','2024-05-03 19:33:12.728005'),(123,'assets','0014_auto_20180427_1245','2024-05-03 19:33:12.737347'),(124,'assets','0015_auto_20180510_1235','2024-05-03 19:33:12.745947'),(125,'assets','0016_auto_20180511_1203','2024-05-03 19:33:12.755086'),(126,'assets','0017_auto_20180702_1415','2024-05-03 19:33:12.764312'),(127,'assets','0018_auto_20180807_1116','2024-05-03 19:33:12.773542'),(128,'assets','0019_auto_20180816_1320','2024-05-03 19:33:12.782512'),(129,'perms','0002_auto_20171228_0025','2024-05-03 19:33:14.655164'),(130,'perms','0003_auto_20180225_1815','2024-05-03 19:33:14.666298'),(131,'perms','0004_auto_20180411_1135','2024-05-03 19:33:14.676070'),(132,'perms','0005_migrate_data_20180411_1144','2024-05-03 19:33:14.687082'),(133,'perms','0006_auto_20180606_1505','2024-05-03 19:33:14.696908'),(134,'perms','0007_auto_20180807_1116','2024-05-03 19:33:14.707934'),(135,'perms','0008_auto_20180816_1652','2024-05-03 19:33:14.717189'),(136,'perms','0009_auto_20180903_1132','2024-05-03 19:33:14.726797'),(137,'perms','0003_action','2024-05-03 19:33:14.797809'),(138,'perms','0004_assetpermission_actions','2024-05-03 19:33:15.206646'),(139,'assets','0020_auto_20180816_1652','2024-05-03 19:33:17.351156'),(140,'assets','0021_auto_20180903_1132','2024-05-03 19:33:17.380778'),(141,'assets','0022_auto_20181012_1717','2024-05-03 19:33:18.056642'),(142,'assets','0023_auto_20181016_1650','2024-05-03 19:33:18.092848'),(143,'assets','0024_auto_20181219_1614','2024-05-03 19:33:18.139562'),(144,'assets','0025_auto_20190221_1902','2024-05-03 19:33:18.155910'),(145,'assets','0026_auto_20190325_2035','2024-05-03 19:33:18.435635'),(146,'applications','0001_initial','2024-05-03 19:33:19.025931'),(147,'perms','0005_auto_20190521_1619','2024-05-03 19:33:20.324069'),(148,'perms','0006_auto_20190628_1921','2024-05-03 19:33:20.434680'),(149,'perms','0007_remove_assetpermission_actions','2024-05-03 19:33:20.760469'),(150,'perms','0008_auto_20190911_1907','2024-05-03 19:33:20.788449'),(151,'assets','0027_auto_20190521_1703','2024-05-03 19:33:21.211256'),(152,'assets','0028_protocol','2024-05-03 19:33:21.638559'),(153,'assets','0029_auto_20190522_1114','2024-05-03 19:33:21.653663'),(154,'assets','0030_auto_20190619_1135','2024-05-03 19:33:21.691182'),(155,'assets','0031_auto_20190621_1332','2024-05-03 19:33:21.785393'),(156,'assets','0032_auto_20190624_2108','2024-05-03 19:33:22.452721'),(157,'assets','0033_auto_20190624_2108','2024-05-03 19:33:23.051953'),(158,'assets','0034_auto_20190705_1348','2024-05-03 19:33:23.427231'),(159,'assets','0035_auto_20190711_2018','2024-05-03 19:33:23.479945'),(160,'assets','0036_auto_20190716_1535','2024-05-03 19:33:23.546131'),(161,'assets','0037_auto_20190724_2002','2024-05-03 19:33:23.560345'),(162,'assets','0038_auto_20190911_1634','2024-05-03 19:33:23.615690'),(163,'perms','0009_remoteapppermission_system_users','2024-05-03 19:33:23.998726'),(164,'assets','0039_authbook_is_active','2024-05-03 19:33:24.076840'),(165,'assets','0040_auto_20190917_2056','2024-05-03 19:33:24.303970'),(166,'assets','0041_gathereduser','2024-05-03 19:33:24.556478'),(167,'assets','0042_favoriteasset','2024-05-03 19:33:24.942371'),(168,'assets','0043_auto_20191114_1111','2024-05-03 19:33:25.063226'),(169,'assets','0044_platform','2024-05-03 19:33:25.174805'),(170,'assets','0045_auto_20191206_1607','2024-05-03 19:33:25.584896'),(171,'assets','0046_auto_20191218_1705','2024-05-03 19:33:25.618934'),(172,'applications','0002_remove_remoteapp_system_user','2024-05-03 19:33:26.006835'),(173,'applications','0003_auto_20191210_1659','2024-05-03 19:33:26.040115'),(174,'applications','0004_auto_20191218_1705','2024-05-03 19:33:26.237278'),(175,'perms','0010_auto_20191218_1705','2024-05-03 19:33:27.854134'),(176,'perms','0011_auto_20200721_1739','2024-05-03 19:33:27.914789'),(177,'assets','0047_assetuser','2024-05-03 19:33:27.926958'),(178,'assets','0048_auto_20191230_1512','2024-05-03 19:33:28.810252'),(179,'assets','0049_systemuser_sftp_root','2024-05-03 19:33:28.915356'),(180,'assets','0050_auto_20200711_1740','2024-05-03 19:33:29.142319'),(181,'assets','0051_auto_20200713_1143','2024-05-03 19:33:29.231772'),(182,'assets','0052_auto_20200715_1535','2024-05-03 19:33:29.360360'),(183,'assets','0053_auto_20200723_1232','2024-05-03 19:33:30.078895'),(184,'assets','0054_auto_20200807_1032','2024-05-03 19:33:30.307476'),(185,'applications','0005_k8sapp','2024-05-03 19:33:30.445161'),(186,'perms','0012_k8sapppermission','2024-05-03 19:33:32.611734'),(187,'assets','0055_auto_20200811_1845','2024-05-03 19:33:33.030611'),(188,'assets','0056_auto_20200904_1751','2024-05-03 19:33:33.219846'),(189,'assets','0057_fill_node_value_assets_amount_and_parent_key','2024-05-03 19:33:33.260351'),(190,'perms','0013_rebuildusertreetask_usergrantedmappingnode','2024-05-03 19:33:33.777741'),(191,'perms','0014_build_users_perm_tree','2024-05-03 19:33:33.787485'),(192,'perms','0015_auto_20200929_1728','2024-05-03 19:33:34.040695'),(193,'assets','0058_auto_20201023_1115','2024-05-03 19:33:34.101906'),(194,'assets','0059_auto_20201027_1905','2024-05-03 19:33:34.643802'),(195,'applications','0006_application','2024-05-03 19:33:34.979069'),(196,'perms','0016_applicationpermission','2024-05-03 19:33:36.634698'),(197,'perms','0017_auto_20210104_0435','2024-05-03 19:33:37.811457'),(198,'assets','0060_node_full_value','2024-05-03 19:33:37.952568'),(199,'assets','0061_auto_20201116_1757','2024-05-03 19:33:37.970719'),(200,'assets','0062_auto_20201117_1938','2024-05-03 19:33:37.993699'),(201,'assets','0063_migrate_default_node_key','2024-05-03 19:33:38.034396'),(202,'assets','0064_auto_20201203_1100','2024-05-03 19:33:38.053161'),(203,'assets','0065_auto_20210121_1549','2024-05-03 19:33:38.068078'),(204,'perms','0018_auto_20210208_1515','2024-05-03 19:33:38.806425'),(205,'orgs','0001_initial','2024-05-03 19:33:39.573546'),(206,'orgs','0002_auto_20180903_1132','2024-05-03 19:33:39.597655'),(207,'orgs','0003_auto_20190916_1057','2024-05-03 19:33:40.038881'),(208,'orgs','0004_organizationmember','2024-05-03 19:33:40.412584'),(209,'orgs','0005_auto_20200721_1937','2024-05-03 19:33:40.455027'),(210,'orgs','0006_auto_20200721_1937','2024-05-03 19:33:40.856307'),(211,'orgs','0007_auto_20200728_1805','2024-05-03 19:33:40.897422'),(212,'orgs','0008_auto_20200819_2041','2024-05-03 19:33:40.934993'),(213,'orgs','0009_auto_20201023_1628','2024-05-03 19:33:40.963481'),(214,'ops','0001_initial','2024-05-03 19:33:41.525226'),(215,'ops','0002_celerytask','2024-05-03 19:33:41.586927'),(216,'ops','0003_auto_20181207_1744','2024-05-03 19:33:43.010963'),(217,'ops','0004_adhoc_run_as','2024-05-03 19:33:43.191169'),(218,'ops','0005_auto_20181219_1807','2024-05-03 19:33:43.342011'),(219,'ops','0006_auto_20190318_1023','2024-05-03 19:33:43.601373'),(220,'ops','0007_auto_20190724_2002','2024-05-03 19:33:43.655667'),(221,'ops','0008_auto_20190919_2100','2024-05-03 19:33:43.735443'),(222,'ops','0009_auto_20191217_1713','2024-05-03 19:33:44.421211'),(223,'ops','0010_auto_20191217_1758','2024-05-03 19:33:45.083790'),(224,'ops','0011_auto_20200106_1534','2024-05-03 19:33:45.110574'),(225,'ops','0012_auto_20200108_1659','2024-05-03 19:33:45.162644'),(226,'ops','0013_auto_20200108_1706','2024-05-03 19:33:45.606722'),(227,'ops','0014_auto_20200108_1749','2024-05-03 19:33:45.919844'),(228,'ops','0015_auto_20200108_1809','2024-05-03 19:33:46.479591'),(229,'ops','0016_commandexecution_org_id','2024-05-03 19:33:46.653110'),(230,'ops','0017_auto_20200306_1747','2024-05-03 19:33:46.691501'),(231,'ops','0018_auto_20200509_1434','2024-05-03 19:33:46.796884'),(232,'ops','0019_adhocexecution_celery_task_id','2024-05-03 19:33:46.921440'),(233,'audits','0001_initial','2024-05-03 19:33:47.044063'),(234,'audits','0002_ftplog_org_id','2024-05-03 19:33:47.135665'),(235,'audits','0003_auto_20180816_1652','2024-05-03 19:33:47.279320'),(236,'audits','0004_operatelog_passwordchangelog_userloginlog','2024-05-03 19:33:47.427992'),(237,'audits','0005_auto_20190228_1715','2024-05-03 19:33:47.438193'),(238,'audits','0006_auto_20190726_1753','2024-05-03 19:33:47.595990'),(239,'audits','0007_auto_20191202_1010','2024-05-03 19:33:47.982630'),(240,'audits','0008_auto_20200508_2105','2024-05-03 19:33:47.999848'),(241,'audits','0009_auto_20200624_1654','2024-05-03 19:33:48.014069'),(242,'audits','0010_auto_20200811_1122','2024-05-03 19:33:48.080562'),(243,'audits','0011_userloginlog_backend','2024-05-03 19:33:48.158921'),(244,'assets','0066_auto_20210208_1802','2024-05-03 19:33:48.188461'),(245,'applications','0007_auto_20201119_1110','2024-05-03 19:33:48.233586'),(246,'applications','0008_auto_20210104_0435','2024-05-03 19:33:48.430566'),(247,'orgs','0010_auto_20210219_1241','2024-05-03 19:33:48.803653'),(248,'assets','0067_auto_20210311_1113','2024-05-03 19:33:48.938736'),(249,'assets','0068_auto_20210312_1455','2024-05-03 19:33:48.983201'),(250,'assets','0069_change_node_key0_to_key1','2024-05-03 19:33:49.029795'),(251,'assets','0070_auto_20210426_1515','2024-05-03 19:33:49.433262'),(252,'assets','0071_systemuser_type','2024-05-03 19:33:50.653631'),(253,'assets','0072_historicalauthbook','2024-05-03 19:33:51.052998'),(254,'assets','0073_auto_20210606_1142','2024-05-03 19:33:51.602378'),(255,'assets','0074_remove_systemuser_assets','2024-05-03 19:33:51.728123'),(256,'assets','0075_auto_20210705_1759','2024-05-03 19:33:52.407542'),(257,'assets','0076_delete_assetuser','2024-05-03 19:33:52.418632'),(258,'assets','0077_auto_20211012_1642','2024-05-03 19:33:52.473761'),(259,'assets','0078_auto_20211014_2209','2024-05-03 19:33:52.584747'),(260,'assets','0079_auto_20211102_1922','2024-05-03 19:33:52.643165'),(261,'assets','0080_auto_20211104_1347','2024-05-03 19:33:52.976778'),(262,'assets','0081_auto_20211105_1605','2024-05-03 19:33:53.016053'),(263,'applications','0009_applicationuser','2024-05-03 19:33:53.026835'),(264,'applications','0010_appaccount_historicalappaccount','2024-05-03 19:33:53.930608'),(265,'applications','0011_auto_20210826_1759','2024-05-03 19:33:53.981186'),(266,'applications','0012_auto_20211014_2209','2024-05-03 19:33:54.031364'),(267,'applications','0013_auto_20211026_1711','2024-05-03 19:33:54.059362'),(268,'applications','0014_auto_20211105_1605','2024-05-03 19:33:54.100302'),(269,'assets','0082_auto_20211209_1440','2024-05-03 19:33:56.566005'),(270,'assets','0083_auto_20211215_1436','2024-05-03 19:33:56.642109'),(271,'assets','0084_auto_20220112_1959','2024-05-03 19:33:57.409096'),(272,'assets','0085_commandfilterrule_ignore_case','2024-05-03 19:33:57.497829'),(273,'assets','0086_auto_20220217_2135','2024-05-03 19:33:57.736832'),(274,'assets','0087_auto_20220223_1539','2024-05-03 19:33:57.785476'),(275,'assets','0088_auto_20220303_1612','2024-05-03 19:33:57.861707'),(276,'assets','0089_auto_20220310_0616','2024-05-03 19:33:57.961086'),(277,'assets','0090_auto_20220412_1145','2024-05-03 19:33:58.256149'),(278,'assets','0091_auto_20220629_1826','2024-05-03 19:33:58.392025'),(279,'assets','0092_commandfilter_nodes','2024-05-03 19:33:58.790163'),(280,'assets','0093_auto_20220403_1627','2024-05-03 19:34:01.488645'),(281,'assets','0094_auto_20220402_1736','2024-05-03 19:34:02.945590'),(282,'assets','0095_auto_20220407_1726','2024-05-03 19:34:03.393695'),(283,'assets','0096_auto_20220426_1550','2024-05-03 19:34:03.982209'),(284,'assets','0097_auto_20220426_1558','2024-05-03 19:34:04.774375'),(285,'applications','0015_auto_20220112_2035','2024-05-03 19:34:04.821496'),(286,'applications','0016_auto_20220118_1455','2024-05-03 19:34:04.904997'),(287,'applications','0017_auto_20220217_2135','2024-05-03 19:34:04.979030'),(288,'applications','0018_auto_20220223_1539','2024-05-03 19:34:05.029920'),(289,'applications','0019_auto_20220310_1853','2024-05-03 19:34:05.051806'),(290,'applications','0020_auto_20220316_2028','2024-05-03 19:34:05.100192'),(291,'assets','0098_auto_20220430_2126','2024-05-03 19:34:05.563001'),(292,'assets','0099_auto_20220711_1409','2024-05-03 19:34:05.929619'),(293,'accounts','0001_initial','2024-05-03 19:34:06.942089'),(294,'assets','0100_auto_20220711_1413','2024-05-03 19:34:07.041557'),(295,'assets','0101_auto_20220811_1511','2024-05-03 19:34:08.201860'),(296,'terminal','0054_auto_20221027_1125','2024-05-03 19:34:08.674368'),(297,'assets','0102_auto_20220816_1022','2024-05-03 19:34:09.124035'),(298,'assets','0103_auto_20220902_1021','2024-05-03 19:34:09.216097'),(299,'assets','0104_auto_20220817_1544','2024-05-03 19:34:10.827451'),(300,'assets','0105_auto_20221220_1956','2024-05-03 19:34:13.022880'),(301,'terminal','0055_auto_20221228_1804','2024-05-03 19:34:16.300216'),(302,'terminal','0056_auto_20221228_1808','2024-05-03 19:34:17.814303'),(303,'terminal','0057_auto_20230109_1447','2024-05-03 19:34:18.107541'),(304,'terminal','0058_auto_20230110_1445','2024-05-03 19:34:18.202459'),(305,'terminal','0059_session_account_id','2024-05-03 19:34:18.343953'),(306,'terminal','0060_sessionsharing_action_permission','2024-05-03 19:34:18.453949'),(307,'terminal','0061_applet_can_concurrent','2024-05-03 19:34:18.526770'),(308,'terminal','0062_applet_edition','2024-05-03 19:34:18.591624'),(309,'terminal','0063_auto_20230621_1133','2024-05-03 19:34:18.651992'),(310,'terminal','0064_auto_20230728_1001','2024-05-03 19:34:18.946798'),(311,'terminal','0065_session_error_reason','2024-05-03 19:34:19.032434'),(312,'terminal','0066_applethost_using_same_account','2024-05-03 19:34:19.104828'),(313,'terminal','0067_alter_replaystorage_type','2024-05-03 19:34:19.119731'),(314,'tickets','0008_auto_20210311_1113','2024-05-03 19:34:19.148913'),(315,'tickets','0009_auto_20210426_1720','2024-05-03 19:34:19.178681'),(316,'tickets','0010_auto_20210812_1618','2024-05-03 19:34:22.005860'),(317,'tickets','0011_remove_approvalrule_assignees_display','2024-05-03 19:34:22.076340'),(318,'tickets','0012_ticketsession','2024-05-03 19:34:22.247041'),(319,'tickets','0013_ticket_serial_num','2024-05-03 19:34:22.635544'),(320,'tickets','0014_auto_20220217_2135','2024-05-03 19:34:22.699292'),(321,'tickets','0015_superticket','2024-05-03 19:34:22.713717'),(322,'tickets','0016_auto_20220609_1758','2024-05-03 19:34:27.358444'),(323,'tickets','0017_auto_20220623_1027','2024-05-03 19:34:27.998359'),(324,'tickets','0018_applyapplicationticket_apply_actions','2024-05-03 19:34:28.074853'),(325,'tickets','0019_delete_applyapplicationticket','2024-05-03 19:34:28.186135'),(326,'tickets','0020_auto_20220817_1346','2024-05-03 19:34:29.357410'),(327,'tickets','0021_auto_20220921_1814','2024-05-03 19:34:29.485493'),(328,'tickets','0022_alter_applyassetticket_apply_actions','2024-05-03 19:34:29.522034'),(329,'tickets','0023_alter_applyassetticket_apply_actions','2024-05-03 19:34:29.733258'),(330,'tickets','0024_auto_20221121_1800','2024-05-03 19:34:29.892052'),(331,'authentication','0001_initial','2024-05-03 19:34:30.182614'),(332,'authentication','0002_auto_20190729_1423','2024-05-03 19:34:30.338146'),(333,'authentication','0003_loginconfirmsetting','2024-05-03 19:34:30.924666'),(334,'authentication','0004_ssotoken','2024-05-03 19:34:31.057074'),(335,'acls','0001_initial','2024-05-03 19:34:31.775033'),(336,'acls','0002_auto_20210926_1047','2024-05-03 19:34:32.874031'),(337,'acls','0003_auto_20211130_1037','2024-05-03 19:34:32.936340'),(338,'acls','0004_auto_20220831_1658','2024-05-03 19:34:33.130434'),(339,'acls','0005_auto_20221201_1846','2024-05-03 19:34:33.289083'),(340,'acls','0005_auto_20221201_1846','2024-05-03 19:34:33.526128'),(341,'acls','0006_commandfilteracl_commandgroup','2024-05-03 19:34:34.256945'),(342,'acls','0007_auto_20221202_1048','2024-05-03 19:34:34.324978'),(343,'acls','0008_commandgroup_comment','2024-05-03 19:34:34.484296'),(344,'tickets','0025_auto_20221206_1820','2024-05-03 19:34:35.343569'),(345,'assets','0106_auto_20221228_1838','2024-05-03 19:34:37.063912'),(346,'assets','0107_automation','2024-05-03 19:34:38.799193'),(347,'assets','0108_alter_platform_charset','2024-05-03 19:34:39.175315'),(348,'assets','0109_alter_asset_options','2024-05-03 19:34:39.204809'),(349,'assets','0110_auto_20230315_1741','2024-05-03 19:34:39.272519'),(350,'assets','0111_auto_20230321_1633','2024-05-03 19:34:40.009529'),(351,'assets','0112_auto_20230404_1631','2024-05-03 19:34:41.103911'),(352,'assets','0113_auto_20230411_1917','2024-05-03 19:34:41.176689'),(353,'assets','0114_baseautomation_params','2024-05-03 19:34:42.123050'),(354,'assets','0115_auto_20230417_1425','2024-05-03 19:34:42.787205'),(355,'assets','0116_auto_20230418_1726','2024-05-03 19:34:43.079347'),(356,'assets','0117_alter_baseautomation_params','2024-05-03 19:34:43.115733'),(357,'assets','0118_auto_20230524_1647','2024-05-03 19:34:43.187914'),(358,'assets','0119_assets_add_default_node','2024-05-03 19:34:43.251682'),(359,'assets','0120_auto_20230630_1613','2024-05-03 19:34:43.530497'),(360,'assets','0121_auto_20230725_1458','2024-05-03 19:34:43.714545'),(361,'assets','0122_auto_20230803_1553','2024-05-03 19:34:43.783669'),(362,'accounts','0002_auto_20220616_0021','2024-05-03 19:34:44.284271'),(363,'accounts','0003_automation','2024-05-03 19:34:46.575625'),(364,'accounts','0004_auto_20230106_1507','2024-05-03 19:34:46.625725'),(365,'accounts','0005_alter_changesecretrecord_options','2024-05-03 19:34:46.657560'),(366,'accounts','0006_gatheredaccount','2024-05-03 19:34:47.111008'),(367,'accounts','0007_alter_account_options','2024-05-03 19:34:47.142555'),(368,'accounts','0008_alter_gatheredaccount_options','2024-05-03 19:34:47.176226'),(369,'accounts','0009_account_usernames_to_ids','2024-05-03 19:34:47.245158'),(370,'accounts','0010_gatheraccountsautomation_is_sync_account','2024-05-03 19:34:47.368570'),(371,'accounts','0011_auto_20230506_1443','2024-05-03 19:34:47.597356'),(372,'accounts','0012_auto_20230621_1456','2024-05-03 19:34:47.782879'),(373,'accounts','0013_account_backup_recipients','2024-05-03 19:34:49.094196'),(374,'accounts','0014_virtualaccount','2024-05-03 19:34:49.228174'),(375,'accounts','0015_auto_20230825_1120','2024-05-03 19:34:49.944197'),(376,'accounts','0016_accounttemplate_password_rules','2024-05-03 19:34:50.135274'),(377,'accounts','0017_alter_automationexecution_options','2024-05-03 19:34:50.150635'),(378,'accounts','0018_accountbackupautomation_backup_type_and_more','2024-05-03 19:34:51.290255'),(379,'accounts','0019_gatheraccountsautomation_recipients','2024-05-03 19:34:51.695836'),(380,'accounts','0020_alter_accountbackupautomation_backup_type_and_more','2024-05-03 19:34:52.038412'),(381,'acls','0009_auto_20221220_1956','2024-05-03 19:34:53.098045'),(382,'acls','0010_alter_commandfilteracl_command_groups','2024-05-03 19:34:53.163578'),(383,'acls','0011_auto_20230425_1704','2024-05-03 19:34:54.300322'),(384,'acls','0012_auto_20230426_1111','2024-05-03 19:34:54.380295'),(385,'acls','0013_auto_20230426_1759','2024-05-03 19:34:55.436123'),(386,'acls','0014_loginassetacl_rules','2024-05-03 19:34:55.736893'),(387,'acls','0015_connectmethodacl','2024-05-03 19:34:56.534987'),(388,'acls','0016_auto_20230606_1857','2024-05-03 19:34:57.157529'),(389,'acls','0017_alter_connectmethodacl_options','2024-05-03 19:34:57.195724'),(390,'acls','0018_alter_commandfilteracl_command_groups','2024-05-03 19:34:57.533267'),(391,'admin','0001_initial','2024-05-03 19:34:57.956730'),(392,'admin','0002_logentry_remove_auto_add','2024-05-03 19:34:58.020661'),(393,'admin','0003_logentry_add_action_flag_choices','2024-05-03 19:34:58.063634'),(394,'perms','0019_auto_20210906_1044','2024-05-03 19:34:58.266055'),(395,'perms','0020_auto_20210910_1103','2024-05-03 19:34:58.415870'),(396,'perms','0021_auto_20211105_1605','2024-05-03 19:34:58.469696'),(397,'perms','0022_applicationpermission_actions','2024-05-03 19:34:58.662729'),(398,'perms','0023_auto_20220112_2035','2024-05-03 19:34:58.707882'),(399,'perms','0024_auto_20220217_2135','2024-05-03 19:34:58.804927'),(400,'perms','0025_auto_20220223_1539','2024-05-03 19:34:59.126639'),(401,'perms','0026_auto_20220307_1500','2024-05-03 19:34:59.148221'),(402,'perms','0027_auto_20220310_1802','2024-05-03 19:34:59.239596'),(403,'perms','0028_auto_20220316_2028','2024-05-03 19:34:59.289249'),(404,'perms','0029_auto_20220728_1728','2024-05-03 19:34:59.431069'),(405,'perms','0030_auto_20220816_1132','2024-05-03 19:34:59.908972'),(406,'perms','0031_auto_20220816_1600','2024-05-03 19:35:00.871881'),(407,'ops','0020_adhoc_run_system_user','2024-05-03 19:35:01.154327'),(408,'ops','0021_auto_20211130_1037','2024-05-03 19:35:01.254552'),(409,'ops','0022_auto_20220817_1346','2024-05-03 19:35:02.951628'),(410,'applications','0021_auto_20220629_1826','2024-05-03 19:35:03.080685'),(411,'applications','0022_auto_20220714_1046','2024-05-03 19:35:03.381151'),(412,'applications','0023_auto_20220715_1556','2024-05-03 19:35:03.446617'),(413,'applications','0024_alter_application_type','2024-05-03 19:35:03.465025'),(414,'applications','0025_auto_20220817_1346','2024-05-03 19:35:04.789677'),(415,'applications','0026_auto_20220817_1716','2024-05-03 19:35:04.930999'),(416,'applications','0027_auto_20221220_1956','2024-05-03 19:35:05.110802'),(417,'labels','0001_initial','2024-05-03 19:35:05.689979'),(418,'assets','0123_device_automation_ansible_enabled','2024-05-03 19:35:05.754549'),(419,'assets','0124_auto_20231007_1437','2024-05-03 19:35:05.838216'),(420,'assets','0125_auto_20231011_1053','2024-05-03 19:35:06.182771'),(421,'labels','0002_auto_20231103_1659','2024-05-03 19:35:06.258425'),(422,'assets','0126_remove_asset_labels','2024-05-03 19:35:06.364560'),(423,'assets','0127_automation_remove_account','2024-05-03 19:35:06.676262'),(424,'ops','0023_auto_20220912_0021','2024-05-03 19:35:09.347549'),(425,'audits','0012_auto_20210414_1443','2024-05-03 19:35:09.365791'),(426,'audits','0013_auto_20211130_1037','2024-05-03 19:35:09.391536'),(427,'audits','0014_auto_20220505_1902','2024-05-03 19:35:09.408047'),(428,'audits','0015_auto_20221011_1745','2024-05-03 19:35:09.497911'),(429,'audits','0016_auto_20221111_1919','2024-05-03 19:35:09.520934'),(430,'audits','0017_auto_20221220_1757','2024-05-03 19:35:09.566877'),(431,'audits','0018_operatelog_resource_id','2024-05-03 19:35:09.672825'),(432,'audits','0019_alter_operatelog_options','2024-05-03 19:35:09.685877'),(433,'audits','0020_auto_20230117_1004','2024-05-03 19:35:10.259273'),(434,'audits','0021_auto_20230207_0857','2024-05-03 19:35:10.437558'),(435,'audits','0022_auto_20230605_1555','2024-05-03 19:35:10.549038'),(436,'audits','0023_auto_20230906_1322','2024-05-03 19:35:10.644633'),(437,'audits','0024_usersession','2024-05-03 19:35:10.938514'),(438,'audits','0025_remove_usersession_date_expired','2024-05-03 19:35:11.062515'),(439,'auth','0009_alter_user_last_name_max_length','2024-05-03 19:35:11.084016'),(440,'auth','0010_alter_group_name_max_length','2024-05-03 19:35:11.275063'),(441,'auth','0011_update_proxy_permissions','2024-05-03 19:35:11.396009'),(442,'auth','0012_alter_user_first_name_max_length','2024-05-03 19:35:11.414544'),(443,'tickets','0026_auto_20221220_1956','2024-05-03 19:35:13.869894'),(444,'tickets','0027_alter_applycommandticket_apply_run_account','2024-05-03 19:35:14.157147'),(445,'tickets','0028_remove_app_tickets','2024-05-03 19:35:14.229076'),(446,'authentication','0005_delete_loginconfirmsetting','2024-05-03 19:35:14.310093'),(447,'authentication','0006_auto_20211227_1059','2024-05-03 19:35:14.377846'),(448,'authentication','0007_connectiontoken','2024-05-03 19:35:14.496429'),(449,'authentication','0008_superconnectiontoken','2024-05-03 19:35:14.507965'),(450,'authentication','0009_auto_20220310_0616','2024-05-03 19:35:14.520826'),(451,'authentication','0010_temptoken','2024-05-03 19:35:14.580991'),(452,'authentication','0011_auto_20220705_1940','2024-05-03 19:35:16.008759'),(453,'authentication','0012_auto_20220816_1629','2024-05-03 19:35:17.166687'),(454,'authentication','0013_connectiontoken_protocol','2024-05-03 19:35:17.286306'),(455,'authentication','0014_auto_20221122_2152','2024-05-03 19:35:17.868400'),(456,'authentication','0015_auto_20221205_1136','2024-05-03 19:35:17.957967'),(457,'authentication','0016_auto_20221220_1956','2024-05-03 19:35:19.323418'),(458,'authentication','0017_auto_20230105_1743','2024-05-03 19:35:19.942250'),(459,'authentication','0018_alter_connectiontoken_input_secret','2024-05-03 19:35:20.151263'),(460,'authentication','0019_connectiontoken_is_reusable','2024-05-03 19:35:20.257958'),(461,'authentication','0020_connectiontoken_connect_options','2024-05-03 19:35:20.457915'),(462,'authentication','0021_auto_20230713_1459','2024-05-03 19:35:20.512615'),(463,'authentication','0022_passkey','2024-05-03 19:35:20.778188'),(464,'authentication','0023_auto_20231010_1101','2024-05-03 19:35:21.145706'),(465,'authentication','0024_accesskey_ip_group','2024-05-03 19:35:21.306269'),(466,'captcha','0001_initial','2024-05-03 19:35:21.384708'),(467,'captcha','0002_alter_captchastore_id','2024-05-03 19:35:21.399292'),(468,'django_cas_ng','0001_initial','2024-05-03 19:35:21.777902'),(469,'django_cas_ng','0002_auto_20201023_1400','2024-05-03 19:35:21.870417'),(470,'django_cas_ng','0003_auto_20210813_1226','2024-05-03 19:35:21.902520'),(471,'django_celery_beat','0001_initial','2024-05-03 19:35:22.464680'),(472,'django_celery_beat','0002_auto_20161118_0346','2024-05-03 19:35:22.700781'),(473,'django_celery_beat','0003_auto_20161209_0049','2024-05-03 19:35:22.750067'),(474,'django_celery_beat','0004_auto_20170221_0000','2024-05-03 19:35:22.764475'),(475,'django_celery_beat','0005_add_solarschedule_events_choices','2024-05-03 19:35:22.782766'),(476,'django_celery_beat','0006_auto_20180322_0932','2024-05-03 19:35:23.220362'),(477,'django_celery_beat','0007_auto_20180521_0826','2024-05-03 19:35:23.328242'),(478,'django_celery_beat','0008_auto_20180914_1922','2024-05-03 19:35:23.370658'),(479,'django_celery_beat','0006_auto_20180210_1226','2024-05-03 19:35:23.401112'),(480,'django_celery_beat','0006_periodictask_priority','2024-05-03 19:35:23.577808'),(481,'django_celery_beat','0009_periodictask_headers','2024-05-03 19:35:23.761024'),(482,'django_celery_beat','0010_auto_20190429_0326','2024-05-03 19:35:23.982952'),(483,'django_celery_beat','0011_auto_20190508_0153','2024-05-03 19:35:24.224472'),(484,'django_celery_beat','0012_periodictask_expire_seconds','2024-05-03 19:35:24.421982'),(485,'django_celery_beat','0013_auto_20200609_0727','2024-05-03 19:35:24.437378'),(486,'django_celery_beat','0014_remove_clockedschedule_enabled','2024-05-03 19:35:24.482289'),(487,'django_celery_beat','0015_edit_solarschedule_events_choices','2024-05-03 19:35:24.501319'),(488,'django_celery_beat','0016_alter_crontabschedule_timezone','2024-05-03 19:35:24.517398'),(489,'django_celery_beat','0017_alter_crontabschedule_month_of_year','2024-05-03 19:35:24.532944'),(490,'django_celery_beat','0018_improve_crontab_helptext','2024-05-03 19:35:24.548724'),(491,'labels','0003_alter_labeledresource_options_and_more','2024-05-03 19:35:24.951491'),(492,'users','0032_userpasswordhistory','2024-05-03 19:35:25.501837'),(493,'users','0033_user_need_update_password','2024-05-03 19:35:25.698605'),(494,'users','0034_auto_20210506_1448','2024-05-03 19:35:25.946033'),(495,'users','0035_auto_20210526_1100','2024-05-03 19:35:26.018570'),(496,'users','0036_user_feishu_id','2024-05-03 19:35:26.474475'),(497,'users','0037_user_secret_key','2024-05-03 19:35:26.611413'),(498,'users','0038_auto_20211209_1140','2024-05-03 19:35:26.682527'),(499,'users','0039_auto_20211229_1852','2024-05-03 19:35:27.134784'),(500,'users','0040_alter_user_source','2024-05-03 19:35:27.204385'),(501,'users','0041_auto_20221220_1956','2024-05-03 19:35:27.859893'),(502,'notifications','0001_initial','2024-05-03 19:35:29.555575'),(503,'notifications','0002_auto_20210909_1946','2024-05-03 19:35:30.011024'),(504,'notifications','0003_auto_20221220_1956','2024-05-03 19:35:31.707249'),(505,'notifications','0003_auto_20221220_1956','2024-05-03 19:35:32.390779'),(506,'notifications','0004_auto_20230201_1614','2024-05-03 19:35:32.840491'),(507,'ops','0024_alter_celerytask_date_last_publish','2024-05-03 19:35:33.338746'),(508,'ops','0025_auto_20230413_1531','2024-05-03 19:35:33.581875'),(509,'ops','0026_auto_20230810_1039','2024-05-03 19:35:34.158252'),(510,'ops','0027_alter_celerytaskexecution_options','2024-05-03 19:35:34.182140'),(511,'ops','0028_celerytaskexecution_creator','2024-05-03 19:35:34.304618'),(512,'rbac','0001_initial','2024-05-03 19:35:35.316544'),(513,'rbac','0002_auto_20210929_1409','2024-05-03 19:35:35.347688'),(514,'rbac','0003_auto_20211130_1037','2024-05-03 19:35:35.598315'),(515,'rbac','0004_auto_20211201_1901','2024-05-03 19:35:35.793097'),(516,'orgs','0011_auto_20211223_1913','2024-05-03 19:35:35.872905'),(517,'orgs','0012_auto_20220118_1054','2024-05-03 19:35:36.342806'),(518,'orgs','0013_alter_organization_options','2024-05-03 19:35:36.411423'),(519,'orgs','0014_organization_builtin','2024-05-03 19:35:36.634044'),(520,'orgs','0015_auto_20221220_1956','2024-05-03 19:35:36.968289'),(521,'perms','0032_auto_20221111_1919','2024-05-03 19:35:37.030417'),(522,'perms','0033_auto_20221220_1956','2024-05-03 19:35:38.058016'),(523,'perms','0034_auto_20230525_1734','2024-05-03 19:35:38.456402'),(524,'perms','0035_auto_20231125_1025','2024-05-03 19:35:38.652892'),(525,'perms','0036_auto_20231108_1626','2024-05-03 19:35:38.736840'),(526,'rbac','0005_auto_20220307_1524','2024-05-03 19:35:38.752039'),(527,'rbac','0006_auto_20220310_0616','2024-05-03 19:35:38.767194'),(528,'rbac','0007_auto_20220314_1525','2024-05-03 19:35:38.861632'),(529,'rbac','0008_auto_20220411_1709','2024-05-03 19:35:38.876796'),(530,'rbac','0009_auto_20220411_1724','2024-05-03 19:35:38.961428'),(531,'rbac','0010_auto_20221220_1956','2024-05-03 19:35:39.783568'),(532,'rbac','0011_remove_redundant_permission','2024-05-03 19:35:39.887629'),(533,'rbac','0012_remove_add_changesecretexection_permission','2024-05-03 19:35:39.968520'),(534,'rbac','0013_alter_menupermission_options','2024-05-03 19:35:39.982981'),(535,'rbac','0014_auto_20231208_1548','2024-05-03 19:35:40.066887'),(536,'sessions','0001_initial','2024-05-03 19:35:40.151346'),(537,'users','0042_auto_20230203_1201','2024-05-03 19:35:40.537574'),(538,'users','0043_remove_user_secret_key_preference','2024-05-03 19:35:41.457599'),(539,'users','0044_usersession','2024-05-03 19:35:41.751963'),(540,'users','0045_delete_usersession','2024-05-03 19:35:41.799508'),(541,'users','0046_auto_20230927_1456','2024-05-03 19:35:41.915403'),(542,'users','0047_user_date_api_key_last_used','2024-05-03 19:35:42.043789'),(543,'users','0048_wechat_phone_encrypt','2024-05-03 19:35:42.630643'),(544,'users','0049_alter_user_unique_together_user_slack_id_and_more','2024-05-03 19:35:43.352181'),(545,'users','0050_user_lark_id_alter_user_source','2024-05-03 19:35:43.680536'),(546,'settings','0002_auto_20210729_1546','2024-05-03 19:35:43.767525'),(547,'settings','0003_auto_20210901_1035','2024-05-03 19:35:43.877529'),(548,'settings','0004_auto_20220211_1401','2024-05-03 19:35:43.892279'),(549,'settings','0005_auto_20220310_0616','2024-05-03 19:35:43.906669'),(550,'settings','0006_remove_setting_enabled','2024-05-03 19:35:43.989574'),(551,'settings','0007_migrate_ldap_sync_org_ids','2024-05-03 19:35:44.075487'),(552,'settings','0008_alter_setting_options','2024-05-03 19:35:44.090651'),(553,'settings','0009_alter_cas_username_attribute','2024-05-03 19:35:44.174165'),(554,'settings','0010_alter_setting_options','2024-05-03 19:35:44.188601'),(555,'settings','0011_chatprompt','2024-05-03 19:35:44.248992'),(556,'settings','0012_alter_setting_options','2024-05-03 19:35:44.263256'),(557,'settings','0013_auto_20240326_1531','2024-05-03 19:35:44.345144'),(558,'terminal','0068_virtualapp','2024-05-03 19:35:45.026504'),(559,'terminal','0069_endpoint_sqlserver_port_alter_appprovider_apps_and_more','2024-05-03 19:35:45.089893'),(560,'tickets','0029_auto_20230110_1445','2024-05-03 19:35:45.265976'),(561,'users','0002_auto_20171225_1157_squashed_0019_auto_20190304_1459','2024-05-03 19:35:45.282669'),(562,'assets','0002_auto_20180105_1807_squashed_0009_auto_20180307_1212','2024-05-03 19:35:45.292349'),(563,'assets','0010_auto_20180307_1749_squashed_0019_auto_20180816_1320','2024-05-03 19:35:45.301067'),(564,'perms','0002_auto_20171228_0025_squashed_0009_auto_20180903_1132','2024-05-03 19:35:45.310222');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels_label`
--

DROP TABLE IF EXISTS `labels_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labels_label` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `internal` tinyint(1) NOT NULL,
  `id` char(32) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `labels_label_name_value_org_id_6919f24e_uniq` (`name`,`value`,`org_id`),
  KEY `labels_label_org_id_b6b7e424` (`org_id`),
  KEY `labels_label_name_c462fba5` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels_label`
--

LOCK TABLES `labels_label` WRITE;
/*!40000 ALTER TABLE `labels_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `labels_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels_labeledresource`
--

DROP TABLE IF EXISTS `labels_labeledresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labels_labeledresource` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `id` char(32) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `res_id` varchar(36) NOT NULL,
  `label_id` char(32) NOT NULL,
  `res_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `labels_labeledresource_label_id_res_type_id_res_830349ab_uniq` (`label_id`,`res_type_id`,`res_id`,`org_id`),
  KEY `labels_labeledresour_res_type_id_770d03bb_fk_django_co` (`res_type_id`),
  KEY `labels_labeledresource_org_id_d0fb1acc` (`org_id`),
  KEY `labels_labeledresource_res_id_0e341a87` (`res_id`),
  CONSTRAINT `labels_labeledresour_res_type_id_770d03bb_fk_django_co` FOREIGN KEY (`res_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `labels_labeledresource_label_id_f37cf385_fk_labels_label_id` FOREIGN KEY (`label_id`) REFERENCES `labels_label` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels_labeledresource`
--

LOCK TABLES `labels_labeledresource` WRITE;
/*!40000 ALTER TABLE `labels_labeledresource` DISABLE KEYS */;
/*!40000 ALTER TABLE `labels_labeledresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_messagecontent`
--

DROP TABLE IF EXISTS `notifications_messagecontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_messagecontent` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `subject` varchar(1024) NOT NULL,
  `message` longtext NOT NULL,
  `is_broadcast` tinyint(1) NOT NULL,
  `sender_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_messagecontent_sender_id_1fabbbc5` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_messagecontent`
--

LOCK TABLES `notifications_messagecontent` WRITE;
/*!40000 ALTER TABLE `notifications_messagecontent` DISABLE KEYS */;
INSERT INTO `notifications_messagecontent` VALUES ('System','System','2024-05-03 19:45:23.291994','2024-05-03 19:45:23.292013','8a41a03e3ece44b4855d8f00b6f726f1','重設密碼成功','\n<p>你好 Administrator,</p>\n\n<p>\n    你的密碼剛剛成功更新\n</p>\n<p>\n    <b>IP:</b> 172.10.10.1 <br />\n    <b>瀏覽器:</b> Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36\n</p>\n-\n<p>\n    如果這次密碼更新不是由你發起的，那麼你的帳號可能存在安全問題 <br />\n    如果有疑問或需求，請聯絡系統管理員\n</p>\n',0,NULL);
/*!40000 ALTER TABLE `notifications_messagecontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_messagecontent_groups`
--

DROP TABLE IF EXISTS `notifications_messagecontent_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_messagecontent_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `messagecontent_id` char(32) NOT NULL,
  `usergroup_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notifications_messagecon_messagecontent_id_usergr_5601acac_uniq` (`messagecontent_id`,`usergroup_id`),
  KEY `notifications_messag_usergroup_id_e9c9f9bb_fk_users_use` (`usergroup_id`),
  CONSTRAINT `notifications_messag_messagecontent_id_20f26938_fk_notificat` FOREIGN KEY (`messagecontent_id`) REFERENCES `notifications_messagecontent` (`id`),
  CONSTRAINT `notifications_messag_usergroup_id_e9c9f9bb_fk_users_use` FOREIGN KEY (`usergroup_id`) REFERENCES `users_usergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_messagecontent_groups`
--

LOCK TABLES `notifications_messagecontent_groups` WRITE;
/*!40000 ALTER TABLE `notifications_messagecontent_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_messagecontent_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_sitemessage`
--

DROP TABLE IF EXISTS `notifications_sitemessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_sitemessage` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `read_at` datetime(6) DEFAULT NULL,
  `content_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_sitemessage_content_id_d88b1594` (`content_id`),
  KEY `notifications_sitemessage_user_id_cde4e86b` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_sitemessage`
--

LOCK TABLES `notifications_sitemessage` WRITE;
/*!40000 ALTER TABLE `notifications_sitemessage` DISABLE KEYS */;
INSERT INTO `notifications_sitemessage` VALUES (NULL,NULL,'2024-05-03 19:45:23.297885','2024-05-03 19:45:23.297918','01a0338817f34622bb55900ec130ef73',0,NULL,'8a41a03e3ece44b4855d8f00b6f726f1','15e6ac8a16464d68a66f565af10e2921');
/*!40000 ALTER TABLE `notifications_sitemessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_systemmsgsubscription`
--

DROP TABLE IF EXISTS `notifications_systemmsgsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_systemmsgsubscription` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `message_type` varchar(128) NOT NULL,
  `receive_backends` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_type` (`message_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_systemmsgsubscription`
--

LOCK TABLES `notifications_systemmsgsubscription` WRITE;
/*!40000 ALTER TABLE `notifications_systemmsgsubscription` DISABLE KEYS */;
INSERT INTO `notifications_systemmsgsubscription` VALUES ('System','System','2024-05-03 19:35:46.058938','2024-05-03 19:35:46.058966','204832ea9ffe41c8b99f67fecf495ff2','CommandExecutionAlert','[]'),('System','System','2024-05-03 19:35:46.069774','2024-05-03 19:35:46.077773','2c2c652a4f214fffbf854777af85b748','StorageConnectivityMessage','[\"site_msg\"]'),('System','System','2024-05-03 19:35:45.955311','2024-05-03 19:35:45.985432','62a11b57029b48a096b6d82bfd81cd0b','ServerPerformanceMessage','[\"email\"]'),('System','System','2024-05-03 19:35:46.047631','2024-05-03 19:35:46.047659','f5f03b9e951d443f91a79e0a16a58971','CommandAlertMessage','[]');
/*!40000 ALTER TABLE `notifications_systemmsgsubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_systemmsgsubscription_groups`
--

DROP TABLE IF EXISTS `notifications_systemmsgsubscription_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_systemmsgsubscription_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `systemmsgsubscription_id` char(32) NOT NULL,
  `usergroup_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notifications_systemmsgs_systemmsgsubscription_id_84119f33_uniq` (`systemmsgsubscription_id`,`usergroup_id`),
  KEY `notifications_system_usergroup_id_a1bedf56_fk_users_use` (`usergroup_id`),
  CONSTRAINT `notifications_system_systemmsgsubscriptio_9c974da1_fk_notificat` FOREIGN KEY (`systemmsgsubscription_id`) REFERENCES `notifications_systemmsgsubscription` (`id`),
  CONSTRAINT `notifications_system_usergroup_id_a1bedf56_fk_users_use` FOREIGN KEY (`usergroup_id`) REFERENCES `users_usergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_systemmsgsubscription_groups`
--

LOCK TABLES `notifications_systemmsgsubscription_groups` WRITE;
/*!40000 ALTER TABLE `notifications_systemmsgsubscription_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_systemmsgsubscription_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_systemmsgsubscription_users`
--

DROP TABLE IF EXISTS `notifications_systemmsgsubscription_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_systemmsgsubscription_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `systemmsgsubscription_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notifications_systemmsgs_systemmsgsubscription_id_b0446c97_uniq` (`systemmsgsubscription_id`,`user_id`),
  KEY `notifications_system_user_id_6a738c74_fk_users_use` (`user_id`),
  CONSTRAINT `notifications_system_systemmsgsubscriptio_e26c38c8_fk_notificat` FOREIGN KEY (`systemmsgsubscription_id`) REFERENCES `notifications_systemmsgsubscription` (`id`),
  CONSTRAINT `notifications_system_user_id_6a738c74_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_systemmsgsubscription_users`
--

LOCK TABLES `notifications_systemmsgsubscription_users` WRITE;
/*!40000 ALTER TABLE `notifications_systemmsgsubscription_users` DISABLE KEYS */;
INSERT INTO `notifications_systemmsgsubscription_users` VALUES (1,'62a11b57029b48a096b6d82bfd81cd0b','15e6ac8a16464d68a66f565af10e2921');
/*!40000 ALTER TABLE `notifications_systemmsgsubscription_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_usermsgsubscription`
--

DROP TABLE IF EXISTS `notifications_usermsgsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_usermsgsubscription` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `receive_backends` json NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notifications_usermsgsubscription_user_id_a8daa1ad_uniq` (`user_id`),
  CONSTRAINT `notifications_userms_user_id_a8daa1ad_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_usermsgsubscription`
--

LOCK TABLES `notifications_usermsgsubscription` WRITE;
/*!40000 ALTER TABLE `notifications_usermsgsubscription` DISABLE KEYS */;
INSERT INTO `notifications_usermsgsubscription` VALUES ('System','System','2024-05-03 19:43:34.121149','2024-05-03 19:43:34.121178','018d94d6bf254304bc33b22385ffd172','[\"email\", \"site_msg\"]','fd79e57a44ae4f019f1d5f73aa6c03f9'),('System','System','2024-05-03 19:43:34.387337','2024-05-03 19:43:34.387352','12f53629cc524a4a8047504145be2550','[\"email\", \"site_msg\"]','c6d99c23718548708613d8eefb3b12d8'),('System','System','2024-05-03 19:43:31.007496','2024-05-03 19:43:31.007518','164e92709b0c4716a5009300a3c8eaff','[\"email\", \"site_msg\"]','a2db1ceb33c24ff6ab33fd5d681a3794'),('System','System','2024-05-03 19:35:51.661607','2024-05-03 19:35:51.661632','25797d2d2c12433cb01324770815f6ad','[\"email\", \"site_msg\"]','a032aa0e42dd4a5aa6d162cb4a9aec87'),('System','System','2024-05-03 19:43:34.166681','2024-05-03 19:43:34.166700','27f4a686de854a4fa33a97aec4f8b6ee','[\"email\", \"site_msg\"]','0b5880bfd1c24e9e81d0e9c01a95f8f3'),(NULL,NULL,'2024-05-03 19:35:29.993478','2024-05-03 19:35:29.993497','89f1cf8eb2ac4f05a509321c98fe2a54','[\"site_msg\", \"email\"]','15e6ac8a16464d68a66f565af10e2921'),('System','System','2024-05-03 19:43:35.557278','2024-05-03 19:43:35.557301','91d0713ec7284266b5a46cc045aaa963','[\"email\", \"site_msg\"]','84efa71cc3204088829b796ccbf1811f'),('System','System','2024-05-03 19:40:35.518772','2024-05-03 19:40:35.518795','9506da788f5f431199bd1f5c59312e5d','[\"email\", \"site_msg\"]','a4b1119db81148cbadbe43ddbaa6318e'),('System','System','2024-05-03 19:43:40.771513','2024-05-03 19:43:40.771538','9987adb3f5d04a80bd43d6905301bb1c','[\"email\", \"site_msg\"]','12c404846ff5448bb4ca29c022bad500'),('System','System','2024-05-03 19:42:50.054568','2024-05-03 19:42:50.054587','ecd79af4e639407c98b0ded58f8ab073','[\"email\", \"site_msg\"]','1e597c6f1ce84818b3986aaef1e8f8c4'),('System','System','2024-05-03 19:43:34.374311','2024-05-03 19:43:34.374327','f4a51b0eaa8a4be7bcfaaee5810c5ba8','[\"email\", \"site_msg\"]','4cc1b8c528b248d2944931d3f8a9e467');
/*!40000 ALTER TABLE `notifications_usermsgsubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_adhoc`
--

DROP TABLE IF EXISTS `ops_adhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ops_adhoc` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `pattern` varchar(1024) NOT NULL,
  `module` varchar(128) NOT NULL,
  `args` varchar(8192) NOT NULL,
  `comment` varchar(1024) DEFAULT NULL,
  `creator_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ops_adhoc_name_org_id_creator_id_fbcccee4_uniq` (`name`,`org_id`,`creator_id`),
  KEY `ops_adhoc_creator_id_752f4ac3_fk_users_user_id` (`creator_id`),
  KEY `ops_adhoc_org_id_0219e57a` (`org_id`),
  CONSTRAINT `ops_adhoc_creator_id_752f4ac3_fk_users_user_id` FOREIGN KEY (`creator_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_adhoc`
--

LOCK TABLES `ops_adhoc` WRITE;
/*!40000 ALTER TABLE `ops_adhoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `ops_adhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_celerytask`
--

DROP TABLE IF EXISTS `ops_celerytask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ops_celerytask` (
  `id` char(32) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `date_last_publish` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_celerytask`
--

LOCK TABLES `ops_celerytask` WRITE;
/*!40000 ALTER TABLE `ops_celerytask` DISABLE KEYS */;
INSERT INTO `ops_celerytask` VALUES ('017c7d1f1aa747b6bb9b0d43cd6c150b','celery.chord',NULL),('02715ece2d34475d80dc687f4f859767','perms.tasks.check_asset_permission_expired',NULL),('04f336a173944b9eb8c6953d912c8fa5','celery.chunks',NULL),('05f31223ea714327afb628ce3bddacf3','terminal.tasks.run_applet_host_deployment_install_applet',NULL),('076766704a2a462b9ce1825454837925','common.tasks.upload_backup_to_obj_storage',NULL),('07a75aeca5824f5e848c016d8999d87b','users.tasks.check_password_expired_periodic',NULL),('0c2e54bde8974303b9743e5e5d7d03d8','celery.chain',NULL),('1358918726144cbe9cd336fbb1dc1ff1','accounts.tasks.remove_account.remove_accounts_task',NULL),('15f729403d2b4fc9afa413e588d251e2','ops.tasks.check_server_performance_period',NULL),('1c8aa3c39d1840608181a6a3cd88e539','users.tasks.check_unused_users',NULL),('1da5a2a3c680494c88c0cba3d9bb54ca','users.tasks.check_password_expired',NULL),('1f007f42361c4563811837d305ea00af','terminal.tasks.run_applet_host_deployment',NULL),('236e3d194e14491ab7c9831a60bf1681','audits.tasks.upload_ftp_file_to_external_storage',NULL),('24758af71d844a1f9a5b9c7012e464f6','terminal.tasks.delete_terminal_status_period',NULL),('2e78166982d24b1faf2bcc30c5117976','ops.tasks.run_ops_job',NULL),('2ee2857c38014d86ba7336ad6a4dbe68','authentication.tasks.clean_django_sessions',NULL),('2f1fac61bfae424cacafaedf906122b9','celery.group',NULL),('2fd4cf5937534f75921932f7a42349eb','celery.backend_cleanup',NULL),('2ff2574f80ac4b7da21aab2cb732a742','accounts.tasks.gather_accounts.gather_asset_accounts_task',NULL),('3739f512277d46b9bc21bbc3e9b9634a','assets.tasks.nodes_amount.check_node_assets_amount_task',NULL),('4544bdb743564308aef6923051b40e3a','assets.tasks.ping_gateway.test_gateways_connectivity_task',NULL),('458b200bb4904989b97ee57e44d11844','ops.tasks.create_or_update_registered_periodic_tasks',NULL),('4f7d2e7b9f624c628bb94147e1bbed2c','terminal.tasks.check_command_replay_storage_connectivity',NULL),('4feb857743114c3b91bcdf8ac4620978','ops.tasks.clean_up_unexpected_jobs',NULL),('51658299a2cb4943a337daafe071beda','accounts.tasks.automation.execute_account_automation_task',NULL),('5179234cef444c6eb6042899f9e1824d','settings.tasks.ldap.import_ldap_user',NULL),('6010bc3bb66a42158d7f0365e7b2a174','celery.accumulate',NULL),('6159c15699e94db8bc2d86ff96dd77aa','accounts.tasks.backup_account.execute_account_backup_task',NULL),('618744a89fa847cbab4249fdd099558f','accounts.tasks.template.template_sync_related_accounts',NULL),('691c0777f12e47ed95c1dd47e5ec540f','perms.tasks.check_asset_permission_will_expired',NULL),('6bf8d877b7e04d5399bab1f0772bad28','common.tasks.send_mail_async',NULL),('7dd3637bfc3d49cb8b5b4653018833ab','notifications.notifications.publish_task','2024-05-03 19:45:22.256993'),('8110497505b34049827a342cff5406c6','terminal.tasks.run_applet_host_deployment_uninstall_applet',NULL),('826b77dae2614f43b484c72b750dec4d','ops.tasks.clean_job_execution_period',NULL),('866477484a0948009ddd69799009bb83','terminal.tasks.clean_orphan_session','2024-05-03 19:43:48.661594'),('964ca057182f45ee80b3e4de4ad64f6c','terminal.tasks.upload_session_replay_to_external_storage',NULL),('9e2abb70db62431abcb2693e974d6269','celery.map',NULL),('a42c7de52a8f481d8fab5aad651b2404','accounts.tasks.verify_account.verify_accounts_connectivity_task',NULL),('a64b90a9c65b4aaba8be04589d7ef2aa','assets.tasks.gather_facts.gather_assets_facts_task',NULL),('a75943a0ad114d48b5c2e7504753c3b5','accounts.tasks.vault.sync_secret_to_vault',NULL),('aa66c8a885b744b2a9f88c7839123881','celery.chord_unlock',NULL),('b77fec88a6a44147845579d921f9f27f','ops.tasks.longtime_add',NULL),('b79378d8d91a4e55aceeb63f986b21bf','ops.tasks.clean_celery_periodic_tasks',NULL),('bc578a3bfa7d434baed06617cb289421','accounts.tasks.push_account.push_accounts_to_assets_task',NULL),('c030e47630c8498485733530ec8b50c5','assets.tasks.automation.execute_asset_automation_task',NULL),('c5ffe0037536475c88a1a7d88b0b574a','common.tasks.send_mail_attachment_async',NULL),('c710bac21b1042baa82e4cb1a619e750','accounts.tasks.automation.execute_automation_record_task',NULL),('c780495ff1bf4e48ac6bdc7d2070a50e','terminal.tasks.applet_host_generate_accounts',NULL),('c9749f0445dd4591876d43c6b4d4be34','celery.starmap',NULL),('d0715767916a463baf713974ee11e5a9','audits.tasks.clean_audits_log_period',NULL),('d0efc5f77b654449ac42a9eaae020bed','accounts.tasks.remove_account.clean_historical_accounts',NULL),('d115abc0940d423390b45bdf586f6b9d','users.tasks.check_user_expired',NULL),('d9b88732f79e49cfb4bbd185f6e7f8da','users.signal_handlers.clean_expired_user_session_period',NULL),('df80fcf745214a74a8ff2005136bf771','assets.tasks.ping.test_assets_connectivity_task',NULL),('e0f022a81a97402cb10e7453229a240e','users.tasks.check_user_expired_periodic',NULL),('e30181878bd646deb7b3f143f20cb5af','settings.tasks.ldap.import_ldap_user_periodic',NULL),('e4a1206c65064b7694c4adf606b643d7','orgs.tasks.refresh_org_cache_task',NULL),('e64e2c2850334fc39e77c75dd7b4dd0b','ops.tasks.run_ops_job_execution',NULL),('e8c3333a0fe14cffab9c6fa1434b9760','assets.tasks.nodes_amount.check_node_assets_amount_period_task',NULL),('f719c766633340fcba886b91f38823ce','common.utils.verify_code.send_async',NULL);
/*!40000 ALTER TABLE `ops_celerytask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_celerytaskexecution`
--

DROP TABLE IF EXISTS `ops_celerytaskexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ops_celerytaskexecution` (
  `id` char(32) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `args` json NOT NULL,
  `kwargs` json NOT NULL,
  `state` varchar(16) NOT NULL,
  `is_finished` tinyint(1) NOT NULL,
  `date_published` datetime(6) NOT NULL,
  `date_start` datetime(6) DEFAULT NULL,
  `date_finished` datetime(6) DEFAULT NULL,
  `creator_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ops_celerytaskexecution_creator_id_3ea35f11` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_celerytaskexecution`
--

LOCK TABLES `ops_celerytaskexecution` WRITE;
/*!40000 ALTER TABLE `ops_celerytaskexecution` DISABLE KEYS */;
INSERT INTO `ops_celerytaskexecution` VALUES ('13da2684b4274f66aa202c06ee7fd23f','users.tasks.check_password_expired_periodic','[]','{\"__current_lang\": \"zh\", \"__current_org_id\": \"00000000-0000-0000-0000-000000000000\"}','SUCCESS',1,'2024-05-03 19:43:48.587934','2024-05-03 19:43:48.678916','2024-05-03 19:43:48.830257',NULL),('1fe46511935f4dfc91e15b9da7cdef7a','terminal.tasks.clean_orphan_session','[]','{\"__current_lang\": \"zh\", \"__current_org_id\": \"00000000-0000-0000-0000-000000000000\"}','SUCCESS',1,'2024-05-03 19:43:48.661023','2024-05-03 19:43:48.699901','2024-05-03 19:43:48.819457',NULL),('2be8f19a10ef4afab59507645fff173c','notifications.notifications.publish_task','[]','{}','SUCCESS',1,'2024-05-03 19:45:22.256351','2024-05-03 19:45:23.260844','2024-05-03 19:45:23.314375',NULL),('5016f65f9f644bc0a8d750eaac9dd262','ops.tasks.create_or_update_registered_periodic_tasks','[]','{\"__current_lang\": \"zh\", \"__current_org_id\": \"00000000-0000-0000-0000-000000000000\"}','SUCCESS',1,'2024-05-03 19:43:48.624484','2024-05-03 19:43:48.690047','2024-05-03 19:43:49.249174',NULL),('827fbb3cff234d9c8d25af7de2bc04f5','users.tasks.check_user_expired_periodic','[]','{\"__current_lang\": \"zh\", \"__current_org_id\": \"00000000-0000-0000-0000-000000000000\"}','SUCCESS',1,'2024-05-03 19:43:48.601633','2024-05-03 19:43:48.683119','2024-05-03 19:43:48.856937',NULL),('c65bf9b1333b4bfa8d688be1e0f69c7b','ops.tasks.clean_celery_periodic_tasks','[]','{\"__current_lang\": \"zh\", \"__current_org_id\": \"00000000-0000-0000-0000-000000000000\"}','SUCCESS',1,'2024-05-03 19:43:48.613132','2024-05-03 19:43:48.688836','2024-05-03 19:43:48.752640',NULL),('db913f43cbb84c6c8c3c582bc50bb820','settings.tasks.ldap.import_ldap_user_periodic','[]','{\"__current_lang\": \"zh\", \"__current_org_id\": \"00000000-0000-0000-0000-000000000000\"}','SUCCESS',1,'2024-05-03 19:43:48.635638','2024-05-03 19:43:48.693826','2024-05-03 19:43:48.814739',NULL),('e8e3b77f349648d68db29052316a0108','terminal.tasks.delete_terminal_status_period','[]','{\"__current_lang\": \"zh\", \"__current_org_id\": \"00000000-0000-0000-0000-000000000000\"}','SUCCESS',1,'2024-05-03 19:43:48.646462','2024-05-03 19:43:48.698436','2024-05-03 19:43:48.821193',NULL);
/*!40000 ALTER TABLE `ops_celerytaskexecution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_historicaljob`
--

DROP TABLE IF EXISTS `ops_historicaljob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ops_historicaljob` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `is_periodic` tinyint(1) NOT NULL,
  `interval` int DEFAULT NULL,
  `crontab` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `instant` tinyint(1) NOT NULL,
  `args` varchar(8192) DEFAULT NULL,
  `module` varchar(128) DEFAULT NULL,
  `chdir` varchar(1024) DEFAULT NULL,
  `timeout` int NOT NULL,
  `type` varchar(128) NOT NULL,
  `runas` varchar(128) NOT NULL,
  `runas_policy` varchar(128) NOT NULL,
  `use_parameter_define` tinyint(1) NOT NULL,
  `parameters_define` json NOT NULL,
  `comment` varchar(1024) DEFAULT NULL,
  `version` int NOT NULL,
  `history_id` int NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `creator_id` char(32) DEFAULT NULL,
  `history_user_id` char(32) DEFAULT NULL,
  `playbook_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `ops_historicaljob_history_user_id_24f73504_fk_users_user_id` (`history_user_id`),
  KEY `ops_historicaljob_id_2bcb4391` (`id`),
  KEY `ops_historicaljob_org_id_c347a096` (`org_id`),
  KEY `ops_historicaljob_history_date_1de38f93` (`history_date`),
  KEY `ops_historicaljob_creator_id_aaf6cde7` (`creator_id`),
  KEY `ops_historicaljob_playbook_id_2998dc45` (`playbook_id`),
  CONSTRAINT `ops_historicaljob_history_user_id_24f73504_fk_users_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_historicaljob`
--

LOCK TABLES `ops_historicaljob` WRITE;
/*!40000 ALTER TABLE `ops_historicaljob` DISABLE KEYS */;
/*!40000 ALTER TABLE `ops_historicaljob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_job`
--

DROP TABLE IF EXISTS `ops_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ops_job` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `is_periodic` tinyint(1) NOT NULL,
  `interval` int DEFAULT NULL,
  `crontab` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `instant` tinyint(1) NOT NULL,
  `args` varchar(8192) DEFAULT NULL,
  `module` varchar(128) DEFAULT NULL,
  `chdir` varchar(1024) DEFAULT NULL,
  `timeout` int NOT NULL,
  `type` varchar(128) NOT NULL,
  `runas` varchar(128) NOT NULL,
  `runas_policy` varchar(128) NOT NULL,
  `use_parameter_define` tinyint(1) NOT NULL,
  `parameters_define` json NOT NULL,
  `comment` varchar(1024) DEFAULT NULL,
  `version` int NOT NULL,
  `creator_id` char(32) DEFAULT NULL,
  `playbook_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ops_job_name_org_id_creator_id_59234e57_uniq` (`name`,`org_id`,`creator_id`),
  KEY `ops_job_playbook_id_678fa32d_fk_ops_playbook_id` (`playbook_id`),
  KEY `ops_job_creator_id_a2f2bc66_fk_users_user_id` (`creator_id`),
  KEY `ops_job_org_id_0e25ddb8` (`org_id`),
  CONSTRAINT `ops_job_creator_id_a2f2bc66_fk_users_user_id` FOREIGN KEY (`creator_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `ops_job_playbook_id_678fa32d_fk_ops_playbook_id` FOREIGN KEY (`playbook_id`) REFERENCES `ops_playbook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_job`
--

LOCK TABLES `ops_job` WRITE;
/*!40000 ALTER TABLE `ops_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `ops_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_job_assets`
--

DROP TABLE IF EXISTS `ops_job_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ops_job_assets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` char(32) NOT NULL,
  `asset_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ops_job_assets_job_id_asset_id_a12c9edb_uniq` (`job_id`,`asset_id`),
  KEY `ops_job_assets_asset_id_357d00bf_fk_assets_asset_id` (`asset_id`),
  CONSTRAINT `ops_job_assets_asset_id_357d00bf_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`),
  CONSTRAINT `ops_job_assets_job_id_4078e66a_fk_ops_job_id` FOREIGN KEY (`job_id`) REFERENCES `ops_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_job_assets`
--

LOCK TABLES `ops_job_assets` WRITE;
/*!40000 ALTER TABLE `ops_job_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ops_job_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_jobexecution`
--

DROP TABLE IF EXISTS `ops_jobexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ops_jobexecution` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `task_id` char(32) DEFAULT NULL,
  `status` varchar(16) NOT NULL,
  `job_version` int NOT NULL,
  `parameters` json NOT NULL,
  `result` json DEFAULT NULL,
  `summary` json NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_start` datetime(6) DEFAULT NULL,
  `date_finished` datetime(6) DEFAULT NULL,
  `creator_id` char(32) DEFAULT NULL,
  `job_id` char(32) DEFAULT NULL,
  `job_type` varchar(128) NOT NULL,
  `material` varchar(8192) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ops_jobexecution_creator_id_86f1606d_fk_users_user_id` (`creator_id`),
  KEY `ops_jobexecution_job_id_b7480764_fk_ops_job_id` (`job_id`),
  KEY `ops_jobexecution_org_id_de9582a3` (`org_id`),
  KEY `ops_jobexecution_date_start_d5a3aa89` (`date_start`),
  CONSTRAINT `ops_jobexecution_creator_id_86f1606d_fk_users_user_id` FOREIGN KEY (`creator_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `ops_jobexecution_job_id_b7480764_fk_ops_job_id` FOREIGN KEY (`job_id`) REFERENCES `ops_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_jobexecution`
--

LOCK TABLES `ops_jobexecution` WRITE;
/*!40000 ALTER TABLE `ops_jobexecution` DISABLE KEYS */;
/*!40000 ALTER TABLE `ops_jobexecution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_playbook`
--

DROP TABLE IF EXISTS `ops_playbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ops_playbook` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `path` varchar(100) NOT NULL,
  `comment` varchar(1024) DEFAULT NULL,
  `creator_id` char(32) DEFAULT NULL,
  `create_method` varchar(128) NOT NULL,
  `vcs_url` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ops_playbook_name_org_id_creator_id_a6e7c68f_uniq` (`name`,`org_id`,`creator_id`),
  KEY `ops_playbook_creator_id_bc8eec56_fk_users_user_id` (`creator_id`),
  KEY `ops_playbook_org_id_c7d5b341` (`org_id`),
  CONSTRAINT `ops_playbook_creator_id_bc8eec56_fk_users_user_id` FOREIGN KEY (`creator_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_playbook`
--

LOCK TABLES `ops_playbook` WRITE;
/*!40000 ALTER TABLE `ops_playbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `ops_playbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgs_organization`
--

DROP TABLE IF EXISTS `orgs_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orgs_organization` (
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `builtin` tinyint(1) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgs_organization`
--

LOCK TABLES `orgs_organization` WRITE;
/*!40000 ALTER TABLE `orgs_organization` DISABLE KEYS */;
INSERT INTO `orgs_organization` VALUES ('00000000000000000000000000000002','Default','System','2024-05-03 19:33:48.477703','',1,'2024-05-03 19:35:36.685770',NULL),('00000000000000000000000000000004','SYSTEM','System','2024-05-03 19:35:36.579823','',1,'2024-05-03 19:35:36.685770',NULL);
/*!40000 ALTER TABLE `orgs_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perms_assetpermission`
--

DROP TABLE IF EXISTS `perms_assetpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perms_assetpermission` (
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_expired` datetime(6) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `date_start` datetime(6) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `actions` int NOT NULL,
  `from_ticket` tinyint(1) NOT NULL,
  `accounts` json NOT NULL DEFAULT (_utf8mb3'[]'),
  `date_updated` datetime(6) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `protocols` json NOT NULL DEFAULT (_utf8mb3'["all"]'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `perms_assetpermission_org_id_name_b3d2f01b_uniq` (`org_id`,`name`),
  KEY `perms_assetpermission_date_expired_c79fc11f` (`date_expired`),
  KEY `perms_assetpermission_date_start_d7ac30e1` (`date_start`),
  KEY `perms_assetpermission_org_id_9f38f32c` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perms_assetpermission`
--

LOCK TABLES `perms_assetpermission` WRITE;
/*!40000 ALTER TABLE `perms_assetpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `perms_assetpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perms_assetpermission_assets`
--

DROP TABLE IF EXISTS `perms_assetpermission_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perms_assetpermission_assets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetpermission_id` char(32) NOT NULL,
  `asset_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perms_assetpermission_as_assetpermission_id_asset_adf6202c_uniq` (`assetpermission_id`,`asset_id`),
  KEY `perms_assetpermissio_asset_id_d6920078_fk_assets_as` (`asset_id`),
  CONSTRAINT `perms_assetpermissio_asset_id_d6920078_fk_assets_as` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`),
  CONSTRAINT `perms_assetpermissio_assetpermission_id_df023b5e_fk_perms_ass` FOREIGN KEY (`assetpermission_id`) REFERENCES `perms_assetpermission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perms_assetpermission_assets`
--

LOCK TABLES `perms_assetpermission_assets` WRITE;
/*!40000 ALTER TABLE `perms_assetpermission_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `perms_assetpermission_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perms_assetpermission_nodes`
--

DROP TABLE IF EXISTS `perms_assetpermission_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perms_assetpermission_nodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetpermission_id` char(32) NOT NULL,
  `node_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perms_assetpermission_no_assetpermission_id_node__47f2e539_uniq` (`assetpermission_id`,`node_id`),
  KEY `perms_assetpermission_nodes_node_id_6b6f1697_fk_assets_node_id` (`node_id`),
  CONSTRAINT `perms_assetpermissio_assetpermission_id_368de545_fk_perms_ass` FOREIGN KEY (`assetpermission_id`) REFERENCES `perms_assetpermission` (`id`),
  CONSTRAINT `perms_assetpermission_nodes_node_id_6b6f1697_fk_assets_node_id` FOREIGN KEY (`node_id`) REFERENCES `assets_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perms_assetpermission_nodes`
--

LOCK TABLES `perms_assetpermission_nodes` WRITE;
/*!40000 ALTER TABLE `perms_assetpermission_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `perms_assetpermission_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perms_assetpermission_user_groups`
--

DROP TABLE IF EXISTS `perms_assetpermission_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perms_assetpermission_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetpermission_id` char(32) NOT NULL,
  `usergroup_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perms_assetpermission_us_assetpermission_id_userg_e11c51d6_uniq` (`assetpermission_id`,`usergroup_id`),
  KEY `perms_assetpermissio_usergroup_id_42dcdc91_fk_users_use` (`usergroup_id`),
  CONSTRAINT `perms_assetpermissio_assetpermission_id_1fb2ddd3_fk_perms_ass` FOREIGN KEY (`assetpermission_id`) REFERENCES `perms_assetpermission` (`id`),
  CONSTRAINT `perms_assetpermissio_usergroup_id_42dcdc91_fk_users_use` FOREIGN KEY (`usergroup_id`) REFERENCES `users_usergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perms_assetpermission_user_groups`
--

LOCK TABLES `perms_assetpermission_user_groups` WRITE;
/*!40000 ALTER TABLE `perms_assetpermission_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `perms_assetpermission_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perms_assetpermission_users`
--

DROP TABLE IF EXISTS `perms_assetpermission_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perms_assetpermission_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetpermission_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perms_assetpermission_us_assetpermission_id_user__3f3f1eaa_uniq` (`assetpermission_id`,`user_id`),
  KEY `perms_assetpermission_users_user_id_ba17aecc_fk_users_user_id` (`user_id`),
  CONSTRAINT `perms_assetpermissio_assetpermission_id_1f874915_fk_perms_ass` FOREIGN KEY (`assetpermission_id`) REFERENCES `perms_assetpermission` (`id`),
  CONSTRAINT `perms_assetpermission_users_user_id_ba17aecc_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perms_assetpermission_users`
--

LOCK TABLES `perms_assetpermission_users` WRITE;
/*!40000 ALTER TABLE `perms_assetpermission_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `perms_assetpermission_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perms_userassetgrantedtreenoderelation`
--

DROP TABLE IF EXISTS `perms_userassetgrantedtreenoderelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perms_userassetgrantedtreenoderelation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `node_key` varchar(64) NOT NULL,
  `node_parent_key` varchar(64) NOT NULL,
  `node_from` varchar(16) NOT NULL,
  `node_assets_amount` int NOT NULL,
  `node_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perms_userassetgrantedtreenoderelation_org_id_b5e76b66` (`org_id`),
  KEY `perms_userassetgrantedtreenoderelation_node_key_db373db6` (`node_key`),
  KEY `perms_userassetgrantedtreenoderelation_node_parent_key_3c7651a0` (`node_parent_key`),
  KEY `perms_userassetgrantedtreenoderelation_node_from_725273e2` (`node_from`),
  KEY `perms_userassetgrantedtreenoderelation_node_id_75f5af62` (`node_id`),
  KEY `perms_userassetgrantedtreenoderelation_user_id_fd11b13b` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perms_userassetgrantedtreenoderelation`
--

LOCK TABLES `perms_userassetgrantedtreenoderelation` WRITE;
/*!40000 ALTER TABLE `perms_userassetgrantedtreenoderelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `perms_userassetgrantedtreenoderelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_menupermission`
--

DROP TABLE IF EXISTS `rbac_menupermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_menupermission` (
  `id` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_menupermission`
--

LOCK TABLES `rbac_menupermission` WRITE;
/*!40000 ALTER TABLE `rbac_menupermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `rbac_menupermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role`
--

DROP TABLE IF EXISTS `rbac_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_role` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `scope` varchar(128) NOT NULL,
  `builtin` tinyint(1) NOT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_role_name_scope_f7fbc3c9_uniq` (`name`,`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role`
--

LOCK TABLES `rbac_role` WRITE;
/*!40000 ALTER TABLE `rbac_role` DISABLE KEYS */;
INSERT INTO `rbac_role` VALUES ('System','System','2024-05-03 19:35:35.448064','2024-05-03 19:43:30.618121','00000000000000000000000000000001','SystemAdmin','system',1,''),('System','System','2024-05-03 19:35:35.466860','2024-05-03 19:43:30.646982','00000000000000000000000000000002','SystemAuditor','system',1,''),('System','System','2024-05-03 19:35:35.507390','2024-05-03 19:43:30.715575','00000000000000000000000000000003','User','system',1,''),('System','System','2024-05-03 19:35:35.487671','2024-05-03 19:43:30.679496','00000000000000000000000000000004','SystemComponent','system',1,''),('System','System','2024-05-03 19:35:35.529265','2024-05-03 19:43:30.746814','00000000000000000000000000000005','OrgAdmin','org',1,''),('System','System','2024-05-03 19:35:35.552558','2024-05-03 19:43:30.776040','00000000000000000000000000000006','OrgAuditor','org',1,''),('System','System','2024-05-03 19:35:35.577258','2024-05-03 19:43:30.807939','00000000000000000000000000000007','OrgUser','org',1,'');
/*!40000 ALTER TABLE `rbac_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role_permissions`
--

DROP TABLE IF EXISTS `rbac_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_role_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` char(32) NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_role_permissions_role_id_permission_id_d01303da_uniq` (`role_id`,`permission_id`),
  KEY `rbac_role_permission_permission_id_f5e1e866_fk_auth_perm` (`permission_id`),
  CONSTRAINT `rbac_role_permission_permission_id_f5e1e866_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `rbac_role_permissions_role_id_d10416cb_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=713 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role_permissions`
--

LOCK TABLES `rbac_role_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_role_permissions` DISABLE KEYS */;
INSERT INTO `rbac_role_permissions` VALUES (1,'00000000000000000000000000000002',5),(2,'00000000000000000000000000000002',6),(7,'00000000000000000000000000000002',36),(17,'00000000000000000000000000000002',55),(6,'00000000000000000000000000000002',288),(8,'00000000000000000000000000000002',303),(11,'00000000000000000000000000000002',304),(13,'00000000000000000000000000000002',305),(14,'00000000000000000000000000000002',306),(15,'00000000000000000000000000000002',307),(19,'00000000000000000000000000000002',308),(22,'00000000000000000000000000000002',309),(23,'00000000000000000000000000000002',310),(5,'00000000000000000000000000000002',311),(18,'00000000000000000000000000000002',312),(21,'00000000000000000000000000000002',315),(25,'00000000000000000000000000000002',320),(26,'00000000000000000000000000000002',321),(27,'00000000000000000000000000000002',322),(29,'00000000000000000000000000000002',323),(45,'00000000000000000000000000000002',348),(46,'00000000000000000000000000000002',351),(47,'00000000000000000000000000000002',352),(48,'00000000000000000000000000000002',353),(49,'00000000000000000000000000000002',355),(52,'00000000000000000000000000000002',356),(58,'00000000000000000000000000000002',358),(59,'00000000000000000000000000000002',359),(61,'00000000000000000000000000000002',376),(3,'00000000000000000000000000000002',393),(4,'00000000000000000000000000000002',395),(9,'00000000000000000000000000000002',432),(10,'00000000000000000000000000000002',433),(12,'00000000000000000000000000000002',435),(16,'00000000000000000000000000000002',439),(20,'00000000000000000000000000000002',443),(24,'00000000000000000000000000000002',447),(28,'00000000000000000000000000000002',451),(31,'00000000000000000000000000000002',455),(35,'00000000000000000000000000000002',459),(36,'00000000000000000000000000000002',460),(37,'00000000000000000000000000000002',461),(38,'00000000000000000000000000000002',462),(39,'00000000000000000000000000000002',463),(40,'00000000000000000000000000000002',464),(41,'00000000000000000000000000000002',473),(42,'00000000000000000000000000000002',476),(43,'00000000000000000000000000000002',477),(44,'00000000000000000000000000000002',478),(50,'00000000000000000000000000000002',484),(51,'00000000000000000000000000000002',485),(53,'00000000000000000000000000000002',487),(54,'00000000000000000000000000000002',488),(55,'00000000000000000000000000000002',489),(56,'00000000000000000000000000000002',490),(57,'00000000000000000000000000000002',491),(60,'00000000000000000000000000000002',500),(30,'00000000000000000000000000000002',582),(34,'00000000000000000000000000000002',583),(32,'00000000000000000000000000000002',584),(33,'00000000000000000000000000000002',585),(612,'00000000000000000000000000000003',6),(614,'00000000000000000000000000000003',36),(623,'00000000000000000000000000000003',55),(613,'00000000000000000000000000000003',288),(615,'00000000000000000000000000000003',303),(616,'00000000000000000000000000000003',304),(617,'00000000000000000000000000000003',305),(618,'00000000000000000000000000000003',306),(619,'00000000000000000000000000000003',307),(620,'00000000000000000000000000000003',308),(621,'00000000000000000000000000000003',309),(622,'00000000000000000000000000000003',310),(625,'00000000000000000000000000000003',311),(624,'00000000000000000000000000000003',312),(626,'00000000000000000000000000000003',315),(627,'00000000000000000000000000000003',320),(628,'00000000000000000000000000000003',321),(629,'00000000000000000000000000000003',322),(630,'00000000000000000000000000000003',323),(634,'00000000000000000000000000000003',461),(635,'00000000000000000000000000000003',462),(636,'00000000000000000000000000000003',463),(637,'00000000000000000000000000000003',464),(638,'00000000000000000000000000000003',473),(639,'00000000000000000000000000000003',476),(640,'00000000000000000000000000000003',477),(641,'00000000000000000000000000000003',478),(642,'00000000000000000000000000000003',484),(643,'00000000000000000000000000000003',485),(644,'00000000000000000000000000000003',487),(645,'00000000000000000000000000000003',488),(646,'00000000000000000000000000000003',489),(647,'00000000000000000000000000000003',490),(648,'00000000000000000000000000000003',491),(649,'00000000000000000000000000000003',500),(631,'00000000000000000000000000000003',583),(632,'00000000000000000000000000000003',584),(633,'00000000000000000000000000000003',585),(337,'00000000000000000000000000000004',1),(338,'00000000000000000000000000000004',2),(339,'00000000000000000000000000000004',3),(340,'00000000000000000000000000000004',4),(341,'00000000000000000000000000000004',5),(342,'00000000000000000000000000000004',6),(343,'00000000000000000000000000000004',8),(344,'00000000000000000000000000000004',10),(345,'00000000000000000000000000000004',11),(346,'00000000000000000000000000000004',12),(347,'00000000000000000000000000000004',13),(348,'00000000000000000000000000000004',14),(349,'00000000000000000000000000000004',15),(350,'00000000000000000000000000000004',16),(351,'00000000000000000000000000000004',17),(352,'00000000000000000000000000000004',22),(353,'00000000000000000000000000000004',23),(354,'00000000000000000000000000000004',24),(355,'00000000000000000000000000000004',25),(356,'00000000000000000000000000000004',30),(357,'00000000000000000000000000000004',31),(358,'00000000000000000000000000000004',32),(359,'00000000000000000000000000000004',33),(360,'00000000000000000000000000000004',34),(361,'00000000000000000000000000000004',35),(362,'00000000000000000000000000000004',36),(363,'00000000000000000000000000000004',37),(364,'00000000000000000000000000000004',51),(365,'00000000000000000000000000000004',52),(366,'00000000000000000000000000000004',53),(367,'00000000000000000000000000000004',54),(368,'00000000000000000000000000000004',55),(369,'00000000000000000000000000000004',56),(370,'00000000000000000000000000000004',57),(371,'00000000000000000000000000000004',58),(372,'00000000000000000000000000000004',59),(373,'00000000000000000000000000000004',64),(374,'00000000000000000000000000000004',65),(375,'00000000000000000000000000000004',66),(376,'00000000000000000000000000000004',67),(377,'00000000000000000000000000000004',100),(378,'00000000000000000000000000000004',101),(379,'00000000000000000000000000000004',102),(380,'00000000000000000000000000000004',103),(381,'00000000000000000000000000000004',124),(382,'00000000000000000000000000000004',125),(383,'00000000000000000000000000000004',126),(384,'00000000000000000000000000000004',127),(385,'00000000000000000000000000000004',128),(386,'00000000000000000000000000000004',129),(387,'00000000000000000000000000000004',130),(388,'00000000000000000000000000000004',131),(389,'00000000000000000000000000000004',132),(390,'00000000000000000000000000000004',133),(391,'00000000000000000000000000000004',134),(392,'00000000000000000000000000000004',135),(393,'00000000000000000000000000000004',136),(394,'00000000000000000000000000000004',139),(395,'00000000000000000000000000000004',140),(396,'00000000000000000000000000000004',141),(397,'00000000000000000000000000000004',146),(398,'00000000000000000000000000000004',147),(399,'00000000000000000000000000000004',148),(400,'00000000000000000000000000000004',149),(401,'00000000000000000000000000000004',150),(402,'00000000000000000000000000000004',151),(403,'00000000000000000000000000000004',152),(404,'00000000000000000000000000000004',153),(405,'00000000000000000000000000000004',154),(406,'00000000000000000000000000000004',155),(407,'00000000000000000000000000000004',164),(408,'00000000000000000000000000000004',165),(409,'00000000000000000000000000000004',166),(410,'00000000000000000000000000000004',167),(411,'00000000000000000000000000000004',168),(412,'00000000000000000000000000000004',169),(413,'00000000000000000000000000000004',170),(414,'00000000000000000000000000000004',171),(415,'00000000000000000000000000000004',172),(416,'00000000000000000000000000000004',173),(417,'00000000000000000000000000000004',174),(418,'00000000000000000000000000000004',175),(419,'00000000000000000000000000000004',176),(420,'00000000000000000000000000000004',177),(421,'00000000000000000000000000000004',185),(422,'00000000000000000000000000000004',186),(423,'00000000000000000000000000000004',189),(424,'00000000000000000000000000000004',190),(425,'00000000000000000000000000000004',191),(426,'00000000000000000000000000000004',192),(427,'00000000000000000000000000000004',193),(428,'00000000000000000000000000000004',194),(429,'00000000000000000000000000000004',195),(430,'00000000000000000000000000000004',196),(431,'00000000000000000000000000000004',197),(432,'00000000000000000000000000000004',198),(433,'00000000000000000000000000000004',199),(434,'00000000000000000000000000000004',200),(435,'00000000000000000000000000000004',201),(436,'00000000000000000000000000000004',272),(437,'00000000000000000000000000000004',273),(438,'00000000000000000000000000000004',274),(439,'00000000000000000000000000000004',275),(440,'00000000000000000000000000000004',288),(441,'00000000000000000000000000000004',289),(442,'00000000000000000000000000000004',298),(443,'00000000000000000000000000000004',299),(444,'00000000000000000000000000000004',303),(445,'00000000000000000000000000000004',304),(446,'00000000000000000000000000000004',305),(447,'00000000000000000000000000000004',306),(448,'00000000000000000000000000000004',307),(449,'00000000000000000000000000000004',308),(450,'00000000000000000000000000000004',309),(451,'00000000000000000000000000000004',310),(452,'00000000000000000000000000000004',311),(453,'00000000000000000000000000000004',312),(454,'00000000000000000000000000000004',315),(455,'00000000000000000000000000000004',320),(456,'00000000000000000000000000000004',321),(457,'00000000000000000000000000000004',322),(458,'00000000000000000000000000000004',323),(459,'00000000000000000000000000000004',327),(460,'00000000000000000000000000000004',328),(461,'00000000000000000000000000000004',329),(462,'00000000000000000000000000000004',330),(463,'00000000000000000000000000000004',331),(464,'00000000000000000000000000000004',332),(465,'00000000000000000000000000000004',333),(466,'00000000000000000000000000000004',334),(467,'00000000000000000000000000000004',335),(468,'00000000000000000000000000000004',336),(469,'00000000000000000000000000000004',337),(470,'00000000000000000000000000000004',338),(471,'00000000000000000000000000000004',339),(472,'00000000000000000000000000000004',340),(473,'00000000000000000000000000000004',341),(474,'00000000000000000000000000000004',342),(475,'00000000000000000000000000000004',343),(476,'00000000000000000000000000000004',344),(477,'00000000000000000000000000000004',345),(478,'00000000000000000000000000000004',346),(479,'00000000000000000000000000000004',347),(480,'00000000000000000000000000000004',348),(481,'00000000000000000000000000000004',351),(482,'00000000000000000000000000000004',352),(483,'00000000000000000000000000000004',353),(484,'00000000000000000000000000000004',355),(485,'00000000000000000000000000000004',356),(486,'00000000000000000000000000000004',358),(487,'00000000000000000000000000000004',359),(488,'00000000000000000000000000000004',360),(489,'00000000000000000000000000000004',363),(490,'00000000000000000000000000000004',365),(491,'00000000000000000000000000000004',367),(492,'00000000000000000000000000000004',368),(493,'00000000000000000000000000000004',369),(494,'00000000000000000000000000000004',370),(495,'00000000000000000000000000000004',371),(496,'00000000000000000000000000000004',372),(497,'00000000000000000000000000000004',373),(498,'00000000000000000000000000000004',374),(499,'00000000000000000000000000000004',375),(500,'00000000000000000000000000000004',376),(501,'00000000000000000000000000000004',377),(502,'00000000000000000000000000000004',378),(503,'00000000000000000000000000000004',379),(504,'00000000000000000000000000000004',380),(505,'00000000000000000000000000000004',385),(506,'00000000000000000000000000000004',386),(507,'00000000000000000000000000000004',387),(508,'00000000000000000000000000000004',389),(509,'00000000000000000000000000000004',393),(510,'00000000000000000000000000000004',394),(511,'00000000000000000000000000000004',395),(512,'00000000000000000000000000000004',396),(513,'00000000000000000000000000000004',397),(514,'00000000000000000000000000000004',398),(515,'00000000000000000000000000000004',399),(516,'00000000000000000000000000000004',400),(517,'00000000000000000000000000000004',401),(518,'00000000000000000000000000000004',402),(519,'00000000000000000000000000000004',403),(520,'00000000000000000000000000000004',404),(521,'00000000000000000000000000000004',405),(522,'00000000000000000000000000000004',406),(523,'00000000000000000000000000000004',407),(524,'00000000000000000000000000000004',408),(525,'00000000000000000000000000000004',409),(526,'00000000000000000000000000000004',410),(527,'00000000000000000000000000000004',411),(528,'00000000000000000000000000000004',412),(529,'00000000000000000000000000000004',413),(530,'00000000000000000000000000000004',414),(531,'00000000000000000000000000000004',415),(532,'00000000000000000000000000000004',416),(533,'00000000000000000000000000000004',417),(534,'00000000000000000000000000000004',418),(535,'00000000000000000000000000000004',419),(536,'00000000000000000000000000000004',420),(537,'00000000000000000000000000000004',421),(538,'00000000000000000000000000000004',422),(539,'00000000000000000000000000000004',423),(540,'00000000000000000000000000000004',424),(541,'00000000000000000000000000000004',425),(542,'00000000000000000000000000000004',426),(543,'00000000000000000000000000000004',427),(544,'00000000000000000000000000000004',428),(545,'00000000000000000000000000000004',429),(546,'00000000000000000000000000000004',430),(547,'00000000000000000000000000000004',431),(548,'00000000000000000000000000000004',432),(549,'00000000000000000000000000000004',433),(550,'00000000000000000000000000000004',435),(551,'00000000000000000000000000000004',439),(552,'00000000000000000000000000000004',443),(553,'00000000000000000000000000000004',447),(554,'00000000000000000000000000000004',451),(555,'00000000000000000000000000000004',455),(556,'00000000000000000000000000000004',459),(557,'00000000000000000000000000000004',460),(558,'00000000000000000000000000000004',461),(559,'00000000000000000000000000000004',462),(560,'00000000000000000000000000000004',463),(561,'00000000000000000000000000000004',464),(562,'00000000000000000000000000000004',473),(563,'00000000000000000000000000000004',476),(564,'00000000000000000000000000000004',477),(565,'00000000000000000000000000000004',478),(566,'00000000000000000000000000000004',479),(567,'00000000000000000000000000000004',482),(568,'00000000000000000000000000000004',483),(569,'00000000000000000000000000000004',484),(570,'00000000000000000000000000000004',485),(571,'00000000000000000000000000000004',487),(572,'00000000000000000000000000000004',488),(573,'00000000000000000000000000000004',489),(574,'00000000000000000000000000000004',490),(575,'00000000000000000000000000000004',491),(576,'00000000000000000000000000000004',500),(577,'00000000000000000000000000000004',514),(578,'00000000000000000000000000000004',516),(579,'00000000000000000000000000000004',521),(580,'00000000000000000000000000000004',522),(581,'00000000000000000000000000000004',525),(582,'00000000000000000000000000000004',526),(583,'00000000000000000000000000000004',528),(584,'00000000000000000000000000000004',545),(585,'00000000000000000000000000000004',546),(586,'00000000000000000000000000000004',547),(587,'00000000000000000000000000000004',548),(588,'00000000000000000000000000000004',549),(589,'00000000000000000000000000000004',550),(590,'00000000000000000000000000000004',551),(591,'00000000000000000000000000000004',552),(592,'00000000000000000000000000000004',553),(593,'00000000000000000000000000000004',554),(594,'00000000000000000000000000000004',555),(595,'00000000000000000000000000000004',556),(596,'00000000000000000000000000000004',557),(597,'00000000000000000000000000000004',558),(598,'00000000000000000000000000000004',559),(599,'00000000000000000000000000000004',560),(600,'00000000000000000000000000000004',561),(601,'00000000000000000000000000000004',562),(602,'00000000000000000000000000000004',563),(603,'00000000000000000000000000000004',564),(604,'00000000000000000000000000000004',619),(605,'00000000000000000000000000000004',620),(606,'00000000000000000000000000000004',621),(607,'00000000000000000000000000000004',622),(608,'00000000000000000000000000000004',623),(609,'00000000000000000000000000000004',624),(610,'00000000000000000000000000000004',625),(611,'00000000000000000000000000000004',626),(654,'00000000000000000000000000000006',36),(664,'00000000000000000000000000000006',55),(653,'00000000000000000000000000000006',288),(655,'00000000000000000000000000000006',303),(658,'00000000000000000000000000000006',304),(660,'00000000000000000000000000000006',305),(661,'00000000000000000000000000000006',306),(662,'00000000000000000000000000000006',307),(666,'00000000000000000000000000000006',308),(669,'00000000000000000000000000000006',309),(670,'00000000000000000000000000000006',310),(652,'00000000000000000000000000000006',311),(665,'00000000000000000000000000000006',312),(668,'00000000000000000000000000000006',315),(672,'00000000000000000000000000000006',320),(673,'00000000000000000000000000000006',321),(674,'00000000000000000000000000000006',322),(676,'00000000000000000000000000000006',323),(684,'00000000000000000000000000000006',348),(685,'00000000000000000000000000000006',351),(686,'00000000000000000000000000000006',352),(687,'00000000000000000000000000000006',353),(688,'00000000000000000000000000000006',355),(689,'00000000000000000000000000000006',356),(690,'00000000000000000000000000000006',358),(691,'00000000000000000000000000000006',359),(650,'00000000000000000000000000000006',393),(651,'00000000000000000000000000000006',395),(656,'00000000000000000000000000000006',432),(657,'00000000000000000000000000000006',433),(659,'00000000000000000000000000000006',435),(663,'00000000000000000000000000000006',439),(667,'00000000000000000000000000000006',443),(671,'00000000000000000000000000000006',447),(675,'00000000000000000000000000000006',451),(678,'00000000000000000000000000000006',455),(682,'00000000000000000000000000000006',459),(683,'00000000000000000000000000000006',460),(677,'00000000000000000000000000000006',582),(681,'00000000000000000000000000000006',583),(679,'00000000000000000000000000000006',584),(680,'00000000000000000000000000000006',585),(701,'00000000000000000000000000000007',36),(710,'00000000000000000000000000000007',55),(700,'00000000000000000000000000000007',288),(702,'00000000000000000000000000000007',303),(703,'00000000000000000000000000000007',304),(704,'00000000000000000000000000000007',305),(705,'00000000000000000000000000000007',306),(706,'00000000000000000000000000000007',307),(707,'00000000000000000000000000000007',308),(708,'00000000000000000000000000000007',309),(709,'00000000000000000000000000000007',310),(699,'00000000000000000000000000000007',311),(711,'00000000000000000000000000000007',312),(712,'00000000000000000000000000000007',315),(692,'00000000000000000000000000000007',320),(693,'00000000000000000000000000000007',321),(694,'00000000000000000000000000000007',322),(695,'00000000000000000000000000000007',323),(696,'00000000000000000000000000000007',583),(697,'00000000000000000000000000000007',584),(698,'00000000000000000000000000000007',585);
/*!40000 ALTER TABLE `rbac_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_rolebinding`
--

DROP TABLE IF EXISTS `rbac_rolebinding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_rolebinding` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `scope` varchar(128) NOT NULL,
  `org_id` char(32) DEFAULT NULL,
  `role_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_rolebinding_user_id_role_id_org_id_7b7308f9_uniq` (`user_id`,`role_id`,`org_id`),
  KEY `rbac_rolebinding_org_id_8103bc19_fk_orgs_organization_id` (`org_id`),
  KEY `rbac_rolebinding_role_id_79cc1751_fk_rbac_role_id` (`role_id`),
  CONSTRAINT `rbac_rolebinding_org_id_8103bc19_fk_orgs_organization_id` FOREIGN KEY (`org_id`) REFERENCES `orgs_organization` (`id`),
  CONSTRAINT `rbac_rolebinding_role_id_79cc1751_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`),
  CONSTRAINT `rbac_rolebinding_user_id_d01064f7_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_rolebinding`
--

LOCK TABLES `rbac_rolebinding` WRITE;
/*!40000 ALTER TABLE `rbac_rolebinding` DISABLE KEYS */;
INSERT INTO `rbac_rolebinding` VALUES ('System','System','2024-05-03 19:43:34.394408','2024-05-03 19:43:34.394426','07bd0586b546463db60cfe19b88b168d','system',NULL,'00000000000000000000000000000004','c6d99c23718548708613d8eefb3b12d8',''),('System','System','2024-05-03 19:43:34.386618','2024-05-03 19:43:34.386635','0d3d85bd1c384a1e8a5d3dd5cdbea389','system',NULL,'00000000000000000000000000000004','4cc1b8c528b248d2944931d3f8a9e467',''),('System','System','2024-05-03 19:43:34.154711','2024-05-03 19:43:34.154731','0e22f87e4fd445fbbc5ca46c62a0764a','system','00000000000000000000000000000002','00000000000000000000000000000004','fd79e57a44ae4f019f1d5f73aa6c03f9',''),('System','System','2024-05-03 19:43:34.196551','2024-05-03 19:43:34.196580','316e80c131424878a9da2a063d2f2a28','system','00000000000000000000000000000002','00000000000000000000000000000004','0b5880bfd1c24e9e81d0e9c01a95f8f3',''),(NULL,NULL,'2024-05-03 19:35:35.777984','2024-05-03 19:35:35.778006','39d6dc48943446848892dd52b8d1ecc6','org','00000000000000000000000000000002','00000000000000000000000000000007','15e6ac8a16464d68a66f565af10e2921',''),('System','System','2024-05-03 19:43:35.563378','2024-05-03 19:43:35.563398','41d6c06922b84d42b3c8fd13b29e29fe','system',NULL,'00000000000000000000000000000004','84efa71cc3204088829b796ccbf1811f',''),('System','System','2024-05-03 19:42:50.019034','2024-05-03 19:42:50.019051','5150db0985874e3296929e59203be0f2','system','00000000000000000000000000000002','00000000000000000000000000000004','1e597c6f1ce84818b3986aaef1e8f8c4',''),('System','System','2024-05-03 19:43:35.588673','2024-05-03 19:43:35.588696','5268bf1b412a4e12b8a0d7473c7ab0ed','system','00000000000000000000000000000002','00000000000000000000000000000004','84efa71cc3204088829b796ccbf1811f',''),('System','System','2024-05-03 19:43:40.730509','2024-05-03 19:43:40.730528','538d427bcef143d3bf38ba53a877e1a6','system','00000000000000000000000000000002','00000000000000000000000000000004','12c404846ff5448bb4ca29c022bad500',''),('System','System','2024-05-03 19:35:51.618469','2024-05-03 19:35:51.618489','63e0fc1f0f4a47f9854e32adfb3dce19','system','00000000000000000000000000000002','00000000000000000000000000000004','a032aa0e42dd4a5aa6d162cb4a9aec87',''),('System','System','2024-05-03 19:43:34.411821','2024-05-03 19:43:34.411839','6973cbddd04e4ed589dbd09dc2962d96','system','00000000000000000000000000000002','00000000000000000000000000000004','4cc1b8c528b248d2944931d3f8a9e467',''),('System','System','2024-05-03 19:43:34.419656','2024-05-03 19:43:34.419674','8983def3581847be9488ce35b1bcd761','system','00000000000000000000000000000002','00000000000000000000000000000004','c6d99c23718548708613d8eefb3b12d8',''),(NULL,NULL,'2024-05-03 19:35:35.686580','2024-05-03 19:35:35.686602','9dd311ba0f3c413d86ed0f6d0615bc21','system',NULL,'00000000000000000000000000000001','15e6ac8a16464d68a66f565af10e2921',''),('System','System','2024-05-03 19:40:35.463955','2024-05-03 19:40:35.463972','a2a4f994be1b45b88d987f641807486f','system','00000000000000000000000000000002','00000000000000000000000000000004','a4b1119db81148cbadbe43ddbaa6318e',''),('System','System','2024-05-03 19:43:30.965200','2024-05-03 19:43:30.965217','ac30f034f4d3449d80fa7992f8acc73b','system','00000000000000000000000000000002','00000000000000000000000000000004','a2db1ceb33c24ff6ab33fd5d681a3794',''),('System','System','2024-05-03 19:43:34.129476','2024-05-03 19:43:34.129498','ae8d5ddd4531451eb4acbd2552dc73de','system',NULL,'00000000000000000000000000000004','fd79e57a44ae4f019f1d5f73aa6c03f9',''),('System','System','2024-05-03 19:43:34.172853','2024-05-03 19:43:34.172873','c87b0636ae104fd29feda879034e6262','system',NULL,'00000000000000000000000000000004','0b5880bfd1c24e9e81d0e9c01a95f8f3','');
/*!40000 ALTER TABLE `rbac_rolebinding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_chatprompt`
--

DROP TABLE IF EXISTS `settings_chatprompt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings_chatprompt` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `content` longtext NOT NULL,
  `builtin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_chatprompt`
--

LOCK TABLES `settings_chatprompt` WRITE;
/*!40000 ALTER TABLE `settings_chatprompt` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings_chatprompt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_setting`
--

DROP TABLE IF EXISTS `settings_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `value` longtext,
  `enabled` tinyint(1) NOT NULL,
  `comment` longtext NOT NULL,
  `category` varchar(128) NOT NULL,
  `encrypted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_setting`
--

LOCK TABLES `settings_setting` WRITE;
/*!40000 ALTER TABLE `settings_setting` DISABLE KEYS */;
INSERT INTO `settings_setting` VALUES (1,'TERMINAL_HOST_KEY','\"-----BEGIN RSA PRIVATE KEY-----\\nMIIEpAIBAAKCAQEAvkq+cF/k6UONYxIvEiCwYH9MIcEeAu5o2eR/4oZcT2XYXppK\\nOgUlxUT8Q7P3xoU3+5GEOvCodbD3uYYJOnEB5YdoF6NI/kuQ2aNesCwtFdL48gU8\\nEbHGTCRXvDOypv5H0Ki5W3jwvbjOvIeeRAMspnJzr0l5Mmci5t6nXlLRa7D0Pon0\\nmm95VsJ+ZcMDNy5incACkBm9PtL0ZzsQNUJv2Z3A2ZkP49/lzNf5Fz9CaHbZ/pg7\\ntkMkN4iknTjYEXrzKFdSgXao16NtHJIVUVwLM7BoAAmSJm9oPrxnbjSqbZNNpClw\\neygJnocCIpeXdmmD3KZmTaEDlES9MbAxOVXVCQIDAQABAoIBAADAtHCm3HW0w/Qq\\nn/+LHA+BqWgvxqHd1hHYls3rWKWiwkCbjSQeHZhibboJ1fbV05Md7/84sP3oMY6t\\nEk/GHysMhlOjnHgPDfdib080mYgO0dfJQAPU53MpKKSwsqn48wlHBZawS4mAl+bE\\nhZKAzbYp2T3OBVn28PsnUdOscbIimxGC+fk9OATaa7is0C3/YMtQAHZYgppeM6Hg\\nzG2ZOtsTq8PVdJNbH7PEO+GBySk5zX4ixazAxc3zUkFAWwDbUgRb3jcPSuBeX853\\n8cZ1WdoyEhMwT2DGV3ri5j4F6FHu3TliPiBNGX8eB+DiQ7SeFZCXaLXGnwmF83Wt\\no572KjUCgYEA41XN3HjAc4o9Q9ClI9yILnkfrfDvQrmTYxakUdaatXXQwyQcanvy\\nGkTReZHEecyIvURjuhgUqvgUp60qFbWZrdhCNZ77kFoz284w5goduF8GaWFk0QpX\\nbmml5l1J2Z+eGSaejWEItLeI0+6xxlQpY5y1vf2jkTOTIg0oFJv7il0CgYEA1kk3\\nDFDkVnP0feHbm+ZRfMfCX6JnAukszjY+EC8Z00RsIQGNB1noTnqCxeMfxWNvAeEx\\n+k97r5W7YFpZD6pPf2VtK8SaQ4hMF8GqQ17RZUy3jUyM/ULhqSD+rZQaHzftpNEE\\nFqdaiEh6W7Xa3dcp+ZCw6ko7WQ4BXE+iuYWeQp0CgYEAzxyuB22vj9PiyvS8bvaM\\nzyIknXjC0hx1zbGkFLcajbV/czlj9hNj11DZMxN9V6Xi8ePro3Aq7DRFxRl7HPos\\nv3gloepsr++uDVRFsl6HAyD3m2xSyCvOydXQghZ9oJnOFIXdr1o270XCj6qIJfMp\\nHgp4fVYl/bRqGHy6BkSxnzUCgYEAz9g+E60WfSCFgeAjkaipW12qk/ZC8ljXA8Er\\nG6mD5B6WvsDxWLMFF7HOzEBLnbqffnQ+dKrJrnqOP5wCjKZF66ymYnCUrHI0VEqd\\najE664Wo993LVw+bL9/4BscDO0qVL2spCwwSTOP4AqJ2gvxjE1UbtHSB8hQaj74S\\neN44riUCgYAWjNd8aHaJKX9dgN8KS9zMel3feuSB70KnQsxBPBVMUB2OSq8zQWqZ\\nZ/mCCieIfzKLt37sFM+3ZvrpuoG2KgHq39x7vQ0laVXfodsAHDj6bmdsIiZkUf94\\n9rIR/Yxyk/ge48/W1PfaTctCI3/M/CRx6Pg4y9iQR2sfhIMBO9XZ1A==\\n-----END RSA PRIVATE KEY-----\\n\"',1,'','default',0);
/*!40000 ALTER TABLE `settings_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal` (
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `remote_addr` varchar(128) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `command_storage` varchar(128) NOT NULL,
  `replay_storage` varchar(128) NOT NULL,
  `type` varchar(64) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `terminal_user_id_1e402800_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal`
--

LOCK TABLES `terminal` WRITE;
/*!40000 ALTER TABLE `terminal` DISABLE KEYS */;
INSERT INTO `terminal` VALUES ('0bcbb5bb61fd43e08535b551c5e141ac','[Core]-798a58efc3dc','172.22.0.4',0,'2024-05-03 19:43:30.938665','','a2db1ceb33c24ff6ab33fd5d681a3794','default','default','core','System','2024-05-03 19:46:31.103975','System'),('172351abd44b4adca5df00ceb69a1346','[Core]-1834bc8b0858','172.22.0.4',0,'2024-05-03 19:35:51.593378','','a032aa0e42dd4a5aa6d162cb4a9aec87','default','default','core','System','2024-05-03 19:39:51.765895','System'),('2d445366c5ad486cb8ef2a20159b844d','[Core]-3fa8f5496dac','172.22.0.3',0,'2024-05-03 19:40:35.422976','','a4b1119db81148cbadbe43ddbaa6318e','default','default','core','System','2024-05-03 19:41:35.580969','System'),('3e883ec40dfc49db890f7d9a6bef1748','[Kael]-7b84a9cdc22c-SeTQIPH','172.22.0.5',0,'2024-05-03 19:43:34.160465','kael','0b5880bfd1c24e9e81d0e9c01a95f8f3','default','default','kael','System','2024-05-03 19:43:34.179132','System'),('4a8563c945b346089007249e9104b6d9','[Lion]-0c2d47257e99-tNejTuI','172.22.0.8',0,'2024-05-03 19:43:35.551486','lion','84efa71cc3204088829b796ccbf1811f','default','default','lion','System','2024-05-03 19:43:35.569824','System'),('7dc72e42f8ac49b6af45b3e229d8be85','[Core]-6aa50ad02453','172.22.0.3',0,'2024-05-03 19:42:49.995137','','1e597c6f1ce84818b3986aaef1e8f8c4','default','default','core','System','2024-05-03 19:42:50.087177','System'),('80bca7a16fe24739a04c8d41f0701c3e','[Magnus]-28eec2c762b0-eeuXBeF','172.22.0.7',0,'2024-05-03 19:43:34.367552','magnus','4cc1b8c528b248d2944931d3f8a9e467','default','default','magnus','System','2024-05-03 19:43:34.396154','System'),('d851f3a9ce174a189d8b238c5ef22a3f','[KoKo]-c3d9362813af-lqLJgiC','172.22.0.9',0,'2024-05-03 19:43:34.379927','koko','c6d99c23718548708613d8eefb3b12d8','default','default','koko','System','2024-05-03 19:43:34.402602','System'),('dbc5f48e48fc4059843a5a838d6e0fc8','[Celery]-08d8886f7229','172.22.0.6',0,'2024-05-03 19:43:40.705141','','12c404846ff5448bb4ca29c022bad500','default','default','celery','System','2024-05-03 19:46:40.863954','System'),('efe54234985e4e6b83dd58e6d789e03f','[Chen]-537df41fa1a0-VAGyfIW','172.22.0.11',0,'2024-05-03 19:43:34.107025','chen','fd79e57a44ae4f019f1d5f73aa6c03f9','default','default','chen','System','2024-05-03 19:43:34.136568','System');
/*!40000 ALTER TABLE `terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_applet`
--

DROP TABLE IF EXISTS `terminal_applet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_applet` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `display_name` varchar(128) NOT NULL,
  `version` varchar(16) NOT NULL,
  `author` varchar(128) NOT NULL,
  `type` varchar(16) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `builtin` tinyint(1) NOT NULL,
  `protocols` json NOT NULL,
  `tags` json NOT NULL,
  `comment` longtext NOT NULL,
  `can_concurrent` tinyint(1) NOT NULL,
  `edition` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_applet`
--

LOCK TABLES `terminal_applet` WRITE;
/*!40000 ALTER TABLE `terminal_applet` DISABLE KEYS */;
INSERT INTO `terminal_applet` VALUES ('System','System','2024-05-03 19:35:51.518825','2024-05-03 19:43:30.846913','2749d4920c444a539dd3c29d22e5fb12','chrome','Chrome 浏览器','1.0','JumpServer Team','web',1,1,'[\"http\"]','[\"web\"]','Chrome 浏览器打开网页地址',0,'community'),('System','System','2024-05-03 19:35:51.545120','2024-05-03 19:43:30.865831','d569adc0d1484536aad497ab01f06d4c','dbeaver','DBeaver 社区版','0.2','JumpServer Team','general',1,1,'[\"mysql\", \"mariadb\", \"postgresql\", \"sqlserver\", \"oracle\"]','[\"database\"]','免费的多平台数据库工具，供开发人员、数据库管理员、分析师和所有需要使用数据库的人使用。',0,'community');
/*!40000 ALTER TABLE `terminal_applet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_applethost`
--

DROP TABLE IF EXISTS `terminal_applethost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_applethost` (
  `host_ptr_id` char(32) NOT NULL,
  `deploy_options` json NOT NULL,
  `inited` tinyint(1) NOT NULL,
  `date_inited` datetime(6) DEFAULT NULL,
  `date_synced` datetime(6) DEFAULT NULL,
  `terminal_id` char(32) DEFAULT NULL,
  `accounts_create_amount` int NOT NULL,
  `auto_create_accounts` tinyint(1) NOT NULL,
  `using_same_account` tinyint(1) NOT NULL,
  PRIMARY KEY (`host_ptr_id`),
  UNIQUE KEY `terminal_id` (`terminal_id`),
  CONSTRAINT `terminal_applethost_host_ptr_id_1b2e200b_fk_assets_ho` FOREIGN KEY (`host_ptr_id`) REFERENCES `assets_host` (`asset_ptr_id`),
  CONSTRAINT `terminal_applethost_terminal_id_0a67b317_fk_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_applethost`
--

LOCK TABLES `terminal_applethost` WRITE;
/*!40000 ALTER TABLE `terminal_applethost` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_applethost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_applethostdeployment`
--

DROP TABLE IF EXISTS `terminal_applethostdeployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_applethostdeployment` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `initial` tinyint(1) NOT NULL,
  `status` varchar(16) NOT NULL,
  `date_start` datetime(6) DEFAULT NULL,
  `date_finished` datetime(6) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `task` char(32) DEFAULT NULL,
  `host_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `terminal_applethostd_host_id_a517cbd3_fk_terminal_` (`host_id`),
  KEY `terminal_applethostdeployment_date_start_8f0847d0` (`date_start`),
  CONSTRAINT `terminal_applethostd_host_id_a517cbd3_fk_terminal_` FOREIGN KEY (`host_id`) REFERENCES `terminal_applethost` (`host_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_applethostdeployment`
--

LOCK TABLES `terminal_applethostdeployment` WRITE;
/*!40000 ALTER TABLE `terminal_applethostdeployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_applethostdeployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_appletpublication`
--

DROP TABLE IF EXISTS `terminal_appletpublication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_appletpublication` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `status` varchar(16) NOT NULL,
  `comment` longtext NOT NULL,
  `applet_id` char(32) NOT NULL,
  `host_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `terminal_appletpublication_applet_id_host_id_96fdf64c_uniq` (`applet_id`,`host_id`),
  KEY `terminal_appletpubli_host_id_3c885a74_fk_terminal_` (`host_id`),
  CONSTRAINT `terminal_appletpubli_applet_id_4d1e569c_fk_terminal_` FOREIGN KEY (`applet_id`) REFERENCES `terminal_applet` (`id`),
  CONSTRAINT `terminal_appletpubli_host_id_3c885a74_fk_terminal_` FOREIGN KEY (`host_id`) REFERENCES `terminal_applethost` (`host_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_appletpublication`
--

LOCK TABLES `terminal_appletpublication` WRITE;
/*!40000 ALTER TABLE `terminal_appletpublication` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_appletpublication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_appprovider`
--

DROP TABLE IF EXISTS `terminal_appprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_appprovider` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `hostname` varchar(128) NOT NULL,
  `terminal_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `terminal_id` (`terminal_id`),
  CONSTRAINT `terminal_appprovider_terminal_id_b1b3b6d2_fk_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_appprovider`
--

LOCK TABLES `terminal_appprovider` WRITE;
/*!40000 ALTER TABLE `terminal_appprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_appprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_command`
--

DROP TABLE IF EXISTS `terminal_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_command` (
  `id` char(32) NOT NULL,
  `user` varchar(64) NOT NULL,
  `asset` varchar(128) NOT NULL,
  `account` varchar(64) NOT NULL,
  `input` varchar(128) NOT NULL,
  `output` varchar(1024) NOT NULL,
  `session` varchar(36) NOT NULL,
  `timestamp` int NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `risk_level` smallint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `terminal_command_input_9acfd946` (`input`),
  KEY `terminal_command_session_62eaa2c3` (`session`),
  KEY `terminal_command_timestamp_85bc8045` (`timestamp`),
  KEY `terminal_command_asset_a8743384` (`asset`),
  KEY `terminal_command_system_user_224671ed` (`account`),
  KEY `terminal_command_user_62507ff6` (`user`),
  KEY `terminal_command_org_id_b29da48e` (`org_id`),
  KEY `terminal_command_risk_level_570e11b6` (`risk_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_command`
--

LOCK TABLES `terminal_command` WRITE;
/*!40000 ALTER TABLE `terminal_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_commandstorage`
--

DROP TABLE IF EXISTS `terminal_commandstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_commandstorage` (
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(16) NOT NULL,
  `meta` longtext NOT NULL,
  `comment` longtext NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_commandstorage`
--

LOCK TABLES `terminal_commandstorage` WRITE;
/*!40000 ALTER TABLE `terminal_commandstorage` DISABLE KEYS */;
INSERT INTO `terminal_commandstorage` VALUES ('0a30e4f07ce646d08d9b2e3e17868280','System','2024-05-03 19:32:53.666677','2024-05-03 19:32:53.666700','null','null','GTYeFMb9csLTnA/E8fyUAQ==YafovWxedJKCBv6j0txlDQ==aNB2JTyjTyKY+DS2vlh8KA==pe4=','Do not save',0,NULL),('66f53a57632d45079ea8399560d79c03','System','2024-05-03 19:32:53.669966','2024-05-03 19:32:55.760834','default','server','ir4oheEORQPimfjEEspBOw==m1P3kK1Nr8zBNvBlNtQjvg==nzubhXuxy5AsQKiSvspDPg==bdg=','Store locally',1,NULL);
/*!40000 ALTER TABLE `terminal_commandstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_endpoint`
--

DROP TABLE IF EXISTS `terminal_endpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_endpoint` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `host` varchar(256) NOT NULL,
  `https_port` int NOT NULL,
  `http_port` int NOT NULL,
  `ssh_port` int NOT NULL,
  `rdp_port` int NOT NULL,
  `comment` longtext NOT NULL,
  `mariadb_port` int NOT NULL,
  `mysql_port` int NOT NULL,
  `postgresql_port` int NOT NULL,
  `redis_port` int NOT NULL,
  `sqlserver_port` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_endpoint`
--

LOCK TABLES `terminal_endpoint` WRITE;
/*!40000 ALTER TABLE `terminal_endpoint` DISABLE KEYS */;
INSERT INTO `terminal_endpoint` VALUES ('System','System','2024-05-03 19:32:57.531273','2024-05-03 19:32:57.531294','00000000000000000000000000000001','Default','',0,0,2222,3389,'',33062,33061,54320,63790,14330);
/*!40000 ALTER TABLE `terminal_endpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_endpointrule`
--

DROP TABLE IF EXISTS `terminal_endpointrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_endpointrule` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `ip_group` json NOT NULL,
  `priority` int NOT NULL,
  `comment` longtext NOT NULL,
  `endpoint_id` char(32) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `priority` (`priority`),
  KEY `terminal_endpointrul_endpoint_id_69dfcdf2_fk_terminal_` (`endpoint_id`),
  CONSTRAINT `terminal_endpointrul_endpoint_id_69dfcdf2_fk_terminal_` FOREIGN KEY (`endpoint_id`) REFERENCES `terminal_endpoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_endpointrule`
--

LOCK TABLES `terminal_endpointrule` WRITE;
/*!40000 ALTER TABLE `terminal_endpointrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_endpointrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_replaystorage`
--

DROP TABLE IF EXISTS `terminal_replaystorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_replaystorage` (
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(16) NOT NULL,
  `meta` longtext NOT NULL,
  `comment` longtext NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_replaystorage`
--

LOCK TABLES `terminal_replaystorage` WRITE;
/*!40000 ALTER TABLE `terminal_replaystorage` DISABLE KEYS */;
INSERT INTO `terminal_replaystorage` VALUES ('13a7215a995a440eb42fa0f08870741b','System','2024-05-03 19:32:53.697080','2024-05-03 19:32:55.762768','default','server','DYf8iMyLMFvJYqEfwGF36A==O23dyDY1ttTJWT06EJxmww==t3+/+u0lKZ3kSBZfG81aFw==RsI=','Store locally',1,NULL),('b944df01c36a4c6ba1ae98faede57e05','System','2024-05-03 19:32:53.694803','2024-05-03 19:32:53.694827','null','null','zM5D++wzBmxxoYdVGE5KUw==5oZwBwnaAam36ggNJxc0iA==CumTWXIuiWB2HpYgqA7qvA==yRw=','Do not save',0,NULL);
/*!40000 ALTER TABLE `terminal_replaystorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_session`
--

DROP TABLE IF EXISTS `terminal_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_session` (
  `id` char(32) NOT NULL,
  `user` varchar(128) NOT NULL,
  `asset` varchar(128) NOT NULL,
  `account` varchar(128) NOT NULL,
  `login_from` varchar(2) NOT NULL,
  `is_finished` tinyint(1) NOT NULL,
  `has_replay` tinyint(1) NOT NULL,
  `has_command` tinyint(1) NOT NULL,
  `date_start` datetime(6) NOT NULL,
  `date_end` datetime(6) DEFAULT NULL,
  `terminal_id` char(32) DEFAULT NULL,
  `remote_addr` varchar(128) DEFAULT NULL,
  `protocol` varchar(16) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `asset_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `comment` longtext,
  `type` varchar(16) NOT NULL,
  `account_id` varchar(128) NOT NULL,
  `cmd_amount` int NOT NULL,
  `error_reason` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `terminal_session_terminal_id_5278f31c_fk_terminal_id` (`terminal_id`),
  KEY `terminal_session_date_start_5c59d95b` (`date_start`),
  KEY `terminal_session_org_id_9e113282` (`org_id`),
  KEY `terminal_session_asset_fe247cfd` (`asset`),
  KEY `terminal_session_protocol_3181452c` (`protocol`),
  KEY `terminal_session_system_user_a2adfea6` (`account`),
  KEY `terminal_session_user_6910eb8f` (`user`),
  KEY `terminal_session_asset_id_f655dd49` (`asset_id`),
  KEY `terminal_session_user_id_a0fe42e0` (`user_id`),
  KEY `terminal_session_is_finished_a89c8792` (`is_finished`),
  KEY `terminal_session_is_success_13e3ce88` (`is_success`),
  KEY `terminal_session_type_d749168b` (`type`),
  KEY `terminal_session_account_id_b72ef6f8` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_session`
--

LOCK TABLES `terminal_session` WRITE;
/*!40000 ALTER TABLE `terminal_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_sessionjoinrecord`
--

DROP TABLE IF EXISTS `terminal_sessionjoinrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_sessionjoinrecord` (
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `verify_code` varchar(16) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `date_left` datetime(6) DEFAULT NULL,
  `remote_addr` varchar(128) DEFAULT NULL,
  `login_from` varchar(2) NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `is_finished` tinyint(1) NOT NULL,
  `joiner_id` char(32) DEFAULT NULL,
  `session_id` char(32) NOT NULL,
  `sharing_id` char(32) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `terminal_sessionjoinrecord_joiner_id_72515369_fk_users_user_id` (`joiner_id`),
  KEY `terminal_sessionjoin_session_id_52f46320_fk_terminal_` (`session_id`),
  KEY `terminal_sessionjoin_sharing_id_32e6c9f5_fk_terminal_` (`sharing_id`),
  KEY `terminal_sessionjoinrecord_org_id_053ec401` (`org_id`),
  KEY `terminal_sessionjoinrecord_date_joined_1b50df56` (`date_joined`),
  KEY `terminal_sessionjoinrecord_date_left_c71ae289` (`date_left`),
  KEY `terminal_sessionjoinrecord_remote_addr_e975ba2a` (`remote_addr`),
  KEY `terminal_sessionjoinrecord_is_success_7c817cde` (`is_success`),
  KEY `terminal_sessionjoinrecord_is_finished_d4adf288` (`is_finished`),
  CONSTRAINT `terminal_sessionjoin_session_id_52f46320_fk_terminal_` FOREIGN KEY (`session_id`) REFERENCES `terminal_session` (`id`),
  CONSTRAINT `terminal_sessionjoin_sharing_id_32e6c9f5_fk_terminal_` FOREIGN KEY (`sharing_id`) REFERENCES `terminal_sessionsharing` (`id`),
  CONSTRAINT `terminal_sessionjoinrecord_joiner_id_72515369_fk_users_user_id` FOREIGN KEY (`joiner_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_sessionjoinrecord`
--

LOCK TABLES `terminal_sessionjoinrecord` WRITE;
/*!40000 ALTER TABLE `terminal_sessionjoinrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_sessionjoinrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_sessionreplay`
--

DROP TABLE IF EXISTS `terminal_sessionreplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_sessionreplay` (
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `session_id` char(32) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `terminal_sessionrepl_session_id_228568d3_fk_terminal_` (`session_id`),
  CONSTRAINT `terminal_sessionrepl_session_id_228568d3_fk_terminal_` FOREIGN KEY (`session_id`) REFERENCES `terminal_session` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_sessionreplay`
--

LOCK TABLES `terminal_sessionreplay` WRITE;
/*!40000 ALTER TABLE `terminal_sessionreplay` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_sessionreplay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_sessionsharing`
--

DROP TABLE IF EXISTS `terminal_sessionsharing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_sessionsharing` (
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `verify_code` varchar(16) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `expired_time` int NOT NULL,
  `creator_id` char(32) DEFAULT NULL,
  `session_id` char(32) NOT NULL,
  `users` longtext NOT NULL DEFAULT (_utf8mb3''),
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `updated_by` varchar(128) DEFAULT NULL,
  `action_permission` varchar(16) NOT NULL,
  `origin` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `terminal_sessionsharing_creator_id_bb273804_fk_users_user_id` (`creator_id`),
  KEY `terminal_sessionshar_session_id_f302e994_fk_terminal_` (`session_id`),
  KEY `terminal_sessionsharing_org_id_0b959af3` (`org_id`),
  KEY `terminal_sessionsharing_is_active_c604d0ce` (`is_active`),
  KEY `terminal_sessionsharing_expired_time_26d5cf9b` (`expired_time`),
  CONSTRAINT `terminal_sessionshar_session_id_f302e994_fk_terminal_` FOREIGN KEY (`session_id`) REFERENCES `terminal_session` (`id`),
  CONSTRAINT `terminal_sessionsharing_creator_id_bb273804_fk_users_user_id` FOREIGN KEY (`creator_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_sessionsharing`
--

LOCK TABLES `terminal_sessionsharing` WRITE;
/*!40000 ALTER TABLE `terminal_sessionsharing` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_sessionsharing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_status`
--

DROP TABLE IF EXISTS `terminal_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_status` (
  `id` char(32) NOT NULL,
  `session_online` int NOT NULL,
  `memory_used` double NOT NULL,
  `connections` int NOT NULL,
  `threads` int NOT NULL,
  `boot_time` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `terminal_id` char(32) DEFAULT NULL,
  `cpu_load` double NOT NULL,
  `disk_used` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `terminal_status_terminal_id_b57e6176_fk_terminal_id` (`terminal_id`),
  CONSTRAINT `terminal_status_terminal_id_b57e6176_fk_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_status`
--

LOCK TABLES `terminal_status` WRITE;
/*!40000 ALTER TABLE `terminal_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_task`
--

DROP TABLE IF EXISTS `terminal_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_task` (
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `args` varchar(1024) NOT NULL,
  `is_finished` tinyint(1) NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_finished` datetime(6) DEFAULT NULL,
  `terminal_id` char(32) DEFAULT NULL,
  `kwargs` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `created_by` varchar(128) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `terminal_task_terminal_id_55577303_fk_terminal_id` (`terminal_id`),
  CONSTRAINT `terminal_task_terminal_id_55577303_fk_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_task`
--

LOCK TABLES `terminal_task` WRITE;
/*!40000 ALTER TABLE `terminal_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_virtualapp`
--

DROP TABLE IF EXISTS `terminal_virtualapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_virtualapp` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `display_name` varchar(128) NOT NULL,
  `version` varchar(16) NOT NULL,
  `author` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `protocols` json NOT NULL,
  `image_name` varchar(128) NOT NULL,
  `image_protocol` varchar(16) NOT NULL,
  `image_port` int NOT NULL,
  `comment` longtext NOT NULL,
  `tags` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_virtualapp`
--

LOCK TABLES `terminal_virtualapp` WRITE;
/*!40000 ALTER TABLE `terminal_virtualapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_virtualapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal_virtualapppublication`
--

DROP TABLE IF EXISTS `terminal_virtualapppublication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_virtualapppublication` (
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `id` char(32) NOT NULL,
  `status` varchar(16) NOT NULL,
  `app_id` char(32) NOT NULL,
  `provider_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `terminal_virtualapppublication_provider_id_app_id_1a3b5a47_uniq` (`provider_id`,`app_id`),
  KEY `terminal_virtualappp_app_id_4def1236_fk_terminal_` (`app_id`),
  CONSTRAINT `terminal_virtualappp_app_id_4def1236_fk_terminal_` FOREIGN KEY (`app_id`) REFERENCES `terminal_virtualapp` (`id`),
  CONSTRAINT `terminal_virtualappp_provider_id_5b65af1b_fk_terminal_` FOREIGN KEY (`provider_id`) REFERENCES `terminal_appprovider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal_virtualapppublication`
--

LOCK TABLES `terminal_virtualapppublication` WRITE;
/*!40000 ALTER TABLE `terminal_virtualapppublication` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal_virtualapppublication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_applyassetticket`
--

DROP TABLE IF EXISTS `tickets_applyassetticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_applyassetticket` (
  `ticket_ptr_id` char(32) NOT NULL,
  `apply_permission_name` varchar(128) NOT NULL,
  `apply_actions` int NOT NULL,
  `apply_date_start` datetime(6) DEFAULT NULL,
  `apply_date_expired` datetime(6) DEFAULT NULL,
  `apply_accounts` json NOT NULL DEFAULT (_utf8mb3'[]'),
  PRIMARY KEY (`ticket_ptr_id`),
  CONSTRAINT `tickets_applyassetti_ticket_ptr_id_1bb5e258_fk_tickets_t` FOREIGN KEY (`ticket_ptr_id`) REFERENCES `tickets_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_applyassetticket`
--

LOCK TABLES `tickets_applyassetticket` WRITE;
/*!40000 ALTER TABLE `tickets_applyassetticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_applyassetticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_applyassetticket_apply_assets`
--

DROP TABLE IF EXISTS `tickets_applyassetticket_apply_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_applyassetticket_apply_assets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `applyassetticket_id` char(32) NOT NULL,
  `asset_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_applyassetticket_applyassetticket_id_asse_9657d165_uniq` (`applyassetticket_id`,`asset_id`),
  KEY `tickets_applyassetti_asset_id_9721556c_fk_assets_as` (`asset_id`),
  CONSTRAINT `tickets_applyassetti_applyassetticket_id_1eb1c040_fk_tickets_a` FOREIGN KEY (`applyassetticket_id`) REFERENCES `tickets_applyassetticket` (`ticket_ptr_id`),
  CONSTRAINT `tickets_applyassetti_asset_id_9721556c_fk_assets_as` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_applyassetticket_apply_assets`
--

LOCK TABLES `tickets_applyassetticket_apply_assets` WRITE;
/*!40000 ALTER TABLE `tickets_applyassetticket_apply_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_applyassetticket_apply_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_applyassetticket_apply_nodes`
--

DROP TABLE IF EXISTS `tickets_applyassetticket_apply_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_applyassetticket_apply_nodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `applyassetticket_id` char(32) NOT NULL,
  `node_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_applyassetticket_applyassetticket_id_node_eb3632f6_uniq` (`applyassetticket_id`,`node_id`),
  KEY `tickets_applyassetti_node_id_c90be137_fk_assets_no` (`node_id`),
  CONSTRAINT `tickets_applyassetti_applyassetticket_id_a1ae4866_fk_tickets_a` FOREIGN KEY (`applyassetticket_id`) REFERENCES `tickets_applyassetticket` (`ticket_ptr_id`),
  CONSTRAINT `tickets_applyassetti_node_id_c90be137_fk_assets_no` FOREIGN KEY (`node_id`) REFERENCES `assets_node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_applyassetticket_apply_nodes`
--

LOCK TABLES `tickets_applyassetticket_apply_nodes` WRITE;
/*!40000 ALTER TABLE `tickets_applyassetticket_apply_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_applyassetticket_apply_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_applycommandticket`
--

DROP TABLE IF EXISTS `tickets_applycommandticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_applycommandticket` (
  `ticket_ptr_id` char(32) NOT NULL,
  `apply_run_command` varchar(4096) NOT NULL,
  `apply_run_asset` varchar(128) NOT NULL,
  `apply_from_session_id` char(32) DEFAULT NULL,
  `apply_run_user_id` char(32) DEFAULT NULL,
  `apply_run_account` varchar(128) NOT NULL,
  `apply_from_cmd_filter_acl_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`ticket_ptr_id`),
  KEY `tickets_applycommand_apply_from_session_i_79d4ee87_fk_terminal_` (`apply_from_session_id`),
  KEY `tickets_applycommand_apply_run_user_id_767a3591_fk_users_use` (`apply_run_user_id`),
  KEY `tickets_applycommand_apply_from_cmd_filte_a18c8e6c_fk_acls_comm` (`apply_from_cmd_filter_acl_id`),
  CONSTRAINT `tickets_applycommand_apply_from_cmd_filte_a18c8e6c_fk_acls_comm` FOREIGN KEY (`apply_from_cmd_filter_acl_id`) REFERENCES `acls_commandfilteracl` (`id`),
  CONSTRAINT `tickets_applycommand_apply_from_session_i_79d4ee87_fk_terminal_` FOREIGN KEY (`apply_from_session_id`) REFERENCES `terminal_session` (`id`),
  CONSTRAINT `tickets_applycommand_apply_run_user_id_767a3591_fk_users_use` FOREIGN KEY (`apply_run_user_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `tickets_applycommand_ticket_ptr_id_b0348a17_fk_tickets_t` FOREIGN KEY (`ticket_ptr_id`) REFERENCES `tickets_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_applycommandticket`
--

LOCK TABLES `tickets_applycommandticket` WRITE;
/*!40000 ALTER TABLE `tickets_applycommandticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_applycommandticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_applyloginassetticket`
--

DROP TABLE IF EXISTS `tickets_applyloginassetticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_applyloginassetticket` (
  `ticket_ptr_id` char(32) NOT NULL,
  `apply_login_asset_id` char(32) DEFAULT NULL,
  `apply_login_user_id` char(32) DEFAULT NULL,
  `apply_login_account` varchar(128) NOT NULL,
  PRIMARY KEY (`ticket_ptr_id`),
  KEY `tickets_applyloginas_apply_login_asset_id_10c5f8ac_fk_assets_as` (`apply_login_asset_id`),
  KEY `tickets_applyloginas_apply_login_user_id_b8667ad6_fk_users_use` (`apply_login_user_id`),
  CONSTRAINT `tickets_applyloginas_apply_login_asset_id_10c5f8ac_fk_assets_as` FOREIGN KEY (`apply_login_asset_id`) REFERENCES `assets_asset` (`id`),
  CONSTRAINT `tickets_applyloginas_apply_login_user_id_b8667ad6_fk_users_use` FOREIGN KEY (`apply_login_user_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `tickets_applyloginas_ticket_ptr_id_e0e739b9_fk_tickets_t` FOREIGN KEY (`ticket_ptr_id`) REFERENCES `tickets_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_applyloginassetticket`
--

LOCK TABLES `tickets_applyloginassetticket` WRITE;
/*!40000 ALTER TABLE `tickets_applyloginassetticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_applyloginassetticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_applyloginticket`
--

DROP TABLE IF EXISTS `tickets_applyloginticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_applyloginticket` (
  `ticket_ptr_id` char(32) NOT NULL,
  `apply_login_ip` char(39) DEFAULT NULL,
  `apply_login_city` varchar(64) DEFAULT NULL,
  `apply_login_datetime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ticket_ptr_id`),
  CONSTRAINT `tickets_applyloginti_ticket_ptr_id_e012c346_fk_tickets_t` FOREIGN KEY (`ticket_ptr_id`) REFERENCES `tickets_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_applyloginticket`
--

LOCK TABLES `tickets_applyloginticket` WRITE;
/*!40000 ALTER TABLE `tickets_applyloginticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_applyloginticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_approvalrule`
--

DROP TABLE IF EXISTS `tickets_approvalrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_approvalrule` (
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `level` smallint NOT NULL,
  `strategy` varchar(64) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_approvalrule`
--

LOCK TABLES `tickets_approvalrule` WRITE;
/*!40000 ALTER TABLE `tickets_approvalrule` DISABLE KEYS */;
INSERT INTO `tickets_approvalrule` VALUES ('278b86c5af67457e9260c110a6fb1639','System','2024-05-03 19:34:20.759358','2024-05-03 19:34:20.759374',1,'super_admin','',NULL),('ed52ea993771476bbe1eb834cb9faf54','System','2024-05-03 19:34:20.772921','2024-05-03 19:34:20.772937',1,'super_admin','',NULL);
/*!40000 ALTER TABLE `tickets_approvalrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_approvalrule_assignees`
--

DROP TABLE IF EXISTS `tickets_approvalrule_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_approvalrule_assignees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `approvalrule_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_approvalrule_ass_approvalrule_id_user_id_676ce993_uniq` (`approvalrule_id`,`user_id`),
  KEY `tickets_approvalrule_assignees_user_id_30982f87_fk_users_user_id` (`user_id`),
  CONSTRAINT `tickets_approvalrule_approvalrule_id_a59ba2d6_fk_tickets_a` FOREIGN KEY (`approvalrule_id`) REFERENCES `tickets_approvalrule` (`id`),
  CONSTRAINT `tickets_approvalrule_assignees_user_id_30982f87_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_approvalrule_assignees`
--

LOCK TABLES `tickets_approvalrule_assignees` WRITE;
/*!40000 ALTER TABLE `tickets_approvalrule_assignees` DISABLE KEYS */;
INSERT INTO `tickets_approvalrule_assignees` VALUES (1,'278b86c5af67457e9260c110a6fb1639','15e6ac8a16464d68a66f565af10e2921'),(2,'ed52ea993771476bbe1eb834cb9faf54','15e6ac8a16464d68a66f565af10e2921');
/*!40000 ALTER TABLE `tickets_approvalrule_assignees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_comment`
--

DROP TABLE IF EXISTS `tickets_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_comment` (
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `user_display` varchar(256) NOT NULL,
  `body` longtext NOT NULL,
  `ticket_id` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `state` varchar(16) DEFAULT NULL,
  `type` varchar(16) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_comment_ticket_id_36a9497d_fk_tickets_ticket_id` (`ticket_id`),
  KEY `tickets_comment_user_id_9bf2a162_fk_users_user_id` (`user_id`),
  CONSTRAINT `tickets_comment_ticket_id_36a9497d_fk_tickets_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `tickets_ticket` (`id`),
  CONSTRAINT `tickets_comment_user_id_9bf2a162_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_comment`
--

LOCK TABLES `tickets_comment` WRITE;
/*!40000 ALTER TABLE `tickets_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_ticket`
--

DROP TABLE IF EXISTS `tickets_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_ticket` (
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `title` varchar(256) NOT NULL,
  `meta` json NOT NULL,
  `type` varchar(64) NOT NULL,
  `status` varchar(16) NOT NULL,
  `org_id` varchar(36) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `applicant_id` char(32) DEFAULT NULL,
  `state` varchar(16) NOT NULL,
  `approval_step` smallint NOT NULL,
  `flow_id` char(32) DEFAULT NULL,
  `serial_num` varchar(128) DEFAULT NULL,
  `rel_snapshot` json NOT NULL DEFAULT (_utf8mb3'{}'),
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_ticket_serial_num_7efc1f36_uniq` (`serial_num`),
  KEY `tickets_ticket_org_id_56b25ecf` (`org_id`),
  KEY `tickets_ticket_applicant_id_65687995_fk_users_user_id` (`applicant_id`),
  KEY `tickets_ticket_flow_id_da99d17e_fk_tickets_ticketflow_id` (`flow_id`),
  CONSTRAINT `tickets_ticket_applicant_id_65687995_fk_users_user_id` FOREIGN KEY (`applicant_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `tickets_ticket_flow_id_da99d17e_fk_tickets_ticketflow_id` FOREIGN KEY (`flow_id`) REFERENCES `tickets_ticketflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_ticket`
--

LOCK TABLES `tickets_ticket` WRITE;
/*!40000 ALTER TABLE `tickets_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_ticketassignee`
--

DROP TABLE IF EXISTS `tickets_ticketassignee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_ticketassignee` (
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `state` varchar(64) NOT NULL,
  `assignee_id` char(32) NOT NULL,
  `step_id` char(32) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_ticketassignee_assignee_id_101526d4_fk_users_user_id` (`assignee_id`),
  KEY `tickets_ticketassignee_step_id_3c8450ea_fk_tickets_ticketstep_id` (`step_id`),
  CONSTRAINT `tickets_ticketassignee_assignee_id_101526d4_fk_users_user_id` FOREIGN KEY (`assignee_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `tickets_ticketassignee_step_id_3c8450ea_fk_tickets_ticketstep_id` FOREIGN KEY (`step_id`) REFERENCES `tickets_ticketstep` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_ticketassignee`
--

LOCK TABLES `tickets_ticketassignee` WRITE;
/*!40000 ALTER TABLE `tickets_ticketassignee` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_ticketassignee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_ticketflow`
--

DROP TABLE IF EXISTS `tickets_ticketflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_ticketflow` (
  `org_id` varchar(36) NOT NULL,
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `type` varchar(64) NOT NULL,
  `approval_level` smallint NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_ticketflow_org_id_b1721dd8` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_ticketflow`
--

LOCK TABLES `tickets_ticketflow` WRITE;
/*!40000 ALTER TABLE `tickets_ticketflow` DISABLE KEYS */;
INSERT INTO `tickets_ticketflow` VALUES ('00000000-0000-0000-0000-000000000000','6bf95478eee842dc9c256dbe4e436e71','System','2024-05-03 19:34:20.758371','2024-05-03 19:34:20.758390','apply_asset',1,'',NULL);
/*!40000 ALTER TABLE `tickets_ticketflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_ticketflow_rules`
--

DROP TABLE IF EXISTS `tickets_ticketflow_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_ticketflow_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticketflow_id` char(32) NOT NULL,
  `approvalrule_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_ticketflow_rules_ticketflow_id_approvalru_5b79ffa9_uniq` (`ticketflow_id`,`approvalrule_id`),
  KEY `tickets_ticketflow_r_approvalrule_id_933c985d_fk_tickets_a` (`approvalrule_id`),
  CONSTRAINT `tickets_ticketflow_r_approvalrule_id_933c985d_fk_tickets_a` FOREIGN KEY (`approvalrule_id`) REFERENCES `tickets_approvalrule` (`id`),
  CONSTRAINT `tickets_ticketflow_r_ticketflow_id_7b158e76_fk_tickets_t` FOREIGN KEY (`ticketflow_id`) REFERENCES `tickets_ticketflow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_ticketflow_rules`
--

LOCK TABLES `tickets_ticketflow_rules` WRITE;
/*!40000 ALTER TABLE `tickets_ticketflow_rules` DISABLE KEYS */;
INSERT INTO `tickets_ticketflow_rules` VALUES (1,'6bf95478eee842dc9c256dbe4e436e71','278b86c5af67457e9260c110a6fb1639');
/*!40000 ALTER TABLE `tickets_ticketflow_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_ticketsession`
--

DROP TABLE IF EXISTS `tickets_ticketsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_ticketsession` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` char(32) NOT NULL,
  `ticket_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_ticketsession_session_id_3a6350fd` (`session_id`),
  KEY `tickets_ticketsession_ticket_id_f0e2ab03` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_ticketsession`
--

LOCK TABLES `tickets_ticketsession` WRITE;
/*!40000 ALTER TABLE `tickets_ticketsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_ticketsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_ticketstep`
--

DROP TABLE IF EXISTS `tickets_ticketstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_ticketstep` (
  `id` char(32) NOT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `level` smallint NOT NULL,
  `state` varchar(64) NOT NULL,
  `ticket_id` char(32) NOT NULL,
  `status` varchar(16) NOT NULL,
  `comment` longtext NOT NULL DEFAULT (_utf8mb3''),
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_ticketstep_ticket_id_860309c6_fk_tickets_ticket_id` (`ticket_id`),
  CONSTRAINT `tickets_ticketstep_ticket_id_860309c6_fk_tickets_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `tickets_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_ticketstep`
--

LOCK TABLES `tickets_ticketstep` WRITE;
/*!40000 ALTER TABLE `tickets_ticketstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_ticketstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_preference`
--

DROP TABLE IF EXISTS `users_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_preference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `category` varchar(128) NOT NULL,
  `value` longtext,
  `encrypted` tinyint(1) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_preference_name_user_id_ff36dae0_uniq` (`name`,`user_id`),
  KEY `users_preference_user_id_309a5b5a_fk_users_user_id` (`user_id`),
  CONSTRAINT `users_preference_user_id_309a5b5a_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_preference`
--

LOCK TABLES `users_preference` WRITE;
/*!40000 ALTER TABLE `users_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `username` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `role` varchar(10) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `wechat` varchar(256) NOT NULL,
  `phone` varchar(256) DEFAULT NULL,
  `private_key` longtext,
  `public_key` longtext,
  `comment` longtext,
  `is_first_login` tinyint(1) NOT NULL,
  `date_expired` datetime(6) DEFAULT NULL,
  `created_by` varchar(30) NOT NULL,
  `mfa_level` smallint NOT NULL,
  `otp_secret_key` varchar(256) DEFAULT NULL,
  `source` varchar(30) NOT NULL,
  `date_password_last_updated` datetime(6) DEFAULT NULL,
  `need_update_password` tinyint(1) NOT NULL,
  `dingtalk_id` varchar(128) DEFAULT NULL,
  `wecom_id` varchar(128) DEFAULT NULL,
  `feishu_id` varchar(128) DEFAULT NULL,
  `is_service_account` tinyint(1) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `date_api_key_last_used` datetime(6) DEFAULT NULL,
  `slack_id` varchar(128) DEFAULT NULL,
  `lark_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `users_user_wecom_id_cd44382f_uniq` (`wecom_id`),
  UNIQUE KEY `users_user_feishu_id_cc1e204a_uniq` (`feishu_id`),
  UNIQUE KEY `users_user_dingtalk_id_a7f722c4_uniq` (`dingtalk_id`),
  UNIQUE KEY `users_user_slack_id_867c518f_uniq` (`slack_id`),
  UNIQUE KEY `users_user_lark_id_34fa8617_uniq` (`lark_id`),
  KEY `users_user_date_expired_2e2eb0b3` (`date_expired`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES ('',NULL,'','',1,'2024-05-03 19:43:34.160952','0b5880bfd1c24e9e81d0e9c01a95f8f3','[Kael]-7b84a9cdc22c-SeTQIPH','[Kael]-7b84a9cdc22c-SeTQIPH','[Kael]-7b84a9cdc22c-SeTQIPH@local.domain','User','','L9sGBZJUmXHIcAEUQwKPHg==yj7hlFmFD0OFa6GsjF7VNA==PZgbJ5GoLI+WrsxS6+4+Pg==',NULL,NULL,NULL,'kael',0,'2094-04-16 19:43:34.161019','System',0,NULL,'local','2024-05-03 19:43:34.162429',0,NULL,NULL,NULL,1,'2024-05-03 19:43:34.162442','System','2024-05-03 19:47:15.555843',NULL,NULL),('',NULL,'','',1,'2024-05-03 19:43:40.712715','12c404846ff5448bb4ca29c022bad500','[Celery]-08d8886f7229','[Celery]-08d8886f7229','[Celery]-08d8886f7229@local.domain','User','','NXbF8gdmVxK4302tFGarlg==LiqfTvmmY4h/gfELEHQ43A==juIMro1LQUF5+5izTV9WPQ==',NULL,NULL,NULL,'',0,'2094-04-16 19:43:40.712824','System',0,NULL,'local','2024-05-03 19:43:40.714699',0,NULL,NULL,NULL,1,'2024-05-03 19:43:40.714714','System',NULL,NULL,NULL),('pbkdf2_sha256$390000$wsUDY9ZIDmBh9PsEAdtONo$xpprVaCtvIci0tTWYvJDO6rNlOuFBZGSdXHn+bIy/gA=','2024-05-03 19:45:27.484746','','',1,'2024-05-03 19:32:50.496336','15e6ac8a16464d68a66f565af10e2921','admin','Administrator','admin@example.com','Admin','','Wst1L/V3mEgCequ2sZhv8g==w9KpzdseklUe8SsbcWclBA==xveK2Y2qqvCthDi8aPHqfA==',NULL,'Xpgn091sjeGaRN8vfBA6gg==OIRoXB1rExEHawprcKRGfQ==0XAwcqM6IyxLLp71fSrhsQ==','gFuB4HnGEVe95Q+olE/0YA==5KrhFoufZ/S2kxh/dkye5Q==pcOYCnrqH9nVU2hvbt+3xg==','',0,'2094-04-16 19:32:50.496484','System',0,NULL,'local','2024-05-03 19:45:22.113418',0,NULL,NULL,NULL,0,'2024-05-03 19:45:22.221042','System',NULL,NULL,NULL),('',NULL,'','',1,'2024-05-03 19:42:50.004544','1e597c6f1ce84818b3986aaef1e8f8c4','[Core]-6aa50ad02453','[Core]-6aa50ad02453','[Core]-6aa50ad02453@local.domain','User','','lHuLyaOb/lrQkUb7EAOL3A==WX6HHmMSxDtMkbPb73epxg==lg+yBdKo1lpsNGl4SL2UIg==',NULL,NULL,NULL,'',0,'2094-04-16 19:42:50.004589','System',0,NULL,'local','2024-05-03 19:42:50.006157',0,NULL,NULL,NULL,1,'2024-05-03 19:42:50.006168','System',NULL,NULL,NULL),('',NULL,'','',1,'2024-05-03 19:43:34.368290','4cc1b8c528b248d2944931d3f8a9e467','[Magnus]-28eec2c762b0-eeuXBeF','[Magnus]-28eec2c762b0-eeuXBeF','[Magnus]-28eec2c762b0-eeuXBeF@local.domain','User','','gvvrwEEcSUcs8KWp7lt46w==JLzXP4zXMcyp4HLcnn33pQ==0whKFz0XSWLtwTvDxfgKWg==',NULL,NULL,NULL,'magnus',0,'2094-04-16 19:43:34.368327','System',0,NULL,'local','2024-05-03 19:43:34.369947',0,NULL,NULL,NULL,1,'2024-05-03 19:43:34.369958','System','2024-05-03 19:47:15.587375',NULL,NULL),('',NULL,'','',1,'2024-05-03 19:43:35.551897','84efa71cc3204088829b796ccbf1811f','[Lion]-0c2d47257e99-tNejTuI','[Lion]-0c2d47257e99-tNejTuI','[Lion]-0c2d47257e99-tNejTuI@local.domain','User','','l7rioSkXBpathYnqAnWIpg==YjeqpMqv4+XpahE1q3uEFw==VAI4/dXjA6mH3pD8QTynIg==',NULL,NULL,NULL,'lion',0,'2094-04-16 19:43:35.551930','System',0,NULL,'local','2024-05-03 19:43:35.553306',0,NULL,NULL,NULL,1,'2024-05-03 19:43:35.553318','System','2024-05-03 19:44:35.720343',NULL,NULL),('',NULL,'','',1,'2024-05-03 19:35:51.602107','a032aa0e42dd4a5aa6d162cb4a9aec87','[Core]-1834bc8b0858','[Core]-1834bc8b0858','[Core]-1834bc8b0858@local.domain','User','','88t51STOa7+Sd/e1HtX2wQ==7Ro0NfdWlnOOrTTYwrmHtA==oyENiAva0WWxIqJhiHT2dQ==',NULL,NULL,NULL,'',0,'2094-04-16 19:35:51.602209','System',0,NULL,'local','2024-05-03 19:35:51.604561',0,NULL,NULL,NULL,1,'2024-05-03 19:35:51.604581','System',NULL,NULL,NULL),('',NULL,'','',1,'2024-05-03 19:43:30.947139','a2db1ceb33c24ff6ab33fd5d681a3794','[Core]-798a58efc3dc','[Core]-798a58efc3dc','[Core]-798a58efc3dc@local.domain','User','','U2sOaYKKwxYKAqINVCKz7g==Zf5VTeXoOyFOpuv5p82yxA==dzkIiyDEt8qvPwQG6lbzOA==',NULL,NULL,NULL,'',0,'2094-04-16 19:43:30.947217','System',0,NULL,'local','2024-05-03 19:43:30.948946',0,NULL,NULL,NULL,1,'2024-05-03 19:43:30.948958','System',NULL,NULL,NULL),('',NULL,'','',1,'2024-05-03 19:40:35.440880','a4b1119db81148cbadbe43ddbaa6318e','[Core]-3fa8f5496dac','[Core]-3fa8f5496dac','[Core]-3fa8f5496dac@local.domain','User','','ouFI+ynwo9M5OBHVu4x1bQ==AyJVMjB4UN/ytYn/wbOMTQ==ENgFg91lrkH01HXcPU6NHA==',NULL,NULL,NULL,'',0,'2094-04-16 19:40:35.440925','System',0,NULL,'local','2024-05-03 19:40:35.442568',0,NULL,NULL,NULL,1,'2024-05-03 19:40:35.442579','System',NULL,NULL,NULL),('',NULL,'','',1,'2024-05-03 19:43:34.380356','c6d99c23718548708613d8eefb3b12d8','[KoKo]-c3d9362813af-lqLJgiC','[KoKo]-c3d9362813af-lqLJgiC','[KoKo]-c3d9362813af-lqLJgiC@local.domain','User','','v0CFASVgcijxxOW/DOn/TQ==WvICsXq+l8Ph0vvHQkbMGw==9dvyb1KcFjA0G7ke1333jg==',NULL,NULL,NULL,'koko',0,'2094-04-16 19:43:34.380412','System',0,NULL,'local','2024-05-03 19:43:34.382357',0,NULL,NULL,NULL,1,'2024-05-03 19:43:34.382368','System','2024-05-03 19:45:45.557003',NULL,NULL),('',NULL,'','',1,'2024-05-03 19:43:34.107868','fd79e57a44ae4f019f1d5f73aa6c03f9','[Chen]-537df41fa1a0-VAGyfIW','[Chen]-537df41fa1a0-VAGyfIW','[Chen]-537df41fa1a0-VAGyfIW@local.domain','User','','x21ZT1aBJGhVKMxuGxjGHQ==BFkYN5QokKClWa7ng9WaTw==HPl7rCKESHZE6ly6uwMeFw==',NULL,NULL,NULL,'chen',0,'2094-04-16 19:43:34.108008','System',0,NULL,'local','2024-05-03 19:43:34.111320',0,NULL,NULL,NULL,1,'2024-05-03 19:43:34.111342','System','2024-05-03 19:47:15.555843',NULL,NULL);
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` char(32) NOT NULL,
  `usergroup_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_usergroup_id_ac1e3824_uniq` (`user_id`,`usergroup_id`),
  KEY `users_user_groups_usergroup_id_90818973_fk_users_usergroup_id` (`usergroup_id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `users_user_groups_usergroup_id_90818973_fk_users_usergroup_id` FOREIGN KEY (`usergroup_id`) REFERENCES `users_usergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
INSERT INTO `users_user_groups` VALUES (7,'0b5880bfd1c24e9e81d0e9c01a95f8f3','4435e35cb394423ea8bb34d99d2af00a'),(11,'12c404846ff5448bb4ca29c022bad500','4435e35cb394423ea8bb34d99d2af00a'),(1,'15e6ac8a16464d68a66f565af10e2921','4435e35cb394423ea8bb34d99d2af00a'),(4,'1e597c6f1ce84818b3986aaef1e8f8c4','4435e35cb394423ea8bb34d99d2af00a'),(8,'4cc1b8c528b248d2944931d3f8a9e467','4435e35cb394423ea8bb34d99d2af00a'),(10,'84efa71cc3204088829b796ccbf1811f','4435e35cb394423ea8bb34d99d2af00a'),(2,'a032aa0e42dd4a5aa6d162cb4a9aec87','4435e35cb394423ea8bb34d99d2af00a'),(5,'a2db1ceb33c24ff6ab33fd5d681a3794','4435e35cb394423ea8bb34d99d2af00a'),(3,'a4b1119db81148cbadbe43ddbaa6318e','4435e35cb394423ea8bb34d99d2af00a'),(9,'c6d99c23718548708613d8eefb3b12d8','4435e35cb394423ea8bb34d99d2af00a'),(6,'fd79e57a44ae4f019f1d5f73aa6c03f9','4435e35cb394423ea8bb34d99d2af00a');
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` char(32) NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_usergroup`
--

DROP TABLE IF EXISTS `users_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_usergroup` (
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `comment` longtext NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `org_id` varchar(36) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_usergroup_org_id_name_e3d49d01_uniq` (`org_id`,`name`),
  KEY `users_usergroup_org_id_995a56e5` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_usergroup`
--

LOCK TABLES `users_usergroup` WRITE;
/*!40000 ALTER TABLE `users_usergroup` DISABLE KEYS */;
INSERT INTO `users_usergroup` VALUES ('4435e35cb394423ea8bb34d99d2af00a','Default','','2024-05-03 19:32:50.369037','System','00000000-0000-0000-0000-000000000002','2024-05-03 19:35:27.220255',NULL);
/*!40000 ALTER TABLE `users_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userpasswordhistory`
--

DROP TABLE IF EXISTS `users_userpasswordhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userpasswordhistory` (
  `id` char(32) NOT NULL,
  `password` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_userpasswordhistory_user_id_d2c011ae_fk_users_user_id` (`user_id`),
  CONSTRAINT `users_userpasswordhistory_user_id_d2c011ae_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userpasswordhistory`
--

LOCK TABLES `users_userpasswordhistory` WRITE;
/*!40000 ALTER TABLE `users_userpasswordhistory` DISABLE KEYS */;
INSERT INTO `users_userpasswordhistory` VALUES ('21838bc541f04a7cb0bf28e6a4568c15','','2024-05-03 19:35:51.652166','a032aa0e42dd4a5aa6d162cb4a9aec87'),('2e0ce3b0a1c044889e3fdac5a9fb43e1','','2024-05-03 19:40:35.501692','a4b1119db81148cbadbe43ddbaa6318e'),('431207b2eed04e35afbce12d68874a47','','2024-05-03 19:43:34.113280','fd79e57a44ae4f019f1d5f73aa6c03f9'),('76093165e2664effa62abf0357413c29','pbkdf2_sha256$390000$wsUDY9ZIDmBh9PsEAdtONo$xpprVaCtvIci0tTWYvJDO6rNlOuFBZGSdXHn+bIy/gA=','2024-05-03 19:45:22.223023','15e6ac8a16464d68a66f565af10e2921'),('7ae113f06e8a47dbabcee0c7e823b068','','2024-05-03 19:43:35.554594','84efa71cc3204088829b796ccbf1811f'),('8bcdc05d8e5c46aba9e6711d510d39a9','','2024-05-03 19:43:34.384197','c6d99c23718548708613d8eefb3b12d8'),('b44e5a1b50484b909e52fd6da4be3b93','','2024-05-03 19:42:50.044933','1e597c6f1ce84818b3986aaef1e8f8c4'),('b7c1c13624bf4b42a5d5f34ae1fa1198','','2024-05-03 19:43:30.998142','a2db1ceb33c24ff6ab33fd5d681a3794'),('d48ad9cae9de424bacf5e52e31ea85c1','','2024-05-03 19:43:34.371406','4cc1b8c528b248d2944931d3f8a9e467'),('d62633adbf9a441aa90234fb7a25912a','','2024-05-03 19:43:34.163747','0b5880bfd1c24e9e81d0e9c01a95f8f3'),('f99bd2b5d2e64f829e8cc8e7ba2217e9','','2024-05-03 19:43:40.761385','12c404846ff5448bb4ca29c022bad500');
/*!40000 ALTER TABLE `users_userpasswordhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-03 19:47:31
