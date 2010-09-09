-- Very nice and usefull scripts to keep a log of all item win bt player more tha 200 Quality. It works.
-- this can be delete later
-- http://www.freehostpicture.com/images/00318280824116959353.jpg
-- http://www.freehostpicture.com/images/26777357755136732432.jpg
DROP TABLE IF EXISTS `character_itemlog`;
CREATE TABLE `character_itemlog` (
  `id` int(9) NOT NULL auto_increment,
  `date` timestamp NOT NULL,
  `guid` int(9) NOT NULL default '0',
  `name` varchar(12) NOT NULL,
  `item` int(6) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
