-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sugarcrm
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.12.04.1

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
-- Table structure for table `accounts_cstm`
--

DROP TABLE IF EXISTS `accounts_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_cstm` (
  `id_c` char(36) NOT NULL,
  `officenumber_c` varchar(25) DEFAULT NULL,
  `isexternal_c` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cstm`
--

LOCK TABLES `accounts_cstm` WRITE;
/*!40000 ALTER TABLE `accounts_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cstm` ENABLE KEYS */;
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
INSERT INTO `acl_actions` VALUES ('1149373c-d3bc-e9e5-3745-546ec443107f','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_EditedTextBlock','module',89,0),('11e30a73-2dc5-6ce8-f41f-546ec4ad8f19','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Accounts','module',90,0),('11eda7cc-6ada-87f3-674a-546ec440dcd1','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_EditedTextBlock','module',90,0),('13000693-9ca9-35b7-e9a0-546ec4de2561','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Accounts','module',90,0),('13254e6a-eea2-7530-6a0b-546ec4a38ac6','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_EditedTextBlock','module',90,0),('13f59d8e-a90e-b046-a707-546ec4ed5b41','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_EditedTextBlock','module',90,0),('14e4b567-6e7a-089c-8a9c-546ec4dcefd2','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_EditedTextBlock','module',90,0),('15ea7ead-c472-db1e-a3ed-546ec424ed64','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_EditedTextBlock','module',90,0),('161063c0-6b4d-c8f3-5200-546ec496eeed','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Opportunities','module',89,0),('16d4b475-dee4-230f-8319-546ec444395c','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Opportunities','module',90,0),('16d6ad8d-d529-ca66-5517-546ec4533493','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_EditedTextBlock','module',90,0),('18114358-d406-c2de-4d22-546ec46f04ef','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_EditedTextBlock','module',90,0),('18915022-b213-3177-7dd2-546ec4bb4830','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Opportunities','module',90,0),('1a8ec827-6c7a-c31c-0563-546ec47b2005','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Opportunities','module',90,0),('1b449b8e-e047-039c-514b-546ec40e1ed9','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Opportunities','module',90,0),('1bacdf19-8cb9-944f-3d77-546ec42768f0','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Opportunities','module',90,0),('1c6bf8cd-6636-3eb1-f9ef-546ec4a86f68','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Opportunities','module',90,0),('1d0cac3f-177e-5c5a-7a97-546ec4a0f1db','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Opportunities','module',90,0),('1f3cd914-f62b-d0ca-5c08-546ec4d9e7e8','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_TextBlock','module',89,0),('20b8dc17-9272-b661-161c-546ec4abd91d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_TextBlock','module',90,0),('2217141c-e147-c914-bbf8-546ec4ca4006','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_TextBlock','module',90,0),('225367d7-853d-393d-dded-546ec4102d99','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Leads','module',89,0),('23189bf8-19c1-c415-00c3-546ec4076339','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Leads','module',90,0),('23465da5-5c3f-7b50-0b8b-546ec4147fdb','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_TextBlock','module',90,0),('24227a54-9e1c-eada-5065-546ec42adf18','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Leads','module',90,0),('245c338d-8786-b595-ebcf-546ec4e84e5e','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_TextBlock','module',90,0),('25624168-c012-9d62-59df-546ec4ae25c7','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Leads','module',90,0),('257f610e-2046-66bf-a32f-546ec44c0bb3','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_TextBlock','module',90,0),('26cedd4c-f50e-8969-0784-546ec422fb4d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_TextBlock','module',90,0),('26dbd61f-87b8-1e20-3a91-546ec4f09435','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Leads','module',90,0),('27ba4571-661e-775b-b2d5-546ec4dd7c96','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Leads','module',90,0),('27c9b551-f785-120b-056c-546ec42cc0bf','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_TextBlock','module',90,0),('288270d5-2b64-fee4-eb6f-546ec415ef6a','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Leads','module',90,0),('293abe58-fa9f-76dd-1ed4-546ec4551f21','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Leads','module',90,0),('2a4dd18e-7659-e5d5-7203-546ec4d9434b','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','EmailTemplates','module',89,0),('2b0f25b3-ea1b-e7f6-7d39-546ec4c748ae','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','EmailTemplates','module',90,0),('2b9509d6-6b3a-6366-7bb5-546ec4dd1c9f','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','EmailTemplates','module',90,0),('2bf01060-8e13-df9d-530e-546ec44da7d4','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','EmailTemplates','module',90,0),('2c655c34-10cf-d339-ca85-546ec457477d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','EmailTemplates','module',90,0),('2cb70533-cdf8-e319-0403-546ec4c8e3e0','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','EmailTemplates','module',90,0),('2d22e983-64e1-c037-f314-546ec423d833','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','EmailTemplates','module',90,0),('2db14b0f-1f24-234e-e6cc-546ec48ef159','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','EmailTemplates','module',90,0),('31668245-af63-9f07-ee5f-546ec41f6e3d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Notes','module',89,0),('32482ff4-7ab0-0f08-34a3-546ec449047a','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Notes','module',90,0),('331d5a35-8975-2d5a-4302-546ec4b198ce','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Notes','module',90,0),('33cc73cc-8c97-e424-5214-546ec422178b','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_Offering','module',89,0),('340249c7-55dc-d67f-951d-546ec432a3f1','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Notes','module',90,0),('34f949ea-7a51-6232-56fe-546ec4562d28','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Notes','module',90,0),('356cea98-cf07-63e6-d1d9-546ec42f6278','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_Offering','module',90,0),('35d17b42-6bf0-93a8-47bc-546ec41ac47b','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Notes','module',90,0),('36783907-7a5c-cf34-7810-546ec45a6e84','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_Offering','module',90,0),('36ae4d5b-ad56-f4a8-c0a3-546ec46ea1d5','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Notes','module',90,0),('3783e400-9c15-fa18-586b-546ec484b655','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_Offering','module',90,0),('37dc3390-b4e8-78cc-4658-546ec4a75be9','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Notes','module',90,0),('389bb9e3-e8d7-4378-b190-546ec465181d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_Offering','module',90,0),('39ddd4c8-d7d2-5c94-495c-546ec45ca260','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_Offering','module',90,0),('3ab1179a-2b20-6f9b-7257-546ec412ad7b','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Cases','module',89,0),('3b2c938b-aae3-358a-1150-546ec47c482b','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_Offering','module',90,0),('3b61cd44-851b-4c6a-20d7-546ec4b65474','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Cases','module',90,0),('3c0e4544-487c-650f-5293-546ec47c813e','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Cases','module',90,0),('3cb8450c-b815-537a-63fc-546ec4c8b642','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Cases','module',90,0),('3cd4c6b8-1ba3-c1bd-c959-546ec44e217a','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_Offering','module',90,0),('3d2b4b50-e1e4-6ade-ab42-546ec4757736','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Calls','module',89,0),('3de4f9b7-e13b-f027-b4a9-546ec4f04f32','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Calls','module',90,0),('3dec5b50-8b16-2bb6-398d-546ec4c93478','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Cases','module',90,0),('3f0440ad-12b3-41a5-05fa-546ec4b754b5','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Calls','module',90,0),('3f27ae05-c357-4168-ca38-546ec48cd9cb','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Cases','module',90,0),('3f952317-67a9-7377-7131-546ec4607f47','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Calls','module',90,0),('4010405b-5072-0dc5-6938-546ec4ce804b','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Calls','module',90,0),('4053ddc1-e7ca-b691-12eb-546ec4e47e84','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Cases','module',90,0),('406b245b-c64a-d10d-b3d4-546ec481af8d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Calls','module',90,0),('416198f2-ccde-9006-d0dc-546ec4fba0fd','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Calls','module',90,0),('41945bb5-d7ae-72d7-51c1-546ec4b258f6','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Cases','module',90,0),('41ea227c-47bf-7682-3ac6-546ec48f490a','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Calls','module',90,0),('468e6b08-2946-96a3-8adc-546ec492e78d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Emails','module',89,0),('470f6c72-1c0d-ccba-7846-546ec472cb90','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Emails','module',90,0),('476fa332-6737-07bc-d567-546ec461845e','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Emails','module',90,0),('47fa14f5-1fc3-4fab-9e21-546ec47171ff','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Emails','module',90,0),('48aefd88-3614-1f21-2096-546ec4dd6787','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Emails','module',90,0),('49303b64-bdd7-dcdb-623f-546ec4a3669e','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Emails','module',90,0),('498e848d-35c3-c0bd-fadf-546ec47a2c1f','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Emails','module',90,0),('49fb688c-9283-09ec-7c14-546ec493ba80','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_Addition','module',89,0),('4a0e656d-1003-2a14-8e47-546ec414e181','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Emails','module',90,0),('4a84cce8-81d8-9b51-39c3-546ec42dda46','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_Addition','module',90,0),('4b39a38a-460f-91fd-f550-546ec405ec88','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_Addition','module',90,0),('4c4071f9-09f9-06dc-90c8-546ec489f911','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_Addition','module',90,0),('4d99dc37-eb6d-26a7-11a5-546ec425eee4','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_Addition','module',90,0),('4edff4e1-94fb-6175-5094-546ec4eda552','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_Addition','module',90,0),('4f7b7a75-15ce-319e-b6db-546ec4aadc87','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Bugs','module',89,0),('4fffcc7a-e143-4e33-77e5-546ec4da46e8','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_Addition','module',90,0),('50607edd-7424-0940-d500-546ec4bd87f3','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Bugs','module',90,0),('50696db6-1273-c4a2-3e54-546ec4c25c08','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Meetings','module',89,0),('50efc07e-4185-e015-1c15-546ec4ba56ed','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Meetings','module',90,0),('50ff50b9-8a9b-9867-b035-546ec46db88a','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_Addition','module',90,0),('510c0d2b-ea7b-c60c-94b5-546ec487eefb','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_Service','module',89,0),('511ba0fc-90b6-88a2-81c5-546ec417f512','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Bugs','module',90,0),('514b7fb2-6d32-fb05-a230-546ec409c737','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Meetings','module',90,0),('51b5b87f-dad9-5047-6e01-546ec4553f51','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Bugs','module',90,0),('52697dd4-b9ac-0ddf-da4b-546ec42b5eee','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Bugs','module',90,0),('52f6d93f-ac37-0b88-94f3-546ec4cc23d5','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Meetings','module',90,0),('531ecbf4-25de-6aa9-2a45-546ec4a53517','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Bugs','module',90,0),('53894784-7c3e-160d-8596-546ec46aaf9e','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Meetings','module',90,0),('53b6df78-0335-c62c-84c8-546ec4f8dcb6','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Bugs','module',90,0),('53fa4ba1-6f5d-53de-1ba7-546ec417b515','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Meetings','module',90,0),('541f4861-0943-35e9-cde5-546ec43bb57c','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Bugs','module',90,0),('5507a872-3526-4186-96e6-546ec49e0796','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Meetings','module',90,0),('55a80b80-eff5-ddd2-14c1-546ec44e6935','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Meetings','module',90,0),('5aaf5147-13d5-6250-823a-546ec47c8e05','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Tasks','module',89,0),('5b264e9a-4d3f-524a-bf07-546ec45ff03e','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Tasks','module',90,0),('5c01e6fd-81ae-266d-f6a9-546ec4f9834a','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Tasks','module',90,0),('5c66f3ea-1ff9-2706-01f6-546ec4ae219f','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_ProductCatalog','module',89,0),('5ca7d7e4-a82d-ad1f-feb2-546ec4c8eb36','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Tasks','module',90,0),('5d19cac5-6d29-a830-85bf-546ec4008842','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Tasks','module',90,0),('5d2011d8-a50b-e9db-c27b-546ec4ad56b1','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_ProductCatalog','module',90,0),('5d69dfc8-0ba9-5ea1-58ec-546ec403c49f','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Users','module',89,0),('5db23d66-8052-ab98-01f1-546ec4eaab1f','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Tasks','module',90,0),('5dd70beb-eeb3-31c7-b0d1-546ec4e21590','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_ProductCatalog','module',90,0),('5ddff304-07ee-7901-4277-546ec421a3f1','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Users','module',90,0),('5e604ae8-a9bc-348b-428b-546ec49a12d8','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Tasks','module',90,0),('5eb900be-8afc-164b-14b1-546ec4c7b56c','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_ProductCatalog','module',90,0),('5ec03c1d-3f9c-f3bd-121b-546ec4ec47c8','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Tasks','module',90,0),('5f531677-73fd-c639-e9f9-546ec4978cb2','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Users','module',90,0),('5f567405-371c-6efe-91e9-546ec43df3e1','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_ProductCatalog','module',90,0),('5fbe2af1-406c-148e-2047-546ec433f1b8','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_ProductCatalog','module',90,0),('5fe2188e-0eaf-3eb1-20aa-546ec4fc3d4f','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Users','module',90,0),('602506cd-0de9-e042-9199-546ec471f4fb','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_Service','module',90,0),('6049ecf5-b8a1-9b61-9e64-546ec4cde3b7','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_ProductCatalog','module',90,0),('608407e2-e8d8-e7c8-c5c0-546ec4aebddb','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Users','module',90,0),('610962fe-d511-0a6e-7d44-546ec4783d03','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_ProductCatalog','module',90,0),('614d9b68-a07b-9a1f-22f1-546ec4652331','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Users','module',90,0),('623b46e9-fc9d-81a8-f83c-546ec4760da4','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Users','module',90,0),('62d2ceb3-2e4d-0221-5923-546ec4924113','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Users','module',90,0),('68f348e1-6903-3540-35bb-546ec40579d3','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_ExternalContract','module',89,0),('699b4339-ce5a-b32e-8341-546ec495a650','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_ExternalContract','module',90,0),('6b751e67-6271-d334-66f0-546ec495bde0','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_ExternalContract','module',90,0),('6c0be5a5-e081-dcfb-fc5b-546ec42521f7','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_ExternalContract','module',90,0),('6c807506-5753-d9bd-f4b3-546ec49a990c','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_ExternalContract','module',90,0),('6d59096c-afcd-a659-4ce1-546ec4a259ef','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_ExternalContract','module',90,0),('6e0375b0-28c0-6e40-2c19-546ec420ee0d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_ExternalContract','module',90,0),('6e2fe905-0f9d-df36-4cec-546ec4ece046','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Project','module',89,0),('6e734c95-f9e4-24e7-49a8-546ec4bc5080','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_ExternalContract','module',90,0),('6e8802cc-dc94-08a7-994d-546ec466ae1d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_Service','module',90,0),('6f54dc23-fbdd-9d29-e050-546ec4f0d4c7','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Project','module',90,0),('7059e334-291a-f203-4785-546ec457ff13','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Project','module',90,0),('714bf083-ba49-7825-7dfc-546ec49ef0e9','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Project','module',90,0),('72da3f91-9f04-dc11-cd6a-546ec4d3b6ab','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Project','module',90,0),('73e0ca55-e3fe-a8a5-2ca6-546ec4b88f36','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Project','module',90,0),('74da0afb-3d92-30fe-a247-546ec486fee0','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Project','module',90,0),('75cd5000-d751-0066-df1c-546ec4bc28bd','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Project','module',90,0),('7b73274d-1f71-beaf-4b9d-546ec46f0804','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_ExternalContractPositions','module',89,0),('7c339245-baa3-9bd0-2589-546ec4e6b269','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_ExternalContractPositions','module',90,0),('7c70011d-ce45-d0e5-aa6d-546ec46ec936','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_Service','module',90,0),('7c82f5ba-3d3e-467d-b9c5-546ec4dacb16','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Documents','module',89,0),('7cec1b52-bd9c-dee0-220a-546ec4fb06c8','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_ExternalContractPositions','module',90,0),('7d455b5f-0279-e2ea-5d20-546ec421d46d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Documents','module',90,0),('7da5dd74-0d5b-642d-aa17-546ec42ee23f','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_ExternalContractPositions','module',90,0),('7de265c7-fdfd-5ca5-0eb9-546ec4747897','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Documents','module',90,0),('7e714269-af26-d41c-ee25-546ec4cb3826','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Documents','module',90,0),('7e737682-a389-6957-a551-546ec4fa6e81','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_ExternalContractPositions','module',90,0),('7f15dd5b-f166-2cec-9c26-546ec4ef9c36','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Documents','module',90,0),('7f2459bb-ff6a-b295-3468-546ec46be31d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_ExternalContractPositions','module',90,0),('7fb7b656-b1af-41c9-415f-546ec46854a3','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Documents','module',90,0),('7fe05699-eb5e-6bdf-750d-546ec4660a78','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_ExternalContractPositions','module',90,0),('80212953-4fec-1bd6-f206-546ec4293d8c','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Documents','module',90,0),('802fa8e5-7557-2464-186a-546ec42f9cfd','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','ProjectTask','module',89,0),('80f3d828-be3c-c9f6-f78d-546ec49f9f5b','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_ExternalContractPositions','module',90,0),('80fefc10-958f-943c-5cd3-546ec4654e5a','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Documents','module',90,0),('811e3477-21d5-9fb1-c70f-546ec417e606','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','ProjectTask','module',90,0),('820797ad-2fbd-9f7a-cf6f-546ec44a6012','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','ProjectTask','module',90,0),('82c8ae5d-06e5-1fa5-5dff-546ec4c638a3','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','ProjectTask','module',90,0),('8367795c-c953-17ae-b9eb-546ec4eae21c','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','ProjectTask','module',90,0),('83d6ed97-d493-cf9e-9eb0-546ec4ea6049','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','ProjectTask','module',90,0),('84763d11-939b-af63-1af5-546ec43b3cc3','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','ProjectTask','module',90,0),('84dcfb19-b69e-2f35-297b-546ec47623e8','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','ProjectTask','module',90,0),('8a7d6803-3603-2be0-0147-546ec4b92e73','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_ExternalContractCosts','module',89,0),('8af0a700-f69a-c625-ea0a-546ec4e9bcb5','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_ExternalContractCosts','module',90,0),('8b937ec3-9454-bd52-3ea6-546ec4c71fa6','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_ExternalContractCosts','module',90,0),('8c3442a3-b05a-1f32-f710-546ec4db5705','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_ExternalContractCosts','module',90,0),('8ca0f5ea-d25e-79f1-6872-546ec4559ba8','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_ExternalContractCosts','module',90,0),('8d320941-03bd-11f6-2f6e-546ec47503b4','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_Service','module',90,0),('8dbfffa5-6f1b-12a7-cf8e-546ec4cecee8','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_ExternalContractCosts','module',90,0),('8edb2e64-2d02-a281-f43b-546ec4f189c0','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_ExternalContractCosts','module',90,0),('8ff043bb-a836-1122-b6af-546ec43ec7cd','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_ExternalContractCosts','module',90,0),('9048deef-5251-cfed-21b4-546ec4ecbcd3','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Campaigns','module',89,0),('90c7062f-6120-359a-741c-546ec4c6a71e','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Campaigns','module',90,0),('91ae9363-8d4f-7cc4-94c8-546ec467e8b2','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Campaigns','module',90,0),('92f931db-8b9c-8bf8-c51f-546ec42d4717','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Campaigns','module',90,0),('9474280e-61f9-22ad-3a07-546ec47a13d8','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Campaigns','module',90,0),('958bac0f-4b2d-b821-b3fb-546ec4432537','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Campaigns','module',90,0),('96b638bf-e07a-0479-5ab3-546ec4008595','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Campaigns','module',90,0),('97b81916-e901-b327-06e2-546ec4c3d8e9','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Campaigns','module',90,0),('9863de3c-50af-b5ba-957f-546ec4fc305b','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_ExternalContractDetailedCosts','module',89,0),('998d4fd3-eee3-167a-0f9f-546ec4491853','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_ExternalContractDetailedCosts','module',90,0),('9aa0d712-aa15-f306-b988-546ec4c0d7a3','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_ExternalContractDetailedCosts','module',90,0),('9bd0cd27-8475-2755-ddde-546ec459cd74','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_ExternalContractDetailedCosts','module',90,0),('9d059f10-be41-caeb-7624-546ec479ff80','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_ExternalContractDetailedCosts','module',90,0),('9e494e07-8e45-8c4a-715b-546ec4009d52','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_ExternalContractDetailedCosts','module',90,0),('9f9d1dac-351b-6edd-324c-546ec42dffcf','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_ExternalContractDetailedCosts','module',90,0),('9fe006f9-ed5a-23a2-52b0-546ec4b73928','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_Service','module',90,0),('a0b81635-4f18-83c9-87b7-546ec4c5c625','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_ExternalContractDetailedCosts','module',90,0),('a76754cf-d9a4-c9d0-20fc-546ec4912129','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','EAPM','module',89,0),('a7bc7561-9a3a-d5d2-0eb4-546ec4b7b4dc','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','ProspectLists','module',89,0),('a83e1e06-1ae4-909a-d11c-546ec41301a8','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_Task','module',89,0),('a8584270-3a6f-7b47-becd-546ec4a61249','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','ProspectLists','module',90,0),('a89bfc6f-c4e7-2fb0-4a51-546ec4065df0','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','EAPM','module',90,0),('a8d9e779-f25e-cbe2-a619-546ec4d00578','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_Task','module',90,0),('a959bdec-f459-99b1-60a1-546ec4767bad','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','ProspectLists','module',90,0),('a97b9dc9-9d7c-8d8e-ded5-546ec46d24ef','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_Task','module',90,0),('a997ba11-87e1-9c90-cf12-546ec44a58f2','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','EAPM','module',90,0),('aa7f3ffe-444f-9577-57d6-546ec41fcb20','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','ProspectLists','module',90,0),('aa9fe021-ac2c-6d83-383a-546ec4c464d4','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','EAPM','module',90,0),('aac8f19c-8eb6-2b98-8a66-546ec4f9af7b','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_Task','module',90,0),('ab6cac87-1147-f399-ad42-546ec40deadd','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','ProspectLists','module',90,0),('ab7008b5-5efe-291c-933f-546ec430c334','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Accounts','module',90,0),('ab8835f2-5407-0e95-f241-546ec49b79e0','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','EAPM','module',90,0),('abd80b79-a3e5-9289-e756-546ec4e5cf82','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_Service','module',90,0),('ac2e362f-7b4c-b012-ce8f-546ec485dd23','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_Task','module',90,0),('ac5f9e5a-ff0f-2979-8b43-546ec4d66429','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','ProspectLists','module',90,0),('ac73de0e-fce7-7268-2d90-546ec4ba5124','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','EAPM','module',90,0),('ad309c00-8600-d591-15eb-546ec4ebcaaf','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','EAPM','module',90,0),('ad344007-e2a4-d5eb-eeb3-546ec48ecc08','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_Task','module',90,0),('ad657ccc-6a67-5cc9-5a8c-546ec4b7ab35','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','ProspectLists','module',90,0),('adbaf4b4-e637-cba3-a872-546ec47e3329','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','EAPM','module',90,0),('ae352bb7-8409-6811-4f87-546ec4b6f377','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_Task','module',90,0),('ae8a8d8e-b0d1-ad49-acdc-546ec4877383','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','ProspectLists','module',90,0),('af865df0-cc08-3512-e4dc-546ec487eb0a','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_Task','module',90,0),('b4b1c9e8-608e-5fe5-78e9-546ec45694ff','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Prospects','module',89,0),('b5a734ba-7738-3f2c-235a-546ec4d51bb2','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Prospects','module',90,0),('b6c5e84a-a870-29e6-72ee-546ec475901d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Prospects','module',90,0),('b6e0b1cb-a414-aa4a-b544-546ec44b9e8e','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','MNO_Taxes','module',89,0),('b7635c00-ff3f-d679-76c5-546ec4cb02ac','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','MNO_Taxes','module',90,0),('b796d990-8f20-263e-1ed9-546ec4b6d736','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Prospects','module',90,0),('b7c52d9e-45b5-17f7-d480-546ec41c975e','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','MNO_Taxes','module',90,0),('b8360a2d-9e58-1d33-fd94-546ec4fb5246','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_Service','module',90,0),('b841f75a-6123-6f4d-54bd-546ec472fad8','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','MNO_Taxes','module',90,0),('b876f749-7033-2627-21d8-546ec48934ce','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Prospects','module',90,0),('b8f7e101-6e29-6a44-09db-546ec4786c50','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Prospects','module',90,0),('b97f39d3-817b-5881-5581-546ec467e602','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','MNO_Taxes','module',90,0),('b9b1283b-cee6-4106-d304-546ec4e63812','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Prospects','module',90,0),('ba08f0c9-87c1-bb1f-5916-546ec4e1163e','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','MNO_Taxes','module',90,0),('ba5f04ce-3b06-274c-cf13-546ec49f60ec','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','MNO_Taxes','module',90,0),('baacfb21-9602-b37e-31bd-546ec4fedd9c','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Prospects','module',90,0),('babf2e38-948e-4914-43c3-546ec47537ab','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','MNO_Taxes','module',90,0),('c30d09fc-069c-d08e-a3e7-546ec46c3f78','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_Category','module',89,0),('c40d2be6-ba0b-dae7-0392-546ec41054b3','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_Category','module',90,0),('c576391a-58de-6567-3695-546ec404db9d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_Category','module',90,0),('c66ec08c-a179-654a-c778-546ec4fa9665','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_Category','module',90,0),('c7f484ac-f37e-b84f-5f41-546ec41e1812','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_Category','module',90,0),('c8971876-63b0-353d-45f3-546ec4b02aa7','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','EmailMarketing','module',89,0),('c8fd9b38-19ac-c98f-45ab-546ec45f1964','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_Category','module',90,0),('c99c5ae7-92cd-9c0b-31b6-546ec4a41d3a','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','EmailMarketing','module',90,0),('ca63d814-9d6f-14c2-b5db-546ec499435f','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_Category','module',90,0),('ca9035f5-dc63-399d-71b5-546ec4bea404','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','EmailMarketing','module',90,0),('cb65c7a7-1a40-d3ac-828b-546ec42baa29','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_Category','module',90,0),('cb747647-47b6-fc9b-d70b-546ec4c9b3e9','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','EmailMarketing','module',90,0),('cc918932-f964-79c2-6467-546ec4a97e1e','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','EmailMarketing','module',90,0),('cdac9933-b406-2e21-57b4-546ec4d4b9a4','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','EmailMarketing','module',90,0),('ceb0d522-c8f3-ac6e-12d2-546ec4861737','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','EmailMarketing','module',90,0),('cfa81421-38ec-5ba7-94d3-546ec48d4d0c','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','EmailMarketing','module',90,0),('d4a34e74-a756-f308-f497-546ec47f2a8e','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_Product','module',89,0),('d5527f0a-9a6a-4bc9-d491-546ec4ac9742','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_Product','module',90,0),('d67a04a0-404a-6866-3b13-546ec4ef7857','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_Product','module',90,0),('d727b3cb-26c7-5454-3e46-546ec4aff841','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_Product','module',90,0),('d7dd404a-d15c-91a9-dcfa-546ec45b3b84','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_Product','module',90,0),('d8dd7463-f47e-9d44-0e74-546ec4c5b8b1','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_Product','module',90,0),('da14a16a-bd27-e456-7ae9-546ec4594b68','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_Product','module',90,0),('db7a11a0-ac7d-9d3b-bd8b-546ec44e8c07','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_Product','module',90,0),('e261d6fa-5847-1437-520f-546ec49c5bd3','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Contacts','module',89,0),('e2e087b2-ceed-9371-0752-546ec417612d','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Contacts','module',90,0),('e379c1e4-487b-9993-93f9-546ec4c68567','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Contacts','module',90,0),('e4242116-b0cf-995c-614b-546ec4b759e1','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Contacts','module',90,0),('e48adda8-fcf7-49e4-7db5-546ec4455d90','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Contacts','module',90,0),('e51dd28c-1750-3bd4-57d0-546ec495e565','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','Contacts','module',90,0),('e578a312-ac13-c5e6-fa5d-546ec42fbab9','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','Contacts','module',90,0),('e63ec2f8-99d7-c1ed-cc48-546ec408a9a3','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','Contacts','module',90,0),('e90ece10-d50c-e05a-8b48-546ec4d9f5a3','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','oqc_Contract','module',89,0),('e9be2dbb-594a-cb19-c900-546ec4165a11','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','oqc_Contract','module',90,0),('ea80941c-d1c3-df38-2f25-546ec4715311','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','oqc_Contract','module',90,0),('eb2a907c-7894-03d8-a86e-546ec4d46ed4','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','oqc_Contract','module',90,0),('eba234d2-cbd7-5095-db24-546ec4ee7a11','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','oqc_Contract','module',90,0),('ec43cb2d-b463-f4f6-4152-546ec4aad4b6','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','import','oqc_Contract','module',90,0),('ecf350ed-cd07-acb1-1f8b-546ec4cbc9e2','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','export','oqc_Contract','module',90,0),('ed6be105-d9bf-c50e-0f58-546ec4fbde94','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','massupdate','oqc_Contract','module',90,0),('f041a375-804c-d356-ba5c-546ec40bd66f','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','access','Accounts','module',89,0),('f1d6ac3d-b282-744e-b1df-546ec4bd5523','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','view','Accounts','module',90,0),('f275c68b-9817-6ffb-a16e-546ec4f74537','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','list','Accounts','module',90,0),('f31eb668-19b9-5dc9-d932-546ec429cc94','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','edit','Accounts','module',90,0),('f3b91fe4-6d4a-f1c2-f06c-546ec48f1006','2014-11-21 04:49:05','2014-11-21 04:49:05','1','','delete','Accounts','module',90,0);
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
INSERT INTO `config` VALUES ('notify','fromaddress','do_not_reply@example.com'),('notify','fromname','SugarCRM'),('notify','send_by_default','1'),('notify','on','1'),('notify','send_from_assigning_user','0'),('info','sugar_version','6.5.18'),('MySettings','tab','YToyNDp7czo0OiJIb21lIjtzOjQ6IkhvbWUiO3M6ODoiQWNjb3VudHMiO3M6ODoiQWNjb3VudHMiO3M6ODoiQ29udGFjdHMiO3M6ODoiQ29udGFjdHMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6NToiTGVhZHMiO3M6NToiTGVhZHMiO3M6ODoiQ2FsZW5kYXIiO3M6ODoiQ2FsZW5kYXIiO3M6OToiRG9jdW1lbnRzIjtzOjk6IkRvY3VtZW50cyI7czo2OiJFbWFpbHMiO3M6NjoiRW1haWxzIjtzOjk6IkNhbXBhaWducyI7czo5OiJDYW1wYWlnbnMiO3M6NToiQ2FsbHMiO3M6NToiQ2FsbHMiO3M6ODoiTWVldGluZ3MiO3M6ODoiTWVldGluZ3MiO3M6NToiVGFza3MiO3M6NToiVGFza3MiO3M6NToiTm90ZXMiO3M6NToiTm90ZXMiO3M6NToiQ2FzZXMiO3M6NToiQ2FzZXMiO3M6OToiUHJvc3BlY3RzIjtzOjk6IlByb3NwZWN0cyI7czoxMzoiUHJvc3BlY3RMaXN0cyI7czoxMzoiUHJvc3BlY3RMaXN0cyI7czoxMToib3FjX1Byb2R1Y3QiO3M6MTE6Im9xY19Qcm9kdWN0IjtzOjEyOiJvcWNfQ29udHJhY3QiO3M6MTI6Im9xY19Db250cmFjdCI7czoxMzoib3FjX1RleHRCbG9jayI7czoxMzoib3FjX1RleHRCbG9jayI7czoxMjoib3FjX09mZmVyaW5nIjtzOjEyOiJvcWNfT2ZmZXJpbmciO3M6MTg6Im9xY19Qcm9kdWN0Q2F0YWxvZyI7czoxODoib3FjX1Byb2R1Y3RDYXRhbG9nIjtzOjIwOiJvcWNfRXh0ZXJuYWxDb250cmFjdCI7czoyMDoib3FjX0V4dGVybmFsQ29udHJhY3QiO3M6ODoib3FjX1Rhc2siO3M6ODoib3FjX1Rhc2siO3M6OToiTU5PX1RheGVzIjtzOjk6Ik1OT19UYXhlcyI7fQ=='),('portal','on','0'),('tracker','Tracker','1'),('system','skypeout_on','1'),('sugarfeed','enabled','1'),('sugarfeed','module_UserFeed','1'),('sugarfeed','module_Opportunities','1'),('sugarfeed','module_Cases','1'),('sugarfeed','module_Leads','1'),('sugarfeed','module_Contacts','1'),('Update','CheckUpdates','manual'),('system','name','Pouet!'),('proxy','on','0'),('proxy','host',''),('proxy','port',''),('proxy','auth','0'),('proxy','username','admin'),('proxy','password','Cabv5Izw0g0=');
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
-- Table structure for table `contacts_cstm`
--

DROP TABLE IF EXISTS `contacts_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_cstm` (
  `id_c` char(36) NOT NULL,
  `isexternal_c` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cstm`
--

LOCK TABLES `contacts_cstm` WRITE;
/*!40000 ALTER TABLE `contacts_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cstm` ENABLE KEYS */;
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
-- Table structure for table `documents_cstm`
--

DROP TABLE IF EXISTS `documents_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_cstm` (
  `id_c` char(36) NOT NULL,
  `document_purpose_c` varchar(100) DEFAULT ' ',
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_cstm`
--

LOCK TABLES `documents_cstm` WRITE;
/*!40000 ALTER TABLE `documents_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_cstm` ENABLE KEYS */;
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
INSERT INTO `email_addr_bean_rel` VALUES ('da1b6a58-ad7d-b3d6-55ea-546ec40cb83b','da5a68d0-1d20-6570-f9f4-546ec412b8f2','d7c4441d-b1d5-1de6-38c2-546ec4df937e','Users',1,0,'2014-11-21 04:50:28','2014-11-21 04:50:28',0);
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
INSERT INTO `email_addresses` VALUES ('da5a68d0-1d20-6570-f9f4-546ec412b8f2','bruno.chauvet@maestrano.com','BRUNO.CHAUVET@MAESTRANO.COM',0,0,'2014-11-21 04:50:28','2014-11-21 04:50:28',0);
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
INSERT INTO `email_templates` VALUES ('c2ea7e7a-bacb-5a3b-a42f-546ec4f16e37','2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','off','System-generated password email','This template is used when the System Administrator sends a new password to a user.','New account information','\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.','<div><table width=\"550\"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,NULL),('c4407a5b-4c7a-af30-6c79-546ec4cb4ebd','2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','off','Forgot Password email','This template is used to send a user a link to click to reset the user\'s account password.','Reset your account password','\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid','<div><table width=\"550\"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `fields_meta_data` VALUES ('Accountsisexternal_c','isexternal_c','LBL_OQC_EXTERNAL','','','Accounts','bool',255,0,'0','2014-11-21 04:51:04',0,0,0,0,1,'true','','','',''),('Accountsofficenumber_c','officenumber_c','LBL_OQC_OFFICE_NUMBER','','','Accounts','varchar',25,0,NULL,'2014-11-21 04:51:04',0,0,0,0,1,'true','','','',''),('Contactsisexternal_c','isexternal_c','LBL_OQC_EXTERNAL','','','Contacts','bool',255,0,'0','2014-11-21 04:51:04',0,0,0,0,1,'true','','','',''),('Documentsdocument_purpose_c','document_purpose_c','LBL_DOCUMENT_PURPOSE','','','Documents','enum',100,0,' ','2014-11-21 04:51:04',0,0,0,0,1,'true','document_purpose_list','','','');
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
INSERT INTO `outbound_email` VALUES ('8b685afc-c2cd-ba39-1c94-546ec4e8ee78','system','system','1','SMTP','other','',25,'','',1,0);
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
INSERT INTO `relationships` VALUES ('10eb734c-4b95-ea6f-b448-546ec817446a','contacts_modified_user','Users','users','id','Contacts','contacts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('11d4bde4-bcb8-207d-f83f-546ec8b68017','contacts_created_by','Users','users','id','Contacts','contacts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('12afa224-7119-0c2c-6a55-546ec85df2df','contacts_assigned_user','Users','users','id','Contacts','contacts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('138b6835-f222-7c77-eb56-546ec8fd0c8a','contacts_email_addresses','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Contacts',0,0),('14763d3e-4493-8956-9d9d-546ec80b111b','contacts_email_addresses_primary','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('15a003cf-3469-3708-6f82-546ec83359bc','contact_direct_reports','Contacts','contacts','id','Contacts','contacts','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1706e02c-3751-f991-5d0f-546ec8b3d70d','contact_leads','Contacts','contacts','id','Leads','leads','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('17f90fed-2775-1ccd-1e3c-546ec8636b05','prospects_created_by','Users','users','id','Prospects','prospects','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('18238045-2715-8b0b-c581-546ec8bba7e5','contact_notes','Contacts','contacts','id','Notes','notes','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('18e90bb0-bdb0-c7b0-9ac3-546ec89e87f1','contact_tasks','Contacts','contacts','id','Tasks','tasks','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('199eb382-85ce-fc08-1f82-546ec8b14ffd','contact_tasks_parent','Contacts','contacts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('1a6775a5-a0fd-6bf6-c9e0-546ec85ea8ec','contact_notes_parent','Contacts','contacts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('1b36439f-9b60-f4bf-d939-546ec896cf9c','contact_campaign_log','Contacts','contacts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Contacts',0,0),('1cdcc392-597f-2f1a-a925-546ec84d3d03','accounts_modified_user','Users','users','id','Accounts','accounts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1dc56eb4-9da0-502b-ee9a-546ec88f8d99','accounts_created_by','Users','users','id','Accounts','accounts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1e680bd6-e169-1d82-2f27-546ec8e94c02','accounts_assigned_user','Users','users','id','Accounts','accounts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1fb0eee4-57fb-6107-5d5b-546ec83401a0','accounts_email_addresses','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Accounts',0,0),('20f19b78-4824-5629-bfb1-546ec833ab30','accounts_email_addresses_primary','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('22232e3c-f538-d3f5-099a-546ec8296802','member_accounts','Accounts','accounts','id','Accounts','accounts','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('22520e3b-dc3d-a3c0-e576-546ec8e9eedd','prospects_assigned_user','Users','users','id','Prospects','prospects','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('23749856-d332-3209-0fe9-546ec898eec0','account_cases','Accounts','accounts','id','Cases','cases','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('24a4b315-b811-c3dd-78aa-546ec89f1fa4','account_tasks','Accounts','accounts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('2638bc51-1089-2fd3-d0f5-546ec85df005','account_notes','Accounts','accounts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('26ca80a9-1f84-a0af-407a-546ec8f56bce','account_meetings','Accounts','accounts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('271e7aae-bb58-960e-a8d3-546ec834fd32','account_calls','Accounts','accounts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('27b72930-e4c2-f6d9-d088-546ec8662655','account_emails','Accounts','accounts','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('286534ce-deee-03c2-07fb-546ec8d735d3','account_leads','Accounts','accounts','id','Leads','leads','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('28eef621-e3d7-0229-41f1-546ec89234a3','account_campaign_log','Accounts','accounts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Accounts',0,0),('29cd5792-5ebf-8cc0-70c1-546ec8a096ac','opportunities_modified_user','Users','users','id','Opportunities','opportunities','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2af523df-4522-d1f0-3273-546ec886db77','opportunities_created_by','Users','users','id','Opportunities','opportunities','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2b86a883-c580-c82f-fac0-546ec826b829','opportunities_assigned_user','Users','users','id','Opportunities','opportunities','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2be0f583-52a4-d2f1-96d4-546ec8bfdd40','opportunity_calls','Opportunities','opportunities','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('2c38c675-80a4-d8fe-375b-546ec868c5c2','opportunity_meetings','Opportunities','opportunities','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('2d56b05e-9d93-e1e9-c254-546ec8052aa7','opportunity_tasks','Opportunities','opportunities','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('2de57854-9502-4333-7560-546ec8e13573','opportunity_notes','Opportunities','opportunities','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('2e350605-f844-d5ff-d63a-546ec875d9a8','prospects_email_addresses','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Prospects',0,0),('2e74215b-6bad-c6c9-70ec-546ec8b6be93','opportunity_emails','Opportunities','opportunities','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('2ed46855-e397-7788-ed62-546ec89d40ea','opportunity_leads','Opportunities','opportunities','id','Leads','leads','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2faf064f-6b54-3b7d-bb4c-546ec83e5fd5','opportunity_currencies','Opportunities','opportunities','currency_id','Currencies','currencies','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3042acc4-d459-06c7-ed36-546ec86f5faa','opportunities_campaign','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('313c453f-eb5d-5a04-70b9-546ec8552cff','emailtemplates_assigned_user','Users','users','id','EmailTemplates','email_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('333e1163-16fd-8916-4d68-546ec866b85d','notes_assigned_user','Users','users','id','Notes','notes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('346e5a88-eb94-e3de-dcb3-546ec8f86b67','notes_modified_user','Users','users','id','Notes','notes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('35841525-3903-e785-b008-546ec8eb5ccc','notes_created_by','Users','users','id','Notes','notes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('376ae0a6-33db-93f6-5a1c-546ec89be3b9','calls_modified_user','Users','users','id','Calls','calls','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('38562c9a-891c-3926-5b68-546ec85f1438','calls_created_by','Users','users','id','Calls','calls','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3996d488-9559-583f-aa93-546ec8bf1cb3','calls_assigned_user','Users','users','id','Calls','calls','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3a80ba64-e6a1-2174-6466-546ec8b6f36e','calls_notes','Calls','calls','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Calls',0,0),('3ac90633-2b7a-dd3f-7c7d-546ec8e97129','prospects_email_addresses_primary','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('3c0b8b38-bfcf-8099-ebf9-546ec894a473','emails_assigned_user','Users','users','id','Emails','emails','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3d10a944-d53a-7419-dc77-546ec84b1867','emails_modified_user','Users','users','id','Emails','emails','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3e8a81da-3539-b2eb-a12a-546ec80e8b8d','emails_created_by','Users','users','id','Emails','emails','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3fb693b9-96fa-7645-dbe7-546ec8d32672','emails_notes_rel','Emails','emails','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4131aa85-7995-f3e6-4773-546ec8bc986a','emails_contacts_rel','Emails','emails','id','Contacts','contacts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Contacts',0,0),('42643647-e4b5-5311-7001-546ec80a7d3f','emails_accounts_rel','Emails','emails','id','Accounts','accounts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Accounts',0,0),('439184f2-808b-755f-7590-546ec8a988ca','emails_leads_rel','Emails','emails','id','Leads','leads','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Leads',0,0),('43b80168-4375-3f45-7fae-546ec808eee9','prospect_tasks','Prospects','prospects','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('44a6c5ff-f846-3de3-2728-546ec83010ef','emails_meetings_rel','Emails','emails','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('46f8ddec-5973-c053-db85-546ec83e04cd','meetings_modified_user','Users','users','id','Meetings','meetings','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('488ed63f-f250-d9ea-9d23-546ec81e62eb','meetings_created_by','Users','users','id','Meetings','meetings','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('49828484-7e76-6608-9ba6-546ec86fa82b','meetings_assigned_user','Users','users','id','Meetings','meetings','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4aacfea2-6502-e015-575c-546ec8588b0f','meetings_notes','Meetings','meetings','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('4bfa7dd2-3239-0c80-0fa3-546ec80e1796','tasks_modified_user','Users','users','id','Tasks','tasks','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4d31babe-5efa-c5b1-d032-546ec83119e0','tasks_created_by','Users','users','id','Tasks','tasks','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4df9b69d-764e-2db8-ed6b-546ec8bb4993','tasks_assigned_user','Users','users','id','Tasks','tasks','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4e714d11-5e5a-65cf-ea4e-546ec8c8699c','tasks_notes','Tasks','tasks','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5012056e-2c80-48a2-c797-546ec88abe6e','prospect_notes','Prospects','prospects','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('528c320a-5a16-00ea-6710-546ec84d685e','documents_modified_user','Users','users','id','Documents','documents','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('533dbaf8-592f-ecb0-78d6-546ec8e54741','documents_created_by','Users','users','id','Documents','documents','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('546a04bc-c8b5-0692-bb27-546ec8aca710','documents_assigned_user','Users','users','id','Documents','documents','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5509f6d9-1baf-bd8d-92d5-546ec84ec6ef','document_revisions','Documents','documents','id','DocumentRevisions','document_revisions','document_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('55b3206b-c3cf-16b9-3dd0-546ec8ff3b24','revisions_created_by','Users','users','id','DocumentRevisions','document_revisions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5744477f-8f48-4b53-b44c-546ec8bac9b7','inbound_email_created_by','Users','users','id','InboundEmail','inbound_email','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('57c4a193-95a6-9d29-da84-546ec82c44c1','inbound_email_modified_user_id','Users','users','id','InboundEmail','inbound_email','modified_user_id',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('58509187-0ed0-d033-be65-546ec81361ac','saved_search_assigned_user','Users','users','id','SavedSearch','saved_search','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5a114067-1a03-4fcc-49d8-546ec831321e','sugarfeed_modified_user','Users','users','id','SugarFeed','sugarfeed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5a828a8e-3d0b-62f8-670b-546ec850f579','sugarfeed_created_by','Users','users','id','SugarFeed','sugarfeed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5ad96235-f815-fe7b-9946-546ec8d181ca','sugarfeed_assigned_user','Users','users','id','SugarFeed','sugarfeed','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5c226043-1b93-0056-dcaf-546ec807229f','eapm_modified_user','Users','users','id','EAPM','eapm','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5ca31620-57d9-835b-18d7-546ec8d46cd1','eapm_created_by','Users','users','id','EAPM','eapm','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5cf7c4c4-dc9c-5613-17b9-546ec8e0cf69','eapm_assigned_user','Users','users','id','EAPM','eapm','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5db27832-6360-e496-b9ef-546ec8882654','oauthkeys_modified_user','Users','users','id','OAuthKeys','oauthkeys','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5e15b96b-d6be-7824-bb41-546ec8ca41f2','oauthkeys_created_by','Users','users','id','OAuthKeys','oauthkeys','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5eab5542-3d46-908e-7985-546ec8dbb5c0','oauthkeys_assigned_user','Users','users','id','OAuthKeys','oauthkeys','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5f29031a-529f-8a0f-d60d-546ec8b1fd68','prospect_meetings','Prospects','prospects','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('6036ee00-3e53-b05b-0994-546ec8ebab2f','consumer_tokens','OAuthKeys','oauth_consumer','id','OAuthTokens','oauth_tokens','consumer',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('60acdec2-de67-2625-0492-546ec8d53a4e','oauthtokens_assigned_user','Users','users','id','OAuthTokens','oauth_tokens','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6163e42a-5f95-a4ac-eed2-546ec876f63a','mno_taxes_modified_user','Users','users','id','MNO_Taxes','mno_taxes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('62c2c06f-6bf6-742e-6d40-546ec8422419','mno_taxes_created_by','Users','users','id','MNO_Taxes','mno_taxes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('639ae65e-f841-e2cd-5b80-546ec830ea0d','mno_taxes_assigned_user','Users','users','id','MNO_Taxes','mno_taxes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('64d31622-74a1-c04a-c612-546ec8cd15eb','oqc_category_modified_user','Users','users','id','oqc_Category','oqc_category','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6578b76b-0601-7773-018f-546ec85a2a50','oqc_category_created_by','Users','users','id','oqc_Category','oqc_category','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('65dd6dcc-e95e-7c5e-2067-546ec8dedfe4','oqc_category_assigned_user','Users','users','id','oqc_Category','oqc_category','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6653cb9d-0b73-fb57-0fd7-546ec8d92dff','oqc_category_catalog_rel','oqc_ProductCatalog','oqc_productcatalog','id','oqc_Category','oqc_category','catalog_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6745d5b6-ddf8-f1b4-c9e2-546ec8a3fa19','oqc_product_modified_user','Users','users','id','oqc_Product','oqc_product','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('680dc704-a2ca-44ee-48a0-546ec87e641f','oqc_product_created_by','Users','users','id','oqc_Product','oqc_product','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('68b72a38-a8d5-b360-c193-546ec83bb40f','oqc_product_assigned_user','Users','users','id','oqc_Product','oqc_product','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6922a537-ef04-728a-55d2-546ec8ff09fe','oqc_product_category_rel','oqc_Category','oqc_category','id','oqc_Product','oqc_product','relatedcategory_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6970b134-c09f-a299-f604-546ec861979a','oqc_product_catalog_rel','oqc_ProductCatalog','oqc_productcatalog','id','oqc_Product','oqc_product','catalog_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('69e9d689-a406-5125-0807-546ec82dca6d','oqc_task_oqc_product','oqc_Product','oqc_product','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6a6b7733-f700-5f0c-4d81-546ec8f55365','account_oqc_product_rel','Accounts','accounts','id','oqc_Product','oqc_product','supplier_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6ba7abf9-e088-51e1-b92f-546ec8f5b142','oqc_contract_modified_user','Users','users','id','oqc_Contract','oqc_contract','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6c350437-e3fc-2f58-0ddb-546ec85ed264','prospect_calls','Prospects','prospects','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('6c3af22f-2019-65d7-a032-546ec8289307','oqc_contract_created_by','Users','users','id','oqc_Contract','oqc_contract','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6ca630a8-d51b-fcf1-729c-546ec8b96304','oqc_contract_assigned_user','Users','users','id','oqc_Contract','oqc_contract','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6d212051-1f3c-4581-a422-546ec8ac3f94','oqc_contract_company_search','Accounts','accounts','id','oqc_Contract','oqc_contract','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6d7aabbc-c465-4d1a-cf20-546ec8e684ca','oqc_contract_officenumber_search','Accounts','accounts_cstm','id_c','oqc_Contract','oqc_contract','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6eda410b-149a-ed4e-273b-546ec81241ab','oqc_contract_contact_rel','Contacts','contacts','id','oqc_Contract','oqc_contract','clientcontact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('70b96a4d-a379-fc84-0d38-546ec8d1bd2b','oqc_task_oqc_contract','oqc_Contract','oqc_contract','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('72d3bef4-6815-7277-1678-546ec891abc7','oqc_service_modified_user','Users','users','id','oqc_Service','oqc_service','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('739e468f-f658-ad6f-869a-546ec8cb7a4a','oqc_service_created_by','Users','users','id','oqc_Service','oqc_service','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('74647b8c-5e9f-94d2-2026-546ec8ae106c','oqc_service_assigned_user','Users','users','id','oqc_Service','oqc_service','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7572613e-a429-fe8b-d1ec-546ec8e368ad','oqc_editedtextblock_modified_user','Users','users','id','oqc_EditedTextBlock','oqc_editedtextblock','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('759609ff-5083-6c31-8985-546ec8e38d7f','prospect_emails','Prospects','prospects','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('7645575d-360f-1b03-05b9-546ec8435048','oqc_editedtextblock_created_by','Users','users','id','oqc_EditedTextBlock','oqc_editedtextblock','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('77a19216-6063-c5bf-fe49-546ec88b267c','oqc_textblock_modified_user','Users','users','id','oqc_TextBlock','oqc_textblock','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('78a000a9-bc52-403f-65e9-546ec8f2b446','oqc_textblock_created_by','Users','users','id','oqc_TextBlock','oqc_textblock','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7ac089e2-2529-cbe6-53fb-546ec8eff179','oqc_offering_modified_user','Users','users','id','oqc_Offering','oqc_offering','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7ba78aa0-171d-1022-725b-546ec854e5ee','oqc_offering_created_by','Users','users','id','oqc_Offering','oqc_offering','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7c460f77-f4a2-f1b2-9aa4-546ec8d6e4bd','oqc_offering_assigned_user','Users','users','id','oqc_Offering','oqc_offering','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7d02f0e3-2bf2-426d-87db-546ec8232837','oqc_offering_company_search','Accounts','accounts','id','oqc_Offering','oqc_offering','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7dbe3497-d5a7-2132-93c1-546ec86997c5','oqc_offering_officenumber_search','Accounts','accounts_cstm','id_c','oqc_Offering','oqc_offering','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7e3e112a-62cc-9dac-04e5-546ec82bd6f9','oqc_offering_contact_rel','Contacts','contacts','id','oqc_Offering','oqc_offering','clientcontact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7ee57c99-9355-d559-be9c-546ec8cf0d15','oqc_task_oqc_offering','oqc_Offering','oqc_offering','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('812a2d51-089e-a005-73ee-546ec8ee22aa','oqc_addition_modified_user','Users','users','id','oqc_Addition','oqc_addition','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('81360e0a-e68b-12d4-dc23-546ec86ab7bb','prospect_campaign_log','Prospects','prospects','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Prospects',0,0),('8232041a-6cab-f366-0f2f-546ec83b6360','oqc_addition_created_by','Users','users','id','oqc_Addition','oqc_addition','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('83383a9a-a2c3-168e-1f92-546ec8889488','oqc_addition_assigned_user','Users','users','id','oqc_Addition','oqc_addition','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8416b868-37b7-2e49-ddd3-546ec84f532a','oqc_addition_company_search','Accounts','accounts','id','oqc_Addition','oqc_addition','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('851ac85e-5d45-1b2d-fa66-546ec8626213','oqc_addition_officenumber_search','Accounts','accounts_cstm','id_c','oqc_Addition','oqc_addition','company_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('860bcfda-6343-150f-48af-546ec8bb0a36','oqc_addition_contact_rel','Contacts','contacts','id','oqc_Addition','oqc_addition','clientcontact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('86f25031-b094-292b-d63c-546ec87ac009','oqc_task_oqc_addition','oqc_Addition','oqc_addition','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8890f64f-ec0d-7118-9f02-546ec83f2592','oqc_productcatalog_modified_user','Users','users','id','oqc_ProductCatalog','oqc_productcatalog','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('89705063-181e-6db5-fca4-546ec8f4e4fa','oqc_productcatalog_created_by','Users','users','id','oqc_ProductCatalog','oqc_productcatalog','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8a3c2444-cd8d-9197-5c36-546ec8b7fa9e','oqc_productcatalog_assigned_user','Users','users','id','oqc_ProductCatalog','oqc_productcatalog','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8afe4b53-0493-2331-7d13-546ec80156c4','oqc_task_oqc_productcatalog','oqc_ProductCatalog','oqc_productcatalog','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8cc1012b-0774-a178-c7f7-546ec8f2ce29','oqc_externalcontract_modified_user','Users','users','id','oqc_ExternalContract','oqc_externalcontract','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8d96f8c1-8f48-b142-02e2-546ec88e88f0','oqc_externalcontract_created_by','Users','users','id','oqc_ExternalContract','oqc_externalcontract','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8e456e7c-aa2f-7bbe-6083-546ec8aa0a85','oqc_externalcontract_assigned_user','Users','users','id','oqc_ExternalContract','oqc_externalcontract','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8ec98622-a75f-dd98-25d6-546ec8b47409','account_search','Accounts','accounts','id','oqc_ExternalContract','oqc_externalcontract','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8f966e8b-c7ad-0360-cce0-546ec8fa6380','oqc_task_oqc_externalcontract','oqc_ExternalContract','oqc_externalcontract','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8fcf0285-ff2d-027e-973e-546ec8e3feaa','email_template_email_marketings','EmailTemplates','email_templates','id','EmailMarketing','email_marketing','template_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('911c475f-550c-e4dc-22f8-546ec83ab4fb','oqc_externalcontractpositions_modified_user','Users','users','id','oqc_ExternalContractPositions','oqc_externalcontractpositions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('921f3f18-1b44-887d-1736-546ec8982ddc','oqc_externalcontractpositions_created_by','Users','users','id','oqc_ExternalContractPositions','oqc_externalcontractpositions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9321f6fe-c4a1-97ee-1d53-546ec8bd4f30','oqc_externalcontractpositions_assigned_user','Users','users','id','oqc_ExternalContractPositions','oqc_externalcontractpositions','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9594349e-b256-a876-8cd5-546ec85303ad','oqc_externalcontractcosts_modified_user','Users','users','id','oqc_ExternalContractCosts','oqc_externalcontractcosts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('965ebf0f-2a57-c1f4-5b48-546ec85a99c5','oqc_externalcontractcosts_created_by','Users','users','id','oqc_ExternalContractCosts','oqc_externalcontractcosts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('972d6ee5-2794-4c58-0f10-546ec8dab7ea','oqc_externalcontractcosts_assigned_user','Users','users','id','oqc_ExternalContractCosts','oqc_externalcontractcosts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('983ac928-238c-c269-ffd6-546ec8e9ce76','oqc_externalcontractdetailedcosts_modified_user','Users','users','id','oqc_ExternalContractDetailedCosts','oqc_externalcontractdetailedcosts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('999980f2-3821-c8b6-a317-546ec812b7d8','oqc_externalcontractdetailedcosts_created_by','Users','users','id','oqc_ExternalContractDetailedCosts','oqc_externalcontractdetailedcosts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9af2c08a-d27c-12e1-8e90-546ec8690c61','oqc_externalcontractdetailedcosts_assigned_user','Users','users','id','oqc_ExternalContractDetailedCosts','oqc_externalcontractdetailedcosts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9c8a1e60-5f39-487a-593a-546ec8395b2d','oqc_task_modified_user','Users','users','id','oqc_Task','oqc_task','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9d34c013-2e30-3bc4-54b7-546ec84a86ee','oqc_task_created_by','Users','users','id','oqc_Task','oqc_task','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9de31094-1d03-bf36-334c-546ec8cbe3bf','oqc_task_assigned_user','Users','users','id','oqc_Task','oqc_task','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9e69779e-64fd-56ad-7a33-546ec8bf5945','oqctask_fellowtasks','oqc_Task','oqc_task','id','oqc_Task','oqc_task','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9f15b86d-00b6-8280-a7bd-546ec899c3d7','oqc_task_notes','oqc_Task','oqc_task','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9f280225-6b75-3b0f-5bdd-546ec87b8edb','campaign_campaigntrakers','Campaigns','campaigns','id','CampaignTrackers','campaign_trkrs','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b3d90f9d-15ac-feee-2b38-546ec89ca49e','schedulers_created_by_rel','Users','users','id','Schedulers','schedulers','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('b450e5dd-3e0d-9cb6-c753-546ec80ccc1b','accounts_bugs','Accounts','accounts','id','Bugs','bugs','id','accounts_bugs','account_id','bug_id','many-to-many',NULL,NULL,0,0),('b61c7bef-c2d6-11c0-a38f-546ec8aeed13','accounts_contacts','Accounts','accounts','id','Contacts','contacts','id','accounts_contacts','account_id','contact_id','many-to-many',NULL,NULL,0,0),('b6b77439-bcb5-e998-f9a1-546ec8ccc828','accounts_opportunities','Accounts','accounts','id','Opportunities','opportunities','id','accounts_opportunities','account_id','opportunity_id','many-to-many',NULL,NULL,0,0),('b75e49b4-ffed-aabe-669f-546ec8a2785c','calls_contacts','Calls','calls','id','Contacts','contacts','id','calls_contacts','call_id','contact_id','many-to-many',NULL,NULL,0,0),('b7c81f1a-10e4-7d55-4fd2-546ec84e48f9','calls_users','Calls','calls','id','Users','users','id','calls_users','call_id','user_id','many-to-many',NULL,NULL,0,0),('b8a5319d-02fd-9147-b7fb-546ec885ce27','calls_leads','Calls','calls','id','Leads','leads','id','calls_leads','call_id','lead_id','many-to-many',NULL,NULL,0,0),('b939d7bc-f2d3-2376-0a86-546ec8e25b68','cases_bugs','Cases','cases','id','Bugs','bugs','id','cases_bugs','case_id','bug_id','many-to-many',NULL,NULL,0,0),('b9a1a810-a6c6-87fa-7916-546ec882ee54','contacts_bugs','Contacts','contacts','id','Bugs','bugs','id','contacts_bugs','contact_id','bug_id','many-to-many',NULL,NULL,0,0),('ba3f6f3d-3568-736b-5848-546ec88df149','contacts_cases','Contacts','contacts','id','Cases','cases','id','contacts_cases','contact_id','case_id','many-to-many',NULL,NULL,0,0),('baf09755-f251-798c-ebaf-546ec88d1053','contacts_users','Contacts','contacts','id','Users','users','id','contacts_users','contact_id','user_id','many-to-many',NULL,NULL,0,0),('bb968f19-fad9-5609-1fbb-546ec86d9d89','emails_bugs_rel','Emails','emails','id','Bugs','bugs','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Bugs',0,0),('bbf6f72e-5cd0-751d-7924-546ec8f74db1','emails_cases_rel','Emails','emails','id','Cases','cases','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Cases',0,0),('bc8f205e-817f-b833-c495-546ec833ae7a','emails_opportunities_rel','Emails','emails','id','Opportunities','opportunities','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Opportunities',0,0),('bcb0041f-8c1d-8ecf-c722-546ec8fbd433','prospects_modified_user','Users','users','id','Prospects','prospects','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bd6d825b-7e19-4fe3-ce66-546ec8bc9451','emails_tasks_rel','Emails','emails','id','Tasks','tasks','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Tasks',0,0),('be2608e6-1456-3ab0-21db-546ec86930df','emails_users_rel','Emails','emails','id','Users','users','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Users',0,0),('be9c5fd8-0346-338d-b98f-546ec887def1','emails_project_task_rel','Emails','emails','id','ProjectTask','project_task','id','emails_beans','email_id','bean_id','many-to-many','bean_module','ProjectTask',0,0),('bf24a641-8131-95d2-4312-546ec8e60a8e','emails_projects_rel','Emails','emails','id','Project','project','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Project',0,0),('bfceb169-22cb-ea05-453d-546ec83df36e','emails_prospects_rel','Emails','emails','id','Prospects','prospects','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Prospects',0,0),('c068854a-927e-15c9-632a-546ec884e242','meetings_contacts','Meetings','meetings','id','Contacts','contacts','id','meetings_contacts','meeting_id','contact_id','many-to-many',NULL,NULL,0,0),('c1014c8c-34e7-9f0d-c2e6-546ec88c3d2b','meetings_users','Meetings','meetings','id','Users','users','id','meetings_users','meeting_id','user_id','many-to-many',NULL,NULL,0,0),('c172966f-7d33-8915-acb6-546ec89cb42d','meetings_leads','Meetings','meetings','id','Leads','leads','id','meetings_leads','meeting_id','lead_id','many-to-many',NULL,NULL,0,0),('c19d0956-8ab9-f895-57ee-546ec8eef459','schedulers_modified_user_id_rel','Users','users','id','Schedulers','schedulers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c230150b-e3b9-e7e8-d9f3-546ec89443cb','opportunities_contacts','Opportunities','opportunities','id','Contacts','contacts','id','opportunities_contacts','opportunity_id','contact_id','many-to-many',NULL,NULL,0,0),('c2899fb4-1d3f-7c26-f72c-546ec846b61d','prospect_list_campaigns','ProspectLists','prospect_lists','id','Campaigns','campaigns','id','prospect_list_campaigns','prospect_list_id','campaign_id','many-to-many',NULL,NULL,0,0),('c2d6792f-eb3d-17c9-1a0e-546ec8a54498','leads_modified_user','Users','users','id','Leads','leads','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c30f0548-82c5-9a7e-7903-546ec81f3ebb','prospect_list_contacts','ProspectLists','prospect_lists','id','Contacts','contacts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Contacts',0,0),('c35545d2-e75b-f609-8570-546ec8deb91e','leads_created_by','Users','users','id','Leads','leads','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c36bb8ad-3146-8f6e-7d04-546ec8a2b13e','prospect_list_prospects','ProspectLists','prospect_lists','id','Prospects','prospects','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Prospects',0,0),('c3f45357-0f18-0c74-40a0-546ec8bd1f57','prospect_list_leads','ProspectLists','prospect_lists','id','Leads','leads','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Leads',0,0),('c4956e54-23a9-2fdd-19d1-546ec8de9bac','prospect_list_users','ProspectLists','prospect_lists','id','Users','users','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Users',0,0),('c49f50ec-d063-2003-d2b7-546ec8df525e','leads_assigned_user','Users','users','id','Leads','leads','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c525721c-93ab-9dce-d013-546ec8ed5aa4','leads_email_addresses','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Leads',0,0),('c527e4ab-0d3c-231c-7609-546ec8f76144','prospect_list_accounts','ProspectLists','prospect_lists','id','Accounts','accounts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Accounts',0,0),('c59365e8-9ac7-4c00-ac07-546ec8c99287','leads_email_addresses_primary','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('c594e503-fad3-9331-07c5-546ec8ea71df','roles_users','Roles','roles','id','Users','users','id','roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('c619bef1-c6f2-1e93-abcc-546ec8f92424','lead_direct_reports','Leads','leads','id','Leads','leads','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c624972d-5571-aa5a-d0e3-546ec8470fba','projects_bugs','Project','project','id','Bugs','bugs','id','projects_bugs','project_id','bug_id','many-to-many',NULL,NULL,0,0),('c6829276-890a-1dd9-7b39-546ec85b7a77','lead_tasks','Leads','leads','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('c7050710-60da-f5ee-a992-546ec8c82980','lead_notes','Leads','leads','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('c70ae170-e064-c9e2-277b-546ec8ecbdbe','projects_cases','Project','project','id','Cases','cases','id','projects_cases','project_id','case_id','many-to-many',NULL,NULL,0,0),('c75f41cc-9229-e5ef-5ebc-546ec84a4ce7','lead_meetings','Leads','leads','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('c7a36632-6bee-bd6f-0c6c-546ec84f2403','projects_accounts','Project','project','id','Accounts','accounts','id','projects_accounts','project_id','account_id','many-to-many',NULL,NULL,0,0),('c7e29534-d810-086a-fcc2-546ec8f39504','lead_calls','Leads','leads','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('c7fd3d61-c694-3f73-2880-546ec8bf71f5','projects_contacts','Project','project','id','Contacts','contacts','id','projects_contacts','project_id','contact_id','many-to-many',NULL,NULL,0,0),('c8386a23-abc8-f67d-127f-546ec8675de9','lead_emails','Leads','leads','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('c86c2246-793d-86d4-48a3-546ec86fee6a','projects_opportunities','Project','project','id','Opportunities','opportunities','id','projects_opportunities','project_id','opportunity_id','many-to-many',NULL,NULL,0,0),('c8dc69ed-4d2d-7cbb-ff14-546ec8cbfec5','lead_campaign_log','Leads','leads','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Leads',0,0),('c97d846f-e187-6257-6f2c-546ec8083d79','acl_roles_actions','ACLRoles','acl_roles','id','ACLActions','acl_actions','id','acl_roles_actions','role_id','action_id','many-to-many',NULL,NULL,0,0),('ca15f22e-8165-6403-345f-546ec86a3383','acl_roles_users','ACLRoles','acl_roles','id','Users','users','id','acl_roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('ca76ab10-e9f6-a93b-83b3-546ec8fe146a','cases_modified_user','Users','users','id','Cases','cases','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cac9986d-e899-19c1-3389-546ec8e6812a','email_marketing_prospect_lists','EmailMarketing','email_marketing','id','ProspectLists','prospect_lists','id','email_marketing_prospect_lists','email_marketing_id','prospect_list_id','many-to-many',NULL,NULL,0,0),('caf0c73d-60a3-a014-a6ce-546ec81cffb7','cases_created_by','Users','users','id','Cases','cases','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cb2a42d6-c58a-275b-f04f-546ec8a0a5c8','leads_documents','Leads','leads','id','Documents','documents','id','linked_documents','parent_id','document_id','many-to-many','parent_type','Leads',0,0),('cb417340-261b-ab4e-332e-546ec871d3be','cases_assigned_user','Users','users','id','Cases','cases','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cc038b30-0b1c-3095-7c36-546ec80245ae','case_calls','Cases','cases','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('cc183a5d-323d-a296-e6f1-546ec87a25b2','documents_accounts','Documents','documents','id','Accounts','accounts','id','documents_accounts','document_id','account_id','many-to-many',NULL,NULL,0,0),('cc5a80be-1cd5-7e36-396e-546ec80bb9de','case_tasks','Cases','cases','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('ccabce23-3a30-5f92-687d-546ec860bcd1','documents_contacts','Documents','documents','id','Contacts','contacts','id','documents_contacts','document_id','contact_id','many-to-many',NULL,NULL,0,0),('ccc82123-bc6b-9121-6a62-546ec805ec06','case_notes','Cases','cases','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('cd05c576-fb97-5d80-6e2c-546ec8abb126','case_meetings','Cases','cases','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('cd106cb8-86b6-dbab-35de-546ec8a5bdcd','documents_opportunities','Documents','documents','id','Opportunities','opportunities','id','documents_opportunities','document_id','opportunity_id','many-to-many',NULL,NULL,0,0),('cd664d82-a40c-3037-45e7-546ec8eff3db','case_emails','Cases','cases','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('cd9e36a4-4dbe-9065-789a-546ec8a7034d','documents_cases','Documents','documents','id','Cases','cases','id','documents_cases','document_id','case_id','many-to-many',NULL,NULL,0,0),('ce629629-fba7-edf4-aab0-546ec8f1a42a','documents_bugs','Documents','documents','id','Bugs','bugs','id','documents_bugs','document_id','bug_id','many-to-many',NULL,NULL,0,0),('cecdcaf6-66fd-6047-7a16-546ec85e180a','bugs_modified_user','Users','users','id','Bugs','bugs','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cef48a26-1b31-10c9-1f27-546ec88acb27','oqc_offering_accounts','oqc_Offering','oqc_offering','id','Accounts','accounts','id','oqc_offering_accounts','oqc_offering_ida','accounts_idb','many-to-many',NULL,NULL,0,0),('cf5e3d6b-adb6-07dc-f4a3-546ec8794e92','oqc_addition_contacts','oqc_Addition','oqc_addition','id','Contacts','contacts','id','oqc_addition_contacts','oqc_addition_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('cf6346e4-664a-89f9-8879-546ec835cb4e','bugs_created_by','Users','users','id','Bugs','bugs','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cfe64dea-db69-18ac-3005-546ec8595d92','oqc_externalcontract_documents','oqc_ExternalContract','oqc_externalcontract','id','Documents','documents','id','oqc_externact_documents','oqc_externalcontract_ida','documents_idb','many-to-many',NULL,NULL,0,0),('cff1d436-4623-7043-4f46-546ec8e513bb','bugs_assigned_user','Users','users','id','Bugs','bugs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d0d0d6c7-7af3-95ec-90ae-546ec89573ce','oqc_offering_opportunities','oqc_Offering','oqc_offering','id','Opportunities','opportunities','id','oqc_offering_opportunities','oqc_offering_ida','opportunities_idb','many-to-many',NULL,NULL,0,0),('d0d81d6b-ded9-4839-aaef-546ec8af8f33','bug_tasks','Bugs','bugs','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('d15fa367-8916-a44d-a7d3-546ec85ce976','bug_meetings','Bugs','bugs','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('d17ace5a-b728-5173-1109-546ec8eee51d','oqc_contract_oqc_addition','oqc_Contract','oqc_contract','id','oqc_Addition','oqc_addition','id','oqc_contract_oqc_addition','oqc_contract_ida','oqc_addition_idb','many-to-many',NULL,NULL,0,0),('d1d0a6c2-ab5a-98a8-b643-546ec866356e','bug_calls','Bugs','bugs','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('d1e8ea61-b748-6114-5973-546ec8a09968','oqc_externalcontract_contacts','oqc_ExternalContract','oqc_externalcontract','id','Contacts','contacts','id','oqc_externaact_contacts','oqc_externalcontract_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('d214da4e-4d2a-49d2-9cb5-546ec8fd86ac','bug_emails','Bugs','bugs','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('d299e46b-74dc-8d87-afd9-546ec8c7c351','oqc_offering_contacts','oqc_Offering','oqc_offering','id','Contacts','contacts','id','oqc_offering_contacts','oqc_offering_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('d2a2087a-b951-ab71-15bd-546ec8b50d35','schedulers_jobs_rel','Schedulers','schedulers','id','SchedulersJobs','job_queue','scheduler_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d2ac0afb-86b2-b11c-334d-546ec8598e34','bug_notes','Bugs','bugs','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('d3440276-6939-e4e7-dbbd-546ec8a334e2','bugs_release','Releases','releases','id','Bugs','bugs','found_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d38f7c49-b1bf-34ad-0bec-546ec8d6aa40','oqc_addition_oqc_service','oqc_Addition','oqc_addition','id','oqc_Service','oqc_service','id','oqc_additio_oqc_service','oqc_addition_ida','oqc_service_idb','many-to-many',NULL,NULL,0,0),('d3cab4ff-ed75-a2d0-8ded-546ec8121edb','bugs_fixed_in_release','Releases','releases','id','Bugs','bugs','fixed_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d43d9703-8952-ea30-01bb-546ec873ae70','oqc_offering_oqc_service','oqc_Offering','oqc_offering','id','oqc_Service','oqc_service','id','oqc_offerin_oqc_service','oqc_offering_ida','oqc_service_idb','many-to-many',NULL,NULL,0,0),('d4629b11-cc98-a47b-a734-546ec8109206','user_direct_reports','Users','users','id','Users','users','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d4d6134c-da65-df14-7d15-546ec84af08b','users_email_addresses','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Users',0,0),('d4d8e9ce-5bbb-b405-a3f3-546ec825802d','oqc_contract_oqc_product','oqc_Contract','oqc_contract','id','oqc_Product','oqc_product','id','oqc_contrac_oqc_product','oqc_contract_ida','oqc_product_idb','many-to-many',NULL,NULL,0,0),('d5b8bb22-dc49-d4af-a0fc-546ec85aebb3','users_email_addresses_primary','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('d5f1d731-2b3a-3665-2ce4-546ec89a653e','oqc_product_documents','oqc_Product','oqc_product','id','Documents','documents','id','oqc_product_documents','oqc_product_ida','documents_idb','many-to-many',NULL,NULL,0,0),('d64ca7d7-86df-a898-afdd-546ec8b484db','campaignlog_contact','CampaignLog','campaign_log','related_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d69d984a-ccae-8dc2-199c-546ec8e9e653','oqc_offering_oqc_product','oqc_Offering','oqc_offering','id','oqc_Product','oqc_product','id','oqc_offerin_oqc_product','oqc_offering_ida','oqc_product_idb','many-to-many',NULL,NULL,0,0),('d6c16be2-bd79-42b8-d48d-546ec847e5be','campaignlog_lead','CampaignLog','campaign_log','related_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d72bf7d7-d775-99c3-17d9-546ec89fdfdb','oqc_externalcontract_accounts','oqc_ExternalContract','oqc_externalcontract','id','Accounts','accounts','id','oqc_externaact_accounts','oqc_externalcontract_ida','accounts_idb','many-to-many',NULL,NULL,0,0),('d73c0486-64f6-67fa-1775-546ec80bb4d4','campaignlog_created_opportunities','CampaignLog','campaign_log','related_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d8472192-4def-32c4-ba1a-546ec837d6b9','campaignlog_targeted_users','CampaignLog','campaign_log','target_id','Users','users','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d868e8b7-2c4e-bc07-e42e-546ec8d4e710','oqc_contract_oqc_service','oqc_Contract','oqc_contract','id','oqc_Service','oqc_service','id','oqc_contrac_oqc_service','oqc_contract_ida','oqc_service_idb','many-to-many',NULL,NULL,0,0),('d8be5488-0571-1a7b-8d49-546ec8ea8891','campaignlog_sent_emails','CampaignLog','campaign_log','related_id','Emails','emails','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d90bf6be-53e1-a18c-e00a-546ec88d3117','oqc_externalcontract_project','oqc_ExternalContract','oqc_externalcontract','id','Project','project','id','oqc_externaract_project','oqc_externalcontract_ida','project_idb','many-to-many',NULL,NULL,0,0),('d95535b4-0333-2fcc-4ce7-546ec833c2f4','projects_notes','Project','project','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('d97ac4c6-3989-c370-19ea-546ec8d56c54','oqc_addition_documents','oqc_Addition','oqc_addition','id','Documents','documents','id','oqc_addition_documents','oqc_addition_ida','documents_idb','many-to-many',NULL,NULL,0,0),('d9bcfd68-8f8f-21a8-b672-546ec8b761be','oqc_addition_oqc_product','oqc_Addition','oqc_addition','id','oqc_Product','oqc_product','id','oqc_additio_oqc_product','oqc_addition_ida','oqc_product_idb','many-to-many',NULL,NULL,0,0),('d9dcbe82-3b9f-8302-4d59-546ec8817179','projects_tasks','Project','project','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('daa6b2e8-1fa2-fb67-d926-546ec80a72fd','oqc_contract_contacts','oqc_Contract','oqc_contract','id','Contacts','contacts','id','oqc_contract_contacts','oqc_contract_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('dab56c5b-b690-3932-6c1a-546ec8b1c5da','projects_meetings','Project','project','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('db151307-7427-3319-e354-546ec815b7cf','projects_calls','Project','project','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('db1e4745-8c00-6476-3f76-546ec846dd02','oqc_offering_project','oqc_Offering','oqc_offering','id','Project','project','id','oqc_offering_project','oqc_offering_ida','project_idb','many-to-many',NULL,NULL,0,0),('db874ca1-fab6-a459-7157-546ec8ba8165','oqc_addition_accounts','oqc_Addition','oqc_addition','id','Accounts','accounts','id','oqc_addition_accounts','oqc_addition_ida','accounts_idb','many-to-many',NULL,NULL,0,0),('db978415-5ebe-db17-6744-546ec8fa2140','projects_emails','Project','project','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('dbd6d769-c15a-9d62-3c6d-546ec81b128f','oqc_task_users','oqc_Task','oqc_task','id','Users','users','id','oqc_task_users','oqc_task_id','user_id','many-to-many',NULL,NULL,0,0),('dbf141d7-5da7-92b7-f996-546ec8087f39','projects_project_tasks','Project','project','id','ProjectTask','project_task','project_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dc47033b-8ef7-5cff-b785-546ec867d7ef','oqc_productcatalog_documents','oqc_ProductCatalog','oqc_productcatalog','id','Documents','documents','id','oqc_productcatalog_documents','oqc_productcatalog_ida','documents_idb','many-to-many',NULL,NULL,0,0),('dc6b6c97-b68c-ef2e-481c-546ec8450c2c','projects_assigned_user','Users','users','id','Project','project','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dd0c97a5-5be5-e954-fea9-546ec88e4335','projects_modified_user','Users','users','id','Project','project','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dd16a17b-4731-2f6d-719f-546ec8420357','oqc_contract_documents','oqc_Contract','oqc_contract','id','Documents','documents','id','oqc_contract_documents','oqc_contract_ida','documents_idb','many-to-many',NULL,NULL,0,0),('dd8f7fa6-44da-c0e2-13a1-546ec8072854','oqc_contract_project','oqc_Contract','oqc_contract','id','Project','project','id','oqc_contract_project','oqc_contract_ida','project_idb','many-to-many',NULL,NULL,0,0),('dd9432a5-8c7d-c76a-ded1-546ec888d860','projects_created_by','Users','users','id','Project','project','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ddef4895-8071-6730-d16b-546ec86cb89d','oqc_externalcontract_oqc_contract','oqc_ExternalContract','oqc_externalcontract','id','oqc_Contract','oqc_contract','id','oqc_externaoqc_contract','oqc_externalcontract_ida','oqc_contract_idb','many-to-many',NULL,NULL,0,0),('de69e7e4-f074-904e-765b-546ec87977a2','oqc_contract_accounts','oqc_Contract','oqc_contract','id','Accounts','accounts','id','oqc_contract_accounts','oqc_contract_ida','accounts_idb','many-to-many',NULL,NULL,0,0),('de8a7d3d-cfbf-d65d-a7bb-546ec867e2f7','project_tasks_notes','ProjectTask','project_task','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('dec5a534-3ab4-b313-1195-546ec80cb890','oqc_offering_documents','oqc_Offering','oqc_offering','id','Documents','documents','id','oqc_offering_documents','oqc_offering_ida','documents_idb','many-to-many',NULL,NULL,0,0),('df856e83-6967-ba6c-2e30-546ec8c4fca4','project_tasks_tasks','ProjectTask','project_task','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('df96ae51-bdde-2e32-b9fd-546ec86a74c8','oqc_offering_oqc_contract','oqc_Offering','oqc_offering','id','oqc_Contract','oqc_contract','id','oqc_offering_oqc_contract','oqc_offering_ida','oqc_contract_idb','many-to-many',NULL,NULL,0,0),('e098d503-bcb5-446c-880b-546ec8571f17','project_tasks_meetings','ProjectTask','project_task','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('e1cd1609-fada-053b-27ea-546ec8a0b589','project_tasks_calls','ProjectTask','project_task','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('e2f34447-ef6f-7e74-2280-546ec8465d94','project_tasks_emails','ProjectTask','project_task','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('e3ff4bda-281d-a6d5-a461-546ec8c89504','project_tasks_assigned_user','Users','users','id','ProjectTask','project_task','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e4fdd74e-c373-5591-65a5-546ec8a64a02','project_tasks_modified_user','Users','users','id','ProjectTask','project_task','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e5ee21d6-3dac-4964-eb5b-546ec8ee8329','project_tasks_created_by','Users','users','id','ProjectTask','project_task','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e75daca4-32ea-040e-b044-546ec85c8de5','campaigns_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e829f717-2cf2-01c7-cb74-546ec8ba2e86','campaigns_created_by','Users','users','id','Campaigns','campaigns','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e8f7c463-924f-1037-5242-546ec81236ec','campaigns_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e9c8515c-93df-a2c8-2986-546ec8421c47','campaign_accounts','Campaigns','campaigns','id','Accounts','accounts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eaa85e42-6fa6-344d-4af5-546ec8435e51','campaign_contacts','Campaigns','campaigns','id','Contacts','contacts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eae30946-da35-cf92-3423-546ec8f1dae3','schedulersjobs_assigned_user','Users','users','id','SchedulersJobs','schedulersjobs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eb8f2b81-4ac6-928e-f33f-546ec8496a62','campaign_leads','Campaigns','campaigns','id','Leads','leads','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ec64c241-72eb-af92-9ee8-546ec8fcc74f','campaign_prospects','Campaigns','campaigns','id','Prospects','prospects','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ed4d1ee6-063b-77ab-9086-546ec8a924ba','campaign_opportunities','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ee0c13cb-09a1-072d-00c5-546ec8686e92','campaign_email_marketing','Campaigns','campaigns','id','EmailMarketing','email_marketing','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eee35622-e81e-6a12-1cbc-546ec8904878','campaign_emailman','Campaigns','campaigns','id','EmailMan','emailman','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('effbff12-01c8-861f-8747-546ec808e9fc','campaign_campaignlog','Campaigns','campaigns','id','CampaignLog','campaign_log','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f10c1e82-9628-9a9e-d398-546ec8eed013','campaign_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f1fb6fe8-3a41-d060-f23e-546ec8a2723b','campaign_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f3487939-6a23-937c-ba50-546ec84f8589','prospectlists_assigned_user','Users','users','id','prospectlists','prospect_lists','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0);
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
INSERT INTO `schedulers` VALUES ('a8a72b38-7258-f4a7-933d-546ec4cdc271',0,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','Prune Tracker Tables','function::trimTracker','2005-01-01 19:15:01','2020-12-31 23:59:59','0::2::1::*::*',NULL,NULL,NULL,'Active',1),('a98427e6-3db0-0c3b-6170-546ec4851459',0,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','Check Inbound Mailboxes','function::pollMonitoredInboxes','2005-01-01 08:30:01','2020-12-31 23:59:59','*::*::*::*::*',NULL,NULL,NULL,'Active',0),('aa8328e7-563b-5357-2165-546ec4cda8ff',0,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','Run Nightly Process Bounced Campaign Emails','function::pollMonitoredInboxesForBouncedCampaignEmails','2005-01-01 18:30:01','2020-12-31 23:59:59','0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('ab7bda9a-734c-d82d-39ab-546ec48b21e5',0,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','Run Nightly Mass Email Campaigns','function::runMassEmailCampaign','2005-01-01 11:00:01','2020-12-31 23:59:59','0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('ad3d729a-453e-8fdd-ada7-546ec49fd2ad',0,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','Prune Database on 1st of Month','function::pruneDatabase','2005-01-01 18:15:01','2020-12-31 23:59:59','0::4::1::*::*',NULL,NULL,NULL,'Inactive',0),('ae6a809c-927f-776c-5c1c-546ec411d3d6',0,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','Run Email Reminder Notifications','function::sendEmailReminders','2008-01-01 14:45:01','2020-12-31 23:59:59','*::*::*::*::*',NULL,NULL,NULL,'Active',0),('afb7c99b-5591-09c1-e6d2-546ec48c37e6',0,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','Clean Jobs Queue','function::cleanJobQueue','2012-01-01 08:45:01','2030-12-31 23:59:59','0::5::*::*::*',NULL,NULL,NULL,'Active',0),('b10c3250-9ff8-d6af-860d-546ec43e7bf7',0,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','Removal of documents from filesystem','function::removeDocumentsFromFS','2012-01-01 08:00:01','2030-12-31 23:59:59','0::3::1::*::*',NULL,NULL,NULL,'Active',0),('b236d03f-c832-a886-542c-546ec4e9b42a',0,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','Prune SugarFeed Tables','function::trimSugarFeeds','2005-01-01 17:15:01','2020-12-31 23:59:59','0::2::1::*::*',NULL,NULL,NULL,'Active',1);
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
INSERT INTO `upgrade_history` VALUES ('1b560310-a9dc-bca7-1ce9-546ec4d1c187','upload/upgrades/module/oqc-openqc-2.2RC3.zip','2783718fbfcb86532a7531e3e19b3db5','module','installed','2.2RC3','OpenQuotesAndContracts','Quotes, Contracts and Products modules plus a lot of extra functionality','OpenQuotesAndContracts','YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e3M6MTM6InJlZ2V4X21hdGNoZXMiO2E6MTp7aTowO3M6MTE6IjZcLlswLTVdXC4qIjt9fXM6MjQ6ImFjY2VwdGFibGVfc3VnYXJfZmxhdm9ycyI7YToxOntpOjA7czoyOiJDRSI7fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6Mzoib3FjIjtzOjY6ImF1dGhvciI7czozOiJIUEkiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjcyOiJRdW90ZXMsIENvbnRyYWN0cyBhbmQgUHJvZHVjdHMgbW9kdWxlcyBwbHVzIGEgbG90IG9mIGV4dHJhIGZ1bmN0aW9uYWxpdHkiO3M6NDoiaWNvbiI7czowOiIiO3M6MTY6ImlzX3VuaW5zdGFsbGFibGUiO2I6MTtzOjQ6Im5hbWUiO3M6MjI6Ik9wZW5RdW90ZXNBbmRDb250cmFjdHMiO3M6MTQ6InB1Ymxpc2hlZF9kYXRlIjtzOjEwOiIyMDEzLzA5LzEwIjtzOjQ6InR5cGUiO3M6NjoibW9kdWxlIjtzOjc6InZlcnNpb24iO3M6NjoiMi4yUkMzIjtzOjEzOiJyZW1vdmVfdGFibGVzIjtzOjY6InByb21wdCI7fXM6MTE6Imluc3RhbGxkZWZzIjthOjEyOntzOjI6ImlkIjtzOjIyOiJPcGVuUXVvdGVzQW5kQ29udHJhY3RzIjtzOjE0OiJhZG1pbmlzdHJhdGlvbiI7YToxOntpOjA7YToyOntzOjQ6ImZyb20iO3M6Nzg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0FkbWluaXN0cmF0aW9uL29xY19BZG1pbmlzdHJhdGlvbl9tZW51LnBocCI7czoyOiJ0byI7czo1MDoibW9kdWxlcy9BZG1pbmlzdHJhdGlvbi9vcWNfQWRtaW5pc3RyYXRpb25fbWVudS5waHAiO319czoxMjoic2NoZWR1bGVkZWZzIjthOjE6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo2NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9vcWNfU2NoZWR1bGVycy9vcWNfQWRkSm9ic0hlcmUucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMDoiU2NoZWR1bGVycyI7fX1zOjQ6ImNvcHkiO2E6MjI6e2k6MTthOjI6e3M6NDoiZnJvbSI7czo0NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9vcWNfQ2F0ZWdvcnkiO3M6MjoidG8iO3M6MjA6Im1vZHVsZXMvb3FjX0NhdGVnb3J5Ijt9aToyO2E6Mjp7czo0OiJmcm9tIjtzOjQzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL29xY19Qcm9kdWN0IjtzOjI6InRvIjtzOjE5OiJtb2R1bGVzL29xY19Qcm9kdWN0Ijt9aTozO2E6Mjp7czo0OiJmcm9tIjtzOjQ0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL29xY19Db250cmFjdCI7czoyOiJ0byI7czoyMDoibW9kdWxlcy9vcWNfQ29udHJhY3QiO31pOjQ7YToyOntzOjQ6ImZyb20iO3M6NDM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX1NlcnZpY2UiO3M6MjoidG8iO3M6MTk6Im1vZHVsZXMvb3FjX1NlcnZpY2UiO31pOjU7YToyOntzOjQ6ImZyb20iO3M6NTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0VkaXRlZFRleHRCbG9jayI7czoyOiJ0byI7czoyNzoibW9kdWxlcy9vcWNfRWRpdGVkVGV4dEJsb2NrIjt9aTo2O2E6Mjp7czo0OiJmcm9tIjtzOjQ1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL29xY19UZXh0QmxvY2siO3M6MjoidG8iO3M6MjE6Im1vZHVsZXMvb3FjX1RleHRCbG9jayI7fWk6NzthOjI6e3M6NDoiZnJvbSI7czo0NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9vcWNfT2ZmZXJpbmciO3M6MjoidG8iO3M6MjA6Im1vZHVsZXMvb3FjX09mZmVyaW5nIjt9aTo4O2E6Mjp7czo0OiJmcm9tIjtzOjQ0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL29xY19BZGRpdGlvbiI7czoyOiJ0byI7czoyMDoibW9kdWxlcy9vcWNfQWRkaXRpb24iO31pOjk7YToyOntzOjQ6ImZyb20iO3M6MzU6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2luY2x1ZGUvb3FjIjtzOjI6InRvIjtzOjExOiJpbmNsdWRlL29xYyI7fWk6MTA7YToyOntzOjQ6ImZyb20iO3M6NDc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0NyZWF0ZVBvcHVwIjtzOjI6InRvIjtzOjIzOiJtb2R1bGVzL29xY19DcmVhdGVQb3B1cCI7fWk6MTE7YToyOntzOjQ6ImZyb20iO3M6Mjc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL29xYyI7czoyOiJ0byI7czozOiJvcWMiO31pOjEyO2E6Mjp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9pbmNsdWRlL1N1Z2FyT2JqZWN0cy90ZW1wbGF0ZXMvb3FjX2NvbnRyYWN0X2Jhc2UiO3M6MjoidG8iO3M6NDg6ImluY2x1ZGUvU3VnYXJPYmplY3RzL3RlbXBsYXRlcy9vcWNfY29udHJhY3RfYmFzZSI7fWk6MTM7YToyOntzOjQ6ImZyb20iO3M6NTA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX1Byb2R1Y3RDYXRhbG9nIjtzOjI6InRvIjtzOjI2OiJtb2R1bGVzL29xY19Qcm9kdWN0Q2F0YWxvZyI7fWk6MTQ7YToyOntzOjQ6ImZyb20iO3M6NTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3QiO3M6MjoidG8iO3M6Mjg6Im1vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3QiO31pOjE1O2E6Mjp7czo0OiJmcm9tIjtzOjU3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL29xY19FeHRlcm5hbENvbnRyYWN0Q29zdHMiO3M6MjoidG8iO3M6MzM6Im1vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3RDb3N0cyI7fWk6MTY7YToyOntzOjQ6ImZyb20iO3M6NjU6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3REZXRhaWxlZENvc3RzIjtzOjI6InRvIjtzOjQxOiJtb2R1bGVzL29xY19FeHRlcm5hbENvbnRyYWN0RGV0YWlsZWRDb3N0cyI7fWk6MTc7YToyOntzOjQ6ImZyb20iO3M6NjE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3RQb3NpdGlvbnMiO3M6MjoidG8iO3M6Mzc6Im1vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3RQb3NpdGlvbnMiO31pOjE4O2E6Mjp7czo0OiJmcm9tIjtzOjQwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL29xY19UYXNrIjtzOjI6InRvIjtzOjE2OiJtb2R1bGVzL29xY19UYXNrIjt9aToxOTthOjI6e3M6NDoiZnJvbSI7czo1NDoiPGJhc2VwYXRoPi9pY29ucy9kZWZhdWx0L2ltYWdlcy9vcWNfQWRtaW5pc3RyYXRpb24uZ2lmIjtzOjI6InRvIjtzOjQ0OiJ0aGVtZXMvZGVmYXVsdC9pbWFnZXMvb3FjX0FkbWluaXN0cmF0aW9uLmdpZiI7fWk6MjA7YToyOntzOjQ6ImZyb20iO3M6NTA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX0FkbWluaXN0cmF0aW9uIjtzOjI6InRvIjtzOjI2OiJtb2R1bGVzL29xY19BZG1pbmlzdHJhdGlvbiI7fWk6MjE7YToyOntzOjQ6ImZyb20iO3M6NjY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvb3FjX1NjaGVkdWxlcnMvb3FjX0FkZEpvYnNIZXJlLnBocCI7czoyOiJ0byI7czo0NToiY3VzdG9tL21vZHVsZXMvU2NoZWR1bGVycy9vcWNfQWRkSm9ic0hlcmUucGhwIjt9aToyMjthOjI6e3M6NDoiZnJvbSI7czo0MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9vcWNfQXVkaXQiO3M6MjoidG8iO3M6MTc6Im1vZHVsZXMvb3FjX0F1ZGl0Ijt9fXM6ODoibGFuZ3VhZ2UiO2E6NjQ6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZ2VfZ2UubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJnZV9nZSI7fWk6MjthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZGVfZGUubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJkZV9kZSI7fWk6MzthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vaXRfaXQubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6NDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZXNfRVMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19FUyI7fWk6NTthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZnJfRlIubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJmcl9GUiI7fWk6NjthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vcHRfQlIubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9CUiI7fWk6NzthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vcnVfcnUubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6ODthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9BY2NvdW50cy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo5O2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0NvbnRhY3RzL21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjEwO2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0RvY3VtZW50cy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTE7YTozOntzOjQ6ImZyb20iO3M6NzY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvT3Bwb3J0dW5pdGllcy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxMjthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9qZWN0L21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NzoiUHJvamVjdCI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTM7YTozOntzOjQ6ImZyb20iO3M6Nzc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQWRtaW5pc3RyYXRpb24vbW9kX3N0cmluZ3NfZW5fdXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiQWRtaW5pc3RyYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE0O2E6Mzp7czo0OiJmcm9tIjtzOjczOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL1NjaGVkdWxlcnMvbW9kX3N0cmluZ3NfZW5fdXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMDoiU2NoZWR1bGVycyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTU7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQWNjb3VudHMvbW9kX3N0cmluZ3NfZ2VfZ2UucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJnZV9nZSI7fWk6MTY7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQ29udGFjdHMvbW9kX3N0cmluZ3NfZ2VfZ2UucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJnZV9nZSI7fWk6MTc7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvRG9jdW1lbnRzL21vZF9zdHJpbmdzX2dlX2dlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiRG9jdW1lbnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImdlX2dlIjt9aToxODthOjM6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9PcHBvcnR1bml0aWVzL21vZF9zdHJpbmdzX2dlX2dlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZ2VfZ2UiO31pOjE5O2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL1Byb2plY3QvbW9kX3N0cmluZ3NfZ2VfZ2UucGhwIjtzOjk6InRvX21vZHVsZSI7czo3OiJQcm9qZWN0IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImdlX2dlIjt9aToyMDthOjM6e3M6NDoiZnJvbSI7czo3NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9BZG1pbmlzdHJhdGlvbi9tb2Rfc3RyaW5nc19nZV9nZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJBZG1pbmlzdHJhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJnZV9nZSI7fWk6MjE7YTozOntzOjQ6ImZyb20iO3M6NzM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvU2NoZWR1bGVycy9tb2Rfc3RyaW5nc19nZV9nZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEwOiJTY2hlZHVsZXJzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImdlX2dlIjt9aToyMjthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9BY2NvdW50cy9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToyMzthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Db250YWN0cy9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToyNDthOjM6e3M6NDoiZnJvbSI7czo3MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Eb2N1bWVudHMvbW9kX3N0cmluZ3NfZGVfZGUucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJEb2N1bWVudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjI1O2E6Mzp7czo0OiJmcm9tIjtzOjc2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL09wcG9ydHVuaXRpZXMvbW9kX3N0cmluZ3NfZGVfZGUucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czo4OiJsYW5ndWFnZSI7czo1OiJkZV9kZSI7fWk6MjY7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvUHJvamVjdC9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjc6IlByb2plY3QiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjI3O2E6Mzp7czo0OiJmcm9tIjtzOjc3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0FkbWluaXN0cmF0aW9uL21vZF9zdHJpbmdzX2RlX2RlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IkFkbWluaXN0cmF0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToyODthOjM6e3M6NDoiZnJvbSI7czo3MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9TY2hlZHVsZXJzL21vZF9zdHJpbmdzX2RlX2RlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTA6IlNjaGVkdWxlcnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjI5O2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0FjY291bnRzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjMwO2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0NvbnRhY3RzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjMxO2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0RvY3VtZW50cy9tb2Rfc3RyaW5nc19pdF9pdC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6MzI7YTozOntzOjQ6ImZyb20iO3M6NzY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvT3Bwb3J0dW5pdGllcy9tb2Rfc3RyaW5nc19pdF9pdC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Iml0X2l0Ijt9aTozMzthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9qZWN0L21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NzoiUHJvamVjdCI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6MzQ7YTozOntzOjQ6ImZyb20iO3M6Nzc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQWRtaW5pc3RyYXRpb24vbW9kX3N0cmluZ3NfaXRfaXQucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiQWRtaW5pc3RyYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjM1O2E6Mzp7czo0OiJmcm9tIjtzOjczOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL1NjaGVkdWxlcnMvbW9kX3N0cmluZ3NfaXRfaXQucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMDoiU2NoZWR1bGVycyI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6MzY7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQWNjb3VudHMvbW9kX3N0cmluZ3NfZXNfRVMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19FUyI7fWk6Mzc7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQ29udGFjdHMvbW9kX3N0cmluZ3NfZXNfRVMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19FUyI7fWk6Mzg7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvRG9jdW1lbnRzL21vZF9zdHJpbmdzX2VzX0VTLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiRG9jdW1lbnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX0VTIjt9aTozOTthOjM6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9PcHBvcnR1bml0aWVzL21vZF9zdHJpbmdzX2VzX0VTLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfRVMiO31pOjQwO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL1Byb2plY3QvbW9kX3N0cmluZ3NfZXNfRVMucGhwIjtzOjk6InRvX21vZHVsZSI7czo3OiJQcm9qZWN0IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX0VTIjt9aTo0MTthOjM6e3M6NDoiZnJvbSI7czo3NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9BZG1pbmlzdHJhdGlvbi9tb2Rfc3RyaW5nc19lc19FUy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJBZG1pbmlzdHJhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19FUyI7fWk6NDI7YTozOntzOjQ6ImZyb20iO3M6NzM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvU2NoZWR1bGVycy9tb2Rfc3RyaW5nc19lc19FUy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEwOiJTY2hlZHVsZXJzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX0VTIjt9aTo0MzthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9BY2NvdW50cy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo0NDthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Db250YWN0cy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo0NTthOjM6e3M6NDoiZnJvbSI7czo3MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Eb2N1bWVudHMvbW9kX3N0cmluZ3NfZnJfRlIucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJEb2N1bWVudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjQ2O2E6Mzp7czo0OiJmcm9tIjtzOjc2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL09wcG9ydHVuaXRpZXMvbW9kX3N0cmluZ3NfZnJfRlIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czo4OiJsYW5ndWFnZSI7czo1OiJmcl9GUiI7fWk6NDc7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvUHJvamVjdC9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjc6IlByb2plY3QiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjQ4O2E6Mzp7czo0OiJmcm9tIjtzOjc3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0FkbWluaXN0cmF0aW9uL21vZF9zdHJpbmdzX2ZyX0ZSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IkFkbWluaXN0cmF0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo0OTthOjM6e3M6NDoiZnJvbSI7czo3MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9TY2hlZHVsZXJzL21vZF9zdHJpbmdzX2ZyX0ZSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTA6IlNjaGVkdWxlcnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjUwO2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0FjY291bnRzL21vZF9zdHJpbmdzX3B0X0JSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfQlIiO31pOjUxO2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0NvbnRhY3RzL21vZF9zdHJpbmdzX3B0X0JSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfQlIiO31pOjUyO2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL0RvY3VtZW50cy9tb2Rfc3RyaW5nc19wdF9CUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9CUiI7fWk6NTM7YTozOntzOjQ6ImZyb20iO3M6NzY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvT3Bwb3J0dW5pdGllcy9tb2Rfc3RyaW5nc19wdF9CUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InB0X0JSIjt9aTo1NDthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9qZWN0L21vZF9zdHJpbmdzX3B0X0JSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NzoiUHJvamVjdCI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9CUiI7fWk6NTU7YTozOntzOjQ6ImZyb20iO3M6Nzc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQWRtaW5pc3RyYXRpb24vbW9kX3N0cmluZ3NfcHRfQlIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiQWRtaW5pc3RyYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfQlIiO31pOjU2O2E6Mzp7czo0OiJmcm9tIjtzOjczOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL1NjaGVkdWxlcnMvbW9kX3N0cmluZ3NfcHRfQlIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMDoiU2NoZWR1bGVycyI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9CUiI7fWk6NTc7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQWNjb3VudHMvbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6NTg7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvQ29udGFjdHMvbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6NTk7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvRG9jdW1lbnRzL21vZF9zdHJpbmdzX3J1X3J1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiRG9jdW1lbnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTo2MDthOjM6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9PcHBvcnR1bml0aWVzL21vZF9zdHJpbmdzX3J1X3J1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjYxO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9tb2R1bGVzL1Byb2plY3QvbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czo3OiJQcm9qZWN0IjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTo2MjthOjM6e3M6NDoiZnJvbSI7czo3NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvbW9kdWxlcy9BZG1pbmlzdHJhdGlvbi9tb2Rfc3RyaW5nc19ydV9ydS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJBZG1pbmlzdHJhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6NjM7YTozOntzOjQ6ImZyb20iO3M6NzM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL21vZHVsZXMvU2NoZWR1bGVycy9tb2Rfc3RyaW5nc19ydV9ydS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEwOiJTY2hlZHVsZXJzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9fXM6NToiYmVhbnMiO2E6MTQ6e2k6MTthOjQ6e3M6NjoibW9kdWxlIjtzOjEyOiJvcWNfQ2F0ZWdvcnkiO3M6NToiY2xhc3MiO3M6MTI6Im9xY19DYXRlZ29yeSI7czo0OiJwYXRoIjtzOjM3OiJtb2R1bGVzL29xY19DYXRlZ29yeS9vcWNfQ2F0ZWdvcnkucGhwIjtzOjM6InRhYiI7YjowO31pOjI7YTo0OntzOjY6Im1vZHVsZSI7czoxMToib3FjX1Byb2R1Y3QiO3M6NToiY2xhc3MiO3M6MTE6Im9xY19Qcm9kdWN0IjtzOjQ6InBhdGgiO3M6MzU6Im1vZHVsZXMvb3FjX1Byb2R1Y3Qvb3FjX1Byb2R1Y3QucGhwIjtzOjM6InRhYiI7YjoxO31pOjM7YTo0OntzOjY6Im1vZHVsZSI7czoxMjoib3FjX0NvbnRyYWN0IjtzOjU6ImNsYXNzIjtzOjEyOiJvcWNfQ29udHJhY3QiO3M6NDoicGF0aCI7czozNzoibW9kdWxlcy9vcWNfQ29udHJhY3Qvb3FjX0NvbnRyYWN0LnBocCI7czozOiJ0YWIiO2I6MTt9aTo0O2E6NDp7czo2OiJtb2R1bGUiO3M6MTE6Im9xY19TZXJ2aWNlIjtzOjU6ImNsYXNzIjtzOjExOiJvcWNfU2VydmljZSI7czo0OiJwYXRoIjtzOjM1OiJtb2R1bGVzL29xY19TZXJ2aWNlL29xY19TZXJ2aWNlLnBocCI7czozOiJ0YWIiO2I6MDt9aTo1O2E6NDp7czo2OiJtb2R1bGUiO3M6MTk6Im9xY19FZGl0ZWRUZXh0QmxvY2siO3M6NToiY2xhc3MiO3M6MTk6Im9xY19FZGl0ZWRUZXh0QmxvY2siO3M6NDoicGF0aCI7czo1MToibW9kdWxlcy9vcWNfRWRpdGVkVGV4dEJsb2NrL29xY19FZGl0ZWRUZXh0QmxvY2sucGhwIjtzOjM6InRhYiI7YjowO31pOjY7YTo0OntzOjY6Im1vZHVsZSI7czoxMzoib3FjX1RleHRCbG9jayI7czo1OiJjbGFzcyI7czoxMzoib3FjX1RleHRCbG9jayI7czo0OiJwYXRoIjtzOjM5OiJtb2R1bGVzL29xY19UZXh0QmxvY2svb3FjX1RleHRCbG9jay5waHAiO3M6MzoidGFiIjtiOjE7fWk6NzthOjQ6e3M6NjoibW9kdWxlIjtzOjEyOiJvcWNfT2ZmZXJpbmciO3M6NToiY2xhc3MiO3M6MTI6Im9xY19PZmZlcmluZyI7czo0OiJwYXRoIjtzOjM3OiJtb2R1bGVzL29xY19PZmZlcmluZy9vcWNfT2ZmZXJpbmcucGhwIjtzOjM6InRhYiI7YjoxO31pOjg7YTo0OntzOjY6Im1vZHVsZSI7czoxMjoib3FjX0FkZGl0aW9uIjtzOjU6ImNsYXNzIjtzOjEyOiJvcWNfQWRkaXRpb24iO3M6NDoicGF0aCI7czozNzoibW9kdWxlcy9vcWNfQWRkaXRpb24vb3FjX0FkZGl0aW9uLnBocCI7czozOiJ0YWIiO2I6MDt9aTo5O2E6NDp7czo2OiJtb2R1bGUiO3M6MTg6Im9xY19Qcm9kdWN0Q2F0YWxvZyI7czo1OiJjbGFzcyI7czoxODoib3FjX1Byb2R1Y3RDYXRhbG9nIjtzOjQ6InBhdGgiO3M6NDk6Im1vZHVsZXMvb3FjX1Byb2R1Y3RDYXRhbG9nL29xY19Qcm9kdWN0Q2F0YWxvZy5waHAiO3M6MzoidGFiIjtiOjE7fWk6MTA7YTo0OntzOjY6Im1vZHVsZSI7czoyMDoib3FjX0V4dGVybmFsQ29udHJhY3QiO3M6NToiY2xhc3MiO3M6MjA6Im9xY19FeHRlcm5hbENvbnRyYWN0IjtzOjQ6InBhdGgiO3M6NTM6Im1vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3Qvb3FjX0V4dGVybmFsQ29udHJhY3QucGhwIjtzOjM6InRhYiI7YjoxO31pOjExO2E6NDp7czo2OiJtb2R1bGUiO3M6Mjk6Im9xY19FeHRlcm5hbENvbnRyYWN0UG9zaXRpb25zIjtzOjU6ImNsYXNzIjtzOjI5OiJvcWNfRXh0ZXJuYWxDb250cmFjdFBvc2l0aW9ucyI7czo0OiJwYXRoIjtzOjcxOiJtb2R1bGVzL29xY19FeHRlcm5hbENvbnRyYWN0UG9zaXRpb25zL29xY19FeHRlcm5hbENvbnRyYWN0UG9zaXRpb25zLnBocCI7czozOiJ0YWIiO2I6MDt9aToxMjthOjQ6e3M6NjoibW9kdWxlIjtzOjI1OiJvcWNfRXh0ZXJuYWxDb250cmFjdENvc3RzIjtzOjU6ImNsYXNzIjtzOjI1OiJvcWNfRXh0ZXJuYWxDb250cmFjdENvc3RzIjtzOjQ6InBhdGgiO3M6NjM6Im1vZHVsZXMvb3FjX0V4dGVybmFsQ29udHJhY3RDb3N0cy9vcWNfRXh0ZXJuYWxDb250cmFjdENvc3RzLnBocCI7czozOiJ0YWIiO2I6MDt9aToxMzthOjQ6e3M6NjoibW9kdWxlIjtzOjMzOiJvcWNfRXh0ZXJuYWxDb250cmFjdERldGFpbGVkQ29zdHMiO3M6NToiY2xhc3MiO3M6MzM6Im9xY19FeHRlcm5hbENvbnRyYWN0RGV0YWlsZWRDb3N0cyI7czo0OiJwYXRoIjtzOjc5OiJtb2R1bGVzL29xY19FeHRlcm5hbENvbnRyYWN0RGV0YWlsZWRDb3N0cy9vcWNfRXh0ZXJuYWxDb250cmFjdERldGFpbGVkQ29zdHMucGhwIjtzOjM6InRhYiI7YjowO31pOjE0O2E6NDp7czo2OiJtb2R1bGUiO3M6ODoib3FjX1Rhc2siO3M6NToiY2xhc3MiO3M6ODoib3FjX1Rhc2siO3M6NDoicGF0aCI7czoyOToibW9kdWxlcy9vcWNfVGFzay9vcWNfVGFzay5waHAiO3M6MzoidGFiIjtiOjE7fX1zOjEwOiJsYXlvdXRkZWZzIjthOjU6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo1MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfT2ZmZXJpbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoib3FjX09mZmVyaW5nIjt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjUxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19BZGRpdGlvbi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJvcWNfQWRkaXRpb24iO31pOjI7YToyOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX0V4dGVybmFsQ29udHJhY3QucGhwIjtzOjk6InRvX21vZHVsZSI7czoyMDoib3FjX0V4dGVybmFsQ29udHJhY3QiO31pOjM7YToyOntzOjQ6ImZyb20iO3M6NTc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX1Byb2R1Y3RDYXRhbG9nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6Im9xY19Qcm9kdWN0Q2F0YWxvZyI7fWk6NDthOjI6e3M6NDoiZnJvbSI7czo0NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfVGFzay5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6Im9xY19UYXNrIjt9fXM6MTM6InJlbGF0aW9uc2hpcHMiO2E6Mjk6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0RvY3VtZW50cy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19wcm9kdWN0X2RvY3VtZW50c01ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX0RvY3VtZW50cy5waHAiO31pOjE7YTo0OntzOjY6Im1vZHVsZSI7czo5OiJEb2N1bWVudHMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Eb2N1bWVudHMucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfcHJvZHVjdGNhdGFsb2dfZG9jdW1lbnRzTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfRG9jdW1lbnRzLnBocCI7fWk6MjthOjQ6e3M6NjoibW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0RvY3VtZW50cy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19vZmZlcmluZ19kb2N1bWVudHNNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19Eb2N1bWVudHMucGhwIjt9aTozO2E6NDp7czo2OiJtb2R1bGUiO3M6OToiRG9jdW1lbnRzIjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo0OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfRG9jdW1lbnRzLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2FkZGl0aW9uX2RvY3VtZW50c01ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX0RvY3VtZW50cy5waHAiO31pOjQ7YTo0OntzOjY6Im1vZHVsZSI7czo5OiJEb2N1bWVudHMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Eb2N1bWVudHMucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfY29udHJhY3RfZG9jdW1lbnRzTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfRG9jdW1lbnRzLnBocCI7fWk6NTthOjQ6e3M6NjoibW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0RvY3VtZW50cy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjgwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19leHRlcm5hbGNvbnRyYWN0X2RvY3VtZW50c01ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX0RvY3VtZW50cy5waHAiO31pOjY7YTo0OntzOjY6Im1vZHVsZSI7czo4OiJBY2NvdW50cyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0FjY291bnRzLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2NvbnRyYWN0X2FjY291bnRzTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfQWNjb3VudHMucGhwIjt9aTo3O2E6NDp7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19BY2NvdW50cy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19vZmZlcmluZ19hY2NvdW50c01ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX0FjY291bnRzLnBocCI7fWk6ODthOjQ6e3M6NjoibW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo0ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfQWNjb3VudHMucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfYWRkaXRpb25fYWNjb3VudHNNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19BY2NvdW50cy5waHAiO31pOjk7YTo0OntzOjY6Im1vZHVsZSI7czo4OiJBY2NvdW50cyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0FjY291bnRzLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6Nzk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2V4dGVybmFsY29udHJhY3RfYWNjb3VudHNNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19BY2NvdW50cy5waHAiO31pOjEwO2E6NDp7czo2OiJtb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Db250YWN0cy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19jb250cmFjdF9jb250YWN0c01ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX0NvbnRhY3RzLnBocCI7fWk6MTE7YTo0OntzOjY6Im1vZHVsZSI7czo4OiJDb250YWN0cyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0NvbnRhY3RzLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2FkZGl0aW9uX2NvbnRhY3RzTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfQ29udGFjdHMucGhwIjt9aToxMjthOjQ6e3M6NjoibW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo0ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfQ29udGFjdHMucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfb2ZmZXJpbmdfY29udGFjdHNNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19Db250YWN0cy5waHAiO31pOjEzO2E6NDp7czo2OiJtb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Db250YWN0cy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjc5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19leHRlcm5hbGNvbnRyYWN0X2NvbnRhY3RzTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfQ29udGFjdHMucGhwIjt9aToxNDthOjQ6e3M6NjoibW9kdWxlIjtzOjExOiJvcWNfUHJvZHVjdCI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX1Byb2R1Y3QucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfY29udHJhY3Rfb3FjX3Byb2R1Y3RNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19Qcm9kdWN0LnBocCI7fWk6MTU7YTo0OntzOjY6Im1vZHVsZSI7czoxMToib3FjX1Byb2R1Y3QiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Qcm9kdWN0LnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX29mZmVyaW5nX29xY19wcm9kdWN0TWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfUHJvZHVjdC5waHAiO31pOjE2O2E6NDp7czo2OiJtb2R1bGUiO3M6MTE6Im9xY19Qcm9kdWN0IjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo0NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfUHJvZHVjdC5waHAiO3M6OToibWV0YV9kYXRhIjtzOjc0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19hZGRpdGlvbl9vcWNfcHJvZHVjdE1ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX1Byb2R1Y3QucGhwIjt9aToxNzthOjQ6e3M6NjoibW9kdWxlIjtzOjc6IlByb2plY3QiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Qcm9qZWN0LnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2NvbnRyYWN0X3Byb2plY3RNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19Qcm9qZWN0LnBocCI7fWk6MTg7YTo0OntzOjY6Im1vZHVsZSI7czo3OiJQcm9qZWN0IjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo0NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfUHJvamVjdC5waHAiO3M6OToibWV0YV9kYXRhIjtzOjcwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19vZmZlcmluZ19wcm9qZWN0TWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfUHJvamVjdC5waHAiO31pOjE5O2E6NDp7czo2OiJtb2R1bGUiO3M6NzoiUHJvamVjdCI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX1Byb2plY3QucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfZXh0ZXJuYWxjb250cmFjdF9wcm9qZWN0TWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfUHJvamVjdC5waHAiO31pOjIwO2E6NDp7czo2OiJtb2R1bGUiO3M6MTI6Im9xY19Db250cmFjdCI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0NvbnRyYWN0LnBocCI7czo5OiJtZXRhX2RhdGEiO3M6ODM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2V4dGVybmFsY29udHJhY3Rfb3FjX2NvbnRyYWN0TWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfQ29udHJhY3QucGhwIjt9aToyMTthOjQ6e3M6NjoibW9kdWxlIjtzOjEyOiJvcWNfQ29udHJhY3QiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Db250cmFjdC5waHAiO3M6OToibWV0YV9kYXRhIjtzOjc1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19jb250cmFjdF9vcWNfYWRkaXRpb25NZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19Db250cmFjdC5waHAiO31pOjIyO2E6NDp7czo2OiJtb2R1bGUiO3M6MTI6Im9xY19PZmZlcmluZyI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX09mZmVyaW5nLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzU6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX29mZmVyaW5nX29xY19jb250cmFjdE1ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX09mZmVyaW5nLnBocCI7fWk6MjM7YToyOntzOjY6Im1vZHVsZSI7czo4OiJvcWNfVGFzayI7czo5OiJtZXRhX2RhdGEiO3M6NjE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX2RlZmF1bHRNZXRhRGF0YS5waHAiO31pOjI0O2E6Mzp7czo2OiJtb2R1bGUiO3M6NToiVXNlcnMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19Vc2Vycy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjY0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY190YXNrX3VzZXJzTWV0YURhdGEucGhwIjt9aToyNTthOjQ6e3M6NjoibW9kdWxlIjtzOjExOiJvcWNfU2VydmljZSI7czoxNDoibW9kdWxlX3ZhcmRlZnMiO3M6NDc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX1NlcnZpY2UucGhwIjtzOjk6Im1ldGFfZGF0YSI7czo3NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9vcWNfY29udHJhY3Rfb3FjX3NlcnZpY2VNZXRhRGF0YS5waHAiO3M6MTc6Im1vZHVsZV9sYXlvdXRkZWZzIjtzOjUwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYXlvdXRkZWZzL29xY19TZXJ2aWNlLnBocCI7fWk6MjY7YTo0OntzOjY6Im1vZHVsZSI7czoxMToib3FjX1NlcnZpY2UiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjQ3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19TZXJ2aWNlLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvb3FjX29mZmVyaW5nX29xY19zZXJ2aWNlTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfU2VydmljZS5waHAiO31pOjI3O2E6NDp7czo2OiJtb2R1bGUiO3M6MTE6Im9xY19TZXJ2aWNlIjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo0NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfU2VydmljZS5waHAiO3M6OToibWV0YV9kYXRhIjtzOjc0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19hZGRpdGlvbl9vcWNfc2VydmljZU1ldGFEYXRhLnBocCI7czoxNzoibW9kdWxlX2xheW91dGRlZnMiO3M6NTA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xheW91dGRlZnMvb3FjX1NlcnZpY2UucGhwIjt9aToyODthOjQ6e3M6NjoibW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjE0OiJtb2R1bGVfdmFyZGVmcyI7czo1MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfT3Bwb3J0dW5pdGllcy5waHAiO3M6OToibWV0YV9kYXRhIjtzOjc2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL29xY19vZmZlcmluZ19vcHBvcnR1bml0aWVzTWV0YURhdGEucGhwIjtzOjE3OiJtb2R1bGVfbGF5b3V0ZGVmcyI7czo1NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGF5b3V0ZGVmcy9vcWNfT3Bwb3J0dW5pdGllcy5waHAiO319czo5OiJpbWFnZV9kaXIiO3M6MTY6IjxiYXNlcGF0aD4vaWNvbnMiO3M6MTM6ImN1c3RvbV9maWVsZHMiO2E6NDp7aTowO2E6Nzp7czo0OiJuYW1lIjtzOjE0OiJvZmZpY2VudW1iZXJfYyI7czo1OiJsYWJlbCI7czoyMToiTEJMX09RQ19PRkZJQ0VfTlVNQkVSIjtzOjQ6InR5cGUiO3M6NzoidmFyY2hhciI7czo4OiJtYXhfc2l6ZSI7czoyOiIyNSI7czo3OiJhdWRpdGVkIjtiOjA7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTA6Im1hc3N1cGRhdGUiO2I6MDt9aToxO2E6Njp7czo0OiJuYW1lIjtzOjEyOiJpc2V4dGVybmFsX2MiO3M6NToibGFiZWwiO3M6MTY6IkxCTF9PUUNfRVhURVJOQUwiO3M6NDoidHlwZSI7czo0OiJib29sIjtzOjc6ImF1ZGl0ZWQiO2I6MDtzOjY6Im1vZHVsZSI7czo4OiJBY2NvdW50cyI7czoxMDoibWFzc3VwZGF0ZSI7YjowO31pOjI7YTo2OntzOjQ6Im5hbWUiO3M6MTI6ImlzZXh0ZXJuYWxfYyI7czo1OiJsYWJlbCI7czoxNjoiTEJMX09RQ19FWFRFUk5BTCI7czo0OiJ0eXBlIjtzOjQ6ImJvb2wiO3M6NzoiYXVkaXRlZCI7YjowO3M6NjoibW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjEwOiJtYXNzdXBkYXRlIjtiOjA7fWk6MzthOjk6e3M6NDoibmFtZSI7czoxODoiZG9jdW1lbnRfcHVycG9zZV9jIjtzOjU6ImxhYmVsIjtzOjIwOiJMQkxfRE9DVU1FTlRfUFVSUE9TRSI7czo0OiJ0eXBlIjtzOjQ6ImVudW0iO3M6MTM6ImRlZmF1bHRfdmFsdWUiO3M6MToiICI7czo0OiJleHQxIjtzOjIxOiJkb2N1bWVudF9wdXJwb3NlX2xpc3QiO3M6NzoiYXVkaXRlZCI7YjowO3M6NjoibW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czoxMDoibWFzc3VwZGF0ZSI7YjowO3M6Njoic3R1ZGlvIjtzOjc6InZpc2libGUiO319czo3OiJ2YXJkZWZzIjthOjY6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo0ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfT2ZmZXJpbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoib3FjX09mZmVyaW5nIjt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19BZGRpdGlvbi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJvcWNfQWRkaXRpb24iO31pOjI7YToyOntzOjQ6ImZyb20iO3M6NTY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX0V4dGVybmFsQ29udHJhY3QucGhwIjtzOjk6InRvX21vZHVsZSI7czoyMDoib3FjX0V4dGVybmFsQ29udHJhY3QiO31pOjM7YToyOntzOjQ6ImZyb20iO3M6NTQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3ZhcmRlZnMvb3FjX1Byb2R1Y3RDYXRhbG9nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6Im9xY19Qcm9kdWN0Q2F0YWxvZyI7fWk6NDthOjI6e3M6NDoiZnJvbSI7czo1MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvdmFyZGVmcy9vcWNfT3Bwb3J0dW5pdGllcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjt9aTo1O2E6Mjp7czo0OiJmcm9tIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy92YXJkZWZzL29xY19BY2NvdW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjt9fXM6MTQ6InBvc3RfdW5pbnN0YWxsIjthOjE6e2k6MDtzOjM3OiI8YmFzZXBhdGg+L3NjcmlwdHMvcG9zdF91bmluc3RhbGwucGhwIjt9fXM6MTY6InVwZ3JhZGVfbWFuaWZlc3QiO3M6MDoiIjt9','2014-11-21 04:51:04',1),('2cb41468-b457-4eb9-1878-546ec4f84576','upload/upgrades/module/MaestranoDataSharing2014_11_21_155139.zip','053acdd01b85da3315b521e21901e986','module','installed','1416545499','MaestranoDataSharing','Data sharing with Connec!™','MaestranoDataSharing','YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MzoiTU5PIjtzOjY6ImF1dGhvciI7czo5OiJNYWVzdHJhbm8iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjI4OiJEYXRhIHNoYXJpbmcgd2l0aCBDb25uZWMh4oSiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjIwOiJNYWVzdHJhbm9EYXRhU2hhcmluZyI7czoxNDoicHVibGlzaGVkX2RhdGUiO3M6MTk6IjIwMTQtMTEtMjEgMDQ6NTE6MzkiO3M6NDoidHlwZSI7czo2OiJtb2R1bGUiO3M6NzoidmVyc2lvbiI7aToxNDE2NTQ1NDk5O3M6MTM6InJlbW92ZV90YWJsZXMiO3M6NjoicHJvbXB0Ijt9czoxMToiaW5zdGFsbGRlZnMiO2E6Nzp7czoyOiJpZCI7czoyMDoiTWFlc3RyYW5vRGF0YVNoYXJpbmciO3M6NToiYmVhbnMiO2E6MTp7aTowO2E6NDp7czo2OiJtb2R1bGUiO3M6OToiTU5PX1RheGVzIjtzOjU6ImNsYXNzIjtzOjk6Ik1OT19UYXhlcyI7czo0OiJwYXRoIjtzOjMxOiJtb2R1bGVzL01OT19UYXhlcy9NTk9fVGF4ZXMucGhwIjtzOjM6InRhYiI7YjoxO319czoxMDoibGF5b3V0ZGVmcyI7YTowOnt9czoxMzoicmVsYXRpb25zaGlwcyI7YTowOnt9czo5OiJpbWFnZV9kaXIiO3M6MTY6IjxiYXNlcGF0aD4vaWNvbnMiO3M6NDoiY29weSI7YToxOntpOjA7YToyOntzOjQ6ImZyb20iO3M6NDE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvTU5PX1RheGVzIjtzOjI6InRvIjtzOjE3OiJtb2R1bGVzL01OT19UYXhlcyI7fX1zOjg6Imxhbmd1YWdlIjthOjE6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fX19czoxNjoidXBncmFkZV9tYW5pZmVzdCI7czowOiIiO30=','2014-11-21 04:51:39',1),('e958437f-197b-feb2-3a0b-546ec8177c32','upload/upgrades/module/MaestranoDataSharing2014_11_21_155155.zip','355ea8f970ae4ca8229a9a3f39a8416d','module','installed','1416545515','project_MaestranoDataSharing','Data sharing with Connec!™','project_MaestranoDataSharing','YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjY6IjYuNS4xOCI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MzoiTU5PIjtzOjY6ImF1dGhvciI7czo5OiJNYWVzdHJhbm8iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjI4OiJEYXRhIHNoYXJpbmcgd2l0aCBDb25uZWMh4oSiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjI4OiJwcm9qZWN0X01hZXN0cmFub0RhdGFTaGFyaW5nIjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxNC0xMS0yMSAwNDo1MTo1NSI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjE0MTY1NDU1MTU7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YToyOntzOjI6ImlkIjtzOjI4OiJwcm9qZWN0X01hZXN0cmFub0RhdGFTaGFyaW5nIjtzOjQ6ImNvcHkiO2E6MTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjMxOiI8YmFzZXBhdGg+L01hZXN0cmFub0RhdGFTaGFyaW5nIjtzOjI6InRvIjtzOjUwOiJjdXN0b20vbW9kdWxlYnVpbGRlci9wYWNrYWdlcy9NYWVzdHJhbm9EYXRhU2hhcmluZyI7fX19czoxNjoidXBncmFkZV9tYW5pZmVzdCI7czowOiIiO30=','2014-11-21 05:06:26',1);
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
INSERT INTO `user_preferences` VALUES ('223276e7-87b3-db7c-8849-546ec4fe384e','ETag',0,'2014-11-21 04:51:04','2014-11-21 05:06:26','d7c4441d-b1d5-1de6-38c2-546ec4df937e','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6Mzt9'),('737788d2-4c74-0888-76d8-546ed06c181f','Users2_USER',0,'2014-11-21 05:41:22','2014-11-21 05:41:22','d7c4441d-b1d5-1de6-38c2-546ec4df937e','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('97ecca65-e68d-d070-fa75-546ec5a157cc','MNO_Taxes2_MNO_TAXES',0,'2014-11-21 04:55:45','2014-11-21 04:55:45','d7c4441d-b1d5-1de6-38c2-546ec4df937e','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('a758d395-65e0-aaa0-ca7a-546ec44cc388','global',0,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','YToxOntzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czozNjoiYTcyYWYwY2EtZTkwYy0zNzYzLTdmZjItNTQ2ZWM0YTY5Y2ZmIjt9'),('c8885c82-0e11-984f-e6b8-546ec48a96ff','Home',0,'2014-11-21 04:50:31','2014-11-21 04:50:31','d7c4441d-b1d5-1de6-38c2-546ec4df937e','YToyOntzOjg6ImRhc2hsZXRzIjthOjg6e3M6MzY6ImE2M2MzZDgzLTIzZjAtZDA4Mi1jY2FkLTU0NmVjNGM5YjIwNSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxMzoiaUZyYW1lRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NDoiSG9tZSI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NTM6Im1vZHVsZXMvSG9tZS9EYXNobGV0cy9pRnJhbWVEYXNobGV0L2lGcmFtZURhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6Mzp7czoxMDoidGl0bGVMYWJlbCI7czozMDoiTEJMX0RBU0hMRVRfRElTQ09WRVJfU1VHQVJfUFJPIjtzOjM6InVybCI7czo0MjoiaHR0cHM6Ly93d3cuc3VnYXJjcm0uY29tL2NybS9wcm9kdWN0L2dvcHJvIjtzOjY6ImhlaWdodCI7aTozMTU7fX1zOjM2OiJhNjNlYjE0NS1iY2E1LTJkNTctZmJkOC01NDZlYzQyYjk0NjkiO2E6NDp7czo5OiJjbGFzc05hbWUiO3M6MTY6IlN1Z2FyRmVlZERhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjk6IlN1Z2FyRmVlZCI7czoxMToiZm9yY2VDb2x1bW4iO2k6MTtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NjQ6Im1vZHVsZXMvU3VnYXJGZWVkL0Rhc2hsZXRzL1N1Z2FyRmVlZERhc2hsZXQvU3VnYXJGZWVkRGFzaGxldC5waHAiO31zOjM2OiJhNjNmYjgwMC03YzkxLTUyMTItYmQyZC01NDZlYzRjYWM3OWMiO2E6NTp7czo5OiJjbGFzc05hbWUiO3M6MTM6ImlGcmFtZURhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjQ6IkhvbWUiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjE7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjUzOiJtb2R1bGVzL0hvbWUvRGFzaGxldHMvaUZyYW1lRGFzaGxldC9pRnJhbWVEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjM6e3M6MTA6InRpdGxlTGFiZWwiO3M6MjI6IkxCTF9EQVNITEVUX1NVR0FSX05FV1MiO3M6MzoidXJsIjtzOjQxOiJodHRwczovL3d3dy5zdWdhcmNybS5jb20vY3JtL3Byb2R1Y3QvbmV3cyI7czo2OiJoZWlnaHQiO2k6MzE1O319czozNjoiYTk1ZWUxOWQtZmQxMS1iZTczLTc4YzktNTQ2ZWM0NTExMjY1IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUNhbGxzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiQ2FsbHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0NhbGxzL0Rhc2hsZXRzL015Q2FsbHNEYXNobGV0L015Q2FsbHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiYWEzNzBmNTYtOTllZi05YTExLTEyNWItNTQ2ZWM0MjUyMDk2IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeU1lZXRpbmdzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiTWVldGluZ3MiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL01lZXRpbmdzL0Rhc2hsZXRzL015TWVldGluZ3NEYXNobGV0L015TWVldGluZ3NEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiYWFjODU0Y2MtMWZiNy1jMWU0LWM0YWMtNTQ2ZWM0MGZlMTFhIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjIyOiJNeU9wcG9ydHVuaXRpZXNEYXNobGV0IjtzOjY6Im1vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6ODA6Im1vZHVsZXMvT3Bwb3J0dW5pdGllcy9EYXNobGV0cy9NeU9wcG9ydHVuaXRpZXNEYXNobGV0L015T3Bwb3J0dW5pdGllc0Rhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6MDp7fX1zOjM2OiJhYjhmODZjNy0xZWM5LWNmZTMtMjg3NC01NDZlYzRiNWUwOWUiO2E6NTp7czo5OiJjbGFzc05hbWUiO3M6MTc6Ik15QWNjb3VudHNEYXNobGV0IjtzOjY6Im1vZHVsZSI7czo4OiJBY2NvdW50cyI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NjU6Im1vZHVsZXMvQWNjb3VudHMvRGFzaGxldHMvTXlBY2NvdW50c0Rhc2hsZXQvTXlBY2NvdW50c0Rhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6MDp7fX1zOjM2OiJhY2ExZmEzOS0zMDBlLWYyOTctZjNlMi01NDZlYzQ2ZGU2N2IiO2E6NTp7czo5OiJjbGFzc05hbWUiO3M6MTQ6Ik15TGVhZHNEYXNobGV0IjtzOjY6Im1vZHVsZSI7czo1OiJMZWFkcyI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NTY6Im1vZHVsZXMvTGVhZHMvRGFzaGxldHMvTXlMZWFkc0Rhc2hsZXQvTXlMZWFkc0Rhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6MDp7fX19czo1OiJwYWdlcyI7YToxOntpOjA7YTozOntzOjc6ImNvbHVtbnMiO2E6Mjp7aTowO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI2MCUiO3M6ODoiZGFzaGxldHMiO2E6Njp7aTowO3M6MzY6ImE2M2MzZDgzLTIzZjAtZDA4Mi1jY2FkLTU0NmVjNGM5YjIwNSI7aToxO3M6MzY6ImE5NWVlMTlkLWZkMTEtYmU3My03OGM5LTU0NmVjNDUxMTI2NSI7aToyO3M6MzY6ImFhMzcwZjU2LTk5ZWYtOWExMS0xMjViLTU0NmVjNDI1MjA5NiI7aTozO3M6MzY6ImFhYzg1NGNjLTFmYjctYzFlNC1jNGFjLTU0NmVjNDBmZTExYSI7aTo0O3M6MzY6ImFiOGY4NmM3LTFlYzktY2ZlMy0yODc0LTU0NmVjNGI1ZTA5ZSI7aTo1O3M6MzY6ImFjYTFmYTM5LTMwMGUtZjI5Ny1mM2UyLTU0NmVjNDZkZTY3YiI7fX1pOjE7YToyOntzOjU6IndpZHRoIjtzOjM6IjQwJSI7czo4OiJkYXNobGV0cyI7YToyOntpOjA7czozNjoiYTYzZWIxNDUtYmNhNS0yZDU3LWZiZDgtNTQ2ZWM0MmI5NDY5IjtpOjE7czozNjoiYTYzZmI4MDAtN2M5MS01MjEyLWJkMmQtNTQ2ZWM0Y2FjNzljIjt9fX1zOjEwOiJudW1Db2x1bW5zIjtzOjE6IjIiO3M6MTQ6InBhZ2VUaXRsZUxhYmVsIjtzOjIwOiJMQkxfSE9NRV9QQUdFXzFfTkFNRSI7fX19'),('c9b35b95-387b-d40f-ee53-546ec49c4e68','Home2_CALL',0,'2014-11-21 04:50:31','2014-11-21 04:50:31','d7c4441d-b1d5-1de6-38c2-546ec4df937e','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('ca6f745d-b36a-12d2-f443-546ec4749aed','Home2_MEETING',0,'2014-11-21 04:50:31','2014-11-21 04:50:31','d7c4441d-b1d5-1de6-38c2-546ec4df937e','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('cb010a63-e4b9-0e63-6bcd-546ec4de8338','Home2_OPPORTUNITY',0,'2014-11-21 04:50:31','2014-11-21 04:50:31','d7c4441d-b1d5-1de6-38c2-546ec4df937e','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('cbb0a4db-0944-97c3-7bf1-546ec4ef1857','Home2_ACCOUNT',0,'2014-11-21 04:50:31','2014-11-21 04:50:31','d7c4441d-b1d5-1de6-38c2-546ec4df937e','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('cc59b76c-9984-fbf5-ab95-546ec41824a9','Home2_LEAD',0,'2014-11-21 04:50:31','2014-11-21 04:50:31','d7c4441d-b1d5-1de6-38c2-546ec4df937e','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('ccee7ad6-5f3b-f342-f047-546ec43d22ab','Home2_SUGARFEED',0,'2014-11-21 04:50:31','2014-11-21 04:50:31','d7c4441d-b1d5-1de6-38c2-546ec4df937e','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('dc30f032-fb4d-0e9d-aaa1-546ec4679941','global',0,'2014-11-21 04:50:28','2014-11-21 04:50:31','d7c4441d-b1d5-1de6-38c2-546ec4df937e','YTo1OntzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czozNjoiZGJiYjgwZmQtNTM2MS1kZWNlLTExNDAtNTQ2ZWM0MDE1NzdiIjtzOjEwOiJ1c2VyX3RoZW1lIjtzOjY6IlN1Z2FyNSI7czoxOToidGhlbWVfY3VycmVudF9ncm91cCI7czozOiJBbGwiO3M6ODoidGltZXpvbmUiO3M6MTY6IkF1c3RyYWxpYS9TeWRuZXkiO3M6MjoidXQiO2k6MTt9');
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
INSERT INTO `users` VALUES ('1','admin','$6$EQLv7zd8$HaCyX5JqHSekcaCwB3lXBs0I5krI6re4KO4kX1v65or5437Tf1g3tEyuP0OOWOwvuVW8aMAcD0gze2mNUhtV5/',0,NULL,NULL,1,NULL,'Administrator',1,0,1,NULL,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','','Administrator',NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,NULL,0),('d7c4441d-b1d5-1de6-38c2-546ec4df937e','usr-4lug','c637d08dc812937bb1f1c76fd7b390e7',0,NULL,NULL,1,'Bruno','Chauvet',1,0,1,NULL,'2014-11-21 04:50:28','2014-11-21 04:50:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,NULL,0);
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
INSERT INTO `versions` VALUES ('45f69c0a-89c3-9a48-d1b5-546ec497b66f',0,'2014-11-21 04:51:11','2014-11-21 04:51:11','1','1','Rebuild Extensions','4.0.0','4.0.0'),('b8dca103-4702-22c9-48a0-546ec41ee876',0,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','Chart Data Cache','3.5.1','3.5.1'),('bae28569-fef9-21e0-feb3-546ec49d6fe5',0,'2014-11-21 04:49:05','2014-11-21 04:49:05','1','1','htaccess','3.5.1','3.5.1'),('e08f9df9-5d64-edaf-e9f9-546ec88f0d50',0,'2014-11-21 05:06:36','2014-11-21 05:06:36','1','1','Rebuild Relationships','4.0.0','4.0.0');
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

-- Dump completed on 2014-11-21 16:42:21
