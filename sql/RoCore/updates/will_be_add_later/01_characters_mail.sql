-- I follow the proccess step by step of rocore but i did not see the version of this change , please assing a number to this file.

--
-- `mail_external`
--
DROP TABLE IF EXISTS `mail_external`;
CREATE TABLE `mail_external` (
  `id` bigint(20) NOT NULL auto_increment,
  `sender` bigint(20) default NULL,
  `receiver` bigint(20) default NULL,
  `subject` varchar(200) collate latin1_general_ci default NULL,
  `message` varchar(500) collate latin1_general_ci default NULL,
  `money` bigint(20) default NULL,
  `item` bigint(20) default NULL,
  `item_count` bigint(20) default NULL,
  `stationery` int(10) default '41',
  `sent` tinyint(4) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- `mail_external_items`
--

DROP TABLE IF EXISTS `mail_external_items`;
CREATE TABLE `mail_external_items` (
  `mail_id` bigint(20) default NULL,
  `item` bigint(20) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;