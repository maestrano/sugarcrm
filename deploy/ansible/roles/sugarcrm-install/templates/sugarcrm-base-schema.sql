-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sugarcrm
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_audit`
--

DROP TABLE IF EXISTS `accounts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_audit`
--

LOCK TABLES `accounts_audit` WRITE;
/*!40000 ALTER TABLE `accounts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_bugs`
--

DROP TABLE IF EXISTS `accounts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bugs`
--

LOCK TABLES `accounts_bugs` WRITE;
/*!40000 ALTER TABLE `accounts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cases`
--

DROP TABLE IF EXISTS `accounts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cases`
--

LOCK TABLES `accounts_cases` WRITE;
/*!40000 ALTER TABLE `accounts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_contacts`
--

DROP TABLE IF EXISTS `accounts_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_contacts`
--

LOCK TABLES `accounts_contacts` WRITE;
/*!40000 ALTER TABLE `accounts_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_opportunities`
--

DROP TABLE IF EXISTS `accounts_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_opportunities`
--

LOCK TABLES `accounts_opportunities` WRITE;
/*!40000 ALTER TABLE `accounts_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_actions`
--

DROP TABLE IF EXISTS `acl_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_actions`
--

LOCK TABLES `acl_actions` WRITE;
/*!40000 ALTER TABLE `acl_actions` DISABLE KEYS */;
INSERT INTO `acl_actions` VALUES ('112e981b-2451-793d-3e9e-55c0649269a4','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Documents','module',90,0),('11a2cf61-97a0-d6f3-027f-55c0645bdad7','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Notes','module',90,0),('154c0a38-5d1b-6212-2ddd-55c0643c7ea3','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Contacts','module',90,0),('16956241-dc9d-f94f-f3a2-55c06418ad50','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_Category','module',90,0),('1699d3d8-37d8-d6af-69e8-55c0647105d3','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_Product','module',90,0),('16d8d3eb-0b1e-dd82-b5cd-55c064198cd0','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_ExternalContractPositions','module',90,0),('17a895f2-5789-39b0-cbd9-55c064e2435c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Users','module',90,0),('183535bf-4783-7c15-a209-55c064d06ad1','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','EmailTemplates','module',89,0),('1839d179-7ba3-aa1d-3848-55c064d09619','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_ExternalContractCosts','module',90,0),('1942258c-77f7-7c7f-68d1-55c06483b44e','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_Service','module',90,0),('196b5633-3f67-e5ea-a98f-55c064181485','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_Addition','module',90,0),('1ac7df6c-99c1-e431-1ad0-55c064cbd7da','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','MNO_Taxes','module',90,0),('1c121d00-c00e-a253-6aab-55c06447900d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Documents','module',90,0),('1ce402c3-4fe9-4646-30cc-55c064fed19c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_EditedTextBlock','module',90,0),('1d3f05d7-6649-3caa-56c2-55c064dc0775','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Tasks','module',90,0),('1d99ccb7-0dd0-c006-abe7-55c0648d4715','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Calls','module',89,0),('1e1809ad-0d10-e4fc-c576-55c064b6a128','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Users','module',90,0),('1f3ccd15-b4bd-1f5d-c68f-55c064007387','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Notes','module',90,0),('217a08c8-743a-1f5c-1ea1-55c0641dede3','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_Category','module',90,0),('21d3008a-dfc3-54b7-b359-55c064c18243','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Tasks','module',90,0),('228cccec-5a2f-8401-47dd-55c0647c87ec','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Users','module',90,0),('22ff2722-a034-6662-1d66-55c06432b633','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_ExternalContractCosts','module',90,0),('22ffea5f-7783-17ee-91a1-55c064a466e3','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','EmailTemplates','module',90,0),('233007af-75f6-ee75-0709-55c064dfe3e1','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_Product','module',90,0),('259814dd-934b-1200-e615-55c06463ad3d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_Product','module',90,0),('26dacb52-b814-8375-429f-55c064b455b2','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_Service','module',90,0),('26e17530-8c37-99aa-c931-55c06452111c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Documents','module',90,0),('26ecc4c8-442a-28c9-1051-55c064be077d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_Addition','module',90,0),('27230162-8f6a-93a1-7fbc-55c064f3e8a1','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_ExternalContractCosts','module',90,0),('2b240284-350a-f723-a33e-55c06422824b','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Calls','module',90,0),('2c5c7d2f-996a-28e1-795a-55c0645a9bb1','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_Category','module',90,0),('2c626bed-83ed-ebe6-0809-55c06447d30b','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_ExternalContractDetailedCosts','module',89,0),('2cca56f6-48f4-aaa2-d99e-55c0645aaf3f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Notes','module',90,0),('2cf7495f-52f1-f134-4c29-55c064dd793f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Emails','module',89,0),('2d55f0b9-a1cb-236a-e44f-55c064904c68','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Users','module',90,0),('2dd69dcc-1262-e11d-0d8e-55c064dfdb75','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_ExternalContractCosts','module',90,0),('2dfd70ca-e5f2-8276-178d-55c064410dc3','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','EmailTemplates','module',90,0),('2e0425ff-1bfd-6622-50ed-55c06448bcad','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Prospects','module',89,0),('31c3b6a9-4f03-dd2f-3d99-55c0640dfc0a','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_Service','module',90,0),('31e85cf8-27bb-1aaa-bb30-55c064eff47c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Documents','module',90,0),('333a497e-a82f-1418-7017-55c0643ba40b','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_Product','module',90,0),('349c5279-f28d-5d98-96a2-55c0641cc55a','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_Addition','module',90,0),('36c95fb6-58a0-1233-bdc3-55c064959033','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_Task','module',89,0),('373e08d7-af40-2a90-456d-55c064834466','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_Category','module',90,0),('385281e6-25d4-9f10-3c5c-55c064c80b61','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Users','module',90,0),('38a7ed7b-6c37-3da2-54c2-55c064c13b00','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_ProductCatalog','module',89,0),('38c3b09a-9cdd-d276-682f-55c06434bb5e','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Calls','module',90,0),('38d8232c-d9fb-a3bd-504c-55c064764c0d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','EmailTemplates','module',90,0),('38e67d1c-194b-7fae-7e98-55c0647ed060','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Prospects','module',90,0),('3a71f254-b177-c24c-630c-55c0640e8367','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Notes','module',90,0),('3a9a7536-d60a-6e99-dc8d-55c064cd6473','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Emails','module',90,0),('3c986103-e641-21ae-0e5e-55c064f16ac6','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_Service','module',90,0),('3cc4e134-5e5f-b0da-b8ea-55c064bf5007','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Documents','module',90,0),('406e01f4-7d37-b7de-8e50-55c064daa9fc','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Notes','module',90,0),('40d483f3-8d14-fe39-d11e-55c064ba2c1d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_Product','module',90,0),('42301cbc-4406-5fc9-e4ac-55c06433d56f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_Category','module',90,0),('42390660-1065-b798-5019-55c0644bbe6c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_Addition','module',90,0),('4398c210-e37f-a3a9-0951-55c064f73b9e','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_ProductCatalog','module',90,0),('43b7382d-ab02-7740-1184-55c064893e10','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Prospects','module',90,0),('43c4276a-d10e-5524-3cb1-55c06425255a','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','EmailTemplates','module',90,0),('4457b59a-dbbc-157e-448d-55c06496a26b','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_Task','module',90,0),('46648be5-ad8a-8717-3124-55c064c123df','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Calls','module',90,0),('480da613-440b-9f77-d753-55c0648e4ae2','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Notes','module',90,0),('482c777a-4fe1-db8e-6df2-55c064024790','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Emails','module',90,0),('4aaa9906-0301-ea1a-9ad9-55c06477137f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','ProspectLists','module',89,0),('4d2e58e6-2acb-44dc-c5e6-55c064690da5','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_Addition','module',90,0),('4ea71822-7fd0-a185-1922-55c064cc6c5f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','EmailTemplates','module',90,0),('4eadaab0-3cf7-5e32-40f8-55c064d973ce','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Prospects','module',90,0),('511d4756-8afa-4c99-8b9b-55c06423fada','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_ProductCatalog','module',90,0),('51f9d7b0-c588-584e-42fc-55c0645bf645','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_Task','module',90,0),('53f9f6e0-5e6e-c5ff-c274-55c064d05acc','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Calls','module',90,0),('55981599-c7b8-5fa9-dd66-55c06433c7ae','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','ProspectLists','module',90,0),('55a48bc4-9c45-c721-bb69-55c064492696','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Notes','module',90,0),('55c605dc-05ac-1b04-cdb9-55c0646d8b09','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Emails','module',90,0),('5901588a-aed5-c618-001c-55c064680d96','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_ExternalContractDetailedCosts','module',90,0),('598b72ff-4196-9ab7-1980-55c064ee2e6f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','EmailTemplates','module',90,0),('5996202d-ca10-b368-99c4-55c064d9e760','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Prospects','module',90,0),('59ab8c39-a1d7-795e-b4c6-55c064a55200','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Bugs','module',89,0),('5c169fd3-61e9-f77b-333e-55c064a21b96','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_ProductCatalog','module',90,0),('5edc9caf-7012-f0c0-eba5-55c064025195','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Calls','module',90,0),('5fa05608-1a54-940d-d7d2-55c06409f54e','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_Task','module',90,0),('6088d26f-3e8e-6cb1-4cec-55c06431376b','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','ProspectLists','module',90,0),('635eb306-8731-cc2c-19f6-55c064d54407','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Emails','module',90,0),('647accfb-a8d0-d11e-ab15-55c06411a65c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','EmailTemplates','module',90,0),('647c87e9-dfea-2562-7831-55c064ebfb7d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Prospects','module',90,0),('65bfaeb3-0a5c-4c71-b51c-55c0644ef7bc','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Project','module',89,0),('65f50fc9-901b-6aca-4c44-55c064932444','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Documents','module',90,0),('664e4b59-ce5c-b14c-c9d9-55c064c318a1','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','EAPM','module',89,0),('6752f9d1-925d-cc47-db15-55c064f8dab4','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Bugs','module',90,0),('69aad793-9211-10a1-d9d2-55c0648c9f8e','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_ProductCatalog','module',90,0),('69c10b77-0e95-c233-0014-55c064e97ab3','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Calls','module',90,0),('6a0144b6-9ef2-0078-480a-55c0644c2f99','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_TextBlock','module',89,0),('6b5e8a2c-017b-4505-c078-55c06417567d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','ProspectLists','module',90,0),('6c47c691-95fc-025c-fd36-55c0643cda92','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','ProjectTask','module',89,0),('6d3532bc-a4da-b1e0-0809-55c064e6e52d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_Task','module',90,0),('6f5ce7a7-9de6-91f5-673e-55c064e37d06','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Prospects','module',90,0),('70a34756-4c66-13b9-c9da-55c064fd3c75','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Project','module',90,0),('70f60c53-5f38-6222-67f8-55c06431e297','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Emails','module',90,0),('72f7e301-244f-d085-2a71-55c064efcbcb','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_Contract','module',89,0),('7400c726-ce5a-5996-545f-55c064d51cd5','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','EAPM','module',90,0),('74a5573a-8db1-77a4-205b-55c0645cbb3d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Calls','module',90,0),('74e9b65f-5cd6-480c-8c0a-55c0643325ef','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Bugs','module',90,0),('763e0863-f2e7-31fa-9833-55c064b53e48','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','ProspectLists','module',90,0),('774514d0-26ee-f1d1-b177-55c064f688a0','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_ProductCatalog','module',90,0),('77a3ccb7-0651-af0e-a593-55c06413c951','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_TextBlock','module',90,0),('790d49f2-3896-35f8-ac9d-55c064df3945','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','EmailMarketing','module',89,0),('79e56d00-c288-1bd7-2b00-55c0647d0aad','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','ProjectTask','module',90,0),('79e923d5-ac3f-9941-6c3d-55c0647f0145','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_ExternalContractDetailedCosts','module',90,0),('7a34268e-5462-35c3-224f-55c064df64cf','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Prospects','module',90,0),('7ab31092-b22b-d0cc-eabb-55c064fef255','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Accounts','module',89,0),('7ace4136-5c5a-802f-4e57-55c064ac11f5','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_Task','module',90,0),('7aeb3556-1469-4243-8329-55c0648e8e64','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Opportunities','module',89,0),('7b8210b4-5aa2-7642-7aa0-55c064627549','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Project','module',90,0),('7dd5cca6-34cc-b754-acb6-55c0648b74e8','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_Contract','module',90,0),('7e95f94b-1422-89b2-9e1a-55c064522038','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Emails','module',90,0),('810814c2-3486-71cd-7f0d-55c06484467c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','ProspectLists','module',90,0),('81841ea6-105a-c4b2-0f05-55c064a7ab2e','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','EAPM','module',90,0),('82846aa1-ff97-8ce9-ee8f-55c06411a2a9','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Bugs','module',90,0),('841a155b-acba-d49a-950e-55c0644f8399','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_ExternalContract','module',89,0),('84dc123a-4f36-8f42-25ea-55c06436a29f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_ProductCatalog','module',90,0),('8537b4ca-63a0-9fe6-1e95-55c0643be415','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_TextBlock','module',90,0),('85ab9254-aa37-4b5b-10c8-55c064f5afab','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Accounts','module',90,0),('866351fe-9396-e8cd-2a8c-55c064ffb8a6','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Project','module',90,0),('869f6488-8281-d7e7-0ce9-55c0649b7c48','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','EmailMarketing','module',90,0),('87729547-e7c1-d385-70c5-55c0644bcc91','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','ProjectTask','module',90,0),('886703af-15e5-8c6c-01a4-55c064ee0264','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_Task','module',90,0),('8889a139-4c6c-9dd9-2f19-55c064de3a6b','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Opportunities','module',90,0),('88be3dc8-d78b-a344-625d-55c064bc3dbe','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_Contract','module',90,0),('89331674-61f7-b8df-0a98-55c064b9f640','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_Offering','module',89,0),('8c075027-795b-a908-5c0b-55c0645821f8','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','ProspectLists','module',90,0),('8c2419d7-21d4-08a9-ac67-55c064b6b20c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Emails','module',90,0),('8edc5f58-aceb-c1b5-bec7-55c064ac93c1','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_ExternalContract','module',90,0),('8f29a29a-0b99-ef62-c9f7-55c0649965c8','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','EAPM','module',90,0),('900dda33-f1f2-60fc-d889-55c06430d736','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Bugs','module',90,0),('9086fb14-318a-85f7-c5c3-55c0640e55a4','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Cases','module',89,0),('908da3d5-d8c7-5e82-10be-55c06422cc50','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Accounts','module',90,0),('913b2032-12d8-6cf6-38d0-55c064bc8a18','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Project','module',90,0),('927e3a3c-0403-2d27-ba17-55c0644200ab','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_ProductCatalog','module',90,0),('92c789fa-65bf-3602-66a3-55c0642e5e29','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_TextBlock','module',90,0),('93a0724c-97f2-3252-cee2-55c064fdd679','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_Contract','module',90,0),('93e10e59-91ae-8959-7c03-55c06428ad2b','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_ExternalContractPositions','module',90,0),('941c8248-b54c-3178-6480-55c064c13805','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_Offering','module',90,0),('94236aa5-054a-b4a4-6b6e-55c064601231','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_ExternalContractDetailedCosts','module',90,0),('94451254-6a8a-0eaf-db2d-55c0647ca71a','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','EmailMarketing','module',90,0),('9514aa5e-36dd-c472-8323-55c064a5649e','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','ProjectTask','module',90,0),('9553d55a-8338-8a03-7f21-55c064a85679','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Meetings','module',89,0),('96068527-3198-1365-3b24-55c064872674','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_Task','module',90,0),('962fc38d-2391-b178-2c10-55c0640c46f6','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Contacts','module',89,0),('96e6e6c6-edae-0c34-c323-55c064896bd3','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','ProspectLists','module',90,0),('98d62042-d044-4bf3-f202-55c0649717c5','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Opportunities','module',90,0),('99bf8a24-c11a-9e29-35a0-55c064615cd9','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_ExternalContract','module',90,0),('99f468d2-980a-934f-d857-55c06477887f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Campaigns','module',89,0),('9b833e13-da68-46b5-7c9d-55c064ce0881','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Accounts','module',90,0),('9c2fe75f-5dc5-e5df-0418-55c064b4736e','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Project','module',90,0),('9dbbf086-ec51-398f-a832-55c0642175cd','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Bugs','module',90,0),('9e1b0a7c-1333-6b3a-6e3d-55c064b8296d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Cases','module',90,0),('9e840c4d-7206-f7e8-5c31-55c064ea0f75','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_Contract','module',90,0),('9eee30c1-878e-ef29-2a52-55c064eee06d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_Offering','module',90,0),('a02dc1e2-93fb-bcd5-b9ab-55c06430f775','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Meetings','module',90,0),('a05c605f-8988-f1a8-ce57-55c064a507ba','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_TextBlock','module',90,0),('a1ddc8cb-efff-aae5-8c78-55c0649c6166','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','EmailMarketing','module',90,0),('a29eced2-b241-43e7-4e73-55c064b6e5db','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','ProjectTask','module',90,0),('a3a91c5e-52ae-4802-caeb-55c064d10925','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Opportunities','module',90,0),('a3c1c781-f68c-7cd2-5c41-55c06466b133','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Contacts','module',90,0),('a49321a9-9658-0cd0-be74-55c064c585c3','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_ExternalContract','module',90,0),('a4dac124-eaaa-25f3-d631-55c06428e767','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Campaigns','module',90,0),('a4e64388-34f0-bd36-fec0-55c0649332d9','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','EAPM','module',90,0),('a689579a-4505-c8cc-c633-55c064a40ada','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Leads','module',89,0),('a70f7a20-fc15-5dc1-4b8d-55c064c84839','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Project','module',90,0),('a8fcb571-dc62-506e-a3c6-55c0644a67b4','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Cases','module',90,0),('a8fdfe1b-9f5f-6c10-6f1d-55c0641881b8','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Accounts','module',90,0),('a9684487-4623-8aee-2112-55c064c1004c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_Contract','module',90,0),('a9cdecd1-6375-bc59-cb5c-55c064babfaa','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_EditedTextBlock','module',89,0),('a9d9981d-2688-89e8-54d5-55c06469600f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_Offering','module',90,0),('ab0c6813-55f8-7b73-4f97-55c064643260','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Meetings','module',90,0),('ab48845e-9fd7-afef-1217-55c064b88ee0','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Bugs','module',90,0),('ab5e4e29-db16-c8d3-5f1c-55c0647f6a8f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_ExternalContractPositions','module',89,0),('adeeed25-eaab-a58f-53aa-55c06403c6ec','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_TextBlock','module',90,0),('ae944335-9c30-90d3-d1d2-55c064b81931','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Opportunities','module',90,0),('af6e4dbd-b42c-3bfd-9998-55c0646feb69','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','EmailMarketing','module',90,0),('af93c169-6b7b-765c-fe6c-55c064d77507','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_ExternalContract','module',90,0),('afbb5734-c089-fe1e-07f3-55c0642307f7','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','MNO_Taxes','module',89,0),('afc03e1e-7c13-5d08-572d-55c064a025eb','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Campaigns','module',90,0),('b04c9ac7-bc61-63d7-2689-55c064338713','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','ProjectTask','module',90,0),('b15444b9-9201-5578-3b63-55c064d456b7','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Contacts','module',90,0),('b16486b4-e8f3-ec8d-eff6-55c06477a071','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Leads','module',90,0),('b1f01320-d1a1-4d2c-111d-55c0646624d5','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Project','module',90,0),('b2302dc2-c024-cb86-ac0a-55c064015974','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Tasks','module',89,0),('b2973a6f-5b8f-dba8-5d21-55c064fea8b8','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','EAPM','module',90,0),('b2de2f58-0f33-45b0-8128-55c0646cd2dc','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_ExternalContractDetailedCosts','module',90,0),('b3d38fba-2db5-6203-0b8b-55c06451750d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Cases','module',90,0),('b3de1636-8bef-64c9-7128-55c064433f97','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Accounts','module',90,0),('b44a1df7-6de9-8e36-62a5-55c064231de3','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_Contract','module',90,0),('b4b2f2f7-c655-60ac-315e-55c06474c0ec','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_EditedTextBlock','module',90,0),('b4c79d4a-feba-9f6a-704e-55c06420de82','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_Offering','module',90,0),('b602d791-8a7a-5a9f-643c-55c064d3172a','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Meetings','module',90,0),('b8ebb674-7d8f-6e9e-34a3-55c0644e758c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Bugs','module',90,0),('b8fd8b2f-1635-d408-5d22-55c064a90a47','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_ExternalContractPositions','module',90,0),('b9709f87-bb15-a2cb-47b5-55c064e127f2','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Opportunities','module',90,0),('ba6b2bee-ae3e-2f40-8f48-55c064502dbf','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_ExternalContract','module',90,0),('ba990b50-422e-5531-b5ff-55c0640da083','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_Service','module',90,0),('baaeb8f7-938d-f9ac-b9be-55c064d827c7','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Campaigns','module',90,0),('bb4a0913-039e-212f-482d-55c064fb6089','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_Category','module',90,0),('bb77660f-8605-5e6d-7f23-55c0649a1642','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_TextBlock','module',90,0),('bbef005e-a052-903d-f9dd-55c064f6efc8','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_ExternalContractDetailedCosts','module',90,0),('bc44bfdf-9b85-5067-cc57-55c0647ad886','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Leads','module',90,0),('bc9b0969-c7a0-8e76-bbe4-55c0644b666c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_Addition','module',90,0),('bd0b3b5d-b174-3152-f615-55c06435657a','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','EmailMarketing','module',90,0),('bd65a26c-b7eb-443d-f59b-55c064fa108c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','MNO_Taxes','module',90,0),('bde09dab-71d6-8443-bb40-55c064367b38','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','ProjectTask','module',90,0),('bec35861-2de1-d3eb-a36c-55c0648cbf1a','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Accounts','module',90,0),('bec4c896-9bd2-09d5-7744-55c0644193f5','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Cases','module',90,0),('bf08d141-9233-624a-4fe2-55c0645ab2d6','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Contacts','module',90,0),('bf95fc59-bf90-598d-2503-55c0645005f4','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_EditedTextBlock','module',90,0),('bfa95731-2e1d-470b-f2a4-55c064193a8e','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_Offering','module',90,0),('bfc0ecea-0ff3-9986-051f-55c064921930','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Tasks','module',90,0),('c03896f1-e908-d46a-454e-55c064540860','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','EAPM','module',90,0),('c0f12760-7808-d33b-b5e7-55c0648d46ba','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Meetings','module',90,0),('c45fcdee-f195-c78e-a396-55c06473f55a','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Opportunities','module',90,0),('c5577a6e-5c8b-0f7d-fe19-55c064fe7a40','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_ExternalContract','module',90,0),('c586bb7f-3053-cb32-77e0-55c06483f245','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Campaigns','module',90,0),('c68a8ac8-9bc9-b279-8e4c-55c064dab291','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_ExternalContractPositions','module',90,0),('c725fb88-9519-28c6-c5cb-55c064cb9647','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Leads','module',90,0),('c893eb21-c3ce-1504-d41b-55c06410660f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_Contract','module',90,0),('c910b78f-711c-7b53-95ed-55c064aae322','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_TextBlock','module',90,0),('c9563c0a-bbe2-19e3-06a1-55c06473fcd9','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_Service','module',89,0),('c9aac0c5-3552-582a-5940-55c064166576','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Cases','module',90,0),('c9b533dc-7f33-e9ae-34c3-55c06405fb8a','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Accounts','module',90,0),('ca6d7245-580f-7be0-9ad1-55c0647c6130','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_EditedTextBlock','module',90,0),('ca823e86-6ea4-424d-6676-55c0647d5c14','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_Offering','module',90,0),('caa1cb49-4943-b83e-a5fd-55c064824d0c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','EmailMarketing','module',90,0),('caff0e9f-f377-dfa1-c644-55c064377767','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','MNO_Taxes','module',90,0),('cb78c75c-eb8b-beec-5430-55c0644075d0','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','ProjectTask','module',90,0),('cbc2f245-3fb5-b763-087c-55c0644792e9','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Meetings','module',90,0),('cc0d0555-1d7d-fc21-b26c-55c064a22371','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Users','module',90,0),('ccb945ee-2094-1a0c-f6f8-55c0646fab76','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Contacts','module',90,0),('cd71a85e-1c0d-b2cb-c17b-55c064283a3b','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','Tasks','module',90,0),('cdab9c1f-f6ae-929f-074e-55c064288f56','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_Product','module',89,0),('cdcbb21b-d61d-8010-bb10-55c064b37607','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','EAPM','module',90,0),('cf37a851-1ad6-b61c-6580-55c0645ea8a9','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_ExternalContractDetailedCosts','module',90,0),('cf47cf8a-338f-cc28-476c-55c064ff2455','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Opportunities','module',90,0),('d030868b-0365-a586-ef10-55c0648f63e7','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_ExternalContract','module',90,0),('d05246af-ee01-74f3-77d2-55c0649e334b','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Campaigns','module',90,0),('d11002a6-b9d9-fa4d-6b17-55c064e3968f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_Category','module',90,0),('d209632e-fe59-8e1f-0640-55c0649e49f8','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Leads','module',90,0),('d42b2f01-d584-0bef-1518-55c064f1a49e','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','oqc_ExternalContractPositions','module',90,0),('d4550463-b1fe-ee99-674d-55c064a20704','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','MNO_Taxes','module',90,0),('d48d5af6-5b6b-5616-9415-55c064b2c5c7','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Cases','module',90,0),('d4bb01d4-02f4-0ccf-a6da-55c064689b87','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_ExternalContractCosts','module',90,0),('d55a8cc3-79da-7c53-96bc-55c06453cb87','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_EditedTextBlock','module',90,0),('d56ff4ea-ac6e-972d-0975-55c0643ab326','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','oqc_Offering','module',90,0),('d5e9a00d-976e-531b-69ff-55c064aa67cd','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_ExternalContractCosts','module',89,0),('d6b0bdf9-3090-18ea-fa2a-55c064d5b9d3','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Meetings','module',90,0),('d83076fc-0361-1c2c-4963-55c064faa6f9','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','EmailMarketing','module',90,0),('d89b9030-3d40-5b8b-e897-55c06428194e','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','MNO_Taxes','module',90,0),('da546aa0-3546-f029-3baf-55c0644c9e39','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Contacts','module',90,0),('db029917-edc2-7dba-5759-55c064ef1122','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','edit','Tasks','module',90,0),('db407cbe-57db-e04b-559d-55c0648f28db','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Campaigns','module',90,0),('db53378d-154b-c5ed-f484-55c064727f35','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_Product','module',90,0),('dcef21d5-a42c-4fce-df6a-55c06446d09a','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','Leads','module',90,0),('df6beaa0-ec82-79f5-aaee-55c064150a92','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Cases','module',90,0),('e03e0556-ac25-9b82-e0d6-55c064d665a1','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_EditedTextBlock','module',90,0),('e03fcfd5-b343-c4ef-57bb-55c0648097e6','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Users','module',89,0),('e0d1e242-f823-764e-6fe7-55c06412eb75','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_ExternalContractCosts','module',90,0),('e1c7151b-ec14-b9dd-07cd-55c064d66e5d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','oqc_ExternalContractPositions','module',90,0),('e493a583-17b4-49b3-8ed6-55c064a9fac1','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_Service','module',90,0),('e4b5252e-b9cd-8a30-8b5d-55c064ddbfc9','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Documents','module',89,0),('e4bc8bc7-2715-c40a-0cbd-55c0642e6706','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_Addition','module',89,0),('e62b6e22-07b8-5d1e-93b9-55c0643af44c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Campaigns','module',90,0),('e63353e0-4e45-3fba-9cb7-55c064676fd3','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','MNO_Taxes','module',90,0),('e7d5d8ec-3c2d-661b-b62d-55c0644c1e0f','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Leads','module',90,0),('e7e1f971-67c5-aabc-c7f8-55c06490b227','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Contacts','module',90,0),('e8a0c643-41d1-a44b-6298-55c0645d6146','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','delete','Tasks','module',90,0),('e8c94360-c1d5-b6b6-280b-55c064cbb3b4','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_Product','module',90,0),('e9b4e74c-3e54-3e60-aaed-55c064a8860c','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Meetings','module',90,0),('ea0b06e7-3fff-e582-b80f-55c0644f4b31','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','oqc_Category','module',89,0),('ea929dc4-b332-8e19-f8fe-55c0644e4b41','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','access','Notes','module',89,0),('eb21d650-4ef2-d080-f852-55c0648cd6be','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_EditedTextBlock','module',90,0),('eb27753f-09c4-5d73-650e-55c064a32550','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Users','module',90,0),('eba621c0-d43d-dba2-d454-55c064023bc6','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_ExternalContractCosts','module',90,0),('ef5e6370-acbc-edb2-3335-55c0644384c2','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','oqc_ExternalContractPositions','module',90,0),('ef8dc18c-7c45-7b97-2f9f-55c064037bcb','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','Documents','module',90,0),('f1ae0956-dbb7-44ef-1a2d-55c064d8ded5','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','oqc_ExternalContractDetailedCosts','module',90,0),('f2329932-4d16-a11a-92a1-55c064bc5852','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','list','oqc_Service','module',90,0),('f255fd71-3fc6-be1c-4a5f-55c0640fb653','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','view','oqc_Addition','module',90,0),('f2b242b8-630b-e500-dba2-55c0646a9887','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','massupdate','Leads','module',90,0),('f3cad164-f6d9-2244-9a3f-55c064f4fc8d','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','import','MNO_Taxes','module',90,0),('f9f501db-c0fa-e66f-6eff-55c064fdc539','2015-08-04 07:04:33','2015-08-04 07:04:33','1','','export','Tasks','module',90,0);
/*!40000 ALTER TABLE `acl_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles`
--

DROP TABLE IF EXISTS `acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles`
--

LOCK TABLES `acl_roles` WRITE;
/*!40000 ALTER TABLE `acl_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_actions`
--

DROP TABLE IF EXISTS `acl_roles_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_actions`
--

LOCK TABLES `acl_roles_actions` WRITE;
/*!40000 ALTER TABLE `acl_roles_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_users`
--

DROP TABLE IF EXISTS `acl_roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_users`
--

LOCK TABLES `acl_roles_users` WRITE;
/*!40000 ALTER TABLE `acl_roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs`
--

DROP TABLE IF EXISTS `bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs`
--

LOCK TABLES `bugs` WRITE;
/*!40000 ALTER TABLE `bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs_audit`
--

DROP TABLE IF EXISTS `bugs_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs_audit`
--

LOCK TABLES `bugs_audit` WRITE;
/*!40000 ALTER TABLE `bugs_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_contacts`
--

DROP TABLE IF EXISTS `calls_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_contacts`
--

LOCK TABLES `calls_contacts` WRITE;
/*!40000 ALTER TABLE `calls_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_leads`
--

DROP TABLE IF EXISTS `calls_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_leads`
--

LOCK TABLES `calls_leads` WRITE;
/*!40000 ALTER TABLE `calls_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_users`
--

DROP TABLE IF EXISTS `calls_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_users`
--

LOCK TABLES `calls_users` WRITE;
/*!40000 ALTER TABLE `calls_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_log`
--

DROP TABLE IF EXISTS `campaign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_log`
--

LOCK TABLES `campaign_log` WRITE;
/*!40000 ALTER TABLE `campaign_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_trkrs`
--

DROP TABLE IF EXISTS `campaign_trkrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(30) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_trkrs`
--

LOCK TABLES `campaign_trkrs` WRITE;
/*!40000 ALTER TABLE `campaign_trkrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_trkrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT '0',
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text,
  `content` text,
  `frequency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns_audit`
--

DROP TABLE IF EXISTS `campaigns_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns_audit`
--

LOCK TABLES `campaigns_audit` WRITE;
/*!40000 ALTER TABLE `campaigns_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_audit`
--

DROP TABLE IF EXISTS `cases_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_audit`
--

LOCK TABLES `cases_audit` WRITE;
/*!40000 ALTER TABLE `cases_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_bugs`
--

DROP TABLE IF EXISTS `cases_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_bugs`
--

LOCK TABLES `cases_bugs` WRITE;
/*!40000 ALTER TABLE `cases_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('notify','fromaddress','do_not_reply@example.com'),('notify','fromname','SugarCRM'),('notify','send_by_default','1'),('notify','on','1'),('notify','send_from_assigning_user','0'),('info','sugar_version','6.5.21'),('MySettings','tab','YToxNjp7aTowO3M6NDoiSG9tZSI7aToxO3M6ODoiQWNjb3VudHMiO2k6MjtzOjg6IkNvbnRhY3RzIjtpOjM7czoxMzoiT3Bwb3J0dW5pdGllcyI7aTo0O3M6NToiTGVhZHMiO2k6NTtzOjg6IkNhbGVuZGFyIjtpOjY7czo5OiJEb2N1bWVudHMiO2k6NztzOjY6IkVtYWlscyI7aTo4O3M6OToiQ2FtcGFpZ25zIjtpOjk7czo1OiJDYWxscyI7aToxMDtzOjg6Ik1lZXRpbmdzIjtpOjExO3M6NToiVGFza3MiO2k6MTI7czo1OiJOb3RlcyI7aToxMztzOjU6IkNhc2VzIjtpOjE0O3M6OToiUHJvc3BlY3RzIjtpOjE1O3M6MTM6IlByb3NwZWN0TGlzdHMiO30='),('portal','on','0'),('tracker','Tracker','1'),('system','skypeout_on','1'),('sugarfeed','enabled','1'),('sugarfeed','module_UserFeed','1'),('sugarfeed','module_Contacts','1'),('sugarfeed','module_Opportunities','1'),('sugarfeed','module_Leads','1'),('sugarfeed','module_Cases','1'),('Update','CheckUpdates','automatic'),('system','name','SugarCRM');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_audit`
--

DROP TABLE IF EXISTS `contacts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_audit`
--

LOCK TABLES `contacts_audit` WRITE;
/*!40000 ALTER TABLE `contacts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_bugs`
--

DROP TABLE IF EXISTS `contacts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_bugs`
--

LOCK TABLES `contacts_bugs` WRITE;
/*!40000 ALTER TABLE `contacts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cases`
--

DROP TABLE IF EXISTS `contacts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cases`
--

LOCK TABLES `contacts_cases` WRITE;
/*!40000 ALTER TABLE `contacts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_users`
--

DROP TABLE IF EXISTS `contacts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_users`
--

LOCK TABLES `contacts_users` WRITE;
/*!40000 ALTER TABLE `contacts_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_remove_documents`
--

DROP TABLE IF EXISTS `cron_remove_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_remove_documents`
--

LOCK TABLES `cron_remove_documents` WRITE;
/*!40000 ALTER TABLE `cron_remove_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_remove_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT '0',
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_revisions`
--

DROP TABLE IF EXISTS `document_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_revisions`
--

LOCK TABLES `document_revisions` WRITE;
/*!40000 ALTER TABLE `document_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_accounts`
--

DROP TABLE IF EXISTS `documents_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_accounts`
--

LOCK TABLES `documents_accounts` WRITE;
/*!40000 ALTER TABLE `documents_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_bugs`
--

DROP TABLE IF EXISTS `documents_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_bugs`
--

LOCK TABLES `documents_bugs` WRITE;
/*!40000 ALTER TABLE `documents_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_cases`
--

DROP TABLE IF EXISTS `documents_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_cases`
--

LOCK TABLES `documents_cases` WRITE;
/*!40000 ALTER TABLE `documents_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_contacts`
--

DROP TABLE IF EXISTS `documents_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_contacts`
--

LOCK TABLES `documents_contacts` WRITE;
/*!40000 ALTER TABLE `documents_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_opportunities`
--

DROP TABLE IF EXISTS `documents_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_opportunities`
--

LOCK TABLES `documents_opportunities` WRITE;
/*!40000 ALTER TABLE `documents_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eapm`
--

DROP TABLE IF EXISTS `eapm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eapm`
--

LOCK TABLES `eapm` WRITE;
/*!40000 ALTER TABLE `eapm` DISABLE KEYS */;
/*!40000 ALTER TABLE `eapm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addr_bean_rel`
--

DROP TABLE IF EXISTS `email_addr_bean_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addr_bean_rel`
--

LOCK TABLES `email_addr_bean_rel` WRITE;
/*!40000 ALTER TABLE `email_addr_bean_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_addr_bean_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_cache`
--

DROP TABLE IF EXISTS `email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_cache`
--

LOCK TABLES `email_cache` WRITE;
/*!40000 ALTER TABLE `email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing`
--

DROP TABLE IF EXISTS `email_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing`
--

LOCK TABLES `email_marketing` WRITE;
/*!40000 ALTER TABLE `email_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing_prospect_lists`
--

DROP TABLE IF EXISTS `email_marketing_prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_prospect_lists`
--

LOCK TABLES `email_marketing_prospect_lists` WRITE;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES ('cbde67fe-789a-76c4-32b0-55c064798e28','2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','off','System-generated password email','This template is used when the System Administrator sends a new password to a user.','New account information','\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.','<div><table width=\"550\"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,NULL),('d8d0bffa-911d-eb5d-3347-55c06428d7a3','2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','off','Forgot Password email','This template is used to send a user a link to click to reset the user\'s account password.','Reset your account password','\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid','<div><table width=\"550\"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,NULL);
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailman`
--

DROP TABLE IF EXISTS `emailman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailman`
--

LOCK TABLES `emailman` WRITE;
/*!40000 ALTER TABLE `emailman` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_beans`
--

DROP TABLE IF EXISTS `emails_beans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_beans`
--

LOCK TABLES `emails_beans` WRITE;
/*!40000 ALTER TABLE `emails_beans` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_beans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_email_addr_rel`
--

DROP TABLE IF EXISTS `emails_email_addr_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_email_addr_rel`
--

LOCK TABLES `emails_email_addr_rel` WRITE;
/*!40000 ALTER TABLE `emails_email_addr_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_email_addr_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_text`
--

DROP TABLE IF EXISTS `emails_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_text`
--

LOCK TABLES `emails_text` WRITE;
/*!40000 ALTER TABLE `emails_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_meta_data`
--

DROP TABLE IF EXISTS `fields_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint(6) DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_meta_data`
--

LOCK TABLES `fields_meta_data` WRITE;
/*!40000 ALTER TABLE `fields_meta_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_rel`
--

DROP TABLE IF EXISTS `folders_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_rel`
--

LOCK TABLES `folders_rel` WRITE;
/*!40000 ALTER TABLE `folders_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_subscriptions`
--

DROP TABLE IF EXISTS `folders_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_subscriptions`
--

LOCK TABLES `folders_subscriptions` WRITE;
/*!40000 ALTER TABLE `folders_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_maps`
--

DROP TABLE IF EXISTS `import_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text,
  `default_values` text,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_maps`
--

LOCK TABLES `import_maps` WRITE;
/*!40000 ALTER TABLE `import_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email`
--

DROP TABLE IF EXISTS `inbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text,
  `delete_seen` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email`
--

LOCK TABLES `inbound_email` WRITE;
/*!40000 ALTER TABLE `inbound_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_autoreply`
--

DROP TABLE IF EXISTS `inbound_email_autoreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_autoreply`
--

LOCK TABLES `inbound_email_autoreply` WRITE;
/*!40000 ALTER TABLE `inbound_email_autoreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_autoreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_cache_ts`
--

DROP TABLE IF EXISTS `inbound_email_cache_ts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_cache_ts`
--

LOCK TABLES `inbound_email_cache_ts` WRITE;
/*!40000 ALTER TABLE `inbound_email_cache_ts` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_cache_ts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_queue`
--

DROP TABLE IF EXISTS `job_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text,
  `target` varchar(255) DEFAULT NULL,
  `data` text,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_queue`
--

LOCK TABLES `job_queue` WRITE;
/*!40000 ALTER TABLE `job_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_audit`
--

DROP TABLE IF EXISTS `leads_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_audit`
--

LOCK TABLES `leads_audit` WRITE;
/*!40000 ALTER TABLE `leads_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linked_documents`
--

DROP TABLE IF EXISTS `linked_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linked_documents`
--

LOCK TABLES `linked_documents` WRITE;
/*!40000 ALTER TABLE `linked_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `linked_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_contacts`
--

DROP TABLE IF EXISTS `meetings_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_contacts`
--

LOCK TABLES `meetings_contacts` WRITE;
/*!40000 ALTER TABLE `meetings_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_leads`
--

DROP TABLE IF EXISTS `meetings_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_leads`
--

LOCK TABLES `meetings_leads` WRITE;
/*!40000 ALTER TABLE `meetings_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_users`
--

DROP TABLE IF EXISTS `meetings_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_users`
--

LOCK TABLES `meetings_users` WRITE;
/*!40000 ALTER TABLE `meetings_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mno_taxes`
--

DROP TABLE IF EXISTS `mno_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mno_taxes` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `rate` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mno_taxes`
--

LOCK TABLES `mno_taxes` WRITE;
/*!40000 ALTER TABLE `mno_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mno_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mno_taxes_audit`
--

DROP TABLE IF EXISTS `mno_taxes_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mno_taxes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_mno_taxes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mno_taxes_audit`
--

LOCK TABLES `mno_taxes_audit` WRITE;
/*!40000 ALTER TABLE `mno_taxes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `mno_taxes_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumer`
--

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonce`
--

LOCK TABLES `oauth_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_tokens`
--

DROP TABLE IF EXISTS `oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_tokens`
--

LOCK TABLES `oauth_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_audit`
--

DROP TABLE IF EXISTS `opportunities_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_audit`
--

LOCK TABLES `opportunities_audit` WRITE;
/*!40000 ALTER TABLE `opportunities_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_contacts`
--

DROP TABLE IF EXISTS `opportunities_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_contacts`
--

LOCK TABLES `opportunities_contacts` WRITE;
/*!40000 ALTER TABLE `opportunities_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_additio_oqc_product`
--

DROP TABLE IF EXISTS `oqc_additio_oqc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_additio_oqc_product` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_addition_ida` varchar(36) DEFAULT NULL,
  `oqc_product_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_additio_oqc_product_ida1` (`oqc_addition_ida`),
  KEY `oqc_additio_oqc_product_idb2` (`oqc_product_idb`),
  KEY `oqc_additio_oqc_product_idc3` (`oqc_addition_ida`,`oqc_product_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_additio_oqc_product`
--

LOCK TABLES `oqc_additio_oqc_product` WRITE;
/*!40000 ALTER TABLE `oqc_additio_oqc_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_additio_oqc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_additio_oqc_service`
--

DROP TABLE IF EXISTS `oqc_additio_oqc_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_additio_oqc_service` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_addition_ida` varchar(36) DEFAULT NULL,
  `oqc_service_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_additio_oqc_service_ida1` (`oqc_addition_ida`),
  KEY `oqc_additio_oqc_service_idb2` (`oqc_service_idb`),
  KEY `oqc_additio_oqc_service_idc3` (`oqc_addition_ida`,`oqc_service_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_additio_oqc_service`
--

LOCK TABLES `oqc_additio_oqc_service` WRITE;
/*!40000 ALTER TABLE `oqc_additio_oqc_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_additio_oqc_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_addition`
--

DROP TABLE IF EXISTS `oqc_addition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_addition` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_addition_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `attachments` varchar(255) DEFAULT NULL,
  `document_id` char(36) DEFAULT NULL,
  `abbreviation` varchar(100) DEFAULT 'Ad',
  `company_id` char(36) DEFAULT NULL,
  `technicalcontact_id` char(36) DEFAULT NULL,
  `contactperson_id` char(36) DEFAULT NULL,
  `clienttechnicalcontact_id` char(36) DEFAULT NULL,
  `clientcontact_id` char(36) DEFAULT NULL,
  `svnumber` varchar(255) DEFAULT NULL,
  `textblocksequence` text,
  `attachmentsequence` text,
  `idoffreetextblock` char(36) DEFAULT NULL,
  `previousrevision` varchar(36) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nextrevisions` text,
  `quote_leadtime` varchar(255) DEFAULT '1 month',
  `shipment_terms` varchar(100) DEFAULT NULL,
  `payment_terms` varchar(255) DEFAULT '30 days net',
  `quote_validity` varchar(255) DEFAULT '60 days',
  `total_cost` double DEFAULT NULL,
  `grand_total_vat` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `install_cost` double DEFAULT NULL,
  `shipment_cost` double DEFAULT NULL,
  `warranty` varchar(255) DEFAULT '30 days',
  `currency_id` char(36) DEFAULT NULL,
  `oqc_template` varchar(36) DEFAULT 'Addition',
  `contractid` varchar(36) DEFAULT NULL,
  `is_latest` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_additionnumk` (`oqc_addition_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_addition`
--

LOCK TABLES `oqc_addition` WRITE;
/*!40000 ALTER TABLE `oqc_addition` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_addition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_addition_accounts`
--

DROP TABLE IF EXISTS `oqc_addition_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_addition_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_addition_ida` varchar(36) DEFAULT NULL,
  `accounts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_addition_accounts_ida1` (`oqc_addition_ida`),
  KEY `oqc_addition_accounts_idb2` (`accounts_idb`),
  KEY `oqc_addition_accounts_idc3` (`oqc_addition_ida`,`accounts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_addition_accounts`
--

LOCK TABLES `oqc_addition_accounts` WRITE;
/*!40000 ALTER TABLE `oqc_addition_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_addition_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_addition_audit`
--

DROP TABLE IF EXISTS `oqc_addition_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_addition_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_addition_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_addition_audit`
--

LOCK TABLES `oqc_addition_audit` WRITE;
/*!40000 ALTER TABLE `oqc_addition_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_addition_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_addition_contacts`
--

DROP TABLE IF EXISTS `oqc_addition_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_addition_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_addition_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_addition_contacts_ida1` (`oqc_addition_ida`),
  KEY `oqc_addition_contacts_idb2` (`contacts_idb`),
  KEY `oqc_addition_contacts_idc3` (`oqc_addition_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_addition_contacts`
--

LOCK TABLES `oqc_addition_contacts` WRITE;
/*!40000 ALTER TABLE `oqc_addition_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_addition_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_addition_documents`
--

DROP TABLE IF EXISTS `oqc_addition_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_addition_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_addition_ida` varchar(36) DEFAULT NULL,
  `documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_addition_documents_ida1` (`oqc_addition_ida`),
  KEY `oqc_addition_documents_idb2` (`documents_idb`),
  KEY `oqc_addition_documents_idc3` (`oqc_addition_ida`,`documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_addition_documents`
--

LOCK TABLES `oqc_addition_documents` WRITE;
/*!40000 ALTER TABLE `oqc_addition_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_addition_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_category`
--

DROP TABLE IF EXISTS `oqc_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_category` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `subcategories` text,
  `number` varchar(36) DEFAULT NULL,
  `catalog_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_category`
--

LOCK TABLES `oqc_category` WRITE;
/*!40000 ALTER TABLE `oqc_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contrac_oqc_product`
--

DROP TABLE IF EXISTS `oqc_contrac_oqc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contrac_oqc_product` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `oqc_product_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contrac_oqc_product_ida1` (`oqc_contract_ida`),
  KEY `oqc_contrac_oqc_product_idb2` (`oqc_product_idb`),
  KEY `oqc_contrac_oqc_product_idc3` (`oqc_contract_ida`,`oqc_product_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contrac_oqc_product`
--

LOCK TABLES `oqc_contrac_oqc_product` WRITE;
/*!40000 ALTER TABLE `oqc_contrac_oqc_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contrac_oqc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contrac_oqc_service`
--

DROP TABLE IF EXISTS `oqc_contrac_oqc_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contrac_oqc_service` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `oqc_service_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contrac_oqc_service_ida1` (`oqc_contract_ida`),
  KEY `oqc_contrac_oqc_service_idb2` (`oqc_service_idb`),
  KEY `oqc_contrac_oqc_service_idc3` (`oqc_contract_ida`,`oqc_service_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contrac_oqc_service`
--

LOCK TABLES `oqc_contrac_oqc_service` WRITE;
/*!40000 ALTER TABLE `oqc_contrac_oqc_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contrac_oqc_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract`
--

DROP TABLE IF EXISTS `oqc_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_contract_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `attachments` varchar(255) DEFAULT NULL,
  `document_id` char(36) DEFAULT NULL,
  `abbreviation` varchar(100) DEFAULT 'Cnt',
  `company_id` char(36) DEFAULT NULL,
  `technicalcontact_id` char(36) DEFAULT NULL,
  `contactperson_id` char(36) DEFAULT NULL,
  `clienttechnicalcontact_id` char(36) DEFAULT NULL,
  `clientcontact_id` char(36) DEFAULT NULL,
  `svnumber` varchar(255) DEFAULT NULL,
  `textblocksequence` text,
  `attachmentsequence` text,
  `idoffreetextblock` char(36) DEFAULT NULL,
  `previousrevision` varchar(36) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nextrevisions` text,
  `quote_leadtime` varchar(255) DEFAULT '1 month',
  `shipment_terms` varchar(100) DEFAULT NULL,
  `payment_terms` varchar(255) DEFAULT '30 days net',
  `quote_validity` varchar(255) DEFAULT '60 days',
  `total_cost` double DEFAULT NULL,
  `grand_total_vat` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `install_cost` double DEFAULT NULL,
  `shipment_cost` double DEFAULT NULL,
  `warranty` varchar(255) DEFAULT '30 days',
  `currency_id` char(36) DEFAULT NULL,
  `oqc_template` varchar(36) DEFAULT 'Contract',
  `idsofadditions` text,
  `offeringid` varchar(36) DEFAULT NULL,
  `signedcontractdocument_id` char(36) DEFAULT NULL,
  `issigned` tinyint(1) DEFAULT NULL,
  `signedon` date DEFAULT NULL,
  `periodofnotice` varchar(100) DEFAULT '6months',
  `is_latest` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_contractnumk` (`oqc_contract_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract`
--

LOCK TABLES `oqc_contract` WRITE;
/*!40000 ALTER TABLE `oqc_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract_accounts`
--

DROP TABLE IF EXISTS `oqc_contract_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `accounts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contract_accounts_ida1` (`oqc_contract_ida`),
  KEY `oqc_contract_accounts_idb2` (`accounts_idb`),
  KEY `oqc_contract_accounts_idc3` (`oqc_contract_ida`,`accounts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract_accounts`
--

LOCK TABLES `oqc_contract_accounts` WRITE;
/*!40000 ALTER TABLE `oqc_contract_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract_audit`
--

DROP TABLE IF EXISTS `oqc_contract_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_contract_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract_audit`
--

LOCK TABLES `oqc_contract_audit` WRITE;
/*!40000 ALTER TABLE `oqc_contract_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract_contacts`
--

DROP TABLE IF EXISTS `oqc_contract_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contract_contacts_ida1` (`oqc_contract_ida`),
  KEY `oqc_contract_contacts_idb2` (`contacts_idb`),
  KEY `oqc_contract_contacts_idc3` (`oqc_contract_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract_contacts`
--

LOCK TABLES `oqc_contract_contacts` WRITE;
/*!40000 ALTER TABLE `oqc_contract_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract_documents`
--

DROP TABLE IF EXISTS `oqc_contract_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contract_documents_ida1` (`oqc_contract_ida`),
  KEY `oqc_contract_documents_idb2` (`documents_idb`),
  KEY `oqc_contract_documents_idc3` (`oqc_contract_ida`,`documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract_documents`
--

LOCK TABLES `oqc_contract_documents` WRITE;
/*!40000 ALTER TABLE `oqc_contract_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract_oqc_addition`
--

DROP TABLE IF EXISTS `oqc_contract_oqc_addition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract_oqc_addition` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `oqc_addition_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contract_oqc_addition_ida1` (`oqc_contract_ida`),
  KEY `oqc_contract_oqc_addition_idb2` (`oqc_addition_idb`),
  KEY `oqc_contract_oqc_addition_idc3` (`oqc_contract_ida`,`oqc_addition_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract_oqc_addition`
--

LOCK TABLES `oqc_contract_oqc_addition` WRITE;
/*!40000 ALTER TABLE `oqc_contract_oqc_addition` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract_oqc_addition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_contract_project`
--

DROP TABLE IF EXISTS `oqc_contract_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_contract_project` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_contract_ida` varchar(36) DEFAULT NULL,
  `project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_contract_project_ida1` (`oqc_contract_ida`),
  KEY `oqc_contract_project_idb2` (`project_idb`),
  KEY `oqc_contract_project_idc3` (`oqc_contract_ida`,`project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_contract_project`
--

LOCK TABLES `oqc_contract_project` WRITE;
/*!40000 ALTER TABLE `oqc_contract_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_contract_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_default`
--

DROP TABLE IF EXISTS `oqc_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_default` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `param` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_default`
--

LOCK TABLES `oqc_default` WRITE;
/*!40000 ALTER TABLE `oqc_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_editedtextblock`
--

DROP TABLE IF EXISTS `oqc_editedtextblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_editedtextblock` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `textblock_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_editedtextblock`
--

LOCK TABLES `oqc_editedtextblock` WRITE;
/*!40000 ALTER TABLE `oqc_editedtextblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_editedtextblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externaact_accounts`
--

DROP TABLE IF EXISTS `oqc_externaact_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externaact_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_externalcontract_ida` varchar(36) DEFAULT NULL,
  `accounts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_externaact_accounts_ida1` (`oqc_externalcontract_ida`),
  KEY `oqc_externaact_accounts_idb2` (`accounts_idb`),
  KEY `oqc_externaact_accounts_idc3` (`oqc_externalcontract_ida`,`accounts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externaact_accounts`
--

LOCK TABLES `oqc_externaact_accounts` WRITE;
/*!40000 ALTER TABLE `oqc_externaact_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externaact_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externaact_contacts`
--

DROP TABLE IF EXISTS `oqc_externaact_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externaact_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_externalcontract_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_externaact_contacts_ida1` (`oqc_externalcontract_ida`),
  KEY `oqc_externaact_contacts_idb2` (`contacts_idb`),
  KEY `oqc_externaact_contacts_idc3` (`oqc_externalcontract_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externaact_contacts`
--

LOCK TABLES `oqc_externaact_contacts` WRITE;
/*!40000 ALTER TABLE `oqc_externaact_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externaact_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externact_documents`
--

DROP TABLE IF EXISTS `oqc_externact_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externact_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_externalcontract_ida` varchar(36) DEFAULT NULL,
  `documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_externact_documents_ida1` (`oqc_externalcontract_ida`),
  KEY `oqc_externact_documents_idb2` (`documents_idb`),
  KEY `oqc_externact_documents_idc3` (`oqc_externalcontract_ida`,`documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externact_documents`
--

LOCK TABLES `oqc_externact_documents` WRITE;
/*!40000 ALTER TABLE `oqc_externact_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externact_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontract`
--

DROP TABLE IF EXISTS `oqc_externalcontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontract` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_externalcontract_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `contractnumber` varchar(255) DEFAULT NULL,
  `recordtoken` varchar(255) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `clientcontact_id` char(36) DEFAULT NULL,
  `technicalcontact_id` char(36) DEFAULT NULL,
  `minimumduration` date DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `externalcontracttype` varchar(100) DEFAULT 'EVB-IT System',
  `externalcontractmatter` text,
  `contractnumberclient` varchar(255) DEFAULT NULL,
  `dmsnumber` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(100) DEFAULT 'WEB',
  `payforefford` tinyint(1) DEFAULT NULL,
  `paytravelcosts` tinyint(1) DEFAULT NULL,
  `payextracosts` tinyint(1) DEFAULT NULL,
  `payforexpense` tinyint(1) DEFAULT NULL,
  `payforexpensedescription` text,
  `copydocumentationallowed` tinyint(1) DEFAULT NULL,
  `numberofdocumentationcopies` int(11) DEFAULT NULL,
  `cancellationdate` date DEFAULT NULL,
  `warranteedeadline` int(11) DEFAULT NULL,
  `deliveryaddress` varchar(255) DEFAULT NULL,
  `completionaddress` varchar(255) DEFAULT NULL,
  `attachmentsequence` text,
  `kst` int(12) DEFAULT NULL,
  `svnumbers` text,
  `productnumber` varchar(255) DEFAULT NULL,
  `costs` text,
  `positions` text,
  `monthsguaranteed` int(3) DEFAULT NULL,
  `cancellationperiod` text,
  `endperiod` varchar(100) DEFAULT '3months',
  `finalcosts` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `minpayment` double DEFAULT NULL,
  `maxpayment` double DEFAULT NULL,
  `previousrevision` varchar(36) DEFAULT NULL,
  `nextrevisions` text,
  `version` int(11) DEFAULT NULL,
  `warn_in_months` varchar(3) DEFAULT '2',
  `already_notified` tinyint(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  `is_latest` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_externalcontractnumk` (`oqc_externalcontract_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontract`
--

LOCK TABLES `oqc_externalcontract` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontract` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontract_audit`
--

DROP TABLE IF EXISTS `oqc_externalcontract_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontract_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_externalcontract_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontract_audit`
--

LOCK TABLES `oqc_externalcontract_audit` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontract_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontract_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontractcosts`
--

DROP TABLE IF EXISTS `oqc_externalcontractcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontractcosts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `category` varchar(25) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `paymentinterval` varchar(100) DEFAULT 'once',
  `year` int(11) DEFAULT NULL,
  `detailedcost_ids` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontractcosts`
--

LOCK TABLES `oqc_externalcontractcosts` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontractcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontractcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontractcosts_audit`
--

DROP TABLE IF EXISTS `oqc_externalcontractcosts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontractcosts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_externalcontractcosts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontractcosts_audit`
--

LOCK TABLES `oqc_externalcontractcosts_audit` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontractcosts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontractcosts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontractdetailedcosts`
--

DROP TABLE IF EXISTS `oqc_externalcontractdetailedcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontractdetailedcosts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `month` int(2) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `cost_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontractdetailedcosts`
--

LOCK TABLES `oqc_externalcontractdetailedcosts` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontractdetailedcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontractdetailedcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontractdetailedcosts_audit`
--

DROP TABLE IF EXISTS `oqc_externalcontractdetailedcosts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontractdetailedcosts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_externalcontractdetailedcosts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontractdetailedcosts_audit`
--

LOCK TABLES `oqc_externalcontractdetailedcosts_audit` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontractdetailedcosts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontractdetailedcosts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontractpositions`
--

DROP TABLE IF EXISTS `oqc_externalcontractpositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontractpositions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'hardware',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontractpositions`
--

LOCK TABLES `oqc_externalcontractpositions` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontractpositions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontractpositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externalcontractpositions_audit`
--

DROP TABLE IF EXISTS `oqc_externalcontractpositions_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externalcontractpositions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_externalcontractpositions_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externalcontractpositions_audit`
--

LOCK TABLES `oqc_externalcontractpositions_audit` WRITE;
/*!40000 ALTER TABLE `oqc_externalcontractpositions_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externalcontractpositions_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externaoqc_contract`
--

DROP TABLE IF EXISTS `oqc_externaoqc_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externaoqc_contract` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_externalcontract_ida` varchar(36) DEFAULT NULL,
  `oqc_contract_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_externaoqc_contract_ida1` (`oqc_externalcontract_ida`),
  KEY `oqc_externaoqc_contract_idb2` (`oqc_contract_idb`),
  KEY `oqc_externaoqc_contract_idc3` (`oqc_externalcontract_ida`,`oqc_contract_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externaoqc_contract`
--

LOCK TABLES `oqc_externaoqc_contract` WRITE;
/*!40000 ALTER TABLE `oqc_externaoqc_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externaoqc_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_externaract_project`
--

DROP TABLE IF EXISTS `oqc_externaract_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_externaract_project` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_externalcontract_ida` varchar(36) DEFAULT NULL,
  `project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_externaract_project_ida1` (`oqc_externalcontract_ida`),
  KEY `oqc_externaract_project_idb2` (`project_idb`),
  KEY `oqc_externaract_project_idc3` (`oqc_externalcontract_ida`,`project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_externaract_project`
--

LOCK TABLES `oqc_externaract_project` WRITE;
/*!40000 ALTER TABLE `oqc_externaract_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_externaract_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offerin_oqc_product`
--

DROP TABLE IF EXISTS `oqc_offerin_oqc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offerin_oqc_product` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `oqc_product_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offerin_oqc_product_ida1` (`oqc_offering_ida`),
  KEY `oqc_offerin_oqc_product_idb2` (`oqc_product_idb`),
  KEY `oqc_offerin_oqc_product_idc3` (`oqc_offering_ida`,`oqc_product_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offerin_oqc_product`
--

LOCK TABLES `oqc_offerin_oqc_product` WRITE;
/*!40000 ALTER TABLE `oqc_offerin_oqc_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offerin_oqc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offerin_oqc_service`
--

DROP TABLE IF EXISTS `oqc_offerin_oqc_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offerin_oqc_service` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `oqc_service_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offerin_oqc_service_ida1` (`oqc_offering_ida`),
  KEY `oqc_offerin_oqc_service_idb2` (`oqc_service_idb`),
  KEY `oqc_offerin_oqc_service_idc3` (`oqc_offering_ida`,`oqc_service_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offerin_oqc_service`
--

LOCK TABLES `oqc_offerin_oqc_service` WRITE;
/*!40000 ALTER TABLE `oqc_offerin_oqc_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offerin_oqc_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering`
--

DROP TABLE IF EXISTS `oqc_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_offering_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `attachments` varchar(255) DEFAULT NULL,
  `document_id` char(36) DEFAULT NULL,
  `abbreviation` varchar(100) DEFAULT 'Qt',
  `company_id` char(36) DEFAULT NULL,
  `technicalcontact_id` char(36) DEFAULT NULL,
  `contactperson_id` char(36) DEFAULT NULL,
  `clienttechnicalcontact_id` char(36) DEFAULT NULL,
  `clientcontact_id` char(36) DEFAULT NULL,
  `svnumber` varchar(255) DEFAULT NULL,
  `textblocksequence` text,
  `attachmentsequence` text,
  `idoffreetextblock` char(36) DEFAULT NULL,
  `previousrevision` varchar(36) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nextrevisions` text,
  `quote_leadtime` varchar(255) DEFAULT '1 month',
  `shipment_terms` varchar(100) DEFAULT NULL,
  `payment_terms` varchar(255) DEFAULT '30 days net',
  `quote_validity` varchar(255) DEFAULT '60 days',
  `total_cost` double DEFAULT NULL,
  `grand_total_vat` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `install_cost` double DEFAULT NULL,
  `shipment_cost` double DEFAULT NULL,
  `warranty` varchar(255) DEFAULT '30 days',
  `currency_id` char(36) DEFAULT NULL,
  `oqc_template` varchar(36) DEFAULT 'Offering',
  `deadline` date DEFAULT NULL,
  `contractid` varchar(36) DEFAULT NULL,
  `is_latest` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_offeringnumk` (`oqc_offering_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering`
--

LOCK TABLES `oqc_offering` WRITE;
/*!40000 ALTER TABLE `oqc_offering` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_accounts`
--

DROP TABLE IF EXISTS `oqc_offering_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `accounts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offering_accounts_ida1` (`oqc_offering_ida`),
  KEY `oqc_offering_accounts_idb2` (`accounts_idb`),
  KEY `oqc_offering_accounts_idc3` (`oqc_offering_ida`,`accounts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_accounts`
--

LOCK TABLES `oqc_offering_accounts` WRITE;
/*!40000 ALTER TABLE `oqc_offering_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_audit`
--

DROP TABLE IF EXISTS `oqc_offering_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_offering_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_audit`
--

LOCK TABLES `oqc_offering_audit` WRITE;
/*!40000 ALTER TABLE `oqc_offering_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_contacts`
--

DROP TABLE IF EXISTS `oqc_offering_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offering_contacts_ida1` (`oqc_offering_ida`),
  KEY `oqc_offering_contacts_idb2` (`contacts_idb`),
  KEY `oqc_offering_contacts_idc3` (`oqc_offering_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_contacts`
--

LOCK TABLES `oqc_offering_contacts` WRITE;
/*!40000 ALTER TABLE `oqc_offering_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_documents`
--

DROP TABLE IF EXISTS `oqc_offering_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offering_documents_ida1` (`oqc_offering_ida`),
  KEY `oqc_offering_documents_idb2` (`documents_idb`),
  KEY `oqc_offering_documents_idc3` (`oqc_offering_ida`,`documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_documents`
--

LOCK TABLES `oqc_offering_documents` WRITE;
/*!40000 ALTER TABLE `oqc_offering_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_opportunities`
--

DROP TABLE IF EXISTS `oqc_offering_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `opportunities_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offering_opportunities_ida1` (`oqc_offering_ida`),
  KEY `oqc_offering_opportunities_idb2` (`opportunities_idb`),
  KEY `oqc_offering_opportunities_idc3` (`oqc_offering_ida`,`opportunities_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_opportunities`
--

LOCK TABLES `oqc_offering_opportunities` WRITE;
/*!40000 ALTER TABLE `oqc_offering_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_oqc_contract`
--

DROP TABLE IF EXISTS `oqc_offering_oqc_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_oqc_contract` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `oqc_contract_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offering_oqc_contract_ida1` (`oqc_offering_ida`),
  KEY `oqc_offering_oqc_contract_idb2` (`oqc_contract_idb`),
  KEY `oqc_offering_oqc_contract_idc3` (`oqc_offering_ida`,`oqc_contract_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_oqc_contract`
--

LOCK TABLES `oqc_offering_oqc_contract` WRITE;
/*!40000 ALTER TABLE `oqc_offering_oqc_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_oqc_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_offering_project`
--

DROP TABLE IF EXISTS `oqc_offering_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_offering_project` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_offering_ida` varchar(36) DEFAULT NULL,
  `project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_offering_project_ida1` (`oqc_offering_ida`),
  KEY `oqc_offering_project_idb2` (`project_idb`),
  KEY `oqc_offering_project_idc3` (`oqc_offering_ida`,`project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_offering_project`
--

LOCK TABLES `oqc_offering_project` WRITE;
/*!40000 ALTER TABLE `oqc_offering_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_offering_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_product`
--

DROP TABLE IF EXISTS `oqc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_product` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_product_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `price` double DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `supplier_id` char(36) DEFAULT NULL,
  `price_recurring` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `is_recurring` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `oqc_vat` varchar(10) DEFAULT NULL,
  `relatedcategory_id` char(36) DEFAULT NULL,
  `personincharge_id` char(36) DEFAULT NULL,
  `assigned_employee_id` char(36) DEFAULT NULL,
  `unit` varchar(100) DEFAULT 'pieces',
  `catalog_id` char(36) DEFAULT NULL,
  `price_text` varchar(255) DEFAULT NULL,
  `price_recurring_text` varchar(255) DEFAULT NULL,
  `monthsguaranteed` int(3) DEFAULT NULL,
  `cancellationperiod` int(3) DEFAULT NULL,
  `packaged_product_ids` text,
  `changes_from_previous` text,
  `previousrevision` varchar(36) DEFAULT NULL,
  `nextrevisions` text,
  `version` int(11) DEFAULT NULL,
  `attachmentsequence` text,
  `publish_state` varchar(100) DEFAULT 'pending',
  `unique_identifier` int(11) DEFAULT NULL,
  `image_filename` text,
  `image_unique_filename` text,
  `image_mime_type` varchar(10) DEFAULT NULL,
  `catalog_position` int(11) DEFAULT NULL,
  `is_latest` tinyint(1) DEFAULT '1',
  `svnumber` varchar(255) DEFAULT NULL,
  `is_option` tinyint(1) DEFAULT '0',
  `optionssequence` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_productnumk` (`oqc_product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_product`
--

LOCK TABLES `oqc_product` WRITE;
/*!40000 ALTER TABLE `oqc_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_product_audit`
--

DROP TABLE IF EXISTS `oqc_product_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_product_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_product_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_product_audit`
--

LOCK TABLES `oqc_product_audit` WRITE;
/*!40000 ALTER TABLE `oqc_product_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_product_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_product_documents`
--

DROP TABLE IF EXISTS `oqc_product_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_product_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_product_ida` varchar(36) DEFAULT NULL,
  `documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_product_documents_ida1` (`oqc_product_ida`),
  KEY `oqc_product_documents_idb2` (`documents_idb`),
  KEY `oqc_product_documents_idc3` (`oqc_product_ida`,`documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_product_documents`
--

LOCK TABLES `oqc_product_documents` WRITE;
/*!40000 ALTER TABLE `oqc_product_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_product_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_productcatalog`
--

DROP TABLE IF EXISTS `oqc_productcatalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_productcatalog` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_productcatalog_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `active` tinyint(1) DEFAULT '1',
  `validfrom` date DEFAULT NULL,
  `validto` date DEFAULT NULL,
  `frontpage_id` char(36) DEFAULT NULL,
  `attachment_id` char(36) DEFAULT NULL,
  `document_id` char(36) DEFAULT NULL,
  `category_ids` text,
  `oqc_template` varchar(36) DEFAULT 'Contract',
  `currency_id` char(36) DEFAULT NULL,
  `oqc_catalog_discount` float(5,2) DEFAULT '0.00',
  `pdf_document_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_productcatalognumk` (`oqc_productcatalog_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_productcatalog`
--

LOCK TABLES `oqc_productcatalog` WRITE;
/*!40000 ALTER TABLE `oqc_productcatalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_productcatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_productcatalog_audit`
--

DROP TABLE IF EXISTS `oqc_productcatalog_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_productcatalog_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_productcatalog_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_productcatalog_audit`
--

LOCK TABLES `oqc_productcatalog_audit` WRITE;
/*!40000 ALTER TABLE `oqc_productcatalog_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_productcatalog_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_productcatalog_documents`
--

DROP TABLE IF EXISTS `oqc_productcatalog_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_productcatalog_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_productcatalog_ida` varchar(36) DEFAULT NULL,
  `documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oqc_productcatalog_documents_ida1` (`oqc_productcatalog_ida`),
  KEY `oqc_productcatalog_documents_idb2` (`documents_idb`),
  KEY `oqc_productcatalog_documents_idc3` (`oqc_productcatalog_ida`,`documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_productcatalog_documents`
--

LOCK TABLES `oqc_productcatalog_documents` WRITE;
/*!40000 ALTER TABLE `oqc_productcatalog_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_productcatalog_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_service`
--

DROP TABLE IF EXISTS `oqc_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_service` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `quantity` double DEFAULT '1',
  `price` double DEFAULT '0',
  `discount_value` double DEFAULT '0',
  `vat` tinyint(1) DEFAULT NULL,
  `oqc_vat` varchar(255) DEFAULT NULL,
  `zeitbezug` varchar(100) DEFAULT 'once',
  `discount_select` varchar(100) DEFAULT 'rel',
  `unit` varchar(100) DEFAULT 'pieces',
  `service_currency_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_service`
--

LOCK TABLES `oqc_service` WRITE;
/*!40000 ALTER TABLE `oqc_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_task`
--

DROP TABLE IF EXISTS `oqc_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_task` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `oqc_task_number` int(11) NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(50) DEFAULT 'Tsk',
  `svnumber` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `notify` tinyint(1) DEFAULT '1',
  `remind` tinyint(1) DEFAULT '1',
  `reminder_interval` int(11) DEFAULT '-1',
  `date_reminder` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT 'Medium',
  `progress` varchar(255) DEFAULT NULL,
  `approval_ratio` varchar(255) DEFAULT NULL,
  `userslist` varchar(255) DEFAULT NULL,
  `isdone` tinyint(1) DEFAULT NULL,
  `conjugate` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_tasknumk` (`oqc_task_number`),
  KEY `idx_oqc_tsk_name` (`name`),
  KEY `idx_oqc_tsk_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_oqc_tsk_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_task`
--

LOCK TABLES `oqc_task` WRITE;
/*!40000 ALTER TABLE `oqc_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_task_audit`
--

DROP TABLE IF EXISTS `oqc_task_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_task_audit`
--

LOCK TABLES `oqc_task_audit` WRITE;
/*!40000 ALTER TABLE `oqc_task_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_task_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_task_users`
--

DROP TABLE IF EXISTS `oqc_task_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_task_users` (
  `id` varchar(36) NOT NULL,
  `oqc_task_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `progress` varchar(25) DEFAULT NULL,
  `accept_status` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `resolution` varchar(25) DEFAULT NULL,
  `comment` text,
  `attachmentsequence` text,
  `position` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_usr_oqc_task1` (`oqc_task_id`),
  KEY `idx_usr_users2` (`user_id`),
  KEY `idx_oqc_task_users` (`oqc_task_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_task_users`
--

LOCK TABLES `oqc_task_users` WRITE;
/*!40000 ALTER TABLE `oqc_task_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_task_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_textblock`
--

DROP TABLE IF EXISTS `oqc_textblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_textblock` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `oqc_textblock_number` int(11) NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oqc_textblocknumk` (`oqc_textblock_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_textblock`
--

LOCK TABLES `oqc_textblock` WRITE;
/*!40000 ALTER TABLE `oqc_textblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_textblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oqc_textblock_audit`
--

DROP TABLE IF EXISTS `oqc_textblock_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oqc_textblock_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_oqc_textblock_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oqc_textblock_audit`
--

LOCK TABLES `oqc_textblock_audit` WRITE;
/*!40000 ALTER TABLE `oqc_textblock_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oqc_textblock_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_email`
--

DROP TABLE IF EXISTS `outbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` int(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `oe_user_id_idx` (`id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_email`
--

LOCK TABLES `outbound_email` WRITE;
/*!40000 ALTER TABLE `outbound_email` DISABLE KEYS */;
INSERT INTO `outbound_email` VALUES ('66cf0c71-483f-2ab1-d0d9-55c0710b8899','system','system','1','SMTP','other','localhost',25,'','',0,0),('66d7f3c6-2e2c-342c-1f58-55c071924e89','system','system','1','SMTP','other','',25,'','',1,0);
/*!40000 ALTER TABLE `outbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task`
--

DROP TABLE IF EXISTS `project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` text,
  `predecessors` text,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT '1',
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int(11) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task`
--

LOCK TABLES `project_task` WRITE;
/*!40000 ALTER TABLE `project_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task_audit`
--

DROP TABLE IF EXISTS `project_task_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task_audit`
--

LOCK TABLES `project_task_audit` WRITE;
/*!40000 ALTER TABLE `project_task_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_accounts`
--

DROP TABLE IF EXISTS `projects_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_accounts`
--

LOCK TABLES `projects_accounts` WRITE;
/*!40000 ALTER TABLE `projects_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_bugs`
--

DROP TABLE IF EXISTS `projects_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_bugs`
--

LOCK TABLES `projects_bugs` WRITE;
/*!40000 ALTER TABLE `projects_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_cases`
--

DROP TABLE IF EXISTS `projects_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_cases`
--

LOCK TABLES `projects_cases` WRITE;
/*!40000 ALTER TABLE `projects_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_contacts`
--

DROP TABLE IF EXISTS `projects_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_contacts`
--

LOCK TABLES `projects_contacts` WRITE;
/*!40000 ALTER TABLE `projects_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_opportunities`
--

DROP TABLE IF EXISTS `projects_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_opportunities`
--

LOCK TABLES `projects_opportunities` WRITE;
/*!40000 ALTER TABLE `projects_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_products`
--

DROP TABLE IF EXISTS `projects_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_products`
--

LOCK TABLES `projects_products` WRITE;
/*!40000 ALTER TABLE `projects_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_list_campaigns`
--

DROP TABLE IF EXISTS `prospect_list_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_list_campaigns`
--

LOCK TABLES `prospect_list_campaigns` WRITE;
/*!40000 ALTER TABLE `prospect_list_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_list_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists`
--

DROP TABLE IF EXISTS `prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists`
--

LOCK TABLES `prospect_lists` WRITE;
/*!40000 ALTER TABLE `prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists_prospects`
--

DROP TABLE IF EXISTS `prospect_lists_prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists_prospects`
--

LOCK TABLES `prospect_lists_prospects` WRITE;
/*!40000 ALTER TABLE `prospect_lists_prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists_prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospects`
--

DROP TABLE IF EXISTS `prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospects`
--

LOCK TABLES `prospects` WRITE;
/*!40000 ALTER TABLE `prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(128) DEFAULT NULL,
  `join_key_lhs` varchar(128) DEFAULT NULL,
  `join_key_rhs` varchar(128) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES ('10ccd312-eb3a-1805-3929-55c064bdede1','emails_tasks_rel','Emails','emails','id','Tasks','tasks','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Tasks',0,0),('113a34b2-6e52-8266-ece5-55c0642e815a','accounts_opportunities','Accounts','accounts','id','Opportunities','opportunities','id','accounts_opportunities','account_id','opportunity_id','many-to-many',NULL,NULL,0,0),('128efd7f-3f8d-0735-7517-55c064441c3c','documents_cases','Documents','documents','id','Cases','cases','id','documents_cases','document_id','case_id','many-to-many',NULL,NULL,0,0),('12e485ab-9f9e-097f-50bd-55c064788c3b','lead_campaign_log','Leads','leads','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Leads',0,0),('13022c8e-a869-94c9-d890-55c064e33e42','oqc_productcatalog_assigned_user','Users','users','id','oqc_ProductCatalog','oqc_productcatalog','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('13e804cc-c825-6cc7-17a5-55c064194f83','oqc_task_created_by','Users','users','id','oqc_Task','oqc_task','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('14dd58fb-57a7-3442-408a-55c064e252de','projects_modified_user','Users','users','id','Project','project','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('14e3a776-3644-adad-0383-55c064604f8a','account_calls','Accounts','accounts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('162876eb-531c-5b9c-6a25-55c0645428fd','meetings_assigned_user','Users','users','id','Meetings','meetings','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1705052d-838e-8394-6116-55c064efe859','project_tasks_modified_user','Users','users','id','ProjectTask','project_task','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('17941b21-42b9-a8e9-6a7b-55c064b972f2','oqc_editedtextblock_created_by','Users','users','id','oqc_EditedTextBlock','oqc_editedtextblock','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1b9f92be-79da-1aab-c370-55c0649e760a','emails_users_rel','Emails','emails','id','Users','users','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Users',0,0),('1bec6ee7-2fe4-b765-07c2-55c0649ce762','campaignlog_sent_emails','CampaignLog','campaign_log','related_id','Emails','emails','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1c723fa5-19b6-5f06-1d4e-55c064793464','oqctask_fellowtasks','oqc_Task','oqc_task','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1eacf9ed-7b52-c823-4211-55c06491ba63','oqc_offering_documents','oqc_Offering','oqc_offering','id','Documents','documents','id','oqc_offering_documents','oqc_offering_ida','documents_idb','many-to-many',NULL,NULL,0,0),('1fc3969d-9e32-65fe-3e83-55c064c63259','projects_created_by','Users','users','id','Project','project','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2112d30c-38f1-c9be-c49b-55c064fee15a','meetings_notes','Meetings','meetings','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('21a21759-1b83-5949-a06e-55c064f1efc3','oqc_contract_officenumber_search','Accounts','accounts_cstm','id_c','oqc_Contract','oqc_contract','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('22508fcd-d814-aa21-0776-55c064649fea','contacts_users','Contacts','contacts','id','Users','users','id','contacts_users','contact_id','user_id','many-to-many',NULL,NULL,0,0),('231d68ff-93af-ba55-10bb-55c06458a4f3','meetings_users','Meetings','meetings','id','Users','users','id','meetings_users','meeting_id','user_id','many-to-many',NULL,NULL,0,0),('268e7e71-343f-4944-fd5d-55c06483625c','emails_project_task_rel','Emails','emails','id','ProjectTask','project_task','id','emails_beans','email_id','bean_id','many-to-many','bean_module','ProjectTask',0,0),('26fb6350-c163-5e45-6d19-55c064ee8345','oqc_task_oqc_productcatalog','oqc_ProductCatalog','oqc_productcatalog','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('276e2a10-b86d-1d2c-eb6a-55c064dd1547','oqc_addition_oqc_service','oqc_Addition','oqc_addition','id','oqc_Service','oqc_service','id','oqc_additio_oqc_service','oqc_addition_ida','oqc_service_idb','many-to-many',NULL,NULL,0,0),('29db45eb-067a-a542-bb9b-55c064bdab8d','bugs_modified_user','Users','users','id','Bugs','bugs','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2a17f01e-7909-7771-9461-55c0644939b3','oqc_task_notes','oqc_Task','oqc_task','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2a680d7d-bcea-9c93-2bda-55c0644229e1','account_meetings','Accounts','accounts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('2a701d2c-07c6-b72a-35cf-55c064db977e','accounts_modified_user','Users','users','id','Accounts','accounts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2b2eeaa9-4a2f-b8a0-98c0-55c0649b4aaf','tasks_modified_user','Users','users','id','Tasks','tasks','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2cbe5919-812d-01b7-c8f9-55c064f8d153','project_tasks_created_by','Users','users','id','ProjectTask','project_task','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2f8b5fd7-cc23-ca22-03c5-55c06417a858','projects_opportunities','Project','project','id','Opportunities','opportunities','id','projects_opportunities','project_id','opportunity_id','many-to-many',NULL,NULL,0,0),('2ffe6085-a032-3294-487b-55c064e585b3','opportunities_modified_user','Users','users','id','Opportunities','opportunities','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('31316b90-26ec-53dd-8567-55c06417a981','documents_accounts','Documents','documents','id','Accounts','accounts','id','documents_accounts','document_id','account_id','many-to-many',NULL,NULL,0,0),('316fbdd0-0437-1239-419c-55c064a2c638','emails_projects_rel','Emails','emails','id','Project','project','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Project',0,0),('31b95ba3-2554-da1b-9155-55c064df6db7','oqc_textblock_modified_user','Users','users','id','oqc_TextBlock','oqc_textblock','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('33834bf5-981d-d681-3f30-55c064d33069','oqc_offering_modified_user','Users','users','id','oqc_Offering','oqc_offering','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('346d573b-589b-8c8d-8047-55c064f24b4f','bugs_created_by','Users','users','id','Bugs','bugs','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('35e5fe65-5c68-6e4e-d931-55c0646affb9','eapm_created_by','Users','users','id','EAPM','eapm','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3691c57c-99e7-33b0-dd00-55c064fa0792','oqc_addition_documents','oqc_Addition','oqc_addition','id','Documents','documents','id','oqc_addition_documents','oqc_addition_ida','documents_idb','many-to-many',NULL,NULL,0,0),('36d0b773-8395-effc-ff7b-55c064334eae','contacts_bugs','Contacts','contacts','id','Bugs','bugs','id','contacts_bugs','contact_id','bug_id','many-to-many',NULL,NULL,0,0),('37a419ad-616f-6b54-5cd0-55c06464a276','accounts_created_by','Users','users','id','Accounts','accounts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3876e645-44f1-4ce8-e6ef-55c064a4c88f','tasks_created_by','Users','users','id','Tasks','tasks','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3bea2d53-aece-3caa-ed5c-55c06417a0d6','oqc_externalcontract_modified_user','Users','users','id','oqc_ExternalContract','oqc_externalcontract','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3c543526-aa75-0fff-f78c-55c06491ca3a','emails_prospects_rel','Emails','emails','id','Prospects','prospects','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Prospects',0,0),('3c6bcf33-04e1-9ff6-9906-55c064ca1c34','oqc_contract_contact_rel','Contacts','contacts','id','oqc_Contract','oqc_contract','clientcontact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3c885686-f098-26fe-3c13-55c064d1bde7','oqc_textblock_created_by','Users','users','id','oqc_TextBlock','oqc_textblock','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3d39c4cd-a318-9254-a0e4-55c0644f7f1e','opportunities_created_by','Users','users','id','Opportunities','opportunities','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3d5bce17-ac00-aa1d-077b-55c064944413','cases_modified_user','Users','users','id','Cases','cases','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3de7c293-4792-4875-722c-55c06467604d','oqc_offering_created_by','Users','users','id','oqc_Offering','oqc_offering','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3f560a10-ba75-8bc1-98af-55c064cff1d7','bugs_assigned_user','Users','users','id','Bugs','bugs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('43673fdf-34e5-cd54-8cda-55c0643464f5','user_direct_reports','Users','users','id','Users','users','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4383c06d-53f9-a206-92d1-55c064e1ad16','eapm_assigned_user','Users','users','id','EAPM','eapm','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('43c86137-484d-f259-5716-55c064cf89b5','campaign_campaigntrakers','Campaigns','campaigns','id','CampaignTrackers','campaign_trkrs','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('43ec57a1-2cdc-18e3-d646-55c0645e628f','account_emails','Accounts','accounts','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('453bc227-44d1-2ba7-ec58-55c064653072','accounts_assigned_user','Users','users','id','Accounts','accounts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('45fed6bf-fc5c-ab0f-5f1d-55c064c99e18','tasks_assigned_user','Users','users','id','Tasks','tasks','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4648a53d-103f-e30c-d531-55c064920323','oqc_offering_accounts','oqc_Offering','oqc_offering','id','Accounts','accounts','id','oqc_offering_accounts','oqc_offering_ida','accounts_idb','many-to-many',NULL,NULL,0,0),('47a49d6c-8d0e-c82f-bac9-55c064843f53','meetings_contacts','Meetings','meetings','id','Contacts','contacts','id','meetings_contacts','meeting_id','contact_id','many-to-many',NULL,NULL,0,0),('47cdd9e2-3c19-371e-a871-55c0647199cb','oqc_service_modified_user','Users','users','id','oqc_Service','oqc_service','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('47ebf280-61cb-e6db-b831-55c0646d751b','cases_created_by','Users','users','id','Cases','cases','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('47fad568-3886-f145-70db-55c064a939db','documents_modified_user','Users','users','id','Documents','documents','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('48d75898-8e45-86c6-a4e7-55c064a8a672','oqc_offering_assigned_user','Users','users','id','oqc_Offering','oqc_offering','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('49099a27-e056-30f4-6d7e-55c064fbb66b','oqc_externalcontract_created_by','Users','users','id','oqc_ExternalContract','oqc_externalcontract','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4a3aca55-4cca-5f41-11cf-55c064669fbc','bug_tasks','Bugs','bugs','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('4ad7678b-5ebf-6512-5195-55c0647bacdf','opportunities_assigned_user','Users','users','id','Opportunities','opportunities','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4b8c0f7d-ac9d-c826-9ca4-55c064a2ddf1','emails_meetings_rel','Emails','emails','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4c4d48b8-deb7-5209-75e4-55c064cebbb1','campaigns_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4d542011-d600-4f75-d54f-55c06422d728','oqc_category_modified_user','Users','users','id','oqc_Category','oqc_category','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4e107492-0928-89c3-e0b1-55c064515564','users_email_addresses','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Users',0,0),('5010959d-1ed2-d7cb-64f3-55c064729470','oqc_addition_accounts','oqc_Addition','oqc_addition','id','Accounts','accounts','id','oqc_addition_accounts','oqc_addition_ida','accounts_idb','many-to-many',NULL,NULL,0,0),('504691d4-22d8-e0c5-2ef2-55c064fa50af','calls_users','Calls','calls','id','Users','users','id','calls_users','call_id','user_id','many-to-many',NULL,NULL,0,0),('50bde86a-93e8-914b-3f2a-55c064d1ef34','leads_modified_user','Users','users','id','Leads','leads','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('52531de4-904d-50fd-12d5-55c064bc2136','oqc_service_created_by','Users','users','id','oqc_Service','oqc_service','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('527c878c-ebeb-146b-898f-55c064f8bf0d','documents_created_by','Users','users','id','Documents','documents','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('52c7e934-642f-51fa-d0a2-55c064fb3189','cases_assigned_user','Users','users','id','Cases','cases','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('52ddbe34-6415-d09e-b84a-55c064c75615','accounts_email_addresses','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Accounts',0,0),('53291e42-5881-c222-46b3-55c064d02bba','schedulers_created_by_rel','Users','users','id','Schedulers','schedulers','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('533b0710-6ffc-2885-3904-55c06430f535','oqc_task_oqc_contract','oqc_Contract','oqc_contract','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('538dfe38-e45d-7724-d951-55c06450d87a','contacts_modified_user','Users','users','id','Contacts','contacts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('53a117bd-153c-95b3-bf4b-55c064461e07','tasks_notes','Tasks','tasks','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('53be59f3-1b7a-b653-7589-55c0643eb43c','oqc_offering_company_search','Accounts','accounts','id','oqc_Offering','oqc_offering','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('53eea323-e486-0c63-2d41-55c0642b4039','oqc_externalcontract_assigned_user','Users','users','id','oqc_ExternalContract','oqc_externalcontract','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('54b40a12-6df2-e395-ca56-55c0646ea138','lead_emails','Leads','leads','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('55184a37-1804-7478-57a0-55c06472ada6','bug_meetings','Bugs','bugs','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('573f3f6b-00be-b295-09e3-55c06429963e','projects_cases','Project','project','id','Cases','cases','id','projects_cases','project_id','case_id','many-to-many',NULL,NULL,0,0),('57dd73e6-5b51-da81-6b96-55c064e0925d','oqc_category_created_by','Users','users','id','oqc_Category','oqc_category','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5873690d-af9e-10ae-e2bf-55c064579f43','opportunity_calls','Opportunities','opportunities','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('58f23d1c-70c7-061d-542f-55c06446a140','users_email_addresses_primary','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('599094e1-1a1d-ca99-d5bf-55c064c67da7','campaigns_created_by','Users','users','id','Campaigns','campaigns','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5b2d81d2-4767-b674-320b-55c0648d0471','leads_created_by','Users','users','id','Leads','leads','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5ba9e63b-308a-dab9-446d-55c064ba1177','account_leads','Accounts','accounts','id','Leads','leads','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5cd4db2e-3a6c-9cf4-3403-55c0642636ed','documents_opportunities','Documents','documents','id','Opportunities','opportunities','id','documents_opportunities','document_id','opportunity_id','many-to-many',NULL,NULL,0,0),('5d37f9a5-d1fb-3d5d-a711-55c064e2f661','oqc_service_assigned_user','Users','users','id','oqc_Service','oqc_service','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5d556121-5f61-911b-237d-55c0642c952c','documents_assigned_user','Users','users','id','Documents','documents','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5db77e8c-7c80-122c-ab13-55c064720af3','case_calls','Cases','cases','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('5ddfc296-5a90-90ac-5909-55c064c1d58e','consumer_tokens','OAuthKeys','oauth_consumer','id','OAuthTokens','oauth_tokens','consumer',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5e409d78-735c-1476-2fa5-55c064393bdd','schedulers_modified_user_id_rel','Users','users','id','Schedulers','schedulers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5e9d1284-2017-5705-2241-55c064bb34e6','oqc_offering_officenumber_search','Accounts','accounts_cstm','id_c','oqc_Offering','oqc_offering','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5ed170c9-1f69-5153-935b-55c06436984d','account_search','Accounts','accounts','id','oqc_ExternalContract','oqc_externalcontract','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('60003897-a52b-e491-7751-55c064679075','bug_calls','Bugs','bugs','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('603607b0-a7ad-93ad-5b41-55c064a7d0b2','emails_opportunities_rel','Emails','emails','id','Opportunities','opportunities','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Opportunities',0,0),('60bbc538-83f3-2e5b-99d9-55c0648e5338','contacts_created_by','Users','users','id','Contacts','contacts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('621beb7f-f8b1-ed8f-63c4-55c0648f8ec2','project_tasks_notes','ProjectTask','project_task','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('62b49ecd-ca1a-624b-1ced-55c064b79e4f','oqc_category_assigned_user','Users','users','id','oqc_Category','oqc_category','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('62b905f8-b679-c420-62ca-55c0647990a3','oqc_contract_project','oqc_Contract','oqc_contract','id','Project','project','id','oqc_contract_project','oqc_contract_ida','project_idb','many-to-many',NULL,NULL,0,0),('637f6443-875d-1019-a0d5-55c064c73ebe','notes_assigned_user','Users','users','id','Notes','notes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('63c4be15-be30-3728-57be-55c064892f58','leads_assigned_user','Users','users','id','Leads','leads','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6475303d-cb8f-6081-1e55-55c064807d60','campaigns_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('65a69fb8-7fdb-3550-1927-55c0646b419f','projects_accounts','Project','project','id','Accounts','accounts','id','projects_accounts','project_id','account_id','many-to-many',NULL,NULL,0,0),('66003c39-d708-834c-551e-55c0642c460a','opportunity_meetings','Opportunities','opportunities','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('663ee8b4-6b13-4df5-02b9-55c0643452c3','accounts_email_addresses_primary','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('67ff0fd5-d40d-8270-e7a9-55c064ca3f59','inbound_email_created_by','Users','users','id','InboundEmail','inbound_email','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('685029d8-c8e9-322f-c5eb-55c06408854d','document_revisions','Documents','documents','id','DocumentRevisions','document_revisions','document_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('689a96f0-4db9-66dd-31d5-55c064cfd5d7','case_tasks','Cases','cases','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('68a56146-253c-1e29-6c64-55c0640d8d53','oauthtokens_assigned_user','Users','users','id','OAuthTokens','oauth_tokens','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('692a34c4-4302-a077-c90c-55c064271cf1','schedulers_jobs_rel','Schedulers','schedulers','id','SchedulersJobs','job_queue','scheduler_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('697fa910-9e40-3f8e-6cc9-55c064108437','oqc_offering_contact_rel','Contacts','contacts','id','oqc_Offering','oqc_offering','clientcontact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('69b24b4b-380f-bbd8-1fc1-55c0649c5ff2','oqc_task_oqc_externalcontract','oqc_ExternalContract','oqc_externalcontract','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6ac000c2-233d-71e9-e786-55c064fd3fa0','oqc_externalcontract_oqc_contract','oqc_ExternalContract','oqc_externalcontract','id','oqc_Contract','oqc_contract','id','oqc_externaoqc_contract','oqc_externalcontract_ida','oqc_contract_idb','many-to-many',NULL,NULL,0,0),('6ae16545-9867-4ab1-e929-55c064d21c31','bug_emails','Bugs','bugs','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('6e0d60cf-2b37-93e5-faac-55c064ac7dfb','oqc_category_catalog_rel','oqc_ProductCatalog','oqc_productcatalog','id','oqc_Category','oqc_category','catalog_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6e4f787d-ea5f-c66d-5031-55c064b2ce97','contacts_assigned_user','Users','users','id','Contacts','contacts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6f8affca-5ccd-1093-dad2-55c0644a0d74','emailtemplates_assigned_user','Users','users','id','EmailTemplates','email_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('70c85ffb-d3f5-9b0f-3a8b-55c064261ab5','notes_modified_user','Users','users','id','Notes','notes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7207785c-5e76-ca58-3e04-55c064c07202','campaign_accounts','Campaigns','campaigns','id','Accounts','accounts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('721d998e-9c6c-0606-b933-55c064447ac2','oqc_offering_oqc_product','oqc_Offering','oqc_offering','id','oqc_Product','oqc_product','id','oqc_offerin_oqc_product','oqc_offering_ida','oqc_product_idb','many-to-many',NULL,NULL,0,0),('72b34bfb-ca99-1ce3-e97b-55c0647c0048','inbound_email_modified_user_id','Users','users','id','InboundEmail','inbound_email','modified_user_id',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('734a0a96-5127-2f40-3683-55c064283b84','accounts_bugs','Accounts','accounts','id','Bugs','bugs','id','accounts_bugs','account_id','bug_id','many-to-many',NULL,NULL,0,0),('737300f4-12f3-1f3a-b478-55c064b64e67','case_notes','Cases','cases','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('73a2daef-6a17-3adc-3687-55c06404363f','opportunity_tasks','Opportunities','opportunities','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('747106ee-d14b-898c-b375-55c064e2a345','oqc_externalcontract_contacts','oqc_ExternalContract','oqc_externalcontract','id','Contacts','contacts','id','oqc_externaact_contacts','oqc_externalcontract_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('74cc9286-c6ef-4985-ade1-55c064072333','oqc_task_oqc_offering','oqc_Offering','oqc_offering','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('75840190-c239-e47e-0663-55c06423eb42','oqc_externalcontract_accounts','oqc_ExternalContract','oqc_externalcontract','id','Accounts','accounts','id','oqc_externaact_accounts','oqc_externalcontract_ida','accounts_idb','many-to-many',NULL,NULL,0,0),('75b92027-0f38-39d2-66a3-55c064d7439d','bug_notes','Bugs','bugs','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('7919c7a7-7c3c-44f4-0f0c-55c064305d29','oqc_externalcontractpositions_modified_user','Users','users','id','oqc_ExternalContractPositions','oqc_externalcontractpositions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7a852a22-e2cc-0ae8-7b90-55c064c5d02b','calls_contacts','Calls','calls','id','Contacts','contacts','id','calls_contacts','call_id','contact_id','many-to-many',NULL,NULL,0,0),('7abe85bb-f88d-9990-24fb-55c0648cbfd1','oqc_contract_documents','oqc_Contract','oqc_contract','id','Documents','documents','id','oqc_contract_documents','oqc_contract_ida','documents_idb','many-to-many',NULL,NULL,0,0),('7bee5ed8-a47c-a603-b60f-55c0644b931b','contacts_email_addresses','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Contacts',0,0),('7d4b4e73-1616-e1d7-f3ad-55c06428142b','oqc_externalcontractcosts_modified_user','Users','users','id','oqc_ExternalContractCosts','oqc_externalcontractcosts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7e1c9771-9645-4137-c5cd-55c064e4487d','oqc_offering_opportunities','oqc_Offering','oqc_offering','id','Opportunities','opportunities','id','oqc_offering_opportunities','oqc_offering_ida','opportunities_idb','many-to-many',NULL,NULL,0,0),('7e49e7c2-6532-ee3a-4f04-55c064e8e3ed','member_accounts','Accounts','accounts','id','Accounts','accounts','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7e52514f-5f0e-b601-b8d0-55c06432f143','notes_created_by','Users','users','id','Notes','notes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7e5f31e4-daef-2df6-91ea-55c064330ccb','case_meetings','Cases','cases','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('7fa773fb-b572-b1ee-840a-55c0646992d9','campaign_contacts','Campaigns','campaigns','id','Contacts','contacts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7fe9d086-51f0-029d-7c92-55c06404b750','calls_modified_user','Users','users','id','Calls','calls','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('80380b3c-b2d7-56ad-3b67-55c0646443ea','account_campaign_log','Accounts','accounts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Accounts',0,0),('808c58be-3805-ad5e-b454-55c064cba453','bugs_release','Releases','releases','id','Bugs','bugs','found_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('813e4abd-586f-81e8-dbf2-55c064cf2b27','opportunity_notes','Opportunities','opportunities','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('8258df72-560b-0a69-731a-55c064f8ee88','oqc_productcatalog_documents','oqc_ProductCatalog','oqc_productcatalog','id','Documents','documents','id','oqc_productcatalog_documents','oqc_productcatalog_ida','documents_idb','many-to-many',NULL,NULL,0,0),('839b9655-f39e-5e48-d047-55c064ecbdad','oqc_offering_project','oqc_Offering','oqc_offering','id','Project','project','id','oqc_offering_project','oqc_offering_ida','project_idb','many-to-many',NULL,NULL,0,0),('83ffc86f-c319-461a-b62f-55c064406545','oqc_externalcontractpositions_created_by','Users','users','id','oqc_ExternalContractPositions','oqc_externalcontractpositions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8553a746-e849-5195-55cb-55c0643aebac','mno_taxes_modified_user','Users','users','id','MNO_Taxes','mno_taxes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('857cd09a-ef44-d209-e04d-55c0648506bb','prospects_modified_user','Users','users','id','Prospects','prospects','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('867213c1-1da0-5c2f-426b-55c064aa957c','acl_roles_actions','ACLRoles','acl_roles','id','ACLActions','acl_actions','id','acl_roles_actions','role_id','action_id','many-to-many',NULL,NULL,0,0),('87e2fd61-9cb1-a21d-0284-55c064651aac','oqc_externalcontractcosts_created_by','Users','users','id','oqc_ExternalContractCosts','oqc_externalcontractcosts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('881b0ad8-9bba-02e6-b261-55c064c65edd','project_tasks_tasks','ProjectTask','project_task','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('8944f0ff-f3b0-53f8-3260-55c0640d1fe9','case_emails','Cases','cases','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('898a11e2-02ae-90a7-a6b5-55c064e5d530','contacts_email_addresses_primary','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('8a44a0a4-06db-975d-bc91-55c064deabef','calls_created_by','Users','users','id','Calls','calls','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8b820264-c115-1ff1-a54a-55c064ae67c3','prospect_campaign_log','Prospects','prospects','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Prospects',0,0),('8b8d24f1-2d51-1c45-7458-55c064e4939a','bugs_fixed_in_release','Releases','releases','id','Bugs','bugs','fixed_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8d03aa2b-200a-4355-b390-55c064608875','email_marketing_prospect_lists','EmailMarketing','email_marketing','id','ProspectLists','prospect_lists','id','email_marketing_prospect_lists','email_marketing_id','prospect_list_id','many-to-many',NULL,NULL,0,0),('8d3ddce9-e99a-8aa9-c2f8-55c0641ea19c','campaign_leads','Campaigns','campaigns','id','Leads','leads','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8daf3bcf-0b10-8ca6-cbf2-55c0641c9cdc','oqc_product_modified_user','Users','users','id','oqc_Product','oqc_product','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8ec13fdb-ca86-c6f3-9ca4-55c064abd4d7','oqc_externalcontractpositions_assigned_user','Users','users','id','oqc_ExternalContractPositions','oqc_externalcontractpositions','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8ed36c77-e5f8-cd94-f691-55c064d279da','opportunity_emails','Opportunities','opportunities','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('8ffb199b-6b62-3a08-0253-55c064fb736c','prospects_created_by','Users','users','id','Prospects','prospects','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9095c502-9572-de1b-6ccd-55c064e4d52c','prospect_list_contacts','ProspectLists','prospect_lists','id','Contacts','contacts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Contacts',0,0),('91c39a74-4e67-615a-c74d-55c064e67a03','oqc_contract_accounts','oqc_Contract','oqc_contract','id','Accounts','accounts','id','oqc_contract_accounts','oqc_contract_ida','accounts_idb','many-to-many',NULL,NULL,0,0),('91c7930f-f2f6-17e1-9b3e-55c06485476f','roles_users','Roles','roles','id','Users','users','id','roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('92a2ab20-40e7-253f-bd98-55c064a44f7b','mno_taxes_created_by','Users','users','id','MNO_Taxes','mno_taxes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('92ae0f2a-a494-f729-7d31-55c064c24d3a','account_oqc_product_rel','Accounts','accounts','id','oqc_Product','oqc_product','supplier_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('92e90755-f8bd-80ae-25a0-55c064d7be77','sugarfeed_assigned_user','Users','users','id','SugarFeed','sugarfeed','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('942914b5-4ccc-28ad-7c64-55c0649eea65','account_cases','Accounts','accounts','id','Cases','cases','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('95369498-109c-eff4-d965-55c064e1a4c7','calls_assigned_user','Users','users','id','Calls','calls','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('958802a7-8409-3500-fb5d-55c064e65556','oqc_externalcontractcosts_assigned_user','Users','users','id','oqc_ExternalContractCosts','oqc_externalcontractcosts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9710c2a5-4978-989a-e3c6-55c064bf17fb','contact_direct_reports','Contacts','contacts','id','Contacts','contacts','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('97cca4bd-9d45-8556-d7b3-55c064aa63e6','oqc_externalcontractdetailedcosts_modified_user','Users','users','id','oqc_ExternalContractDetailedCosts','oqc_externalcontractdetailedcosts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('99eb0061-6a0e-318f-aeaa-55c06418dd62','emails_assigned_user','Users','users','id','Emails','emails','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9a2b67ba-fd6f-d0fb-70df-55c064915c21','leads_email_addresses','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Leads',0,0),('9ad38c36-c72e-65e0-e081-55c0645aeae3','oqc_product_created_by','Users','users','id','oqc_Product','oqc_product','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9ad72933-7f03-35b5-499e-55c064cfc304','campaign_prospects','Campaigns','campaigns','id','Prospects','prospects','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9adc83f6-4b5a-17b2-9559-55c064883800','prospects_assigned_user','Users','users','id','Prospects','prospects','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9c713bb9-3eb8-b354-62a6-55c064260ff8','opportunity_leads','Opportunities','opportunities','id','Leads','leads','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9c976f3f-c12e-6a0c-a11f-55c0644f5205','oqc_addition_modified_user','Users','users','id','oqc_Addition','oqc_addition','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9e2cda71-65e7-c059-ec3c-55c064e54162','oqc_contract_modified_user','Users','users','id','oqc_Contract','oqc_contract','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9e3b4ff1-fe44-40a2-a2ed-55c06471c73c','prospect_list_prospects','ProspectLists','prospect_lists','id','Prospects','prospects','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Prospects',0,0),('9ece09ef-ba57-7296-2501-55c0642a69cd','projects_assigned_user','Users','users','id','Project','project','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a004f850-9473-863c-7098-55c064834f49','calls_notes','Calls','calls','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Calls',0,0),('a03bc6b1-b6fd-2500-9544-55c06411dd39','mno_taxes_assigned_user','Users','users','id','MNO_Taxes','mno_taxes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a0d2eeb4-e492-9f23-4472-55c064d5790e','oqc_addition_oqc_product','oqc_Addition','oqc_addition','id','oqc_Product','oqc_product','id','oqc_additio_oqc_product','oqc_addition_ida','oqc_product_idb','many-to-many',NULL,NULL,0,0),('a1fc4d3f-93f9-0893-caa3-55c0644b981d','prospectlists_assigned_user','Users','users','id','prospectlists','prospect_lists','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a251e8dd-e5c6-086d-90ed-55c064cfec24','oqc_externalcontractdetailedcosts_created_by','Users','users','id','oqc_ExternalContractDetailedCosts','oqc_externalcontractdetailedcosts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a49e09a0-ec66-accd-ee6d-55c06415093e','contact_leads','Contacts','contacts','id','Leads','leads','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a4e7b6ec-eea7-698a-be69-55c0646f8dff','project_tasks_meetings','ProjectTask','project_task','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('a5a529b2-1191-f3eb-ba4b-55c064d7bb08','prospects_email_addresses','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Prospects',0,0),('a7064bb5-a3b6-deb6-1fae-55c064540fbe','oqc_addition_created_by','Users','users','id','oqc_Addition','oqc_addition','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a751b696-25a9-2882-2f77-55c0648559cf','emails_modified_user','Users','users','id','Emails','emails','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a7c95e7a-9af0-424b-5b80-55c0643bf1bb','leads_email_addresses_primary','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('a84ed184-4599-42bd-7823-55c06467223f','oqc_product_assigned_user','Users','users','id','oqc_Product','oqc_product','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a86dbdba-ef9c-f328-94b4-55c0640fc479','campaign_opportunities','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a961fe5e-35e7-148c-2046-55c0641c266b','contacts_cases','Contacts','contacts','id','Cases','cases','id','contacts_cases','contact_id','case_id','many-to-many',NULL,NULL,0,0),('a9cd5eaa-6212-5510-f662-55c06471bacf','meetings_leads','Meetings','meetings','id','Leads','leads','id','meetings_leads','meeting_id','lead_id','many-to-many',NULL,NULL,0,0),('a9f147b6-c61b-36c5-82db-55c0648f23ce','opportunity_currencies','Opportunities','opportunities','currency_id','Currencies','currencies','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ab554ba4-7947-d6d7-18b2-55c06431e16a','accounts_contacts','Accounts','accounts','id','Contacts','contacts','id','accounts_contacts','account_id','contact_id','many-to-many',NULL,NULL,0,0),('abe283fb-bd7c-66c7-b112-55c064b66386','prospect_list_leads','ProspectLists','prospect_lists','id','Leads','leads','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Leads',0,0),('aded3e09-a0d0-a658-95d8-55c06470e098','oqc_offering_contacts','oqc_Offering','oqc_offering','id','Contacts','contacts','id','oqc_offering_contacts','oqc_offering_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('afae9609-7696-8453-7ae9-55c064677f1b','oqc_contract_oqc_product','oqc_Contract','oqc_contract','id','oqc_Product','oqc_product','id','oqc_contrac_oqc_product','oqc_contract_ida','oqc_product_idb','many-to-many',NULL,NULL,0,0),('b05353ea-a404-dc4a-41c9-55c06493a332','oqc_contract_oqc_service','oqc_Contract','oqc_contract','id','oqc_Service','oqc_service','id','oqc_contrac_oqc_service','oqc_contract_ida','oqc_service_idb','many-to-many',NULL,NULL,0,0),('b09d14c1-6965-1b27-1011-55c06413dd9d','prospects_email_addresses_primary','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('b1f76b83-7e53-72ce-b486-55c0648f4283','oqc_addition_assigned_user','Users','users','id','oqc_Addition','oqc_addition','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b238e698-fe31-cebb-727b-55c06496f712','contact_notes','Contacts','contacts','id','Notes','notes','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b2c6243f-4f0f-e814-bccc-55c064494e76','oqc_contract_created_by','Users','users','id','oqc_Contract','oqc_contract','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b40807a8-8eee-02d3-1211-55c064271e98','meetings_created_by','Users','users','id','Meetings','meetings','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b4f70317-a2d7-7191-1d08-55c064baf8cb','emails_created_by','Users','users','id','Emails','emails','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b56d05aa-ac19-8347-9234-55c0646a13eb','lead_direct_reports','Leads','leads','id','Leads','leads','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b5fea5a8-d6a0-281a-d121-55c0647b349d','oqc_product_category_rel','oqc_Category','oqc_category','id','oqc_Product','oqc_product','relatedcategory_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b60e9c9f-2afe-2599-5c2c-55c064541b2a','campaign_email_marketing','Campaigns','campaigns','id','EmailMarketing','email_marketing','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b7a08556-5285-4d6f-05e0-55c0642bc82c','opportunities_campaign','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b82b230b-ba8d-c069-3fec-55c064efa52d','oqc_externalcontractdetailedcosts_assigned_user','Users','users','id','oqc_ExternalContractDetailedCosts','oqc_externalcontractdetailedcosts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b96f97bb-5326-4603-23e0-55c064cc9e2d','prospect_list_users','ProspectLists','prospect_lists','id','Users','users','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Users',0,0),('ba78c87a-3fc4-117d-e78a-55c06431c4f5','oqc_addition_contacts','oqc_Addition','oqc_addition','id','Contacts','contacts','id','oqc_addition_contacts','oqc_addition_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('bb05b1b4-0c43-7ae2-a018-55c06451a871','account_tasks','Accounts','accounts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('bb81a317-f2ca-df18-d76a-55c06440ac79','prospect_tasks','Prospects','prospects','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('bbe005d2-a780-fef3-6be8-55c0645a5363','campaignlog_created_opportunities','CampaignLog','campaign_log','related_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bc7007ed-3768-6109-8e04-55c064a2d0c0','oqc_productcatalog_created_by','Users','users','id','oqc_ProductCatalog','oqc_productcatalog','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bcc00737-73e5-18b0-91c5-55c0646b66d3','meetings_modified_user','Users','users','id','Meetings','meetings','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bcce6069-7d5b-9755-9c12-55c064f79838','project_tasks_calls','ProjectTask','project_task','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('bcd9d130-ad7a-a5fa-244d-55c064cfebf5','oqc_addition_company_search','Accounts','accounts','id','oqc_Addition','oqc_addition','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bd026740-aa0b-c84d-d41f-55c0640d7ff9','projects_notes','Project','project','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('bed4cec2-64d2-9f25-50f7-55c064fac2a8','projects_contacts','Project','project','id','Contacts','contacts','id','projects_contacts','project_id','contact_id','many-to-many',NULL,NULL,0,0),('bfe4f7a5-dbe5-e951-4ac3-55c064ddae62','contact_tasks','Contacts','contacts','id','Tasks','tasks','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c27915b4-1e56-a3c6-048d-55c0643069cd','revisions_created_by','Users','users','id','DocumentRevisions','document_revisions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c2888086-1fa5-f056-8261-55c0643118b4','emails_notes_rel','Emails','emails','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c30241a8-bc30-63bd-873f-55c0646f2c49','lead_tasks','Leads','leads','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('c39364a7-9c9f-153e-ba23-55c0640ad0af','oqc_product_catalog_rel','oqc_ProductCatalog','oqc_productcatalog','id','oqc_Product','oqc_product','catalog_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c39f6d5a-e62b-078a-7bdf-55c0648fc93c','campaign_emailman','Campaigns','campaigns','id','EmailMan','emailman','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c41f09ae-d22a-5993-d26f-55c064d7f9b3','project_tasks_assigned_user','Users','users','id','ProjectTask','project_task','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c5b08fb0-cf9f-bc6c-b4f7-55c064c32205','cases_bugs','Cases','cases','id','Bugs','bugs','id','cases_bugs','case_id','bug_id','many-to-many',NULL,NULL,0,0),('c6665de8-ef63-8fac-4c29-55c0649b9658','prospect_notes','Prospects','prospects','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('c6b4ae6f-c647-d56b-4898-55c064a0fe97','oauthkeys_modified_user','Users','users','id','OAuthKeys','oauthkeys','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c6df0149-a2e4-05dc-b2da-55c0646b92bd','opportunities_contacts','Opportunities','opportunities','id','Contacts','contacts','id','opportunities_contacts','opportunity_id','contact_id','many-to-many',NULL,NULL,0,0),('c714816d-0d45-123a-1d72-55c064b981e8','prospect_list_accounts','ProspectLists','prospect_lists','id','Accounts','accounts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Accounts',0,0),('c7ae6da5-49ae-03de-d31d-55c064857b08','projects_tasks','Project','project','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('c7bda802-ac0a-8896-0715-55c0644da0aa','oqc_addition_officenumber_search','Accounts','accounts_cstm','id_c','oqc_Addition','oqc_addition','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cd574ee2-b45e-1217-c1e4-55c064c583fe','oqc_externalcontract_project','oqc_ExternalContract','oqc_externalcontract','id','Project','project','id','oqc_externaract_project','oqc_externalcontract_ida','project_idb','many-to-many',NULL,NULL,0,0),('cd7a81bb-a67f-da04-31a6-55c064e088f4','contact_tasks_parent','Contacts','contacts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('ceaf7ed0-fe73-848a-6115-55c0643cf6a8','leads_documents','Leads','leads','id','Documents','documents','id','linked_documents','parent_id','document_id','many-to-many','parent_type','Leads',0,0),('cf1804cd-45e6-0d0c-dd16-55c064bac56c','oqc_editedtextblock_modified_user','Users','users','id','oqc_EditedTextBlock','oqc_editedtextblock','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d01bbefa-88e5-0d0e-e6f0-55c06472747e','emails_contacts_rel','Emails','emails','id','Contacts','contacts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Contacts',0,0),('d09208ca-9c90-4a94-95ca-55c0640a253b','lead_notes','Leads','leads','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('d0afb82f-835f-0be8-6fe8-55c064de0c8a','oqc_contract_assigned_user','Users','users','id','oqc_Contract','oqc_contract','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d13aafe6-50e8-cdf6-65a5-55c0642207e6','oqc_task_oqc_product','oqc_Product','oqc_product','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d13da848-b253-119f-14d3-55c064a0eaa2','campaign_campaignlog','Campaigns','campaigns','id','CampaignLog','campaign_log','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d14f8d8a-4003-38ad-4cd0-55c06419741d','prospect_meetings','Prospects','prospects','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('d293d7cf-caab-281b-2541-55c06407e5aa','projects_meetings','Project','project','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('d29d8643-f2a5-191b-425c-55c0644073a3','oqc_addition_contact_rel','Contacts','contacts','id','oqc_Addition','oqc_addition','clientcontact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d2a37711-a789-84ec-000a-55c06426d50d','saved_search_assigned_user','Users','users','id','SavedSearch','saved_search','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d2b76638-503c-a53c-4090-55c064f28d32','account_notes','Accounts','accounts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('d2b871c2-f5f1-01a7-0951-55c064186db8','projects_bugs','Project','project','id','Bugs','bugs','id','projects_bugs','project_id','bug_id','many-to-many',NULL,NULL,0,0),('d4094138-4217-ed4e-73e3-55c06483d437','oauthkeys_created_by','Users','users','id','OAuthKeys','oauthkeys','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d50e096d-c011-9fd2-2132-55c064942239','oqc_contract_contacts','oqc_Contract','oqc_contract','id','Contacts','contacts','id','oqc_contract_contacts','oqc_contract_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('d89d0ce1-1d2f-0657-3a37-55c064e41f4c','documents_bugs','Documents','documents','id','Bugs','bugs','id','documents_bugs','document_id','bug_id','many-to-many',NULL,NULL,0,0),('d9d7fdfb-8ada-e64d-e45e-55c064ed1329','campaignlog_contact','CampaignLog','campaign_log','related_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('da40dfe6-2a8b-5961-e556-55c064a8e48e','project_tasks_emails','ProjectTask','project_task','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('db8992bd-16fe-2d49-56d9-55c0647a93fd','contact_notes_parent','Contacts','contacts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('dcf91487-6dd7-b23b-47ec-55c064c8296c','eapm_modified_user','Users','users','id','EAPM','eapm','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dd77fc4c-04cd-c8d3-d20d-55c064b12b55','projects_calls','Project','project','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('dd852304-0415-886a-f6aa-55c064f4e8a9','oqc_task_oqc_addition','oqc_Addition','oqc_addition','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ddc1c82a-5485-08bb-c44a-55c0642f35fa','emails_accounts_rel','Emails','emails','id','Accounts','accounts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Accounts',0,0),('de3ad56f-d661-fee2-2092-55c0645f1352','lead_meetings','Leads','leads','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('dedae733-e8d2-f1d5-6c1b-55c0647f4d5e','campaign_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('df7fbb14-b304-2983-d04a-55c0642c0824','calls_leads','Calls','calls','id','Leads','leads','id','calls_leads','call_id','lead_id','many-to-many',NULL,NULL,0,0),('e1ab6319-51f7-a08b-249b-55c064222ced','oauthkeys_assigned_user','Users','users','id','OAuthKeys','oauthkeys','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e1f2ef4b-ab57-7a0a-17bb-55c064712fbd','oqc_offering_oqc_service','oqc_Offering','oqc_offering','id','oqc_Service','oqc_service','id','oqc_offerin_oqc_service','oqc_offering_ida','oqc_service_idb','many-to-many',NULL,NULL,0,0),('e33dc118-1112-46fd-6338-55c064137fbc','email_template_email_marketings','EmailTemplates','email_templates','id','EmailMarketing','email_marketing','template_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e404a8fd-16e0-c5ed-bb78-55c064e6215c','schedulersjobs_assigned_user','Users','users','id','SchedulersJobs','schedulersjobs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e47f44b9-cb79-0778-d1c8-55c0641960d2','emails_bugs_rel','Emails','emails','id','Bugs','bugs','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Bugs',0,0),('e52904e5-43b4-6ef3-b6d6-55c064be1783','campaignlog_targeted_users','CampaignLog','campaign_log','target_id','Users','users','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e66bf6fd-d3a9-6cb2-9459-55c064d994a9','contact_campaign_log','Contacts','contacts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Contacts',0,0),('e70e263a-2760-078b-0602-55c064062945','prospect_calls','Prospects','prospects','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('e74d3ade-c233-7e40-3fec-55c064d4e7eb','campaignlog_lead','CampaignLog','campaign_log','related_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e7cac641-4dec-f6c5-fc11-55c0643ed42b','oqc_productcatalog_modified_user','Users','users','id','oqc_ProductCatalog','oqc_productcatalog','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e7dcb75f-2abe-d64c-39b8-55c064c9ec6d','oqc_contract_oqc_addition','oqc_Contract','oqc_contract','id','oqc_Addition','oqc_addition','id','oqc_contract_oqc_addition','oqc_contract_ida','oqc_addition_idb','many-to-many',NULL,NULL,0,0),('e7f69085-6c2e-20b0-5209-55c064191eb0','sugarfeed_modified_user','Users','users','id','SugarFeed','sugarfeed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e80385c3-60aa-08aa-3bbe-55c06437d84e','oqc_task_modified_user','Users','users','id','oqc_Task','oqc_task','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e85c4459-4e9d-f6e6-b210-55c0646b6731','projects_emails','Project','project','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('e8f83fdd-cb99-1bcf-396c-55c064e82d61','oqc_offering_oqc_contract','oqc_Offering','oqc_offering','id','oqc_Contract','oqc_contract','id','oqc_offering_oqc_contract','oqc_offering_ida','oqc_contract_idb','many-to-many',NULL,NULL,0,0),('ea0919af-b030-2bce-9820-55c064247b2f','oqc_task_users','oqc_Task','oqc_task','id','Users','users','id','oqc_task_users','oqc_task_id','user_id','many-to-many',NULL,NULL,0,0),('eb538e35-070b-cc79-ac7a-55c06402e734','emails_leads_rel','Emails','emails','id','Leads','leads','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Leads',0,0),('ebdb259a-09d8-d512-76b7-55c06462fc30','lead_calls','Leads','leads','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('ec6f4999-5873-8205-d67c-55c06434b18e','campaign_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ed14227e-3c3c-a1db-3089-55c0642f20ef','oqc_contract_company_search','Accounts','accounts','id','oqc_Contract','oqc_contract','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ee510847-a038-4a31-50ca-55c064aa541d','oqc_task_assigned_user','Users','users','id','oqc_Task','oqc_task','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eed6b037-def8-908f-d1aa-55c0648c9f5a','documents_contacts','Documents','documents','id','Contacts','contacts','id','documents_contacts','document_id','contact_id','many-to-many',NULL,NULL,0,0),('ef09fd47-56a3-0019-d5c7-55c064f49ed3','oqc_externalcontract_documents','oqc_ExternalContract','oqc_externalcontract','id','Documents','documents','id','oqc_externact_documents','oqc_externalcontract_ida','documents_idb','many-to-many',NULL,NULL,0,0),('ef2493eb-90db-62fd-e3d9-55c064830e6d','emails_cases_rel','Emails','emails','id','Cases','cases','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Cases',0,0),('f1f6e946-0d36-fdc2-ba0e-55c06412dc16','prospect_emails','Prospects','prospects','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('f28655be-290e-c9ac-51bd-55c064884e63','sugarfeed_created_by','Users','users','id','SugarFeed','sugarfeed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f2ec4f4a-2a68-4c5b-04bd-55c06426a28a','prospect_list_campaigns','ProspectLists','prospect_lists','id','Campaigns','campaigns','id','prospect_list_campaigns','prospect_list_id','campaign_id','many-to-many',NULL,NULL,0,0),('f32de356-679f-4e29-34a8-55c064c2dea2','projects_project_tasks','Project','project','id','ProjectTask','project_task','project_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f34bd83f-7281-eb0f-0d76-55c0640507f0','acl_roles_users','ACLRoles','acl_roles','id','Users','users','id','acl_roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('fda30513-9cbc-8d60-cb4d-55c064330722','oqc_product_documents','oqc_Product','oqc_product','id','Documents','documents','id','oqc_product_documents','oqc_product_ida','documents_idb','many-to-many',NULL,NULL,0,0);
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releases`
--

LOCK TABLES `releases` WRITE;
/*!40000 ALTER TABLE `releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_modules`
--

DROP TABLE IF EXISTS `roles_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_modules`
--

LOCK TABLES `roles_modules` WRITE;
/*!40000 ALTER TABLE `roles_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_search`
--

DROP TABLE IF EXISTS `saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_search`
--

LOCK TABLES `saved_search` WRITE;
/*!40000 ALTER TABLE `saved_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulers`
--

DROP TABLE IF EXISTS `schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulers`
--

LOCK TABLES `schedulers` WRITE;
/*!40000 ALTER TABLE `schedulers` DISABLE KEYS */;
INSERT INTO `schedulers` VALUES ('1933e845-6858-fe37-6503-55c0643ded47',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','Clean Jobs Queue','function::cleanJobQueue','2012-01-01 14:45:01','2030-12-31 23:59:59','0::5::*::*::*',NULL,NULL,NULL,'Active',0),('26c16700-238e-92fd-8140-55c06441bb53',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','Removal of documents from filesystem','function::removeDocumentsFromFS','2012-01-01 09:45:01','2030-12-31 23:59:59','0::3::1::*::*',NULL,NULL,NULL,'Active',0),('34c62dba-b8e9-26c6-9870-55c064162762',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','Prune SugarFeed Tables','function::trimSugarFeeds','2005-01-01 14:30:01','2020-12-31 23:59:59','0::2::1::*::*',NULL,NULL,NULL,'Active',1),('b74f0bf5-2be8-c25a-d73e-55c0648c902f',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','Run Email Reminder Notifications','function::sendEmailReminders','2008-01-01 14:15:01','2020-12-31 23:59:59','*::*::*::*::*',NULL,NULL,NULL,'Active',0),('bca2e817-f0fe-c4cf-4a24-55c06499176a',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','Prune Tracker Tables','function::trimTracker','2005-01-01 11:45:01','2020-12-31 23:59:59','0::2::1::*::*',NULL,NULL,NULL,'Active',1),('c990dd76-bc8f-1504-a6c1-55c064289061',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','Check Inbound Mailboxes','function::pollMonitoredInboxes','2005-01-01 11:15:01','2020-12-31 23:59:59','*::*::*::*::*',NULL,NULL,NULL,'Active',0),('d6d59086-dbe4-b0a9-e98f-55c064ab5a19',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','Run Nightly Process Bounced Campaign Emails','function::pollMonitoredInboxesForBouncedCampaignEmails','2005-01-01 12:30:01','2020-12-31 23:59:59','0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('e4837b6b-552b-304e-c3f9-55c064cf2598',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','Run Nightly Mass Email Campaigns','function::runMassEmailCampaign','2005-01-01 12:15:01','2020-12-31 23:59:59','0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('f2156e43-1051-ba81-b9d1-55c064eb191b',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','Prune Database on 1st of Month','function::pruneDatabase','2005-01-01 07:45:01','2020-12-31 23:59:59','0::4::1::*::*',NULL,NULL,NULL,'Inactive',0);
/*!40000 ALTER TABLE `schedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugarfeed`
--

DROP TABLE IF EXISTS `sugarfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`),
  KEY `idx_sgrfeed_rmod_rid_date` (`related_module`,`related_id`,`date_entered`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugarfeed`
--

LOCK TABLES `sugarfeed` WRITE;
/*!40000 ALTER TABLE `sugarfeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugarfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracker`
--

DROP TABLE IF EXISTS `tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracker`
--

LOCK TABLES `tracker` WRITE;
/*!40000 ALTER TABLE `tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgrade_history`
--

DROP TABLE IF EXISTS `upgrade_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgrade_history`
--

LOCK TABLES `upgrade_history` WRITE;
/*!40000 ALTER TABLE `upgrade_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `upgrade_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES ('abb6abc4-bede-a407-b1a7-55c064d7f2a0','global',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','YToxOntzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czozNjoiYWI4NGI4NDItYWQ1NS1mNDEzLTJlMWQtNTVjMDY0ODEzODkyIjt9');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`,`first_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','admin','$1$e03TeMTI$tg6NJxJGfIUMK12JiCP.m.',0,NULL,NULL,1,NULL,'Administrator',1,0,1,NULL,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','','Administrator',NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_feeds`
--

DROP TABLE IF EXISTS `users_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_feeds`
--

LOCK TABLES `users_feeds` WRITE;
/*!40000 ALTER TABLE `users_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_last_import`
--

DROP TABLE IF EXISTS `users_last_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_last_import`
--

LOCK TABLES `users_last_import` WRITE;
/*!40000 ALTER TABLE `users_last_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_last_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_password_link`
--

DROP TABLE IF EXISTS `users_password_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_password_link`
--

LOCK TABLES `users_password_link` WRITE;
/*!40000 ALTER TABLE `users_password_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_password_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_signatures`
--

DROP TABLE IF EXISTS `users_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_signatures`
--

LOCK TABLES `users_signatures` WRITE;
/*!40000 ALTER TABLE `users_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcals`
--

DROP TABLE IF EXISTS `vcals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcals`
--

LOCK TABLES `vcals` WRITE;
/*!40000 ALTER TABLE `vcals` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_version` varchar(255) DEFAULT NULL,
  `db_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_version` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES ('984d6014-f538-8624-69f7-55c064a2eaf1',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','Chart Data Cache','3.5.1','3.5.1'),('a450a2ea-e140-8318-41bf-55c06464f315',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','htaccess','3.5.1','3.5.1'),('af2ec909-e5e0-4ed8-5637-55c064807270',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','Rebuild Relationships','4.0.0','4.0.0'),('ba224af8-23ef-3d1b-5f27-55c064318995',0,'2015-08-04 07:04:33','2015-08-04 07:04:33','1','1','Rebuild Extensions','4.0.0','4.0.0');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-04  7:23:03
