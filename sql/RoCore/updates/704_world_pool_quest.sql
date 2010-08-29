-- ALTER TABLE db_version CHANGE COLUMN required_529_world_quest_free_your_mind required_704_world_pool_quest bit;

-- THIS TABLE REALLY NEEDS DB-SUPPORT! :-)
DROP TABLE IF EXISTS `pool_quest`;
CREATE TABLE `pool_quest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature entry',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest entry',
  `daily` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Bool whether it is a daily (if not it\'s a weekly)',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Bool whether it should be used or not',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Bool whether it is active (set by core!)',
  `comment` varchar(255) DEFAULT NULL COMMENT 'Which quest is it? Why disabled?',
  PRIMARY KEY (`entry`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Daily / Weekly Quest Pool System';

-- Only some data to start the table not empty. ;)
INSERT INTO `pool_quest`(`entry`,`quest`,`daily`,`enabled`,`comment`) VALUES
-- Weekly raid quests of Archmage Lan'dalock
(20735,24579,0,1,'Dalaran - Weekly raid quest of Archmage Lan\'dalock'),
(20735,24580,0,1,'Dalaran - Weekly raid quest of Archmage Lan\'dalock'),
(20735,24581,0,1,'Dalaran - Weekly raid quest of Archmage Lan\'dalock'),
(20735,24582,0,1,'Dalaran - Weekly raid quest of Archmage Lan\'dalock'),
(20735,24583,0,1,'Dalaran - Weekly raid quest of Archmage Lan\'dalock'),
(20735,24584,0,1,'Dalaran - Weekly raid quest of Archmage Lan\'dalock'),
(20735,24585,0,1,'Dalaran - Weekly raid quest of Archmage Lan\'dalock'),
(20735,24586,0,1,'Dalaran - Weekly raid quest of Archmage Lan\'dalock'),
(20735,24587,0,1,'Dalaran - Weekly raid quest of Archmage Lan\'dalock'),
(20735,24588,0,1,'Dalaran - Weekly raid quest of Archmage Lan\'dalock'),
(20735,24589,0,1,'Dalaran - Weekly raid quest of Archmage Lan\'dalock'),
(20735,24590,0,1,'Dalaran - Weekly raid quest of Archmage Lan\'dalock'),
-- Daily fishing quests of Marcia Chase
(28742,13830,1,1,'Dalaran - Daily fishing quest of Marcia Chase'),
(28742,13832,1,1,'Dalaran - Daily fishing quest of Marcia Chase'),
(28742,13833,1,1,'Dalaran - Daily fishing quest of Marcia Chase'),
(28742,13834,1,1,'Dalaran - Daily fishing quest of Marcia Chase'),
(28742,13836,1,1,'Dalaran - Daily fishing quest of Marcia Chase'),
-- Daily cooking quests of Katherine Lee
(28705,13100,1,1,'Dalaran - Daily cooking quest of Katherine Lee'),
(28705,13101,1,1,'Dalaran - Daily cooking quest of Katherine Lee'),
(28705,13102,1,1,'Dalaran - Daily cooking quest of Katherine Lee'),
(28705,13103,1,1,'Dalaran - Daily cooking quest of Katherine Lee'),
(28705,13107,1,1,'Dalaran - Daily cooking quest of Katherine Lee'),
-- Daily cooking quests of Awilo Lon'gomba
(29631,13112,1,1,'Dalaran - Daily cooking quest of Awilo Lon\'gomba'),
(29631,13113,1,1,'Dalaran - Daily cooking quest of Awilo Lon\'gomba'),
(29631,13114,1,1,'Dalaran - Daily cooking quest of Awilo Lon\'gomba'),
(29631,13115,1,1,'Dalaran - Daily cooking quest of Awilo Lon\'gomba'),
(29631,13116,1,1,'Dalaran - Daily cooking quest of Awilo Lon\'gomba'),
-- Daily jewelcrafting quests of Timothy Jones
(28701,12958,1,1,'Dalaran - Daily jewelcrafting quest of Timothy Jones'),
(28701,12959,1,1,'Dalaran - Daily jewelcrafting quest of Timothy Jones'),
(28701,12960,1,1,'Dalaran - Daily jewelcrafting quest of Timothy Jones'),
(28701,12961,1,1,'Dalaran - Daily jewelcrafting quest of Timothy Jones'),
(28701,12962,1,1,'Dalaran - Daily jewelcrafting quest of Timothy Jones'),
(28701,12963,1,1,'Dalaran - Daily jewelcrafting quest of Timothy Jones');