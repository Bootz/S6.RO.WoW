/*
This file is optional, you do not need to execute this file in your db.
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `autobroadcast`
-- ----------------------------
DROP TABLE IF EXISTS `autobroadcast`;
CREATE TABLE `autobroadcast` (
  `id` int(11) NOT NULL auto_increment,
  `text` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of autobroadcast
-- ----------------------------
INSERT INTO `autobroadcast` VALUES ('1', 'Dungeon Finder functioneaza dar este WIP (Work in Progress), deci s-ar putea sa intalniti mici bugs.');
INSERT INTO `autobroadcast` VALUES ('2', 'Folositi un limbaj civilizat pe forum/server altfel veti primit mute/ban.');
INSERT INTO `autobroadcast` VALUES ('3', 'Cand creati tickete aveti in minte urmatoarele:\r\n\r\n1. Creati ticketul scurt si la obiect.\r\n2. Ticketele de genul \"GM, am o problema.\", \"GM, vino la mine!\" pot fi ignorate, scrieti in ticket problema pe care o aveti!\r\n3. Asteptati-va randul la tickete, orice ticket va primi raspuns in ordinea in care a fost creat.');
INSERT INTO `autobroadcast` VALUES ('4', 'De astazi inainte Win Trade este banabil 10 zile, se da delete la toate itemele luate cu ratingul respectiv, delete arena points si honor points. \r\nCei care nu stiu ce inseamna Win Trade, cautati pe google \"wow win trade\".\r\nHave fun Win Trading!');
INSERT INTO `autobroadcast` VALUES ('5', 'In cazul in care ati intalnit un bug citi pe forum care este modalitatea de a-l raporta. Tineti minte, orice bug raportat corect poate insemna un gameplay mai bun. Multumim!');
INSERT INTO `autobroadcast` VALUES ('6', 'Ratele serverului, mai importante, sunt urmatoarele:\r\nRate.Skill.Discovery = 10\r\nRate.Drop.Money = 10\r\nRate.XP.Kill    = 10\r\nRate.XP.Quest   = 12\r\nRate.XP.Explore = 10\r\nRate.XP.PastLevel70 = 10\r\nRate.Honor = 2\r\nRate.Reputation.Gain = 10\r\nRate.Reputation.LowLevel.Kill    = 10\r\nRate.Reputation.LowLevel.Quest   = 10\r\nSkillGain = 10\r\nArena.ArenaStartRating = 1200\r\nArena.ArenaStartPersonalRating = 1200');
INSERT INTO `autobroadcast` VALUES ('7', 'In cazul in care va place serverul acesta nu uitati sa raspanditi vestea si prietenilor vostri. In acest mod vom crea cea mai mare comunitate WoW din Romania!');
INSERT INTO `autobroadcast` VALUES ('8', 'Oricine merita o a 2-a sansa, echipa noastra de GM este aici pentru voi si nu impotriva voastra, dar cei ce persista in greseli intentionate vor primi ban.');
INSERT INTO `autobroadcast` VALUES ('10', 'WoW-Romania are cont pe Twitter si pe YM! Messenger, contul este: wow_romania2008.');
INSERT INTO `autobroadcast` VALUES ('9', 'In cazul in care serverul pica acest lucru se poate datora mai multor motive:\r\n1. Scripts ce necesita remedieri.\r\n2. Bugs ale bazei de date.\r\n3. Pana de curent (da, se poate intampla)!\r\n4. Probleme cu conexiunea de internet.\r\nVom incerca sa remediam aceste neplaceri in cel mai scurt timp, tot ce va cerem este sa fiti intelegatori, in fond suntem un server privat.');
