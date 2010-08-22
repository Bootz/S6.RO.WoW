-- Spell DBC
INSERT INTO `spelldifficulty_dbc` VALUES ('6000', '66331', '67478', '67477', '67479'); -- Gormok Impale
INSERT INTO `spelldifficulty_dbc` VALUES ('6001', '66330', '67647', '67648', '67649'); -- Gormok Staggering Stomp
INSERT INTO `spelldifficulty_dbc` VALUES ('6002', '66689', '67650', '67651', '67652'); -- Icehowl Artic Breath
INSERT INTO `spelldifficulty_dbc` VALUES ('6003', '66683', '67660', '67660', '67662'); -- Icehowl Massic Crash
INSERT INTO `spelldifficulty_dbc` VALUES ('6004', '67345', '67663', '67663', '67665'); -- Icehowl Whirl
INSERT INTO `spelldifficulty_dbc` VALUES ('6005', '66770', '67655', '67654', '67656'); -- Icehowl Ferocious Butt
INSERT INTO `spelldifficulty_dbc` VALUES ('6006', '66879', '67624', '67625', '67626'); -- Dreadscale Burning Bite
INSERT INTO `spelldifficulty_dbc` VALUES ('6007', '66820', '67636', '67635', '67637'); -- Dreadscale Molten Spew
INSERT INTO `spelldifficulty_dbc` VALUES ('6020', '66237', '67049', '67050', '67051'); -- Jaraxxus Incinerate Flesh
INSERT INTO `spelldifficulty_dbc` VALUES ('6021', '66528', '67029', '67030', '67031'); -- Jaraxxus Fel Lighting
INSERT INTO `spelldifficulty_dbc` VALUES ('6022', '68124', '68126', '68127', '68128'); -- Jaraxxus Legion Flame
INSERT INTO `spelldifficulty_dbc` VALUES ('6023', '66532', '66963', '66964', '66965'); -- Jaraxxus Fel Fireball
INSERT INTO `spelldifficulty_dbc` VALUES ('6024', '66258', '66258', '67903', '67903'); -- Jaraxxus Summon Volcan
INSERT INTO `spelldifficulty_dbc` VALUES ('6025', '67103', '67103', '67104', '67105'); -- Portal Summon Guardian

UPDATE `creature_template` SET `scale`='2' WHERE `entry`=34825;

-- correct little error to start core not really importants
DELETE FROM `creature_template` WHERE `entry`=41000;
INSERT INTO `creature_template` VALUES ('41000','0','0','0','0','0','169','11686','169','0','Wilfred Portal Trigger','','','0','81','81','0','14','14','0','1','1','0','1','2','0','0','1','2000','2000','1','1','0','0','0','0','0','0','1','2','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','1','1','0','0','0','0','0','0','0','0','1','0','0','2','0','','11159');

-- Gormok
UPDATE `creature_template` SET `scale`='1.5', `faction_A`='16', `faction_H`='16' WHERE (`entry`='34854');
UPDATE `creature_template` SET unit_flags= 33554434, faction_A =14, faction_H=14 WHERE `entry` IN (34628, 34630);
INSERT INTO `npc_spellclick_spells` VALUES (34567, 65684, 0, 0, 0, 1, 0, 0, 0), (34568, 65686, 0, 0, 0, 1, 0, 0, 0); -- dark/light "portals"




-- information in base off TC forums Core related DB content http://forum.trinitycore.org/topic/27404-9521-trial-of-the-crusader/

-- Trial of the Crusader 
-- achievement_reward
DELETE FROM achievement_reward WHERE `entry` IN (4078,4080,4156,4079);
INSERT INTO achievement_reward
(`entry`,`title_A`,`title_H`,`item`,`sender`,`subject`,`text`)
VALUES
(4078,170,170,0,0, '', ''),
(4080,171,171,0,0, '', ''),
(4156,0,0,49096,36095, 'A Tribute to Immortality', 'Dear $N,$B$BTales of your recent performance in the Trial of the Grand Crusader will be told,and retold,for ages to come. As the Argent Crusade issued its call for the greatest champions of Azeroth to test their mettle in the crucible of the Coliseum,I hoped against hope that beacons of light such as you and your companions might emerge from the fray.$B$BWe will need you direly in the coming battle against the Lich King. But on this day,rejoice and celebrate your glorious accomplishment and accept this gift of one of our very finest warhorses. When the Scourge see its banner looming on the horizon,hero,their end shall be nigh!$B$BYours with Honor,$BTirion Fordring'),
(4079,0,0,49098,36095, 'A Tribute to Immortality', 'Dear $N,$B$BTales of your recent performance in the Trial of the Grand Crusader will be told,and retold,for ages to come. As the Argent Crusade issued its call for the greatest champions of Azeroth to test their mettle in the crucible of the Coliseum,I hoped against hope that beacons of light such as you and your companions might emerge from the fray.$B$BWe will need you direly in the coming battle against the Lich King. But on this day,rejoice and celebrate your glorious accomplishment and accept this gift of one of our very finest warhorses. When the Scourge see its banner looming on the horizon,hero,their end shall be nigh!$B$BYours with Honor,$BTirion Fordring');

-- achievement_criteria_data
DELETE FROM achievement_criteria_data WHERE `criteria_id` IN (11542,11546,11547,11549,11678,11679,11680,11681,11682,11683,11684,11685,11686,11687,11688,11689,11690,11691,11692,11693,11778,11779,11780,11799,11800,11801,11802,11803,11804,11818,11838,11839,11860,11861,11862,12116,12198,12258,12278,12279,12280,12281,12338,12339,12340,12341,12342,12343,12344,12345,12346,12347,12348,12349,12350,12358,12359,12360);
INSERT INTO achievement_criteria_data
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
INSERT INTO `disables` (`sourceType`,`entry`,`flags`,`comment`) VALUES
(4,12345,0, 'A Tribute to Skill (10 player)'),
(4,12346,0, 'A Tribute to Skill (10 player)'),
(4,12348,0, 'A Tribute to Mad Skill (10 player)'),
(4,12339,0, 'A Tribute to Skill (25 player)'),
(4,12340,0, 'A Tribute to Skill (25 player)'),
(4,12342,0, 'A Tribute to Mad Skill (25 player)');

-- conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (67888,66332,67755,67756,67757,66129,66170,66181);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
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
UPDATE `creature_template` SET `faction_A`=1925,`faction_H`=1925 WHERE `creature_template`.`entry` IN (34606,3460601,3460602,3460603);
UPDATE `creature_template` SET `modelid1`=29325,`faction_A`=16,`faction_H`=16 WHERE `creature_template`.`entry` IN (34660,34607,3460701,3460702,3460703);
UPDATE `creature_template` SET `modelid1`=11686 WHERE `creature_template`.`entry` IN (34862,34660);

-- Text for gossips (obviously wrong!)
DELETE FROM `npc_text` WHERE `ID` IN (724001,724002,724003,724004,724005,724006); 
INSERT INTO `npc_text` (`ID`,`Text0_0`) VALUES
(724001, 'Greetings $N! Are you ready to be tested in Crusaders Coliseum?'),
(724002, 'Are you ready for the next stage?'),
(724003, 'Are you ready to fight the champions of the Silver vanguard?'),
(724004, 'Are you ready for the next stage?'),
(724005, 'Are you ready to continue battle with Anub-Arak?');

-- UNSURE
-- Wilfred Fizzlebang Faction
UPDATE `creature_template` SET  `faction_A`=1770,`faction_H`=1770 WHERE `entry`=35458;




-- INSERT INTO `spell_script_target` VALUES (65875, 1, 34497), (65876, 1, 34496);

-- NOT NECESSARY AT THE MOMENTO BECAUSE ROCORE IS USSING TC TOC RAID SCRIPTS
/*
DELETE FROM script_texts where `entry` <= -1600205 AND `entry` >= -1600224;
DELETE FROM script_texts where `entry`='-1600229';
DELETE FROM script_texts where `entry` <= -1600234 AND `entry` >= -1600237;
DELETE FROM script_texts where `entry` <= -1600239 AND `entry` >= -1600244;
DELETE FROM script_texts where `entry` <= -1600246 AND `entry` >= -1600250;
DELETE FROM script_texts where `entry` <= -1600252 AND `entry` >= -1600258;
DELETE FROM script_texts where `entry` <= -1713554 AND `entry` >= -1713561;


INSERT INTO `script_texts` VALUES ('0', '-1600205', 'Welcome champions, you have heard the call of the Argent Crusade, and you have boldly answered. It is here, in the Crusader\'s Coliseum, that you will face your greatest challenges. Those of you, who survive the rigors of the coliseum will join the Argent Crusade on it\'s march to Icecrown Citadel.', null, null, 'Willkommen, Champions! Ihr habt den Ruf des Argentumkreuzzugs vernommen und seid ihm mutig gefolgt! Hier, im Kolosseum der Kreuzfahrer, werdet Ihr auf Eure gr??ten Herausforderungen treffen.Die jenigen unter Euch, welche die Gefahren des Kolosseums ?berleben, werden den Kreuzzug bei seinem Marsch auf die Eiskronenzitadelle begleiten.', null, null, null, null, null, '16036', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600206', 'Hailing from the deepest, darkest carverns of the storm peaks, Gormok the Impaler! Battle on, heroes!', null, null, 'Er kommt aus den tiefsten, dunkelsten H?hlen der Sturmgifpel - Gormok der Pf?hler! Voran, Helden!', null, null, null, null, null, '16038', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600207', 'Let the games begin!', '', null, 'Lasst die Spiele beginnen.', null, null, null, null, null, '16037', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600208', ' I have seen more worthy challenges in the ring of blood, you waste our time paladin!', null, null, 'Im Ring des Blutes habe ich w?rdigere K?mpfer gesehen. Ihr verschwendet unsere Zeit, Paladin!', null, null, null, null, null, '16026', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600209', 'Steel yourselves, heroes, for the twin terrors Acidmaw and Dreadscale. Enter the arena!', null, null, 'Stellt euch Helden, den die Zwillingsschrecken ?tschlund und Schreckensmaul erscheinen in der Arena.', null, null, null, null, null, '16039', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600210', 'The air freezes with the introduction of our next combatant, Icehowl! Kill or be killed, champions!', null, null, 'Mit der Ank?ndigung unseres n?chsten K?mpers gefriert die Luft selbst: Eisheuler! T?tet oder werdet get?tet, Champions!', null, null, null, null, null, '16040', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600211', 'Grand Warlock Wilfred Fizzlebang will summon forth your next challenge. Stand by for his entry!', null, null, 'Gro?hexenmeister Wilfred Zischknall wird Eure n?chste Herausforderung beschw?ren. Harrt seiner Ankunft.', null, null, null, null, null, '16043', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600212', 'Thank you, Highlord! Now challengers, I will begin the ritual of summoning! When I am done, a fearsome Doomguard will appear!', null, null, 'Danke. Hochlord. Nun, Champions, werde ich mit dem Beschw?rungsritual beginnen. Sobald es beendet ist, wird eine f?rchterliche Verdammniswache erscheinen!', null, null, null, null, null, '16268', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600213', 'Prepare for oblivion!', null, null, 'Bereitet euch auf den Untergang vor!', null, null, null, null, null, '16269', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600214', 'Ah ha! Behold the absolute power of Wilfred Fizzlebang, master summoner! You are bound to ME, demon!', null, null, 'A-HA! Ich hab es vollbracht! Bestaunt die gerenzenlose Macht von Wilfred Zischknall, Meisterbeschw?rer! Du bist an mich gebunden, D?mon!', null, null, null, null, null, '16270', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600215', 'Trifling gnome, your arrogance will be your undoing!', null, null, 'Unbedeutener Gnom! Deine Arroganz wird dir zum Verh?ngnis!', null, null, null, null, null, '16143', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600216', 'But I\'m in charge her-', null, null, 'aber ich hab hier die Kontrolle ahh......', null, null, null, null, null, '16271', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600217', 'Quickly, heroes! Destroy the demon lord before it can open a portal to its twisted demonic realm!', null, null, 'Schnell, Helden, Zerst?rt den D?monenlord, bevor er ein Portal zu seiner verzerrten Welt ?ffnen kann!', null, null, null, null, null, '16044', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600218', 'You face Jaraxxus, eredar lord of the Burning Legion!', null, null, null, null, null, null, null, null, '16144', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600219', 'FLESH FROM BONE!', null, null, null, null, null, null, null, null, '16149', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600220', 'Come forth, sister! Your master calls!', null, null, null, null, null, null, null, null, '16150', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600221', 'INFERNO!', null, null, null, null, null, null, null, null, '16151', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600222', 'Insignificant gnat!', null, null, null, null, null, null, null, null, '16145', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600223', 'Banished to the Nether!', null, null, null, null, null, null, null, null, '16146', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600224', 'Another will take my place. Your world is doomed.', null, null, null, null, null, null, null, null, '16147', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600229', 'The next battle will be against the Argent Crusade\'s most powerful knights! Only by defeating them will you be deemed worthy...', null, null, null, null, null, null, null, null, '0', '1', '0', '0', null);
-- 1600229 - 1600233 Todo Texte
INSERT INTO `script_texts` VALUES ('0', '-1600234', 'The next battle will be against the Argent Crusade\'s most powerful knights! Only by defeating them will you be deemed worthy...', null, null, null, null, null, null, null, null, '16047', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600235', 'Our honor has been besmirched! They make wild claims and false accusations against us. I demand justice! Allow my champions to fight in place of your knights, Tirion. We challenge the Horde!', null, null, null, null, null, null, null, null, '16066', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600236', 'Very well, I will allow it. Fight with honor!', null, null, null, null, null, null, null, null, '16048', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600237', 'Fight for the glory of the Alliance, heroes! Honor your king and your people!', null, null, null, null, null, null, null, null, '16065', '1', '0', '0', null);
-- 1600238 Horde Spawn
INSERT INTO `script_texts` VALUES ('0', '-1600239', 'Only by working together will you overcome the final challenge. From the depths of Icecrown come to of the Scourge\'s most powerful lieutenants: fearsome val\'kyr, winged harbingers of the Lich King!', null, null, null, null, null, null, null, null, '16050', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600240', 'A mighty blow has been dealt to the Lich King! You have proven yourselves able bodied champions of the Argent Crusade. Together we will strike at Icecrown Citadel and destroy what remains of the Scourge! There is no challenge that we cannot face united!', null, null, 'Dem Lichtk?nig wurde ein schwerer Schlag versetzt! Ihr habt Euch als w?rdige Champions erwiesen. Gemeinsam werden wir den Angriff auf die Eiskronenzitadelle durchf?hren und den Rest der Gei?el zerst?ren! Gemeinsam meistern wir alles!', null, null, null, null, null, '16051', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600241', 'You will have your challenge, Fordring.', null, null, 'Ihr werdet Eure Herausforderung bekommen, Fordring.', null, null, null, null, null, '16321', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600242', 'Arthas! You are hopelessly outnumbered! Lay down Frostmourne and I will grant you a just death.', null, null, 'Arthas! Wir sind Euch zahlenm??ig ?berlegen! Legt Frostgram nieder und ich werde Euch einen gerechten Tod gew?hren.', null, null, null, null, null, '16052', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600243', 'The Nerubians built an empire beneath the frozen wastes of Northrend. An empire that you so foolishly built your structures upon. MY EMPIRE.', null, null, 'Die Neruber erbauten ein K?nigreich unter den gefrorenen Ein?den Nordens. Ein K?nigreich, auf dem Ihr so t?richt Euren Spielplatz aufgebaut habt, AUF MEINEM K?NIGREICH.', null, null, null, null, null, '16322', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600244', 'The souls of your fallen champions will be mine, Fordring.', null, null, 'Die Seelen Eurer gefallenen Champions werden mir geh?ren, Fordering.', null, null, null, null, null, '16323', '1', '0', '0', null);
-- 1600245 Anubarak Intro
INSERT INTO `script_texts` VALUES ('0', '-1600246', 'The loss of Wilfred Fizzlebang, while unfortunate, should be a lesson to those that dare dabble in dark magic. Alas, you are victorious and must now face the next challenge. ', null, null, 'Der Verlust von Wilfred Fizzlebang sollte jeden unter euch eine Lehre sein, die es wagen mit den dunklen k?nsten herumzuspielen. Jedoch ihr seid Siegreich und ihr m?sst nun die n?chste Herausforderung antreten.', null, null, null, null, null, '16045', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600247', 'Treacherous Alliance dogs! You summon a demon lord against warriors of the Horde!? Your deaths will be swift! ', null, null, 'Hinterh?ltige Allianz Hunde! Ihr beschw?rt einen D?monenlord gegen die Krieger der Horde! Ihr werdet einen schnellen Tot finden.', null, null, null, null, null, '16021', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600248', 'The Alliance doesn\'t need the help of a demon lord to deal with Horde filth. Come, pig! ', null, null, 'Die Allianz braucht keinen D?mon zur unterst?tzung gegen Hordendreck! Komm her Schwein!', null, null, null, null, null, '16064', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600249', 'Everyone, calm down! Compose yourselves! There is no conspiracy at play here. The warlock acted on his own volition - outside of influences from the Alliance. The tournament must go on! ', null, null, 'Ihr alle beruhigt euch. Hier ist keine Verschw?rung ingange der Hexenmeister handelte aus eigenen willen heraus unabh?ngig von der Allianz! Das Tunier muss weitergehen.', null, null, null, null, null, '16046', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600250', 'A shallow and tragic victory. We are weaker as a whole from the losses suffered today. Who but the Lich King could benefit from such foolishness? Great warriors have lost their lives. And for what? The true threat looms ahead - the Lich King awaits us all in death.', null, null, null, null, null, null, null, null, '16049', '1', '0', '0', null);
-- -1600251 Northrend Beast Wipe
INSERT INTO `script_texts` VALUES ('0', '-1600252', 'In the name of our dark master. For the Lich King. You. Will. Die.', null, null, null, null, null, null, null, null, '16272', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600253', 'CHAOS!', null, null, null, null, null, null, null, null, '16274', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600254', 'The Scourge cannot be stopped...', null, null, null, null, null, null, null, null, '16275', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600255', 'UNWORTHY!', null, null, null, null, null, null, null, null, '16276', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600256', 'You have been measured, and found wanting!', null, null, null, null, null, null, null, null, '16277', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600257', 'Let the dark consume you!', null, null, null, null, null, null, null, null, '16278', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600258', 'Let the light consume you!', null, null, null, null, null, null, null, null, '16279', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713554', 'Ahhh... Our guests arrived, just as the master promised.', null, null, null, null, null, null, null, null, '16235', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713555', 'This place will serve as your tomb!', null, null, null, null, null, null, null, null, '16234', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713556', 'Auum na-l ak-k-k-k, isshhh. Rise, minions. Devour...', null, null, null, null, null, null, null, null, '16240', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713557', 'The swarm shall overtake you!', null, null, null, null, null, null, null, null, '16241', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713558', 'F-lakkh shir!', null, null, null, null, null, null, null, null, '16236', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713559', 'Another soul to sate the host.', null, null, null, null, null, null, null, null, '16237', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713560', 'I have failed you, master...', null, null, null, null, null, null, null, null, '16238', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713561', 'Highlord Tirion Fordring yells: Champions, you''re alive! Not only have you defeated every challenge of the Trial of the Crusader, but thwarted Arthas directly! Your skill and cunning will prove to be a powerful weapon against the Scourge. Well done! Allow one of my mages to transport you back to the surface!', null, null, null, null, null, null, null, null, '0', '1', '0', '0', null);
*/