-- TC has added support fot Daily/Weekly quests so we are using their system now.
-- http://code.google.com/p/trinitycore/source/detail?r=9293a741d49dd63f5bab401488cdc092352b42b5
--
-- Table structure for table `character_queststatus_daily`
--

DROP TABLE IF EXISTS `character_queststatus_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_queststatus_daily` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  `time` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_queststatus_daily`
--

LOCK TABLES `character_queststatus_daily` WRITE;
/*!40000 ALTER TABLE `character_queststatus_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_queststatus_weekly`
--

DROP TABLE IF EXISTS `character_queststatus_weekly`;
CREATE TABLE `character_queststatus_weekly` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_queststatus_weekly`
--

LOCK TABLES `character_queststatus_weekly` WRITE;
/*!40000 ALTER TABLE `character_queststatus_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_weekly` ENABLE KEYS */;
UNLOCK TABLES;

DELETE FROM `worldstates` WHERE `entry` IN (90101,90102);
INSERT INTO `worldstates` (`entry`,`value`, `comment`) VALUES 
(20002, 0, 'NextWeeklyQuestResetTime');