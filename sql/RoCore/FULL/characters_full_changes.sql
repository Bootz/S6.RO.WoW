--
-- Table structure for table `character_db_version`
--

DROP TABLE IF EXISTS `character_db_version`;
CREATE TABLE `character_db_version` (
  `required_31_characters_db_version` bit(1) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Last applied sql update to DB';

--
-- Dumping data for table `character_db_version`
--

LOCK TABLES `character_db_version` WRITE;
/*!40000 ALTER TABLE `character_db_version` DISABLE KEYS */;
INSERT INTO `character_db_version` VALUES
(NULL);
/*!40000 ALTER TABLE `character_db_version` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `armory_character_stats`;
CREATE TABLE `armory_character_stats` (
  `guid` int(11) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='World of Warcraft Armory table';

DROP TABLE IF EXISTS `character_feed_log`;
CREATE TABLE `character_feed_log` (
  `guid` int(11) NOT NULL,
  `type` smallint(1) NOT NULL,
  `data` int(11) NOT NULL,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `counter` int(11) NOT NULL,
  PRIMARY KEY  (`guid`,`type`,`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE character_db_version CHANGE COLUMN required_31_characters_db_version required_165_characters_armory_patch bit;

DROP TABLE IF EXISTS `armory_character_stats`;
CREATE TABLE `armory_character_stats` (
  `guid` int(11) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='World of Warcraft Armory table';

DROP TABLE IF EXISTS `character_feed_log`;
CREATE TABLE `character_feed_log` (
  `guid` int(11) NOT NULL,
  `type` smallint(1) NOT NULL,
  `data` int(11) NOT NULL,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `counter` int(11) NOT NULL,
  PRIMARY KEY  (`guid`,`type`,`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `armory_game_chart`;
CREATE TABLE `armory_game_chart` (
  `gameid` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `changeType` int(11) NOT NULL,
  `ratingChange` int(11) NOT NULL,
  `teamRating` int(11) NOT NULL,
  `damageDone` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `healingDone` int(11) NOT NULL,
  `damageTaken` int(11) NOT NULL,
  `healingTaken` int(11) NOT NULL,
  `killingBlows` int(11) NOT NULL,
  `mapId` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  PRIMARY KEY  (`gameid`,`teamid`,`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='WoWArmory Game Chart';

ALTER TABLE character_db_version CHANGE COLUMN required_165_characters_armory_patch required_704_characters_character_queststatus_timed bit;

DROP TABLE IF EXISTS `character_queststatus_daily`;
DROP TABLE IF EXISTS `character_queststatus_weekly`;
DROP TABLE IF EXISTS `character_queststatus_timed`;
CREATE TABLE `character_queststatus_timed` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest entry',
  `daily` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Bool whether it is daily (if not it\'s a weekly)',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest complete time',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Timed Quest System';

DELETE FROM `worldstates` WHERE `entry`=20002;
INSERT INTO `worldstates` (`entry`,`comment`) VALUES
(90101, 'LastDailyQuestReset'),
(90102, 'LastWeeklyQuestReset');

UPDATE `worldstates` SET `value`='0',`comment`='NextDailyQuestReset' WHERE `entry`='90101';
UPDATE `worldstates` SET `value`='0',`comment`='NextWeeklyQuestReset' WHERE `entry`='90102';

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
