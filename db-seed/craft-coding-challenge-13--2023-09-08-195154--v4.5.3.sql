-- MariaDB dump 10.19  Distrib 10.6.14-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_msabjvotpqgybymtyfljcwrvzrtnyhucxdav` (`ownerId`),
  CONSTRAINT `fk_dgkblzmegosoxlwxryjtdbhkrbfohigwbycg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_msabjvotpqgybymtyfljcwrvzrtnyhucxdav` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xvvdvfltlnmumqdrujwfrufypghpvyecfqib` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_wdonjwcjmusuiwvoxjfeqvnrnftiabwwhpnv` (`dateRead`),
  KEY `fk_mjbhbneargqbsylhjpocmgyrwhahsqucbfih` (`pluginId`),
  CONSTRAINT `fk_mjbhbneargqbsylhjpocmgyrwhahsqucbfih` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wgystrdsayywzgkmcnfxcpzowtnxzbmtqkmu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pzstlrhsipfnhohqpmuiepofdzqiebfnuncm` (`sessionId`,`volumeId`),
  KEY `idx_lqzzfwwrxltemchtrojiagufiswghhycocoj` (`volumeId`),
  CONSTRAINT `fk_busfusgyqfapgbutswdeaoxhseomjesubbtz` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkcwcinyyeqedaerwgyzcsklkawphwzwicvx` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT 0,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `processIfRootEmpty` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jfpmfprwdynjfcunafmabpkexubpvfnmnyxy` (`filename`,`folderId`),
  KEY `idx_tvmpndkodcjapkihljtxnjyazlyrcalysmwx` (`folderId`),
  KEY `idx_mienudqugtqiatgcegjyzvfzxdmpjnexdrmz` (`volumeId`),
  KEY `fk_hcfugtsjvppjnfwaiurnyechkavucrofubtu` (`uploaderId`),
  CONSTRAINT `fk_hcfugtsjvppjnfwaiurnyechkavucrofubtu` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mvxjsllultcijerclhfbisuyaundnkhuilkh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_odvvmufxpihhnilsjhhmgxtxyzobzjewkkqs` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pzxrsrqaciuhoselhftuwfnacvgvodqfuema` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_umkydtzwqczqfzkhykuxxdybdsjgvtwytrbz` (`groupId`),
  KEY `fk_xzyemizxpqidqfmpbgcurdmzovcatfetfdib` (`parentId`),
  CONSTRAINT `fk_dvocndwjriwdpuvynroefopaprhuumpxvcce` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qfeynhqczqrlzyyaupujzwgiervohcqtpmtv` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xzyemizxpqidqfmpbgcurdmzovcatfetfdib` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bflpiuvhghruvcreinfpllgxkxrvbqgygcft` (`name`),
  KEY `idx_hwuoqmxtvkdbtxbbxoxksdtktbvtgobdebkd` (`handle`),
  KEY `idx_nxchuvfdzdsttmbzsqjofdzerhdiswingrkz` (`structureId`),
  KEY `idx_rdswxtefqkshrajrkijnrmmvdvdsumsbvpth` (`fieldLayoutId`),
  KEY `idx_wsouzqewrpejdecuulacewimvjumwdlvwype` (`dateDeleted`),
  CONSTRAINT `fk_dljxktjrqlxtasizqkgeftonbzhysiezdaly` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_fggpwcpbqluxdafddjhcvuokriaghmbbrlom` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tinjymvugtldpeuewopukgxffauzydjyblck` (`groupId`,`siteId`),
  KEY `idx_dmmpzkhwbkheqtumvvapnzksgtmgikbdovnn` (`siteId`),
  CONSTRAINT `fk_ayrpclmevzovlbvsphacezpmkytwiqviqbnx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fqtxalxicwkumjcxhrqmcgsubipzxqjzhcyu` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_iuqqziobcmsnzimuaveaoxcnzjjhktqdvloc` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_zboeazmaubtyfisfnodtttbdlmtnnxrqggna` (`siteId`),
  KEY `fk_djtbtnstxblwgqynusjgvjxkudsiqviiospk` (`userId`),
  CONSTRAINT `fk_djtbtnstxblwgqynusjgvjxkudsiqviiospk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_qjgnmqqxtwqxpiyeavhtxpdtqcmebtqmhkph` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zboeazmaubtyfisfnodtttbdlmtnnxrqggna` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_dhspaagrufjcydckwfjpupecdgxzgswmfhfj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_szmtdyzyzinmftywoguuovnrttiebtkredej` (`siteId`),
  KEY `fk_stuuzhstyyxgufqmcngnjsmzsyhlvromjxce` (`fieldId`),
  KEY `fk_nzvwouufkpbrzqhtlszzywtapoekcudlyoej` (`userId`),
  CONSTRAINT `fk_nzvwouufkpbrzqhtlszzywtapoekcudlyoej` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ovpgrlcyyuimieptsacalrorxuyqkkpcbpds` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stuuzhstyyxgufqmcngnjsmzsyhlvromjxce` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_szmtdyzyzinmftywoguuovnrttiebtkredej` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jqzcffcvmftihrofdryftwugozjhktgjmowf` (`elementId`,`siteId`),
  KEY `idx_bgwnufnpfnfbmgdoqopioxdnmcrqpzcvkwit` (`siteId`),
  KEY `idx_rgrowoyqhhhtdbdzruigjzffxuavqtqeicid` (`title`),
  CONSTRAINT `fk_bqomwnmcsbqexhsrvlxcibreijzftpuhlrwp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xsvqkvgigqgvjhiyogqkkwjkwxlflzzdyigl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ektfcaaepmlvdscierryrdgxgddoporfluft` (`userId`),
  CONSTRAINT `fk_ektfcaaepmlvdscierryrdgxgddoporfluft` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(5) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ddtccbzofpndlamlrocvhoyicjxclrhjjjek` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_curwyhpvadatseawdryxhqsouklhgpvtqnfi` (`creatorId`,`provisional`),
  KEY `idx_jhjrorhssqwigiibsgvnsiymxkimnrxbkumo` (`saved`),
  KEY `fk_yoelqncjxhgfnsrreqjbmokgqugoonamzdnf` (`canonicalId`),
  CONSTRAINT `fk_sjxysysjhyppvvzfngazzyeqfcttdshgqiqq` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yoelqncjxhgfnsrreqjbmokgqugoonamzdnf` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_kfyyceycxaslqbhqsdenwvxbkeywckrkdxnf` (`elementId`,`timestamp`,`userId`),
  KEY `fk_aziamoijjtlriqyxexjsjshlvrvxnkehiywh` (`userId`),
  KEY `fk_dhhozscgxmxzwgympysqusnrmnnqprcpqaog` (`siteId`),
  KEY `fk_nyblcbykihizndcxxrtcqxomfgynkbaojdun` (`draftId`),
  CONSTRAINT `fk_aziamoijjtlriqyxexjsjshlvrvxnkehiywh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dhhozscgxmxzwgympysqusnrmnnqprcpqaog` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_grghwnjzlfgwoqfvwmfmiybhuoeapvlndmqj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nyblcbykihizndcxxrtcqxomfgynkbaojdun` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gtsmheywkesqhdkgspsqleecvbxoumglircg` (`dateDeleted`),
  KEY `idx_qqgybcxnkbajppipzkfxbbilqzkpzmtrpcpg` (`fieldLayoutId`),
  KEY `idx_wjvxofnyicpedlomeeqmpzuiporthduxtxdi` (`type`),
  KEY `idx_ienjfaqmhnpboqvjugxatypbrdpxajteugzg` (`enabled`),
  KEY `idx_votqatyhpfdkjgiyvocmwsmjoyaohehsnthz` (`archived`,`dateCreated`),
  KEY `idx_wanficubtvzuuwqjzrbmlgrjqhxvvjdicmzh` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_eaeeimfsfcmdzcpsurjpmnscmrurjlqjosus` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_hkvlwkjxtlrrayypwrumgozetdfvzzynnhpq` (`canonicalId`),
  KEY `fk_bsfildfwwphnwammekzzdnxpyfoyzkdzsgrr` (`draftId`),
  KEY `fk_gbdzoypkeufspxygkegkwzocvqlncyungygg` (`revisionId`),
  CONSTRAINT `fk_bsfildfwwphnwammekzzdnxpyfoyzkdzsgrr` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gbdzoypkeufspxygkegkwzocvqlncyungygg` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hkvlwkjxtlrrayypwrumgozetdfvzzynnhpq` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tqmyrnrvxyvveunghayaxxnnadifrtysefpa` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hpdxtxcgefsyyatmwjnyuklkvaaxpwoekzpu` (`elementId`,`siteId`),
  KEY `idx_laiqjnniceelttilnnmjchqmynrtvcbuoaru` (`siteId`),
  KEY `idx_ofoxjbdnrsznxhyfdqpszhkxfqzhaarilody` (`slug`,`siteId`),
  KEY `idx_hnpltzcivigosragveapcznpacjdnedgdael` (`enabled`),
  KEY `idx_nynrfguuklmzqfbwqwwsghcqxcnztyybgeyy` (`uri`,`siteId`),
  CONSTRAINT `fk_kgzyxygnsnnvtdontfcthscuzxkjjxnebjpd` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qbtgabvbfiktiiswakthdhzsiiqgfxifcnsz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xbickxurytkhgbvsmyyvtxucfuueirdzqwev` (`postDate`),
  KEY `idx_urgqcomvjoruhyqecdmvczaizptdofxvkjra` (`expiryDate`),
  KEY `idx_loaufgdtfreoiblimqomupdyomfyhbecvfiq` (`authorId`),
  KEY `idx_eswztppsffqczyvvmzmxwwlzhqazdhuorkkb` (`sectionId`),
  KEY `idx_dmnsedghyviooycajhveibfuhjvwcxzlhhan` (`typeId`),
  KEY `fk_kbqvdhfkhqqunwmrsyvdomeqhxiekgepigis` (`parentId`),
  CONSTRAINT `fk_kbqvdhfkhqqunwmrsyvdomeqhxiekgepigis` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_oqbgakgfpwimmujvqytlrbyolrdgjqqnzprb` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pbhovcuuxyporbardqfedhsqjtccipcyfecx` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ttaloxtlzsdjqefkakhtdckcjydfvyojpdkf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrviuyajjrrumhwtlmrupgyxggqgmihusnlj` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text DEFAULT NULL,
  `showStatusField` tinyint(1) DEFAULT 1,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oudlojczyyxeofdquysqhmrqtbcguianwbgp` (`name`,`sectionId`),
  KEY `idx_ofttkwjsjyuqzjltvdelrmqsccvluddguqno` (`handle`,`sectionId`),
  KEY `idx_eojzyjlmxeqywwzqbgiezqsxztzezvtdtazy` (`sectionId`),
  KEY `idx_rfnpufswriackxsbmehadyvwkbwpqztynkbt` (`fieldLayoutId`),
  KEY `idx_mktvketumtcfmvsufzibrsbamqcokdjnshwd` (`dateDeleted`),
  CONSTRAINT `fk_kbkxbyifnvxxtozcdugycwntwtsfaveqlhpm` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xkpcldfuthhwfjeeqwtrezmfugsluibqdkaw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_imwqoeblxzxjxivvckhfwkwcnsxjdotrikkc` (`name`),
  KEY `idx_vdcawaezccybhftaiexnzcmuiuzehobqssga` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oujiwocvtwlxvnnadigozpuzqfrttylfdvew` (`layoutId`,`fieldId`),
  KEY `idx_usjbmsttnddzmcavmvzbuvlklbonlvwdzzlv` (`sortOrder`),
  KEY `idx_nidridlbfdcgpxvbdxrvwvdlsdknccpvzsmk` (`tabId`),
  KEY `idx_nutysbxdxxbeglaqcicnfkbcyqebxbmmsicw` (`fieldId`),
  CONSTRAINT `fk_kwtwxstkeeplxystqsbbeumynqzsssoiuvwn` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tqnxdvvhqykxjybbkvlxtiukwtdgvrvdpvgp` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ydzjxxjrpkirghprbozltqtpyqpwrlkrjugj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_diixgfqdmrosirhncdxttjktqinuxabytsoa` (`dateDeleted`),
  KEY `idx_nbnbcrppsgzsqjkfcygumjtlsksygcxxgstk` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cgkrrpqvmuoewjgqikegegristhxdbrhnewm` (`sortOrder`),
  KEY `idx_pbnymoydnfsldjrpdqjvrhnonrycbfvqmxki` (`layoutId`),
  CONSTRAINT `fk_xfzilykajymmmdpezfvsdsbibikjsbpgjccv` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fjdwjydzxmgplyksgdfxccirnvqgqaxgkasz` (`handle`,`context`),
  KEY `idx_pxfrqqmdebjfjvarhcqhitilfnntpedtyphw` (`groupId`),
  KEY `idx_qdsbjuwemznsysnbpaqsloajrcwlrxoouyya` (`context`),
  CONSTRAINT `fk_ukoeadgflxsllkzthlrwrrtlmvhyanydwfts` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lcegtfuoeqylravucwcqolvzztzpwhzwkrhv` (`name`),
  KEY `idx_phaeisfusfvhzurupuhpcqfoywmrwxwfzdvm` (`handle`),
  KEY `idx_yxplscnjrapyeasnamuqvnajceococalfyui` (`fieldLayoutId`),
  KEY `idx_wjhhkehfapvepuusdkhjryttjoxsotaklmjr` (`sortOrder`),
  CONSTRAINT `fk_bpfauhmvzvafveapnlylgnogzacgbxyrtzgf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tjrgoubhfyuxzuhwqjbzmcphcaspluikfumi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qrxtttpguhgnmowubepwsccsiqognurhfuhr` (`accessToken`),
  UNIQUE KEY `idx_zftdlfvqbkhwmqlyrlxnhkifoutvbzlmksvt` (`name`),
  KEY `fk_pgdydkmejezpzfmkqplzymxsifvbqwhwvehm` (`schemaId`),
  CONSTRAINT `fk_pgdydkmejezpzfmkqplzymxsifvbqwhwvehm` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uozubtaczjmgounkzceydubgqxxjnhaoyqnq` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT 1,
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cvdoxggyqrozydzeilnvgsuiatwvezozieyp` (`name`),
  KEY `idx_bzlvvtwfxynqnfexgxxiinznucmauvhvjmxr` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lcgheyvlqbhhwdhxbozsfvnemndrohoahtja` (`primaryOwnerId`),
  KEY `idx_nbpjmalrzrbjuzjtonoecwqndcwhepsqrnsd` (`fieldId`),
  KEY `idx_knftlksklxxyswwjyglzjvfiebpmvmmehvbg` (`typeId`),
  CONSTRAINT `fk_fdvtfplkxpusezvohijyjeqxnxwntfukdxww` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mowckeoaqvlsdtxtkiitenhmnlgupxrsbofh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uayurabdnscdjvhbgfkypzgxsjheoixzgrxj` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wrvhzxvrgjxzwdezcmyshpjkwmxufrenmoqe` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_onshdkkpjryjzfcghhycgploqtmrupqpfvav` (`ownerId`),
  CONSTRAINT `fk_bewwjjxrtsezdkyleeahtnldlbbnerytnmpq` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_onshdkkpjryjzfcghhycgploqtmrupqpfvav` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ypqcbdqoueybauqqgivxasjizlaajshrheml` (`name`,`fieldId`),
  KEY `idx_ncfyenrlxvwemlaheyusretnvazovhneptrt` (`handle`,`fieldId`),
  KEY `idx_dstofwgtxnehqhjieskqvdcnmangfnanmidk` (`fieldId`),
  KEY `idx_qfvowxlwvjfnkuwazckwgpyzyypwzrdpfzei` (`fieldLayoutId`),
  CONSTRAINT `fk_bomyvchgsezdenucronkkluqjrivoyrxepwu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zbgnefgehceamrzgssdckvsqkoyejhkjpqxp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bwoitonatyluxwuitjyzgmluoqgbxasjjiup` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vuvauqxvdcciosbzvehxvnrpqngasulvjdkd` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(10) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vcfkfdoxramrhqstyzfvlihfaupnsjkluxtm` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_uadakxmkzghrhcwiqlwvkcvejhvynyrgfvng` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_drobnvyajkynrbmkcooulabxcgghisdfxqow` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_crfnrsbokqcfjhfuifkwqmzkbblcaqiitirk` (`sourceId`),
  KEY `idx_casvyjipwiklphiwkocfuoyutkrmnebfayqj` (`targetId`),
  KEY `idx_buvzdxtoecztgmopusmrxqwgawbsjtiswflw` (`sourceSiteId`),
  CONSTRAINT `fk_byupggysxlkdqilhuciaazbiwgddmgjwftnp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ggdrstfcnfvbtglryujhhkfihkqvlytdnldq` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ipycaijurbitmtrpacupumcnahxwqplzlwbd` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rpsotpuindomtnqizjqaowgjvdwultqaodrl` (`canonicalId`,`num`),
  KEY `fk_xcgsnamhhxxfcdfihibvnmsfwlxmxwxizsia` (`creatorId`),
  CONSTRAINT `fk_ncsbvlhkikkkrypibqljgwamlwyzasjercbk` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xcgsnamhhxxfcdfihibvnmsfwlxmxwxizsia` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_qtifyfqpijgdbmwkkqerfpydggonvzyjdwuz` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vhzcobpdvxyrqrbrxwxclvsokayjnywincer` (`handle`),
  KEY `idx_ounocdtuxabltgkaqcitdandwyeoctzqpznt` (`name`),
  KEY `idx_mdcyhvxpudpcovusxxpbncqkfxjcerlfawod` (`structureId`),
  KEY `idx_avfauefjfcnxaayllprbomskbcfdnvmfnlkr` (`dateDeleted`),
  CONSTRAINT `fk_iixudohwzsevkmsesdtcfatdqllnnyomhlrc` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ugkanpqmretdbjbrjszptmbzpsqcujiyezzc` (`sectionId`,`siteId`),
  KEY `idx_ewbibexjibphcsjzgltkfzejpjirastnqksf` (`siteId`),
  CONSTRAINT `fk_swpuvuduilgpgrofyncxvllvqlyhplsjdrdw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ysymocxxldspfetuukxbjsgnnletszmhiqah` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eoyjeqebjijvhysehazhglswvysnifxckzul` (`uid`),
  KEY `idx_foztuwjzdwrtrbsbygfiybjgjgauytnjkacq` (`token`),
  KEY `idx_yazneqmwxikhavqobhucihwgnflrdncmudzi` (`dateUpdated`),
  KEY `idx_oeujcbvyujkxarpuqhrldhvybvgkdiubxgys` (`userId`),
  CONSTRAINT `fk_tuhyhbgxqqomovzsxwiabcuitncpnjaxbcnf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gxmssnflplycfojhardquudwaaetzrteitnn` (`userId`,`message`),
  CONSTRAINT `fk_ocksebcmxnuruqdjxydsahnntfuuhfiewegm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ohkqjkhxdxmrbhpwxxwyrlvniducxqkdnldd` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zqcmgnlmbzvpnavqpwneqdjynhvexbyvbexj` (`dateDeleted`),
  KEY `idx_glaqmdscmayinzbkqwskyqdtqiwqoncnggxf` (`handle`),
  KEY `idx_qevogplhncnlkfadbelqjwrzuqhujdibrdwv` (`sortOrder`),
  KEY `fk_tovfslllqdwlapmlncjxigccikdudlzwqbuy` (`groupId`),
  CONSTRAINT `fk_tovfslllqdwlapmlncjxigccikdudlzwqbuy` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(10) unsigned DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rgt` int(10) unsigned NOT NULL,
  `level` smallint(5) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_acfxgvxjezglpilxdzkdheapyprjfkjpymzl` (`structureId`,`elementId`),
  KEY `idx_lqjmynzqkpfrdegwxvztqxdktqcsnrijogle` (`root`),
  KEY `idx_gtudhyaetwugfayjydzmowtdoklwkhmofxmv` (`lft`),
  KEY `idx_irdskieztirzdrspwebajbzftsbhokqhaerg` (`rgt`),
  KEY `idx_fcvhhbptaksrarpxhzblxugwciksaffnstph` (`level`),
  KEY `idx_qpcpkqlyjkeppalkzkvkresvylvfhusbrbgo` (`elementId`),
  CONSTRAINT `fk_pazvrrxkmmjfahwynrgetqhdpgddznysvbcw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zjyeakmqzcpfeivjaglxozperqulhqvumzry` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ucevqojawzwborkwvjwgsfcybbykorkzfzcx` (`key`,`language`),
  KEY `idx_yqurubbtmynqbgvfyhsltiilbxraaxtdhrfg` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pbzdufsswnridwsvcvvvwpqhrtarjqqrqeom` (`name`),
  KEY `idx_cigkbgpemwaiqmejjqqozrzoslqwijwmffxf` (`handle`),
  KEY `idx_lyrdtdfnogxxfpyvqmeghabtrpyjshzrhbyb` (`dateDeleted`),
  KEY `fk_zzzfmeaiovlpglzisnmnjdeqopmfjzbczadf` (`fieldLayoutId`),
  CONSTRAINT `fk_zzzfmeaiovlpglzisnmnjdeqopmfjzbczadf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qmxiwsskrpdhpehpwzavuqcouswjiqyveuiz` (`groupId`),
  CONSTRAINT `fk_bsncminnekinqvfhsuwyyuvoyasewbujixca` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rnuixgjlpkrtdhlcsztvfsuvzwxwjebribcy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ksjayqxjenllhvsrcijcqekllpaainfelnwr` (`token`),
  KEY `idx_xydvfzqpqjmjctcjljgvrzudtnkgjccuvrks` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oultxuqmrshfzkzeuvvfvzdtveebjsowvryt` (`handle`),
  KEY `idx_mnnejlifgwmksnurjzbmgaxasgwmtvukywty` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_txjpzwbdjjzejwutikmelanmcadawlswpvqm` (`groupId`,`userId`),
  KEY `idx_vriahrctfketywjhulmjvbmqxmmnigdcmcoy` (`userId`),
  CONSTRAINT `fk_bjauwyoxqbxevscsolngtfdimvpqxxmcuqoz` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_epjzskxcguxtmqwdnmclbuseazcotshkhzbj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ahzokmcpdjljbtvgnmnevbgybztsdjbblirv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ixxxcatmboxsnkkjcmwicmpoaxhrtltfrqix` (`permissionId`,`groupId`),
  KEY `idx_xruyntxcskjslgrtzklebpzncwaxhpksfsra` (`groupId`),
  CONSTRAINT `fk_goxzzzrupxuxzidhbpmtxnehrryqosmldvme` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mucwcdryxhvbjbmqpieghmtjpkpfcxuqmcmn` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kxetwhtoyvzesvjaqgfdyjpcnocntrdcolbs` (`permissionId`,`userId`),
  KEY `idx_kvloffvvabhsevkikqlzsjsrhrdzqhfsfyzu` (`userId`),
  CONSTRAINT `fk_qszjwuhobqeoofodprzptiawnwmyegdfekbg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wtfacjjfkksjallznpcnwmugbemqwrqemszv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_dgqmxwihecruwjvulfajoaeyyeuzrqydzknb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_whhtlqdnasojfotsjgsfwhofwcrirrgebanq` (`active`),
  KEY `idx_vgjuuupdgvtxrchpvsfvutkwjchbyunkrpcm` (`locked`),
  KEY `idx_wslzawuwnkyiyoeusjzvhsjdqjshgkljgxfm` (`pending`),
  KEY `idx_qkimepwgickvaodroivqsftwbrylagnurcvp` (`suspended`),
  KEY `idx_ecyodzggbcbsxdjibjnxrckhiranlyhgcpft` (`verificationCode`),
  KEY `idx_duwcweslgdatyfwttebcrlzmvwtjihhknulv` (`email`),
  KEY `idx_wpcuagwrelorgdodrnbtzrhuxpsydxpxutbf` (`username`),
  KEY `fk_oekxohrklnsghmpspsxpvswjkzomcyhcgaer` (`photoId`),
  CONSTRAINT `fk_mjvmslgeiurroqcfnfqfktgoyszidvphnmta` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oekxohrklnsghmpspsxpvswjkzomcyhcgaer` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bgzmvocibypmwkbudogieakwqmyydxvykkuk` (`name`,`parentId`,`volumeId`),
  KEY `idx_junmbourfkiquxjjwgsrjndrqwjbztinxzge` (`parentId`),
  KEY `idx_xxxbgiaowddczjqxaxqrrucolfqwzshbqpnw` (`volumeId`),
  CONSTRAINT `fk_knuxmiriggkdroxikcalkngkhrbyfuyfrcmi` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nocbtbjnheegqsrefgqgvwnujwjuyoiwzomp` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tlfgayhaklkmadwyfhdmwppzrsplwkcoxlps` (`name`),
  KEY `idx_djldeizejicpbskculrwdfdylbevirlytlhg` (`handle`),
  KEY `idx_emvorgbvupdlscomjgtydgktupvuxgirruah` (`fieldLayoutId`),
  KEY `idx_asyqynflyuuxvsgaskmtnljcevfmwayiummn` (`dateDeleted`),
  CONSTRAINT `fk_mufrazjnhecngzahobbcjttwchrfejajdaxd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `colspan` tinyint(4) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qmprcbxpsoeusvovcspkwubvkrrbcjaohwbq` (`userId`),
  CONSTRAINT `fk_yetzzdnkpczkkuuskiervpkwvhkqovoembzi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-08 19:51:54
-- MariaDB dump 10.19  Distrib 10.6.14-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (2,1,'postDate','2023-09-08 19:29:31',0,1),(2,1,'slug','2023-09-08 19:29:28',0,1),(2,1,'title','2023-09-08 19:29:28',0,1),(3,1,'postDate','2023-09-08 19:29:37',0,1),(3,1,'slug','2023-09-08 19:29:35',0,1),(3,1,'title','2023-09-08 19:29:35',0,1),(4,1,'postDate','2023-09-08 19:29:41',0,1),(4,1,'slug','2023-09-08 19:29:40',0,1),(4,1,'title','2023-09-08 19:29:40',0,1),(5,1,'postDate','2023-09-08 19:37:26',0,1),(5,1,'slug','2023-09-08 19:37:26',0,1),(5,1,'title','2023-09-08 19:37:26',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-02-02 05:28:23','2023-02-02 05:28:23','e5f6e318-4d9f-4ce0-9c87-be98e1bd6559'),(2,2,1,'Cut','2023-09-08 19:29:24','2023-09-08 19:29:31','1744ddea-16d3-45fc-a5a6-e5c6e763f591'),(3,3,1,'Colour','2023-09-08 19:29:31','2023-09-08 19:29:37','1d342553-0735-4703-8fc5-f63f0a0fc175'),(4,4,1,'Size','2023-09-08 19:29:37','2023-09-08 19:29:41','fcf963dd-2571-490e-9c3d-68d875ccd496'),(5,5,1,'Style','2023-09-08 19:37:24','2023-09-08 19:37:28','446ab74a-426e-44e5-b53a-2d3feaa60529');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'save','2023-09-08 19:29:31'),(2,1,1,NULL,'view','2023-09-08 19:29:24'),(3,1,1,NULL,'save','2023-09-08 19:29:37'),(3,1,1,NULL,'view','2023-09-08 19:29:31'),(4,1,1,NULL,'save','2023-09-08 19:29:41'),(4,1,1,NULL,'view','2023-09-08 19:29:37'),(5,1,1,NULL,'save','2023-09-08 19:37:28'),(5,1,1,NULL,'view','2023-09-08 19:37:26');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-02-02 05:28:23','2023-02-02 05:28:23',NULL,NULL,'cdb3b2a1-cb8b-4271-bc6c-01ff3c34bcfd'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-09-08 19:29:24','2023-09-08 19:29:31',NULL,NULL,'007b30b9-08e7-4cc2-ab0f-198fa4a9825a'),(3,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-09-08 19:29:31','2023-09-08 19:29:37',NULL,NULL,'8f2f4d6d-7d96-4de4-8af7-b2ac2f72923d'),(4,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-09-08 19:29:37','2023-09-08 19:29:41',NULL,NULL,'355cd093-c50e-4247-9a0f-5a479e0d7eaa'),(5,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-09-08 19:37:24','2023-09-08 19:37:28',NULL,NULL,'de15f59b-e796-4c27-9de4-f7789a43e742');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-02-02 05:28:23','2023-02-02 05:28:23','9276ec33-c4e9-4f94-9590-a6c8f9ed630a'),(2,2,1,'cut',NULL,1,'2023-09-08 19:29:24','2023-09-08 19:29:32','b9fe28cb-b33f-4fe1-b644-2d5d22cb1209'),(3,3,1,'colour',NULL,1,'2023-09-08 19:29:31','2023-09-08 19:29:35','fadc47eb-1282-469a-8d22-6b794c48c885'),(4,4,1,'size',NULL,1,'2023-09-08 19:29:37','2023-09-08 19:29:43','5818e757-d869-40e6-a012-f21152423e26'),(5,5,1,'style',NULL,1,'2023-09-08 19:37:24','2023-09-08 19:37:26','23c72aff-9351-4239-970f-9d5a011bb174');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,1,'2023-09-08 19:29:00',NULL,NULL,'2023-09-08 19:29:24','2023-09-08 19:29:31'),(3,1,NULL,1,1,'2023-09-08 19:29:00',NULL,NULL,'2023-09-08 19:29:31','2023-09-08 19:29:37'),(4,1,NULL,1,1,'2023-09-08 19:29:00',NULL,NULL,'2023-09-08 19:29:37','2023-09-08 19:29:41'),(5,1,NULL,1,1,'2023-09-08 19:37:00',NULL,NULL,'2023-09-08 19:37:24','2023-09-08 19:37:26');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Default','default',1,'site',NULL,NULL,'site',NULL,0,1,'2023-09-08 19:29:10','2023-09-08 19:29:20',NULL,'143efd73-7109-4eab-9305-2712c5fa041e');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-02-02 05:28:23','2023-02-02 05:28:23',NULL,'31006d4c-2f40-498c-9a4c-69cff4fd4279');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2023-09-08 19:29:10','2023-09-08 19:29:10',NULL,'a03f39ad-e76c-4cca-95d4-c62ed8e4d983');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (2,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"23b03ede-eba2-4bed-9fca-28556c9f383f\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-09-08 19:29:20','2023-09-08 19:29:20','501b4557-c55c-4782-bdb8-3a9e67b809aa');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.5.3','4.5.3.0',0,'iadqvjbpblcu','3@tylawohvfc','2023-02-02 05:28:23','2023-09-08 19:39:11','876de66d-7fde-40c5-b8b8-c4713c00d927');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','32ccba4d-556b-4fcd-9e7c-73a2e60aed4d'),(2,'craft','m210121_145800_asset_indexing_changes','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','110963d6-acbc-4052-ba24-5343051e4663'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','09e2ddd5-cb53-449a-bb38-f233c1571174'),(4,'craft','m210724_180756_rename_source_cols','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','ecb98123-06eb-4d65-9dae-588f920f5d1b'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','4de6ac73-1c13-4a53-8eaf-565ed1117d92'),(6,'craft','m210817_014201_universal_users','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','130028a6-a406-4471-96fb-6758b9525b0e'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','4b37ada2-81f1-4985-b0e5-e674b34e2968'),(8,'craft','m211115_135500_image_transformers','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','34b2fc16-745c-42d5-b4fb-e7ffbc312d7b'),(9,'craft','m211201_131000_filesystems','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','aca6e315-e112-496c-ba73-6e19bb36b7f3'),(10,'craft','m220103_043103_tab_conditions','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','8aa8b2fe-a585-4c84-8e23-1b3045b48e7a'),(11,'craft','m220104_003433_asset_alt_text','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','51804ab1-3c62-442e-a212-6fb539d779d5'),(12,'craft','m220123_213619_update_permissions','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','72bd9363-4be6-4094-bc55-b0aaf45b391b'),(13,'craft','m220126_003432_addresses','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','beb0b304-1443-4ca0-92e2-e2a93c99298f'),(14,'craft','m220209_095604_add_indexes','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','014c11d1-9f1b-4af9-b67b-6252d934ac91'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','25e7db17-b5f4-470a-adf0-dae78569929b'),(16,'craft','m220214_000000_truncate_sessions','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','1451ff20-81bc-4270-890e-76ab3ede9c1c'),(17,'craft','m220222_122159_full_names','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','582ce54c-5d9d-42e4-a7ed-f01688cdc688'),(18,'craft','m220223_180559_nullable_address_owner','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','b95f7ab9-3df4-4bd2-bb9c-63a725405fa2'),(19,'craft','m220225_165000_transform_filesystems','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','04098051-2cc1-4706-96fc-6bd2af52dce4'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','ef9220f2-be58-466a-b464-dfa3a1c56e5d'),(21,'craft','m220314_211928_field_layout_element_uids','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','e1788361-9335-4b86-b917-08bbcab2cadb'),(22,'craft','m220316_123800_transform_fs_subpath','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','ac64d940-5a66-4f42-963d-0b31a660e0bd'),(23,'craft','m220317_174250_release_all_jobs','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','aa45919d-0094-40b9-9b56-12243f138a81'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','15f9020e-4c57-4f00-a078-78245121f93f'),(25,'craft','m220413_024536_site_enabled_string','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','f7899074-4588-4744-be09-408addd05e81'),(26,'craft','m221027_160703_add_image_transform_fill','2023-09-08 08:10:31','2023-09-08 08:10:31','2023-09-08 08:10:31','b12b107a-0ac1-4389-8d7a-e3844decd0a8'),(27,'craft','m221028_130548_add_canonical_id_index','2023-09-08 08:10:31','2023-09-08 08:10:31','2023-09-08 08:10:31','523261a5-fc4d-4afc-9af5-657f414dac56'),(28,'craft','m221118_003031_drop_element_fks','2023-09-08 08:10:31','2023-09-08 08:10:31','2023-09-08 08:10:31','76411fd6-fdac-4049-9535-375455463968'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2023-09-08 08:10:31','2023-09-08 08:10:31','2023-09-08 08:10:31','cd710007-ce98-45a1-a40a-dbbae9e73941'),(30,'craft','m230226_013114_drop_plugin_license_columns','2023-09-08 08:10:31','2023-09-08 08:10:31','2023-09-08 08:10:31','8d42a375-0d9a-4199-9b99-583d55d7a899'),(31,'craft','m230531_123004_add_entry_type_show_status_field','2023-09-08 08:10:31','2023-09-08 08:10:31','2023-09-08 08:10:31','99744bea-75a7-4f69-a508-f9be551e7a68'),(32,'craft','m230607_102049_add_entrytype_slug_translation_columns','2023-09-08 08:10:31','2023-09-08 08:10:31','2023-09-08 08:10:31','f3687c02-70c8-46e6-9559-a17e1292a7b2'),(33,'craft','m230710_162700_element_activity','2023-09-08 08:10:31','2023-09-08 08:10:31','2023-09-08 08:10:31','741446e8-e344-404d-b12a-a6b79c81e2f5'),(34,'craft','m230820_162023_fix_cache_id_type','2023-09-08 08:10:31','2023-09-08 08:10:31','2023-09-08 08:10:31','cc6a7812-f985-46de-9be9-195e3e24c8ab'),(35,'craft','m230826_094050_fix_session_id_type','2023-09-08 08:10:31','2023-09-08 08:10:31','2023-09-08 08:10:31','9ef1d105-81c8-45de-8b90-7f1847348c20');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1694201951'),('elementSources.craft\\elements\\Entry.0.heading','\"Structures\"'),('elementSources.craft\\elements\\Entry.0.type','\"heading\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.0','\"structure\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.1.disabled','false'),('elementSources.craft\\elements\\Entry.1.key','\"section:d9adb5c7-3b8b-4183-aa7e-92744d5a0676\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.0','\"slug\"'),('elementSources.craft\\elements\\Entry.1.type','\"native\"'),('elementSources.craft\\elements\\Entry.2.heading','\"All\"'),('elementSources.craft\\elements\\Entry.2.type','\"heading\"'),('elementSources.craft\\elements\\Entry.3.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.3.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.3.disabled','false'),('elementSources.craft\\elements\\Entry.3.key','\"*\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.0','\"section\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.1','\"slug\"'),('elementSources.craft\\elements\\Entry.3.type','\"native\"'),('email.fromEmail','\"info@putyourlightson.net\"'),('email.fromName','\"Craft Coding Challenge\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elementCondition','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.autocapitalize','true'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.autocomplete','false'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.autocorrect','true'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.class','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.disabled','false'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.elementCondition','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.id','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.instructions','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.label','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.max','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.min','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.name','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.orientation','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.placeholder','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.readonly','false'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.requirable','false'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.size','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.step','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.tip','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.title','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.uid','\"23b03ede-eba2-4bed-9fca-28556c9f383f\"'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.userCondition','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.warning','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.elements.0.width','100'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.name','\"Content\"'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.uid','\"501b4557-c55c-4782-bdb8-3a9e67b809aa\"'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.fieldLayouts.a03f39ad-e76c-4cca-95d4-c62ed8e4d983.tabs.0.userCondition','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.handle','\"default\"'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.hasTitleField','true'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.name','\"Default\"'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.section','\"d9adb5c7-3b8b-4183-aa7e-92744d5a0676\"'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.showStatusField','false'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.slugTranslationKeyFormat','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.slugTranslationMethod','\"site\"'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.sortOrder','1'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.titleFormat','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.titleTranslationKeyFormat','null'),('entryTypes.143efd73-7109-4eab-9305-2712c5fa041e.titleTranslationMethod','\"site\"'),('fieldGroups.31006d4c-2f40-498c-9a4c-69cff4fd4279.name','\"Common\"'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('meta.__names__.0779f354-f5d2-4f82-9a36-28a252f70ce4','\"Public Schema\"'),('meta.__names__.0d89c679-f6f5-42ae-8341-4bea917c6af7','\"$CRAFT_SITE_NAME\"'),('meta.__names__.143efd73-7109-4eab-9305-2712c5fa041e','\"Default\"'),('meta.__names__.31006d4c-2f40-498c-9a4c-69cff4fd4279','\"Common\"'),('meta.__names__.c7c2807b-84cc-4e1f-9279-af044bc0b472','\"Public Schema\"'),('meta.__names__.d9adb5c7-3b8b-4183-aa7e-92744d5a0676','\"Filters\"'),('meta.__names__.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6','\"$CRAFT_SITE_NAME\"'),('sections.d9adb5c7-3b8b-4183-aa7e-92744d5a0676.defaultPlacement','\"end\"'),('sections.d9adb5c7-3b8b-4183-aa7e-92744d5a0676.enableVersioning','false'),('sections.d9adb5c7-3b8b-4183-aa7e-92744d5a0676.handle','\"filters\"'),('sections.d9adb5c7-3b8b-4183-aa7e-92744d5a0676.name','\"Filters\"'),('sections.d9adb5c7-3b8b-4183-aa7e-92744d5a0676.propagationMethod','\"all\"'),('sections.d9adb5c7-3b8b-4183-aa7e-92744d5a0676.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.enabledByDefault','true'),('sections.d9adb5c7-3b8b-4183-aa7e-92744d5a0676.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.hasUrls','false'),('sections.d9adb5c7-3b8b-4183-aa7e-92744d5a0676.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.template','null'),('sections.d9adb5c7-3b8b-4183-aa7e-92744d5a0676.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.uriFormat','null'),('sections.d9adb5c7-3b8b-4183-aa7e-92744d5a0676.structure.maxLevels','1'),('sections.d9adb5c7-3b8b-4183-aa7e-92744d5a0676.structure.uid','\"e0d30e4f-de92-42a0-bff4-f7219ec055cc\"'),('sections.d9adb5c7-3b8b-4183-aa7e-92744d5a0676.type','\"structure\"'),('siteGroups.0d89c679-f6f5-42ae-8341-4bea917c6af7.name','\"$CRAFT_SITE_NAME\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.enabled','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.handle','\"default\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.hasUrls','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.language','\"en-US\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.name','\"$CRAFT_SITE_NAME\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.primary','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.siteGroup','\"0d89c679-f6f5-42ae-8341-4bea917c6af7\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"$CRAFT_SITE_NAME\"'),('system.retryDuration','null'),('system.schemaVersion','\"4.5.3.0\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' info putyourlightson net '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' cut '),(2,'title',0,1,' cut '),(3,'slug',0,1,' colour '),(3,'title',0,1,' colour '),(4,'slug',0,1,' size '),(4,'title',0,1,' size '),(5,'slug',0,1,' style '),(5,'title',0,1,' style ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,1,'Filters','filters','structure',0,'all','end',NULL,'2023-09-08 19:29:10','2023-09-08 19:29:10',NULL,'d9adb5c7-3b8b-4183-aa7e-92744d5a0676');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,0,NULL,NULL,1,'2023-09-08 19:29:10','2023-09-08 19:29:10','26df15fb-a43b-4bd0-9769-dd0aba1152da');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'$CRAFT_SITE_NAME','2023-02-02 05:28:23','2023-02-02 20:38:11',NULL,'0d89c679-f6f5-42ae-8341-4bea917c6af7');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','$CRAFT_SITE_NAME','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-02-02 05:28:23','2023-02-02 20:37:47',NULL,'f255ef6d-0c55-4bdc-9ced-f610bbb3bed6');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,10,0,'2023-09-08 19:29:24','2023-09-08 19:37:24','3df1d34a-e000-4693-b206-3d7080053e16'),(2,1,2,1,2,3,1,'2023-09-08 19:29:24','2023-09-08 19:29:24','6aab49f6-c64f-477e-8816-e288a05a22d5'),(3,1,3,1,4,5,1,'2023-09-08 19:29:31','2023-09-08 19:29:31','3d11c235-fc53-4853-a414-d699f10bff2e'),(4,1,4,1,6,7,1,'2023-09-08 19:29:37','2023-09-08 19:29:37','80745fab-6c15-417c-919d-3b02f7855eff'),(5,1,5,1,8,9,1,'2023-09-08 19:37:24','2023-09-08 19:37:24','c78e97a9-5670-4994-8beb-3cbba4e576fe');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,1,'2023-09-08 19:29:10','2023-09-08 19:29:10',NULL,'e0d30e4f-de92-42a0-bff4-f7219ec055cc');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'info@nystudio107.com','$2y$13$crqJ.kzM.kBs.WsWGUxT9uUdR4Imi./d9prVKVya/MkWu/Bd/8.Ga','2023-09-08 08:12:03',NULL,NULL,NULL,'2023-02-02 05:28:58',NULL,1,NULL,NULL,NULL,0,'2023-02-02 05:28:24','2023-02-02 05:28:24','2023-09-08 08:12:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','c53fbd79-71b8-4d8f-8c28-79fa730418d5'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','0882d0b5-810a-4e9e-adcc-3c52d35c6cee'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','b306bd06-fcad-4702-9075-fae37ad18291'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','70fc0edf-2bdd-4a72-ae90-5e6bb14e89d8');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-08 19:51:54
