-- Spell DBC
REPLACE INTO `spelldifficulty_dbc` VALUES ('6000', '66331', '67478', '67477', '67479'); -- Gormok Impale
REPLACE INTO `spelldifficulty_dbc` VALUES ('6001', '66330', '67647', '67648', '67649'); -- Gormok Staggering Stomp
REPLACE INTO `spelldifficulty_dbc` VALUES ('6002', '66689', '67650', '67651', '67652'); -- Icehowl Artic Breath
REPLACE INTO `spelldifficulty_dbc` VALUES ('6003', '66683', '67660', '67660', '67662'); -- Icehowl Massic Crash
REPLACE INTO `spelldifficulty_dbc` VALUES ('6004', '67345', '67663', '67663', '67665'); -- Icehowl Whirl
REPLACE INTO `spelldifficulty_dbc` VALUES ('6005', '66770', '67655', '67654', '67656'); -- Icehowl Ferocious Butt
REPLACE INTO `spelldifficulty_dbc` VALUES ('6006', '66879', '67624', '67625', '67626'); -- Dreadscale Burning Bite
REPLACE INTO `spelldifficulty_dbc` VALUES ('6007', '66820', '67636', '67635', '67637'); -- Dreadscale Molten Spew
REPLACE INTO `spelldifficulty_dbc` VALUES ('6020', '66237', '67049', '67050', '67051'); -- Jaraxxus Incinerate Flesh
REPLACE INTO `spelldifficulty_dbc` VALUES ('6021', '66528', '67029', '67030', '67031'); -- Jaraxxus Fel Lighting
REPLACE INTO `spelldifficulty_dbc` VALUES ('6022', '68124', '68126', '68127', '68128'); -- Jaraxxus Legion Flame
REPLACE INTO `spelldifficulty_dbc` VALUES ('6023', '66532', '66963', '66964', '66965'); -- Jaraxxus Fel Fireball
REPLACE INTO `spelldifficulty_dbc` VALUES ('6024', '66258', '66258', '67903', '67903'); -- Jaraxxus Summon Volcan
REPLACE INTO `spelldifficulty_dbc` VALUES ('6025', '67103', '67103', '67104', '67105'); -- Portal Summon Guardian

UPDATE `creature_template` SET `scale`='2' WHERE `entry`=34825;

-- correct little error to start core not really importants
DELETE FROM `creature_template` WHERE `entry`=41000;
REPLACE INTO `creature_template` VALUES ('41000','0','0','0','0','0','169','11686','169','0','Wilfred Portal Trigger','','','0','81','81','0','14','14','0','1','1','0','1','2','0','0','1','2000','2000','1','1','0','0','0','0','0','0','1','2','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','1','1','0','0','0','0','0','0','0','0','1','0','0','2','0','','11159');

-- Gormok
UPDATE `creature_template` SET `scale`='1.5', `faction_A`='16', `faction_H`='16' WHERE (`entry`='34854');
UPDATE `creature_template` SET unit_flags= 33554434, faction_A =14, faction_H=14 WHERE `entry` IN (34628, 34630);
REPLACE INTO `npc_spellclick_spells` VALUES (34567, 65684, 0, 0, 0, 1, 0, 0, 0), (34568, 65686, 0, 0, 0, 1, 0, 0, 0); -- dark/light "portals"




-- information in base off TC forums Core related DB content http://forum.trinitycore.org/topic/27404-9521-trial-of-the-crusader/

-- Trial of the Crusader 
-- achievement_reward
DELETE FROM achievement_reward WHERE `entry` IN (4078,4080,4156,4079);
REPLACE INTO achievement_reward
(`entry`,`title_A`,`title_H`,`item`,`sender`,`subject`,`text`)
VALUES
(4078,170,170,0,0, '', ''),
(4080,171,171,0,0, '', ''),
(4156,0,0,49096,36095, 'A Tribute to Immortality', 'Dear $N,$B$BTales of your recent performance in the Trial of the Grand Crusader will be told,and retold,for ages to come. As the Argent Crusade issued its call for the greatest champions of Azeroth to test their mettle in the crucible of the Coliseum,I hoped against hope that beacons of light such as you and your companions might emerge from the fray.$B$BWe will need you direly in the coming battle against the Lich King. But on this day,rejoice and celebrate your glorious accomplishment and accept this gift of one of our very finest warhorses. When the Scourge see its banner looming on the horizon,hero,their end shall be nigh!$B$BYours with Honor,$BTirion Fordring'),
(4079,0,0,49098,36095, 'A Tribute to Immortality', 'Dear $N,$B$BTales of your recent performance in the Trial of the Grand Crusader will be told,and retold,for ages to come. As the Argent Crusade issued its call for the greatest champions of Azeroth to test their mettle in the crucible of the Coliseum,I hoped against hope that beacons of light such as you and your companions might emerge from the fray.$B$BWe will need you direly in the coming battle against the Lich King. But on this day,rejoice and celebrate your glorious accomplishment and accept this gift of one of our very finest warhorses. When the Scourge see its banner looming on the horizon,hero,their end shall be nigh!$B$BYours with Honor,$BTirion Fordring');

-- achievement_criteria_data
DELETE FROM achievement_criteria_data WHERE `criteria_id` IN (11542,11546,11547,11549,11678,11679,11680,11681,11682,11683,11684,11685,11686,11687,11688,11689,11690,11691,11692,11693,11778,11779,11780,11799,11800,11801,11802,11803,11804,11818,11838,11839,11860,11861,11862,12116,12198,12258,12278,12279,12280,12281,12338,12339,12340,12341,12342,12343,12344,12345,12346,12347,12348,12349,12350,12358,12359,12360);
REPLACE INTO achievement_criteria_data
(`criteria_id`,`type`,`value1`,`value2`)
VALUES
(11779,12,0,0),-- Upper Back Pain (10 player); Icehowl - mode check
(11779,18,0,0),-- Upper Back Pain (10 player); Icehowl - script requirement
(11802,12,2,0),-- Upper Back Pain (10 player); Icehowl - mode check
(11802,18,0,0),-- Upper Back Pain (10 player); Icehowl - script requirement
(11803,12,0,0),-- Resilience Will Fix It (10 player); Faction Champions - mode check
(11804,12,2,0),-- Resilience Will Fix It (10 player); Faction Champions - mode check
(11778,12,0,0),-- Salt and Pepper (10 player); Val'kyr Twins - mode check
(12258,12,2,0),-- Salt and Pepper (10 player); Val'kyr Twins - mode check
(12116,12,0,0),-- The Traitor King (10 player); Swarm Scarabs Slain - mode check
(12344,12,2,0),-- A Tribute to Skill (10 player); Complete the Trial of the Grand Crusader - mode check
(12344,18,0,0),-- A Tribute to Skill (10 player); Complete the Trial of the Grand Crusader - script requirement
(12347,12,2,0),-- A Tribute to Mad Skill (10 player); Complete the Trial of the Grand Crusader - mode check
(12347,18,0,0),-- A Tribute to Mad Skill (10 player); Complete the Trial of the Grand Crusader - script requirement
(12349,12,2,0),-- A Tribute to Insanity (10 player); Complete the Trial of the Grand Crusader - mode check
(12349,18,0,0),-- A Tribute to Insanity (10 player); Complete the Trial of the Grand Crusader - script requirement
(11542,12,3,0),-- Call of the Grand Crusade (25 player); Defeat the Beasts of Northrend - mode check
(11546,12,3,0),-- Call of the Grand Crusade (25 player); Defeat Lord Jaraxxus - mode check
(11547,12,3,0),-- Call of the Grand Crusade (25 player); Defeat the Twin Val'kyr - mode check
(11549,12,3,0),-- Call of the Grand Crusade (25 player); Complete the Trial of the Grand Crusader - mode check
(11678,12,3,0),-- Call of the Grand Crusade (25 player); Defeat the Faction Champions - mode check
(11780,12,1,0),-- Upper Back Pain (25 player); Icehowl - mode check
(11780,18,0,0),-- Upper Back Pain (25 player); Icehowl - script requirement
(11801,12,3,0),-- Upper Back Pain (25 player); Icehowl - mode check
(11801,18,0,0),-- Upper Back Pain (25 player); Icehowl - script requirement
(11799,12,1,0),-- Resilience Will Fix It (25 player); Faction Champions - mode check
(11800,12,3,0),-- Resilience Will Fix It (25 player); Faction Champions - mode check
(11818,12,1,0),-- Salt and Pepper (25 player); Val'kyr Twins - mode check
(11860,12,3,0),-- Salt and Pepper (25 player); Val'kyr Twins - mode check
(12198,12,1,0),-- The Traitor King (25 player); Swarm Scarabs Slain - mode check
(12338,12,3,0),-- A Tribute to Skill (25 player); Complete the Trial of the Grand Crusader - mode check
(12338,18,0,0),-- A Tribute to Skill (25 player); Complete the Trial of the Grand Crusader - script requirement
(12341,12,3,0),-- A Tribute to Mad Skill (25 player); Complete the Trial of the Grand Crusader - mode check
(12341,18,0,0),-- A Tribute to Mad Skill (25 player); Complete the Trial of the Grand Crusader - script requirement
(12343,12,3,0),-- A Tribute to Insanity (25 player); Complete the Trial of the Grand Crusader - mode check
(12343,18,0,0),-- A Tribute to Insanity (25 player); Complete the Trial of the Grand Crusader - script requirement
(11679,12,2,0),-- Call of the Crusade (25 player); Defeat the Beasts of Northrend - mode check
(11680,12,2,0),-- Call of the Crusade (25 player); Defeat Lord Jaraxxus - mode check
(11681,12,2,0),-- Call of the Crusade (25 player); Defeat the Faction Champions - mode check
(11682,12,2,0),-- Call of the Crusade (25 player); Defeat the Twin Val'kyr - mode check
(11683,12,2,0),-- Call of the Crusade (25 player); Complete the Trial of the Crusader - mode check
(11684,12,0,0),-- Call of the Crusade (10 player); Defeat the Beasts of Northrend - mode check
(11685,12,0,0),-- Call of the Crusade (10 player); Defeat Lord Jaraxxus - mode check
(11686,12,0,0),-- Call of the Crusade (10 player); Defeat the Faction Champions - mode check
(11687,12,0,0),-- Call of the Crusade (10 player); Defeat the Twin Val'kyr - mode check
(11688,12,0,0),-- Call of the Crusade (10 player); Complete the Trial of the Crusader - mode check
(11689,12,2,0),-- Call of the Grand Crusade (10 player); Defeat the Beasts of Northrend - mode check
(11690,12,2,0),-- Call of the Grand Crusade (10 player); Defeat Lord Jaraxxus - mode check
(11691,12,2,0),-- Call of the Grand Crusade (10 player); Defeat the Faction Champions - mode check
(11692,12,2,0),-- Call of the Grand Crusade (10 player); Defeat the Twin Val'kyr - mode check
(11693,12,2,0),-- Call of the Grand Crusade (10 player); Complete the Trial of the Grand Crusader - mode check
(12280,12,0,0),-- Not One,But Two Jormungars (10 player); Kill Acidmaw & Dreadscale within 10sec - mode check
(12281,12,2,0),-- Not One,But Two Jormungars (10 player); Kill Acidmaw & Dreadscale within 10sec - mode check
(12278,12,1,0),-- Not One,But Two Jormungars (25 player); Kill Acidmaw & Dreadscale within 10sec - mode check
(12279,12,3,0),-- Not One,But Two Jormungars (25 player); Kill Acidmaw & Dreadscale within 10sec - mode check
(11838,12,0,0),-- Three Sixty Pain Spike (10 player); Lord Jaraxxus - mode check
(11838,18,0,0),-- Three Sixty Pain Spike (10 player); Lord Jaraxxus - script requirement
(11861,12,2,0),-- Three Sixty Pain Spike (10 player); Lord Jaraxxus - mode check
(11861,18,0,0),-- Three Sixty Pain Spike (10 player); Lord Jaraxxus - script requirement
(11839,12,1,0),-- Three Sixty Pain Spike (25 player); Lord Jaraxxus - mode check
(11839,18,0,0),-- Three Sixty Pain Spike (25 player); Lord Jaraxxus - script requirement
(11862,12,3,0),-- Three Sixty Pain Spike (25 player); Lord Jaraxxus - mode check
(11862,18,0,0),-- Three Sixty Pain Spike (25 player); Lord Jaraxxus - script requirement
(12350,12,3,0),-- Realm First! Grand Crusader; Complete the Trial of the Grand Crusader - mode check
(12350,18,0,0),-- Realm First! Grand Crusader; Complete the Trial of the Grand Crusader - script requirement
(12358,12,3,0),-- A Tribute to Immortality; Complete the Trial of the Grand Crusader - mode check
(12358,14,67,0),-- A Tribute to Immortality; Complete the Trial of the Grand Crusader - faction check
(12358,18,0,0),-- A Tribute to Immortality; Complete the Trial of the Grand Crusader - script requirement
(12360,12,2,0),-- A Tribute to Dedicated Insanity; Complete the Trial of the Grand Crusader - mode check
(12360,18,0,0),-- A Tribute to Dedicated Insanity; Complete the Trial of the Grand Crusader - script requirement
(12359,12,3,0),-- A Tribute to Immortality; Complete the Trial of the Grand Crusader - mode check
(12359,14,469,0),-- A Tribute to Immortality; Complete the Trial of the Grand Crusader - faction check
(12359,18,0,0); -- A Tribute to Immortality; Complete the Trial of the Grand Crusader - script requirement

-- disables
DELETE FROM `disables` WHERE `entry` IN (12345,12346,12348,12340,12342,12339) AND `sourceType`=4;
REPLACE INTO `disables` (`sourceType`,`entry`,`flags`,`comment`) VALUES
(4,12345,0, 'A Tribute to Skill (10 player)'),
(4,12346,0, 'A Tribute to Skill (10 player)'),
(4,12348,0, 'A Tribute to Mad Skill (10 player)'),
(4,12339,0, 'A Tribute to Skill (25 player)'),
(4,12340,0, 'A Tribute to Skill (25 player)'),
(4,12342,0, 'A Tribute to Mad Skill (25 player)');

-- conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (67888,66332,67755,67756,67757,66129,66170,66181);
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,67888,18,1,35458, 'Target for Jaraxxus Lightning killing Fizzlebang'),
(13,66332,18,1,34862, 'Target for Anub\'arak summon Nerubian Burrowers'),
(13,67755,18,1,34862, 'Target for Anub\'arak summon Nerubian Burrowers'),
(13,67756,18,1,34862, 'Target for Anub\'arak summon Nerubian Burrowers'),
(13,67757,18,1,34862, 'Target for Anub\'arak summon Nerubian Burrowers'),
(13,66129,18,1,34607, 'Target for Nerubian Burrower\'s Spider Frenzy'),
(13,66170,18,1,34660, 'Target for Anub\'arak to teleport to Spike'),
(13,66181,18,1,34606, 'Target for Anub\'arak Impale Fail');

-- Miscellaneous
-- Gossip options for Toc Announcer
UPDATE `creature_template` SET `npcflag`=1 WHERE `entry` in (34816,3481601,3481602,3481603);
-- Mob_slime_pool
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80 WHERE `entry`=35176;
-- Model and level for Legion Flame Effect
UPDATE `creature_template` SET `minlevel`=82,`maxlevel`=82,`modelid1`=11686,`modelid2`=11686,`modelid3`=11686,`modelid4`=11686 WHERE `entry`=34784;
-- Faction Champions
UPDATE `creature_template` SET `modelid1`=11686,`modelid2`=11686,`modelid3`=11686,`modelid4`=11686 WHERE `entry`=34781;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16  WHERE `creature_template`.`entry` IN ( 34458,34451,34459,34448,34449,34445,34456,34447,34441,34454,34455,34444,34450,34453,3445801,3445101,3445901,3444801,3444901,3444501,3445601,3444701,3444101,3445401,3445501,3444401,3445001,3445301,3445802,3445102,3445902,3444802,3444902,3444502,3445602,3444702,3444102,3445402,3445502,3444402,3445002,3445302,3445803,3445103,3445903,3444803,3444903,3444503,3445603,3444703,3444103,3445403,3445503,3444403,3445003,3445303);
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16  WHERE `creature_template`.`entry` IN ( 34461,34460,34469,34467,34468,34465,34471,34466,34473,34472,34463,34470,34474,34475,3446101,3446001,3446901,3446701,3446801,3446501,3447101,3446601,3447301,3447201,3446301,3447001,3447401,3447501,3446102,3446002,3446902,3446702,3446802,3446502,3447102,3446602,3447302,3447202,3446302,3447002,3447402,3447502,3446103,3446003,3446903,3446703,3446803,3446503,3447103,3446603,3447303,3447203,3446303,3447003,3447403,3447503);
UPDATE `creature_template` SET `mindmg`=388,`maxdmg`=583,`attackpower`=146,`dmg_multiplier`=12 WHERE `entry`=34454;
UPDATE `creature_template` SET `mindmg`=468,`maxdmg`=702,`attackpower`=175,`dmg_multiplier`=10 WHERE `entry`=34472;
-- Valkiries Portal
UPDATE `creature_template` SET `npcflag`=1,`unit_flags`=258 WHERE `entry` IN (34567,34568);
-- Valkiries Balls
UPDATE `creature_template` SET `faction_A`=14,`minlevel`=82,`maxlevel`=82,`faction_H`=14 WHERE entry IN (34628,34630);

-- PROBABLY ERRONEOUS (but that will make it work)
-- Lich King unrooted (he needs to move,so why is he rooted?)
UPDATE `creature_template` SET `dynamicflags`=0 WHERE `entry`=35877;
-- Frost Sphere & Nerubian Burrower && Anubarak Spike Faction (so Permafrost can hit players and creatures)
-- In ytdb does not exist hero 3 and 4 mode
DELETE FROM creature_template WHERE `entry` IN (34606,34649,3460602,3460603);
REPLACE INTO `creature_template` VALUES 
('34606','34649','3460602','3460603','0','0','1126','25144','0','0','Frost Sphere','','','0','79','80','2','1925','1925','0','1','1.14286','1','0','422','586','0','642','1','0','0','1','32768','8','0','0','0','0','0','345','509','103','8','64','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.238095','1','1','0','0','0','0','0','0','0','721','1','0','0','0','mob_frost_sphere','12340'),
('34649','0','0','0','0','0','1126','25144','0','0','Frost Sphere (1)','','','0','79','80','2','1925','1925','0','1','1.14286','1','0','422','586','0','642','1','0','0','1','32768','8','0','0','0','0','0','345','509','103','8','64','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.238095','1','1','0','0','0','0','0','0','0','721','1','0','0','0','','12340'),
('3460602','0','0','0','0','0','1126','25144','0','0','Frost Sphere (2)','','','0','79','80','2','1925','1925','0','1','1.14286','1','0','422','586','0','642','1','0','0','1','32768','8','0','0','0','0','0','345','509','103','8','64','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.238095','1','1','0','0','0','0','0','0','0','721','1','0','0','0','','1'), -- provisional
('3460603','0','0','0','0','0','1126','25144','0','0','Frost Sphere (3)','','','0','79','80','2','1925','1925','0','1','1.14286','1','0','422','586','0','642','1','0','0','1','32768','8','0','0','0','0','0','345','509','103','8','64','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.238095','1','1','0','0','0','0','0','0','0','721','1','0','0','0','','1'); -- provisional

UPDATE `creature_template` SET `modelid1`=29325,`faction_A`=16,`faction_H`=16 WHERE `creature_template`.`entry` IN (34660,34607,3460701,3460702,3460703);
UPDATE `creature_template` SET `modelid1`=11686 WHERE `creature_template`.`entry` IN (34862,34660);

-- Text for gossips (obviously wrong!)
DELETE FROM `npc_text` WHERE `ID` IN (724001,724002,724003,724004,724005,724006); 
REPLACE INTO `npc_text` (`ID`,`Text0_0`) VALUES
(724001, 'Greetings $N! Are you ready to be tested in Crusaders Coliseum?'),
(724002, 'Are you ready for the next stage?'),
(724003, 'Are you ready to fight the champions of the Silver vanguard?'),
(724004, 'Are you ready for the next stage?'),
(724005, 'Are you ready to continue battle with Anub-Arak?');

-- UNSURE
-- Wilfred Fizzlebang Faction
UPDATE `creature_template` SET  `faction_A`=1770,`faction_H`=1770 WHERE `entry`=35458;


-- REPLACE INTO `spell_script_target` VALUES (65875, 1, 34497), (65876, 1, 34496);

-- ------------------------------------------------------------------------------------------------------------------------------------ --
-- ACORDING WITH THE LAST SCRIPTS OF TC ANUB'ARAK IS NOT ATTACKABLE, THIS IS THE SOLUTION
-- THANKS MISIMOUSE
UPDATE creature_template SET unit_flags = 0, type_flags= 8, dynamicflags = 0, flags_extra = 2 WHERE entry IN (34564, 34566, 33615, 36616);
-- ------------------------------------------------------------------------------------------------------------------------------------ --