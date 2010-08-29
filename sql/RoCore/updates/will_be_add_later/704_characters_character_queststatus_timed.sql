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