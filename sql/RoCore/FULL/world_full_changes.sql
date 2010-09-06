-- ---------------------------------------------------- --
-- FULL UPDATE TO INSERT IN YTDB CTDB_0.1.4 OR YTDB_562 --
-- ---------------------------------------------------- --
-- THIS FILE WILL BE KEEP BY BURNHAM AND MISIMOUSE
-- ANY NEW CORE VERSION WE WILL KEEP EYE ON IT JUST TO CHECK FOR NO CONSOLE ERRORS
-- PLEASE ANY SCRIPT NAME TRY TO ADD IT AT FINAL PLACE OF THIS FULL UPDATE
--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
CREATE TABLE `db_version` (
  `required_31_world_db_version` bit(1) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Used DB version notes';

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` VALUES
(NULL);
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;

-- 01_argent_tournament_script_names_npc
-- Argent Tournament
-- Seems a little hack to finished some quest, but ok, at least people can end the quest.
UPDATE gameobject SET state = 0 WHERE id = 194618; -- Lance Rack (I really dont kno why we rewirte this is working perfect on TCDB no sure on YTDB)

-- Why loot to a gameobject type 22?
/*
DELETE FROM `gameobject_loot_template` WHERE entry = 194618; -- http://www.wowhead.com/item=46070 why? I cant undestant why you put Horde Lance like drop? that's a spell just when you click on rack'
INSERT INTO `gameobject_loot_template` VALUES
(194618, 46070, 100, 1, 0, 1, 1);
*/

UPDATE quest_template SET QuestFlags = 0 WHERE entry = 13678; -- Up To The Challenge
UPDATE quest_template SET NextQuestId = 0 WHERE NextQuestId = 13678; -- Up To The Challenge
UPDATE quest_template SET ReqCreatureOrGOId1 = 24108 WHERE entry = 13679; -- The Aspirant's Challenge
UPDATE quest_template SET NextQuestId = 0 WHERE NextQuestId = 13672; -- Up To The Challenge
UPDATE creature_template SET mindmg = 500, maxdmg = 800 WHERE entry = 33448; -- Argent Valiant
UPDATE creature_template SET mindmg = 650, maxdmg = 1000 WHERE entry = 33707; -- Argent Champion
UPDATE quest_template SET PrevQuestId = 13680 WHERE PrevQuestId = 13687; -- Horde Tournament Eligibility Marker
UPDATE quest_template SET PrevQuestId = 13679 WHERE PrevQuestId = 13686; -- Alliance Tournament Eligibility Marker
UPDATE quest_template SET ReqSourceId2 = 0, ReqSourceCount2 = 0 WHERE ReqSourceId2 = 45000;
UPDATE item_template SET maxcount = 1 WHERE entry = 45005; -- Everburning Ember



-- 01_borean_tundra_script_names_npc
-- script borean tundra
-- Script_names are in 00_scripts_names.sql



-- 01_eye_of_eternity
-- Eye of Eternity review
UPDATE creature_template SET VehicleId=264 WHERE entry = 30248; -- Hover Disk
UPDATE creature_template SET unit_flags = 1 WHERE entry = 28859; -- Malygos

-- Damanges 
UPDATE creature_template SET mindmg = 3684, maxdmg = 4329, dmg_multiplier = 7.5, mechanic_immune_mask = 1072918979 WHERE entry =30245; -- Nexus Lord
UPDATE creature_template SET mindmg = 3684, maxdmg = 4329, dmg_multiplier = 13,  mechanic_immune_mask = 1072918979 WHERE entry = 31750; -- Nexus Lord (1)

-- Immunities
UPDATE creature_template SET mechanic_immune_mask = 1072918979 WHERE entry IN (30249, 31751); -- Scion of Eternity

UPDATE `gameobject_template` SET `data10` = 26572 WHERE `entry`=180912; -- Orb of Translocation
UPDATE `gameobject_template` SET `data10` = 26566 WHERE `entry`=180911; -- Orb of Translocation

UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 30090; -- Vortex
UPDATE creature_template SET flags_extra = flags_extra | 2, faction_A = 35, faction_H = 35, VehicleId = 165 WHERE entry IN (30234, 30248); -- Hover Disk
UPDATE creature_template SET flags_extra = flags_extra | 2, faction_A = 35, faction_H = 35 WHERE entry = 30118; -- Portal (Malygos)
UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 30282; --Arcane Overload
UPDATE creature_template SET mindmg = 1, maxdmg = 1, dmg_multiplier = 1 WHERE entry = 30592; -- Static Field
UPDATE creature_template SET modelid1 = 11686, modelid2 = 11686 WHERE entry = 22517; -- World Trigger (Large AOI)

-- Wyrmest Drake Spell & mount
UPDATE creature_template SET spell1 = 56091, spell2 = 56092, spell3 = 57090, spell4 = 57143, spell5 = 57108, spell6 = 57403, VehicleId = 165 WHERE entry IN (30161, 31752); -- Wyrmrest Skytalon

-- add de malygos & gameobject 
-- Why flag 4 for a chest? with flag 4 the chest can be target, that solve untargeteable chest
UPDATE gameobject_template SET flags = 0, data0 = 43 WHERE entry in (193967, 193905); -- Alexstraszas Gift (chest)

-- Aggro Malygos
UPDATE creature_model_info SET combat_reach = '30' WHERE modelid = 26752; -- Update aggro for Malygos

-- drakes_disks
UPDATE creature_template SET InhabitType = 4, VehicleId = 223 WHERE entry IN (30234, 30248); -- Hover Disk
UPDATE creature_template SET spell6 = 57092, spell7 = 57403 WHERE entry IN (30161, 31752); -- Wyrmrest Skytalon

UPDATE creature_template SET  flags_extra =  flags_extra | 0x2 WHERE entry = 31253; --Alexstrasza the Life-Binder
-- UPDATE creature_model_info SET combat_reach = 15 WHERE modelid = 26752; -- Donwgrade now? it a bit stupid? see line 47

-- script_texts
DELETE FROM script_texts WHERE entry BETWEEN -1616034 AND -1616000;
INSERT INTO script_texts (npc_entry, entry, content_default, sound, type, language, emote, comment) VALUES
(28859, -1616000, 'Lesser beings, intruding here! A shame that your excess courage does not compensate for your stupidity!', 14512, 1, 0, 0, 'Malygos INTRO 1'),
(28859, -1616001, 'None but the blue dragonflight are welcome here! Perhaps this is the work of Alexstrasza? Well then, she has sent you to your deaths.', 14513, 1, 0, 0, 'Malygos INTRO 2'),
(28859, -1616002, 'What could you hope to accomplish, to storm brazenly into my domain? To employ MAGIC? Against ME?', 14514, 1, 0, 0, 'Malygos INTRO 3'),
(28859, -1616003, 'I am without limits here... the rules of your cherished reality do not apply... In this realm, I am in control...', 14515, 1, 0, 0, 'Malygos INTRO 4'),
(28859, -1616004, 'I give you one chance. Pledge fealty to me, and perhaps I won\'t slaughter you for your insolence!', 14516, 1, 0, 0, 'Malygos INTRO 5'),
(28859, -1616005, 'My patience has reached its limit, I WILL BE RID OF YOU!', 14517, 1, 0, 0, 'Malygos AGGRO 1'),
(28859, -1616006, 'Watch helplessly as your hopes are swept away...', 14525, 1, 0, 0, 'Malygos VORTEX'),
(28859, -1616007, 'I AM UNSTOPPABLE!', 14533, 1, 0, 0, 'Malygos SPARK BUFF'),
(28859, -1616008, 'Your stupidity has finally caught up to you!', 14519, 1, 0, 0, 'Malygos SLAY 1-1'),
(28859, -1616009, 'More artifacts to confiscate...', 14520, 1, 0, 0, 'Malygos SLAY 1-2'),
(28859, -1616010, 'How very... naive...', 14521, 1, 0, 0, 'Malygos SLAY 1-3'),
(28859, -1616012, 'I had hoped to end your lives quickly, but you have proven more...resilient then I had anticipated. Nonetheless, your efforts are in vain, it is you reckless, careless mortals who are to blame for this war! I do what I must...And if it means your...extinction...THEN SO BE IT!', 14522, 1, 0, 0, 'Malygos PHASEEND 1'),
(28859, -1616013, 'Few have experienced the pain I will now inflict upon you!', 14523, 1, 0, 0, 'Malygos AGGRO 2'),
(28859, -1616014, 'YOU WILL NOT SUCCEED WHILE I DRAW BREATH!', 14518, 1, 0, 0, 'Malygos DEEP BREATH'),
(28859, -1616016, 'I will teach you IGNORANT children just how little you know of magic...', 14524, 1, 0, 0, 'Malygos ARCANE OVERLOAD'),
(28859, -1616020, 'Your energy will be put to good use!', 14526, 1, 0, 0, 'Malygos SLAY 2-1'),
(28859, -1616021, 'I AM THE SPELL-WEAVER! My power is INFINITE!', 14527, 1, 0, 0, 'Malygos SLAY 2-2'),
(28859, -1616022, 'Your spirit will linger here forever!', 14528, 1, 0, 0, 'Malygos SLAY 2-3'),
(28859, -1616017, 'ENOUGH! If you intend to reclaim Azeroth\'s magic, then you shall have it...', 14529, 1, 0, 0, 'Malygos PHASEEND 2'),
(28859, -1616018, 'Now your benefactors make their appearance...But they are too late. The powers contained here are sufficient to destroy the world ten times over! What do you think they will do to you?', 14530, 1, 0, 0, 'Malygos PHASE 3 INTRO'),
(28859, -1616019, 'SUBMIT!', 14531, 1, 0, 0, 'Malygos AGGRO 3'),
(28859, -1616026, 'The powers at work here exceed anything you could possibly imagine!', 14532, 1, 0, 0, 'Malygos STATIC FIELD'),
(28859, -1616023, 'Alexstrasza! Another of your brood falls!', 14534, 1, 0, 0, 'Malygos SLAY 3-1'),
(28859, -1616024, 'Little more then gnats!', 14535, 1, 0, 0, 'Malygos SLAY 3-2'),
(28859, -1616025, 'Your red allies will share your fate...', 14536, 1, 0, 0, 'Malygos SLAY 3-3'),
(28859, -1616027, 'Still standing? Not for long...', 14537, 1, 0, 0, 'Malygos SPELL 1'),
(28859, -1616028, 'Your cause is lost!', 14538, 1, 0, 0, 'Malygos SPELL 1'),
(28859, -1616029, 'Your fragile mind will be shattered!', 14539, 1, 0, 0, 'Malygos SPELL 1'),
(28859, -1616030, 'UNTHINKABLE! The mortals will destroy... e-everything... my sister... what have you-', 14540, 1, 0, 0, 'Malygos DEATH'),
(32295, -1616031, 'I did what I had to, brother. You gave me no alternative.', 14406, 1, 0, 0, 'Alexstrasza OUTRO 1'),
(32295, -1616032, 'And so ends the Nexus War.', 14407, 1, 0, 0, 'Alexstrasza OUTRO 2'),
(32295, -1616033, 'This resolution pains me deeply, but the destruction, the monumental loss of life had to end. Regardless of Malygos\' recent transgressions, I will mourn his loss. He was once a guardian, a protector. This day, one of the world\'s mightiest has fallen.', 14408, 1, 0, 0, 'Alexstrasza OUTRO 3'),
(32295, -1616034, 'The red dragonflight will take on the burden of mending the devastation wrought on Azeroth. Return home to your people and rest. Tomorrow will bring you new challenges, and you must be ready to face them. Life...goes on.', 14409, 1, 0, 0, 'Alexstrasza OUTRO 4');

-- Some text corrections seems
DELETE FROM script_texts WHERE entry = -1616035;
INSERT INTO script_texts (npc_entry, entry, content_default, TYPE, COMMENT) VALUE
(28859, -1616035, "A Power Spark forms from a nearby rift!", 5, "Malygos WHISPER_POWER_SPARK");
UPDATE script_texts SET content_default = "My patience has reached its limit. I will be rid of you!" WHERE entry = -1616005;

-- ------------------
-- LOOT FROM MALYGOS
-- ------------------

-- Redone loot for Malygos http://www.wowhead.com/npc=28859/malygos#drops:mode=normal10:0+1-16
-- This also need to be include on CTDB 0.14
-- Normal 10p
DELETE FROM `gameobject_loot_template` WHERE `entry`='193905';
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('193905','47241','100','1','0','2','2'), -- Emblem of Triumph
('193905','43952','0.3','1','0','1','1'), -- Reins of the Azure Drake
('193905','40486','20','1','1','1','1'), -- Necklace of the Glittering Chamber
('193905','40488','20','1','1','1','1'), -- Ice Spire Scepter
('193905','40511','20','1','1','1','1'), -- Focusing Energy Epaulets
('193905','40519','20','1','1','1','1'), -- Footsteps of Malygos
('193905','40526','20','1','1','1','1'), -- Gown of the Spell-Weaver
('193905','40474','20','1','2','1','1'), -- Surge Needle Ring
('193905','40475','20','1','2','1','1'), -- Barricade of Eternity
('193905','40489','20','1','2','1','1'), -- Greatstaff of the Nexus
('193905','40491','20','1','2','1','1'), -- Hailstorm
('193905','40497','20','1','2','1','1'); -- Black Ice

-- Redona loot for Malygos http://www.wowhead.com/npc=28859/malygos#drops:mode=normal25:0+1-16
-- This also need to be include on CTDB 0.14
-- Normal 25p
DELETE FROM `gameobject_loot_template` WHERE `entry`='193967';
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('193967','44651','-100','1','0','1','1'), -- Heart of Magic (quest)
('193967','47241','100','1','0','2','2'), -- Emblem of Triumph
('193967','43952','0.6','1','0','1','1'), -- Reins of the Azure Drake
('193967','40592','20','1','1','1','1'), -- Boots of Healing Energies
('193967','40594','20','1','1','1','1'), -- Spaulders of Catatonia
('193967','40589','20','1','1','1','1'), -- Legplates of Sovereignty
('193967','40560','20','1','1','1','1'), -- Leggings of the Wanton Spellcaster
('193967','40566','20','1','1','1','1'), -- Unravelling Strands of Sanity
('193967','40555','20','1','2','1','1'), -- Mantle of Dissemination
('193967','40543','20','1','2','1','1'), -- Blue Aspect Helm
('193967','40561','20','1','2','1','1'), -- Leash of Heedless Magic
('193967','40590','20','1','2','1','1'), -- Elevated Lair Pauldrons
('193967','40588','20','1','2','1','1'), -- Tunic of the Artifact Guardian
('193967','40194','16.666','1','3','1','1'), -- Blanketing Robes of Snow
('193967','40532','16.666','1','3','1','1'), -- Living Ice Crystals
('193967','40541','16.666','1','3','1','1'), -- Frosted Adroit Handguards
('193967','40562','16.666','1','3','1','1'), -- Hood of Rationality
('193967','40564','16.666','1','3','1','1'), -- Winter Spectacle Gloves
('193967','40591','16.666','1','3','1','1'), -- Melancholy Sabatons
('193967','40474','16.666','1','4','1','1'), -- Surge Needle Ring
('193967','40526','16.666','1','4','1','1'), -- Gown of the Spell-Weaver
('193967','40531','16.666','1','4','1','1'), -- Mark of Norgannon
('193967','40539','16.666','1','4','1','1'), -- Chestguard of the Recluse
('193967','40549','16.666','1','4','1','1'), -- Boots of the Renewed Flight
('193967','40558','16.666','1','4','1','1'); -- Arcanic Tramplers



-- 01_naxxramas_drop_and_script_ai
-- esto es muy extraño, con este archivo me da este error: ERROR: Table 'reference_loot_template' entry 39467 isn't reference id and not referenced from loot, and then useless.
-- he buscado en 'reference_loot_template' el entry 39467 y corresponde a un npc que no existe, pense que era en hero pero NO (usa esto: SELECT * from creature_template where entry=39467; )
-- busque como item tambien SELECT * FROM reference_loot_template WHERE item=39467; y mi sorpres es que esta como entry e item asi que aplique DELETE FROM reference_loot_template WHERE entry=39467;
-- No hay errores en este archivo, la solucion la he puest al final de drop.

-- some naxx loot and script_ai

DELETE FROM `creature_loot_template` WHERE (`entry`=16017);
INSERT INTO `creature_loot_template` VALUES 
(16017, 33470, 33, 1, 0, 2, 7),
(16017, 43852, 17, 1, 0, 1, 1),
(16017, 35947, 7, 1, 0, 1, 1),
(16017, 33445, 4, 1, 0, 1, 1),
(16017, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29347);
INSERT INTO `creature_loot_template` VALUES 
(29347, 33470, 33, 1, 0, 2, 7),
(29347, 43852, 17, 1, 0, 1, 1),
(29347, 35947, 7, 1, 0, 1, 1),
(29347, 33445, 4, 1, 0, 1, 1),
(29347, 40412, 1.5, 1, 1, 1, 1),
(29347, 40409, 1.5, 1, 1, 1, 1),
(29347, 40408, 1.5, 1, 1, 1, 1),
(29347, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16018);
INSERT INTO `creature_loot_template` VALUES 
(16018, 33470, 33, 1, 0, 2, 7),
(16018, 43852, 17, 1, 0, 1, 1),
(16018, 35947, 7, 1, 0, 1, 1),
(16018, 33445, 4, 1, 0, 1, 1),
(16018, 33447, 2, 1, 0, 1, 1),
(16018, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29353);
INSERT INTO `creature_loot_template` VALUES 
(29353, 33470, 33, 1, 0, 2, 7),
(29353, 43852, 17, 1, 0, 1, 1),
(29353, 35947, 7, 1, 0, 1, 1),
(29353, 33445, 4, 1, 0, 1, 1),
(29353, 40412, 1.5, 1, 1, 1, 1),
(29353, 40409, 1.5, 1, 1, 1, 1),
(29353, 40414, 1.5, 1, 1, 1, 1),
(29353, 40410, 1.5, 1, 1, 1, 1),
(29353, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16029);
INSERT INTO `creature_loot_template` VALUES 
(16029, 33470, 33, 1, 0, 2, 7),
(16029, 43852, 17, 1, 0, 1, 1),
(16029, 35947, 7, 1, 0, 1, 1),
(16029, 33445, 4, 1, 0, 1, 1),
(16029, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29356);
INSERT INTO `creature_loot_template` VALUES 
(29356, 33470, 33, 1, 0, 2, 7),
(29356, 43852, 17, 1, 0, 1, 1),
(29356, 35947, 7, 1, 0, 1, 1),
(29356, 33445, 4, 1, 0, 1, 1),
(29356, 40412, 1.5, 1, 1, 1, 1),
(29356, 40406, 1.5, 1, 1, 1, 1),
(29356, 40408, 1.5, 1, 1, 1, 1),
(29356, 40407, 1.5, 1, 1, 1, 1),
(29356, 40410, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16020);
INSERT INTO `creature_loot_template` VALUES 
(16020, 33470, 33, 1, 0, 2, 7),
(16020, 43852, 17, 1, 0, 1, 1),
(16020, 35947, 7, 1, 0, 1, 1),
(16020, 33445, 4, 1, 0, 1, 1),
(16020, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29362);
INSERT INTO `creature_loot_template` VALUES 
(29362, 33470, 33, 1, 0, 2, 7),
(29362, 43852, 17, 1, 0, 1, 1),
(29362, 35947, 7, 1, 0, 1, 1),
(29362, 33445, 4, 1, 0, 1, 1),
(29362, 40409, 1.5, 1, 1, 1, 1),
(29362, 40412, 1.5, 1, 1, 1, 1),
(29362, 40414, 1.5, 1, 1, 1, 1),
(29362, 40407, 1.5, 1, 1, 1, 1),
(29362, 40408, 1.5, 1, 1, 1, 1),
(29362, 40410, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16022);
INSERT INTO `creature_loot_template` VALUES 
(16022, 33470, 33, 1, 0, 2, 7),
(16022, 43852, 17, 1, 0, 1, 1),
(16022, 35947, 7, 1, 0, 1, 1),
(16022, 33445, 4, 1, 0, 1, 1),
(16022, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29363);
INSERT INTO `creature_loot_template` VALUES 
(29363, 33470, 33, 1, 0, 2, 7),
(29363, 43852, 17, 1, 0, 1, 1),
(29363, 35947, 7, 1, 0, 1, 1),
(29363, 33445, 4, 1, 0, 1, 1),
(29363, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16021);
INSERT INTO `creature_loot_template` VALUES 
(16021, 33470, 33, 1, 0, 2, 7),
(16021, 43852, 17, 1, 0, 1, 1),
(16021, 35947, 7, 1, 0, 1, 1),
(16021, 33445, 4, 1, 0, 1, 1),
(16021, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29359);
INSERT INTO `creature_loot_template` VALUES 
(29359, 33470, 33, 1, 0, 2, 7),
(29359, 43852, 17, 1, 0, 1, 1),
(29359, 35947, 7, 1, 0, 1, 1),
(29359, 33445, 4, 1, 0, 1, 1),
(29359, 40409, 1.5, 1, 1, 1, 1),
(29359, 40412, 1.5, 1, 1, 1, 1),
(29359, 40407, 1.5, 1, 1, 1, 1),
(29359, 40406, 1.5, 1, 1, 1, 1),
(29359, 40414, 1.5, 1, 1, 1, 1);


DELETE FROM `creature_loot_template` WHERE (`entry`=16025);
INSERT INTO `creature_loot_template` VALUES 
(16025, 33470, 33, 1, 0, 2, 7),
(16025, 43852, 17, 1, 0, 1, 1),
(16025, 35947, 7, 1, 0, 1, 1),
(16025, 33445, 4, 1, 0, 1, 1),
(16025, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29371);
INSERT INTO `creature_loot_template` VALUES 
(29371, 33470, 33, 1, 0, 2, 7),
(29371, 43852, 17, 1, 0, 1, 1),
(29371, 35947, 7, 1, 0, 1, 1),
(29371, 33445, 4, 1, 0, 1, 1),
(29371, 33447, 2, 1, 0, 1, 1),
(29371, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=30071);
INSERT INTO `creature_loot_template` VALUES 
(30071, 33470, 33, 1, 0, 2, 7),
(30071, 43852, 17, 1, 0, 1, 1),
(30071, 35947, 7, 1, 0, 1, 1),
(30071, 33445, 4, 1, 0, 1, 1),
(30071, 33447, 2, 1, 0, 1, 1),
(30071, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=30075);
INSERT INTO `creature_loot_template` VALUES 
(30075, 33470, 33, 1, 0, 2, 7),
(30075, 43852, 17, 1, 0, 1, 1),
(30075, 35947, 7, 1, 0, 1, 1),
(30075, 33445, 4, 1, 0, 1, 1),
(30075, 40412, 1.5, 1, 1, 1, 1),
(30075, 40406, 1.5, 1, 1, 1, 1),
(30075, 40408, 1.5, 1, 1, 1, 1),
(30075, 40407, 1.5, 1, 1, 1, 1),
(30075, 40410, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16146);
INSERT INTO `creature_loot_template` VALUES 
(16146, 33470, 33, 1, 0, 2, 7),
(16146, 43852, 17, 1, 0, 1, 1),
(16146, 35947, 7, 1, 0, 1, 1),
(16146, 33445, 4, 1, 0, 1, 1),
(16146, 33447, 2, 1, 0, 1, 1),
(16146, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29823);
INSERT INTO `creature_loot_template` VALUES 
(29823, 33470, 33, 1, 0, 2, 7),
(29823, 43852, 17, 1, 0, 1, 1),
(29823, 35947, 7, 1, 0, 1, 1),
(29823, 33445, 4, 1, 0, 1, 1),
(29823, 33447, 2, 1, 0, 1, 1),
(29823, 40406, 1.5, 1, 2, 1, 1),
(29823, 40412, 1.5, 1, 2, 1, 1),
(29823, 40414, 1.5, 1, 2, 1, 1),
(29823, 40409, 1.5, 1, 2, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16165);
INSERT INTO `creature_loot_template` VALUES 
(16165, 33470, 33, 1, 0, 2, 7),
(16165, 43852, 17, 1, 0, 1, 1),
(16165, 35947, 7, 1, 0, 1, 1),
(16165, 33445, 4, 1, 0, 1, 1),
(16165, 33447, 2, 1, 0, 1, 1),
(16165, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29828);
INSERT INTO `creature_loot_template` VALUES 
(29828, 33470, 33, 1, 0, 2, 7),
(29828, 43852, 17, 1, 0, 1, 1),
(29828, 35947, 7, 1, 0, 1, 1),
(29828, 33445, 4, 1, 0, 1, 1),
(29828, 33447, 2, 1, 0, 1, 1),
(29828, 40408, 1.5, 1, 2, 1, 1),
(29828, 40412, 1.5, 1, 2, 1, 1),
(29828, 40414, 1.5, 1, 2, 1, 1),
(29828, 40407, 1.5, 1, 2, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16164);
INSERT INTO `creature_loot_template` VALUES 
(16164, 33470, 33, 1, 0, 2, 7),
(16164, 43852, 17, 1, 0, 1, 1),
(16164, 35947, 7, 1, 0, 1, 1),
(16164, 33445, 4, 1, 0, 1, 1),
(16164, 33447, 2, 1, 0, 1, 1),
(16164, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29825);
INSERT INTO `creature_loot_template` VALUES 
(29825, 33470, 33, 1, 0, 2, 7),
(29825, 43852, 17, 1, 0, 1, 1),
(29825, 35947, 7, 1, 0, 1, 1),
(29825, 33445, 4, 1, 0, 1, 1),
(29825, 33447, 2, 1, 0, 1, 1),
(29825, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16145);
INSERT INTO `creature_loot_template` VALUES 
(16145, 33470, 33, 1, 0, 2, 7),
(16145, 43852, 17, 1, 0, 1, 1),
(16145, 35947, 7, 1, 0, 1, 1),
(16145, 33445, 4, 1, 0, 1, 1),
(16145, 33447, 2, 1, 0, 1, 1),
(16145, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29824);
INSERT INTO `creature_loot_template` VALUES 
(29824, 33470, 33, 1, 0, 2, 7),
(29824, 43852, 17, 1, 0, 1, 1),
(29824, 35947, 7, 1, 0, 1, 1),
(29824, 33445, 4, 1, 0, 1, 1),
(29824, 33447, 2, 1, 0, 1, 1),
(29824, 40408, 1.5, 1, 2, 1, 1),
(29824, 40412, 1.5, 1, 2, 1, 1),
(29824, 40414, 1.5, 1, 2, 1, 1),
(29824, 40410, 1.5, 1, 2, 1, 1),
(29824, 40407, 1.5, 1, 2, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16167);
INSERT INTO `creature_loot_template` VALUES 
(16167, 33470, 33, 1, 0, 2, 7),
(16167, 43852, 17, 1, 0, 1, 1),
(16167, 35947, 7, 1, 0, 1, 1),
(16167, 33445, 4, 1, 0, 1, 1),
(16167, 33447, 2, 1, 0, 1, 1),
(16167, 33448, 1.5, 1, 0, 1, 1),
(16167, 39427, 1.1, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29835);
INSERT INTO `creature_loot_template` VALUES 
(29835, 33470, 33, 1, 0, 2, 7),
(29835, 43852, 17, 1, 0, 1, 1),
(29835, 35947, 7, 1, 0, 1, 1),
(29835, 33445, 4, 1, 0, 1, 1),
(29835, 33447, 2, 1, 0, 1, 1),
(29835, 33448, 1.5, 1, 0, 1, 1),
(29835, 40407, 1.1, 1, 0, 1, 1),
(29835, 40410, 1.1, 1, 0, 1, 1),
(29835, 40406, 1.1, 1, 0, 1, 1),
(29835, 43510, 1.1, 1, 0, 1, 1),
(29835, 39152, 1.1, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16193);
INSERT INTO `creature_loot_template` VALUES 
(16193, 33470, 33, 1, 0, 2, 7),
(16193, 43852, 17, 1, 0, 1, 1),
(16193, 35947, 7, 1, 0, 1, 1),
(16193, 33445, 4, 1, 0, 1, 1),
(16193, 33447, 2, 1, 0, 1, 1),
(16193, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29837);
INSERT INTO `creature_loot_template` VALUES 
(29837, 33470, 33, 1, 0, 2, 7),
(29837, 43852, 17, 1, 0, 1, 1),
(29837, 35947, 7, 1, 0, 1, 1),
(29837, 33445, 4, 1, 0, 1, 1),
(29837, 33447, 2, 1, 0, 1, 1),
(29837, 40408, 1.5, 1, 2, 1, 1),
(29837, 40412, 1.5, 1, 2, 1, 1),
(29837, 40414, 1.5, 1, 2, 1, 1),
(29837, 40410, 1.5, 1, 2, 1, 1),
(29837, 40407, 1.5, 1, 2, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16163);
INSERT INTO `creature_loot_template` VALUES 
(16163, 33470, 33, 1, 0, 2, 7),
(16163, 43852, 17, 1, 0, 1, 1),
(16163, 35947, 7, 1, 0, 1, 1),
(16163, 33445, 4, 1, 0, 1, 1),
(16163, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29842);
INSERT INTO `creature_loot_template` VALUES 
(29842, 33470, 33, 1, 0, 2, 7),
(29842, 43852, 17, 1, 0, 1, 1),
(29842, 35947, 7, 1, 0, 1, 1),
(29842, 33445, 4, 1, 0, 1, 1),
(29842, 33447, 2, 1, 0, 1, 1),
(29842, 40408, 1.5, 1, 2, 1, 1),
(29842, 40412, 1.5, 1, 2, 1, 1),
(29842, 40414, 1.5, 1, 2, 1, 1),
(29842, 40410, 1.5, 1, 2, 1, 1),
(29842, 40407, 1.5, 1, 2, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16067);
INSERT INTO `creature_loot_template` VALUES 
(16067, 33470, 33, 1, 0, 2, 7),
(16067, 43852, 17, 1, 0, 1, 1),
(16067, 35947, 7, 1, 0, 1, 1),
(16067, 33445, 4, 1, 0, 1, 1),
(16067, 39468, 1.5, 1, 0, 1, 1),
(16067, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29852);
INSERT INTO `creature_loot_template` VALUES 
(29852, 33470, 33, 1, 0, 2, 7),
(29852, 43852, 17, 1, 0, 1, 1),
(29852, 35947, 7, 1, 0, 1, 1),
(29852, 33445, 4, 1, 0, 1, 1),
(29852, 39468, 1.5, 1, 0, 1, 1),
(29852, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16154);
INSERT INTO `creature_loot_template` VALUES 
(16154, 33470, 33, 1, 0, 2, 7),
(16154, 43852, 17, 1, 0, 1, 1),
(16154, 35947, 7, 1, 0, 1, 1),
(16154, 33445, 4, 1, 0, 1, 1),
(16154, 39467, 1.5, 1, 1, 1, 1),
(16154, 39472, 1.5, 1, 1, 1, 1),
(16154, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29831);
INSERT INTO `creature_loot_template` VALUES 
(29831, 33470, 33, 1, 0, 2, 7),
(29831, 43852, 17, 1, 0, 1, 1),
(29831, 35947, 7, 1, 0, 1, 1),
(29831, 33445, 4, 1, 0, 1, 1),
(29831, 40408, 1.5, 1, 1, 1, 1),
(29831, 40407, 1.5, 1, 1, 1, 1),
(29831, 40410, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16194);
INSERT INTO `creature_loot_template` VALUES 
(16194, 33470, 33, 1, 0, 2, 7),
(16194, 43852, 17, 1, 0, 1, 1),
(16194, 35947, 7, 1, 0, 1, 1),
(16194, 33445, 4, 1, 0, 1, 1),
(16194, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29898);
INSERT INTO `creature_loot_template` VALUES 
(29898, 33470, 33, 1, 0, 2, 7),
(29898, 43852, 17, 1, 0, 1, 1),
(29898, 35947, 7, 1, 0, 1, 1),
(29898, 33445, 4, 1, 0, 1, 1),
(29898, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16215);
INSERT INTO `creature_loot_template` VALUES 
(16215, 33470, 33, 1, 0, 2, 7),
(16215, 43852, 17, 1, 0, 1, 1),
(16215, 35947, 7, 1, 0, 1, 1),
(16215, 33445, 4, 1, 0, 1, 1),
(16215, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29899);
INSERT INTO `creature_loot_template` VALUES 
(29899, 33470, 33, 1, 0, 2, 7),
(29899, 43852, 17, 1, 0, 1, 1),
(29899, 35947, 7, 1, 0, 1, 1),
(29899, 33445, 4, 1, 0, 1, 1),
(29899, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16216);
INSERT INTO `creature_loot_template` VALUES 
(16216, 33470, 33, 1, 0, 2, 7),
(16216, 43852, 17, 1, 0, 1, 1),
(16216, 35947, 7, 1, 0, 1, 1),
(16216, 33445, 4, 1, 0, 1, 1),
(16216, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29900);
INSERT INTO `creature_loot_template` VALUES 
(29900, 33470, 33, 1, 0, 2, 7),
(29900, 43852, 17, 1, 0, 1, 1),
(29900, 35947, 7, 1, 0, 1, 1),
(29900, 33445, 4, 1, 0, 1, 1),
(29900, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=15974);
INSERT INTO `creature_loot_template` VALUES 
(15974, 44758, 70, 1, 0, 2, 4),
(15974, 42253, 30, 1, 1, 1, 3),
(15974, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=29242);
INSERT INTO `creature_loot_template` VALUES 
(29242, 44758, 70, 1, 0, 2, 4),
(29242, 42253, 30, 1, 1, 1, 3),
(29242, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=15975);
INSERT INTO `creature_loot_template` VALUES 
(15975, 44758, 70, 1, 0, 2, 4),
(15975, 42253, 30, 1, 1, 1, 3),
(15975, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=29241);
INSERT INTO `creature_loot_template` VALUES 
(29241, 44758, 70, 1, 0, 2, 4),
(29241, 42253, 30, 1, 1, 1, 3),
(29241, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=15976);
INSERT INTO `creature_loot_template` VALUES 
(15976, 44758, 70, 1, 0, 2, 4),
(15976, 42253, 30, 1, 1, 1, 3),
(15976, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=29243);
INSERT INTO `creature_loot_template` VALUES 
(29243, 44758, 70, 1, 0, 2, 4),
(29243, 42253, 30, 1, 1, 1, 3),
(29243, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=15978);
INSERT INTO `creature_loot_template` VALUES 
(15978, 44758, 70, 1, 0, 2, 4),
(15978, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=30389);
INSERT INTO `creature_loot_template` VALUES 
(30389, 44758, 70, 1, 0, 2, 4),
(30389, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=15980);
INSERT INTO `creature_loot_template` VALUES 
(15980, 33470, 40, 1, 0, 2, 7),
(15980, 43852, 17, 1, 0, 1, 1),
(15980, 35947, 7, 1, 0, 1, 1),
(15980, 33445, 4, 1, 0, 1, 1),
(15980, 33447, 2, 1, 0, 1, 1),
(15980, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29247);
INSERT INTO `creature_loot_template` VALUES 
(29247, 33470, 40, 1, 0, 2, 7),
(29247, 43852, 17, 1, 0, 1, 1),
(29247, 35947, 7, 1, 0, 1, 1),
(29247, 33445, 4, 1, 0, 1, 1),
(29247, 33447, 2, 1, 0, 1, 1),
(29247, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=15981);
INSERT INTO `creature_loot_template` VALUES 
(15981, 33470, 40, 1, 0, 2, 7),
(15981, 43852, 17, 1, 0, 1, 1),
(15981, 35947, 7, 1, 0, 1, 1),
(15981, 33445, 4, 1, 0, 1, 1),
(15981, 33447, 2, 1, 0, 1, 1),
(15981, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29248);
INSERT INTO `creature_loot_template` VALUES 
(29248, 33470, 40, 1, 0, 2, 7),
(29248, 43852, 17, 1, 0, 1, 1),
(29248, 35947, 7, 1, 0, 1, 1),
(29248, 33445, 4, 1, 0, 1, 1),
(29248, 33447, 2, 1, 0, 1, 1),
(29248, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=15979);
INSERT INTO `creature_loot_template` VALUES 
(15979, 44758, 70, 1, 0, 2, 4),
(15979, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=29286);
INSERT INTO `creature_loot_template` VALUES 
(29286, 44758, 70, 1, 0, 2, 4),
(29286, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=16244);
INSERT INTO `creature_loot_template` VALUES 
(16244, 33470, 40, 1, 0, 2, 7),
(16244, 43852, 17, 1, 0, 1, 1),
(16244, 35947, 7, 1, 0, 1, 1),
(16244, 33445, 4, 1, 0, 1, 1),
(16244, 33447, 2, 1, 0, 1, 1),
(16244, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29574);
INSERT INTO `creature_loot_template` VALUES 
(29574, 33470, 33, 1, 0, 2, 7),
(29574, 43852, 17, 1, 0, 1, 1),
(29574, 35947, 7, 1, 0, 1, 1),
(29574, 33445, 4, 1, 0, 1, 1),
(29574, 40412, 1.5, 1, 1, 1, 1),
(29574, 40409, 1.5, 1, 1, 1, 1),
(29574, 40414, 1.5, 1, 1, 1, 1),
(29574, 40410, 1.5, 1, 1, 1, 1),
(29574, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16243);
INSERT INTO `creature_loot_template` VALUES 
(16243, 33470, 40, 1, 0, 2, 7),
(16243, 43852, 17, 1, 0, 1, 1),
(16243, 35947, 7, 1, 0, 1, 1),
(16243, 33445, 4, 1, 0, 1, 1),
(16243, 33447, 2, 1, 0, 1, 1),
(16243, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29575);
INSERT INTO `creature_loot_template` VALUES 
(29575, 33470, 33, 1, 0, 2, 7),
(29575, 43852, 17, 1, 0, 1, 1),
(29575, 35947, 7, 1, 0, 1, 1),
(29575, 33445, 4, 1, 0, 1, 1),
(29575, 40412, 1.5, 1, 1, 1, 1),
(29575, 40409, 1.5, 1, 1, 1, 1),
(29575, 40414, 1.5, 1, 1, 1, 1),
(29575, 40410, 1.5, 1, 1, 1, 1),
(29575, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16168);
INSERT INTO `creature_loot_template` VALUES 
(16168, 33470, 40, 1, 0, 2, 7),
(16168, 43852, 17, 1, 0, 1, 1),
(16168, 35947, 7, 1, 0, 1, 1),
(16168, 33445, 4, 1, 0, 1, 1),
(16168, 33447, 2, 1, 0, 1, 1),
(16168, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29576);
INSERT INTO `creature_loot_template` VALUES 
(29576, 33470, 33, 1, 0, 2, 7),
(29576, 43852, 17, 1, 0, 1, 1),
(29576, 35947, 7, 1, 0, 1, 1),
(29576, 33445, 4, 1, 0, 1, 1),
(29576, 40412, 1.5, 1, 1, 1, 1),
(29576, 40409, 1.5, 1, 1, 1, 1),
(29576, 40414, 1.5, 1, 1, 1, 1),
(29576, 40410, 1.5, 1, 1, 1, 1),
(29576, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16297);
INSERT INTO `creature_loot_template` VALUES 
(16297, 33470, 40, 1, 0, 2, 7),
(16297, 43852, 17, 1, 0, 1, 1),
(16297, 35947, 7, 1, 0, 1, 1),
(16297, 33445, 4, 1, 0, 1, 1),
(16297, 33447, 2, 1, 0, 1, 1),
(16297, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29601);
INSERT INTO `creature_loot_template` VALUES 
(29601, 33470, 33, 1, 0, 2, 7),
(29601, 43852, 17, 1, 0, 1, 1),
(29601, 35947, 7, 1, 0, 1, 1),
(29601, 33445, 4, 1, 0, 1, 1),
(29601, 40412, 1.5, 1, 1, 1, 1),
(29601, 40409, 1.5, 1, 1, 1, 1),
(29601, 40414, 1.5, 1, 1, 1, 1),
(29601, 40410, 1.5, 1, 1, 1, 1),
(29601, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16036);
INSERT INTO `creature_loot_template` VALUES 
(16036, 33470, 40, 1, 0, 2, 7),
(16036, 43852, 17, 1, 0, 1, 1),
(16036, 35947, 7, 1, 0, 1, 1),
(16036, 33445, 4, 1, 0, 1, 1),
(16036, 33447, 2, 1, 0, 1, 1),
(16036, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29608);
INSERT INTO `creature_loot_template` VALUES 
(29608, 33470, 33, 1, 0, 2, 7),
(29608, 43852, 17, 1, 0, 1, 1),
(29608, 35947, 7, 1, 0, 1, 1),
(29608, 33445, 4, 1, 0, 1, 1),
(29608, 40412, 1.5, 1, 1, 1, 1),
(29608, 40409, 1.5, 1, 1, 1, 1),
(29608, 40414, 1.5, 1, 1, 1, 1),
(29608, 40410, 1.5, 1, 1, 1, 1),
(29608, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16034);
INSERT INTO `creature_loot_template` VALUES 
(16034, 33470, 40, 1, 0, 2, 7),
(16034, 43852, 17, 1, 0, 1, 1),
(16034, 35947, 7, 1, 0, 1, 1),
(16034, 33445, 4, 1, 0, 1, 1),
(16034, 33447, 2, 1, 0, 1, 1),
(16034, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29609);
INSERT INTO `creature_loot_template` VALUES 
(29609, 33470, 33, 1, 0, 2, 7),
(29609, 43852, 17, 1, 0, 1, 1),
(29609, 35947, 7, 1, 0, 1, 1),
(29609, 33445, 4, 1, 0, 1, 1);

DELETE FROM `creature_ai_scripts` WHERE (`id`=16427020);
INSERT INTO `creature_ai_scripts` VALUES 
(16427020, 16236, 0, 0, 100, 3, 1000, 3000, 3000, 6000, 11, 29407, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spell N');
DELETE FROM `creature_ai_scripts` WHERE (`id`=16427021);
INSERT INTO `creature_ai_scripts` VALUES 
(16427021, 16236, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 54805, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spell H');

DELETE FROM `creature_loot_template` WHERE `item` IN (39467, 39472, 39470, 39427, 39468, 39473);
INSERT INTO `creature_loot_template` VALUES 
(16017, 39467, 1.5, 1, 1, 1, 1),
(16017, 39472, 1.5, 1, 1, 1, 1),
(16017, 39470, 1.5, 1, 1, 1, 1),
(16017, 39427, 1.5, 1, 1, 1, 1),
(16017, 39468, 1.5, 1, 1, 1, 1),
(16017, 39473, 1.5, 1, 1, 1, 1),
(16018, 39467, 1.5, 1, 1, 1, 1),
(16018, 39472, 1.5, 1, 1, 1, 1),
(16018, 39470, 1.5, 1, 1, 1, 1),
(16018, 39427, 1.5, 1, 1, 1, 1),
(16018, 39468, 1.5, 1, 1, 1, 1),
(16018, 39473, 1.5, 1, 1, 1, 1),
(16029, 39467, 1.5, 1, 1, 1, 1),
(16029, 39472, 1.5, 1, 1, 1, 1),
(16029, 39470, 1.5, 1, 1, 1, 1),
(16029, 39427, 1.5, 1, 1, 1, 1),
(16029, 39468, 1.5, 1, 1, 1, 1),
(16029, 39473, 1.5, 1, 1, 1, 1),
(16020, 39467, 1.5, 1, 1, 1, 1),
(16020, 39472, 1.5, 1, 1, 1, 1),
(16020, 39470, 1.5, 1, 1, 1, 1),
(16020, 39427, 1.5, 1, 1, 1, 1),
(16020, 39468, 1.5, 1, 1, 1, 1),
(16020, 39473, 1.5, 1, 1, 1, 1),
(16021, 39467, 1.5, 1, 1, 1, 1),
(16021, 39472, 1.5, 1, 1, 1, 1),
(16021, 39470, 1.5, 1, 1, 1, 1),
(16021, 39427, 1.5, 1, 1, 1, 1),
(16021, 39468, 1.5, 1, 1, 1, 1),
(16021, 39473, 1.5, 1, 1, 1, 1),
(16025, 39467, 1.5, 1, 1, 1, 1),
(16025, 39472, 1.5, 1, 1, 1, 1),
(16025, 39470, 1.5, 1, 1, 1, 1),
(16025, 39427, 1.5, 1, 1, 1, 1),
(16025, 39468, 1.5, 1, 1, 1, 1),
(16025, 39473, 1.5, 1, 1, 1, 1),
(30071, 39467, 1.5, 1, 1, 1, 1),
(30071, 39472, 1.5, 1, 1, 1, 1),
(30071, 39470, 1.5, 1, 1, 1, 1),
(30071, 39427, 1.5, 1, 1, 1, 1),
(30071, 39468, 1.5, 1, 1, 1, 1),
(30071, 39473, 1.5, 1, 1, 1, 1),
(16146, 39467, 1.5, 1, 1, 1, 1),
(16146, 39472, 1.5, 1, 1, 1, 1),
(16146, 39470, 1.5, 1, 1, 1, 1),
(16146, 39427, 1.5, 1, 1, 1, 1),
(16146, 39468, 1.5, 1, 1, 1, 1),
(16146, 39473, 1.5, 1, 1, 1, 1),
(16165, 39467, 1.5, 1, 1, 1, 1),
(16165, 39472, 1.5, 1, 1, 1, 1),
(16165, 39470, 1.5, 1, 1, 1, 1),
(16165, 39427, 1.5, 1, 1, 1, 1),
(16165, 39468, 1.5, 1, 1, 1, 1),
(16165, 39473, 1.5, 1, 1, 1, 1),
(16164, 39467, 1.5, 1, 1, 1, 1),
(16164, 39472, 1.5, 1, 1, 1, 1),
(16164, 39470, 1.5, 1, 1, 1, 1),
(16164, 39427, 1.5, 1, 1, 1, 1),
(16164, 39468, 1.5, 1, 1, 1, 1),
(16164, 39473, 1.5, 1, 1, 1, 1),
(16145, 39467, 1.5, 1, 1, 1, 1),
(16145, 39472, 1.5, 1, 1, 1, 1),
(16145, 39470, 1.5, 1, 1, 1, 1),
(16145, 39427, 1.5, 1, 1, 1, 1),
(16145, 39468, 1.5, 1, 1, 1, 1),
(16145, 39473, 1.5, 1, 1, 1, 1),
(16167, 39467, 1.5, 1, 1, 1, 1),
(16167, 39472, 1.5, 1, 1, 1, 1),
(16167, 39470, 1.5, 1, 1, 1, 1),
(16167, 39427, 1.5, 1, 1, 1, 1),
(16167, 39468, 1.5, 1, 1, 1, 1),
(16167, 39473, 1.5, 1, 1, 1, 1),
(16193, 39467, 1.5, 1, 1, 1, 1),
(16193, 39472, 1.5, 1, 1, 1, 1),
(16193, 39470, 1.5, 1, 1, 1, 1),
(16193, 39427, 1.5, 1, 1, 1, 1),
(16193, 39468, 1.5, 1, 1, 1, 1),
(16193, 39473, 1.5, 1, 1, 1, 1),
(16163, 39467, 1.5, 1, 1, 1, 1),
(16163, 39472, 1.5, 1, 1, 1, 1),
(16163, 39470, 1.5, 1, 1, 1, 1),
(16163, 39427, 1.5, 1, 1, 1, 1),
(16163, 39468, 1.5, 1, 1, 1, 1),
(16163, 39473, 1.5, 1, 1, 1, 1),
(16067, 39467, 1.5, 1, 1, 1, 1),
(16067, 39472, 1.5, 1, 1, 1, 1),
(16067, 39470, 1.5, 1, 1, 1, 1),
(16067, 39427, 1.5, 1, 1, 1, 1),
(16067, 39468, 1.5, 1, 1, 1, 1),
(16067, 39473, 1.5, 1, 1, 1, 1),
(16154, 39467, 1.5, 1, 1, 1, 1),
(16154, 39472, 1.5, 1, 1, 1, 1),
(16154, 39470, 1.5, 1, 1, 1, 1),
(16154, 39427, 1.5, 1, 1, 1, 1),
(16154, 39468, 1.5, 1, 1, 1, 1),
(16154, 39473, 1.5, 1, 1, 1, 1),
(16194, 39467, 1.5, 1, 1, 1, 1),
(16194, 39472, 1.5, 1, 1, 1, 1),
(16194, 39470, 1.5, 1, 1, 1, 1),
(16194, 39427, 1.5, 1, 1, 1, 1),
(16194, 39468, 1.5, 1, 1, 1, 1),
(16194, 39473, 1.5, 1, 1, 1, 1),
(16215, 39467, 1.5, 1, 1, 1, 1),
(16215, 39472, 1.5, 1, 1, 1, 1),
(16215, 39470, 1.5, 1, 1, 1, 1),
(16215, 39427, 1.5, 1, 1, 1, 1),
(16215, 39468, 1.5, 1, 1, 1, 1),
(16215, 39473, 1.5, 1, 1, 1, 1),
(16216, 39467, 1.5, 1, 1, 1, 1),
(16216, 39472, 1.5, 1, 1, 1, 1),
(16216, 39470, 1.5, 1, 1, 1, 1),
(16216, 39427, 1.5, 1, 1, 1, 1),
(16216, 39468, 1.5, 1, 1, 1, 1),
(16216, 39473, 1.5, 1, 1, 1, 1),
(15974, 39467, 1.5, 1, 1, 1, 1),
(15974, 39472, 1.5, 1, 1, 1, 1),
(15974, 39470, 1.5, 1, 1, 1, 1),
(15974, 39427, 1.5, 1, 1, 1, 1),
(15974, 39468, 1.5, 1, 1, 1, 1),
(15974, 39473, 1.5, 1, 1, 1, 1),
(15975, 39467, 1.5, 1, 1, 1, 1),
(15975, 39472, 1.5, 1, 1, 1, 1),
(15975, 39470, 1.5, 1, 1, 1, 1),
(15975, 39427, 1.5, 1, 1, 1, 1),
(15975, 39468, 1.5, 1, 1, 1, 1),
(15975, 39473, 1.5, 1, 1, 1, 1),
(15976, 39467, 1.5, 1, 1, 1, 1),
(15976, 39472, 1.5, 1, 1, 1, 1),
(15976, 39470, 1.5, 1, 1, 1, 1),
(15976, 39427, 1.5, 1, 1, 1, 1),
(15976, 39468, 1.5, 1, 1, 1, 1),
(15976, 39473, 1.5, 1, 1, 1, 1),
(15978, 39467, 1.5, 1, 1, 1, 1),
(15978, 39472, 1.5, 1, 1, 1, 1),
(15978, 39470, 1.5, 1, 1, 1, 1),
(15978, 39427, 1.5, 1, 1, 1, 1),
(15978, 39468, 1.5, 1, 1, 1, 1),
(15978, 39473, 1.5, 1, 1, 1, 1),
(15980, 39467, 1.5, 1, 1, 1, 1),
(15980, 39472, 1.5, 1, 1, 1, 1),
(15980, 39470, 1.5, 1, 1, 1, 1),
(15980, 39427, 1.5, 1, 1, 1, 1),
(15980, 39468, 1.5, 1, 1, 1, 1),
(15980, 39473, 1.5, 1, 1, 1, 1),
(15981, 39467, 1.5, 1, 1, 1, 1),
(15981, 39472, 1.5, 1, 1, 1, 1),
(15981, 39470, 1.5, 1, 1, 1, 1),
(15981, 39427, 1.5, 1, 1, 1, 1),
(15981, 39468, 1.5, 1, 1, 1, 1),
(15981, 39473, 1.5, 1, 1, 1, 1),
(15979, 39467, 1.5, 1, 1, 1, 1),
(15979, 39472, 1.5, 1, 1, 1, 1),
(15979, 39470, 1.5, 1, 1, 1, 1),
(15979, 39427, 1.5, 1, 1, 1, 1),
(15979, 39468, 1.5, 1, 1, 1, 1),
(15979, 39473, 1.5, 1, 1, 1, 1),
(16244, 39467, 1.5, 1, 1, 1, 1),
(16244, 39472, 1.5, 1, 1, 1, 1),
(16244, 39470, 1.5, 1, 1, 1, 1),
(16244, 39427, 1.5, 1, 1, 1, 1),
(16244, 39468, 1.5, 1, 1, 1, 1),
(16244, 39473, 1.5, 1, 1, 1, 1),
(16243, 39467, 1.5, 1, 1, 1, 1),
(16243, 39472, 1.5, 1, 1, 1, 1),
(16243, 39470, 1.5, 1, 1, 1, 1),
(16243, 39427, 1.5, 1, 1, 1, 1),
(16243, 39468, 1.5, 1, 1, 1, 1),
(16243, 39473, 1.5, 1, 1, 1, 1),
(16168, 39467, 1.5, 1, 1, 1, 1),
(16168, 39472, 1.5, 1, 1, 1, 1),
(16168, 39470, 1.5, 1, 1, 1, 1),
(16168, 39427, 1.5, 1, 1, 1, 1),
(16168, 39468, 1.5, 1, 1, 1, 1),
(16168, 39473, 1.5, 1, 1, 1, 1),
(16297, 39467, 1.5, 1, 1, 1, 1),
(16297, 39472, 1.5, 1, 1, 1, 1),
(16297, 39470, 1.5, 1, 1, 1, 1),
(16297, 39427, 1.5, 1, 1, 1, 1),
(16297, 39468, 1.5, 1, 1, 1, 1),
(16297, 39473, 1.5, 1, 1, 1, 1),
(16036, 39467, 1.5, 1, 1, 1, 1),
(16036, 39472, 1.5, 1, 1, 1, 1),
(16036, 39470, 1.5, 1, 1, 1, 1),
(16036, 39427, 1.5, 1, 1, 1, 1),
(16036, 39468, 1.5, 1, 1, 1, 1),
(16036, 39473, 1.5, 1, 1, 1, 1),
(16034, 39467, 1.5, 1, 1, 1, 1),
(16034, 39472, 1.5, 1, 1, 1, 1),
(16034, 39470, 1.5, 1, 1, 1, 1),
(16034, 39427, 1.5, 1, 1, 1, 1),
(16034, 39468, 1.5, 1, 1, 1, 1),
(16034, 39473, 1.5, 1, 1, 1, 1);

DELETE FROM reference_loot_template WHERE entry=39467;



-- http://www.wowhead.com/npc=16211
UPDATE `creature_template` SET `unit_flags` = 131074 WHERE `entry` = 16211;


-- some scripts_ai
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=29256);
INSERT INTO `creature_ai_scripts` VALUES 
( 100000100, 29256, 0, 0, 100, 2, 0, 0, 0, 0, 11, 28969, 4, 32, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard (Normal) - Cast Acid Spit on Aggro'),
( 100000101, 29256, 0, 0, 100, 4, 0, 0, 0, 0, 11, 56098, 4, 32, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard (Heroic) - Cast Acid Spit on Aggro'),
( 100000102, 29256, 0, 0, 100, 3, 4000, 6000, 4000, 7000, 11, 28969, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard (Normal) - Cast Acid Spit'),
( 100000104, 29256, 0, 0, 100, 5, 4000, 6000, 4000, 7000, 11, 56098, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard (Heroic) - Cast Acid Spit'),
( 100000105, 29256, 0, 0, 100, 7, 7000, 9000, 7000, 9000, 11, 40504, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard - Cast Cleave'),
( 100000106, 29256, 2, 0, 100, 7, 30, 0, 120000, 120000, 11, 8269, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard - Cast Frenzy at 30% HP'),
(100000107, 29256, 6, 0, 100, 0, 0, 0, 0, 0, 11, 28864, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard - Summon Corpse Scarabs');

UPDATE `creature_template` SET `spell1` = 55765, `AIName` = 'EventAI' WHERE `entry` = 16429;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=16429);
INSERT INTO `creature_ai_scripts` VALUES 
(100000108, 16429, 9, 0, 100, 3, 0, 3, 500, 1000, 11, 55765, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wail of Souls - Normal'),
(100000109, 16429, 9, 0, 100, 5, 0, 3, 500, 1000, 11, 55765, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wail of Souls - Hero');


UPDATE `creature_template` SET `spell1` = 28457, `AIName` = 'EventAI', `spell2` = 55714 WHERE `entry` = 16427;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=16427);
INSERT INTO `creature_ai_scripts` VALUES 
(100000110, 16427, 9, 0, 100, 3, 0, 3, 0, 0, 11, 28457, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Explode - Normal'),
(100000111, 16427, 9, 0, 100, 5, 0, 3, 0, 0, 11, 55714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Explode - Hero');



-- 01_obsidian_sanctum
--
-- Obsidian Sanctum
--
-- flametsunami
UPDATE creature_template SET minlevel=83, maxlevel=83, faction_A=14, faction_H=14, unit_flags=0x02000000, flags_extra=0x00000002 WHERE entry=30616;

-- safezone flag
UPDATE creature_template SET flags_extra = 0x00000002 WHERE entry=30494;

-- sartharion door
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 181247;

-- Add Twilight Portals
DELETE FROM gameobject WHERE id=193988;
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(193988, 615, 3, 1, 3137.26, 501.08, 87.9118, 0.846795, 0, 0, 0.41086, 0.911698, -30, 0, 1),
(193988, 615, 3, 1, 3238.37, 518.595, 58.9057, 0.739184, 0, 0, 0.361235, 0.932475, -30, 0, 1),
(193988, 615, 3, 1, 3362.01, 553.726, 95.7068, 4.56818, 0, 0, 0.756211, -0.654328, -30, 0, 1),
(193988, 615, 3, 1, 3219.67, 656.795, 87.2898, 5.92596, 0, 0, 0.177664, -0.984091, 25, 0, 1);

-- Set creature data to creatures used in Sartharion encounter
UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 31103; -- Twilight Egg (Cosmetic)
UPDATE creature_template SET unit_flags = unit_flags | 4, faction_A = 103, faction_H = 103, flags_extra = 2 WHERE entry = 30648; -- Fire Cyclone

-- esta linea produce un error:
-- ERROR: Table `creature` have creature (GUID: 123400 Entry: 30648) with `MovementType`=1 (random movement) but with `spawndist`=0, replace by idle movement type (0).
-- ERROR: Table `creature` have creature (GUID: 123401 Entry: 30648) with `MovementType`=1 (random movement) but with `spawndist`=0, replace by idle movement type (0).
-- ERROR: Table `creature` have creature (GUID: 123402 Entry: 30648) with `MovementType`=1 (random movement) but with `spawndist`=0, replace by idle movement type (0).
-- ERROR: Table `creature` have creature (GUID: 123403 Entry: 30648) with `MovementType`=1 (random movement) but with `spawndist`=0, replace by idle movement type (0).
-- ERROR: Table `creature` have creature (GUID: 123404 Entry: 30648) with `MovementType`=1 (random movement) but with `spawndist`=0, replace by idle movement type (0).
-- porque le cambia el spawndist a "0" y si haces un SELECT * FROM creature WHERE id=30648; veras que esta en "5", no sesi es correcto ya que este querie se hiso para TDB
/*
UPDATE creature SET spawndist = 0 WHERE id = 30648; -- Fire Cyclone
*/
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81, mindmg = 1857, maxdmg = 2703 WHERE entry IN (30890, 31214);
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81, mindmg = 3032, maxdmg = 5194 WHERE entry IN (31540, 31548);
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81 WHERE entry IN (30882, 31539); -- Twilight Egg
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81 WHERE entry IN (31204, 31547); -- Sartharion Twilight Egg
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81, flags_extra = 2, scale = 0.75 WHERE entry IN (30641, 31521); -- Twilight Fissure
UPDATE creature_template SET faction_A = 14, faction_H = 14, minlevel = 81, maxlevel = 81, mindmg = 693, maxdmg = 963, attackpower = 1567, dmg_multiplier = 1 WHERE entry = 30643; -- Lava Blaze
UPDATE creature_template SET faction_A = 14, faction_H = 14, minlevel = 81, maxlevel = 81, mindmg = 894, maxdmg = 1203, attackpower = 3134, dmg_multiplier = 1 WHERE entry = 31317; -- Lava Blaze (1)
UPDATE creature_template SET faction_A = 14, faction_H = 14, minlevel = 81, maxlevel = 81, flags_extra = 2 WHERE entry = 30616; -- Flame Tsunami
UPDATE creature_template SET faction_A = 103, faction_H = 103, mindmg = 409, maxdmg = 502, attackpower = 780, dmg_multiplier = 35, mechanic_immune_mask = 617299803, minlevel = 81, maxlevel = 81 WHERE entry IN (31218, 31219); -- Acolytes of Vesperon/Shandron
--  twilight fissure
UPDATE creature_template SET flags_extra = 0 WHERE entry IN (30641, 31521);
UPDATE creature_template SET modelid1 = 29038 WHERE entry IN (30641, 31521);

-- mob obsidian
UPDATE creature_template SET unit_flags = 33554434 WHERE entry IN (30641, 31521, 31103);

-- disciple of vesperon
UPDATE creature_template SET faction_H = 16, faction_A = 16 WHERE entry = 30858;
UPDATE gameobject SET spawntimesecs = -60 WHERE id = 193988;



-- 01_oculus
-- Ruby drake
UPDATE creature_template SET spell1 = 50232, spell2 = 50248, spell3 = 50240, spell4 =  50253, spell5 = 53112, VehicleId = 70 WHERE entry = 27756;
-- Amber Drake
UPDATE creature_template SET spell1 = 49840, spell2 = 49838, spell3 = 49592, spell4 =  0, spell5 = 53112, VehicleId = 70 WHERE entry = 27755;
-- Emerald Drake
UPDATE creature_template SET spell1 = 50328, spell2 = 50341, spell3 = 50344, spell4 =  0, spell5 = 53112, VehicleId = 70 WHERE entry = 27692;
/*
UPDATE creature_template SET npcflag=1 WHERE entry IN (27657,27658,27659);
*/

-- Unstable Sphere
UPDATE creature_template SET minlevel = 80, maxlevel = 80, mindmg = 422, maxdmg = 586, faction_A = 16, faction_H = 16, attackpower = 642, dmg_multiplier = 1, minrangedmg = 345, maxrangedmg = 509, rangedattackpower = 103 WHERE entry = 28166;

-- Drakos the Interrogator
DELETE FROM `script_texts` WHERE npc_entry='27654';
INSERT INTO `script_texts` VALUES ('27654', -1578000, 'The prisoners shall not go free. The word of Malygos is law!','', '', '', '', '', '', '', '', 13594,1,0,0, 'drakos SAY_AGGRO');
INSERT INTO `script_texts` VALUES ('27654', -1578001, 'A fitting punishment!','', '', '', '', '', '', '', '', 13602, 1,0,0, 'drakos SAY_KILL_1');
INSERT INTO `script_texts` VALUES ('27654', -1578002, 'Sentence: executed!','', '', '', '', '', '', '', '', 13603,1,0,0, 'drakos SAY_KILL_2');
INSERT INTO `script_texts` VALUES ('27654', -1578003, 'Another casualty of war!','', '', '', '', '', '', '', '', 13604, 1,0,0, 'drakos SAY_KILL_3');
INSERT INTO `script_texts` VALUES ('27654', -1578004, 'The war... goes on.','', '', '', '', '', '', '', '', 13605,1,0,0,  'drakos SPELL_DEATH');
INSERT INTO `script_texts` VALUES ('27654', -1578005, 'It is too late to run!','', '', '', '', '', '', '', '', 13598, 1,0,0, 'drakos SAY_PULL_1');
INSERT INTO `script_texts` VALUES ('27654', -1578006, 'Gather \'round! ','', '', '', '', '', '', '', '', 13599, 1,0,0, 'drakos SAY_PULL_2');
INSERT INTO `script_texts` VALUES ('27654', -1578007, 'None shall escape!','', '', '', '', '', '', '', '', 13600, 1,0,0, 'drakos SAY_PULL_3');
INSERT INTO `script_texts` VALUES ('27654', -1578008, 'I condemn you to death!','', '', '', '', '', '', '', '', 13601,1,0,0,  'drakos SAY_PULL_4');
INSERT INTO `script_texts` VALUES ('27654', -1578009, 'Tremble, worms!','', '', '', '', '', '', '', '', 13595,1,0,0,  'drakos SAY_STOMP_1');
INSERT INTO `script_texts` VALUES ('27654', -1578010, 'I will crush you!', '', '', '', '', '', '', '', '', 13596, 1,0,0, 'drakos SAY_STOMP_2');
INSERT INTO `script_texts` VALUES ('27654', -1578011, 'Can you fly?', '', '', '', '', '', '', '', '', 13597, 1,0,0, 'drakos SAY_STOMP_3');

-- Mage-Lord Urom
DELETE FROM `script_texts` WHERE npc_entry= '27655';
INSERT INTO `script_texts` VALUES ('27655', -1578012, 'Poor blind fools!','', '', '', '', '', '', '', '', 13638,1,0,0, 'urom SAY_AGGRO');
INSERT INTO `script_texts` VALUES ('27655', -1578013, 'If only you understood!','', '', '', '', '', '', '', '', 13641,1,0,0, 'urom SAY_KILL_1');
INSERT INTO `script_texts` VALUES ('27655', -1578014, 'Now, do you see? DO YOU?!','', '', '', '', '', '', '', '', 13642,1,0,0, 'urom SAY_KILL_2');
INSERT INTO `script_texts` VALUES ('27655', -1578015, 'Unfortunate, but necessary.','', '', '', '', '', '', '', '', 13643,1,0,0, 'urom SAY_KILL_3');
INSERT INTO `script_texts` VALUES ('27655', -1578016, 'Everything I\'ve done... has been for Azeroth...','', '', '', '', '', '', '', '', 13644,1,0,0, 'urom SAY_DEATH');
INSERT INTO `script_texts` VALUES ('27655', -1578017, 'A taste... just a small taste... of the Spell-Weaver\'s power!','', '', '', '', '', '', '', '', 13639,1,0,0, 'urom SAY_EXPLOSION_1');
INSERT INTO `script_texts` VALUES ('27655', -1578018, 'So much unstable energy... but worth the risk to destroy you!','', '', '', '', '', '', '', '', 13640,1,0,0, 'urom SAY_EXPLOSION_2');
INSERT INTO `script_texts` VALUES ('27655', -1578019, 'What do we have here... those would defy the Spell-Weaver? Those without foresight or understanding. How could I make you see? Malygos is saving the world from itself! Bah! You are hardly worth my time!','', '', '', '', '', '', '', '', 13635,1,0,0, 'urom SAY_SUMMON_1');
INSERT INTO `script_texts` VALUES ('27655', -1578020, 'Clearly my pets failed. Perhaps another demonstration is in order.','', '', '', '', '', '', '', '', 13636,1,0,0, 'urom SAY_SUMMON_2');
INSERT INTO `script_texts` VALUES ('27655', -1578021, 'Still you fight. Still you cling to misguided principles. If you survive, you\'ll find me in the center ring.','', '', '', '', '', '', '', '', 13637,1,0,0, 'urom SAY_SUMMON_3');

-- Varos Cloudstrider
DELETE FROM `script_texts` WHERE npc_entry = '27447';
INSERT INTO `script_texts` VALUES ('27447', -1578022, 'There will be no mercy!','', '', '', '', '', '', '', '', 13649,1,0,0, 'varos SAY_AGGRO');
INSERT INTO `script_texts` VALUES ('27447', -1578023, 'You were warned.','', '', '', '', '', '', '', '', 13653,1,0,0, 'varos SAY_KILL_1');
INSERT INTO `script_texts` VALUES ('27447', -1578024, 'The Oculus is ours.','', '', '', '', '', '', '', '', 13654,1,0,0, 'varos SAY_KILL_2');
INSERT INTO `script_texts` VALUES ('27447', -1578025, 'They are... too strong! Underestimated their... fortitude.','', '', '', '', '', '', '', '', 13655,1,0,0, 'varos SAY_DEATH');
INSERT INTO `script_texts` VALUES ('27447', -1578026, 'Blast them! Destroy them!','', '', '', '', '', '', '', '', 13650,1,0,0, 'varos SAY_STRIKE_1');
INSERT INTO `script_texts` VALUES ('27447', -1578027, 'Take no prisoners! Attack!','', '', '', '', '', '', '', '', 13651,1,0,0, 'varos SAY_STRIKE_2');
INSERT INTO `script_texts` VALUES ('27447', -1578028, 'Strike now! Obliterate them!','', '', '', '', '', '', '', '', 13652,1,0,0, 'varos SAY_STRIKE_3');

-- Varos says when Drakos dies
INSERT INTO `script_texts` VALUES ('27447', -1578029, 'Intruders, your victory will be short-lived. I am Commander Varos Cloudstrider. My drakes control the skies and protest this conduit. I will see to it personally that the Oculus does not fall into your hands!','', '', '', '', '', '', '', '', 13648,1,0,0, 'varos SAY_SPAWN');


UPDATE gameobject_template SET flags=4 where entry IN (189986,193995);

-- 8276
-- Fix Arcane Beam npc
UPDATE creature SET phaseMask = 0 WHERE id = 28239;
-- Fix Centrifuge Core npc
UPDATE creature SET phaseMask = 1 WHERE id = 28183;
-- Fix fazione Arcane beam
UPDATE creature_template SET faction_A = 35, faction_H = 35 WHERE entry = 28239;
-- Planar Anomaly
UPDATE creature_template SET InhabitType = 5, modelid1 = 28107, modelid3 = 28107 WHERE entry = 30879;

-- Exit portal
UPDATE gameobject_template set data17 = 0 where entry = 193908;

-- 8380
-- Reputazione a Oculus
DELETE FROM `creature_onkill_reputation` WHERE creature_id IN (27654, 27656, 27655, 27447, 27633, 27636, 28236, 27638, 27635, 27641, 28276, 27650, 27645, 27651, 27642, 27649, 27648, 27647, 27653, 27644, 30879, 27640, 27639, 28153);
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES 
(27654, 1037, 1052, 7, 0, 250, 7, 0, 250, 1), -- Drakos the interrogator
(27656, 1037, 1052, 7, 0, 250, 7, 0, 250, 1), -- Ley Guardian Eregos
(27655, 1037, 1052, 7, 0, 250, 7, 0, 250, 1), -- Mage lord urom
(27447, 1037, 1052, 7, 0, 250, 7, 0, 250, 1), -- Varos cloudstrider
-- Trash
(27633, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27636, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(28236, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27638, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27635, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27641, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(28276, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27650, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27645, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27651, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27642, 1037, 1052, 7, 0, 5, 7, 0, 5, 1), 
(27649, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27648, 1037, 1052, 7, 0, 5, 7, 0, 5, 1), 
(27647, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27653, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27644, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(30879, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27640, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27639, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(28153, 1037, 1052, 7, 0, 5, 7, 0, 5, 1);

-- Arcane beam
DELETE FROM creature WHERE id = 28239;
UPDATE creature_template SET modelid3 = 0 WHERE entry = 30879;



-- 01_ruby_sanctum
-- Ruby Sanctum
-- Script Texts
DELETE FROM script_texts where `entry` <= -1752008 AND `entry` >= -1752016;
DELETE FROM script_texts where `entry` <= -1752001 AND `entry` >= -1752006;
DELETE FROM script_texts where `entry` <= -1752017 AND `entry` >= -1752036;

INSERT INTO script_texts (`entry`, `content_default`, `npc_entry`, `content_loc3`, `sound`, `type`, `language`) VALUES
('-1752008', 'Help! I am trapped within this tree! I require aid!', '0', '', '17490', '1', '0'),	 	
('-1752009', 'Thank you! I could not have held out for much longer.... A terrible thing has happened here.', '0', '', '17491', '1', '0'),	 	
('-1752010', 'We believed the Sanctum was well-fortified, but we were not prepared for the nature of this assault.', '0', '', '17492', '0', '0'),	 	
('-1752011', 'The Black dragonkin materialized from thin air, and set upon us before we could react.', '0', '', '17493', '0', '0'), 	
('-1752012', 'We did not stand a chance. As my brethren perished around me, I managed to retreat here and bar the entrance.', '0', '', '17494', '0', '0'), 	
('-1752013', 'They slaughtered us with cold efficiency, but the true focus of their interest seemed to be the eggs kept here in the Sanctum.', '0', '', '17495', '0', '0'),	
('-1752014', 'The commander of the forces on the ground here is a cruel brute named Zarithrian, but I fear there are greater powers at work.', '0', '', '17496', '0', '0'),	
('-1752015', 'In their initial assault, I caught a glimpse of their true leader, a fearsome full-grown twilight dragon.', '0', '', '17497', '0', '0'),	
('-1752016', 'I know not the extent of their plans, heroes, but I know this: They cannot be allowed to succeed!', '0', '', '17498', '0', '0'),

( -1752001, "Ah, the entertainment has arrived.", 0, "", 17520, 1, 0),
( -1752002, "Baltharus leaves no survivors!", 0, "", 17521, 1, 0),
( -1752003, "This world has enough heroes.", 0, "", 17522, 1, 0),
( -1752004, "I..Didn''t saw...that coming...", 0, "", 17523, 1, 0),
( -1752005, "Twice the pain and half the fun.", 0, "", 17524, 1, 0),
( -1752006, "Your power wanes, ancient one.... Soon you will join your friends.", 0, "", 17525, 1, 0),

( -1752017, "Alexstrasza has chosen capable allies... A pity that I must END YOU!", 0, "", 17512, 1, 0),
( -1752018, "You thought you stood a chance?", 0, "", 17513, 1, 0),
( -1752019, "It''s for the best.", 0, "", 17514, 1, 0),
( -1752020, "HALION! I...", 0, "", 17515, 1, 0),
( -1752021, "Turn them to ashes, minions!", 0, "", 17516, 1, 0),

( -1752022, "You will sssuffer for this intrusion!", 0, "", 17528, 1, 0),
( -1752023, "As it should be...", 0, "", 17529, 1, 0),
( -1752024, "Halion will be pleased", 0, "", 17530, 1, 0),
( -1752025, "Hhrr...Grr..", 0, "", 17531, 1, 0),
( -1752026, "Burn in the master's flame!", 0, "", 17532, 1, 0),

(-1752027, 'Insects! You''re too late. The Ruby Sanctum is lost.',NULL,NULL,17499,0,0),
(-1752028, 'Your world teeters on the brink of annihilation. You will ALL bear witness to the coming of a new age of DESTRUCTION!',NULL,NULL,17500,0,0),
(-1752029, 'Another hero falls.',NULL,NULL,17501,0,0),
(-1752030, 'Hahahahaha.',NULL,NULL,17502,0,0),
(-1752031, 'Relish this victory, mortals, for it will be your last! This world will burn with the master''s return!',NULL,NULL,17503,0,0),
(-1752032, 'Not good enough.',NULL,NULL,17504,0,0),
(-1752033, 'The heavens burn!',NULL,NULL,17505,0,0),
(-1752034, 'Beware the shadow!',NULL,NULL,17506,0,0),
(-1752035, 'You will find only suffering within the realm of twilight! Enter if you dare!',NULL,NULL,17507,0,0),
(-1752036, 'I am the light and the darkness! Cower, mortals, before the herald of Deathwing!',NULL,NULL,17508,0,0);

DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`='-74562') AND (`spell_effect`='74610');
DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`='-74792') AND (`spell_effect`='74800');
INSERT INTO spell_linked_spell VALUES (-74562, 74610, 0, 'Fiery Combustion removed -> Combustion');
INSERT INTO spell_linked_spell VALUES (-74792, 74800, 0, 'Soul Consumption removed -> Consumption');



-- 01_trial_of_the_champion
-- Moturas
DELETE FROM `vehicle_accessory` WHERE `entry` in (35491,33299,33418,33409,33300,33408,33301,33414,33297,33416,33298);
INSERT INTO `vehicle_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`) VALUES
(35491,35451,0,0, 'Black Knight'),
(33299,35323,0,1, 'Darkspear Raptor'),
(33418,35326,0,1, 'Silvermoon Hawkstrider'),
(33409,35314,0,1, 'Orgrimmar Wolf'),
(33300,35325,0,1, 'Thunder Bluff Kodo'),
(33408,35329,0,1, 'Ironforge Ram'),
(33301,35331,0,1, 'Gnomeregan Mechanostrider'),
(33414,35327,0,1, 'Forsaken Warhorse'),
(33297,35328,0,1, 'Stormwind Steed'),
(33416,35330,0,1, 'Exodar Elekk'),
(33298,35332,0,1, 'Darnassian Nightsaber');


-- Textos originales.
DELETE FROM `script_texts` WHERE `entry` <= -1999926 and `entry` >= -1999956;
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1999926, 'Coming out of the gate Grand Champions other faction.  ' ,0,0,0,1, 'SAY_START' ),
(0,-1999927, 'Good work! You can get your award from Crusader\'s Coliseum chest!.  ' ,0,1,0,1, 'Win' ),
(0,-1999928, 'You spoiled my grand entrance. Rat.' ,16256,1,0,5, 'SAY_AGGRO' ),
(0,-1999929, 'Did you honestly think an agent if the Kich King would be bested on the field of your pathetic little tournament?' ,16257,1,0,5, 'SAY_AGGRO_1' ),
(0,-1999930, 'I have come to finish my task ' ,16258,1,0,5, 'SAY_AGGRO_2' ),
(0,-1999931, 'This farce ends here!' ,16259,1,0,5, 'SAY_AGGRO_3' ),
(0,-1999932, '[Zombie]Brains.... .... ....' ,0,1,0,5, 'SAY_SLAY' ),
(0,-1999933, 'My roting flash was just getting in the way!' ,16262,1,0,5, 'SAY_DEATH_1' ),
(0,-1999934, 'I have no need for bones to best you!' ,16263,1,0,5, 'SAY_DEATH_2' ),
(0,-1999935, 'No! I must not fail...again...' ,16264,1,0,5, 'SAY_DEATH_3' ),
(0,-1999936, 'What\'s that. up near the rafters ?' ,0,1,0,5, 'detected' ),
(0,-1999937, 'Please change your weapon! Next battle will be start now!' ,0,3,0,5, 'nx' ),
(0,-1999939, 'Excellent work!' ,0,1,0,1, 'work' ),
(0,-1999940, 'Coming out of the gate Crusader\'s Coliseum Champion.' ,0,0,0,1, 'SAY_START3' ),
(0,-1999941, 'Excellent work! You are win Argent champion!' ,0,3,0,0, 'win' ),
(0,-1999942, 'The Sunreavers are proud to present their representatives in this trial by combat.' ,0,0,0,1, 'an1' ),
(0,-1999943, 'Welcome, champions. Today, before the eyes of your leeders and peers, you will prove youselves worthy combatants.' ,0,0,0,1, 'an2' ),
(0,-1999944, 'Fight well, Horde! Lok\'tar Ogar!' ,0,1,0,5, 'Thrall' ),
(0,-1999945, 'Finally, a fight worth watching.' ,0,1,0,5, 'Garrosh' ),
(0,-1999946, 'I did not come here to watch animals tear at each other senselessly, Tirion' ,0,1,0,5, 'King' ),
(0,-1999947, 'You will first be facing three of the Grand Champions of the Tournament! These fierce contenders have beaten out all others to reach the pinnacle of skill in the joust.' ,0,1,0,5, 'Hightlord' ),
(0,-1999948, 'Will tought! You next challenge comes from the Crusade\'s own ranks. You will be tested against their consederable prowess.' ,0,1,0,5, 'Hightlord2' ),
(0,-1999949, 'You may begin!' ,0,0,0,5, 'text' ),
(0,-1999950, 'Well, then. Let us begin.' ,0,1,0,5, 'pal agro' ),
(0,-1999951, 'Take this time to consider your past deeds.' ,16248,1,0,5, 'palsum' ),
(0,-1999952, 'What is the meaning of this?' ,0,1,0,5, 'dk_hightlord' ),
(0,-1999953, 'No...I\'m still too young' ,0,1,0,5, 'die' ),
(0,-1999954, 'Excellent work! You are win Argent champion!' ,0,3,0,0, 'win' );


-- actualización nueva de todos los npc relacionado a prueba del campeón
-- Update mob's stats
-- Memory's Stats
-- Health, mana, vehicle id, etc...
-- Equipment
-- Faction for Vehicle

DELETE FROM `creature_template` WHERE `entry` IN 
(33297, 33298, 33299, 33300, 33301, 33408, 33409, 33414, 33416, 33418, 34657, 34658, 34701, 34702, 34703, 34705, 34928, 34942, 35028, 35029, 
35030, 35031, 35032, 35033, 35034, 35035, 35036, 35037, 35038, 35039, 35040, 35041, 35042, 35043, 35044, 35045, 35046, 35047, 35048, 35049, 
35050, 35051, 35052, 35119, 35305, 35306, 0000, 35308, 0000, 35310, 35314, 35323, 35325, 35326, 35327, 35328, 35329, 35330, 35331, 35332, 
35451, 35490, 35517, 35518, 35519, 35520, 35521, 35522, 35523, 35524, 35525, 35527, 35528, 35529, 35530, 35531, 35532, 35533, 35534, 35535, 
35536, 35537, 35538, 35539, 35541, 35542, 35543, 35544, 35545, 35564, 35568, 35569, 35570, 35571, 35572, 35590, 35617, 35633, 35634, 35635, 
35636, 35637, 35638, 35640, 35641, 35644, 35717, 35768, 36082, 36083, 36084, 36085, 36086, 36087, 36088, 36089, 36090, 36091, 36558);


INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES 
('33297','0','0','0','0','0','28912','0','0','0','Stormwind Steed','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','1'),
('33298','0','0','0','0','0','29256','0','0','0','Darnassian Nightsaber','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','11723'),
('33299','0','0','0','0','0','29261','0','0','0','Darkspear Raptor','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','11159'),
('33300','0','0','0','0','0','29259','0','0','0','Thunder Bluff Kodo','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','11159'),
('33301','0','0','0','0','0','28571','0','0','0','Gnomeregan Mechanostrider','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','1'),
('33408','0','0','0','0','0','29258','0','0','0','Ironforge Ram','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','1'),
('33409','0','0','0','0','0','29260','0','0','0','Orgrimmar Wolf','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','11159'),
('33414','0','0','0','0','0','29257','0','0','0','Forsaken Warhorse','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','11159'),
('33416','0','0','0','0','0','29255','0','0','0','Exodar Elekk','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','11403'),
('33418','0','0','0','0','0','29262','0','0','0','Silvermoon Hawkstrider','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','1'),
('34657','36086','0','0','0','0','28735','0','28735','0','Jaelyne Evensong','Grand Champion of Darnassus','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','10.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68340','66083','66081','66079','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2095','617297499','0','boss_hunter_toc5','1'),
('34658','0','0','0','0','0','9991','0','0','0','Jaelyne Evensong\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('34701','36083','0','0','0','0','28736','0','28736','0','Colosos','Grand Champion of the Exodar','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','10.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','67529','67530','67528','67534','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2096','617297499','0','boss_shaman_toc5','1'),
('34702','36082','0','0','0','0','28586','0','28586','0','Ambrose Boltspark','Grand Champion of Gnomeregan','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','10.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','64','0','0','0','0','0','0','0','0','0','66044','66042','66045','66043','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','0','617297499','0','boss_mage_toc5','1'),
('34703','36087','0','0','0','0','28564','0','28564','0','Lana Stouthammer','Grand Champion of Ironforge','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','10.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','67709','67706','67701','0','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','441','1','2093','617297499','0','boss_rouge_toc5','1'),
('34705','36088','0','0','0','0','28560','0','28560','0','Marshal Jacob Alerius','Grand Champion of Stormwind','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','10.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2092','617297499','0','boss_warrior_toc5','1'),
('34928','35517','0','0','0','0','29490','0','29490','0','Argent Confessor Paletress','','','0','82','82','2','14','14','0','1','1','1','1','452','678','0','170','14.5','2000','2000','2','0','0','0','0','0','0','0','362','542','136','7','104','0','0','0','0','0','0','0','0','0','66546','66536','66515','66537','0','0','0','0','0','0','0','0','','0','3','8','20','1','0','0','0','0','0','0','0','151','1','235','805257215','0','boss_paletress','1'),
('34942','35531','0','0','0','0','29525','0','29525','0','Memory of Hogger','','','0','82','82','2','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35028','35541','0','0','0','0','29536','0','29536','0','Memory of VanCleef','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35029','35538','0','0','0','0','29556','0','29556','0','Memory of Mutanus','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35030','35530','0','0','0','0','29537','0','29537','0','Memory of Herod','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35031','35536','0','0','0','0','29562','0','29562','0','Memory of Lucifron','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','66619','66552','0','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35032','0','0','0','0','0','14992','0','14992','0','Memory of Thunderaan','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35033','35521','0','0','0','0','14367','0','14367','0','Memory of Chromaggus','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','2','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35034','35528','0','0','0','0','29540','0','29540','0','Memory of Hakkar','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35035','0','0','0','0','0','29888','0','0','0','Barrett Ramsey','Argent Coliseum Master','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','768','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','11723'),
('35036','35543','0','0','0','0','29541','0','29541','0','Memory of Vek\'nilash','','','0','82','82','2','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35037','35535','0','0','0','0','29542','0','29542','0','Memory of Kalithresh','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66552','66620','66619','0','0','0','0','0','0','0','0','0','','0','3','29.2313','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35038','35537','0','0','0','0','29543','0','29543','0','Memory of Malchezaar','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','3','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35039','35527','0','0','0','0','18698','0','18698','0','Memory of Gruul','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35040','35542','0','0','0','0','29545','0','0','0','Memory of Vashj','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35041','35520','0','0','0','0','29546','0','29546','0','Memory of Archimonde','','','0','82','82','2','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','3','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35042','35533','0','0','0','0','29547','0','29547','0','Memory of Illidan','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','3','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35043','35523','0','0','0','0','18699','0','18699','0','Memory of Delrissa','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35044','35525','0','0','0','0','23428','0','23428','0','Memory of Entropius','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35045','35534','0','0','0','0','29558','0','29558','0','Memory of Ingvar','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','6','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35046','35522','0','0','0','0','29549','0','29549','0','Memory of Cyanigosa','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','2','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35047','35524','0','0','0','0','26644','0','26644','0','Memory of Eck','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35048','35539','0','0','0','0','21401','0','21401','0','Memory of Onyxia','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','2','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35049','35529','0','0','0','0','29557','0','29557','0','Memory of Heigan','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','6','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35050','35532','0','0','0','0','29185','0','29185','0','Memory of Ignis','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','5','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35051','35544','0','0','0','0','28548','0','28548','0','Memory of Vezax','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35052','35519','0','0','0','0','29553','0','29553','0','Memory of Algalon','','','0','82','82','2','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','4','72','0','0','0','0','0','0','0','0','0','67679','67678','67677','0','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35119','35518','0','0','0','0','29616','0','29616','0','Eadric the Pure','Grand Champion of the Argent Crusade','','0','82','82','2','14','14','0','1','1','1','1','452','678','0','170','14.5','2000','2000','2','0','0','0','0','0','0','0','362','542','136','7','104','0','0','0','0','0','0','0','0','0','66865','66863','66867','66935','0','0','0','0','0','0','0','0','','0','3','42.5','20','1','0','0','0','0','0','0','0','151','1','834','805257215','0','boss_eadric','1'),
('35305','35306','0','0','0','0','29758','29759','29758','0','Argent Monk','','','0','80','80','2','14','14','0','1','1','1','1','420','630','0','158','8','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','8','0','0','0','0','0','0','0','0','0','67251','67255','67233','67235','0','0','0','0','0','0','7661','7661','','0','3','8','1','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_argent_soldier','1'),
('35306','0','0','0','0','0','29758','29759','29758','0','Argent Monk','','','0','80','80','0','14','14','0','1','1','1','1','420','630','0','158','12','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','8','0','0','0','0','0','0','0','0','0','67251','67255','67233','67235','0','0','0','0','0','0','7661','7661','','0','3','23.5867','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','1'),
-- ('35307','35308','0','0','0','0','29760','29761','29760','0','Argent Priestess','','','0','80','80','2','14','14','0','1','1','1','1','420','630','0','158','5.5','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','8','35307','0','0','0','0','0','0','0','0','67194','36176','67289','67229','0','0','0','0','0','0','7653','7653','','0','3','8','8','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_argent_soldier','1'),
('35308','0','0','0','0','0','29760','29761','29760','0','Argent Priestess','','','0','80','80','2','14','14','0','1','1','1','1','420','630','0','158','8.5','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','8','0','0','0','0','0','0','0','0','0','67194','36176','67289','67229','0','0','0','0','0','0','7653','7653','','0','3','10','8','1','0','0','0','0','0','0','0','0','1','0','0','0','','1'),
-- ('35309','35310','0','0','0','0','29762','29763','29762','0','Argent Lightwielder','','','0','80','80','2','14','14','0','1','1','1','1','420','630','0','158','8.4','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','8','35309','0','0','0','0','0','0','0','0','67247','67290','15284','67237','0','0','0','0','0','0','7651','7651','','0','3','8','5','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_argent_soldier','1'),
('35310','0','0','0','0','0','29762','29763','29762','0','Argent Lightwielder','','','0','80','80','2','14','14','0','1','1','1','1','420','630','0','158','12.6','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','8','0','0','0','0','0','0','0','0','0','67247','67290','15284','67237','0','0','0','0','0','0','7651','7651','','0','3','8','5','1','0','0','0','0','0','0','0','0','1','0','0','0','','1'),
('35314','0','0','0','0','0','29090','0','0','0','Orgrimmar Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35323','0','0','0','0','0','28702','0','0','0','Sen\'jin Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35325','33471','0','0','0','0','28864','0','0','0','Thunder Bluff Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','35325','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35326','0','0','0','0','0','28862','0','0','0','Silvermoon Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','35305','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35327','0','0','0','0','0','28865','0','0','0','Undercity Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35328','0','0','0','0','0','28863','0','0','0','Stormwind Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35329','0','0','0','0','0','28860','0','0','0','Ironforge Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35330','0','0','0','0','0','28858','0','0','0','Exodar Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35331','0','0','0','0','0','28859','0','0','0','Gnomeregan Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35332','0','0','0','0','0','28857','0','0','0','Darnassus Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35451','35490','0','0','0','0','29837','0','29837','0','The Black Knight','','','0','80','80','2','14','14','0','1','1','1','1','420','630','0','158','11.8','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','35451','0','0','0','0','0','0','0','0','67724','67745','67718','67725','0','0','0','0','0','0','9530','9530','','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','0','805257215','0','boss_black_knight','1'),
('35490','0','0','0','0','0','29837','0','29837','0','The Black Knight','','','0','80','80','0','14','14','0','1','1','1','1','420','630','0','158','17.6','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','35490','0','0','0','0','0','0','0','0','67884','68306','67881','67883','0','0','0','0','0','0','10700','10700','','0','3','37.7387','1','1','0','0','0','0','0','0','0','0','1','0','805257215','1','','1'),
('35517','0','0','0','0','0','29490','0','29490','0','Argent Confessor Paletress','','','0','82','82','2','14','14','0','1','1','1','1','452','678','0','170','22.4','2000','2000','2','0','0','0','0','0','0','0','362','542','136','7','104','0','0','0','0','0','0','0','0','0','66546','67674','66515','67675','0','0','0','0','0','0','0','0','','0','3','8','20','1','0','0','0','0','0','0','0','151','1','235','805257215','1','','1'),
('35518','0','0','0','0','0','29616','0','29616','0','Eadric the Pure','Grand Champion of the Argent Crusade','','0','82','82','2','14','14','0','1','1','1','1','452','678','0','170','22.4','2000','2000','2','0','0','0','0','0','0','0','362','542','136','7','104','0','0','0','0','0','0','0','0','0','66865','66863','66867','66935','0','0','0','0','0','0','0','0','','0','3','42.5','20','1','0','0','0','0','0','0','0','151','1','834','805257215','1','','1'),
('35519','0','0','0','0','0','29553','0','29553','0','Memory of Algalon','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','4','72','0','0','0','0','0','0','0','0','0','67679','67678','67677','0','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35520','0','0','0','0','0','29546','0','29546','0','Memory of Archimonde','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','3','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35521','0','0','0','0','0','14367','0','14367','0','Memory of Chromaggus','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','2','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35522','0','0','0','0','0','29549','0','29549','0','Memory of Cyanigosa','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','2','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35523','0','0','0','0','0','18699','0','18699','0','Memory of Delrissa','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35524','0','0','0','0','0','26644','0','26644','0','Memory of Eck','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35525','0','0','0','0','0','23428','0','23428','0','Memory of Entropius','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35527','0','0','0','0','0','18698','0','18698','0','Memory of Gruul','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35528','0','0','0','0','0','29540','0','29540','0','Memory of Hakkar','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35529','0','0','0','0','0','29557','0','29557','0','Memory of Heigan','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','6','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35530','0','0','0','0','0','29537','0','29537','0','Memory of Herod','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35531','0','0','0','0','0','29525','0','29525','0','Memory of Hogger','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35532','0','0','0','0','0','29185','0','29185','0','Memory of Ignis','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','5','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35533','0','0','0','0','0','29547','0','29547','0','Memory of Illidan','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','3','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35534','0','0','0','0','0','29558','0','29558','0','Memory of Ingvar','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','6','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35535','0','0','0','0','0','29542','0','29542','0','Memory of Kalithresh','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66552','66620','66619','0','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35536','0','0','0','0','0','29562','0','29562','0','Memory of Lucifron','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','66619','66552','0','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35537','0','0','0','0','0','29543','0','29543','0','Memory of Malchezaar','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','3','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35538','0','0','0','0','0','29556','0','29556','0','Memory of Mutanus','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35539','0','0','0','0','0','21401','0','21401','0','Memory of Onyxia','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','2','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35541','0','0','0','0','0','29536','0','29536','0','Memory of VanCleef','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35542','0','0','0','0','0','29545','0','29545','0','Memory of Vashj','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35543','0','0','0','0','0','29541','0','29541','0','Memory of Vek\'nilash','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35544','0','0','0','0','0','28548','0','28548','0','Memory of Vezax','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35545','0','0','0','0','0','25528','0','25528','0','Risen Jaeren Sunsworn','Black Knight\'s Minion','','0','80','80','2','14','14','0','1','1','1','0','420','630','0','158','1.4','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','0','0','0','0','0','0','0','0','0','67774','67879','67729','67886','0','0','0','0','0','0','0','0','','0','3','2.5','1','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_risen_ghoul','1'),
('35564','35568','0','0','0','0','25528','0','25528','0','Risen Arelas Brightstar','Black Knight\'s Minion','','0','80','80','2','14','14','0','1','1','1','0','420','630','0','158','1.4','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','0','0','0','0','0','0','0','0','0','67774','67879','67729','67886','0','0','0','0','0','0','0','0','','0','3','2.5','1','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_risen_ghoul','1'),
('35568','0','0','0','0','0','25528','0','25528','0','Risen Arelas Brightstar','Black Knight\'s Minion','','0','80','80','0','14','14','0','1','1','1','0','420','630','0','158','1.4','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','0','0','0','0','0','0','0','0','0','67879','67886','67880','0','0','0','0','0','0','0','0','0','','0','3','9.43467','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','1'),
('35569','36085','0','0','0','0','28637','0','28637','0','Eressea Dawnsinger','Grand Champion of Silvermoon','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','10.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','66044','66042','66045','66043','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2021','617297499','0','boss_mage_toc5','1'),
('35570','36091','0','0','0','0','28588','0','28588','0','Zul\'tore','Grand Champion of Sen\'jin','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','10.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68340','66083','66081','66079','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2019','617297499','0','boss_hunter_toc5','1'),
('35571','36090','0','0','0','0','28597','0','28597','0','Runok Wildmane','Grand Champion of the Thunder Bluff','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','10.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','67529','67530','67528','67534','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2025','617297499','0','boss_shaman_toc5','1'),
('35572','36089','0','0','0','0','28587','0','28587','0','Mokra the Skullcrusher','Grand Champion of Orgrimmar','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','10.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','441','1','2018','617297499','0','boss_warrior_toc5','1'),
('35590','35717','0','0','0','0','24996','24999','24997','0','Risen Champion','Black Knight\'s Minion','','0','80','80','2','14','14','0','1','1','1','0','420','630','0','158','1','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','0','0','0','0','0','0','0','0','0','67774','67879','67729','67886','0','0','0','0','0','0','0','0','','0','3','1.5','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','1'),
('35617','36084','0','0','0','0','28589','0','28589','0','Deathstalker Visceri','Grand Champion of Undercity','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','10.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','67709','67706','67701','0','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2020','617297499','0','boss_rouge_toc5','1'),
('35633','0','0','0','0','0','28571','0','0','0','Ambrose Boltspark\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35634','0','0','0','0','0','10718','0','0','0','Deathstalker Visceri\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35635','0','0','0','0','0','28607','0','0','0','Eressea Dawnsinger\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35636','0','0','0','0','0','2787','0','0','0','Lana Stouthammer\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35637','0','0','0','0','0','29284','0','0','0','Marshal Jacob Alerius\' Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35638','0','0','0','0','0','29879','0','0','0','Mokra the Skullcrusher\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35640','0','0','0','0','0','29880','0','0','0','Runok Wildmane\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35641','0','0','0','0','0','29261','0','0','0','Zul\'tore\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35644','0','0','0','0','0','28918','0','0','0','Argent Warhorse','','vehichleCursor','0','80','80','2','35','35','0','1','2','1','0','10000','20000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','10','0','0','0','0','0','0','0','0','0','0','62544','62575','63010','66482','0','0','0','0','0','486','0','0','','0','3','40','1','1','0','0','0','0','0','0','0','157','1','0','0','0','','11723'),
('35717','0','0','0','0','0','24996','24999','24997','0','Risen Champion','Black Knight\'s Minion','','0','80','80','0','14','14','0','1','1','1','0','420','630','0','158','1.4','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','0','0','0','0','0','0','0','0','0','67774','67879','67729','67886','0','0','0','0','0','0','0','0','','0','3','7.076','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','1'),
('35768','0','0','0','0','0','29255','0','0','0','Colosos\' Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('36082','0','0','0','0','0','28586','0','28586','0','Ambrose Boltspark','Grand Champion of Gnomeregan','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','15.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','64','0','0','0','0','0','0','0','0','0','68312','68310','66045','68311','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','0','617297499','1','','1'),
('36083','0','0','0','0','0','28736','0','28736','0','Colosos','Grand Champion of the Exodar','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','17','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68319','67530','68318','67534','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2096','617297499','1','','1'),
('36084','0','0','0','0','0','28589','0','28589','0','Deathstalker Visceri','Grand Champion of Undercity','','0','80','80','0','1801','1801','0','1','1','1','1','420','630','0','158','15.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','67709','67706','67701','0','0','0','0','0','0','0','0','0','','0','3','35.38','20','1','0','0','0','0','0','0','0','0','1','2020','617297499','1','','1'),
('36085','0','0','0','0','0','28637','0','28637','0','Eressea Dawnsinger','Grand Champion of Silvermoon','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','15.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68312','68310','66045','68311','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2021','617297499','1','','1'),
('36086','0','0','0','0','0','28735','0','28735','0','Jaelyne Evensong','Grand Champion of Darnassus','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','15.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68340','66083','66081','66079','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2095','617297499','1','','1'),
('36087','0','0','0','0','0','28564','0','28564','0','Lana Stouthammer','Grand Champion of Ironforge','','0','80','80','0','1802','1802','0','1','1','1','1','420','630','0','158','15.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','35.38','20','1','0','0','0','0','0','0','0','441','1','2093','617297499','1','','1'),
('36088','0','0','0','0','0','28560','0','28560','0','Marshal Jacob Alerius','Grand Champion of Stormwind','','0','80','80','0','1802','1802','0','1','1','1','1','420','630','0','158','15.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','35.38','20','1','0','0','0','0','0','0','0','0','1','2092','617297499','1','','1'),
('36089','0','0','0','0','0','28587','0','28587','0','Mokra the Skullcrusher','Grand Champion of Orgrimmar','','0','80','80','0','1801','1801','0','1','1','1','1','420','630','0','158','15.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','35.38','20','1','0','0','0','0','0','0','0','441','1','2018','617297499','1','','1'),
('36090','0','0','0','0','0','28597','0','28597','0','Runok Wildmane','Grand Champion of the Thunder Bluff','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','15.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68319','67530','67528','67534','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2025','617297499','1','','1'),
('36091','0','0','0','0','0','28588','0','28588','0','Zul\'tore','Grand Champion of Sen\'jin','','0','80','80','0','1801','1801','0','1','1','1','1','420','630','0','158','15.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68340','66083','66081','66079','0','0','0','0','0','0','0','0','','0','3','35.38','20','1','0','0','0','0','0','0','0','0','1','2019','617297499','1','','1'),
('36558','0','0','0','0','0','29283','0','0','0','Argent Battleworg','','vehichleCursor','0','80','80','2','35','35','0','1','2','1','0','10000','20000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','10','0','0','0','0','0','0','0','0','0','0','62544','62575','63010','66482','0','0','0','0','0','486','0','0','','0','3','40','1','1','0','0','0','0','0','0','0','157','1','0','0','0','','11723');

-- Anuncios al comienzo del evento.
DELETE FROM `creature_template` WHERE `entry` in (35591,35592);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES 
(35591, 0, 0, 0, 0, 0, 29894, 0, 0, 0, 'Jaeren Sunsworn', '', '', 0, 75, 75, 2, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 2000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_anstart'),
(35592, 0, 0, 0, 0, 0, 29893, 0, 0, 0, 'Arelas Brightstar', '', '', 0, 75, 75, 2, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_anstart');


-- Fountain of Light
DELETE FROM `creature_template` WHERE `entry`=35311;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES 
(35311, 0, 0, 0, 0, 0, 27769, 0, 0, 0, 'Fountain of Light', '', '', 0, 79, 80, 0, 14, 14, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 1024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');


-- Grifo esquelético del Caballero Negro http://es.wowhead.com/npc=35491
DELETE FROM `creature_template` WHERE `entry`=35491;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES 
(35491, 0, 0, 0, 0, 0, 29842, 0, 0, 0, 'Black Knight\'s Skeletal Gryphon', '', '', 0, 80, 80, 2, 35, 35, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 33554432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1048576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 486, 0, 0, '', 0, 4, 15, 1, 0, 0, 0, 0, 0, 0, 0, 164, 1, 0, 0, 0, 'npc_black_knight_skeletal_gryphon');
DELETE FROM `script_waypoint` WHERE `entry`=35491;
INSERT INTO `script_waypoint` VALUES
(35491,1,781.513062, 657.989624, 466.821472,0,''),
(35491,2,759.004639, 665.142029, 462.540771,0,''),
(35491,3,732.936646, 657.163879, 452.678284,0,''),
(35491,4,717.490967, 646.008545, 440.136902,0,''),
(35491,5,707.570129, 628.978455, 431.128632,0,''),
(35491,6,705.164063, 603.628418, 422.956635,0,''),
(35491,7,716.350891, 588.489746, 420.801666,0,''),
(35491,8,741.702881, 580.167725, 420.523010,0,''),
(35491,9,761.634033, 586.382690, 422.206207,0,''),
(35491,10,775.982666, 601.991943, 423.606079,0,''),
(35491,11,769.051025, 624.686157, 420.035126,0,''),
(35491,12,756.582214, 631.692322, 412.529785,0,''),
(35491,13,744.841,634.505,411.575,0,'');
-- Grifo esquelético del Caballero Negro antes de comenzar la batalla
DELETE FROM `creature_template` WHERE `entry` in (35492);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES 
(35492, 0, 0, 0, 0, 0, 29842, 0, 0, 0, 'Black Knight\'s Skeletal Gryphon', '', '', 0, 80, 80, 2, 35, 35, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 33554432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1048576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 486, 0, 0, '', 0, 3, 15, 1, 0, 0, 0, 0, 0, 0, 0, 164, 1, 0, 0, 0, 'npc_gr');
DELETE FROM `script_waypoint` WHERE `entry`=35492;
INSERT INTO `script_waypoint` VALUES
(35492,1,741.067078, 634.471558, 411.569366,0,''),
(35492,2,735.726196, 639.247498, 414.725555,0,''),
(35492,3,730.187256, 653.250977, 418.913269,0,''),
(35492,4,734.517700, 666.071350, 426.259247,0,''),
(35492,5,739.638489, 675.339417, 438.226776,0,''),
(35492,6,741.833740, 698.797302, 456.986328,0,''),
(35492,7,734.647339, 711.084778, 467.165314,0,''),
(35492,8,715.388489, 723.820862, 470.333588,0,''),
(35492,9,687.178711, 730.140503, 470.569336,0,'');



-- Spawn Announcer in normal/heroic mode
DELETE FROM `creature` WHERE `id`=35004;
DELETE FROM `creature` WHERE `guid`=130961;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(130961, 35004, 650, 3, 1, 0, 0, 746.626, 618.54, 411.09, 4.63158, 86400, 0, 0, 10635, 0, 0, 0);

-- Daño
UPDATE `creature_template` SET `dmg_multiplier`= (dmg_multiplier*1.40) WHERE `entry` IN (SELECT `id` FROM creature WHERE `map`=650);
-- El Caballero Negro 35451 11.8 - 35490 17.6p
UPDATE `creature_template` SET `dmg_multiplier`= (dmg_multiplier*2) WHERE `entry`= 35451;
UPDATE `creature_template` SET `dmg_multiplier`= (dmg_multiplier*2) WHERE `entry`= 35490;

-- CREATURES SPAWN TRIAL OF CHAMPION MAP 650
DELETE FROM `creature` WHERE `map`=650;
SET @GUID := 500000;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
(@GUID,36558,650,3,1,0,0,726.826,661.201,412.472,4.66003,86400,0,0,1,0,0,0),
(@GUID+1,36558,650,3,1,0,0,716.665,573.495,412.475,0.977384,86400,0,0,1,0,0,0),
(@GUID+2,36558,650,3,1,0,0,705.497,583.944,412.476,0.698132,86400,0,0,1,0,0,0),
(@GUID+3,36558,650,3,1,0,0,770.486,571.552,412.475,2.05949,86400,0,0,1,0,0,0),
(@GUID+4,36558,650,3,1,0,0,717.443,660.646,412.467,4.92183,86400,0,0,1,0,0,0),
(@GUID+5,36558,650,3,1,0,0,700.531,591.927,412.475,0.523599,86400,0,0,1,0,0,0),
(@GUID+6,36558,650,3,1,0,0,790.177,589.059,412.475,2.56563,86400,0,0,1,0,0,0),
(@GUID+7,36558,650,3,1,0,0,702.165,647.267,412.475,5.68977,86400,0,0,1,0,0,0),
(@GUID+8,36558,650,3,1,0,0,773.097,660.733,412.467,4.45059,86400,0,0,1,0,0,0),
(@GUID+9,36558,650,3,1,0,0,793.052,642.851,412.474,3.63029,86400,0,0,1,0,0,0),
(@GUID+10,36558,650,3,1,0,0,778.741,576.049,412.476,2.23402,86400,0,0,1,0,0,0),
(@GUID+11,36558,650,3,1,0,0,788.016,650.788,412.475,3.80482,86400,0,0,1,0,0,0),
(@GUID+12,35644,650,3,1,0,0,704.943,651.33,412.475,5.60251,86400,0,0,1,0,0,0),
(@GUID+13,35644,650,3,1,0,0,774.898,573.736,412.475,2.14675,86400,0,0,1,0,0,0),
(@GUID+14,35644,650,3,1,0,0,699.943,643.37,412.474,5.77704,86400,0,0,1,0,0,0),
(@GUID+15,35644,650,3,1,0,0,712.594,576.26,412.476,0.890118,86400,0,0,1,0,0,0),
(@GUID+16,35644,650,3,1,0,0,793.009,592.667,412.475,2.6529,86400,0,0,1,0,0,0),
(@GUID+17,35644,650,3,1,0,0,702.967,587.649,412.475,0.610865,86400,0,0,1,0,0,0),
(@GUID+18,35644,650,3,1,0,0,768.255,661.606,412.47,4.55531,86400,0,0,1,0,0,0),
(@GUID+19,35644,650,3,1,0,0,720.569,571.285,412.475,1.06465,86400,0,0,1,0,0,0),
(@GUID+20,35644,650,3,1,0,0,787.439,584.969,412.476,2.47837,86400,0,0,1,0,0,0),
(@GUID+21,35644,650,3,1,0,0,722.363,660.745,412.468,4.83456,86400,0,0,1,0,0,0),
(@GUID+22,35644,650,3,1,0,0,790.49,646.533,412.474,3.71755,86400,0,0,1,0,0,0),
(@GUID+23,35644,650,3,1,0,0,777.564,660.3,412.467,4.34587,86400,0,0,1,0,0,0),
(@GUID+24,35591,650,3,1,0,0,746.626,618.54,411.09,4.63158,86400,0,0,10635,0,0,0),
(@GUID+25,35016,650,3,1,0,0,702.274,638.76,412.47,0,120,0,0,1,0,0,0),
(@GUID+26,35016,650,3,1,0,0,697.285,618.253,412.476,0,120,0,0,1,0,0,0),
(@GUID+27,35016,650,3,1,0,0,714.486,581.722,412.476,0,120,0,0,1,0,0,0),
(@GUID+28,35016,650,3,1,0,0,703.884,596.601,412.474,0,120,0,0,1,0,0,0),
(@GUID+29,35016,650,3,1,0,0,712.413,653.931,412.474,0,120,0,0,1,0,0,0),
(@GUID+30,34977,650,3,1,0,0,733.809,545.215,442.075,1.41372,120,0,0,1,0,0,0),
(@GUID+31,34977,650,3,1,0,0,730.998,552.719,438.812,1.3439,120,0,0,1,0,0,0),
(@GUID+32,34977,650,3,1,0,0,734.411,560.158,435.501,1.37881,120,0,0,1,0,0,0),
(@GUID+33,34977,650,3,1,0,0,726.38,557.151,436.978,1.25664,120,0,0,1,0,0,0),
(@GUID+34,34979,650,3,1,0,0,709.576,570.106,435.504,0.942478,120,0,0,1,0,0,0),
(@GUID+35,34979,650,3,1,0,0,712.873,563.172,436.967,1.02974,120,0,0,1,0,0,0),
(@GUID+36,34979,650,3,1,0,0,714.34,553.708,440.223,1.11701,120,0,0,1,0,0,0),
(@GUID+37,34979,650,3,1,0,0,700.273,559.224,442.08,0.925025,120,0,0,1,0,0,0),
(@GUID+38,34966,650,3,1,0,0,718.917,564.078,435.504,1.11701,120,0,0,1,0,0,0),
(@GUID+39,34966,650,3,1,0,0,721.971,548.191,442.072,1.23918,120,0,0,1,0,0,0),
(@GUID+40,34966,650,3,1,0,0,718.405,555.92,438.803,1.15192,120,0,0,1,0,0,0),
(@GUID+41,34966,650,3,1,0,0,725.661,560.835,435.503,1.23918,120,0,0,1,0,0,0),
(@GUID+42,34858,650,3,1,0,0,697.241,583.858,435.504,0.628319,120,0,0,1,0,0,0),
(@GUID+43,34858,650,3,1,0,0,689.635,582.823,438.819,0.558505,120,0,0,1,0,0,0),
(@GUID+44,34858,650,3,1,0,0,696.26,577.507,436.966,0.698132,120,0,0,1,0,0,0),
(@GUID+45,34858,650,3,1,0,0,682.856,586.2,440.243,0.471239,120,0,0,1,0,0,0),
(@GUID+46,34858,650,3,1,0,0,688.012,573.852,442.074,0.663225,120,0,0,1,0,0,0),
(@GUID+47,34860,650,3,1,0,0,699.005,654.894,435.504,5.53269,120,0,0,1,0,0,0),
(@GUID+48,34860,650,3,1,0,0,693.635,654.892,436.963,5.60251,120,0,0,1,0,0,0),
(@GUID+49,34860,650,3,1,0,0,690.486,661.661,440.209,5.55015,120,0,0,1,0,0,0),
(@GUID+50,34860,650,3,1,0,0,684.069,656.681,442.074,5.68977,120,0,0,1,0,0,0),
(@GUID+52,34860,650,3,1,0,0,686.866,650.837,438.779,5.75959,120,0,0,1,0,0,0),
(@GUID+53,34861,650,3,1,0,0,677.17,640.74,442.069,6.00393,120,0,0,1,0,0,0),
(@GUID+54,34861,650,3,1,0,0,689.436,639.259,435.503,5.95157,120,0,0,1,0,0,0),
(@GUID+55,34861,650,3,1,0,0,679.981,648.878,440.198,5.86431,120,0,0,1,0,0,0),
(@GUID+56,34861,650,3,1,0,0,686.392,643.351,436.973,5.88176,120,0,0,1,0,0,0),
(@GUID+57,34861,650,3,1,0,0,692.406,644.87,435.504,5.8294,120,0,0,1,0,0,0),
(@GUID+58,34970,650,3,1,0,0,769.951,547.875,442.072,1.79769,120,0,0,1,0,0,0),
(@GUID+59,34970,650,3,1,0,0,761.217,549.142,440.246,1.58825,120,0,0,1,0,0,0),
(@GUID+60,34970,650,3,1,0,0,764.08,553.434,438.828,1.8675,120,0,0,1,0,0,0),
(@GUID+61,34857,650,3,1,0,0,675.281,589.988,442.081,0.383972,120,0,0,1,0,0,0),
(@GUID+62,34857,650,3,1,0,0,675.115,597.719,442.073,0.279253,120,0,0,1,0,0,0),
(@GUID+63,34857,650,3,1,0,0,692.854,590.632,435.504,0.471239,120,0,0,1,0,0,0),
(@GUID+64,34857,650,3,1,0,0,689.623,598.045,435.503,0.331613,120,0,0,1,0,0,0),
(@GUID+65,34857,650,3,1,0,0,684.964,591.017,438.848,0.418879,120,0,0,1,0,0,0),
(@GUID+66,34975,650,3,1,0,0,779.997,550.694,442.077,2.05949,120,0,0,1,0,0,0),
(@GUID+67,34975,650,3,1,0,0,773.502,555.516,438.825,1.95477,120,0,0,1,0,0,0),
(@GUID+68,34859,650,3,1,0,0,687.965,629.611,435.498,6.19592,120,0,0,1,0,0,0),
(@GUID+69,34859,650,3,1,0,0,688.731,604.689,435.501,0.20944,120,0,0,1,0,0,0),
(@GUID+70,34859,650,3,1,0,0,677.986,634.102,440.245,5.78437,120,0,0,1,0,0,0),
(@GUID+71,34859,650,3,1,0,0,680.599,603.986,438.794,0.191986,120,0,0,1,0,0,0),
(@GUID+72,34859,650,3,1,0,0,685.113,600.431,436.97,0.279253,120,0,0,1,0,0,0),
(@GUID+73,34859,650,3,1,0,0,685.118,634.405,436.976,6.0912,120,0,0,1,0,0,0),
(@GUID+74,34868,650,3,1,0,0,806.488,574.615,442.076,2.49582,120,0,0,1,0,0,0),
(@GUID+75,34868,650,3,1,0,0,799.194,575.25,438.801,2.37365,120,0,0,1,0,0,0),
(@GUID+76,34974,650,3,1,0,0,790.608,559.269,442.073,2.40855,120,0,0,1,0,0,0),
(@GUID+77,34869,650,3,1,0,0,813.502,644.877,440.254,3.49066,120,0,0,1,0,0,0),
(@GUID+78,34869,650,3,1,0,0,818.512,640.599,442.078,3.38594,120,0,0,1,0,0,0),
(@GUID+79,34869,650,3,1,0,0,813.3,650.717,442.073,3.49066,120,0,0,1,0,0,0),
(@GUID+80,34856,650,3,1,0,0,813.635,587.592,442.069,2.70526,120,0,0,1,0,0,0),
(@GUID+81,34856,650,3,1,0,0,814.332,597.781,440.261,2.89725,120,0,0,1,0,0,0),
(@GUID+82,34856,650,3,1,0,0,808.924,586.035,440.295,2.63545,120,0,0,1,0,0,0),
(@GUID+83,34870,650,3,1,0,0,818.163,607.13,440.209,2.94961,120,0,0,1,0,0,0),
(@GUID+84,34870,650,3,1,0,0,818.134,626.964,440.218,3.28122,120,0,0,1,0,0,0),
(@GUID+85,34871,650,3,1,0,0,810.608,659.83,442.086,3.68265,120,0,0,1,0,0,0),
(@GUID+86,34871,650,3,1,0,0,800.194,660.729,438.769,3.82227,120,0,0,1,0,0,0),
(@GUID+87,34871,650,3,1,0,0,805.472,648.721,436.927,3.50811,120,0,0,1,0,0,0),
(@GUID+88,34905,650,3,1,0,0,696.359,653.587,435.504,5.53252,120,0,0,1,0,0,0),
(@GUID+89,34903,650,3,1,0,0,697.116,583.052,435.504,0.628319,120,0,0,1,0,0,0),
(@GUID+90,34902,650,3,1,0,0,689.196,597,435.503,0.349066,120,0,0,1,0,0,0),
(@GUID+91,34883,650,3,1,0,0,687.83,617.649,435.493,1.58825,120,0,0,1,0,0,0),
(@GUID+92,34901,650,3,1,0,0,687.16,618.132,435.489,0,120,0,0,1,0,0,0),
(@GUID+93,34904,650,3,1,0,0,690.596,642,435.504,5.88176,120,0,0,1,0,0,0);


-- cajas que las spawnea el core
DELETE FROM `gameobject_template` WHERE `entry` IN (195709, 195374, 195323); -- modo normal
DELETE FROM `gameobject_template` WHERE `entry` IN (195710, 195375, 195324); -- modo heroico
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES 
('195323','3','9069','Confessor\'s Cache','','','','0','0','2','0','0','0','0','0','0','1634','195323','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11723'),
('195324','3','9069','Confessor\'s Cache','','','','0','0','2','0','0','0','0','0','0','1634','195324','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11723'),
('195374','3','9069','Eadric\'s Cache','','','','0','0','2','0','0','0','0','0','0','1634','195374','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11723'),
('195375','3','9069','Eadric\'s Cache','','','','0','0','2','0','0','0','0','0','0','1634','195375','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11723'),
('195709','3','9069','Champion\'s Cache','','','','0','0','2','0','0','0','0','0','0','1634','195709','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11723'),
('195710','3','9069','Champion\'s Cache','','','','0','0','2','0','0','0','0','0','0','1634','195710','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11723');

-- GAMEOBJECTS SPAWN TRIAL OF CHAMPION MAP 650
DELETE FROM `gameobject` WHERE `map`=650;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
('150063','196398','650','3','1','801.663','624.806','412.344','-1.3439','0','0','0','0','0','0','0'),
('150064','196398','650','3','1','784.533','660.238','412.389','-0.715585','0','0','0','0','0','0','0'),
('150065','196398','650','3','1','710.325','660.708','412.387','0.698132','0','0','0','0','0','0','0'),
('150066','196398','650','3','1','692.127','610.575','412.347','1.85005','0','0','0','0','0','0','0'),
('150067','195477','650','3','1','813.13','617.632','413.039','0','0','0','0','0','0','0','0'),
('150068','195486','650','3','1','813.12','617.59','413.031','0','0','0','0','0','0','0','0'),
('150069','195481','650','3','1','746.156','549.464','412.881','1.5708','0','0','0','0','0','0','0'),
('150070','195480','650','3','1','746.156','549.464','412.881','1.5708','0','0','0','0','0','0','0'),
('150071','195479','650','3','1','746.156','549.464','412.881','1.5708','0','0','0','0','0','0','0'),
('150072','195478','650','3','1','746.156','549.464','412.881','1.5708','0','0','0','0','0','0','0'),
('150075','195485','650','3','1','844.685','623.408','159.109','0','0','0','0','0','0','0','0'),
('150081','195647','650','3','1','746.698','677.469','412.339','1.5708','0','0','1','0','0','0','1'),
('150074','195649','650','3','65535','685.625','617.977','412.285','6.28137','0','0','0.000909718','-1','25','0','1'),
('150078','180723','650','3','1','779.951','655.656','421.818','-2.35619','0','0','0','0','0','0','0'),
('150079','180723','650','3','1','782.309','582.892','421.546','2.25147','0','0','0','0','0','0','0'),
('150073','195648','650','3','65535','746.561','557.002','412.393','1.57292','0','0','0.707856','0.706357','25','0','1'),
('150076','195650','650','3','65535','807.66','618.091','412.394','3.12015','0','0','0.999943','0.0107224','25','0','0'),
('150082','180708','650','3','1','712.521','655.648','424.593','-0.767944','0','0','0','0','0','0','0'),
('150083','180708','650','3','1','704.793','600.736','429.519','0.436332','0','0','0','0','0','0','0'),
('150084','180708','650','3','1','704.302','636.326','425.136','-0.418879','0','0','0','0','0','0','0'),
('150085','180703','650','3','1','712.521','655.648','424.593','-0.767944','0','0','0','0','0','0','0'),
('150086','180703','650','3','1','714.158','585.533','425.579','0.715585','0','0','0','0','0','0','0'),
('150087','180703','650','3','1','704.793','600.736','429.519','0.436332','0','0','0','0','0','0','0'),
('150088','180730','650','3','1','714.158','585.533','425.579','0.715585','0','0','0','0','0','0','0'),
('150089','180730','650','3','1','704.793','600.736','429.519','0.436332','0','0','0','0','0','0','0'),
('150090','180736','650','3','1','792.309','598.457','424.636','2.70526','0','0','0','0','0','0','0'),
('150091','180736','650','3','1','794.441','638.306','425.7','-2.77507','0','0','0','0','0','0','0'),
('150092','180736','650','3','1','779.951','655.656','421.818','-2.35619','0','0','0','0','0','0','0'),
('150093','180736','650','3','1','782.309','582.892','421.546','2.25147','0','0','0','0','0','0','0'),
('150094','180720','650','3','1','779.951','655.656','421.818','-2.35619','0','0','0','0','0','0','0'),
('150095','180720','650','3','1','782.309','582.892','421.546','2.25147','0','0','0','0','0','0','0'),
('150096','180738','650','3','1','794.441','638.306','425.7','-2.77507','0','0','0','0','0','0','0'),
('150097','180738','650','3','1','782.309','582.892','421.546','2.25147','0','0','0','0','0','0','0'),
('150098','180728','650','3','1','704.302','636.326','425.136','-0.418879','0','0','0','0','0','0','0'),
('150099','180728','650','3','1','714.158','585.533','425.579','0.715585','0','0','0','0','0','0','0'),
('150100','180728','650','3','1','712.521','655.648','424.593','-0.767944','0','0','0','0','0','0','0');
DELETE FROM `gameobject` WHERE `id` IN (195709, 195374, 195323, 195710, 195375, 195324); -- objetos spawneados en ctdb, no deberian estar


-- DROPS
-- delete not used reference_loot_template
DELETE FROM `reference_loot_template` WHERE `entry` IN (47497, 47177);
-- drop and conditions
DELETE FROM `conditions` WHERE `SourceGroup` IN (35451, 35490, 195323, 195324, 195374, 195375, 195709, 195710); 
INSERT INTO `conditions` VALUES
(1, 35451, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(1, 35490, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(4, 195323, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(4, 195324, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(4, 195374, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(4, 195375, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(4, 195709, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(4, 195710, 43228, 0, 1, 57940, 0, 0, 0, '', NULL);

-- The Black Knight
-- http://www.wowhead.com/npc=35451/el-caballero-negro#drops:mode=normal:0+1-15
-- Normal
-- Fix drops rates
DELETE FROM `creature_loot_template` WHERE (`entry`=35451);
INSERT INTO `creature_loot_template` VALUES 
(35451, 47216, 16.666, 1, 2, 1, 1),
(35451, 47215, 16.666, 1, 2, 1, 1),
(35451, 47226, 16.666, 1, 2, 1, 1),
(35451, 47227, 16.666, 1, 2, 1, 1),
(35451, 47229, 16.666, 1, 2, 1, 1),
(35451, 47232, 16.666, 1, 2, 1, 1),
(35451, 47222, 16.666, 1, 1, 1, 1),
(35451, 47221, 16.666, 1, 1, 1, 1),
(35451, 47228, 16.666, 1, 1, 1, 1),
(35451, 47220, 16.666, 1, 1, 1, 1),
(35451, 47230, 16.666, 1, 1, 1, 1),
(35451, 47231, 16.666, 1, 1, 1, 1),
(35451, 43228, 28, 1, 0, 3, 3);

-- http://www.wowhead.com/npc=35451/el-caballero-negro#drops:mode=heroic:0+1-15
-- Hero
-- Fix rates and drops and some missing
DELETE FROM `creature_loot_template` WHERE (`entry`=35490);
INSERT INTO `creature_loot_template` VALUES 
(35490, 47565, 14.285, 1, 2, 1, 1),
(35490, 47568, 14.285, 1, 2, 1, 1),
(35490, 47569, 14.285, 1, 2, 1, 1),
(35490, 47564, 14.285, 1, 2, 1, 1),
(35490, 47567, 14.285, 1, 2, 1, 1),
(35490, 47560, 14.285, 1, 2, 1, 1),
(35490, 49682, 14.285, 1, 2, 1, 1),
(35490, 47566, 16.666, 1, 1, 1, 1),
(35490, 47562, 16.666, 1, 1, 1, 1),
(35490, 47529, 16.666, 1, 1, 1, 1),
(35490, 47561, 16.666, 1, 1, 1, 1),
(35490, 47563, 16.666, 1, 1, 1, 1),
(35490, 47527, 16.666, 1, 1, 1, 1),
(35490, 43228, 2, 1, 0, 4, 4),
(35490, 43102, 100, 1, 0, 1, 1),
(35490, 48418, -100, 1, 0, 1, 1),
(35490, 47241, 100, 1, 0, 1, 1),
(35490, 44990, 47, 1, 0, 1, 1),
(35490, 34057, 1.3, 1, 0, 1, 2);

-- Confessor's Cache
-- http://www.wowhead.com/object=195323#contains:mode=normal:0+1-15
-- Normal (Entry: 195323)
-- fix drops rates and groups
DELETE FROM `gameobject_loot_template` WHERE (`entry`=195323);
INSERT INTO `gameobject_loot_template` VALUES 
(195323, 43228, 100, 1, 0, 3, 3),
(195323, 47176, 8.333, 1, 1, 1, 1),
(195323, 47177, 8.333, 1, 1, 1, 1),
(195323, 47178, 8.333, 1, 1, 1, 1),
(195323, 47181, 8.333, 1, 1, 1, 1),
(195323, 47185, 8.333, 1, 1, 1, 1),
(195323, 47211, 8.333, 1, 1, 1, 1),
(195323, 47212, 8.333, 1, 1, 1, 1),
(195323, 47213, 8.333, 1, 1, 1, 1),
(195323, 47214, 8.333, 1, 1, 1, 1),
(195323, 47217, 8.333, 1, 1, 1, 1),
(195323, 47218, 8.333, 1, 1, 1, 1),
(195323, 47219, 8.333, 1, 1, 1, 1);

-- http://www.wowhead.com/object=195323#contains:mode=heroic:0+1-15
-- Heroic (Entry: 195324)
-- Fix rates and groups
UPDATE `gameobject_template` SET `data1`='195324' WHERE entry='195324';
DELETE FROM `gameobject_loot_template` WHERE (`entry`=195324);
INSERT INTO `gameobject_loot_template` VALUES 
(195324, 47514, 8.333, 1, 1, 1, 1),
(195324, 47512, 8.333, 1, 1, 1, 1),
(195324, 47511, 8.333, 1, 1, 1, 1),
(195324, 47510, 8.333, 1, 1, 1, 1),
(195324, 47500, 8.333, 1, 1, 1, 1),
(195324, 47245, 8.333, 1, 1, 1, 1),
(195324, 47522, 8.333, 1, 1, 1, 1),
(195324, 47498, 8.333, 1, 1, 1, 1),
(195324, 47497, 8.333, 1, 1, 1, 1),
(195324, 47496, 8.333, 1, 1, 1, 1),
(195324, 47495, 8.333, 1, 1, 1, 1),
(195324, 47494, 8.333, 1, 1, 1, 1),
(195324, 47241, 100, 1, 0, 1, 1),
(195324, 44990, 40, 1, 0, 1, 1),
(195324, 43228, 23, 1, 0, 4, 4),
(195324, 34057, 1.3, 1, 0, 1, 2);

-- Eadric's Cache
-- http://www.wowhead.com/object=195374#contains:mode=normal:0+1-15
-- Normal (entry: 195374)
-- Fix groups and drops
DELETE FROM `gameobject_loot_template` WHERE (`entry`=195374);
INSERT INTO `gameobject_loot_template` VALUES 
(195374, 47176, 8.333, 1, 1, 1, 1),
(195374, 47200, 8.333, 1, 1, 1, 1),
(195374, 47178, 8.333, 1, 1, 1, 1),
(195374, 47201, 8.333, 1, 1, 1, 1),
(195374, 47213, 8.333, 1, 1, 1, 1),
(195374, 47181, 8.333, 1, 1, 1, 1),
(195374, 47197, 8.333, 1, 1, 1, 1),
(195374, 47177, 8.333, 1, 1, 1, 1),
(195374, 47202, 8.333, 1, 1, 1, 1),
(195374, 47199, 8.333, 1, 1, 1, 1),
(195374, 47185, 8.333, 1, 1, 1, 1),
(195374, 43228, 21, 1, 0, 3, 3),
(195374, 47210, 8.333, 1, 1, 1, 1);

-- http://www.wowhead.com/object=195374#contains:mode=heroic:0+1-15
-- Hero (Entry: 195375)
-- Fix groups and rates
DELETE FROM `gameobject_loot_template` WHERE (`entry`=195375);
INSERT INTO `gameobject_loot_template` VALUES 
(195375, 47509, 8.333, 1, 1, 1, 1),
(195375, 47508, 8.333, 1, 1, 1, 1),
(195375, 47504, 8.333, 1, 1, 1, 1),
(195375, 47503, 8.333, 1, 1, 1, 1),
(195375, 47502, 8.333, 1, 1, 1, 1),
(195375, 47501, 8.333, 1, 1, 1, 1),
(195375, 47500, 8.333, 1, 1, 1, 1),
(195375, 47498, 8.333, 1, 1, 1, 1),
(195375, 47497, 8.333, 1, 1, 1, 1),
(195375, 47496, 8.333, 1, 1, 1, 1),
(195375, 47495, 8.333, 1, 1, 1, 1),
(195375, 47494, 8.333, 1, 1, 1, 1),
(195375, 47241, 100, 1, 0, 1, 1),
(195375, 44990, 40, 1, 0, 1, 1),
(195375, 43228, 23, 1, 0, 4, 4),
(195375, 34057, 1.3, 1, 0, 1, 2);

-- Champion's Cache
-- http://www.wowhead.com/object=195709#contains:mode=normal:0+1-15
-- Normal (Entry: 195709)
-- Fix rates
DELETE FROM `gameobject_loot_template` WHERE (`entry`=195709);
INSERT INTO `gameobject_loot_template` VALUES 
(195709, 43228, 24, 1, 0, 3, 3),
(195709, 47172, 16.666, 1, 1, 1, 1),
(195709, 47171, 16.666, 1, 1, 1, 1),
(195709, 47170, 16.666, 1, 1, 1, 1),
(195709, 47174, 16.666, 1, 1, 1, 1),
(195709, 47173, 16.666, 1, 1, 1, 1),
(195709, 47175, 16.666, 1, 1, 1, 1);

-- http://www.wowhead.com/object=195709#contains:mode=heroic:0+1-15
-- (Entry: 195710)
-- Fix rates
DELETE FROM `gameobject_loot_template` WHERE (`entry`=195710);
INSERT INTO `gameobject_loot_template` VALUES 
(195710, 44990, 43, 1, 0, 1, 1),
(195710, 47241, 100, 1, 0, 1, 1),
(195710, 34057, 1.3, 1, 0, 1, 1),
(195710, 43228, 24, 1, 0, 4, 4),
(195710, 47243, 16.666, 1, 1, 1, 1),
(195710, 47244, 16.666, 1, 1, 1, 1),
(195710, 47493, 16.666, 1, 1, 1, 1),
(195710, 47248, 16.666, 1, 1, 1, 1),
(195710, 47249, 16.666, 1, 1, 1, 1),
(195710, 47250, 16.666, 1, 1, 1, 1);

-- Loot for creature Thunder Bluff Champion
-- http://www.wowhead.com/npc=35305#drops:mode=normal
DELETE FROM `creature_loot_template` WHERE (`entry`=35305);
INSERT INTO `creature_loot_template` VALUES 
(35305, 47172, 20, 1, 0, 1, 7),
(35305, 47170, 14, 1, 0, 1, 1);

-- Thunder Bluff Champion
-- Some one, a very nice person, delete this lines for give to us a double work :P
DELETE FROM `creature_loot_template` WHERE (`entry`=35325);
INSERT INTO `creature_loot_template` VALUES 
(35325, 47172, 33, 1, 0, 1, 2),
(35325, 47170, 25, 1, 0, 1, 1);



-- 01_trial_of_the_crusader
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

-- ------------------------------------------------------------------------------------------------------------------------------------ --
-- ACORDING WITH THE LAST SCRIPTS OF TC ANUB'ARAK IS NOT ATTACKABLE, THIS IS THE SOLUTION
-- THANKS MISIMOUSE
UPDATE creature_template SET unit_flags = 0, type_flags= 8, dynamicflags = 0, flags_extra = 2 WHERE entry IN (34564, 34566, 33615, 36616);
-- ------------------------------------------------------------------------------------------------------------------------------------ --



-- 01_ulduar
-- Some cleanup
DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5369,5423);

DELETE FROM areatrigger_scripts WHERE `entry`=4156;
INSERT INTO areatrigger_scripts VALUES (4156,'at_naxxramas_frostwyrm_wing');

UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=33142;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=33139;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=34111;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=34224;

-- Leviathan Torret 33139
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=83,`exp`=2,`unit_class`=1 WHERE `entry` IN (33139, 34111);
-- Leviathan Torret 33142
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=83,`exp`=2,`unit_class`=1 WHERE `entry` IN (33142);

-- 7770_ignis_vehicleid
UPDATE `creature_template` SET `vehicleId` = 318 WHERE `entry` = 33118;

-- 7792
DELETE FROM `creature_template` WHERE `entry` IN (33119);
INSERT INTO `creature_template` VALUES
('33119','0','0','0','0','0','13069','0','0','0','Scorch trigger','',NULL,'0','83','83','2','16','16','0','2','2','85','3','0','0','0','0','0','0','0','8','34340934','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','62548','0','0','0','0','0','0','0','0','0','1305000','1595000','EventAI','0','3','310','30','1','0','0','0','0','0','0','0','169','1','0','617299803','1','trigger_periodic','0');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33119);
INSERT INTO `creature_ai_scripts` VALUES 
( 10033119, 33119, 0, 0, 100, 3, 1000, 1000, 1000, 1000, 11, 62548, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Scorch Ground');

UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `unit_flags` = 33554434, `flags_extra` = 0 WHERE `entry` = 33121;

-- 7796_xt002_vehicleid
UPDATE `creature_template` SET `vehicleId` = 332 WHERE `entry` = 33293;

-- 7930_leviathan_trigger
DELETE FROM `creature_template` WHERE `entry` IN (33115);
INSERT INTO `creature_template` VALUES
('33115','0','0','0','0','0','13069','0','0','0','Leviathan trigger','',NULL,'0','83','83','2','16','16','0','2','2','1','3','0','0','0','0','0','0','0','8','34340934','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','62548','0','0','0','0','0','0','0','0','0','1305000','1595000','','0','3','310','30','1','0','0','0','0','0','0','0','169','1','0','617299803','1','flame_leviathan_trigger','0');

DELETE FROM creature WHERE `id` IN (33115, 33060, 33062, 33109);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES (33115,603,1,1,0,0,-784.969,-135.608,429.774,0.351076,480000,0,0,3458360,279750,0,0);

-- 8042_boss_leviathan
DELETE FROM `creature_template` WHERE `entry` IN (33240);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES('33240','33240','0','0','0','0','28517','0','0','0','Ulduar Colossus','','','0','80','80','2','1692','1692','0','1.2','1.14286','1','1','422','586','0','642','7.5','2000','0','1','32832','0','0','0','0','0','0','345','509','103','5','524352','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','125','1','1','0','0','0','0','0','0','0','124','1','0','0','0','mob_colossus','11403');
-- ubicación Leviathan
DELETE FROM `creature` WHERE `id`=33113;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(94374, 33113, 603, 1, 1, 0, 0, 435.89, -8.417, 409.886, 3.12723, 480000, 0, 0, 23009250, 0, 0, 0);
-- Refuerzo orbital
UPDATE `creature_template` SET `unit_flags` = 33685510, `type_flags` = 0 WHERE `entry` = 34286;

-- 8047_ignis_scorchground
DELETE FROM `creature_template` WHERE `entry` IN (33119);
INSERT INTO `creature_template` VALUES
('33119','0','0','0','0','0','13069','0','0','0','Scorch trigger','','','0','80','80','2','16','16','0','1','1.14286','85','1','0','0','0','0','1','2000','0','1','0','0','0','0','0','0','0','0','0','0','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','4','1','1','0','0','0','0','0','0','0','94','1','0','0','0','mob_scorch_ground','11159');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33119);

-- 8086_razorscale_event
UPDATE `creature_template` SET `unit_flags` = 33685506 WHERE `entry` IN (33245,33233);
DELETE FROM `creature` WHERE `id`=33186;

-- 8093_razorscale_triggers
DELETE FROM `creature` WHERE `id`=33282;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33233,33259);

-- 8098_kologarn_event
DELETE FROM `creature` WHERE `id` IN (33632, 33802);
UPDATE `creature_template` SET `unit_flags` = 33685510 WHERE `entry` = 33809;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33661;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` IN (33632, 33802);
UPDATE `creature_template` SET `unit_flags` = 33947654 WHERE `entry` = 33121;

-- 8119_assembly_iron
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` IN (33051, 33691, 33689);
UPDATE creature_template SET faction_A=16, faction_H=16 WHERE entry = 33705;
UPDATE creature_template SET faction_A=16, faction_H=16, difficulty_entry_1 = 33689 WHERE entry = 32958;

-- 8124_auriaya_event
DELETE FROM `creature` WHERE id = 34014;
UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 0 WHERE `entry` = 33515;
UPDATE `creature_template` SET `equipment_id` = 2500 WHERE `entry` = 33515;

UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 34096;

DELETE FROM `creature_equip_template` WHERE entry = 2500;
INSERT INTO `creature_equip_template` VALUES ('2500','45315','0','0');

-- 9130_auriaya_fix
UPDATE `creature` SET `MovementType` = 2 WHERE `id` = 33515;

-- 8137_leviathan_vehiclesystem
UPDATE `creature_template` SET `unit_flags` = 0, `npcflag` = 1  WHERE `entry` = 33686;
DELETE FROM `creature_template` WHERE `entry`=33115;
DELETE FROM creature WHERE `id`=33115;

-- 8148_boss_hodir
UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 0 WHERE `entry` = 32845;

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0 WHERE `entry` IN (34188, 33632, 33802, 34096, 34098);
UPDATE `creature_template` SET `modelid1` = 25865, `modelid2` = 0, `flags_extra` = 0 WHERE `entry` = 32938;
UPDATE `creature_template` SET `modelid1` = 28470, `modelid2` = 0 WHERE `entry` = 33169;
UPDATE `creature_template` SET `modelid1` = 28470, `modelid2` = 0 WHERE `entry` = 33173;
UPDATE `creature_template` SET `modelid1` = 15880, `modelid2` = 0 WHERE `entry` = 33174;
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 194173;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 61990;
INSERT INTO `spell_linked_spell` VALUES 
(61990, -62457, 2, "Ice Shards Immunity (Hodir)"),
(61990, -65370, 2, "Ice Shards Immunity (Hodir)");

UPDATE `creature_template` SET `unit_flags` = 33817094 WHERE `entry` = 33174;
UPDATE `creature_template` SET `mechanic_immune_mask` = 612581215 WHERE `entry` = 32938;
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 32941;
UPDATE `creature_template` SET `unit_flags` = 33686016, `flags_extra` = 2 WHERE `entry` = 30298;

DELETE FROM `creature` WHERE `id` = 32938;

-- 8153_razorscale_event
DELETE FROM `creature` WHERE `id`=33186;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(94373, 33186, 603, 1, 1, 0, 0, 587.073, -203.205, 441.237, 1.60532, 604800, 0, 0, 3555975, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 33554438 WHERE `entry` = 33184;

-- 8155_hodir_npcs
UPDATE `creature_template` SET `unit_flags` = 393220, `ScriptName` = '' WHERE `entry` = 32938;
UPDATE `creature_template` SET `unit_flags` = 33948166 WHERE `entry` = 33174;

DELETE FROM `creature` WHERE `id` IN (32941, 33333, 33332, 32950, 33331, 32946, 32948, 33330);

UPDATE `creature_template` SET `faction_A` = 1665, `faction_H` = 1665, `unit_flags` = 32768 WHERE `entry` IN (33325, 32901, 33328, 32901, 32893, 33327, 32897, 33326, 32941, 33333, 33332, 32950, 33331, 32946, 32948, 33330);

UPDATE `creature_template` SET `modelid1` = 15880, `modelid2` = 0 WHERE `entry` = 33342;

-- 8164_ulduar_immunities
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (33113, 33118, 33186, 33293, 32867, 32927, 32930, 33515, 32906, 32845, 33350, 32865, 33271, 33288, 32871);
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299547 WHERE `entry` = 32857;

UPDATE `script_texts` SET `content_default` = "Welcome, champions! All of our attempts at grounding her have failed. We could use a hand in bring her down with these harpoon guns.", `type` = 0  WHERE `entry` = -1603260;
UPDATE `script_texts` SET `content_default` = "Move! Quickly! She won’t remain grounded for long.", `type` = 1  WHERE `entry` = -1603261;
UPDATE `script_texts` SET `type` = 2  WHERE `entry` = -1603053;
UPDATE `script_texts` SET `type` = 2  WHERE `entry` = -1603214;

-- 8166_hodir_flashfreeze
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (61990, -61990);
INSERT INTO `spell_linked_spell` VALUES 
(61990, 7940, 2, "Hodir Flash Freeze immunity");

-- 8172_freya_elders
UPDATE `creature_template` SET `unit_flags` = 33685510, `modelid1` = 11686, `modelid2` = 0 WHERE `entry` =33170;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 393220 WHERE `entry` = 33168;

DELETE FROM `spell_linked_spell` WHERE `spell_effect` = -62243;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(62217, -62243, 1, 'cancels the effects of Unstable Sun Beam'),
(62922, -62243, 1, 'cancels the effects of Unstable Sun Beam');

-- 8178_boss_freya
UPDATE `creature_template` SET `unit_flags` = 393220 WHERE `entry` =33228;
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `unit_flags` = 33685508 WHERE `entry` =34129;
-- ERROR: Creature (Entry: 32918, class 2) has different `unit_class` in difficulty 1 mode (Entry: 33399, class 1).
-- Si pone un unit_class en normal debes ponerlo tambien en hero
UPDATE `creature_template` SET `unit_class` = 2 WHERE `entry` IN (32918,33399);
UPDATE `creature_template` SET `unit_flags` = 33686022 WHERE `entry` =33215;
DELETE FROM `creature` WHERE `guid` = 136607;

DELETE FROM `spell_linked_spell` WHERE `spell_effect` = -62532;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(64321, -62532, 1, 'Potent Pheromones ward off the Conservator''s Grip'),
(62619, -62532, 1, 'Pheromones ward off the Conservator''s Grip');

-- 8195_freya_event
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `unit_flags` = 33686022 WHERE `entry` = 33050;

-- 8199_ulduar_cleanup
DELETE FROM `gameobject` WHERE `id` = '194905';
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('270000','194905','603','1','1','401.308','-13.8236','409.524','3.14159','0','0','0','1','180','255','0');

UPDATE `creature_template` SET `speed_walk` = 0.5 WHERE `entry` = 33113;
UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 8 WHERE `entry` = 32865;

-- 8228_ignis_scorch
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0 WHERE `entry` = 33221;
DELETE FROM `creature_template` WHERE `entry` = 33119;

-- 8241_thorim_gate
-- ERROR: Table `gameobject_scripts` has gameobject type (189980) non supported by command SCRIPT_COMMAND_OPEN_DOOR for script id 55194
-- no es neesario, las puertas se abren sin ningun script
/*
DELETE FROM `gameobject_scripts` WHERE `id`=55194;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(55194, 0, 11, 34155, 15, '0', 0, 0, 0, 0);
*/

UPDATE `gameobject` SET `id` = 101855, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 55194;

-- 8252_boss_thorim
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14 WHERE `entry` IN (32882, 32908, 32885, 33110);
UPDATE `creature_template` SET `unit_flags` = 0, `faction_A` = 14, `faction_H` = 14 WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875);

UPDATE `creature` SET `spawndist` = 0 WHERE `id` = 32865;
UPDATE `creature` SET `position_x` = 2135.078, `position_y` = -298.758, `orientation` = 1.61 WHERE `id` = 32865;

DELETE FROM `creature` WHERE `id` IN (32882, 32908, 32885, 32879, 33140, 33141);

UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (32892, 32879, 32780, 33140, 33141);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62042','62470','1','Thorim: Deafening Thunder');

UPDATE `creature_template` SET `unit_flags` = 33686020 WHERE `entry` = 33378;

DELETE FROM `creature` WHERE `id` IN (33378, 32892);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(131835, 33378, 603, 1, 1, 16925, 0, 2104.99, -233.484, 433.573, 5.49779, 604800, 0, 0, 12600, 0, 0, 1),
(131836, 33378, 603, 1, 1, 16925, 0, 2092.64, -262.594, 433.576, 6.26573, 604800, 0, 0, 12600, 0, 0, 1),
(131837, 33378, 603, 1, 1, 16925, 0, 2104.76, -292.719, 433.181, 0.785398, 604800, 0, 0, 12600, 0, 0, 1),
(131839, 33378, 603, 1, 1, 16925, 0, 2164.97, -293.375, 433.526, 2.35619, 604800, 0, 0, 12600, 0, 0, 1),
(131840, 33378, 603, 1, 1, 16925, 0, 2164.58, -233.333, 433.892, 3.90954, 604800, 0, 0, 12600, 0, 0, 1),
(131841, 33378, 603, 1, 1, 16925, 0, 2145.8, -222.196, 433.293, 4.45059, 604800, 0, 0, 12600, 0, 0, 1),
(131842, 33378, 603, 1, 1, 16925, 0, 2123.91, -222.443, 433.375, 4.97419, 604800, 0, 0, 12600, 0, 0, 1);

/*
DELETE FROM `spell_script_target` WHERE `entry`=62016;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES('62016','1','33378');
*/
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 32872;
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 32873;
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0 WHERE `entry` IN (33725, 33282);
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 32892;

-- 8262_thorim_event
DELETE FROM `creature` WHERE `id` IN (33378, 32892);
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0 WHERE `entry`IN (33378, 32892);

DELETE FROM `creature` WHERE `id` IN (32922, 32923, 32925);
SET @GUID := 200400;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) values 
(@GUID,32922,603,1,1,25984,0,2110.24,-213.923,436.857,5.16617,604800,0,0,80886,0,0,0),
(@GUID+1,32922,603,1,1,25984,0,2095.97,-213.634,445.036,5.37561,604800,0,0,80886,0,0,0),
(@GUID+2,32922,603,1,1,25984,0,2076.95,-244.528,442.998,5.96903,604800,0,0,80886,0,0,0),
(@GUID+3,32922,603,1,1,25984,0,2077.98,-272.724,438.925,0.191986,604800,0,0,80886,0,0,0),
(@GUID+4,32922,603,1,1,25984,0,2087.4,-301.326,443.005,0.698132,604800,0,0,80886,0,0,0),
(@GUID+5,32922,603,1,1,25984,0,2091.17,-286.804,430.781,0.523599,604800,0,0,80886,0,0,0),
(@GUID+6,32922,603,1,1,25984,0,2177.83,-295.005,434.846,2.35619,604800,0,0,80886,0,0,0),
(@GUID+7,32922,603,1,1,25984,0,2189.87,-278.583,438.928,2.87979,604800,0,0,80886,0,0,0),
(@GUID+8,32922,603,1,1,25984,0,2197.19,-256.436,445.037,3.24631,604800,0,0,80886,0,0,0),
(@GUID+9,32922,603,1,1,25984,0,2185.87,-254.436,432.798,3.29867,604800,0,0,80886,0,0,0),
(@GUID+10,32922,603,1,1,25984,0,2179.62,-227.25,442.009,3.89208,604800,0,0,80886,0,0,0),
(@GUID+11,32922,603,1,1,25984,0,2161.18,-218.451,432.811,4.17134,604800,0,0,80886,0,0,0),
(@GUID+12,32923,603,1,1,28580,0,2193.75,-292.545,449.069,3.21141,180,0,0,18900,0,0,0),
(@GUID+13,32923,603,1,1,28580,0,2178.55,-286.8,430.795,2.51327,180,0,0,18900,0,0,0),
(@GUID+14,32923,603,1,1,28580,0,2178.61,-299.455,438.917,2.30383,180,0,0,18900,0,0,0),
(@GUID+15,32923,603,1,1,28580,0,2186.39,-292.184,440.98,2.51327,180,0,0,18900,0,0,0),
(@GUID+16,32923,603,1,1,28580,0,2184.1,-304.141,447.037,2.32129,180,0,0,18900,0,0,0),
(@GUID+17,32923,603,1,1,28580,0,2185.45,-274.37,432.804,2.93215,180,0,0,18900,0,0,0),
(@GUID+18,32923,603,1,1,28580,0,2189.09,-274.368,436.838,2.94961,180,0,0,18900,0,0,0),
(@GUID+19,32923,603,1,1,28580,0,2193.43,-266.823,440.96,3.08923,180,0,0,18900,0,0,0),
(@GUID+20,32923,603,1,1,28580,0,2192.18,-282.637,442.998,2.82743,180,0,0,18900,0,0,0),
(@GUID+21,32923,603,1,1,28580,0,2199.59,-279.142,449.1,2.9147,180,0,0,18900,0,0,0),
(@GUID+22,32923,603,1,1,28580,0,2199.07,-267.828,447.077,3.07178,180,0,0,18900,0,0,0),
(@GUID+23,32923,603,1,1,28580,0,2184.24,-269.38,430.788,3.01942,180,0,0,18900,0,0,0),
(@GUID+24,32923,603,1,1,28580,0,2185.79,-278.182,434.833,2.86234,180,0,0,18900,0,0,0),
(@GUID+25,32923,603,1,1,28580,0,2191.54,-269.729,438.919,3.03687,180,0,0,18900,0,0,0),
(@GUID+26,32923,603,1,1,28580,0,2194.43,-276.351,442.961,2.93215,180,0,0,18900,0,0,0),
(@GUID+27,32923,603,1,1,28580,0,2196.2,-281.951,447.042,2.86234,180,0,0,18900,0,0,0),
(@GUID+28,32923,603,1,1,28580,0,2200.95,-267.306,449.114,3.08923,180,0,0,18900,0,0,0),
(@GUID+29,32923,603,1,1,28580,0,2181.97,-248.535,430.753,3.4383,180,0,0,18900,0,0,0),
(@GUID+30,32923,603,1,1,28580,0,2185.63,-247.405,434.837,3.4383,180,0,0,18900,0,0,0),
(@GUID+31,32923,603,1,1,28580,0,2189.51,-258.295,436.863,3.22886,180,0,0,18900,0,0,0),
(@GUID+32,32923,603,1,1,28580,0,2200.71,-251.84,449.088,3.29867,180,0,0,18900,0,0,0),
(@GUID+33,32923,603,1,1,28580,0,2194.08,-243.276,445.031,3.45575,180,0,0,18900,0,0,0),
(@GUID+34,32923,603,1,1,28580,0,2195.15,-251.153,442.98,3.33358,180,0,0,18900,0,0,0),
(@GUID+35,32923,603,1,1,28580,0,2178.26,-234.068,439.581,3.49066,180,0,0,18900,0,0,0),
(@GUID+36,32923,603,1,1,28580,0,2181.94,-238.58,434.834,3.61283,180,0,0,18900,0,0,0),
(@GUID+37,32923,603,1,1,28580,0,2182.5,-234.925,445.771,3.66519,180,0,0,18900,0,0,0),
(@GUID+38,32923,603,1,1,28580,0,2187.5,-232.918,456.92,3.38594,180,0,0,18900,0,0,0),
(@GUID+39,32923,603,1,1,28580,0,2184.62,-222.366,457.92,4.2237,180,0,0,18900,0,0,0),
(@GUID+40,32923,603,1,1,28580,0,2191.95,-229.319,468.174,3.54302,180,0,0,18900,0,0,0),
(@GUID+41,32923,603,1,1,28580,0,2161.32,-222.722,428.718,4.24115,180,0,0,18900,0,0,0),
(@GUID+42,32923,603,1,1,28580,0,2165.7,-216.552,437.482,4.11898,180,0,0,18900,0,0,0),
(@GUID+43,32923,603,1,1,28580,0,2172.48,-215.681,446.296,4.03171,180,0,0,18900,0,0,0),
(@GUID+44,32923,603,1,1,28580,0,2170.81,-208.646,447.254,4.11898,180,0,0,18900,0,0,0),
(@GUID+45,32923,603,1,1,28580,0,2164.44,-204.417,449.036,4.2237,180,0,0,18900,0,0,0),
(@GUID+46,32923,603,1,1,28580,0,2109.83,-216.211,434.81,5.20108,180,0,0,18900,0,0,0),
(@GUID+47,32923,603,1,1,28580,0,2100.14,-217.783,438.879,5.35816,180,0,0,18900,0,0,0),
(@GUID+48,32923,603,1,1,28580,0,2101.65,-211.524,442.959,5.2709,180,0,0,18900,0,0,0),
(@GUID+49,32923,603,1,1,28580,0,2105.1,-204.009,449.074,5.16617,180,0,0,18900,0,0,0),
(@GUID+50,32923,603,1,1,28580,0,2105.72,-213.887,438.883,5.23599,180,0,0,18900,0,0,0),
(@GUID+51,32923,603,1,1,28580,0,2093.1,-235.128,430.762,5.70723,180,0,0,18900,0,0,0),
(@GUID+52,32923,603,1,1,28580,0,2086.43,-236.845,436.861,5.79449,180,0,0,18900,0,0,0),
(@GUID+53,32923,603,1,1,28580,0,2090.16,-227.646,438.9,5.61996,180,0,0,18900,0,0,0),
(@GUID+54,32923,603,1,1,28580,0,2083.78,-233.255,440.947,5.75959,180,0,0,18900,0,0,0),
(@GUID+55,32923,603,1,1,28580,0,2082.41,-227.753,444.991,5.68977,180,0,0,18900,0,0,0),
(@GUID+56,32923,603,1,1,28580,0,2083.46,-220.87,449.11,5.32325,180,0,0,18900,0,0,0),
(@GUID+57,32923,603,1,1,28580,0,2085.77,-278.108,432.796,0.314159,180,0,0,18900,0,0,0),
(@GUID+58,32923,603,1,1,28580,0,2082.43,-279.181,436.843,0.314159,180,0,0,18900,0,0,0),
(@GUID+59,32923,603,1,1,28580,0,2080.09,-268.561,436.861,0.122173,180,0,0,18900,0,0,0),
(@GUID+60,32923,603,1,1,28580,0,2076.67,-281.238,443.013,0.314159,180,0,0,18900,0,0,0),
(@GUID+61,32923,603,1,1,28580,0,2070.95,-275.786,447.029,0.314159,180,0,0,18900,0,0,0),
(@GUID+62,32923,603,1,1,28580,0,2073.01,-269.083,444.984,0.10472,180,0,0,18900,0,0,0),
(@GUID+63,32923,603,1,1,28580,0,2085.04,-249.688,432.797,6.02139,180,0,0,18900,0,0,0),
(@GUID+64,32923,603,1,1,28580,0,2081.76,-248.184,436.858,6.00393,180,0,0,18900,0,0,0),
(@GUID+65,32923,603,1,1,28580,0,2076.05,-253.313,440.97,6.10865,180,0,0,18900,0,0,0),
(@GUID+66,32923,603,1,1,28580,0,2072.73,-250.245,445.018,6.07375,180,0,0,18900,0,0,0),
(@GUID+67,32923,603,1,1,28580,0,2071.74,-242.53,449.109,5.98648,180,0,0,18900,0,0,0),
(@GUID+68,32923,603,1,1,28580,0,2086.54,-289.927,436.879,0.523599,180,0,0,18900,0,0,0),
(@GUID+69,32923,603,1,1,28580,0,2096.15,-293.986,430.76,0.698132,180,0,0,18900,0,0,0),
(@GUID+70,32923,603,1,1,28580,0,2090.54,-299.068,438.92,0.698132,180,0,0,18900,0,0,0),
(@GUID+71,32923,603,1,1,28580,0,2082.36,-289.917,440.969,0.488692,180,0,0,18900,0,0,0),
(@GUID+72,32923,603,1,1,28580,0,2091.47,-291.981,432.8,0.610865,180,0,0,18900,0,0,0),
(@GUID+73,32923,603,1,1,28580,0,2081.7,-300.628,447.058,0.628319,180,0,0,18900,0,0,0),
(@GUID+74,32925,603,1,1,28581,0,2187.69,-270.488,434.832,3.01942,604800,0,0,40443,4169,0,0),
(@GUID+75,32925,603,1,1,28581,0,2193.33,-257.943,440.949,3.22886,604800,0,0,40443,4169,0,0),
(@GUID+76,32925,603,1,1,28581,0,2191.72,-247.573,440.946,3.40339,604800,0,0,40443,4169,0,0),
(@GUID+77,32925,603,1,1,28581,0,2181.61,-224.316,447.512,3.82227,604800,0,0,40443,4169,0,0),
(@GUID+78,32925,603,1,1,28581,0,2178.52,-240.156,430.756,3.61283,604800,0,0,40443,4169,0,0),
(@GUID+79,32925,603,1,1,28581,0,2162.94,-207.222,445.019,4.24115,604800,0,0,40443,4169,0,0),
(@GUID+80,32925,603,1,1,28581,0,2169.97,-218.059,441.236,4.03171,604800,0,0,40443,4169,0,0),
(@GUID+81,32925,603,1,1,28581,0,2108.07,-208.596,442.986,5.16617,604800,0,0,40443,4169,0,0),
(@GUID+82,32925,603,1,1,28581,0,2102.01,-220.66,434.848,5.35816,604800,0,0,40443,4169,0,0),
(@GUID+83,32925,603,1,1,28581,0,2077.76,-232.818,447.073,5.79449,604800,0,0,40443,4169,0,0),
(@GUID+84,32925,603,1,1,28581,0,2089.41,-225.486,440.96,5.67232,604800,0,0,40443,4169,0,0),
(@GUID+85,32925,603,1,1,28581,0,2089.53,-238.313,432.82,5.79449,604800,0,0,40443,4169,0,0),
(@GUID+86,32925,603,1,1,28581,0,2079.95,-256.325,436.876,6.16101,604800,0,0,40443,4169,0,0),
(@GUID+87,32925,603,1,1,28581,0,2070.53,-254.7,447.074,0.436332,604800,0,0,40443,4169,0,0),
(@GUID+88,32925,603,1,1,28581,0,2068.65,-270.917,449.112,0.226893,604800,0,0,40443,4169,0,0),
(@GUID+89,32925,603,1,1,28581,0,2079.16,-291.637,445.029,0.488692,604800,0,0,40443,4169,0,0),
(@GUID+90,32925,603,1,1,28581,0,2093.31,-296.653,434.853,0.698132,604800,0,0,40443,4169,0,0),
(@GUID+91,32925,603,1,1,28581,0,2188.81,-295.889,445.046,2.49582,604800,0,0,40443,4169,0,0),
(@GUID+92,32925,603,1,1,28581,0,2197.29,-272.726,445.048,3.00197,604800,0,0,40443,4169,0,0);

DELETE FROM `gameobject_template` WHERE `entry`=194265;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194265','1','295','Lever','','','','0','16','3','0','0','0','0','0','0','0','0','6000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','11403');
DELETE FROM `gameobject` WHERE `id`=194265;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(2002365, 194265, 603, 1, 64, 2173.24, -252.985, 420.146, 5.27078, 0, 0, 1, 0, 7200, 100, 1);

UPDATE `gameobject` SET `id` = 194265, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 2002365;

DELETE FROM `creature` WHERE `guid`=131934;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('131934','33725','603','1','1','16925','0','2134.93','-339.696','437.311','0','604800','0','0','12600','0','0','0');


UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 32892;

DELETE FROM `creature_addon` WHERE `guid`IN (131817, 131934);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('131817','0','0','0','1','0','40775 0'),
('131934','0','0','0','1','0','40775 0');

-- 8264_thorim_preadds
UPDATE `creature_template` SET `mindmg` = 488, `maxdmg` = 642, `attackpower` = 682, `dmg_multiplier` = 7.5, `equipment_id` = 1852 WHERE `entry` = 32908;
UPDATE `creature_template` SET `mindmg` = 488, `maxdmg` = 642, `attackpower` = 482, `dmg_multiplier` = 7.5, `equipment_id` = 1847 WHERE `entry` = 32885;

-- 8265_thorim_chest
DELETE FROM `gameobject` WHERE `id`=194314;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(7143, 194314, 603, 1, 1, 2134.58, -286.908, 419.495, 1.55988, 0, 0, 0.703237, 0.710955, -604800, 0, 1);

-- 8266_thorim_hardmode
DELETE FROM creature_template WHERE `entry` IN (33196, 33234);
INSERT INTO `creature_template`  values
('33196','33234','0','0','0','0','28488','0','0','0','Sif','','','0','83','83','2','16','16','0','1','1.14286','1','3','370','531','4','343','35','2000','0','8','33587202','8','0','0','0','0','0','365','542','84','7','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','350','1','1','0','0','0','0','0','0','0','0','1','850','0','0','npc_sif','11159'),
('33234','0','0','0','0','0','28488','0','0','0','Sif (1)','','','0','83','83','2','35','35','0','1','1.14286','1','3','370','531','0','343','70','2000','0','8','0','8','0','0','0','0','0','365','542','84','7','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','350','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','1');

-- 8270_razorscale_triggers
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0, `flags_extra` = 2 WHERE `entry` = 33282;

-- 8274_thorim_tram
UPDATE `gameobject_template` SET `flags` = 32, `data2` = 3000 WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM gameobject WHERE id = '194437';
INSERT INTO `gameobject` (`guid`,`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(' 270010','194437','603','1','1','2306.87','274.237','424.288','1.52255','0','0','0.689847','0.723956','300','0','1');

-- 8275_tram_packets
DELETE FROM gameobject_template WHERE entry = '194438';
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');
DELETE FROM gameobject WHERE id = '194438';
INSERT INTO `gameobject` (`guid`,`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(270011, 194438, 603, 1,1,2306.99, 2589.35, 424.382, 4.71676, 0, 0, 0.705559, -0.708651, 300, 0, 1);

-- 8277_ignis_vehicle
UPDATE `creature_template` SET `vehicleid` = 342 WHERE `entry` = 33118;

-- 8281_xt002_adds
UPDATE `creature_template` SET `vehicleid` = 353 WHERE `entry` = 33293;
UPDATE `creature_template` SET `speed_walk` = 0.5, `speed_run` = 0.5, `faction_A` = 16, `faction_H` = 16 WHERE `entry` IN (33343, 33346);
UPDATE `creature_template` SET `modelid1` = 19139, `modelid2` = 0, `modelid3` = 0, `dmg_multiplier` = 35 WHERE `entry` = 33346;

-- 8282_razorscale_event
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `flags_extra` = 2 WHERE `entry` = 33245;

-- 8289_kologarn_arms
DELETE FROM `creature_model_info` WHERE `modelid` IN (28638, 28821, 28822);
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28638, 0.15, 20, 2, 0),
(28821, 0.35, 20, 2, 0),
(28822, 0.35, 20, 2, 0);

-- 8291_hodir_adds_resistance
UPDATE `creature_template` SET `resistance4` = 1000 WHERE `entry` IN (33325, 32901, 33328, 32900, 32893, 33327, 32897, 33326, 32941, 33333, 33332, 32950, 33331, 32946, 32948, 33330);

-- 8297_mimiron_phase1
UPDATE `creature_template` SET `vehicleId` = 336 WHERE `entry` = 33432; -- Leviathan Mk II
DELETE FROM creature WHERE id = 34071;
DELETE FROM vehicle_accessory WHERE entry = 33432;
INSERT INTO vehicle_accessory VALUE (33432, 34071, 7, 1, 'Leviathan Mk II turret');
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0.5, 7, 2, 0);

-- 8320 mimiron_encounter
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0, 0, 2, 0);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33856, 34143, 34050);
UPDATE `creature_template` SET `unit_flags` = 33686018 WHERE `entry` = 34050;
UPDATE `creature` SET `position_x` = 2736.92, `position_y` = 2572.30, `orientation` = 5.723 WHERE `guid` = 137630;
UPDATE `creature_template` SET `unit_flags` = 0, `vehicleid` = 371, `Health_mod` = 375 WHERE `entry` = 33651;
UPDATE `creature_template` SET `unit_flags` = 0, `vehicleid` = 388, `Health_mod` = 250 WHERE `entry` = 33670;
UPDATE `creature_template` SET `vehicleid` = 370, `Health_mod` = 156.185 WHERE `entry` = 33432;
UPDATE `creature_template` SET `Health_mod` = 156.185 WHERE `entry` = 34071;

DELETE FROM vehicle_accessory WHERE entry = 33432;
INSERT INTO vehicle_accessory VALUE (33432, 34071, 3, 1, 'Leviathan Mk II turret');
UPDATE `creature_template` SET `modelid1` = 17188, `modelid2` = 0 WHERE `entry` = 25171;
UPDATE `creature_template` SET `speed_walk` = 0.5, `speed_run` = 0.5 WHERE `entry` = 33836;

DELETE FROM `creature` WHERE `id`=33651;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33651, 603, 1, 1, 28841, 0, 2744.65, 2569.46, 364.397, 3.14159, 604800, 0, 0, 1742400, 0, 0, 0);
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2 WHERE `entry` = 34047;

DELETE FROM `creature` WHERE `id`=33670;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33670, 603, 1, 1, 28979, 0, 2744.65, 2569.46, 380.040, 3.14159, 604800, 0, 0, 1742400, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 33686020, `type_flags` = 0, `flags_extra` = 2 WHERE `entry` = 34068;
-- 8334_mimiron_chest
UPDATE `gameobject_template` SET `size` = 1.5 WHERE `entry` = 194956;
DELETE FROM `gameobject` WHERE `id`=194956;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(5868, 194956, 603, 1, 1, 2744.65, 2569.46, 364.397, 3.14159, 0, 0, 0.703237, 0.710955, -604800, 0, 1);

UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (33432, 33651, 33670);

-- 8338_ulduar_teleports
DELETE FROM `gameobject` WHERE `id`=194569;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(21679, 194569, 603, 1, 1, 2086.26, -23.9948, 421.316, 0, 0, 0, 0, 1, 180, 255, 0),
(21684, 194569, 603, 1, 1, 1498.05, -24.3509, 420.966, 0, 0, 0, 0, 1, 180, 255, 0),
(49422, 194569, 603, 1, 1, 1859.65, -24.9121, 448.811, 0, 0, 0, 0, 1, 180, 255, 0),
(49423, 194569, 603, 1, 1, 2518.16, 2569.03, 412.299, 0, 0, 0, 0, 1, 180, 255, 0),
(49424, 194569, 603, 1, 1, 1854.82, -11.5608, 334.175, 0, 0, 0, 0, 1, 180, 255, 0),
(73286, 194569, 603, 1, 1, -706.122, -92.6024, 429.876, 0, 0, 0, 0, 1, 180, 255, 0),
(73327, 194569, 603, 1, 1, 553.233, -12.3247, 409.679, 0, 0, 0, 0, 1, 180, 255, 0),
(73322, 194569, 603, 1, 1, 131.248, -35.3802, 409.804, 0, 0, 0, 0, 1, 180, 255, 0),
(73340, 194569, 603, 1, 1, 926.292, -11.4635, 418.595, 0, 0, 0, 0, 1, 180, 255, 0);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33184;

-- 8353_ulduar_evenai
-- Runeforged Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `AIName` = 'EventAI' WHERE `entry` = 34234;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34234);
INSERT INTO `creature_ai_scripts` VALUES 
(3423401, 34234, 0, 0, 100, 3, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Flaming Rune 10'),
(3423402, 34234, 0, 0, 100, 5, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Flaming Rune 25'),
(3423403, 34234, 0, 0, 100, 3, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Lava Burst 10'),
(3423404, 34234, 0, 0, 100, 5, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Lava Burst 25'),
(3423405, 34234, 0, 0, 100, 3, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Runed Flame Jets 10'),
(3423406, 34234, 0, 0, 100, 5, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Runed Flame Jets 25');

-- Steelforged Defender
UPDATE `creature_template` SET `spell1` = 62845, `spell2` = 57780, `spell3` = 50370, `AIName` = 'EventAI' WHERE `entry` = 33236;
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` IN (33236, 33838);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33236);
INSERT INTO `creature_ai_scripts` VALUES 
(3323601, 33236, 0, 0, 100, 3, 4000, 6000, 15000, 20000, 11, 62845, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Hamstring 10'),
(3323602, 33236, 0, 0, 100, 5, 4000, 6000, 15000, 20000, 11, 62845, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Hamstring 25'),
(3323603, 33236, 0, 0, 100, 3, 0, 4000, 6000, 8000, 11, 57780, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Lightning Bolt 10'),
(3323604, 33236, 0, 0, 100, 5, 0, 4000, 6000, 8000, 11, 57780, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Lightning Bolt 25'),
(3323605, 33236, 0, 0, 100, 3, 5000, 6000, 4000, 6000, 11, 50370, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Sunder Armor 10'),
(3323606, 33236, 0, 0, 100, 5, 5000, 6000, 4000, 6000, 11, 50370, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Sunder Armor 25');

-- Mechagnome Battletank
UPDATE `creature_template` SET `spell1` = 64693, `spell2` = 64953, `mindmg` = 417, `maxdmg` = 582, `attackpower` = 968, `minrangedmg` = 341, `maxrangedmg` = 506, `AIName` = 'EventAI' WHERE `entry` = 34164;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34164);
INSERT INTO `creature_ai_scripts` VALUES 
(3416401, 34164, 0, 0, 100, 3, 3000, 4000, 6000, 8000, 11, 64693, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Flame Cannon 10'),
(3416402, 34164, 0, 0, 100, 5, 3000, 4000, 6000, 8000, 11, 64693, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Flame Cannon 25'),
(3416403, 34164, 0, 0, 100, 3, 10000, 10000, 15000, 20000, 11, 64953, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Jump Attack 10'),
(3416404, 34164, 0, 0, 100, 5, 10000, 10000, 15000, 20000, 11, 64953, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Jump Attack 25');

-- Ulduar Colossus
UPDATE `creature_template` SET `spell1` = 62625, `attackpower` = 987, `AIName` = 'EventAI' WHERE `entry` = 33237;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33237);
INSERT INTO `creature_ai_scripts` VALUES 
(3323701, 33237, 0, 0, 100, 3, 8000, 10000, 20000, 25000, 11, 62625, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ulduar Colossus - Cast Ground Slam 10'),
(3323702, 33237, 0, 0, 100, 5, 8000, 10000, 20000, 25000, 11, 62625, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ulduar Colossus - Cast Ground Slam 25');

-- invisible triggers
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33377, 33742, 34286, 33500);

-- Molten Colossus
UPDATE `creature_template` SET `spell1` = 64697, `spell2` = 64698, `attackpower` = 982, `dmg_multiplier` = 30, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34069;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34069);
INSERT INTO `creature_ai_scripts` VALUES 
(3406901, 34069, 0, 0, 100, 3, 6000, 10000, 10000, 12000, 11, 64697, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Earthquake 10'),
(3406902, 34069, 0, 0, 100, 5, 6000, 10000, 10000, 12000, 11, 64697, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Earthquake 25'),
(3406903, 34069, 0, 0, 100, 3, 2000, 4000, 6000, 9000, 11, 64698, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Pyroblast 10'),
(3406904, 34069, 0, 0, 100, 5, 2000, 4000, 6000, 9000, 11, 64698, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Pyroblast 25');

-- Magma Rager
UPDATE `creature_template` SET `spell1` = 64773, `spell2` = 64746, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34086;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34086);
INSERT INTO `creature_ai_scripts` VALUES 
(3408601, 34086, 0, 0, 100, 3, 2000, 40000, 6000, 8000, 11, 64773, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Fire Blast 10'),
(3408602, 34086, 0, 0, 100, 5, 2000, 40000, 6000, 8000, 11, 64773, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Fire Blast 25'),
(3408603, 34086, 0, 0, 100, 3, 8000, 16000, 15000, 25000, 11, 64746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Superheated winds 10'),
(3408604, 34086, 0, 0, 100, 5, 8000, 16000, 15000, 25000, 11, 64746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Superheated winds 25');
UPDATE `creature_template` SET `unit_flags` = 33718790, modelid1 = 11686, modelid2 = 0, `spell1` = 64724, `AIName` = 'EventAI' WHERE `entry` = 34194;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34194);
INSERT INTO `creature_ai_scripts` VALUES 
(3419401, 34194, 0, 0, 100, 3, 0, 0, 10000, 10000, 11, 64724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Superheated Winds'),
(3419402, 34194, 0, 0, 100, 5, 0, 0, 10000, 10000, 11, 64724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Superheated Winds');

-- Forge Construct
UPDATE `creature_template` SET `spell1` = 64719, `spell2` = 64720, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34085;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34085);
INSERT INTO `creature_ai_scripts` VALUES 
(3408501, 34085, 0, 0, 100, 3, 8000, 12000, 10000, 15000, 11, 64719, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Charge 10'),
(3408502, 34085, 0, 0, 100, 5, 8000, 12000, 10000, 15000, 11, 64719, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Charge 25'),
(3408503, 34085, 0, 0, 100, 3, 2000, 6000, 6000, 9000, 11, 64720, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Flame Emission 10'),
(3408504, 34085, 0, 0, 100, 5, 2000, 6000, 6000, 9000, 11, 64721, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Flame Emission 25');

-- XB-488 Disposalbot 
UPDATE `creature_template` SET `spell1` = 65080, `spell2` = 65084, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34273; 
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34273);
INSERT INTO `creature_ai_scripts` VALUES
(3427301, 34273, 2, 0, 100, 30, 20, 0, 0, 0, 11, 65084, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Self Destruct at 20% HP on 10 and 25 normal and heroic'),
(3427303, 34273, 0, 0, 100, 11, 2000, 6000, 10000, 15000, 11, 65080, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 10 normal and heroic'),
(3427304, 34273, 0, 0, 100, 21, 2000, 6000, 10000, 15000, 11, 65104, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 25 normal and heroic');

-- Parts Recovery Technician
UPDATE `creature_template` SET `spell1` = 65071, `spell2` = 65070, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554432, `AIName` = 'EventAI' WHERE `entry` = 34267;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34267);
INSERT INTO `creature_ai_scripts` VALUES 
(3426701, 34267, 0, 0, 100, 3, 8000, 12000, 10000, 15000, 11, 65071, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Mechano Kick 10'),
(3426702, 34267, 0, 0, 100, 5, 8000, 12000, 10000, 15000, 11, 65071, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Mechano Kick 25'),
(3426703, 34267, 0, 0, 100, 3, 6000, 8000, 25000, 30000, 11, 65070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Defense Matrix 10'),
(3426704, 34267, 0, 0, 100, 5, 6000, 8000, 25000, 30000, 11, 65070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Defense Matrix 25');

-- XD-175 Compactobot
UPDATE `creature_template` SET `spell1` = 65073, `spell2` = 65106, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34271;
UPDATE `creature_template` SET `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600 WHERE `entry` = 34269;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34271);
INSERT INTO `creature_ai_scripts` VALUES 
(3427101, 34271, 0, 0, 100, 3, 8000, 12000, 15000, 20000, 11, 65073, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XD-175 Compactobot - Cast Trash Compactor 10'),
(3427102, 34271, 0, 0, 100, 5, 8000, 12000, 15000, 20000, 11, 65106, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XD-175 Compactobot - Cast Trash Compactor 25');

-- Lightning Charged Iron Dwarf
UPDATE `creature_template` SET `spell1` = 64889, `spell2` = 64975, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34199;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34199);
INSERT INTO `creature_ai_scripts` VALUES 
(3419901, 34199, 0, 0, 100, 3, 0, 0, 10000, 15000, 11, 64889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 10'),
(3419902, 34199, 0, 0, 100, 5, 0, 0, 10000, 15000, 11, 64975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 25');

-- Hardened Iron Golem
UPDATE `creature_template` SET `spell1` = 64877, `spell2` = 64874, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34190;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34190);
INSERT INTO `creature_ai_scripts` VALUES 
(3419001, 34190, 0, 0, 100, 3, 4000, 8000, 25000, 30000, 11, 64877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Harden Fists 10'),
(3419002, 34190, 0, 0, 100, 5, 4000, 8000, 25000, 30000, 11, 64877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Harden Fists 25'),
(3419003, 34190, 0, 0, 100, 3, 5000, 7000, 20000, 30000, 11, 64874, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Rune Punch 10'),
(3419004, 34190, 0, 0, 100, 5, 5000, 7000, 20000, 30000, 11, 64967, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Rune Punch 25');

-- Iron Mender
UPDATE `creature_template` SET `spell1` = 64918, `spell2` = 64903, `spell3` = 64897, `dmg_multiplier` = 25, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34198;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34198);
INSERT INTO `creature_ai_scripts` VALUES 
(3419801, 34198, 0, 0, 100, 3, 2000, 4000, 4000, 6000, 11, 64918, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Electro Shock 10'),
(3419802, 34198, 0, 0, 100, 5, 2000, 4000, 4000, 6000, 11, 64971, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Electro Shock 25'),
(3419803, 34198, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 64903, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Lightning 10'),
(3419804, 34198, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 64970, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Lightning 25'),
(3419805, 34198, 0, 0, 100, 3, 10000, 25000, 30000, 45000, 11, 64897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Metal 10'),
(3419806, 34198, 0, 0, 100, 5, 10000, 25000, 30000, 45000, 11, 64968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Metal 25');

-- Rune Etched Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `mechanic_immune_mask` = 33554496, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34196;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34196);
INSERT INTO `creature_ai_scripts` VALUES 
(3419601, 34196, 0, 0, 100, 3, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Flaming Rune 10'),
(3419602, 34196, 0, 0, 100, 5, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Flaming Rune 25'),
(3419603, 34196, 0, 0, 100, 3, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Lava Burst 10'),
(3419604, 34196, 0, 0, 100, 5, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Lava Burst 25'),
(3419605, 34196, 0, 0, 100, 3, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Runed Flame Jets 10'),
(3419606, 34196, 0, 0, 100, 5, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Runed Flame Jets 25');

-- Chamber Overseer
UPDATE `creature_template` SET `spell1` = 64820, `spell2` = 64825, `dmg_multiplier` = 55, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34197;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34197);
INSERT INTO `creature_ai_scripts` VALUES 
(3419701, 34197, 0, 0, 100, 3, 4000, 8000, 6000, 9000, 11, 64820, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Devastating Leap 10'),
(3419702, 34197, 0, 0, 100, 5, 4000, 8000, 6000, 9000, 11, 64943, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Devastating Leap 25'),
(3419703, 34197, 0, 0, 100, 3, 10000, 12000, 8000, 12000, 11, 64825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Staggering Roar 10'),
(3419704, 34197, 0, 0, 100, 5, 10000, 12000, 8000, 12000, 11, 64944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Staggering Roar 25');

-- Storm Tempered Keeper
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `dmg_multiplier` = 45, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33722;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33722);
INSERT INTO `creature_ai_scripts` VALUES 
(3372201, 33722, 0, 0, 100, 3, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 10'),
(3372202, 33722, 0, 0, 100, 5, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 25'),
(3372203, 33722, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 10'),
(3372204, 33722, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 25');

-- Storm Tempered Keeper
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `dmg_multiplier` = 45, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33699;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33699);
INSERT INTO `creature_ai_scripts` VALUES 
(3369901, 33699, 0, 0, 100, 3, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 10'),
(3369902, 33699, 0, 0, 100, 5, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 25'),
(3369903, 33699, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 10'),
(3369904, 33699, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 25');

-- Champion of Hodir
UPDATE `creature_template` SET `spell1` = 64639, `dmg_multiplier` = 55, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34133;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34133);
INSERT INTO `creature_ai_scripts` VALUES 
(3413301, 34133, 0, 0, 100, 3, 3000, 6000, 12000, 16000, 11, 64639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion of Hodir - Cast Stomp 10'),
(3413302, 34133, 0, 0, 100, 5, 3000, 6000, 12000, 16000, 11, 64652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion of Hodir - Cast Stomp 25');
DELETE FROM `creature` WHERE `guid` IN (136293, 136294, 136295, 136292, 136313, 136314, 136312, 136321, 136319, 136320, 136322, 136346, 136343, 136536, 136533, 137563);

-- Winter Jormungar
UPDATE `creature_template` SET `spell1` = 64638, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34137;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34137);
INSERT INTO `creature_ai_scripts` VALUES 
(3413701, 34137, 0, 0, 100, 3, 3000, 6000, 6000, 9000, 11, 64638, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Jormungar - Cast Acidic Bite 10'),
(3413702, 34137, 0, 0, 100, 5, 3000, 6000, 6000, 9000, 11, 64638, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Jormungar - Cast Acidic Bite 25');
UPDATE `creature` SET `spawndist` = 2 WHERE `id` = 34137;

-- Winter Revenant
UPDATE `creature_template` SET `spell1` = 64642, `spell2` = 64643, `spell3` = 64644, `mechanic_immune_mask` = 33554496, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34134;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34134);
INSERT INTO `creature_ai_scripts` VALUES 
(3413401, 34134, 0, 0, 100, 3, 8000, 12000, 15000, 20000, 11, 64642, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Blizzard 10'),
(3413402, 34134, 0, 0, 100, 5, 8000, 12000, 15000, 20000, 11, 64653, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Blizzard 25'),
(3413403, 34134, 0, 0, 100, 3, 3000, 5000, 10000, 12000, 11, 64643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Whirling Strike 10'),
(3413404, 34134, 0, 0, 100, 5, 3000, 5000, 10000, 12000, 11, 64643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Whirling Strike 25'),
(3413405, 34134, 0, 0, 100, 3, 15000, 20000, 60000, 75000, 11, 64644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Shield of the Winter Revenant 10'),
(3413406, 34134, 0, 0, 100, 5, 15000, 20000, 60000, 75000, 11, 64644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Shield of the Winter Revenant 25');

-- Winter Rumbler
UPDATE `creature_template` SET `spell1` = 64645, `spell2` = 64647, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34135;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34135);
INSERT INTO `creature_ai_scripts` VALUES 
(3413501, 34135, 0, 0, 100, 3, 6000, 12000, 10000, 16000, 11, 64645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Cone of Cold 10'),
(3413502, 34135, 0, 0, 100, 5, 6000, 12000, 10000, 16000, 11, 64655, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Cone of Cold 25'),
(3413503, 34135, 0, 0, 100, 3, 3000, 6000, 8000, 12000, 11, 64647, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Snow Blindness 10'),
(3413504, 34135, 0, 0, 100, 5, 3000, 6000, 8000, 12000, 11, 64654, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Snow Blindness 25');

-- Guardian Lasher
UPDATE `creature_template` SET `spell1` = 63007, `spell2` = 63047, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33430;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33430);
INSERT INTO `creature_ai_scripts` VALUES
(3343001, 33430, 4, 0, 100, 30, 0, 0, 0, 0, 11, 63007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian Pheromones 10 and 25'),
(3343003, 33430, 0, 0, 100, 31, 3000, 6000, 10000, 14000, 11, 63047, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian''s Lash 10 and 25');

-- Forest Swarmer
UPDATE `creature_template` SET `spell1` = 63059, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33431;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33431);
INSERT INTO `creature_ai_scripts` VALUES 
(3343101, 33431, 0, 0, 100, 3, 3000, 9000, 10000, 20000, 11, 63059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forest Swarmer - Cast Pollinate 10'),
(3343102, 33431, 0, 0, 100, 5, 3000, 9000, 10000, 20000, 11, 63059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forest Swarmer - Cast Pollinate 25');
/*
DELETE FROM `spell_script_target` WHERE `entry`=63059;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES('63059','1','33430');
*/

-- Guardian of Life
UPDATE `creature_template` SET `spell1` = 63226, `mingold` = 7100, `maxgold` = 7600, `dmg_multiplier` = 15, `AIName` = 'EventAI' WHERE `entry` = 33528;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33528);
INSERT INTO `creature_ai_scripts` VALUES 
(3352801, 33528, 0, 0, 100, 3, 3000, 9000, 15000, 20000, 11, 63226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Life - Cast Poison Breath 10'),
(3352802, 33528, 0, 0, 100, 5, 3000, 9000, 15000, 20000, 11, 63551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Life - Cast Poison Breath 25');

-- Nature's Blade
UPDATE `creature_template` SET `spell1` = 63247, `mingold` = 7100, `maxgold` = 7600, `dmg_multiplier` = 25, `AIName` = 'EventAI' WHERE `entry` = 33527;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33527);

-- Ironroot Lasher
UPDATE `creature_template` SET `spell1` = 63240, `mingold` = 7100, `maxgold` = 7600, `dmg_multiplier` = 15, `AIName` = 'EventAI' WHERE `entry` = 33526;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33526);
INSERT INTO `creature_ai_scripts` VALUES 
(3352601, 33526, 0, 0, 100, 3, 3000, 8000, 12000, 16000, 11, 63240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironroot Lasher - Cast Ironroot Thorns 10'),
(3352602, 33526, 0, 0, 100, 5, 3000, 8000, 12000, 16000, 11, 63553, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironroot Lasher - Cast Ironroot Thorns 25');

-- Mangrove Ent
UPDATE `creature_template` SET `spell1` = 63272, `spell2` = 63242, `spell3` = 63241, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33525;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33525);
INSERT INTO `creature_ai_scripts` VALUES 
(3352501, 33525, 0, 0, 100, 3, 8000, 12000, 25000, 30000, 11, 63272, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Hurricane 10'),
(3352502, 33525, 0, 0, 100, 5, 8000, 12000, 25000, 30000, 11, 63272, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Hurricane 25'),
(3352503, 33525, 0, 0, 100, 3, 12000, 16000, 12000, 16000, 11, 63242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Nourish 10'),
(3352504, 33525, 0, 0, 100, 5, 12000, 16000, 12000, 16000, 11, 63556, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Nourish 25'),
(3352505, 33525, 0, 0, 100, 3, 25000, 30000, 25000, 30000, 11, 63241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Tranquility 10'),
(3352506, 33525, 0, 0, 100, 5, 25000, 30000, 25000, 30000, 11, 63554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Tranquility 25');

-- Misguided Nymph
UPDATE `creature_template` SET `spell1` = 63082, `spell2` = 63111, `spell3` = 63136, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33355;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33355);
INSERT INTO `creature_ai_scripts` VALUES 
(3335501, 33355, 0, 0, 100, 3, 8000, 12000, 25000, 30000, 11, 63082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Bind Life 10'),
(3335502, 33355, 0, 0, 100, 5, 8000, 12000, 25000, 30000, 11, 63559, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Bind Life 25'),
(3335503, 33355, 0, 0, 100, 3, 4000, 6000, 12000, 16000, 11, 63111, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Frost Spear 10'),
(3335504, 33355, 0, 0, 100, 5, 4000, 6000, 12000, 16000, 11, 63562, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Frost Spear 25'),
(3335505, 33355, 0, 0, 100, 3, 15000, 20000, 15000, 20000, 11, 63136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Winter''s Embrace 10'),
(3335506, 33355, 0, 0, 100, 5, 15000, 20000, 15000, 20000, 11, 63564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Winter''s Embrace 25');

-- Corrupted Servitor
UPDATE `creature_template` SET `spell1` = 63169, `spell2` = 63149, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33354;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33354);
INSERT INTO `creature_ai_scripts` VALUES 
(3335401, 33354, 0, 0, 100, 3, 2000, 4000, 20000, 25000, 11, 63169, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Petrify Joints 10'),
(3335402, 33354, 0, 0, 100, 5, 2000, 4000, 20000, 25000, 11, 63549, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Petrify Joints 25'),
(3335403, 33354, 0, 0, 100, 3, 6000, 8000, 12000, 16000, 11, 63149, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Violent Earth 10'),
(3335404, 33354, 0, 0, 100, 5, 6000, 8000, 12000, 16000, 11, 63149, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Violent Earth 25');

-- Dark Rune
UPDATE `creature_template` SET `dmg_multiplier` = 55, `mingold` = 7100, `maxgold` = 7600 WHERE `entry` IN (33754, 33755);

-- Freya's Elders
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33406, 33575);
UPDATE `creature_template` SET `dmg_multiplier` = 45, `mechanic_immune_mask` = 650854235 WHERE `entry` IN (32913, 32915, 32914);

-- Arachnopod Destroyer
UPDATE `creature_template` SET `spell1` = 64717, `spell2` = 64776, `dmg_multiplier` = 30, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34183;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34183);
INSERT INTO `creature_ai_scripts` VALUES 
(3418301, 34183, 0, 0, 100, 3, 2000, 4000, 12000, 16000, 11, 64717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Flame Spray 10'),
(3418302, 34183, 0, 0, 100, 5, 2000, 4000, 12000, 16000, 11, 64717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Flame Spray 25'),
(3418303, 34183, 0, 0, 100, 3, 8000, 10000, 12000, 16000, 11, 64776, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Machine Gun 10'),
(3418304, 34183, 0, 0, 100, 5, 8000, 10000, 12000, 16000, 11, 64776, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Machine Gun 25');

-- Clockwork Mechanic
UPDATE `creature_template` SET `dmg_multiplier` = 20, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 34184;

-- Trash
UPDATE `creature_template` SET `dmg_multiplier` = 10 WHERE `entry` = 34191;

-- Boomer XP-500
UPDATE `creature_template` SET `spell1` = 55714, `dmg_multiplier` = 15, `AIName` = 'EventAI' WHERE `entry` = 34192;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34192);
INSERT INTO `creature_ai_scripts` VALUES 
(3419201, 34192, 9, 0, 100, 3, 0, 3, 0, 0, 11, 55714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Boomer XP-500 - Explode 10'),
(3419202, 34192, 9, 0, 100, 5, 0, 3, 0, 0, 11, 55714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Boomer XP-500 - Explode 25');

-- Clockwork Sapper
UPDATE `creature_template` SET `spell1` = 64740, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 20, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34193;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34193);
INSERT INTO `creature_ai_scripts` VALUES 
(3419301, 34193, 0, 0, 100, 3, 2000, 6000, 12000, 16000, 11, 64740, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clockwork Sapper - Cast Energy Sap 10'),
(3419302, 34193, 0, 0, 100, 5, 2000, 6000, 12000, 16000, 11, 64740, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clockwork Sapper - Cast Energy Sap 25');

-- Twilight Adherent
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63760, `spell3` = 13704, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33818;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33818);
INSERT INTO `creature_ai_scripts` VALUES 
(3381801, 33818, 0, 0, 100, 3, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Arcane Burst 10'),
(3381802, 33818, 0, 0, 100, 5, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Arcane Burst 25'),
(3381803, 33818, 0, 0, 100, 3, 18000, 24000, 20000, 24000, 11, 63760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Greater Heal 10'),
(3381804, 33818, 0, 0, 100, 5, 18000, 24000, 20000, 24000, 11, 63760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Greater Heal 25'),
(3381805, 33818, 0, 0, 100, 3, 2000, 4000, 10000, 16000, 11, 13704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Psychic Scream 10'),
(3381806, 33818, 0, 0, 100, 5, 2000, 4000, 10000, 16000, 11, 13704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Psychic Scream 25');

-- Twilight Guardian
UPDATE `creature_template` SET `spell1` = 52719, `spell2` = 62317, `spell3` = 63757, `mechanic_immune_mask` = 33554513, `equipment_id` = 1852, `dmg_multiplier` = 40, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33822;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33822);
INSERT INTO `creature_ai_scripts` VALUES 
(3382201, 33822, 0, 0, 100, 3, 6000, 10000, 8000, 10000, 11, 52719, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Concussion Blow 10'),
(3382202, 33822, 0, 0, 100, 5, 6000, 10000, 8000, 10000, 11, 52719, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Concussion Blow 25'),
(3382203, 33822, 0, 0, 100, 3, 2000, 3000, 3000, 6000, 11, 62317, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Devastate 10'),
(3382204, 33822, 0, 0, 100, 5, 2000, 3000, 3000, 6000, 11, 62317, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Devastate 25'),
(3382205, 33822, 0, 0, 100, 3, 16000, 18000, 14000, 16000, 11, 63757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Thunderclap 10'),
(3382206, 33822, 0, 0, 100, 5, 16000, 18000, 14000, 16000, 11, 63757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Thunderclap 25');

-- Twilight Shadowblade
UPDATE `creature_template` SET `spell1` = 63753, `mechanic_immune_mask` = 33554513,  `equipment_id` = 1862, `dmg_multiplier` = 25, `baseattacktime` = 1000, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33824;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33824);
INSERT INTO `creature_ai_scripts` VALUES 
(3382401, 33824, 0, 0, 100, 3, 6000, 8000, 14000, 16000, 11, 63753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Shadowblade - Cast Fan of Knives 10'),
(3382402, 33824, 0, 0, 100, 5, 6000, 8000, 14000, 16000, 11, 63753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Shadowblade - Cast Fan of Knives 25');

-- Twilight Slayer
UPDATE `creature_template` SET `spell1` = 63784, `spell2` = 35054, `mechanic_immune_mask` = 33554513, `equipment_id` = 1847, `dmg_multiplier` = 50, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33823;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33823);
INSERT INTO `creature_ai_scripts` VALUES 
(3382301, 33823, 0, 0, 100, 3, 3000, 5000, 16000, 20000, 11, 35054, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Mortal Strike 10'),
(3382302, 33823, 0, 0, 100, 5, 3000, 5000, 8000, 10000, 11, 35054, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Mortal Strike 25'),
(3382303, 33823, 0, 0, 100, 3, 9000, 12000, 28000, 34000, 11, 63784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Bladestorm 10'),
(3382304, 33823, 0, 0, 100, 5, 9000, 12000, 28000, 34000, 11, 63784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Bladestorm 25');

UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` IN (33818, 33822, 33823, 33824, 33772, 33819, 33820, 33838);
UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 32908;

-- Faceless Horror
UPDATE `creature_template` SET `spell1` = 64429, `spell2` = 63722, `spell3` = 63710, `spell4` = 63703, `mechanic_immune_mask` = 33554513, `dmg_multiplier` = 65, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33772;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33772); 
INSERT INTO `creature_ai_scripts` VALUES
(3377201, 33772, 0, 0, 100, 31, 18000, 22000, 15000, 20000, 11, 64429, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Death Grip 10 and 25'),
(3377203, 33772, 0, 0, 100, 31, 2000, 4000, 10000, 12000, 11, 63722, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Shadow Crash 10 and 25'),
(3377205, 33772, 4, 0, 100, 30, 0, 0, 0, 0, 11, 63703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Void Wave 10 and 25');

-- Twilight Frost Mage
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63758, `spell3` = 63912, `spell4` = 63913, `equipment_id` = 1849, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33819;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33819);
INSERT INTO `creature_ai_scripts` VALUES 
(3381901, 33819, 0, 0, 100, 3, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Arcane Burst 10'),
(3381902, 33819, 0, 0, 100, 5, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Arcane Burst 25'),
(3381903, 33819, 0, 0, 100, 3, 1000, 2000, 6000, 8000, 11, 63913, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frostbolt 10'),
(3381904, 33819, 0, 0, 100, 5, 1000, 2000, 6000, 8000, 11, 63913, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frostbolt 25'),
(3381905, 33819, 0, 0, 100, 3, 2000, 4000, 10000, 16000, 11, 63758, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Bolt Volley 10'),
(3381906, 33819, 0, 0, 100, 5, 2000, 4000, 10000, 16000, 11, 63758, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Bolt Volley 25'),
(3381907, 33819, 0, 0, 100, 3, 8000, 10000, 12000, 16000, 11, 63912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Nova 10'),
(3381908, 33819, 0, 0, 100, 5, 8000, 10000, 12000, 16000, 11, 63912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Nova 25');

-- Twilight Pyromancer
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63789, `spell3` = 63775, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33820;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33820);
INSERT INTO `creature_ai_scripts` VALUES 
(3382001, 33820, 0, 0, 100, 3, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Arcane Burst 10'),
(3382002, 33820, 0, 0, 100, 5, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Arcane Burst 25'),
(3382003, 33820, 0, 0, 100, 3, 1000, 2000, 6000, 8000, 11, 63789, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Fireball 10'),
(3382004, 33820, 0, 0, 100, 5, 1000, 2000, 6000, 8000, 11, 63789, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Fireball 25'),
(3382005, 33820, 0, 0, 100, 3, 2000, 4000, 10000, 16000, 11, 63775, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Flamestrike 10'),
(3382006, 33820, 0, 0, 100, 5, 2000, 4000, 10000, 16000, 11, 63775, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Flamestrike 25');

-- Enslaved Fire Elemental
UPDATE `creature_template` SET `spell1` = 38064, `spell2` = 63778, `mechanic_immune_mask` = 33554513, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33838;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33838);
INSERT INTO `creature_ai_scripts` VALUES
(3383801, 33838, 0, 0, 100, 31, 4000, 8000, 12000, 14000, 11, 38064, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enslaved Fire Elemental - Cast Blast Wave 10 and 25'),
(3383803, 33838, 4, 0, 100, 30, 0, 0, 0, 0, 11, 63778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enslaved Fire Elemental - Cast Fire Shield 10 and 25 normal and heroic');


-- Flame Leviathan
UPDATE `creature_template` SET `dmg_multiplier` = 40, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 33118;

-- Ignis
UPDATE `creature_template` SET `dmg_multiplier` = 45, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 33118;
UPDATE `creature_template` SET `dmg_multiplier` = 21 WHERE `entry` = 33121;

-- Razorscale
UPDATE `creature_template` SET `dmg_multiplier` = 45, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 33186;
UPDATE `creature_template` SET `dmg_multiplier` = 15 WHERE `entry` IN (33453, 33388);
UPDATE `creature_template` SET `dmg_multiplier` = 23 WHERE `entry` = 33846;

-- XT-002
UPDATE `creature_template` SET `dmg_multiplier` = 80, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 33293;

-- Assembly of Iron
UPDATE `creature_template` SET `dmg_multiplier` = 95, `AIName` = '' WHERE `entry` = 32867;
UPDATE `creature_template` SET `dmg_multiplier` = 60, `AIName` = '' WHERE `entry` = 32927;
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 32857;

-- Kologarn
UPDATE `creature_template` SET `dmg_multiplier` = 65 WHERE `entry` = 32930;

-- Hodir
UPDATE `creature_template` SET `dmg_multiplier` = 60 WHERE `entry` = 32845;

-- Auriaya
UPDATE `creature_template` SET `dmg_multiplier` = 65, `unit_class` = 1, `mingold` = 1720000, `maxgold` = 1760000, `mechanic_immune_mask` = 617299803 WHERE `entry` = 33515;
-- ERROR: Creature (Entry: 33515, class 1) has different `unit_class` in difficulty 1 mode (Entry: 34175, class 2).
-- Lo mismo si pones un unit_class en normal o en hero las dos deben ser iguales
UPDATE `creature_template` SET `unit_class` = 1 WHERE `entry` = 34175;
UPDATE `creature_template` SET `speed_walk` = 2, `speed_run` = 2, `dmg_multiplier` = 3 WHERE `entry` = 34035;

-- Freya
UPDATE `creature_template` SET `dmg_multiplier` = 50 WHERE `entry` = 32906;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 7.5, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 32918;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 40, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33203;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 33202;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 32919;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 45, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 32916;

-- Thorim
UPDATE `creature_template` SET `dmg_multiplier` = 60 WHERE `entry` = 32865;
UPDATE `creature_template` SET `dmg_multiplier` = 35 WHERE `entry` IN (32882, 32872, 32873);
UPDATE `creature_template` SET `dmg_multiplier` = 20 WHERE `entry` IN (32908, 32876, 32877, 32874, 33125);
UPDATE `creature_template` SET `dmg_multiplier` = 15 WHERE `entry` IN (32885, 33110, 32878);
UPDATE `creature_template` SET `dmg_multiplier` = 10 WHERE `entry` = 32904;

-- Mimiron
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 75, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 33432;

-- Vezax
UPDATE `creature_template` SET `dmg_multiplier` = 65, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 33271;

-- 8362_boss_vezax
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803, `flags_extra` = 257 WHERE `entry` = 33271;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33488;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33524;

-- 8378_ulduar_modelid
-- XT-002
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 10 WHERE `modelid` = 28611;
UPDATE `creature_template` SET `dmg_multiplier` = 70 WHERE `entry` = 33293;
-- Assembly of Iron
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 25 WHERE `modelid` = 28313;
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 6 WHERE `modelid` = 28344;
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299547 WHERE `entry` = 32857;
UPDATE `creature_template` SET `dmg_multiplier` = 60 WHERE `entry` = 32867;
UPDATE `creature_template` SET `dmg_multiplier` = 45 WHERE `entry` = 32927;
-- Kologarn
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28638;
UPDATE `creature_model_info` SET `bounding_radius` = 0.35, `combat_reach` = 15 WHERE `modelid` = 28821;
UPDATE `creature_model_info` SET `bounding_radius` = 0.35, `combat_reach` = 15 WHERE `modelid` = 28822;
UPDATE `creature_template` SET `baseattacktime` = 1800 WHERE `entry` = 32930;
-- Auriaya
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28651;
UPDATE `creature_template` SET `dmg_multiplier` = 60 WHERE `entry` = 33515;
-- Freya
UPDATE `creature_template` SET `baseattacktime` = 1500 WHERE `entry` = 32906;
-- Mimiron
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 7 WHERE `modelid` = 28831;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28841;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 4 WHERE `modelid` = 28979;
-- Genaral Vezax
UPDATE `creature_template` SET `baseattacktime` = 1800, `dmg_multiplier` = 45 WHERE `entry` = 33271;
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 12 WHERE `modelid` = 28548;
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` = 33838;

-- 8406_emalon
UPDATE creature_template SET lootid = 33993, mindmg = 509, maxdmg = 683, attackpower = 805, dmg_multiplier = 35 WHERE entry = 33993;
UPDATE creature_template SET lootid = 33994, mindmg = 509, maxdmg = 683, attackpower = 805, dmg_multiplier = 70 WHERE entry = 33994;

-- 8407_voa&emalon
UPDATE creature SET spawnMask = 1 WHERE id = 33993;
UPDATE creature_template SET faction_A = 16, faction_H = 16 WHERE entry = 33994;
UPDATE creature_template SET mindmg = 422, maxdmg = 586, attackpower = 642, dmg_multiplier = 7.5, minrangedmg = 345, maxrangedmg = 509, rangedattackpower = 103 WHERE entry = 33998;

-- 8422 ulduar_loots_hardmode
UPDATE `creature_template` SET `unit_flags` = 2 WHERE `entry` = 33686;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33779;
DELETE FROM `creature_template` WHERE entry = 33115;
DELETE FROM creature WHERE id = 33115;

-- eliminado porque ctdb lo tiene bien
/*
-- Emblem of Valor
UPDATE creature_loot_template SET item = 40753 WHERE entry IN (33113, 33186, 33118, 33293, 32927, 32857, 33515, 33271) AND item = 45624;
UPDATE gameobject_loot_template SET item = 40753 WHERE entry IN (27061, 26963, 27078, 27081, 26955, 26946, 27068) AND item = 40752;
*/

-- Flame Leviathan
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803 WHERE `entry` = 33113;

UPDATE script_texts SET `type` = 2 WHERE entry = -1603218;

-- 8410_vezax_animus
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 33524;
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 10 WHERE `modelid` = 28992;

-- mimiron_hardmode
UPDATE `gameobject_template` SET `type` = 1, `flags` = 32 WHERE `entry` = 194739;
UPDATE `creature_template` SET `unit_flags` = 33554946, `speed_walk` = 0.15, `speed_run` = 0.15 WHERE `entry` = 34363;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 34149;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 7.5, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 33855;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 15, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 34057;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 33836;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 34147;

-- 8407_emalon
UPDATE creature SET spawnMask = 1 WHERE id = 33993;
UPDATE creature_template SET faction_A = 16, faction_H = 16 WHERE entry = 33994;
UPDATE creature_template SET mindmg = 422, maxdmg = 586, attackpower = 642, dmg_multiplier = 7.5, minrangedmg = 345, maxrangedmg = 509, rangedattackpower = 103 WHERE entry = 33998;

-- 8429_leviathan_encounter
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62475;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62475','9032','2','System Shutdown');

DELETE FROM areatrigger_scripts WHERE entry IN (5369, 5423);
INSERT INTO areatrigger_scripts VALUES
(5369,'at_RX_214_repair_o_matic_station'),
(5423,'at_RX_214_repair_o_matic_station');

-- 8436_dalaran_teleporter
UPDATE `gameobject_template` SET `type` = 22, `data0` = 53141, `data2` = 1, `data3` = 1 WHERE `entry` = 194481;

-- 8440_achievement_antechamber
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10578, 10579, 10580, 10581);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(10578, 12, 0, 0),
(10580, 12, 0, 0),
(10579, 12, 1, 0),
(10581, 12, 1, 0);

-- 8441_bind
UPDATE `creature_template` SET Health_mod = 50 WHERE `entry` = 33109;
UPDATE `creature_template` SET Health_mod = 90 WHERE `entry` = 33060;
UPDATE `creature_template` SET Health_mod = 40 WHERE `entry` = 33062;

UPDATE `creature_template` SET `dmg_multiplier` = 55, `flags_extra` = 9 WHERE `entry` = 33118;
UPDATE `creature_template` SET `dmg_multiplier` = 50, flags_extra = 1 WHERE `entry` = 33186;
UPDATE `creature_template` SET `dmg_multiplier` = 75, flags_extra = 1 WHERE `entry` = 33293;
UPDATE `creature_template` SET flags_extra = 257 WHERE entry IN (33113, 33271); 
UPDATE `creature_template` SET flags_extra = 1 WHERE entry IN (32867, 32927, 32857, 32930, 33515, 32906, 32845, 33350, 33432, 33651, 33670, 32865, 33288);

-- 8441_achievement_keepers
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10559, 10444, 10563, 10455, 10558, 10438, 10561, 10454, 10408, 10560, 10453, 10562);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Freya
(10559, 12, 0, 0),
(10444, 12, 0, 0),
(10563, 12, 1, 0),
(10455, 12, 1, 0),
-- Thorim
(10558, 12, 0, 0),
(10438, 12, 0, 0),
(10561, 12, 1, 0),
(10454, 12, 1, 0),
-- Hodir
(10408, 12, 0, 0),
(10560, 12, 0, 0),
(10453, 12, 1, 0),
(10562, 12, 1, 0);

-- 8447
-- dalaran portal
UPDATE `gameobject_template` SET `faction` = 2007, `data0` = 53141, `data2` = 0 WHERE `entry` = 194481;

-- 8444_ulduar_bind
UPDATE `creature_template` SET Health_mod = 50 WHERE `entry` = 33109;
UPDATE `creature_template` SET Health_mod = 90 WHERE `entry` = 33060;
UPDATE `creature_template` SET Health_mod = 40 WHERE `entry` = 33062;

UPDATE `creature_template` SET `dmg_multiplier` = 55, `flags_extra` = 9 WHERE `entry` = 33118;
UPDATE `creature_template` SET `dmg_multiplier` = 50, flags_extra = 1 WHERE `entry` = 33186;
UPDATE `creature_template` SET `dmg_multiplier` = 75, flags_extra = 1 WHERE `entry` = 33293;
UPDATE `creature_template` SET flags_extra = 257 WHERE entry IN (33113, 33271); 
UPDATE `creature_template` SET flags_extra = 1 WHERE entry IN (32867, 32927, 32857, 32930, 33515, 32906, 32845, 33350, 33432, 33651, 33670, 32865, 33288);

-- 8451_vehicle_regen
-- Ulduar vehicle regen and Freya's Healthy Spores
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 33215;
UPDATE `creature_template` SET `RegenHealth` = 0 WHERE `entry` IN (33060, 33062, 33109);

-- 8452_keepers_images
-- Ulduar Keepers Images
DELETE FROM `creature` WHERE `id` IN (33213, 33241, 33242, 33244);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33241, 603, 1, 1, 0, 0, 2057.81, -24.0768, 421.532, 3.12904, 604800, 0, 0, 14433075, 0, 0, 0),
(33242, 603, 1, 1, 0, 0, 2036.81, -73.7053, 411.353, 2.43575, 604800, 0, 0, 14433075, 0, 0, 0),
(33244, 603, 1, 1, 0, 0, 2036.74, 25.4642, 411.357, 3.81412, 604800, 0, 0, 14433075, 0, 0, 0),
(33213, 603, 1, 1, 0, 0, 1939.29, -90.6994, 411.357, 1.02595, 604800, 0, 0, 14433075, 0, 0, 0);

UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `npcflag` = 1, `flags_extra` = 2 WHERE `entry` IN (33213, 33241, 33242, 33244);

-- 8453_razorscale_yell
-- razorscale yell fix
UPDATE `script_texts` SET `content_default` = "Move! Quickly! She won't remain grounded for long.", `type` = 1  WHERE `entry` = -1603261;

-- 8486
-- Sanctum Sentry damage
UPDATE `creature_template` SET `dmg_multiplier` = 45 WHERE `entry` = 34014;

-- Thorim
-- IA for Thorim

-- Thorim immunity on disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239 WHERE `entry` = 32865;



-- Keepers (Yogg Saron Encounter)
DELETE FROM `creature` WHERE `id` IN (33410, 33411, 33412, 33413);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33410, 603, 1, 1, 0, 0, 2036.739, 25.464, 338.296, 3.814, 604800, 0, 0, 14433075, 0, 0, 0),
(33411, 603, 1, 1, 0, 0, 1939.094, -90.699, 338.296, 1.026, 604800, 0, 0, 14433075, 0, 0, 0),
(33412, 603, 1, 1, 0, 0, 1939.094, 42.534, 338.296, 5.321, 604800, 0, 0, 14433075, 0, 0, 0),
(33413, 603, 1, 1, 0, 0, 2036.739, -73.705, 338.296, 2.435, 604800, 0, 0, 14433075, 0, 0, 0);

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `minlevel` = 80, `maxlevel` = 80, `unit_flags` = 33686018, `type_flags` = 0 WHERE `entry` = 33991;

-- 8571_ulduar_ironconstruct
-- Despawn Iron Construct (Ignis)
DELETE FROM creature WHERE id = 33121;

-- 8588_xt002_vehicleid
-- XT-002 vehicle id
UPDATE `creature_template` SET `unit_flags` = 33554432, `type_flags` = 0, `VehicleId` = 335 WHERE `entry` = 33293;

-- 8592_ulduar_colossus
-- Ulduar Colossus
DELETE FROM creature_template WHERE entry = 33240;
DELETE FROM `creature` WHERE `id`=33237 AND `position_x` >= 367;

-- 8594_ulduar_25_siege
-- Creatures and Gameobjects 25 man spawn
UPDATE `creature` SET `spawnMask` = 3 WHERE `map` = 603;
UPDATE `gameobject` SET `spawnMask` = 3 WHERE `map` = 603;

-- .tele Uld (teleporta davanti Ulduar)
DELETE FROM `game_tele` WHERE `name` = "Uld";
INSERT INTO `game_tele` VALUES
(NULL, 9347.78, -1114.88, 1245.09, 6.278, 571, 'Uld');

-- Salvaged Chopper has no heroic entry
UPDATE `creature_template` SET `difficulty_entry_1` = 0 WHERE `entry` = 33062;

-- Runeforged Sentry
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 15, `minrangedmg` = 363, `maxrangedmg` = 521, `rangedattackpower` = 121 WHERE `entry` = 34235;

-- Ulduar Colossus
UPDATE `creature_template` SET `faction_A` = 1692, `faction_H` = 1692, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 987, `dmg_multiplier` = 15 WHERE `entry` = 34105;

-- Flame Leviathan
UPDATE `creature_template` SET `faction_A` = 1965, `faction_H` = 1965, `speed_walk` = 0.6, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 35, `unit_flags` = 64, `minrangedmg` = 371, `maxrangedmg` = 535, `rangedattackpower` = 135, `mechanic_immune_mask` = 617299803, `flags_extra` = 257 WHERE `entry` = 34003;
UPDATE `creature_template` SET `faction_A` = 1965, `faction_H` = 1965 WHERE `entry` = 34111;

-- Molten Colossus
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 982, `dmg_multiplier` = 45, `minrangedmg` = 363, `maxrangedmg` = 521, `rangedattackpower` = 121, `mingold` = 142000, `maxgold` = 156000, `mechanic_immune_mask` = 617299803 WHERE `entry` = 34185;

-- Magma Rager
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 463, `maxdmg` = 640, `attackpower` = 726, `dmg_multiplier` = 30, `minrangedmg` = 360, `maxrangedmg` = 520, `rangedattackpower` = 91, `mingold` = 142000, `maxgold` = 156000, `mechanic_immune_mask` = 617299803 WHERE `entry` = 34201;

-- Forge Construct
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 463, `maxdmg` = 640, `attackpower` = 726, `dmg_multiplier` = 30, `minrangedmg` = 360, `maxrangedmg` = 520, `rangedattackpower` = 91, `mingold` = 142000, `maxgold` = 156000, `mechanic_immune_mask` = 617299803 WHERE `entry` = 34186;

-- Ignis
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 0.888888, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 75, `baseattacktime` = 1500, `minrangedmg` = 371, `maxrangedmg` = 535, `rangedattackpower` = 135, `type_flags` = 4194412, `mechanic_immune_mask` = 650854235, `flags_extra` = 9 WHERE `entry` = 33190;
UPDATE `creature_template` SET `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 30, `unit_flags` = 33947654, `minrangedmg` = 345, `maxrangedmg` = 509, `rangedattackpower` = 103 WHERE `entry` = 33191;

-- Razorscale
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 70, `unit_flags` = 32768, `minrangedmg` = 371, `maxrangedmg` = 535, `rangedattackpower` = 135, `mingold` = 1720000, `maxgold` = 1760000, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33724;
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `faction_A` = 14, `faction_H` = 14, `unit_flags` = 33554432 WHERE `entry` = 34189;
-- Expedition defender, trapper, engineer
UPDATE `creature_template` SET `faction_A` = 2105, `faction_H` = 2105, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 15, `baseattacktime` = 1500, `minrangedmg` = 342, `maxrangedmg` = 509, `rangedattackpower` = 103, `equipment_id` = 1016 WHERE `entry` = 34255;
UPDATE `creature_template` SET `faction_A` = 2105, `faction_H` = 2105, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 15, `baseattacktime` = 1500, `minrangedmg` = 342, `maxrangedmg` = 509, `rangedattackpower` = 103, `equipment_id` = 1762 WHERE `entry` = 34257;
UPDATE `creature_template` SET `faction_A` = 2105, `faction_H` = 2105, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 15, `baseattacktime` = 1500, `minrangedmg` = 342, `maxrangedmg` = 509, `rangedattackpower` = 103, `equipment_id` = 361 WHERE `entry` = 34256;
-- Expedition Commader
UPDATE `creature_template` SET `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 15, `unit_flags` = 514, `minrangedmg` = 342, `maxrangedmg` = 509, `rangedattackpower` = 103 WHERE `entry` = 34254;
-- Dark Rune Guardian, Sentinel and Watcher
UPDATE `creature_template` SET `faction_A` = 1965, `faction_H` = 1965, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 25, `unit_flags` = 32768, `minrangedmg` = 342, `maxrangedmg` = 509, `rangedattackpower` = 103, `equipment_id` = 574, `mechanic_immune_mask` = 0 WHERE `entry` = 33850;
UPDATE `creature_template` SET `faction_A` = 1965, `faction_H` = 1965, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 40, `unit_flags` = 32768, `minrangedmg` = 342, `maxrangedmg` = 509, `rangedattackpower` = 103, `equipment_id` = 1863, `mechanic_immune_mask` = 0 WHERE `entry` = 33852;
UPDATE `creature_template` SET `faction_A` = 1965, `faction_H` = 1965, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 15, `unit_flags` = 32768, `minrangedmg` = 342, `maxrangedmg` = 509, `rangedattackpower` = 103, `equipment_id` = 1787, `mechanic_immune_mask` = 0 WHERE `entry` = 33851;

-- XT-002
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 2.8, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 100, `baseattacktime` = 1800, `minrangedmg` = 371, `maxrangedmg` = 535, `rangedattackpower` = 135, `type_flags` = 0, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33885;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 0.6, `speed_run` = 0.6, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 2, `minrangedmg` = 345, `maxrangedmg` = 509, `rangedattackpower` = 103, `type_flags` = 0 WHERE `entry` = 33887;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 10, `minrangedmg` = 345, `maxrangedmg` = 509, `rangedattackpower` = 103 WHERE `entry` = 33888;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 0.6, `speed_run` = 0.6, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 45, `minrangedmg` = 345, `maxrangedmg` = 509, `rangedattackpower` = 103 WHERE `entry` = 33886;
-- Heart
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 33554434, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33995;
-- XT-002 trash
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 20, `minrangedmg` = 345, `maxrangedmg` = 509, `rangedattackpower` = 103, `mingold` = 146000, `maxgold` = 152000, `mechanic_immune_mask` = 617299803 WHERE `entry` = 34268;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 30, `minrangedmg` = 345, `maxrangedmg` = 509, `rangedattackpower` = 103, `mingold` = 146000, `maxgold` = 152000, `mechanic_immune_mask` = 617299803 WHERE `entry` IN (34270, 34272, 34274);
-- Delete chests from db
DELETE FROM `gameobject` WHERE `id` IN (194307, 194308, 195046, 195047);


-- ------------ --
-- DROPS ULDUAR --
-- ------------ --

-- 8603_ulduar_chests
-- Delete chests from db
DELETE FROM `gameobject` WHERE `id` IN (194307, 194308, 195046, 195047);

-- ---------------------------------------------------
-- Redon all drops from Ulduar by Misimouse & Burnham
-- ---------------------------------------------------
-- Boses done
-- Flame Leviathan
-- Razorscale
-- Ignis the Furnace Master
-- XT-002 Deconstructor
-- Kologarn
-- Steelbreaker
-- Auriaya
-- General Vezax
-- Yogg-Saron

-- ---------------
-- Flame Leviathan
-- ---------------

-- http://www.wowhead.com/npc=33113#drops:mode=normal10:0+1-15
-- Normal (10P)
-- Fix rates and drops adding new groups and patters correction about some 25P drops including on 10P
DELETE FROM `creature_loot_template` WHERE (`entry`=33113);
INSERT INTO `creature_loot_template` VALUES 
(33113, 34057, 1.3, 1, 0, 1, 2),
(33113, 47241, 100, 1, 0, 1, 3),
(33113, 45135, 12.5, 1, 1, 1, 1),
(33113, 45282, 12.5, 1, 1, 1, 1),
(33113, 45283, 12.5, 1, 1, 1, 1),
(33113, 45284, 12.5, 1, 1, 1, 1),
(33113, 45288, 12.5, 1, 1, 1, 1),
(33113, 45289, 12.5, 1, 1, 1, 1),
(33113, 45295, 12.5, 1, 1, 1, 1),
(33113, 45297, 12.5, 1, 1, 1, 1),
(33113, 45285, 12.5, 1, 2, 1, 1),
(33113, 45286, 12.5, 1, 2, 1, 1),
(33113, 45287, 12.5, 1, 2, 1, 1),
(33113, 45291, 12.5, 1, 2, 1, 1),
(33113, 45292, 12.5, 1, 2, 1, 1),
(33113, 45293, 12.5, 1, 2, 1, 1),
(33113, 45296, 12.5, 1, 2, 1, 1),
(33113, 45300, 12.5, 1, 2, 1, 1),
(33113, 45088, 2.1, 1, 3, 1, 1),
(33113, 45089, 2.1, 1, 3, 1, 1),
(33113, 45090, 2.1, 1, 3, 1, 1),
(33113, 45091, 2.1, 1, 3, 1, 1),
(33113, 45092, 2.1, 1, 3, 1, 1),
(33113, 45093, 2.1, 1, 3, 1, 1),
(33113, 45094, 2.1, 1, 3, 1, 1),
(33113, 45095, 2.1, 1, 3, 1, 1),
(33113, 45096, 2.1, 1, 3, 1, 1),
(33113, 45097, 2.1, 1, 3, 1, 1),
(33113, 45098, 2.1, 1, 3, 1, 1),
(33113, 45099, 2.1, 1, 3, 1, 1),
(33113, 45100, 2.1, 1, 3, 1, 1),
(33113, 45101, 2.1, 1, 3, 1, 1),
(33113, 45102, 2.1, 1, 3, 1, 1),
(33113, 45103, 2.1, 1, 3, 1, 1),
(33113, 45104, 2.1, 1, 3, 1, 1),
(33113, 45105, 2.1, 1, 3, 1, 1),
(33113, 35623, 16.3, 1, 4, 2, 6),
(33113, 35624, 16.3, 1, 4, 4, 10),
(33113, 35627, 16.3, 1, 4, 2, 10),
(33113, 36860, 16.3, 1, 4, 2, 6),
(33113, 37663, 16.3, 1, 4, 1, 1),
(33113, 45087, 16.3, 1, 4, 1, 3),
(33113, 36913, 16.3, 1, 5, 16, 20),
(33113, 36916, 16.3, 1, 5, 16, 20),
(33113, 39681, 16.3, 1, 5, 8, 10),
(33113, 39682, 16.3, 1, 5, 5, 5),
(33113, 39683, 16.3, 1, 5, 2, 3),
(33113, 39690, 16.3, 1, 5, 16, 20);

-- Flame Leviathan
-- http://www.wowhead.com/npc=33113#drops:mode=normal25:0+1-15
-- Normal (25P) 
-- Fix drops rates and including missing dops with groups and rates
DELETE FROM `creature_loot_template` WHERE (`entry`=34003);
INSERT INTO `creature_loot_template` VALUES 
(34003, 45038, 7.8, 1, 0, 1, 3),
(34003, 45089, 1.3, 1, 0, -45089, 1),
(34003, 47241, 100, 1, 0, 1, 3),
(34003, 45113, 16.666, 1, 1, 1, 1),
(34003, 45114, 16.666, 1, 1, 1, 1),
(34003, 45116, 16.666, 1, 1, 1, 1),
(34003, 45118, 16.666, 1, 1, 1, 1),
(34003, 45119, 16.666, 1, 1, 1, 1),
(34003, 45132, 16.666, 1, 1, 1, 1),
(34003, 45108, 16.666, 1, 2, 1, 1),
(34003, 45109, 16.666, 1, 2, 1, 1),
(34003, 45112, 16.666, 1, 2, 1, 1),
(34003, 45115, 16.666, 1, 2, 1, 1),
(34003, 45117, 16.666, 1, 2, 1, 1),
(34003, 45135, 16.666, 1, 2, 1, 1),
(34003, 45086, 14.285, 1, 3, 1, 1),
(34003, 45106, 14.285, 1, 3, 1, 1),
(34003, 45107, 14.285, 1, 3, 1, 1),
(34003, 45110, 14.285, 1, 3, 1, 1),
(34003, 45111, 14.285, 1, 3, 1, 1),
(34003, 45133, 14.285, 1, 3, 1, 1),
(34003, 45136, 14.285, 1, 3, 1, 1),
(34003, 46027, 5.5, 1, 4, 1, 1),
(34003, 46348, 5.5, 1, 4, 1, 1),
(34003, 35623, 10, 1, 5, 1, 6),
(34003, 35624, 10, 1, 5, 4, 10),
(34003, 35627, 10, 1, 5, 2, 10),
(34003, 37663, 10, 1, 5, 1, 1),
(34003, 45087, 51, 1, 5, 1, 3),
(34003, 36916, 6.7, 1, 6, 16, 20),
(34003, 39682, 22.8, 1, 6, 5, 5),
(34003, 39683, 14.5, 1, 6, 2, 3);

-- ------------------------------------------------------------------------------------
-- ----------
-- Razorscale
-- ----------

-- http://www.wowhead.com/npc=33186#drops:mode=normal10:0+1-15
-- Normal (10P)
-- Fix rates
DELETE FROM `creature_loot_template` WHERE (`entry`=33186);
INSERT INTO `creature_loot_template` VALUES 
(33186, 47241, 100, 1, 0, 1, 1),
(33186, 45303, 20, 1, 1, 1, 1),
(33186, 45306, 20, 1, 1, 1, 1),
(33186, 45305, 20, 1, 1, 1, 1),
(33186, 45308, 20, 1, 1, 1, 1),
(33186, 45298, 20, 1, 1, 1, 1),
(33186, 45301, 20, 1, 2, 1, 1),
(33186, 45299, 20, 1, 2, 1, 1),
(33186, 45307, 20, 1, 2, 1, 1),
(33186, 45304, 20, 1, 2, 1, 1),
(33186, 45302, 20, 1, 2, 1, 1);

-- Razorscale
-- http://www.wowhead.com/npc=33186#drops:mode=normal25:0+1-15
-- Normal (25P)
-- Fix drops and rates also removing patters from loot list cos its not correct
DELETE FROM `creature_loot_template` WHERE (`entry`=33724);
INSERT INTO `creature_loot_template` VALUES 
(33724, 45038, 10, 1, 0, 1, 3),
(33724, 47241, 100, 1, 0, 1, 1),
(33724, 45138, 20, 1, 1, 1, 1),
(33724, 45143, 20, 1, 1, 1, 1),
(33724, 45146, 20, 1, 1, 1, 1),
(33724, 45149, 20, 1, 1, 1, 1),
(33724, 45150, 20, 1, 1, 1, 1),
(33724, 45140, 20, 1, 2, 1, 1),
(33724, 45144, 20, 1, 2, 1, 1),
(33724, 45148, 20, 1, 2, 1, 1),
(33724, 45151, 20, 1, 2, 1, 1),
(33724, 45510, 20, 1, 2, 1, 1),
(33724, 45137, 20, 1, 3, 1, 1),
(33724, 45139, 20, 1, 3, 1, 1),
(33724, 45141, 20, 1, 3, 1, 1),
(33724, 45142, 20, 1, 3, 1, 1),
(33724, 45147, 20, 1, 3, 1, 1),
(33724, 45087, 33, 1, 4, 1, 1);

-- --------------------------------------------------------------------------------------------
-- ------------------------
-- Ignis the Furnace Master
-- ------------------------

-- http://www.wowhead.com/npc=33118#drops:mode=normal10:0+1-15
-- Normal (10P)
-- Fix drops and rates also removing some drops from 25P including on 10P 
DELETE FROM `creature_loot_template` WHERE (`entry`=33118);
INSERT INTO `creature_loot_template` VALUES 
(33118, 47241, 100, 1, 0, 1, 1),
(33118, 45310, 20, 1, 1, 1, 1),
(33118, 45311, 20, 1, 1, 1, 1),
(33118, 45312, 20, 1, 1, 1, 1),
(33118, 45317, 20, 1, 1, 1, 1),
(33118, 45321, 20, 1, 1, 1, 1),
(33118, 45309, 20, 1, 2, 1, 1),
(33118, 45313, 20, 1, 2, 1, 1),
(33118, 45314, 20, 1, 2, 1, 1),
(33118, 45316, 20, 1, 2, 1, 1),
(33118, 45318, 20, 1, 2, 1, 1);

-- Ignis the Furnace Master
-- http://www.wowhead.com/npc=33118#drops:mode=normal25:0+1-15 
-- Normal (25P)
-- Redone drops and rates redone ref for this drops also including some miss drops
DELETE FROM `creature_loot_template` WHERE (`entry`=33190);
INSERT INTO `creature_loot_template` VALUES 
(33190, 45038, 10, 1, 0, 1, 1),
(33190, 45087, 33, 1, 0, 1, 1),
(33190, 45089, 1.3, 1, 0, -45089, 1),
(33190, 47241, 100, 1, 0, 1, 1),
(33190, 45157, 20, 1, 1, 1, 1),
(33190, 45166, 20, 1, 1, 1, 1),
(33190, 45168, 20, 1, 1, 1, 1),
(33190, 45169, 20, 1, 1, 1, 1),
(33190, 45185, 20, 1, 1, 1, 1),
(33190, 45158, 20, 1, 2, 1, 1),
(33190, 45161, 20, 1, 2, 1, 1),
(33190, 45164, 20, 1, 2, 1, 1),
(33190, 45186, 20, 1, 2, 1, 1),
(33190, 45187, 20, 1, 2, 1, 1),
(33190, 45162, 20, 1, 3, 1, 1),
(33190, 45165, 20, 1, 3, 1, 1),
(33190, 45167, 20, 1, 3, 1, 1),
(33190, 45170, 20, 1, 3, 1, 1),
(33190, 45171, 20, 1, 3, 1, 1),
(33190, 46027, 2, 1, 4, 1, 1),
(33190, 46348, 2, 1, 4, 1, 1);

-- ---------------------------------------------------------------------------
-- --------------------
-- XT-002 Deconstructor
-- --------------------

-- http://www.wowhead.com/npc=33293#drops:mode=normal10:0+1-15
-- Normal (10P)
-- Fix drops rates also remove lots of drops for 25P including on 10P adding some miss drops and trasth drops 
DELETE FROM `creature_loot_template` WHERE (`entry`=33293);
INSERT INTO `creature_loot_template` VALUES 
(33293, 47241, 100, 1, 0, 1, 1),
(33293, 45675, 20, 1, 1, 1, 1),
(33293, 45685, 20, 1, 1, 1, 1),
(33293, 45686, 20, 1, 1, 1, 1),
(33293, 45687, 20, 1, 1, 1, 1),
(33293, 45694, 20, 1, 1, 1, 1),
(33293, 45676, 20, 1, 2, 1, 1),
(33293, 45677, 20, 1, 2, 1, 1),
(33293, 45679, 20, 1, 2, 1, 1),
(33293, 45680, 20, 1, 2, 1, 1),
(33293, 45682, 20, 1, 2, 1, 1),
(33293, 45445, 16.666, 1, 3, 1, 1),
(33293, 45867, 16.666, 1, 3, 1, 1),
(33293, 45868, 16.666, 1, 3, 1, 1),
(33293, 45869, 16.666, 1, 3, 1, 1),
(33293, 45870, 16.666, 1, 3, 1, 1),
(33293, 45871, 16.666, 1, 3, 1, 1),
(33293, 36860, 1.3, 1, 4, 2, 5),
(33293, 35627, 1.3, 1, 4, 2, 9),
(33293, 39681, 1.3, 1, 4, 8, 10),
(33293, 39682, 1.3, 1, 4, 5, 5);

-- XT-002 Deconstructor
-- http://www.wowhead.com/npc=33293#drops:mode=normal25:0+1-15
-- Normal (25P)
-- Fix rates and drops including lots of missing items remove some drops from 10P including on 25P 
DELETE FROM `creature_loot_template` WHERE (`entry`=33885);
INSERT INTO `creature_loot_template` VALUES 
(33885, 45087, 10, 1, 0, 1, 1),
(33885, 45089, 1.3, 1, 0, -45089, 1),
(33885, 47241, 100, 1, 0, 1, 1),
(33885, 45247, 14.285, 1, 1, 1, 1),
(33885, 45252, 14.285, 1, 1, 1, 1),
(33885, 45254, 14.285, 1, 1, 1, 1),
(33885, 45255, 14.285, 1, 1, 1, 1),
(33885, 45260, 14.285, 1, 1, 1, 1),
(33885, 45442, 14.285, 1, 1, 1, 1),
(33885, 45446, 14.285, 1, 1, 1, 1),
(33885, 45248, 14.285, 1, 2, 1, 1),
(33885, 45251, 14.285, 1, 2, 1, 1),
(33885, 45253, 14.285, 1, 2, 1, 1),
(33885, 45258, 14.285, 1, 2, 1, 1),
(33885, 45259, 14.285, 1, 2, 1, 1),
(33885, 45443, 14.285, 1, 2, 1, 1),
(33885, 45445, 14.285, 1, 2, 1, 1),
(33885, 45246, 16.666, 1, 3, 1, 1),
(33885, 45249, 16.666, 1, 3, 1, 1),
(33885, 45250, 16.666, 1, 3, 1, 1),
(33885, 45256, 16.666, 1, 3, 1, 1),
(33885, 45257, 16.666, 1, 3, 1, 1),
(33885, 45444, 16.666, 1, 3, 1, 1),
(33885, 46027, 1.3, 1, 4, 1, 1),
(33885, 46348, 1.3, 1, 4, 1, 1);

-- ---------------------------------------------------------------------------
-- ------------
-- Steelbreaker
-- ------------
-- http://www.wowhead.com/npc=32867#drops:mode=normal10
-- Normal (10P)
-- Fix drops and rates adding some miss drops
DELETE FROM `creature_loot_template` WHERE (`entry`=32867);
INSERT INTO `creature_loot_template` VALUES 
(32867, 45506, 100, 1, 0, 1, 1),
(32867, 47241, 100, 1, 0, 1, 1),
(32867, 45330, 20, 1, 1, 1, 1),
(32867, 45418, 20, 1, 1, 1, 1),
(32867, 45324, 20, 1, 1, 1, 1),
(32867, 45423, 20, 1, 1, 1, 1),
(32867, 45332, 20, 1, 1, 1, 1),
(32867, 45333, 20, 1, 2, 1, 1),
(32867, 45378, 20, 1, 2, 1, 1),
(32867, 45329, 20, 1, 2, 1, 1),
(32867, 45322, 20, 1, 2, 1, 1),
(32867, 45331, 20, 1, 2, 1, 1),
(32867, 45455, 20, 1, 3, 1, 1),
(32867, 45456, 20, 1, 3, 1, 1),
(32867, 45448, 20, 1, 3, 1, 1),
(32867, 45449, 20, 1, 3, 1, 1),
(32867, 45447, 20, 1, 3, 1, 1);

-- Steelbreaker
-- http://www.wowhead.com/npc=32867#drops:mode=normal25:0+1-15
-- Normal (25P) 
-- Fix drops and rates including formulas on drop
DELETE FROM `creature_loot_template` WHERE (`entry`=33693);
INSERT INTO `creature_loot_template` VALUES 
(33693, 45089, 1.3, 1, 0, -45089, 1),
(33693, 45857, 100, 1, 0, 1, 1),
(33693, 47241, 100, 1, 0, 1, 1),
(33693, 45038, 10, 1, 0, 1, 1),
(33693, 45087, 33, 1, 0, 1, 3),
(33693, 45193, 20, 1, 1, 1, 1),
(33693, 45227, 20, 1, 1, 1, 1),
(33693, 45240, 20, 1, 1, 1, 1),
(33693, 45232, 20, 1, 1, 1, 1),
(33693, 45225, 20, 1, 1, 1, 1),
(33693, 45226, 20, 1, 2, 1, 1),
(33693, 45238, 20, 1, 2, 1, 1),
(33693, 45237, 20, 1, 2, 1, 1),
(33693, 45235, 20, 1, 2, 1, 1),
(33693, 45239, 20, 1, 2, 1, 1),
(33693, 45224, 20, 1, 3, 1, 1),
(33693, 45228, 20, 1, 3, 1, 1),
(33693, 45234, 20, 1, 3, 1, 1),
(33693, 45233, 20, 1, 3, 1, 1),
(33693, 45236, 20, 1, 3, 1, 1),
(33693, 45241, 16.666, 1, 4, 1, 1),
(33693, 45242, 16.666, 1, 4, 1, 1),
(33693, 45607, 16.666, 1, 4, 1, 1),
(33693, 45244, 16.666, 1, 4, 1, 1),
(33693, 45243, 16.666, 1, 4, 1, 1),
(33693, 45245, 16.666, 1, 4, 1, 1),
(33693, 46027, 1.3, 1, 5, 1, 1),
(33693, 46348, 1.3, 1, 5, 1, 1);

-- ---------------------------------------------------------------------------------
-- --------
-- Auriaya
-- --------
-- http://www.wowhead.com/npc=33515#drops:mode=normal10:0+1-15
-- Normal (10P)
-- Fix drops and rates deleting some drops form 25P including on 10P
DELETE FROM `creature_loot_template` WHERE (`entry`=33515);
INSERT INTO `creature_loot_template` VALUES 
(33515, 47241, 100, 1, 0, 1, 1),
(33515, 45708, 20, 1, 1, 1, 1),
(33515, 45712, 20, 1, 1, 1, 1),
(33515, 45713, 20, 1, 1, 1, 1),
(33515, 45864, 20, 1, 1, 1, 1),
(33515, 45865, 20, 1, 1, 1, 1),
(33515, 45707, 20, 1, 2, 1, 1),
(33515, 45709, 20, 1, 2, 1, 1),
(33515, 45711, 20, 1, 2, 1, 1),
(33515, 45832, 20, 1, 2, 1, 1),
(33515, 45866, 20, 1, 2, 1, 1);

-- Auriaya
-- http://www.wowhead.com/npc=33515#drops:mode=normal25:0+1-15
-- Normal (25P)
-- Fix drops and rates miss some items includind on SQL
DELETE FROM `creature_loot_template` WHERE (`entry`=34175);
INSERT INTO `creature_loot_template` VALUES 
(34175, 47241, 100, 1, 0, 1, 1),
(34175, 45038, 10, 1, 0, 1, 1),
(34175, 45089, 1.3, 1, 0, -45089, 1),
(34175, 45087, 33, 1, 0, 1, 1),
(34175, 45440, 20, 1, 1, 1, 1),
(34175, 45434, 20, 1, 1, 1, 1),
(34175, 45436, 20, 1, 1, 1, 1),
(34175, 45320, 20, 1, 1, 1, 1),
(34175, 45439, 20, 1, 1, 1, 1),
(34175, 45319, 20, 1, 2, 1, 1),
(34175, 45325, 20, 1, 2, 1, 1),
(34175, 45326, 20, 1, 2, 1, 1),
(34175, 45438, 20, 1, 2, 1, 1),
(34175, 45441, 20, 1, 2, 1, 1),
(34175, 45435, 20, 1, 3, 1, 1),
(34175, 45437, 20, 1, 3, 1, 1),
(34175, 45327, 20, 1, 3, 1, 1),
(34175, 45315, 20, 1, 3, 1, 1),
(34175, 45334, 20, 1, 3, 1, 1);

-- ---------------------------------------------------------------------------------
-- --------
-- General Vezax
-- --------
-- http://www.wowhead.com/npc=33271#drops:mode=normal10:0+1-16
-- Normal (10P)
-- Fix drops and rates deleting some drops form 25P including on 10P
DELETE FROM `creature_loot_template` WHERE (`entry`=33271);
INSERT INTO `creature_loot_template` VALUES 
(33271, 47241, 100, 1, 0, 1, 1),
(33271, 46035, 12.5, 1, 1, 1, 1),
(33271, 46009, 12.5, 1, 1, 1, 1),
(33271, 46008, 12.5, 1, 1, 1, 1),
(33271, 46010, 12.5, 1, 1, 1, 1),
(33271, 46032, 12.5, 1, 1, 1, 1),
(33271, 45997, 12.5, 1, 1, 1, 1),
(33271, 45996, 12.5, 1, 1, 1, 1),
(33271, 46034, 12.5, 1, 1, 1, 1),
(33271, 46015, 14.285, 1, 2, 1, 1),
(33271, 46014, 14.285, 1, 2, 1, 1),
(33271, 46011, 14.285, 1, 2, 1, 1),
(33271, 46033, 14.285, 1, 2, 1, 1),
(33271, 46013, 14.285, 1, 2, 1, 1),
(33271, 46012, 14.285, 1, 2, 1, 1),
(33271, 46036, 14.285, 1, 2, 1, 1);

-- General Vezax
-- http://www.wowhead.com/npc=33271#drops:mode=normal25:0+1-16
-- Normal (25P)
-- Fix drops and rates miss some items includind on SQL
DELETE FROM `creature_loot_template` WHERE (`entry`=33449);
INSERT INTO `creature_loot_template` VALUES 
(33449, 47241, 100, 1, 0, 1, 1), -- Emblem of Triumph
(33449, 45038, 10, 1, 0, 1, 1), -- Fragment of Val'anyr
(33449, 45087, 33, 1, 0, 1, 1), -- Runed Orb
(33449, 45505, 16.666, 1, 1, 1, 1),
(33449, 45513, 16.666, 1, 1, 1, 1),
(33449, 45501, 16.666, 1, 1, 1, 1),
(33449, 45504, 16.666, 1, 1, 1, 1),
(33449, 45518, 16.666, 1, 1, 1, 1),
(33449, 45512, 16.666, 1, 1, 1, 1),
(33449, 45520, 16.666, 1, 2, 1, 1),
(33449, 45502, 16.666, 1, 2, 1, 1),
(33449, 45509, 16.666, 1, 2, 1, 1),
(33449, 45145, 16.666, 1, 2, 1, 1),
(33449, 45498, 16.666, 1, 2, 1, 1),
(33449, 45514, 16.666, 1, 2, 1, 1),
(33449, 45503, 14.285, 1, 3, 1, 1),
(33449, 45517, 14.285, 1, 3, 1, 1),
(33449, 45515, 14.285, 1, 3, 1, 1),
(33449, 45511, 14.285, 1, 3, 1, 1),
(33449, 45507, 14.285, 1, 3, 1, 1),
(33449, 45519, 14.285, 1, 3, 1, 1),
(33449, 45516, 14.285, 1, 3, 1, 1),
(33449, 45089, 1.3, 1, 0, -45089, 1);

-- ---------------------------------------------------------------------------------
-- ----------
-- Yogg-Saron
-- ----------

-- http://www.wowhead.com/npc=33288#drops:mode=normal10
-- Normal (10P)
-- Miss lots of drops (like 17 itms no on list)
DELETE FROM `creature_loot_template` WHERE (`entry`=33288);
INSERT INTO `creature_loot_template` VALUES 
(33288, 45087, 25, 1, 0, 1, 3), -- Runed Orb
(33288, 47241, 100, 1, 0, 1, 2), -- Emblem of Triumph
(33288, 46018, 12.5, 1, 1, 1, 1),
(33288, 46028, 12.5, 1, 1, 1, 1),
(33288, 46021, 12.5, 1, 1, 1, 1),
(33288, 46031, 12.5, 1, 1, 1, 1),
(33288, 46016, 12.5, 1, 1, 1, 1),
(33288, 46025, 12.5, 1, 1, 1, 1),
(33288, 46030, 12.5, 1, 1, 1, 1),
(33288, 46024, 12.5, 1, 1, 1, 1),
(33288, 46019, 12.5, 1, 2, 1, 1),
(33288, 46022, 12.5, 1, 2, 1, 1),
(33288, 46097, 12.5, 1, 2, 1, 1),
(33288, 46096, 12.5, 1, 2, 1, 1),
(33288, 46068, 12.5, 1, 2, 1, 1),
(33288, 46067, 12.5, 1, 2, 1, 1),
(33288, 46312, 12.5, 1, 2, 1, 1),
(33288, 46095, 12.5, 1, 2, 1, 1),
(33288, 45104, 53.2, 1, 0, -45481, 1), -- Armor TIER
(33288, 45102, 1.4, 1, 0, -45089, 1); -- Recipies

-- Yogg-Saron
-- http://www.wowhead.com/npc=33288#drops:mode=normal25
-- Normal (25P)
-- Miss lots of drops (like 17 itms no on list)
DELETE FROM `creature_loot_template` WHERE (`entry`=33955);
INSERT INTO `creature_loot_template` VALUES 
(33955, 45087, 25, 1, 0, 1, 3), -- Runed Orb
(33955, 47241, 100, 1, 0, 2, 2), -- Emblem of Triumph
(33955, 45897, 1.8, 1, 0, 1, 1), -- Reforged Hammer of Ancient Kings
(33955, 45532, 12.5, 1, 1, 1, 1),
(33955, 45529, 12.5, 1, 1, 1, 1),
(33955, 45522, 12.5, 1, 1, 1, 1),
(33955, 45523, 12.5, 1, 1, 1, 1),
(33955, 45531, 12.5, 1, 1, 1, 1),
(33955, 45521, 12.5, 1, 1, 1, 1),
(33955, 45525, 12.5, 1, 1, 1, 1),
(33955, 45530, 12.5, 1, 1, 1, 1),
(33955, 45524, 12.5, 1, 2, 1, 1),
(33955, 45527, 12.5, 1, 2, 1, 1),
(33955, 45693, 12.5, 1, 2, 1, 1),
(33955, 45534, 12.5, 1, 2, 1, 1),
(33955, 45537, 12.5, 1, 2, 1, 1),
(33955, 45533, 12.5, 1, 2, 1, 1),
(33955, 45536, 12.5, 1, 2, 1, 1),
(33955, 45535, 12.5, 1, 2, 1, 1),
(33955, 45104, 53.2, 1, 0, -33955, 1), -- Armor TIER
(33955, 45102, 1.4, 1, 0, -45089, 1); -- Recipies

-- ----------------------------------------------------------------------------------
-- References for the need drops
-- All bosses from Ulduar got the same reference items only a few hace to references
-- ----------------------------------------------------------------------------------

-- Redone ref 
DELETE FROM `reference_loot_template` WHERE `entry`='45089';
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('45089','45100','0','1','1','1','1'),
('45089','45094','0','1','1','1','1'),
('45089','45096','0','1','1','1','1'),
('45089','45095','0','1','1','1','1'),
('45089','45101','0','1','1','1','1'),
('45089','45104','0','1','1','1','1'),
('45089','45098','0','1','1','1','1'),
('45089','45099','0','1','1','1','1'),
('45089','45097','0','1','1','1','1'),
('45089','45102','0','1','1','1','1'),
('45089','45105','0','1','1','1','1'),
('45089','45103','0','1','1','1','1'),
('45089','45089','0','1','1','1','1'),
('45089','45088','0','1','1','1','1'),
('45089','45092','0','1','1','1','1'),
('45089','45090','0','1','1','1','1'),
('45089','45093','0','1','1','1','1'),
('45089','45091','0','1','1','1','1');

-- Redone ref for TIER
DELETE FROM `reference_loot_template` WHERE `entry`='45481';
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('45481','45644','0','1','1','1','1'),
('45481','45645','0','1','1','1','1'),
('45481','45646','0','1','1','1','1');

-- Redone ref for TIER
DELETE FROM `reference_loot_template` WHERE `entry`='33955';
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('33955','45658','0','1','1','1','1'),
('33955','45657','0','1','1','1','1'),
('33955','45656','0','1','1','1','1');

-- ---------------------------------------------------------------------------
-- Drops on gameobject
-- Only one chest is working and I do the drops, rest of caches is not working
-- ----------------------------------------------------------------------------
-- --------
-- Kologarn
-- --------

-- http://www.wowhead.com/npc=32930#drops:mode=normal10:0+1-15
-- Normal (10P)
-- Fix rates and drops removing some drops from 25P including on 10P also including some miss drop
DELETE FROM `gameobject_loot_template` WHERE (`entry`=195046);
INSERT INTO `gameobject_loot_template` VALUES 
(195046, 34057, 1.3, 1, 0, 1, 2),
(195046, 47241, 100, 1, 0, 1, 1),
(195046, 45695, 20, 1, 1, 1, 1),
(195046, 45696, 20, 1, 1, 1, 1),
(195046, 45700, 20, 1, 1, 1, 1),
(195046, 45701, 20, 1, 1, 1, 1),
(195046, 45704, 20, 1, 1, 1, 1),
(195046, 45697, 20, 1, 2, 1, 1),
(195046, 45698, 20, 1, 2, 1, 1),
(195046, 45699, 20, 1, 2, 1, 1),
(195046, 45702, 20, 1, 2, 1, 1),
(195046, 45703, 20, 1, 2, 1, 1);

-- Kologarn
-- http://www.wowhead.com/npc=32930#drops:mode=normal25:0+1-15
-- Normal (25P)
-- Fix drops and rates also including some miss drops
DELETE FROM `gameobject_loot_template` WHERE (`entry`=195047);
INSERT INTO `gameobject_loot_template` VALUES 
(195047, 47241, 100, 1, 0, 1, 1),
(195047, 45038, 10, 1, 0, 1, 1),
(195047, 45089, 1.3, 1, 0, -45089, 1),
(195047, 45087, 27, 1, 0, 1, 1),
(195047, 45275, 20, 1, 1, 1, 1),
(195047, 45268, 20, 1, 1, 1, 1),
(195047, 45273, 20, 1, 1, 1, 1),
(195047, 45272, 20, 1, 1, 1, 1),
(195047, 45263, 20, 1, 1, 1, 1),
(195047, 45270, 20, 1, 2, 1, 1),
(195047, 45271, 20, 1, 2, 1, 1),
(195047, 45262, 20, 1, 2, 1, 1),
(195047, 45267, 20, 1, 2, 1, 1),
(195047, 45269, 20, 1, 2, 1, 1),
(195047, 45264, 20, 1, 3, 1, 1),
(195047, 45261, 20, 1, 3, 1, 1),
(195047, 45274, 20, 1, 3, 1, 1),
(195047, 45266, 20, 1, 3, 1, 1),
(195047, 45265, 20, 1, 3, 1, 1);

-- ----------------------------------------------
-- DELETING OLD AND WRONG REFERENCES FROM YTDB
-- ----------------------------------------------
DELETE FROM `reference_loot_template` WHERE `entry` IN (45636,45658);

-- -----------------------------------------------------
-- Some corrections from Mismouse used it if you like
-- -----------------------------------------------------
-- To help the correct kill of this bosses I give to they a new locs
-- New locs for Steelbreaker
DELETE FROM `creature` WHERE `guid`='94382';
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES ('94382','32867','603','3','65535','0','0','1552.15','120.145','427.277','6.20744','604800','0','0','2998175','0','0','0');

DELETE FROM `creature` WHERE `guid`='94387';
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES ('94387','32927','603','3','65535','0','0','1596.43','105.539','427.273','0.759136','604800','0','0','2998175','4258','0','0');

DELETE FROM `creature` WHERE `guid`='94390';
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES ('94390','32857','603','3','65535','0','0','1596.37','134.229','427.271','5.65217','604800','0','0','2998175','212900','0','0');

UPDATE `creature_template` SET `difficulty_entry_1` = 33909, `unit_flags` = 0 WHERE `entry` = 32930;
UPDATE `creature_template` SET `ScriptName` = 'mob_snowpacked_icicle' WHERE `entry` = 33174;
-- toasty fire immunities
DELETE FROM spell_linked_spell WHERE spell_trigger=65280;
INSERT INTO spell_linked_spell VALUES
(65280,-62469,2,'Toasty fire - Freeze imunity'),
(65280,-62039,2,'Toasty fire - Biting cold imunity');

-- Mimiron Flames
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `modelid1` = 11686, `ScriptName` = 'mob_mimiron_flame_spread' WHERE `entry` = 34121;

-- Magma Rager
UPDATE `creature_template` SET `mechanic_immune_mask` = 131072 WHERE `entry` IN (34086, 34201);
-- Robots
UPDATE `creature_template` SET `mechanic_immune_mask` = 8405008 WHERE `entry` IN (34085, 34186, 34274, 34268, 34272, 34270);
-- Lightning charged dwarf
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 30, `mingold` = 14200, `maxgold` = 16200, `equipment_id` = 870, `mechanic_immune_mask` = 5 WHERE `entry` = 34237;
UPDATE `creature_template` SET `equipment_id` = 870, `mechanic_immune_mask` = 5 WHERE `entry` = 34199;
-- Hardened Iron Golem
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 35, `mingold` = 14200, `maxgold` = 16200, `mechanic_immune_mask` = 64 WHERE `entry` = 34229;
UPDATE `creature_template` SET `mechanic_immune_mask` = 64 WHERE `entry` = 34190;
-- Iron Mender
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 463, `maxdmg` = 640, `attackpower` = 726, `dmg_multiplier` = 35, `mingold` = 14200, `maxgold` = 16200, `mechanic_immune_mask` = 1 WHERE `entry` = 34236;
UPDATE `creature_template` SET `mechanic_immune_mask` = 1 WHERE `entry` = 34198;
-- Runed Etched
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 30, `mingold` = 14200, `maxgold` = 16200, `mechanic_immune_mask` = 64 WHERE `entry` = 34245;
UPDATE `creature_template` SET `mechanic_immune_mask` = 64 WHERE `entry` = 34196;
-- Chamber Overseer
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 60, `mingold` = 14600, `maxgold` = 18200, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34226;
UPDATE `creature_template` SET `dmg_multiplier` = 45 WHERE `entry` = 34197;
-- Steelbreaker
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 90, `baseattacktime` = 1500, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33693;
-- Runemaster Molgeim
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 496, `maxdmg` = 674, `attackpower` = 783, `dmg_multiplier` = 60, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33692;
-- Brundir
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 496, `maxdmg` = 674, `attackpower` = 783, `dmg_multiplier` = 50, `mechanic_immune_mask` = 617299547, `flags_extra` = 1 WHERE `entry` = 33694;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` IN (33689, 33691);
-- Kologarn
UPDATE `creature_template` SET `difficulty_entry_1` = 33909, `unit_flags` = 0 WHERE `entry` = 32930;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 90, `baseattacktime` = 1800, `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `minlevel` = 83, `maxlevel` = 83, `unit_flags` = 0, `unit_class` = 1 WHERE `entry` = 33909;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (32933, 32934);
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 45, `baseattacktime` = 1500, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (33910, 33911);
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 12 WHERE `entry` = 33908;
-- Storm Tempered Keeper
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `speed_walk` = 3.2, `mindmg` = 463, `maxdmg` = 640, `attackpower` = 726, `dmg_multiplier` = 65, `mingold` = 71000, `maxgold` = 76000, `mechanic_immune_mask` = 545260304 WHERE `entry` IN (33700, 33723);
-- Auriaya
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299807 WHERE `entry` = 33515;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.66667, `mindmg` = 496, `maxdmg` = 674, `attackpower` = 783, `dmg_multiplier` = 90, `mingold` = 3460000, `maxgold` = 3520000, `equipment_id` = 2500, `mechanic_immune_mask` = 617299807, `flags_extra` = 1 WHERE `entry` = 34175;
-- Sanctum Sentry
UPDATE `creature_template` SET `speed_walk` = 1.66667 WHERE `entry` = 34014;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 65, `baseattacktime` = 1500, `speed_walk` = 1.66667, `flags_extra` = 1 WHERE `entry` = 34166;
-- Feral Defender
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 2, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 5, `baseattacktime` = 1500 WHERE `entry` = 34171;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 33554432, modelid1 = 11686, modelid2 = 0 WHERE `entry` = 34174;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 1.5, `baseattacktime` = 1500 WHERE `entry` = 34169;
-- Champion of Hodir
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.6, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 75, `mingold` = 71000, `maxgold` = 76000, `mechanic_immune_mask` = 545267736 WHERE `entry` = 34139;
-- Winter jorm
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 2.4, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 15, `mingold` = 10500, `maxgold` = 12600 WHERE `entry` = 34140;
-- Winter revenant
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.6, `mindmg` = 425, `maxdmg` = 602, `attackpower` = 670, `dmg_multiplier` = 40, `mingold` = 71000, `maxgold` = 76000, `mechanic_immune_mask` = 2128 WHERE `entry` = 34141;
-- Winter Rumbler
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.6, `mindmg` = 425, `maxdmg` = 602, `attackpower` = 670, `dmg_multiplier` = 25, `mingold` = 10300, `maxgold` = 12000, `mechanic_immune_mask` = 33554432 WHERE `entry` = 34142;
-- Hodir
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239 WHERE `entry` = 32845;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.6, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 90, `equipment_id` = 1843, `mechanic_immune_mask` = 650854239, `flags_extra` = 1 WHERE `entry` = 32846;
-- Arachnopod
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.6, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 45, `unit_flags` = 64, `mingold` = 105000, `maxgold` = 125000, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34214;
-- Clockwork
UPDATE `creature_template` SET `unit_flags` = 64, `mingold` = 17200, `maxgold` = 17600, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34184;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 32, `mingold` = 172000, `maxgold` = 176000, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34219;
-- Boomer XP-500
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 25, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34216;
-- Trash
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `baseattacktime` = 1500, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34191;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 15, `baseattacktime` = 1500, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34217;
-- Clockwork sapper
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 30, `mingold` = 17000, `maxgold` = 18200, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34220;
-- Mimiron
UPDATE `creature_template` SET `difficulty_entry_1` = 34106, `exp` = 0 WHERE `entry` = 33432;
UPDATE `creature_template` SET `difficulty_entry_1` = 34108 WHERE `entry` = 33651;
UPDATE `creature_template` SET `difficulty_entry_1` = 34109 WHERE `entry` = 33670;
DELETE FROM `creature_template` WHERE `entry` IN (34106, 34108, 34109);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('34106','0','0','0','0','0','28831','0','0','0','Leviathan Mk II (1)','','','0','83','83','0','16','16','0','1','1.14286','1','3','464','604','0','708','100','2000','0','1','33554432','0','0','0','0','0','0','353','512','112','9','32876','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','370','0','0','','0','3','1200','1','1','0','0','0','0','0','0','0','541','1','0','650854235','1','boss_leviathan_mk','11159'),
('34108','0','0','0','0','0','28841','0','0','0','VX-001 (1)','Anti-personnel Assault Cannon','','0','83','83','0','16','16','0','1','1.14286','1','3','0','0','0','0','1','2000','0','1','0','0','0','0','0','0','0','0','0','0','9','108','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','371','0','0','','0','3','1200','1','1','0','0','0','0','0','0','0','421','1','0','650854235','1','boss_vx_001','11159'),
('34109','0','0','0','0','0','28979','0','0','0','Aerial Command Unit (1)','','','0','83','83','0','16','16','0','1','1.14286','1','3','0','0','0','0','1','2000','0','1','0','0','0','0','0','0','0','0','0','0','9','108','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','388','0','0','','0','3','800','1','1','0','0','0','0','0','0','0','188','1','0','650854235','1','boss_aerial_unit','11159');
UPDATE `creature_template` SET `ScriptName` = 'mob_mimiron_flame_spread' WHERE `entry` = 34121;
UPDATE `creature_template` SET `difficulty_entry_1` = 34114 WHERE `entry` = 33855;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10 WHERE `entry` = 34114;
UPDATE `creature_template` SET `difficulty_entry_1` = 34115 WHERE `entry` = 34057;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 20 WHERE `entry` = 34115;
UPDATE `creature_template` SET `difficulty_entry_1` = 34218 WHERE `entry` = 33836;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 15 WHERE `entry` = 34218;
UPDATE `creature_template` SET `difficulty_entry_1` = 34148 WHERE `entry` = 34147;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 34148;
-- Elders
UPDATE `creature_template` SET `mingold` = 625000, `maxgold` = 665000 WHERE `entry` IN (32914, 32913);
UPDATE `creature_template` SET `difficulty_entry_1` = 33391, `mingold` = 625000, `maxgold` = 665000 WHERE `entry` = 32915;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.66666, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 60, `mingold` = 1805000, `maxgold` = 1855000, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (33393, 33392, 33391);
-- Freya trash
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 35, `mingold` = 625000, `maxgold` = 655000 WHERE `entry` = 33732;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10, `mingold` = 75000, `maxgold` = 95000 WHERE `entry` = 33731;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 20, `mingold` = 125000, `maxgold` = 155000 WHERE `entry` IN (33733, 33734);
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 425, `maxdmg` = 602, `attackpower` = 670, `dmg_multiplier` = 35, `mingold` = 125000, `maxgold` = 155000 WHERE `entry` IN (33741, 33729);
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 425, `maxdmg` = 602, `attackpower` = 670, `dmg_multiplier` = 20, `mingold` = 125000, `maxgold` = 155000 WHERE `entry` IN (33735, 33737);
-- Freya
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.6, `mindmg` = 496, `maxdmg` = 674, `attackpower` = 783, `dmg_multiplier` = 65, `baseattacktime` = 1500, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33360;
UPDATE `creature_template` SET `difficulty_entry_1` = 33402 WHERE `entry` = 33170;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 33685510 WHERE `entry` = 33402;
UPDATE `creature_template` SET `difficulty_entry_1` = 33399, `flags_extra` = 256 WHERE `entry` = 32918;
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `faction_A` = 16, `faction_H` = 16, `flags_extra` = 256, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10 WHERE `entry` = 33399;
UPDATE `creature_template` SET `difficulty_entry_1` = 33376, `minlevel` = 81, `maxlevel` = 81 WHERE `entry` = 33203;
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 55, `mechanic_immune_mask` = 650853979 WHERE `entry` = 33376;
UPDATE `creature_template` SET `difficulty_entry_1` = 33398 WHERE `entry` = 33202;
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 35 WHERE `entry` = 33398;
UPDATE `creature_template` SET `difficulty_entry_1` = 33401 WHERE `entry` = 32919;
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 15 WHERE `entry` = 33401;
UPDATE `creature_template` SET `difficulty_entry_1` = 33400 WHERE `entry` = 32916;
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 60 WHERE `entry` = 33400;
UPDATE `creature_template` SET `difficulty_entry_1` = 34153 WHERE `entry` = 34129;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 33685508, `modelid1` = 23258, `modelid2` = 0 WHERE `entry` = 34153;
UPDATE `creature_template` SET `difficulty_entry_1` = 33385 WHERE `entry` = 33228;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 393220 WHERE `entry` = 33385;
UPDATE `creature_template` SET `difficulty_entry_1` = 33395 WHERE `entry` = 33050;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 33686022, `modelid1` = 23258, `modelid2` = 0 WHERE `entry` = 33395;
-- Dark Rune Thunderer, Ravager
UPDATE `creature_template` SET `baseattacktime` = 1500, `mechanic_immune_mask` = 545259541 WHERE `entry` IN (33754, 33755);
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 75, `baseattacktime` = 1500, `mingold` = 71000, `maxgold` = 76000, `equipment_id` = 870, `mechanic_immune_mask` = 545259541 WHERE `entry` = 33757;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 75, `baseattacktime` = 1500, `mingold` = 71000, `maxgold` = 76000, `equipment_id` = 1862, `mechanic_immune_mask` = 545259541 WHERE `entry` = 33758;
-- Pre Aggro adds (Thorim)
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 45 WHERE `entry` = 33154;
UPDATE `creature_template` SET `difficulty_entry_1` = 33153 WHERE `entry` = 32885;
UPDATE `creature_template` SET `difficulty_entry_1` = 33152 WHERE `entry` = 32883;
UPDATE `creature_template` SET `difficulty_entry_1` = 33150 WHERE `entry` = 32908;
UPDATE `creature_template` SET `difficulty_entry_1` = 33151 WHERE `entry` = 32907;
UPDATE `creature_template` SET `difficulty_entry_1` = 33161 WHERE `entry` = 33110;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 417, `maxdmg` = 582, `attackpower` = 608, `dmg_multiplier` = 10, `equipment_id` = 1847 WHERE `entry` = 33152;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 417, `maxdmg` = 582, `attackpower` = 608, `dmg_multiplier` = 10, `equipment_id` = 1849 WHERE `entry` = 33153;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 417, `maxdmg` = 582, `attackpower` = 608, `dmg_multiplier` = 10, `equipment_id` = 1852 WHERE `entry` = 33151;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 417, `maxdmg` = 582, `attackpower` = 608, `dmg_multiplier` = 10, `equipment_id` = 1850 WHERE `entry` = 33150;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14, `mindmg` = 463, `maxdmg` = 640, `attackpower` = 726, `dmg_multiplier` = 20 WHERE `entry` = 33161;
-- Phase 1 adds
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 20, `equipment_id` = 849 WHERE `entry` = 33158;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 10 WHERE `entry` = 33157;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 463, `maxdmg` = 640, `attackpower` = 726, `dmg_multiplier` = 15, `equipment_id` = 1003 WHERE `entry` = 33156;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 463, `maxdmg` = 640, `attackpower` = 726, `dmg_multiplier` = 20, `baseattacktime` = 1667, `equipment_id` = 1846 WHERE `entry` = 33155;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `equipment_id` = 627 WHERE `entry` = 33162;
UPDATE `creature_template` SET `difficulty_entry_1` = 33163 WHERE `entry` = 32875;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10, `equipment_id` = 1845 WHERE `entry` = 33163;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (32872, 32873);
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 45, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33149;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `speed_walk` = 0.888888, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 45, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33148;
-- Thorim
UPDATE `creature_template` SET `speed_walk` = 1.66667 WHERE `entry` = 32865;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 16, `speed_walk` = 1.66667, `mindmg` = 496, `maxdmg` = 674, `attackpower` = 783, `dmg_multiplier` = 80, `baseattacktime` = 1500, `minrangedmg` = 365, `maxrangedmg` = 529, `rangedattackpower` = 98, `equipment_id` = 1844, `mechanic_immune_mask` = 650854239, `flags_extra` = 1 WHERE `entry` = 33147;
-- Twilight mobs
UPDATE `creature_template` SET `mechanic_immune_mask` = 570425425, `speed_walk` = 1.33334 WHERE `entry` IN (33818, 33822, 33824, 33823);
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.33334, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `mingold` = 72000, `maxgold` = 76000, `equipment_id` = 1848, `mechanic_immune_mask` = 570425425 WHERE `entry` = 33827;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.33334, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 55, `mingold` = 72000, `maxgold` = 76000, `equipment_id` = 1852, `mechanic_immune_mask` = 570425425 WHERE `entry` = 33828;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.33334, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 30, `baseattacktime` = 1000, `mingold` = 72000, `maxgold` = 76000, `equipment_id` = 1862, `mechanic_immune_mask` = 570425425 WHERE `entry` = 33831;
UPDATE `creature_template` SET `name` = 'Twilight Slayer (1)', `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.33334, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 65, `mingold` = 72000, `maxgold` = 76000, `equipment_id` = 1847, `mechanic_immune_mask` = 570425425 WHERE `entry` = 33832;
UPDATE `creature_template` SET `difficulty_entry_1` = 33773 WHERE `entry` = 33772;
UPDATE `creature_template` SET `name` = 'Faceless Horror (1)', `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 85, `mingold` = 76000, `maxgold` = 79000, `mechanic_immune_mask` = 33554512 WHERE `entry` = 33773;
UPDATE `creature_template` SET `name` = 'Twilight Pyromancer (1)', `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `mingold` = 72000, `maxgold` = 76000, `equipment_id` = 1848, `mechanic_immune_mask` = 8388625 WHERE `entry` = 33830;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `mingold` = 72000, `maxgold` = 76000, `equipment_id` = 1849, `mechanic_immune_mask` = 8388625 WHERE `entry` = 33829;
UPDATE `creature_template` SET `difficulty_entry_1` = 33839 WHERE `entry` = 33838;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 20, `mingold` = 41000, `maxgold` = 46000, `mechanic_immune_mask` = 8519697 WHERE `entry` = 33839;
-- General Vezax
UPDATE `creature_template` SET `mindmg` = 502, `maxdmg` = 674, `attackpower` = 853, `Health_mod` = 450 WHERE `entry` = 33271;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 502, `maxdmg` = 674, `attackpower` = 853, `dmg_multiplier` = 60, `baseattacktime` = 1800, `mingold` = 3450000, `maxgold` = 3750000, `Health_mod` = 1650, `mechanic_immune_mask` = 617299803, `flags_extra` = 257 WHERE `entry` = 33449;
UPDATE `creature_template` SET `difficulty_entry_1` = 33789 WHERE `entry` = 33488;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33789;
UPDATE `creature_template` SET `difficulty_entry_1` = 34152, `minlevel` = 83, `maxlevel` = 83, `faction_A` = 16, `faction_H` = 16, `Health_mod` = 113, `flags_extra` = 256 WHERE `entry` = 33524;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 35, `Health_mod` = 675, `mechanic_immune_mask` = 650854235, `flags_extra` = 256 WHERE `entry` = 34152;


-- 03_world_icecrown_citadel
-- Icecrown Citadel
-- Db version requirement
ALTER TABLE db_version CHANGE COLUMN required_31_world_db_version required_3_world_icecrown_citadel bit;

-- Cleaning scripts names for npc and bosses
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry` IN (38508,36626,36678,37697,36853,36597,38995,36633,36609,37695,38757,36701,36725,37011,36724,37012,37007,36811,36807,36829,36844,36808,36627,36897,36899,37973,37970,37972,36789,38429,38068,38369,38332,38454,38422,38451);
UPDATE `gameobject_template` SET `ScriptName`='' WHERE `entry` IN (202235,202242,202244,202243,202245,202246,202182,202181);
DELETE FROM `spell_script_names` WHERE `spell_id`=69057 AND `ScriptName`='spell_marrowgar_bone_spike_graveyard';
DELETE FROM `spell_script_names` WHERE `spell_id` IN (69140,72705) AND `ScriptName`='spell_marrowgar_coldflame';
DELETE FROM `spell_script_names` WHERE `spell_id`=69147 AND `ScriptName`='spell_marrowgar_coldflame_trigger';
DELETE FROM `spell_script_names` WHERE `spell_id` IN (69075,70834,70835,70836) AND `ScriptName`='spell_marrowgar_bone_storm';
DELETE FROM `spell_script_names` WHERE `spell_id` IN (70903,71236) AND `ScriptName`='spell_cultist_dark_martyrdom';

DELETE FROM `creature` WHERE `id`=38995;

-- These npc need to be like this for icc script to work
DELETE  FROM `creature_template` WHERE `entry` IN (37006, 37013, 38068, 34606, 38159, 38332, 38451, 38004, 38422, 38454, 37985,  37690, 38285, 38556, 38458);
INSERT INTO `creature_template` VALUES
('34606','0','0','0','0','0','25144','25144','25144','25144','Frost Sphere','','','0','80','80','2','15','15','0','1','1.14286','1','0','420','630','0','157','1','2000','2000','1','0','0','0','0','0','0','0','336','504','126','8','64','0','0','0','0','0','0','0','0','0','66193','67855','0','0','0','0','0','0','0','0','0','0','','0','3','0.238095','1','1','0','0','0','0','0','0','0','721','1','0','536961024','0','mob_frost_sphere','1'),
('37006','0','0','0','0','0','11686','11686','11686','0','Sticky Ooze','','','0','80','80','0','16','16','0','1','1.14286','1','0','2','2','0','24','1','2000','2000','1','33554432','8','0','0','0','0','0','1','1','0','10','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','4','1','1','0','0','0','0','0','0','0','0','1','0','201786289','0','npc_sticky_ooze','1'),
('37013','0','0','0','0','0','11686','11686','11686','0','Puddle Stalker','','','0','1','1','0','14','14','0','1','1.14286','1','0','2','2','0','24','1','2000','2000','1','33554432','8','0','0','0','0','0','1','1','100','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','20','1','1','0','0','0','0','0','0','0','0','1','0','2067619643','0','npc_flood_ooze','1'),
('37690','0','0','0','0','0','24719','24719','24719','0','Growing Ooze Puddle','','','0','80','80','0','16','16','0','1','1.14286','1','0','1','2','0','0','1','2000','2000','1','262146','8','0','0','0','0','0','1','2','0','10','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.238095','1','1','0','0','0','0','0','0','0','0','1','0','2304','0','npc_puddle_ooze','1'),
('37985','0','0','0','0','0','30877','30877','30877','0','Dream Cloud','','','0','80','80','0','16','16','0','1','1.14286','1','0','1','2','0','0','1','2000','2000','1','0','8','0','0','0','0','0','1','1','1','10','16','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','400','1','1','0','0','0','0','0','0','0','0','1','0','2128592795','0','npc_dreamcloud_icc','1'),
('38004','0','0','0','0','0','31093','31093','31093','0','Blood-Queen Lana\'thel','','','0','80','80','2','14','14','0','1','1.14286','1','3','1','1','0','1','2','2000','2000','2','16777220','8','0','0','0','0','0','1','1','1','6','110','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','861','1','1','0','0','0','0','0','0','0','150','1','0','1610612735','0','lanathel_intro','1'),
('38068','0','0','0','0','0','169','11686','169','0','Mana Void','','','0','80','80','0','16','16','0','1','1.14286','1','0','307','459','0','115','1','2000','2000','1','0','8','0','0','0','0','0','246','367','92','10','16','0','0','0','0','0','0','0','0','0','71085','0','0','0','0','0','0','0','0','0','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','0','0','100677675','0','npc_manavoid_icc','1'),
('38159','0','0','0','0','0','27823','27823','27823','0','Choking Gas Bomb','','','0','80','80','2','2068','2068','0','1','1.14286','1','0','422','586','0','642','1.4','2000','2000','1','0','8','0','0','0','0','0','345','509','103','10','16778240','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','EventAI','0','3','4.71733','1','1','0','0','0','0','0','0','0','0','1','0','118429499','0','npc_choke_bomb','1'),
('38285','0','0','0','0','0','31008','0','31008','0','Mutated Abomination','','vehichleCursor','0','82','82','2','14','14','0','1','1.14286','1','1','488','642','0','782','8.5','2000','2000','0','0','0','0','0','0','0','0','363','521','121','6','108','0','0','0','0','0','0','0','0','0','72508','72527','70539','70542','0','0','0','0','0','639','0','0','','0','3','167.345','1','1','0','0','0','0','0','0','0','170','1','0','609320197','0','npc_abomination','1'),
('38332','0','0','0','0','0','26767','19725','26767','0','Ball of Flame','','','0','1','1','0','16','16','0','1','1.14286','1','0','1','2','0','0','1','2000','2000','1','0','8','0','0','0','0','0','1','2','0','10','32','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','0','0','0','0','0','0','0','162','1','0','0','0','npc_fireball_icc','1'),
('38422','0','0','0','0','0','23258','23258','23258','0','Shock Vortex','','','0','80','80','2','14','14','0','1','1.14286','1','1','1','1','0','1','2','2000','2000','1','524290','8','0','0','0','0','0','1','1','1','10','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','50','1','1','0','0','0','0','0','0','0','0','1','0','116345719','0','npc_vortex_icc','1'),
('38451','0','0','0','0','0','26767','19725','26767','0','Ball of Inferno Flame','','','0','1','1','2','16','16','0','1','1.14286','1','0','1','2','0','0','1','2000','2000','1','0','8','0','0','0','0','0','1','2','0','10','32','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','0','0','0','0','0','0','0','162','1','0','0','0','npc_empfireball_icc','1'),
('38454','0','0','0','0','0','19725','19725','19725','0','Kinetic Bomb','','','0','82','82','2','14','14','0','1','1.14286','1','1','452','678','0','169','17.6','2000','2000','1','2','8','0','0','0','0','0','362','542','135','10','0','0','0','0','0','0','0','0','0','0','72800','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.074179','1','1','0','0','0','0','0','0','0','64','1','0','805306367','0','npc_bomb_icc','1'),
('38458','0','0','0','0','0','19725','19725','19725','19725','Kinetic Bomb Target','','','0','80','80','2','14','14','0','1','1.14286','1','0','1','2','0','0','1','2000','2000','1','2','8','0','0','0','0','0','1','2','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','50','1','1','0','0','0','0','0','0','0','0','1','0','439306935','128','','1'),
('38556','0','0','0','0','0','12349','12349','12349','0','Malleable Ooze Stalker','','','0','81','81','2','14','14','0','1','1.14286','1','0','436','654','0','163','1','2000','2000','1','262146','8','0','0','0','0','0','349','523','130','10','16777218','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','2','1','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_malleable_goo','1');
UPDATE `creature_template` SET `unit_class`='1' WHERE `entry`='38285';

DELETE FROM `creature_template` WHERE `entry` IN (36823, 36824, 37672);
INSERT INTO `creature_template` VALUES
('36823','0','0','0','0','0','31021','0','0','0','Terenas Menethil','','','0','80','80','2','35','35','0','1','1.14286','1','1','391','585','0','146','2.2','2000','2000','2','524288','0','0','0','0','0','0','313','468','117','7','4096','0','0','0','0','0','0','0','0','0','69382','72595','0','0','0','0','0','0','0','0','0','0','','0','3','25','15','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_terenas_menethil','1'),
('36824','39296','0','0','0','38121','31471','0','0','0','Spirit Warden','','','0','80','80','2','14','14','0','1','1.14286','1','1','391','585','0','146','2','2000','2000','2','524288','0','0','0','0','0','0','313','468','117','6','4096','0','0','0','0','0','0','0','0','0','69383','74086','69397','0','0','0','0','0','0','0','0','0','','0','3','20','15','1','0','0','0','0','0','0','0','0','1','0','1758157559','0','npc_spirit_warden','1'),
('37672','38605','38786','38787','0','0','31008','0','0','0','Mutated Abomination','','vehichleCursor','0','83','83','2','35','35','0','1','1.14286','1','1','468','702','0','175','2','2000','2000','1','33554440','8','0','0','0','0','0','374','562','140','6','108','0','0','0','0','0','0','0','0','0','70542','72527','70539','0','0','0','0','0','0','639','0','0','','0','3','50','1','1','0','0','0','0','0','0','0','170','1','0','0','0','npc_abomination','1');

-- Wrong faction(I did not add these)
UPDATE `creature_template` SET `faction_A`='16', `faction_H`='16' WHERE `entry`='27805'; 
UPDATE `creature_template` SET `faction_A`='1801', `faction_H`='1801' WHERE `entry`='27826'; 

-- Wrong move generation
UPDATE `creature_template` SET `MovementType`='1'WHERE `entry`='438700'; 
UPDATE `creature` SET `MovementType`='1'WHERE `guid`='54575'; 

-- Declaring instance
UPDATE `instance_template` SET `script`='instance_icecrown_citadel' WHERE (`map`='631');

-- Some gameobjet for ICC (teleporters)
UPDATE `gameobject_template` SET `ScriptName` = 'icecrown_teleporter' WHERE `entry` IN (202223,202235,202242,202243,202244,202245,202246);
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 202223;
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 202242;

-- This is working for me with any SQL support, seem is working nice using core script any way is working on Core Revision: 682 but we have problems to use it on another revs, core problem? any way this SQL is not need it for the table
/*
-- Putricide table
DELETE FROM `gameobject_scripts` WHERE `id`=201584;
REPLACE INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`) VALUES
(201584, 0, 15, 70308, 0, '0'), -- transformation
(201584, 5000, 15, 70311, 0, '0'), -- transformation end
(201584, 5000, 13, 201584, 0, '0'); -- spawn
*/

-- Halion Flame Ring
DELETE FROM `gameobject` WHERE `id`=203624;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(2151041, 203624, 724, 1, 32, 3154.56, 535.418, 72.8889, 5.53401, 0, 0, 0.36589, -0.930658, 3000, 0, 1);

REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`) VALUES (202796, 10, 1327, 'Twilight Portal', '', '', '', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- this is not necessary, is already implemented in ytdb 562
/*
-- Icc Platform Positions
DELETE FROM `gameobject_template` WHERE (`entry`=202078);
INSERT INTO `gameobject_template` VALUES (202078, 14, 9256, 'Arthas Precipice', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);
DELETE FROM `gameobject_template` WHERE (`entry`=202161);
INSERT INTO `gameobject_template` VALUES (202161, 14, 9276, 'Arthas Platform',  '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);
*/

-- Some creature_ai_scripts
-- Some events cant be repetables set to 0 to can be repeteable
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34606);
INSERT INTO `creature_ai_scripts` VALUES 
(270000, 34606, 0, 0, 100, 7, 0, 0, 0, 0, 11, 66193, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Force Cast');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=38879);
INSERT INTO `creature_ai_scripts` VALUES 
(3887900, 38879, 9, 0, 100, 6, 1, 25, 15000, 20000, 11, 70460, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Putricide Trap Trigger');

-- Some spell_linked_spell
DELETE FROM `spell_linked_spell` where `spell_trigger`='-69290' AND `spell_effect`='72103';
REPLACE INTO `spell_linked_spell` VALUES (-69290, 72103, 0, 'Festergut: Spores end => Inoculated');

DELETE FROM `spell_linked_spell` where `spell_trigger` IN ('70157','70117',69785,71340,65684,65686);
DELETE FROM `spell_linked_spell` where `spell_trigger`='-71224';
DELETE FROM `spell_linked_spell` where `spell_trigger`='-73022';
DELETE FROM `spell_linked_spell` where `spell_trigger`='-69783';
DELETE FROM `spell_linked_spell` where `spell_trigger`='-70308';

REPLACE INTO `spell_linked_spell` VALUES (70117, 70122, 1, 'Sindragosa: Icy Grip Trigger => Icy Grip');
REPLACE INTO `spell_linked_spell` VALUES (-71224, 69706, 0, 'Rotface: Mutated Infection => Little Ooze');
REPLACE INTO `spell_linked_spell` VALUES (-73022, 69706, 0, 'Rotface: Mutated Infection HC => Little Ooze');
REPLACE INTO `spell_linked_spell` VALUES (-69783, 69785, 0, 'Rotface: Flood => Flood1');
REPLACE INTO `spell_linked_spell` VALUES (69785, 69788, 2, 'Rotface: Flood1 => Flood2');
REPLACE INTO `spell_linked_spell` VALUES (71340, 71341, 2, 'Lanathel: Darkfallen1 => Darkfallen2');
REPLACE INTO `spell_linked_spell` VALUES (-70308, 70311, 0, 'Abomination Transformation');
REPLACE INTO `spell_linked_spell` VALUES (65684, -65686, 0, 'Light Essence -> Dark Essence '); 
REPLACE INTO `spell_linked_spell` VALUES (65686, -65684, 0, 'Dark Essence -> Light Essence');
REPLACE INTO `spell_linked_spell` VALUES (-74562, 74610, 0, 'Fiery Combustion removed -> Combustion');
REPLACE INTO `spell_linked_spell` VALUES (-74792, 74800, 0, 'Soul Consumption removed -> Consumption');
REPLACE INTO `spell_linked_spell` VALUES (-72372, 73655, 0, 'LichKing: Frostmourn effect add for tele into blade!');
REPLACE INTO `spell_linked_spell` VALUES (-74326, 73655, 0, 'LichKing: Frostmourn effect add for tele into blade( H )!');
REPLACE INTO `spell_linked_spell` VALUES (-74086, 68090, 0, 'Soul Rip damage!');

-- Some fix for NPCs 
-- I did before replacament for no miss anyone
UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35', `unit_flags` = '8', `type_flags` = '67113038' WHERE `entry` IN(36789,10067,10068,10069);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 30090; -- Vortex 'Arcane Overload', 'Hover Disk');
UPDATE `creature_template` SET `flags_extra` = 2, `faction_A` = 35, `faction_H` = 35, `VehicleId` = 165 WHERE `entry` IN (30234, 30248); -- Hover Disk
UPDATE `creature_template` SET `flags_extra` = 2, `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 30118; -- Portal (Malygos)
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 30282;
UPDATE `creature_template` SET `mechanic_immune_mask` = 634339327 WHERE `entry` = 36855;
UPDATE `creature_ai_scripts` SET `action1_param1` = 71258 WHERE `id` = 26021102;

-- creatures not existing in db (not make changes
/*
DELETE FROM `creature_template_addon` where `entry` IN (5542668,5542667);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes2`) VALUES ('5542668', '36476', '4097');
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes2`) VALUES ('5542667', '36661', '4097');
*/
-- where is the npc 500202 to use creature_ai_scripts?....
/*
UPDATE `creature_template` SET `baseattacktime` = 3000, `Health_mod` = 100, `Mana_mod` = 100 WHERE `entry` = 500202;
UPDATE `creature_template` SET `type` = 3 WHERE `entry` = 500202;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500202);
INSERT INTO `creature_ai_scripts` VALUES 
( 50020211, 500202, 0, 0, 100, 7, 10000, 20000, 15000, 30000, 11, 59971, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rain of fire'),
(50020212, 500202, 2, 0, 100, 7, 10, 10, 0, 0, 11, 59971, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Hellfire');
*/
-- you can put an arm or mount but not cloth an npc
/*
DELETE FROM `creature_equip_template` WHERE `entry` IN (500203, 500204);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (500203, 20033, 20009, 9060);
*/
-- what is this update for?... this NPC does not exist in db use to check: SELECT * FROM `creature_template` WHERE `entry` IN (500203, 500204, 500206, 500208);
/*
UPDATE `creature_template` SET `type` = 3 WHERE `entry` = 500203;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500203);
INSERT INTO `creature_ai_scripts` VALUES 
(50020301, 500203, 0, 0, 100, 7, 10000, 10000, 10000, 10000, 11, 13009, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Knockback');

UPDATE `creature_template` SET `type` = 3 WHERE `entry` = 500204;
UPDATE `creature_template` SET `spell2` = 69389 WHERE `entry` = 500204;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500204);
INSERT INTO `creature_ai_scripts` VALUES 
(50020401, 500204, 0, 0, 100, 7, 1000, 2000, 3000, 3000, 11, 70281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emp Shadow Bolt');
UPDATE `creature_template` SET `mindmg` = 20000, `maxdmg` = 25000 WHERE `entry` = 500206;
DELETE FROM `creature_equip_template` WHERE (`entry`=500206);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (500206, 19352, 0, 0);
UPDATE `creature_template` SET `spell1` = 17012 WHERE `entry` = 500208;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500208);
INSERT INTO `creature_ai_scripts` VALUES 
(50020801, 500208, 0, 0, 100, 7, 10000, 10000, 10000, 15000, 11, 17012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Devour Magic');
*/

-- info for tc 9607 Deathbringer Saurfang  
-- Deathbringer Saurfang
SET @NPCSaurfang10N := 37813;
SET @NPCSaurfang25N := 38402;
SET @NPCSaurfang10H := 38582;
SET @NPCSaurfang25H := 38583;

-- High Overlord Saurfang
SET @NPCOverlord10N := 37187; -- this has not id hero mode in ytdb
    -- set id like old way of ytdb (other ids own to tdb and not exist in ytdb)
SET @NPCOverlord25N := 3718701;
SET @NPCOverlord10H := 3718702;
SET @NPCOverlord25H := 3718703;

-- Deathbringer's Cache
SET @DeathbringerCacheGUID := 2753;
SET @DeathbringerCache10N := 202239; -- http://www.wowhead.com/object=202239
SET @DeathbringerCache25N := 202240;
SET @DeathbringerCache10H := 202238;
SET @DeathbringerCache25H := 202241;

-- Make Deathbringer Saurfang bind players to instance and set vehicle id
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x1 WHERE `entry`=37813;

-- Add trigger flag to Martyr Stalkers (else they hit like truck)
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x80 WHERE `entry` IN (38569,39010);

-- Fix factions
UPDATE `creature_template` SET `faction_A`=974, `faction_H`=974 WHERE `entry` IN (@NPCSaurfang10N,@NPCSaurfang25N,@NPCSaurfang10H,@NPCSaurfang25H); -- Deathbringer Saurfang
UPDATE `creature_template` SET `faction_A`=1735, `faction_H`=1735 WHERE `entry` IN (@NPCOverlord10N,@NPCOverlord25N,@NPCOverlord10H,@NPCOverlord25H); -- High Overlord Saurfang
UPDATE `creature_template` SET `faction_A`=1735, `faction_H`=1735 WHERE `entry`=37920; -- Kor'kron Reaver
UPDATE `creature_template` SET `faction_A`=894, `faction_H`=894 WHERE `entry`=37188; -- Jaina Proudmoore
UPDATE `creature_template` SET `faction_A`=1732, `faction_H`=1732 WHERE `entry`=37830; -- Skybreaker Marine
UPDATE `creature_template` SET `faction_A`=1732, `faction_H`=1732 WHERE `entry`=37200; -- Muradin Bronzebeard

-- Fix vehicleIds
UPDATE `creature_template` SET `VehicleId`=591 WHERE `entry` IN (@NPCSaurfang10N,@NPCSaurfang25N,@NPCSaurfang10H,@NPCSaurfang25H); -- Deathbringer Saurfang
UPDATE `creature_template` SET `VehicleId`=599 WHERE `entry` IN (@NPCOverlord10N,@NPCOverlord25N,@NPCOverlord10H,@NPCOverlord25H); -- High Overlord Saurfang

-- Fix NPCFlags
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry` IN (@NPCOverlord10N,@NPCOverlord25N,@NPCOverlord10H,@NPCOverlord25H); -- High Overlord Saurfang

-- Set difficulty ids
UPDATE `creature_template` SET `difficulty_entry_1`=@NPCOverlord25N, `difficulty_entry_2`=@NPCOverlord10H, `difficulty_entry_3`=@NPCOverlord25H WHERE `entry`=@NPCOverlord10N; -- High Overlord Saurfang

-- Unclickable flag for doors
UPDATE `gameobject_template` SET `flags`=`flags`|0x1 WHERE `entry`=201825; -- Saurfang's Door
UPDATE `gameobject_template` SET `flags`=0x28 WHERE `entry`=202220; -- Lady Deathwhisper Elevator

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (70572,72202);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
(13,0,70572,0,18,1,37920,0,0, '', 'Deathbringer Saurfang - Grip of Agony'),
(13,0,70572,0,18,1,37200,0,0, '', 'Deathbringer Saurfang - Grip of Agony'),
(13,0,70572,0,18,1,37187,0,0, '', 'Deathbringer Saurfang - Grip of Agony'),
(13,0,70572,0,18,1,37830,0,0, '', 'Deathbringer Saurfang - Grip of Agony'),
(13,0,72202,0,18,1,37813,0,0, '', 'Deathbringer Saurfang - Blood Link');

-- Deathbringer's Cache
-- blizzlike position
DELETE FROM `gameobject` WHERE `id` IN (@DeathbringerCache10N,@DeathbringerCache25N,@DeathbringerCache10H,@DeathbringerCache25H);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(2753,@DeathbringerCache10N,631,1,1,-489.7205,2172.06763,539.289368,2.652894,0,0,0,0,-120,0,1),
(2761,@DeathbringerCache25N,631,2,1,-489.7205,2172.06763,539.289368,2.652894,0,0,0,0,-120,0,1),
(2724,@DeathbringerCache10H,631,4,1,-489.7205,2172.06763,539.289368,2.652894,0,0,0,0,-120,0,1),
(2910,@DeathbringerCache25H,631,8,1,-489.7205,2172.06763,539.289368,2.652894,0,0,0,0,-120,0,1);

-- Achievements
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12776,12997,12995,12998,12778,13036,13035,13037) AND `type`!=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(12776,12,0,0, ''), -- Full House (10 player) N
(12997,12,1,0, ''), -- Full House (25 player) N
(12995,12,2,0, ''), -- Full House (10 player) H
(12998,12,3,0, ''), -- Full House (25 player) H
(12778,12,0,0, ''), -- I've Gone and Made a Mess (10 player) N
(13036,12,1,0, ''), -- I've Gone and Made a Mess (25 player) N
(13035,12,2,0, ''), -- I've Gone and Made a Mess (10 player) H
(13037,12,3,0, ''); -- I've Gone and Made a Mess (25 player) H

-- Creature templates
DELETE FROM `creature_template` WHERE `entry` IN (3718701,3718702,3718703); -- delete invalid
DELETE FROM `creature_template` WHERE `entry` IN (@NPCOverlord25N,@NPCOverlord10H,@NPCOverlord25H); -- delete before insert
INSERT INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
(@NPCOverlord25N,0,0,0,0,0,30583,0,0,0, 'High Overlord Saurfang (1)', '', '',0,83,83,2,1735,1735,1,1,1.14286,1,3,509,683,0,805,35,0,0,1,33600,8,0,0,0,0,0,371,535,135,7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,599,0,0, '',0,3,300,1,1,0,0,0,0,0,0,0,164,1,0,0,0, '',1),
(@NPCOverlord10H,0,0,0,0,0,30583,0,0,0, 'High Overlord Saurfang (2)', '', '',0,83,83,2,1735,1735,1,1,1.14286,1,3,509,683,0,805,35,0,0,1,33600,8,0,0,0,0,0,371,535,135,7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,599,0,0, '',0,3,300,1,1,0,0,0,0,0,0,0,164,1,0,0,0, '',1),
(@NPCOverlord25H,0,0,0,0,0,30583,0,0,0, 'High Overlord Saurfang (3)', '', '',0,83,83,2,1735,1735,1,1,1.14286,1,3,509,683,0,805,35,0,0,1,33600,8,0,0,0,0,0,371,535,135,7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,599,0,0, '',0,3,300,1,1,0,0,0,0,0,0,0,164,1,0,0,0, '',1);

-- info for tc 9607 Deathbringer Saurfang - additional data missed in previous topic
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=72260;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,72260,0,18,1,37920,0,0, '', 'Deathbringer Saurfang - Mark of the Fallen Champion heal');

-- Equip templates
DELETE FROM `creature_equip_template` WHERE (`entry`=500207);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (500207, 25210, 0, 0);
UPDATE `creature_template` SET `mindmg` = 15000, `maxdmg` = 20000 WHERE `entry` = 500207;

-- Fix for vehicles
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38402';
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38582';
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38583';

-- Some loots
DELETE FROM `creature_loot_template` WHERE (`entry`=500209) AND (`item`=50307);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES (500209, 50307, 100,  '1', '1');
UPDATE `creature_template` SET `lootid` = '500209' WHERE `entry` = '38248';

-- First declaring scripts names
# Boss
UPDATE `creature_template` SET `ScriptName`='boss_blood_queen_lanathel' WHERE `entry`='37955';
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_keleset_icc' WHERE `entry` = 37972;
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_taldaram_icc' WHERE `entry` = 37973;
UPDATE `creature_template` SET `ScriptName`='boss_blood_council' WHERE `entry`='37970';
UPDATE `creature_template` SET `ScriptName`='boss_festergut' WHERE `entry`='36626';
UPDATE `creature_template` SET `ScriptName`='boss_professor_putricide' WHERE `entry`='36678';
UPDATE `creature_template` SET `ScriptName`='boss_sindragosa' WHERE (`entry`='36853');
UPDATE `creature_template` SET `ScriptName`='boss_valithria' WHERE `entry` = 36789;
UPDATE `creature_template` SET `ScriptName`='boss_the_lich_king' WHERE (`entry`='36597');
UPDATE `creature_template` SET `ScriptName`='boss_rotface' WHERE `entry`= 36627;

# Mobs
UPDATE `creature_template` SET `ScriptName`='npc_tirion_icc' WHERE (`entry`='38995');
UPDATE `creature_template` SET `ScriptName`='npc_swarming_shadows' WHERE (`entry`='38163');
UPDATE `creature_template` SET `ScriptName`='npc_bloodbeast' WHERE (`entry`='38508');
UPDATE `creature_template` SET `ScriptName`='npc_volatile_ooze' WHERE (`entry`='37697');  
UPDATE `creature_template` SET `ScriptName`='npc_ice_puls_icc' WHERE (`entry`='36633');
UPDATE `creature_template` SET `ScriptName`='npc_valkyr_icc' WHERE (`entry`='36609');
UPDATE `creature_template` SET `ScriptName`='npc_ghoul_icc' WHERE (`entry`='37695');
UPDATE `creature_template` SET `ScriptName`='npc_defile_icc' WHERE (`entry`='38757');
UPDATE `creature_template` SET `ScriptName`='npc_raging_spirit_icc' WHERE (`entry`='36701');
UPDATE `creature_template` SET `ScriptName`='npc_ooze_little' WHERE `entry`= 36897;
UPDATE `creature_template` SET `ScriptName`='npc_ooze_big' WHERE `entry`= 36899;
UPDATE `creature_template` SET `ScriptName`='npc_nerubar_brood_keeper' WHERE `entry` = 36725;
UPDATE `creature_template` SET `ScriptName`='npc_the_damned' WHERE `entry` = 37011;
UPDATE `creature_template` SET `ScriptName`='npc_servant_of_the_throne' WHERE `entry` = 36724;
UPDATE `creature_template` SET `ScriptName`='npc_ancient_skeletal_soldier' WHERE `entry` = 37012;
UPDATE `creature_template` SET `ScriptName`='npc_death_bound_ward' WHERE `entry` = 37007;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_attedant' WHERE `entry` = 36811;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_disciple' WHERE `entry` = 36807;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_high_priest' WHERE `entry` = 36829;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_servant' WHERE `entry` = 36844;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_zealot' WHERE `entry` = 36808;
UPDATE `creature_template` SET `ScriptName`='npc_skellmage_icc' WHERE `entry` = 37868;
UPDATE `creature_template` SET `ScriptName`='npc_fireskell_icc' WHERE `entry` = 36791;
UPDATE `creature_template` SET `ScriptName`='npc_suppressor_icc' WHERE `entry` = 37863;
UPDATE `creature_template` SET `ScriptName`='npc_manavoid_icc' WHERE `entry` = 38068;
UPDATE `creature_template` SET `ScriptName`='npc_glutabomination_icc' WHERE `entry` = 37886;
UPDATE `creature_template` SET `ScriptName`='npc_blistzombie_icc' WHERE `entry` = 37934;
UPDATE `creature_template` SET `ScriptName`='npc_dreamcloud_icc' WHERE `entry` = 37985;
UPDATE `creature_template` SET `ScriptName`='npc_dreamportal_icc' WHERE `entry` = 37945;
UPDATE `creature_template` SET `ScriptName`='npc_nucleus_icc' WHERE `entry`=38369;
UPDATE `creature_template` SET `ScriptName`='npc_fireball_icc' WHERE `entry`=38332;
UPDATE `creature_template` SET `ScriptName`='npc_bomb_icc' WHERE `entry`=38454;
UPDATE `creature_template` SET `ScriptName`='npc_vortex_icc' WHERE `entry`=38422;
UPDATE `creature_template` SET `ScriptName`='npc_empfireball_icc' WHERE `entry`=38451;
UPDATE `creature_template` SET `ScriptName`='npc_precious_icc' WHERE (`entry`='37217');
UPDATE `creature_template` SET `ScriptName`='npc_stinky_icc' WHERE (`entry`='37025');
UPDATE `creature_template` SET `ScriptName`='npc_puddle_ooze' WHERE (`entry`='37690');
UPDATE `creature_template` SET `ScriptName`='npc_malleable_goo' WHERE (`entry`='38556');
UPDATE `creature_template` SET `ScriptName`='npc_abomination' WHERE (`entry`='37672');
UPDATE `creature_template` SET `ScriptName`='npc_spinestalker' WHERE (`entry`='37534');
UPDATE `creature_template` SET `ScriptName`='npc_rimefang' WHERE (`entry`='37533');
UPDATE `creature_template` SET `ScriptName`='npc_ice_tomb' WHERE (`entry`='36980');
UPDATE `creature_template` SET `ScriptName`='npc_frost_bomb' WHERE (`entry`='37186');
UPDATE `creature_template` SET `ScriptName`='npc_shambling_horror' WHERE (`entry`='37698');
UPDATE `creature_template` SET `ScriptName`='npc_terenas_menethil' WHERE (`entry`='36823');
UPDATE `creature_template` SET `ScriptName`='npc_spirit_warden' WHERE (`entry`='36824');
UPDATE `creature_template` SET `ScriptName`='npc_sister_svalna' WHERE (`entry` = '37126');
UPDATE `creature_template` SET `ScriptName`='npc_impaling_spear' WHERE (`entry` = '38248');
UPDATE `creature_template` SET `ScriptName`='npc_gas_cloud' WHERE `entry` = '37562';
UPDATE `creature_template` SET `ScriptName`='lanathel_intro' WHERE (`entry`='38004');
UPDATE `creature_template` SET `vehicleId`=533 WHERE `entry`=36619;

-- Inserting NPC's on world
DELETE FROM `creature` WHERE `id`=38004;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(1084973, 38004, 631, 1, 128, 0, 0, 4689.4, 2766.9, 383.049, 3.47957, 300, 0, 0, 861, 60, 0, 0);

DELETE FROM `creature` WHERE `id`=37985;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(506554, 37985, 631, 15, 16, 0, 0, 4243.66, 2484.51, 364.872, 5.31148, 100, 0, 0, 2136800, 0, 0, 0),
(506475, 37985, 631, 15, 16, 0, 0, 4236.5, 2497.72, 364.535, 3.20033, 100, 0, 0, 2136800, 0, 0, 0),
(506471, 37985, 631, 15, 16, 0, 0, 4239.48, 2490.41, 364.872, 0.948594, 100, 0, 0, 2136800, 0, 0, 0),
(506327, 37985, 631, 15, 16, 0, 0, 4237.79, 2475.92, 364.869, 3.54434, 100, 0, 0, 2136800, 0, 0, 0),
(506325, 37985, 631, 15, 16, 0, 0, 4245.1, 2482.25, 364.872, 4.08862, 100, 0, 0, 2136800, 0, 0, 0),
(506323, 37985, 631, 30, 16, 0, 0, 4244.52, 2491.03, 364.872, 6.0474, 30, 0, 0, 2136800, 0, 0, 0),
(506321, 37985, 631, 30, 16, 0, 0, 4236.34, 2488.13, 364.872, 0.706694, 30, 0, 0, 2136800, 0, 0, 0),
(506317, 37985, 631, 30, 16, 0, 0, 4241.98, 2477.28, 364.87, 3.73676, 30, 0, 0, 2136800, 0, 0, 0),
(506139, 37985, 631, 30, 16, 0, 0, 4241.86, 2480.43, 364.872, 3.91191, 100, 0, 0, 2136800, 0, 0, 0),
(506126, 37985, 631, 30, 16, 0, 0, 4236.94, 2484.88, 364.872, 0.995723, 30, 0, 0, 2136800, 0, 0, 0),
(506124, 37985, 631, 30, 16, 0, 0, 4229.62, 2477.61, 364.87, 0.64465, 100, 0, 0, 2136800, 0, 0, 0),
(505946, 37985, 631, 30, 16, 0, 0, 4237.64, 2478.52, 364.87, 3.28595, 30, 0, 0, 2136800, 0, 0, 0),
(505944, 37985, 631, 30, 16, 0, 0, 4240.9, 2487.19, 364.872, 5.73168, 100, 0, 0, 2136800, 0, 0, 0),
(505938, 37985, 631, 30, 16, 0, 0, 4227.1, 2477.02, 364.87, 1.58242, 30, 0, 0, 2136800, 0, 0, 0),
(505840, 37985, 631, 30, 16, 0, 0, 4230.65, 2481.4, 364.871, 3.54199, 100, 0, 0, 2136800, 0, 0, 0),
(505838, 37985, 631, 30, 16, 0, 0, 4237.12, 2482.58, 364.871, 2.84455, 30, 0, 0, 2136800, 0, 0, 0),
(505802, 37985, 631, 30, 16, 0, 0, 4238.74, 2478.33, 364.871, 3.19641, 100, 0, 0, 2136800, 0, 0, 0),
(505799, 37985, 631, 30, 16, 0, 0, 4247.38, 2481.94, 364.871, 4.96513, 30, 0, 0, 2136800, 0, 0, 0),
(505795, 37985, 631, 30, 16, 0, 0, 4233.26, 2488.56, 364.871, 1.29889, 100, 0, 0, 2136800, 0, 0, 0),
(504691, 37985, 631, 30, 16, 0, 0, 4219.19, 2501.9, 379.283, 6.00789, 30, 0, 0, 2136800, 0, 0, 0);

UPDATE `creature` SET `spawnMask`='3' where `id`='37985' and `map`='631';

-- Why if this is ths update of ICC you are spawning 2 creatures in map 658 <--- NOT ICC MAP, is PoS
/*
DELETE FROM `creature` WHERE `id`=36658;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5543011, 36658, 658 <--- NOT ICC MAP, 15, 3, 0, 2013, 969.309, 180.069, 628.156, 5.95328, 300, 0, 0, 653829, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=36661;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5543609, 36661, 658 <--- NOT ICC MAP, 1, 3, 0, 0, 967.121, 181.192, 639.719, 5.84175, 300, 0, 0, 3235440, 41690, 0, 0);
*/

DELETE FROM `creature` WHERE `id`=36823;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5566038, 36823, 631, 1, 64, 0, 0, 505.56, -2522.96, 1249.87, 3.12086, 300, 0, 0, 315000, 59910, 0, 0);

DELETE FROM `creature` WHERE `id`=36824;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5565952, 36824, 631, 1, 64, 0, 0, 482.812, -2523.32, 1249.87, 6.24047, 300, 0, 0, 252000, 59910, 0, 0);

-- Deleting scripts text
DELETE FROM script_texts WHERE entry <= -1665902 AND entry >= -1666080;
DELETE FROM script_texts WHERE entry <= -1810001 AND entry >= -1810031;

-- Scripts texts

# 3
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1665919,'Thank the spirits for you, brothers and sisters. The Skybreaker has already left. Quickly now, to Orgrim''s Hammer! If you leave soon, you may be able to catch them.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,''),
(0,-1665920,'This should be helpin''ya!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,''),
(0,-1665921,'Aka''Magosh, brave warriors. The alliance is in great number here.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665922,'Captain Saurfang will be pleased to see you aboard Orgrim''s Hammer. Make haste, we will secure the area until you are ready for take-off.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665923,'A screeching cry pierces the air above!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665924,'A Spire Frostwyrm lands just before Orgrim''s Hammer.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665925,'Rise up, sons and daughters of the Horde! Today we battle a hated enemy of the Horde! LOK''TAR OGAR! Kor''kron, take us out!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665926,'What is that?! Something approaching in the distance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665927,'ALLIANCE GUNSHIP! ALL HANDS ON DECK!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665928,'Move yer jalopy or we''ll blow it out of the sky, orc! The Horde''s got no business here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665929,'You will know our business soon! KOR''KRON, ANNIHILATE THEM!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665930,'Marines, Sergeants, attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665931,'You DARE board my ship? Your death will come swiftly.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665932,'Riflemen, shoot faster!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665933,'Mortar team, reload!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665934,'We''re taking hull damage, get a sorcerer out here to shut down those cannons!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665935,'The Alliance falter. Onward to the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665936,'Damage control! Put those fires out! You haven''t seen the last of the Horde!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665937,'Thank goodness you arrived when you did, heroes. Orgrim''s Hammer has already left. Quickly now, to The Skybreaker! If you leave soon, you may be able to catch them.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665938,'This ought to help!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665939,'Skybreaker Sorcerer summons a Skybreaker Battle Standard.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665940,'You have my thanks. We were outnumbered until you arrived.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665941,'Captain Muradin is waiting aboard The Skybreaker. We''ll secure the area until you are ready for take off.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665942,'Skybreaker infantry, hold position!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665943,'A screeching cry pierces the air above!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665944,'A Spire Frostwyrm lands just before The Skybreaker. ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665945,'Fire up the engines! We got a meetin with destiny, lads!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665946,'Hold on to yer hats!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665947,'What in the world is that? Grab me spyglass, crewman!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665948,'By me own beard! HORDE SAILIN IN FAST N HOT!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665949,'EVASIVE ACTION! MAN THE GUNS!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665950,'Cowardly dogs! Ye blindsighted us!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665951,'This is not your battle, dwarf. Back down or we will be forced to destroy your ship.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665952,'Not me battle? I dunnae who ye? think ye are, mister, but I got a score to settle with Arthas and yer not gettin in me way! FIRE ALL GUNS! FIRE! FIRE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665953,'Reavers, Sergeants, attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665954,'What''s this then?! Ye won''t be takin this son o Ironforge''s vessel without a fight!.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665955,'Axethrowers, hurl faster!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665956,'Rocketeers, reload!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665957,'We''re taking hull damage, get a battle-mage out here to shut down those cannons!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665958,'Don''t say I didn''t warn ya, scoundrels! Onward, brothers and sisters!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665959,'Captain Bartlett, get us out of here! We''re taken too much damage to stay afloat!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'');

# 5
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666004,'NOOOO! You kill Stinky! You pay!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16907,1,0,0,''),
(0,-1666005,'Fun time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16901,1,0,0,''),
(0,-1666006,'Just an ordinary gas cloud. But watch out, because that''s no ordinary gas cloud!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17119,1,0,0,''),
(0,-1666007,'Festergut farts.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16911,4,0,0,''),
(0,-1666008,'Gyah! Uhhh, I not feel so good...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16906,1,0,0,''),
(0,-1666009,'I not feel so good!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16906,1,0,0,''),
(0,-1666010,'Daddy, I did it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16902,1,0,0,''),
(0,-1666011,'Dead, dead, dead! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16903,1,0,0,''),
(0,-1666012,'Fun time over!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16905,1,0,0,''),
(0,-1666013,'Da...Daddy...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16904,1,0,0,''),
(0,-1666014,'Oh, Festergut. You were always my favorite. Next to Rotface. The good news is you left behind so much gas, I can practically taste it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17124,1,0,0,'');

# 6
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666015,'What? Precious? Noooooooooo!!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16993,1,0,0,''),
(0,-1666016,'WEEEEEE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16986,1,0,0,''),
(0,-1666017,'Icky sticky.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16991,1,0,0,''),
(0,-1666018,'I think I made an angry poo-poo. It gonna blow! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16992,1,0,0,''),
(0,-1666019,'Great news, everyone! The slime is flowing again!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17126,1,0,0,''),
(0,-1666020,'Good news, everyone! I''ve fixed the poison slime pipes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17123,1,0,0,''),
(0,-1666021,'Daddy make toys out of you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16988,1,0,0,''),
(0,-1666022,'I brokes-ded it...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16987,1,0,0,''),
(0,-1666023,'Sleepy Time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16990,1,0,0,''),
(0,-1666024,'Bad news daddy.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16989,1,0,0,''),
(0,-1666025,' Terrible news, everyone, Rotface is dead! But great news everyone, he left behind plenty of ooze for me to use! Whaa...? I''m a poet, and I didn''t know it? Astounding!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17146,1,0,0,'');

# 7
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666026,'Good news, everyone! I think I perfected a plague that will destroy all life on Azeroth!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17114,1,0,0,''),
(0,-1666027,'You can''t come in here all dirty like that! You need that nasty flesh scrubbed off first!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17125,1,0,0,''),
(0,-1666028,'Two oozes, one room! So many delightful possibilities...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17122,1,0,0,''),
(0,-1666029,'Hmm. I don''t feel a thing. Whaa...? Where''d those come from?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17120,1,0,0,''),
(0,-1666030,'Tastes like... Cherry! Oh! Excuse me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17121,1,0,0,''),
(0,-1666031,'Hmm... Interesting...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17115,1,0,0,''),
(0,-1666032,'That was unexpected!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17116,1,0,0,''),
(0,-1666033,'Great news, everyone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17118,1,0,0,''),
(0,-1666034,'Bad news, everyone! I don''t think I''m going to make it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17117,1,0,0,'');

# 8
DELETE FROM `script_texts` where `entry` IN (-1999926);
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666035,'Foolish mortals. You thought us defeated so easily? The San''layn are the Lich King''s immortal soldiers! Now you shall face their might combined!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16795,1,0,0,''),
(0,-1666036,'Rise up, brothers, and destroy our enemies.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16797,1,0,0,''),
(0,-1666037,'Such wondrous power! The Darkfallen Orb has made me INVINCIBLE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16727,1,0,0,''),
(0,-1666038,'Blood will flow!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16728,1,0,0,''),
(0,-1666039,'Were you ever a threat?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16723,1,0,0,''),
(0,-1666040,'Truth is found in death.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16724,1,0,0,''),
(0,-1666041,'Prince Keleseth cackles maniacally!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16726,2,0,0,''),
(0,-1666042,'My queen... they come...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16725,1,0,0,''),
(0,-1666043,'Tremble before Taldaram, mortals, for the power of the orb flows through me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16857,1,0,0,''),
(0,-1666044,'Delight in the pain!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16858,1,0,0,''),
(0,-1666045,'Worm food.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16853,1,0,0,''),
(0,-1666046,'Beg for mercy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16854,1,0,0,''),
(0,-1666047,'Prince Taldaram laughs.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16856,2,0,0,''),
(0,-1666048,'Prince Taldaram gurgles and dies.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16855,2,0,0,''),
(0,-1666049,'Naxxanar was merely a setback! With the power of the orb, Valanar will have his vengeance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16685,1,0,0,''),
-- Really dont know, the max number you an set on a entry text is -1999999 an now is set (how you can see) -250000 I set in the last free npc_entry
-- (0,-2500000,'My cup runneth over.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16686,1,0,0,''),
-- Also need core support but I did the fix.
(0,-1999926,'My cup runneth over.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16686,1,0,0,''),
(0,-1666050,'Dinner... is served.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16681,1,0,0,''),
(0,-1666051,'Do you see NOW the power of the Darkfallen?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16682,1,0,0,''),
(0,-1666052,'BOW DOWN BEFORE THE SAN''LAYN!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16684,1,0,0,''),
(0,-1666053,'...why...?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16683,1,0,0,'');

# 9
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666054,'You have made an... unwise... decision.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16782,1,0,0,''),
(0,-1666055,'Just a taste...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16783,1,0,0,''),
(0,-1666056,'Know my hunger!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16784,1,0,0,''),
(0,-1666057,'SUFFER!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16786,1,0,0,''),
(0,-1666058,'Can you handle this?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16787,1,0,0,''),
(0,-1666059,'Yes... feed my precious one! You''re mine now! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16790,1,0,0,''),
(0,-1666060,'Here it comes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16788,1,0,0,''),
(0,-1666061,'THIS ENDS NOW!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16793,1,0,0,''),
(0,-1666062,'But... we were getting along... so well...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16794,1,0,0,'');

# 10
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666063,'Heroes, lend me your aid! I... I cannot hold them off much longer! You must heal my wounds!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17064,1,0,0,''),
(0,-1666064,'I have opened a portal into the Emerald Dream. Your salvation lies within, heroes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17068,1,0,0,''),
(0,-1666065,'My strength is returning! Press on, heroes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17070,1,0,0,''),
(0,-1666066,'I will not last much longer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17069,1,0,0,''),
(0,-1666067,'Forgive me for what I do! I... cannot... stop... ONLY NIGHTMARES REMAIN!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17072,1,0,0,''),
(0,-1666068,'A tragic loss...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17066,1,0,0,''),
(0,-1666069,'FAILURES!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17067,1,0,0,''),
(0,-1666070,'I am renewed! Ysera grants me the favor to lay these foul creatures to rest!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17071,1,0,0,'');

# 11
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666071,'You are fools who have come to this place! The icy winds of Northrend will consume your souls!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17007,1,0,0,''),
(0,-1666072,'Suffer, mortals, as your pathetic magic betrays you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17014,1,0,0,''),
(0,-1666073,'Can you feel the cold hand of death upon your heart?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17013,1,0,0,''),
(0,-1666074,'Aaah! It burns! What sorcery is this?!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17015,1,0,0,''),
(0,-1666075,'Your incursion ends here! None shall survive!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17012,1,0,0,''),
(0,-1666076,'Now feel my master''s limitless power and despair!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17016,1,0,0,''),
(0,-1666077,'Perish!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17008,1,0,0,''),
(0,-1666078,'A flaw of mortality...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17009,1,0,0,''),
(0,-1666079,'Enough! I tire of these games!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17011,1,0,0,''),
(0,-1666080,'Free...at last...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17010,1,0,0,'');

# 12
INSERT INTO script_texts (entry,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8,sound,type,language,emote,comment)VALUES
(-1810001, 'So...the Light''s vaunted justice has finally arrived. Shall I lay down Frostmourne and throw myself at your mercy, Fordring?',null,null,null,null,null,null,null,null,17349,1,0,0,''),
(-1810002, 'We will grant you a swift death, Arthas. More than can be said for the thousands you''ve tortured and slain.',null,null,null,null,null,null,null,null,17390,1,0,0,''),
(-1810003, 'You will learn of that first hand. When my work is complete, you will beg for mercy -- and I will deny you. Your anguished cries will be testament to my unbridled power.',null,null,null,null,null,null,null,null,17350,1,0,0,''),
(-1810004, 'So be it. Champions, attack!',null,null,null,null,null,null,null,null,17391,1,0,0,''),
(-1810005, 'I''ll keep you alive to witness the end, Fordring. I would not want the Light''s greatest champion to miss seeing this wretched world remade in my image.',null,null,null,null,null,null,null,null,17351,1,0,0,''),
(-1810006, 'Come then champions, feed me your rage!',null,null,null,null,null,null,null,null,17352,1,0,0,''),
(-1810007, 'I will freeze you from within until all that remains is an icy husk!',null,null,null,null,null,null,null,null,17369,1,0,0,''),
(-1810008, 'Apocalypse!',null,null,null,null,null,null,null,null,17371,1,0,0,''),
(-1810009, 'Bow down before your lord and master!',null,null,null,null,null,null,null,null,17372,1,0,0,''),
(-1810010, 'Hope wanes!',null,null,null,null,null,null,null,null,17363,1,0,0,''),
(-1810011, 'The end has come!',null,null,null,null,null,null,null,null,17364,1,0,0,''),
(-1810012, 'Face now your tragic end!',null,null,null,null,null,null,null,null,17365,1,0,0,''),
(-1810013, 'No question remains unanswered. No doubts linger. You are Azeroth''s greatest champions! You overcame every challenge I laid before you. My mightiest servants have fallen before your relentless onslaught, your unbridled fury... Is it truly righteousness that drives you? I wonder.',null,null,null,null,null,null,null,null,17353,1,0,0,''),
(-1810014, 'You trained them well, Fordring. You delivered the greatest fighting force this world has ever known... right into my hands -- exactly as I intended. You shall be rewarded for your unwitting sacrifice.',null,null,null,null,null,null,null,null,17355,1,0,0,''),
(-1810015, 'Watch now as I raise them from the dead to become masters of the Scourge. They will shroud this world in chaos and destruction. Azeroth''s fall will come at their hands -- and you will be the first to die.',null,null,null,null,null,null,null,null,17356,1,0,0,''),
(-1810016, 'I delight in the irony.',null,null,null,null,null,null,null,null,17357,1,0,0,''),
(-1810017, 'LIGHT, GRANT ME ONE FINAL BLESSING. GIVE ME THE STRENGTH... TO SHATTER THESE BONDS!',null,null,null,null,null,null,null,null,17392,1,0,0,''),
(-1810018, 'Impossible...',null,null,null,null,null,null,null,null,17358,1,0,0,''),
(-1810019, '',null,null,null,null,null,null,null,null,17360,1,0,0,''),
(-1810020, 'No more, Arthas! No more lives will be consumed by your hatred!',null,null,null,null,null,null,null,null,17393,1,0,0,''),
(-1810021, 'Free at last! It is over, my son. This is the moment of reckoning.',null,null,null,null,null,null,null,null,17397,1,0,0,''),
(-1810022, 'The Lich King must fall!',null,null,null,null,null,null,null,null,17389,1,0,0,''),
(-1810023, 'Rise up, champions of the Light!',null,null,null,null,null,null,null,null,17398,1,0,0,''),
(-1810024, 'Now I stand, the lion before the lambs... and they do not fear.',null,null,null,null,null,null,null,null,17361,1,0,0,''),
(-1810025, 'They cannot fear.',null,null,null,null,null,null,null,null,17362,1,0,0,''),
(-1810026, 'Argh... Frostmourne, obey me!',null,null,null,null,null,null,null,null,17367,1,0,0,''),
(-1810027, 'Frostmourne hungers...',null,null,null,null,null,null,null,null,17366,1,0,0,''),
(-1810028, 'Frostmourne feeds on the soul of your fallen ally!',null,null,null,null,null,null,null,null,17368,1,0,0,''),
(-1810029, 'Val''kyr, your master calls!',null,null,null,null,null,null,null,null,17373,1,0,0,''),
(-1810030, 'Watch as the world around you collapses!',null,null,null,null,null,null,null,null,17370,1,0,0,''),
(-1810031, 'You gnats actually hurt me! Perhaps I''ve toyed with you long enough, now taste the vengeance of the grave!',null,null,null,null,null,null,null,null,17359,1,0,0,'');

# 13
DELETE FROM script_texts where `entry` in (-1900001,-1900002,-1900003,-1900004,-1900005,-1900006,-1900007);
INSERT INTO script_texts (entry,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8,sound,type,language,emote,comment)VALUES
(-1900001, 'You may have once fought beside me, Crok, but now you are nothing more than a traitor. Come, your second death approaches!',null,null,null,null,null,null,null,null,17017,1,0,0,''),
(-1900002, 'Miserable creatures, Die!',null,null,null,null,null,null,null,null,17018,1,0,0,''),
(-1900003, 'Foolish Crok, you brought my reinforcements with you! Arise Argent Champions and serve the Lich King in death!',null,null,null,null,null,null,null,null,17019,1,0,0,''),
(-1900004, 'Come Scourgebane, I''ll show the Lich King which one of us is truly worthy of the title, champion!',null,null,null,null,null,null,null,null,17020,1,0,0,''),
(-1900005, 'What a pitiful choice of an ally Crok.',null,null,null,null,null,null,null,null,17021,1,0,0,''),
(-1900006, 'What? They died so easily? No matter.',null,null,null,null,null,null,null,null,17022,1,0,0,''),
(-1900007, 'Perhaps... you were right... Crok.',null,null,null,null,null,null,null,null,17023,1,0,0,'');

-- Archivement criteria for ICC
-- 10 Normal
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11684,11685,11686,11687,11688,12281,12280,11804,11803,12258,11778,12116,11838,11861,11802,11779);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Call of the Crusade (10 player)
(11684,12,0,0),
(11685,12,0,0),
(11686,12,0,0),
(11687,12,0,0),
(11688,12,0,0),
-- Not One, But Two Jormungars (10 player)
(12281,12,0,0),
(12280,12,0,0),
-- Resilience Will Fix It (10 player)
(11804,12,0,0),
(11803,12,0,0),
-- Salt and Pepper (10 player)
(12258,12,0,0),
(11778,12,0,0),
-- The Traitor King (10 player)
(12116,12,0,0),
-- Three Sixty Pain Spike (10 player)
(11838,12,0,0),
(11861,12,0,0),
-- Upper Back Pain (10 player)
(11802,12,0,0),
(11779,12,0,0);

-- 10 Hero
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11690,11689,11682,11693,11691,12345,12346,12344,12347,12348,12349,12360);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Call of the Grand Crusade (10 player)
(11690,12,2,0),
(11689,12,2,0),
(11682,12,2,0),
(11693,12,2,0),
(11691,12,2,0),
-- A Tribute to Skill (10 player)
(12345,12,2,0),
(12346,12,2,0),
(12344,12,2,0),
-- A Tribute to Mad Skill (10 player)
(12347,12,2,0),
(12348,12,2,0),
-- A Tribute to Insanity (10 player)
(12349,12,2,0),
-- A Tribute to Dedicated Insanity
(12360,12,2,0);

-- 25 normal
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11679,11683,11680,11682,11681,12278,12279,11800,11799,11860,11818,12198,11839,11862,11801,11780);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Call of the Crusade (25 player)
(11679,12,1,0),
(11683,12,1,0),
(11680,12,1,0),
(11682,12,1,0),
(11681,12,1,0),
-- Not One, But Two Jormungars (25 player)
(12278,12,1,0),
(12279,12,1,0),
-- Resilience Will Fix It (25 player)
(11800,12,1,0),
(11799,12,1,0),
-- Salt and Pepper (25 player)
(11860,12,1,0),
(11818,12,1,0),
-- The Traitor King (25 player)
(12198,12,1,0),
-- Three Sixty Pain Spike (25 player)
(11839,12,1,0),
(11862,12,1,0),
-- Upper Back Pain (25 player)
(11801,12,1,0),
(11780,12,1,0);

-- 25 Hero
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11542,11546,11547,11549,11678,12340,12338,12339,12342,12341,12343,12359,12358,12350);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Call of the Grand Crusade (25 player)
(11542,12,3,0),
(11546,12,3,0),
(11547,12,3,0),
(11549,12,3,0),
(11678,12,3,0),
-- A Tribute to Skill (25 player)
(12340,12,3,0),
(12338,12,3,0),
(12339,12,3,0),
-- A Tribute to Mad Skill (25 player)
(12342,12,3,0),
(12341,12,3,0),
-- A Tribute to Insanity (25 player)
(12343,12,3,0),
-- A Tribute to Immortality
(12359,12,3,0),
-- A Tribute to Immortality
(12358,12,3,0),
-- Realm First! Grand Crusader
(12350,12,3,0);

UPDATE `creature_template` SET `unit_flags` = 528386, `type_flags` = 138, `mechanic_immune_mask` = 646658835 WHERE `entry` = 38456;
UPDATE `creature_template` SET `modelid1` = 11686, `modelid3` = 11686, `AIName` = 'EventAI' WHERE `entry` = 38879;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=38879);
INSERT INTO `creature_ai_scripts` VALUES  (3887900, 38879, 9, 0, 100, 6, 1, 30, 8000, 10000, 11, 70460, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- OTHER
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128,minlevel=80,maxlevel=80 WHERE `entry`=36672;
UPDATE `creature_template` SET `vehicleId`=533 WHERE `entry`=36619;

-- Empowered Adherent
SET @eAdN := 38136;
SET @eAd1 := 38396;
SET @eAd2 := 38632;
SET @eAd3 := 38633;

-- Reanimated Adherent
SET @rAdN := 38010;
SET @rAd1 := 38397;
SET @rAd2 := 39000;
SET @rAd3 := 39001;

-- Reanimated Fanatic
SET @rFaN := 38009;
SET @rFa1 := 38398;
SET @rFa2 := 38630;
SET @rFa3 := 38631;

-- Deformed Fanatic
SET @dFaN := 38135;
SET @dFa1 := 38395;
SET @dFa2 := 38634;
SET @dFa3 := 38635;

-- Make Lord Marrowgar and Lady Deathwhisper bind players to instance
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x1 WHERE `entry` IN (36612,36855);

-- Add trigger flag
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x80 WHERE `entry`=37948;

-- Fix factions for Lady Deathwhisper adds
UPDATE `creature_template` SET `faction_A`=21, `faction_H`=21 WHERE `entry` IN (@rAdN,@eAdN); -- Adherents
UPDATE `creature_template` SET `faction_A`=21, `faction_H`=21 WHERE `entry` IN (@rFaN,@dFaN); -- Fanatics

-- Difficulty entries
UPDATE `creature_template` SET `difficulty_entry_1`=@rAd1, `difficulty_entry_2`=@rAd2, `difficulty_entry_3`=@rAd3 WHERE `entry`=@rAdN; -- Reanimated Adherent
UPDATE `creature_template` SET `difficulty_entry_1`=@eAd1, `difficulty_entry_2`=@eAd2, `difficulty_entry_3`=@eAd3 WHERE `entry`=@eAdN; -- Empowered Adherent
UPDATE `creature_template` SET `difficulty_entry_1`=@rFa1, `difficulty_entry_2`=@rFa2, `difficulty_entry_3`=@rFa3 WHERE `entry`=@rFaN; -- Reanimated Fanatic
UPDATE `creature_template` SET `difficulty_entry_1`=@dFa1, `difficulty_entry_2`=@dFa2, `difficulty_entry_3`=@dFa3 WHERE `entry`=@dFaN; -- Deformed Fanatic

-- Difficulty templates for Lady Deathwhisper adds
DELETE FROM `creature_template` WHERE `entry` IN (@rAd1,@rAd2,@rAd3,@eAd1,@eAd2,@eAd3,@rFa1,@rFa2,@rFa3,@dFa1,@dFa2,@dFa3);
INSERT INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
(@rAd1,0,0,0,0,0,30966,0,0,0, 'Reanimated Adherent (1)', '', '',0,80,80,2,21,21,0,1,1.14286,1,1,417,582,0,608,7.5,0,0,2,0,8,0,0,0,0,0,341,506,80,6,1032,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,10,1,0,0,0,0,0,0,0,0,1,0,0,0, '',1),
(@rAd2,0,0,0,0,0,30966,0,0,0, 'Reanimated Adherent (2)', '', '',0,80,80,2,21,21,0,1,1.14286,1,1,417,582,0,608,7.5,0,0,2,0,8,0,0,0,0,0,341,506,80,6,1032,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,10,1,0,0,0,0,0,0,0,0,1,0,0,0, '',1),
(@rAd3,0,0,0,0,0,30966,0,0,0, 'Reanimated Adherent (3)', '', '',0,80,80,2,21,21,0,1,1.14286,1,1,417,582,0,608,7.5,0,0,2,0,8,0,0,0,0,0,341,506,80,6,1032,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,10,1,0,0,0,0,0,0,0,0,1,0,0,0, '',1),
(@eAd1,0,0,0,0,0,30965,0,0,0, 'Empowered Adherent (1)', '', '',0,80,80,2,21,21,0,1,1.14286,1,1,417,582,0,608,7.5,0,0,2,0,8,0,0,0,0,0,341,506,80,7,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,10,1,0,0,0,0,0,0,0,0,1,0,0,0, '',1),
(@eAd2,0,0,0,0,0,30965,0,0,0, 'Empowered Adherent (2)', '', '',0,80,80,2,21,21,0,1,1.14286,1,1,417,582,0,608,7.5,0,0,2,0,8,0,0,0,0,0,341,506,80,7,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,10,1,0,0,0,0,0,0,0,0,1,0,0,0, '',1),
(@eAd3,0,0,0,0,0,30965,0,0,0, 'Empowered Adherent (3)', '', '',0,80,80,2,21,21,0,1,1.14286,1,1,417,582,0,608,7.5,0,0,2,0,8,0,0,0,0,0,341,506,80,7,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,10,1,0,0,0,0,0,0,0,0,1,0,0,0, '',1),
(@rFa1,0,0,0,0,0,30968,0,0,0, 'Reanimated Fanatic (1)', 'Cult of the Damned', '',0,80,80,2,21,21,0,1,1.14286,1,1,422,586,0,642,7.5,0,0,1,0,8,0,0,0,0,0,345,509,103,6,1032,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,1,1,0,0,0,0,0,0,0,0,1,0,0,0, '',1),
(@rFa2,0,0,0,0,0,30968,0,0,0, 'Reanimated Fanatic (2)', 'Cult of the Damned', '',0,80,80,2,21,21,0,1,1.14286,1,1,422,586,0,642,7.5,0,0,1,0,8,0,0,0,0,0,345,509,103,6,1032,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,1,1,0,0,0,0,0,0,0,0,1,0,0,0, '',1),
(@rFa3,0,0,0,0,0,30968,0,0,0, 'Reanimated Fanatic (3)', 'Cult of the Damned', '',0,80,80,2,21,21,0,1,1.14286,1,1,422,586,0,642,7.5,0,0,1,0,8,0,0,0,0,0,345,509,103,6,1032,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,1,1,0,0,0,0,0,0,0,0,1,0,0,0, '',1),
(@dFa1,0,0,0,0,0,22124,0,0,0, 'Deformed Fanatic (1)', 'Cult of the Damned', '',0,80,80,2,21,21,0,1,1.14286,1,1,422,586,0,642,7.5,0,0,1,0,8,0,0,0,0,0,345,509,103,6,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,1,1,0,0,0,0,0,0,0,84,1,0,0,0, '',1),
(@dFa2,0,0,0,0,0,22124,0,0,0, 'Deformed Fanatic (2)', 'Cult of the Damned', '',0,80,80,2,21,21,0,1,1.14286,1,1,422,586,0,642,7.5,0,0,1,0,8,0,0,0,0,0,345,509,103,6,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,1,1,0,0,0,0,0,0,0,84,1,0,0,0, '',1),
(@dFa3,0,0,0,0,0,22124,0,0,0, 'Deformed Fanatic (3)', 'Cult of the Damned', '',0,80,80,2,21,21,0,1,1.14286,1,1,422,586,0,642,7.5,0,0,1,0,8,0,0,0,0,0,345,509,103,6,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,1,1,0,0,0,0,0,0,0,84,1,0,0,0, '',1);

-- Unclickable flag for doors
UPDATE `gameobject_template` SET `flags`=`flags`|0x1 WHERE `entry` IN (201910,201911,201857,201563);

-- Achievements
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12775,12775,13393,13393,12962,12962,13394,13394,12770,12771,12772,12773,12945,12946,12947,12948,13039,13040,13041,13042,13050,13051,13052,13053);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(12775,12,0,0), -- Boned (10 player) mode requirement (10N)
(12775,18,0,0), -- Boned (10 player) script requirement
(13393,12,2,0), -- Boned (10 player) mode requirement (10H)
(13393,18,0,0), -- Boned (10 player) script requirement
(12962,12,1,0), -- Boned (25 player) mode requirement (25N)
(12962,18,0,0), -- Boned (25 player) script requirement
(13394,12,3,0), -- Boned (25 player) mode requirement (25H)
(13394,18,0,0), -- Boned (25 player) script requirement
(12770,12,0,0), -- Storming the Citadel (10 player), Lord Marrowgar, mode requirement (10N)
(12771,12,0,0), -- Storming the Citadel (10 player), Claim victory in the Gunship Battle, mode requirement (10N)
(12772,12,0,0), -- Storming the Citadel (10 player), The Deathbringer, mode requirement (10N)
(12773,12,0,0), -- Storming the Citadel (10 player), Lady Deathwhisper, mode requirement (10N)
(12945,12,1,0), -- Storming the Citadel (25 player), Lord Marrowgar, mode requirement (25N)
(12946,12,1,0), -- Storming the Citadel (25 player), The Deathbringer, mode requirement (25N)
(12947,12,1,0), -- Storming the Citadel (25 player), Claim victory in the Gunship Battle, mode requirement (25N)
(12948,12,1,0), -- Storming the Citadel (25 player), Lady Deathwhisper, mode requirement (25N)
(13039,12,2,0), -- Heroic: Storming the Citadel (10 player), Lord Marrowgar, mode requirement (10H)
(13040,12,2,0), -- Heroic: Storming the Citadel (10 player), Lady Deathwhisper, mode requirement (10H)
(13041,12,2,0), -- Heroic: Storming the Citadel (10 player), Claim victory in the Gunship Battle, mode requirement (10H)
(13042,12,2,0), -- Heroic: Storming the Citadel (10 player), The Deathbringer, mode requirement (10H)
(13050,12,3,0), -- Heroic: Storming the Citadel (25 player), Lord Marrowgar, mode requirement (25H)
(13051,12,3,0), -- Heroic: Storming the Citadel (25 player), Lady Deathwhisper, mode requirement (25H)
(13052,12,3,0), -- Heroic: Storming the Citadel (25 player), Claim victory in the Gunship Battle, mode requirement (25H)
(13053,12,3,0); -- Heroic: Storming the Citadel (25 player), The Deathbringer, mode requirement (25H)

UPDATE `creature_template` SET `unit_flags` = 528386, `type_flags` = 138, `mechanic_immune_mask` = 646658835 WHERE `entry` = 38456;
UPDATE `creature_template` SET `modelid1` = 11686, `modelid3` = 11686, `AIName` = 'EventAI' WHERE `entry` = 38879;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=38879);
INSERT INTO `creature_ai_scripts` VALUES 
(3887900, 38879, 9, 0, 100, 6, 1, 30, 8000, 10000, 11, 70460, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `creature_template` SET `spell4` = 34873, `spell5` = 60534 WHERE `entry` = 27258;
DELETE FROM `creature_questrelation` WHERE `quest` = 12779;
DELETE FROM `gameobject_questrelation` WHERE `quest` = 12779;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 12779;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (29110, 12779);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 29110;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (25462, 12779);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 25462;
DELETE FROM `creature_involvedrelation` WHERE `quest` = 12779;
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 12779;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (29110, 12779);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=29110;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (25462, 12779);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=25462;
DELETE FROM `creature` WHERE `id`=25462;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(96146, 25462, 609, 1, 7, 0, 0, 2345.3, -5671.36, 426.03, 3.78, 120, 0, 0, 27890000, 0, 0, 0),
(5683368, 25462, 609, 1, 64, 0, 0, 2310.21, -5741.9, 161.147, 0.561972, 300, 0, 0, 17964000, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=25462;

INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(96146, 25462, 609, 1, 7, 0, 0, 2345.3, -5671.36, 426.03, 3.78, 120, 0, 0, 27890000, 0, 0, 0),
(5683368, 25462, 609, 1, 64, 0, 0, 2310.21, -5741.9, 161.147, 0.561972, 300, 0, 0, 17964000, 0, 0, 0);

# GameObject
UPDATE `gameobject_template` SET `ScriptName` = 'icecrown_teleporter' WHERE `entry` IN (202223,202235,202242,202243,202244,202245,202246);
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` IN (202235,202242,202243,202244,202245,202246);
UPDATE `gameobject_template` SET `flags` = 52 WHERE `entry` = 202223;
-- This game object is handle by core and work nice
-- UPDATE `gameobject_template` SET `ScriptName` = '', `data10` = 70308 WHERE `entry` = 201584;
UPDATE `gameobject` SET `phaseMask` = '1' WHERE `id` IN (202242,202243,202244,202245,202235,202223,202246);

# Other
UPDATE `creature_template` SET `faction_A` = 1802, `faction_H` = 1801, `type_flags` = 67113036 WHERE `entry` IN (36789,10067,10068,10069);
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14 WHERE `entry` IN (37006,37013,37986,38107,38548,36659,37690,37562,38159);
UPDATE `creature_template` SET `vehicleId` = 318 WHERE `entry` IN (36609,10242,10243,10244);
UPDATE `creature_model_info` SET `bounding_radius` = 5,`combat_reach` = 5 WHERE `modelid` = 31119;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 37007;
UPDATE `creature` SET `modelid` = 11686 WHERE `map` = 631 AND `id` IN (SELECT `entry` FROM `creature_template` WHERE `flags_extra` = 128 OR `flags_extra` = 130);
UPDATE `creature_template` SET `flags_extra` = 2, `unit_flags` = `unit_flags`|33554432 WHERE `flags_extra` = 128 OR `flags_extra` = 130 AND `entry` IN (SELECT `id` FROM `creature` WHERE `map` = 631);
UPDATE `creature_template` SET `vehicleid` = 533 WHERE `entry` IN (36619,38233,38459,38460);

# Not attackable and disable move flag
UPDATE `creature_template` SET `unit_flags` = 33555204 WHERE `entry` IN (37986,37824,38234,38317,36659,38548,37186);
UPDATE `creature_template` SET `unit_flags` = 33587972 WHERE `entry` = 37013;

# Instance
UPDATE `instance_template` SET `script`='instance_icecrown_citadel' WHERE `map` = 631;

# Creature loot template

DELETE FROM creature_loot_template WHERE item = 49426 AND entry IN
(SELECT id FROM creature WHERE map = 631);

# Creature addon template

DELETE FROM `creature_addon` WHERE `guid` = 136107;
DELETE FROM `creature_template_addon` WHERE `entry`= 37690;
DELETE FROM `creature_template_addon` WHERE `entry`= 37672;

INSERT INTO creature_addon (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(136107, 0, 0, 0, 1, 0, '18950 0 18950 1 72242 0');

INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(37690, 0, 0, 0, 0, 0, '70345 0  70343 0'),
(37672, 0, 0, 0, 0, 0, '70385 0 70405 0');

#Thanks YTDB

# Conditions

DELETE FROM `conditions` WHERE `SourceEntry` IN (69508,69785,69788,70881,69248,69240,70341,70360,71617);

INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`) VALUES
(13,0,69508,0,18,1,37986,0),
(13,0,70881,0,18,1,37986,0),
(13,0,70360,0,18,1,37690,0);

#creature

DELETE FROM `creature` WHERE `id`=37013;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(48969,37013,631,1,1,11686,0,4291.18,3092.92,372.97,2.33874,300,0,0,25200,0,0,0),
(48971,37013,631,1,1,11686,0,4312.14,3112.98,372.97,2.51327,300,0,0,25200,0,0,0),
(48973,37013,631,1,1,11686,0,4244.04,3092.66,372.97,0.97738,300,0,0,25200,0,0,0),
(48976,37013,631,1,1,11686,0,4223.47,3113.58,372.97,0.76794,300,0,0,25200,0,0,0),
(48981,37013,631,1,1,11686,0,4222.44,3161.69,372.97,5.53269,300,0,0,25200,0,0,0),
(48983,37013,631,1,1,11686,0,4243.89,3181.74,372.97,5.44543,300,0,0,25200,0,0,0),
(48989,37013,631,1,1,11686,0,4312.36,3160.84,372.97,3.80482,300,0,0,25200,0,0,0),
(48990,37013,631,1,1,11686,0,4291.45,3181.25,372.97,4.10152,300,0,0,25200,0,0,0);

#Linked spell

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 72202;



-- 187_world_halls_of_reflection
ALTER TABLE db_version CHANGE COLUMN required_3_world_icecrown_citadel required_187_world_halls_of_reflection bit;
UPDATE `instance_template` SET `script` = 'instance_halls_of_reflection' WHERE map=668;
UPDATE `gameobject_template` SET `faction` = '114' WHERE `entry` IN (197341, 201976);
UPDATE `gameobject_template` SET `faction`='1375' WHERE `entry` IN (197341, 202302, 201385, 201596);

UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRintro' WHERE `entry` IN (37221, 37223);	
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_falric' WHERE `entry` IN (38112);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_marwyn' WHERE `entry` IN (38113);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_lich_king_hr' WHERE `entry` IN (36954);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_hor' WHERE `entry` IN (37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRextro' WHERE `entry` IN (36955, 37554);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_frostworn_general' WHERE `entry`=36723;
update `creature_template` set `AIName`='', `Scriptname`='npc_raging_gnoul' where `entry` in (36940);	
update `creature_template` set `AIName`='', `Scriptname`='npc_risen_witch_doctor' where `entry` in (36941);
update `creature_template` set `AIName`='', `Scriptname`='npc_abon' where `entry` in (37069);

UPDATE `creature_template` SET `speed_walk`='1', `speed_run`='2.0' WHERE `entry` IN (36954, 37226);
UPDATE `creature_template` SET `speed_walk`='2', `speed_run`='2.0' WHERE `entry` IN (36955, 37554);
UPDATE `creature_template` SET `scale`='0.8', `equipment_id`='1221' WHERE `entry` IN (37221, 36955);
UPDATE `creature_template` SET `equipment_id`='1290' WHERE `entry` IN (37223, 37554);
UPDATE `creature_template` SET `equipment_id`='0' WHERE `entry`=36954;
UPDATE `creature_template` SET `scale`='1' WHERE `entry` IN (37223);
UPDATE `creature_template` SET `scale`='0.8' WHERE `entry` IN (36658, 37225, 37223, 37226, 37554);
UPDATE creature_template SET unit_flags = 0, type_flags= 8, dynamicflags = 0, flags_extra = 2 WHERE entry IN (38177, 38176, 38173, 38172, 38567, 38175);

-- conditions
REPLACE INTO `conditions`  VALUES 
(13, 0, 69431, 0, 18, 1, 37496, 0, 0, '', NULL),
(13, 0, 69431, 0, 18, 1, 37497, 0, 0, '', NULL),
(13, 0, 69431, 0, 18, 1, 37584, 0, 0, '', NULL),
(13, 0, 69431, 0, 18, 1, 37587, 0, 0, '', NULL),
(13, 0, 69431, 0, 18, 1, 37588, 0, 0, '', NULL),
(13, 0, 69708, 0, 18, 1, 37226, 0, 0, '', NULL),
(13, 0, 69784, 0, 18, 1, 37014, 0, 0, '', NULL),
(13, 0, 70194, 0, 18, 1, 37226, 0, 0, '', NULL),
(13, 0, 70224, 0, 18, 1, 37014, 0, 0, '', NULL),
(13, 0, 70225, 0, 18, 1, 37014, 0, 0, '', NULL),
(13, 0, 70464, 0, 18, 1, 36881, 0, 0, '', NULL);

REPLACE INTO `creature_equip_template` VALUES ('38112', '50249', '49777', '0'); #Falric
UPDATE `creature_template` SET `equipment_id`='38112' WHERE `entry` IN (38112);

REPLACE INTO `creature_equip_template` VALUES ('38113', '50248', '50248', '0'); #Marwyn
UPDATE `creature_template` SET `equipment_id`='38113' WHERE `entry` IN (38113);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135341, 38112, 668, 3, 1, 0, 0, 5276.81, 2037.45, 709.32, 5.58779, 604800, 0, 0, 377468, 0, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135342, 38113, 668, 3, 1, 0, 0, 5341.72, 1975.74, 709.32, 2.40694, 604800, 0, 0, 539240, 0, 0, 0);

REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (14531739, 201596, 668, 1, 128, 5275.28, 1694.23, 786.147, 0.981225, 0, 0, 0.471166, 0.882044, 25, 0, 1);

DELETE from `creature` WHERE `id`=36955;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135349, 36955, 668, 3, 128, 0, 0, 5547.27, 2256.95, 733.011, 0.835987, 7200, 0, 0, 252000, 881400, 0, 0);

DELETE from `creature` WHERE `id`=37554;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135345, 37554, 668, 3, 64, 0, 0, 5547.27, 2256.95, 733.011, 0.835987, 7200, 0, 0, 252000, 881400, 0, 0);

DELETE from `creature` WHERE `id`=37226;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135344, 37226, 668, 3, 1, 0, 0, 5551.29, 2261.33, 733.012, 4.0452, 604800, 0, 0, 27890000, 0, 0, 0);

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 11686, `modelid3` = 11686, `modelid4` = 11686 WHERE `entry` IN (37014,37704);

DELETE FROM `gameobject` WHERE `id` IN (201385,201596,202079);

UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (197341,197342,197343);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (197341,197342,197343);

-- Captains chest (override)
DELETE FROM `gameobject` WHERE `id` IN (202212,201710,202337,202336);
UPDATE `gameobject_template` SET `flags` = 0 WHERE `gameobject_template`.`entry` IN (202212,201710,202337,202336);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(972561, 202212, 668, 1, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1),
(972562, 201710, 668, 1, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1),
(972563, 202337, 668, 2, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1),
(972564, 202336, 668, 2, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1);
-- Dalaran portal (override)
DELETE FROM `gameobject` WHERE `guid` IN (972565);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(972565, 202079, 668, 3, 65535, 5250.959961, 1639.359985, 784.302, 0, 0, 0, 0, 0, -604800, 100, 1);

REPLACE INTO `script_texts` (`entry`,`content_default`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
# SCENE - Hall Of Reflection (Intro) - PreUther
(-1594433, 'The chill of this place...I can feel my blood freezing!', '', 16631,0,0,1, '67234'),
(-1594434, 'I... I don\'t believe it! Frostmourne stands before us, unguarded! Just as the Gnome claimed. Come, heroes!', '', 17049,0,0,1, '67234'),
(-1594435, 'What is that? Up ahead! Could it be ... ? Heroes at my side!', '', 16632,1,0,1, '67234'),
(-1594436, 'Frostmourne ... The blade that destroyed our kingdom ...', '', 16633,1,0,1, '67234'),
(-1594437, 'Standing this close to the blade that ended my life... The pain... It is renewed.', '', 17050,0,0,1, '67234'),
(-1594438, 'Stand back! Touch that blade and your soul will be scarred for all eternity! I must attempt to commune with the spirits locked away within Frostmourne. Give me space, back up please!', '', 16634,1,0,1, '67234'),
(-1594439, 'I dare not touch it. Stand back! Stand back! As I attempt to commune with the blade. Perhaps our salvation lies within.', '', 17051,1,0,1, '67234'),
# SCENE - Hall Of Reflection (Intro) - UtherDialog
(-1594440, 'Jaina! Could it truly be you?', '', 16666,0,0,1, '67234'),
(-1594441, 'Careful, girl. I\'ve heard talk of that cursed blade saving us before. Look around you and see what has been born of Frostmourne.', '', 16659,0,0,1, '67234'),
(-1594442, 'Uther! Dear Uther! I... I\'m so sorry.', '', 16635,0,0,1, '67234'),
(-1594443, 'Uther...Uther the Lightbringer. How...', '', 17052,0,0,1, '67234'),
(-1594444, 'Jaina, you haven\'t much time. The Lich King sees what the sword sees. He will be here shortly.', '', 16667,0,0,1, '67234'),
(-1594445, 'You haven\'t much time. The Lich King sees what the sword sees. He will be here shortly.', '', 16660,0,0,1, '67234'),
(-1594446, 'Arthas is here? Maybe I...', '', 16636,0,0,1, '67234'),
(-1594447, 'The Lich King is here? Then my destiny shall be fulfilled today!', '', 17053,1,0,1, '67234'),
(-1594448, 'No, girl. Arthas is not here. Arthas is merely a presence within the Lich King\'s mind. A dwindling presence...', '', 16668,0,0,1, '67234'),
(-1594449, 'You cannot defeat the Lich King. Not here. You would be a fool to try. He will kill those who follow you and raise them as powerful servants of the Scourge. But for you, Sylvanas, his reward for you would be worse than the last.', '', 16661,0,0,1, '67234'),
(-1594450, 'But Uther, if there\'s any hope of reaching Arthas. I... I must try.', '', 16637,0,0,1, '67234'),
(-1594451, 'There must be a way...', '', 17054,0,0,1, '67234'),
(-1594452, 'Jaina, listen to me. You must destroy the Lich King. You cannot reason with him. He will kill you and your allies and raise you all as powerful soldiers of the Scourge.', '', 16669,0,0,1, '67234'),
(-1594453, 'Perhaps, but know this: there must always be a Lich King. Even if you were to strike down Arthas, another would have to take his place, for without the control of the Lich King, the Scourge would wash over this world like locusts, destroying all that they touched.', '', 16662,0,0,1, '67234'),
(-1594454, 'Tell me how, Uther? How do I destroy my prince? My...', '', 16638,0,0,1, '67234'),
(-1594455, 'Who could bear such a burden?', '', 17055,0,0,1, '67234'),
(-1594456, 'Snap out of it, girl. You must destroy the Lich King at the place where he merged with Ner\'zhul - atop the spire, at the Frozen Throne. It is the only way!', '', 16670,0,0,1, '67234'),
(-1594457, 'I do not know, Banshee Queen. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.', '', 16663,0,0,1, '67234'),
(-1594458, 'You\'re right, Uther. Forgive me. I... I don\'t know what got a hold of me. We will deliver this information to the King and the knights that battle the Scourge within Icecrown Citadel.', '', 16639,0,0,1, '67234'),
(-1594459, 'There is... something else that you should know about the Lich King. Control over the Scourge must never be lost. Even if you were to strike down the Lich King, another would have to take his place. For without the control of its master, the Scourge would run rampant across the world - destroying all living things.', '', 16671,0,0,1, '67234'),
(-1594460, 'Alas, the only way to defeat the Lich King is to destroy him at the place he was created.', '', 16664,0,0,1, '67234'),
(-1594461, 'Who could bear such a burden?', '', 16640,0,0,1, '67234'),
(-1594462, 'The Frozen Throne...', '', 17056,0,0,1, '67234'),
(-1594463, 'A grand sacrifice by a noble soul...', '', 16672,0,0,1, '67234'),
(-1594464, 'I do not know, Jaina. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.', '', 16673,0,0,1, '67234'),
(-1594465, 'Then maybe there is still hope...', '', 16641,0,0,1, '67234'),
(-1594466, 'No, Jaina! ARRRRRRGHHHH... He... He is coming. You... You must...', '', 16674,1,0,1, '67234'),
(-1594467, 'Aye. ARRRRRRGHHHH... He... He is coming. You... You must...', '', 16665,1,0,1, '67234'),
(-1594468, 'SILENCE, PALADIN!', '', 17225,1,0,0, '67234'),
(-1594469, 'So you wish to commune with the dead? You shall have your wish.', '', 17226,1,0,0, '67234'),
(-1594470, 'Falric. Marwyn. Bring their corpses to my chamber when you are through.', '', 17227,0,0,0, '67234'),
(-1594471, 'You won\'t deny me this, Arthas! I must know... I must find out...', '', 16642,1,0,1, '67234'),
(-1594472, 'You will not escape me that easily, Arthas! I will have my vengeance!', '', 17057,1,0,1, '67234'),
(-1594473, 'Foolish girl, you seek that which I\'ve killed long ago, he is mearly a ghost now, a faith echo in my mind!', '', 17229,1,0,0, '67234'),
(-1594474, 'I will not make the same mistake again, Sylvanaas, this time there will be no escape. You failed to serve me in undeath, now all that remains for you is oblivion...', '', 17228,1,0,0, '67234'),
(-1594475, 'As you wish, my lord.', '', 16717,1,0,0, '67234'),
(-1594476, 'As you wish, my lord.', '', 16741,1,0,0, '67234'),
# SCENE - Hall Of Reflection (Extro) - PreEscape
(-1594477, 'Your allies have arrived, Jaina, just as you promised. You will all become powerful agents of the Scourge.', '', 17212,1,0,0, '67234'),
(-1594478, 'I will not make the same mistake again, Sylvanas. This time there will be no escape. You will all serve me in death!', '', 17213,1,0,0, '67234'),
(-1594479, 'He is too powerful, we must leave this place at once! My magic will hold him in place for only a short time! Come quickly, heroes!', '', 16644,0,0,1, '67234'),
(-1594480, 'He\'s too powerful! Heroes, quickly, come to me! We must leave this place immediately! I will do what I can do hold him in place while we flee.', '', 17058,0,0,1, '67234'),
# SCENE - Hall Of Reflection (Extro) - Escape
(-1594481, 'Death\'s cold embrace awaits.', '', 17221,1,0,0, '67234'),
(-1594482, 'Rise minions, do not let them pass!', '', 17216,1,0,0, '67234'),
(-1594483, 'Minions sees them. Bring their corpses back to me!', '', 17222,1,0,0, '67234'),
(-1594484, 'No...', '', 17214,1,0,0, '67234'),
(-1594485, 'All is lost!', '', 17215,1,0,0, '67234'),
(-1594486, 'There is no escape!', '', 17217,1,0,0, '67234'),
(-1594487, 'I will destroy this barrier. You must hold the undead back!', '', 16607,1,0,0, '67234'),
(-1594488, 'No wall can hold the Banshee Queen! Keep the undead at bay, heroes! I will tear this barrier down!', '', 17029,1,0,0, '67234'),
(-1594489, 'Another ice wall! Keep the undead from interrupting my incantation so that I may bring this wall down!', '', 16608,1,0,0, '67234'),
(-1594490, 'Another barrier? Stand strong, champions! I will bring the wall down!', '', 17030,1,0,0, '67234'),
(-1594491, 'Succumb to the chill of the grave.', '', 17218,1,0,0, '67234'),
(-1594492, 'Another dead end.', '', 17219,1,0,0, '67234'),
(-1594493, 'How long can you fight it?', '', 17220,1,0,0, '67234'),
(-1594494, '<need translate>', '', 16609,0,0,0, '67234'),
(-1594495, 'Your barriers can\'t hold us back much longer, monster. I will shatter them all!', '', 16610,1,0,0, '67234'),
(-1594496, 'I grow tired of these games, Arthas! Your walls can\'t stop me!', '', 17031,1,0,0, '67234'),
(-1594497, 'You won\'t impede our escape, fiend. Keep the undead off me while I bring this barrier down!', '', 17032,1,0,0, '67234'),
(-1594498, 'There\'s an opening up ahead. GO NOW!', '', 16645,1,0,0, '67234'),
(-1594499, 'We\'re almost there... Don\'t give up!', '', 16646,1,0,0, '67234'),
(-1594500, 'There\'s an opening up ahead. GO NOW!', '', 17059,1,0,0, '67234'),
(-1594501, 'We\'re almost there! Don\'t give up!', '', 17060,1,0,0, '67234'),
(-1594502, 'It... It\'s a dead end. We have no choice but to fight. Steel yourself heroes, for this is our last stand!', '', 16647,1,0,0, '67234'),
(-1594503, 'BLASTED DEAD END! So this is how it ends. Prepare yourselves, heroes, for today we make our final stand!', '', 17061,1,0,0, '67234'),
(-1594504, 'Nowhere to run! You\'re mine now...', '', 17223,1,0,0, '67234'),
(-1594505, 'Soldiers of Lordaeron, rise to meet your master\'s call!', '', 16714,1,0,0, '67234'),
(-1594506, 'The master surveyed his kingdom and found it... lacking. His judgement was swift and without mercy. Death to all!', '', 16738,1,0,0, '67234'),

#Falric
(-1594507, 'Men, women and children... None were spared the master\'s wrath. Your death will be no different.', '', 16710,1,0,0, '67234'),
(-1594508, 'Marwyn, finish them...', '', 16713,1,0,0, '67234'),
(-1594509, 'Sniveling maggot!', '', 16711,1,0,0, '67234'),
(-1594510, 'The children of Stratholme fought with more ferocity!', '', 16712,1,0,0, '67234'),
(-1594511, 'Despair... so delicious...', '', 16715,1,0,0, '67234'),
(-1594512, 'Fear... so exhilarating...', '', 16716,1,0,0, '67234'),

#Marwyn
(-1594513, 'Death is all that you will find here!', '', 16734,1,0,0, '67234'),
(-1594514, 'Yes... Run... Run to meet your destiny... Its bitter, cold embrace, awaits you.', '', 16737,1,0,0, '67234'),
(-1594515, 'I saw the same look in his eyes when he died. Terenas could hardly believe it. Hahahaha!', '', 16735,1,0,0, '67234'),
(-1594516, 'Choke on your suffering!', '', 16736,1,0,0, '67234'),
(-1594517, 'Your flesh shall decay before your very eyes!', '', 16739,1,0,0, '67234'),
(-1594518, 'Waste away into nothingness!', '', 16740,1,0,0, '67234'),

#FrostWorn General
(-1594519, 'You are not worthy to face the Lich King!', '', 16921,1,0,0, '67234'),
(-1594520, 'Master, I have failed...', '', 16922,1,0,0, '67234'),

#add
(-1594531, '<need translate>', '', 0,0,0,0, '67234'),
(-1594532, '<need translate>', '', 0,0,0,0, '67234'),
(-1594533, '<need translate>', '', 0,0,0,0, '67234'),
(-1594536, 'Lady Jaina, we are ready for next mission!', '', 0,0,0,0, ''),
(-1594537, 'Lady Jaina, Let\'s go!', '', 0,0,0,0, ''),
(-1594538, 'Lady Sylvanas, we are ready for next mission!', '', 0,0,0,0, ''),
(-1594539, 'Lady Sylvanas, Let\'s go!', '', 0,0,0,0, ''),
(-1594540, 'Let\'s go!', '', 0,0,0,0, '');

-- Waipoints to escort event on Halls of reflection

DELETE FROM script_waypoint WHERE entry=36955;
DELETE FROM script_waypoint WHERE entry=37226;
DELETE FROM script_waypoint WHERE entry=37554;

INSERT INTO script_waypoint VALUES
-- Jaina

   (36955, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (36955, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (36955, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (36955, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'), 
   (36955, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (36955, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (36955, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (36955, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (36955, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (36955, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (36955, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (36955, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (36955, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (36955, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (36955, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (36955, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (36955, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (36955, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (36955, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (36955, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (36955, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (36955, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Sylvana

   (37554, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (37554, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (37554, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (37554, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'), 
   (37554, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (37554, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (37554, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (37554, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (37554, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (37554, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (37554, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (37554, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (37554, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (37554, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (37554, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (37554, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (37554, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (37554, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (37554, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (37554, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (37554, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (37554, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Lich King

   (37226, 0, 5577.187,2236.003,733.012, 0, 'WP1'),
   (37226, 1, 5587.682,2228.586,733.011, 0, 'WP2'),
   (37226, 2, 5600.715,2209.058,731.618, 0, 'WP3'),
   (37226, 3, 5606.417,2193.029,731.129, 0, 'WP4'),
   (37226, 4, 5598.562,2167.806,730.918, 0, 'WP5'), 
   (37226, 5, 5559.218,2106.802,731.229, 0, 'WP6'),
   (37226, 6, 5543.498,2071.234,731.702, 0, 'WP7'),
   (37226, 7, 5528.969,2036.121,731.407, 0, 'WP8'),
   (37226, 8, 5512.045,1996.702,735.122, 0, 'WP9'),
   (37226, 9, 5504.490,1988.789,735.886, 0, 'WP10'),

   (37226, 10, 5489.645,1966.389,737.653, 0, 'WP10'),
   (37226, 11, 5475.517,1943.176,741.146, 0, 'WP11'),
   (37226, 12, 5466.930,1926.049,743.536, 0, 'WP12'),
   (37226, 13, 5445.157,1894.955,748.757, 0, 'WP13'),
   (37226, 14, 5425.907,1869.708,753.237, 0, 'WP14'),
   (37226, 15, 5405.118,1833.937,757.486, 0, 'WP15'),
   (37226, 16, 5370.324,1799.375,761.007, 0, 'WP16'),
   (37226, 17, 5335.422,1766.951,767.635, 0, 'WP17'),
   (37226, 18, 5311.438,1739.390,774.165, 0, 'WP18'),
   (37226, 19, 5283.589,1703.755,784.176, 0, 'WP19'),
   (37226, 20, 5278.694,1697.912,785.692, 0, 'WP20'),
   (37226, 21, 5283.589,1703.755,784.176, 0, 'WP19');
   
   
   
-- 295_world_forge_of_souls
ALTER TABLE db_version CHANGE COLUMN required_187_world_halls_of_reflection required_295_world_forge_of_souls bit;

DELETE FROM `creature` where `id` IN (38161,38160);
-- Lady Sylvanas Windrunner
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `curhealth`) VALUES ('82810', '38161', '632', '3', '64', '5614.04', '2447.03', '705.852', '0.952404', '7200', '5040000');
-- Lady Jaina Proudmoore
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `curhealth`) VALUES ('82809', '38160', '632', '3', '128', '5614.04', '2447.03', '705.852', '0.952404', '7200', '5040000');



-- 423_world_isle_of_conquest
ALTER TABLE db_version CHANGE COLUMN required_295_world_forge_of_souls required_423_world_isle_of_conquest bit;

-- need checkin with entries
-- Isle Of Conquest 
/*
INSERT INTO `trinity_string` VALUES ('752', 'The battle will begin in two minutes!', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('753', 'The battle will begin in one minute!', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('754', 'The battle will begin in 30 seconds!', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('755', 'The battle has begun!', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('756', 'Hangar', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('757', 'Quarry', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('758', 'Refinery', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('759', 'Docks', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('760', 'Workshop', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('761', 'The %s has taken the %s', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('762', 'Horde', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('763', 'Alliance', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('764', '$n claims the %s! If left unchallenged, the %s will control it in 1 minute!', '', null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('765', '$n has defended the %s', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('766', '$n has assaulted the %s', '', '', '', '', '', '', '', '');
*/



-- 424_argent_quests
ALTER TABLE db_version CHANGE COLUMN required_423_world_isle_of_conquest required_424_argent_quests bit;

-- Horde
-- The argent tournament Premier
DELETE FROM `creature_questrelation` WHERE `quest`=13668;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (33817, 13668);
-- Icone monture de la horde
UPDATE `creature_template` SET IconName='vehichleCursor' WHERE entry IN (33842,33796,33798,33791,33792,33799);
-- Vehicule id des monture 
UPDATE `creature_template` SET `VehicleId`=349 WHERE entry IN (33320,33321,33322,33323,33324);
-- Vitesse des montures
UPDATE creature_template SET speed_run = 1.571429 WHERE entry IN (33844, 33320, 33321, 33322, 33323, 33324);
-- Spells des montures
UPDATE `creature_template` SET `spell1`=62544, `spell2`=62575, `spell3`=62960, `spell4`=62552, `spell5`=64077 WHERE `entry` IN (33844, 33320, 33321, 33322, 33323, 33324);
-- Immune to Confuse
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 2 WHERE `entry` IN (33844, 33320, 33321, 33322, 33323, 33324);

-- Ajouts des spellclick_spells pour les montures à l'écurie
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (33842,33796,33798,33791,33792,33799);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
(33842, 63791, 13668, 1, 13680, 1, 0, 0, 0), -- Aspirant
-- Orgrimmar
(33799, 62783, 13726, 0, 0, 1, 0, 0, 0), -- Champion Of Orgrimmar
(33799, 62783, 13691, 0, 0, 1, 0, 0, 0), -- A Valiant Of Orgrimmar
(33799, 62783, 13707, 0, 0, 1, 0, 0, 0), -- Valiant Of Orgrimmar
-- Sen'jin
(33796, 62784, 13727, 0, 0, 1, 0, 0, 0), -- Champion Of Sen'jin
(33796, 62784, 13693, 0, 0, 1, 0, 0, 0), -- A Valiant Of Sen'jin
(33796, 62784, 13708, 0, 0, 1, 0, 0, 0), -- Valiant Of Sen'jin
-- Thunder Bluff
(33792, 62785, 13728, 0, 0, 1, 0, 0, 0), -- Champion Of Thunder Bluff
(33792, 62785, 13694, 0, 0, 1, 0, 0, 0), -- A Valiant Of Thunder Bluff
(33792, 62785, 13709, 0, 0, 1, 0, 0, 0), -- Valiant Of Thunder Bluff
-- Undercity
(33798, 62787, 13729, 0, 0, 1, 0, 0, 0), -- Champion Of Undercity
(33798, 62787, 13695, 0, 0, 1, 0, 0, 0), -- A Valiant Of Undercity
(33798, 62787, 13710, 0, 0, 1, 0, 0, 0), -- Valiant Of Undercity
-- Silvermoon
(33791, 62786, 13731, 0, 0, 1, 0, 0, 0), -- Champion Of Silvermoon
(33791, 62786, 13696, 0, 0, 1, 0, 0, 0), -- A Valiant Of Silvermoon
(33791, 62786, 13711, 0, 0, 1, 0, 0, 0); -- Valiant Of Silvermoon

-- Horde ArgentTournament
	-- Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13668;
UPDATE `quest_template` SET `PrevQuestId`=13668, `NextQuestId`=13678, `ExclusiveGroup`=-13829, `NextQuestInChain`=0 WHERE `entry` IN (13829, 13839, 13838);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13680 WHERE `entry`=13678;
	-- Daily Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestInChain`=0 WHERE `entry`=13673;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestInChain`=0 WHERE `entry`=13675;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestInChain`=0 WHERE `entry`=13674;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13676;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13677;
	-- End Of Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13680;
	-- Valiant Quests
UPDATE `quest_template` SET `PrevQuestId`=13680 WHERE `entry` IN (13691, 13693, 13694, 13695, 13696);

UPDATE `quest_template` SET `RequiredRaces`=2, `NextQuestId`=13697, `NextQuestInChain`=13697, `ExclusiveGroup`=13691 WHERE `entry`=13691;
UPDATE `quest_template` SET `RequiredRaces`=128, `NextQuestId`=13719, `NextQuestInChain`=13719, `ExclusiveGroup`=13693 WHERE `entry`=13693;
UPDATE `quest_template` SET `RequiredRaces`=32, `NextQuestId`=13720, `NextQuestInChain`=13720, `ExclusiveGroup`=13694 WHERE `entry`=13694;
UPDATE `quest_template` SET `RequiredRaces`=16, `NextQuestId`=13721, `NextQuestInChain`=13721, `ExclusiveGroup`=13695 WHERE `entry`=13695;
UPDATE `quest_template` SET `RequiredRaces`=512, `NextQuestId`=13722, `NextQuestInChain`=13722, `ExclusiveGroup`=13696 WHERE `entry`=13696;

-- INFOS DEV -- Premiere Quete (Admissibilité) : 13687 -- Deuxieme Quete (Champion) : 13701
UPDATE `quest_template` SET `PrevQuestId`=13701 WHERE `entry` IN (13707, 13708, 13709, 13710, 13711); -- TOScript into the core (check of 13687)

UPDATE `quest_template` SET `NextQuestId`=13697, `NextQuestInChain`=13697, `ExclusiveGroup`=13691 WHERE `entry`=13707;
UPDATE `quest_template` SET `NextQuestId`=13719, `NextQuestInChain`=13719, `ExclusiveGroup`=13693 WHERE `entry`=13708;
UPDATE `quest_template` SET `NextQuestId`=13720, `NextQuestInChain`=13720, `ExclusiveGroup`=13694 WHERE `entry`=13709;
UPDATE `quest_template` SET `NextQuestId`=13721, `NextQuestInChain`=13721, `ExclusiveGroup`=13695 WHERE `entry`=13710;
UPDATE `quest_template` SET `NextQuestId`=13722, `NextQuestInChain`=13722, `ExclusiveGroup`=13696 WHERE `entry`=13711;

UPDATE `quest_template` SET `PrevQuestId`=0, `ExclusiveGroup`=0 WHERE `entry` IN (13697, 13719, 13720, 13721, 13722);
UPDATE `quest_template` SET `NextQuestId`=13726, `NextQuestInChain`=13726 WHERE `entry`=13697;
UPDATE `quest_template` SET `NextQuestId`=13727, `NextQuestInChain`=13727  WHERE `entry`=13719;
UPDATE `quest_template` SET `NextQuestId`=13728, `NextQuestInChain`=13728  WHERE `entry`=13720;
UPDATE `quest_template` SET `NextQuestId`=13729, `NextQuestInChain`=13729  WHERE `entry`=13721;
UPDATE `quest_template` SET `NextQuestId`=13731, `NextQuestInChain`=13731  WHERE `entry`=13722;
	-- Valiant Daily Quests
		-- A Blade Fit For A Champion
		-- The Edge Of Winter
		-- A Worthy Weapon
UPDATE `quest_template` SET `PrevQuestId`=-13697, `NextQuestId`=0, `ExclusiveGroup`=13762, `NextQuestInChain`=0 WHERE `entry` IN (13762, 13763, 13764);
UPDATE `quest_template` SET `PrevQuestId`=-13719, `NextQuestId`=0, `ExclusiveGroup`=13768, `NextQuestInChain`=0 WHERE `entry` IN (13768, 13769, 13770);
UPDATE `quest_template` SET `PrevQuestId`=-13720, `NextQuestId`=0, `ExclusiveGroup`=13773, `NextQuestInChain`=0 WHERE `entry` IN (13773, 13774, 13775);
UPDATE `quest_template` SET `PrevQuestId`=-13721, `NextQuestId`=0, `ExclusiveGroup`=13778, `NextQuestInChain`=0 WHERE `entry` IN (13778, 13779, 13780);
UPDATE `quest_template` SET `PrevQuestId`=-13722, `NextQuestId`=0, `ExclusiveGroup`=13783, `NextQuestInChain`=0 WHERE `entry` IN (13783, 13784, 13785);
		-- A Valiant's Field Training
		-- The Grand Melee
		-- At The Enemy's Gates
UPDATE `quest_template` SET `PrevQuestId`=-13697, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13765, 13767, 13856);
UPDATE `quest_template` SET `PrevQuestId`=-13719, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13771, 13772, 13857);
UPDATE `quest_template` SET `PrevQuestId`=-13720, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13776, 13777, 13858);
UPDATE `quest_template` SET `PrevQuestId`=-13721, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13781, 13782, 13860);
UPDATE `quest_template` SET `PrevQuestId`=-13722, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13786, 13787, 13859);
	-- End Of Valiant Quests
UPDATE `quest_template` SET `PrevQuestId`=13697, `NextQuestId`=13736, `ExclusiveGroup`=0, `NextQuestInChain`=13736 WHERE `entry`=13726;
UPDATE `quest_template` SET `PrevQuestId`=13719, `NextQuestId`=13737, `ExclusiveGroup`=0, `NextQuestInChain`=13737 WHERE `entry`=13727;
UPDATE `quest_template` SET `PrevQuestId`=13720, `NextQuestId`=13738, `ExclusiveGroup`=0, `NextQuestInChain`=13738 WHERE `entry`=13728;
UPDATE `quest_template` SET `PrevQuestId`=13721, `NextQuestId`=13739, `ExclusiveGroup`=0, `NextQuestInChain`=13739 WHERE `entry`=13729;
UPDATE `quest_template` SET `PrevQuestId`=13722, `NextQuestId`=13740, `ExclusiveGroup`=0, `NextQuestInChain`=13740 WHERE `entry`=13731;
	-- A Champion Rises (Final Quest of a Branch)
UPDATE `quest_template` SET `PrevQuestId`=13726, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13736;
UPDATE `quest_template` SET `PrevQuestId`=13727, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13737;
UPDATE `quest_template` SET `PrevQuestId`=13728, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13738;
UPDATE `quest_template` SET `PrevQuestId`=13729, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13739;
UPDATE `quest_template` SET `PrevQuestId`=13740, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13740;

-- Debug Quest Requirements
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry` IN (13697, 13719, 13720, 13721, 13722);
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry` IN (13726, 13727, 13728, 13729, 13731);
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry` IN (13736, 13737, 13738, 13739, 13740);
	
-- Alliance
-- Premiere quete : Le tournoi d'argent
DELETE FROM `creature_questrelation` WHERE `quest`=13667;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (33817, 13667);
-- Icone monture de la horde
UPDATE `creature_template` SET IconName='vehichleCursor' WHERE `entry` IN (33843,33794,33800,33793,33795,33790);
-- Vehicule id des montures
UPDATE `creature_template` SET `VehicleId`=349 WHERE `entry` IN (33319,33317,33318,33217,33316);
-- Vitesse des montures
UPDATE `creature_template` SET `speed_run`= 1.571429 WHERE `entry` IN (33845, 33319, 33317, 33318, 33217, 33316);
-- Spells des montures
UPDATE `creature_template` SET `spell1`=62544, `spell2`=62575, `spell3`=62960, `spell4`=62552, `spell5`=64077 WHERE `entry` IN (33845, 33319, 33317, 33318, 33217, 33316);
-- Immune to Confuse
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 2 WHERE `entry` IN (33845, 33319, 33317, 33318, 33217, 33316);

-- Ajouts des spellclick_spells pour les montures à l'écurie
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (33843,33800,33795,33790,33793,33794);

INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
(33843, 63792, 13667, 1, 13679, 1, 0, 0, 0), -- Aspirant
-- Darnassus
(33794, 62782, 13725, 0, 0, 1, 0, 0, 0), -- Champion Of Darnassus
(33794, 62782, 13689, 0, 0, 1, 0, 0, 0), -- A Valiant Of Darnassus
(33794, 62782, 13706, 0, 0, 1, 0, 0, 0), -- Valiant Of Darnassus
-- Hurlevent
(33800, 62774, 13699, 0, 0, 1, 0, 0, 0), -- Champion Of Sen'jin
(33800, 62774, 13593, 0, 0, 1, 0, 0, 0), -- A Valiant Of Sen'jin
(33800, 62774, 13684, 0, 0, 1, 0, 0, 0), -- Valiant Of Sen'jin
-- Gnomregan
(33793, 62780, 13723, 0, 0, 1, 0, 0, 0), -- Champion Of Thunder Bluff
(33793, 62780, 13688, 0, 0, 1, 0, 0, 0), -- A Valiant Of Thunder Bluff
(33793, 62780, 13704, 0, 0, 1, 0, 0, 0), -- Valiant Of Thunder Bluff
-- Forgefer
(33795, 62779, 13713, 0, 0, 1, 0, 0, 0), -- Champion Of Forgefer
(33795, 62779, 13685, 0, 0, 1, 0, 0, 0), -- A Valiant Of Undercity
(33795, 62779, 13703, 0, 0, 1, 0, 0, 0), -- Valiant Of Forgefer
-- Exodar
(33790, 62781, 13724, 0, 0, 1, 0, 0, 0), -- Champion Of Exodar
(33790, 62781, 13690, 0, 0, 1, 0, 0, 0), -- A Valiant Of Exodar
(33790, 62781, 13705, 0, 0, 1, 0, 0, 0); -- Valiant Of Exodar


-- Alliance ArgentTournament
	-- Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13667;
UPDATE `quest_template` SET `PrevQuestId`=13667, `NextQuestId`=13672, `ExclusiveGroup`=-13828, `NextQuestInChain`=0 WHERE `entry` IN (13828, 13837, 13835);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13679 WHERE `entry`=13672;
	-- Daily Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestInChain`=0 WHERE `entry`=13666;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestInChain`=0 WHERE `entry`=13670;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestInChain`=0 WHERE `entry`=13669;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13671;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13625;
	-- End Of Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13679;
	-- Valiant Quests
UPDATE `quest_template` SET `PrevQuestId`=13679 WHERE `entry` IN (13684, 13685, 13689, 13688, 13690);

UPDATE `quest_template` SET `RequiredRaces`=1, `NextQuestId`=13718, `NextQuestInChain`=13718, `ExclusiveGroup`=13684 WHERE `entry`=13684;
UPDATE `quest_template` SET `RequiredRaces`=4, `NextQuestId`=13714, `NextQuestInChain`=13714, `ExclusiveGroup`=13685 WHERE `entry`=13685;
UPDATE `quest_template` SET `RequiredRaces`=8, `NextQuestId`=13717, `NextQuestInChain`=13717, `ExclusiveGroup`=13689 WHERE `entry`=13689;
UPDATE `quest_template` SET `RequiredRaces`=64, `NextQuestId`=13715, `NextQuestInChain`=13715, `ExclusiveGroup`=13688 WHERE `entry`=13688;
UPDATE `quest_template` SET `RequiredRaces`=1024, `NextQuestId`=13716, `NextQuestInChain`=13716, `ExclusiveGroup`=13690 WHERE `entry`=13690;

-- INFOS DEV -- Premiere Quete (Admissibilité) : 13686 -- Deuxieme Quete (Champion) : 13700
UPDATE `quest_template` SET `PrevQuestId`=13700 WHERE `entry` IN (13593, 13703, 13706, 13704, 13705); -- TOScript into the core (check of 13686)

UPDATE `quest_template` SET `NextQuestId`=13718, `NextQuestInChain`=13718, `ExclusiveGroup`=13718 WHERE `entry`=13593;
UPDATE `quest_template` SET `NextQuestId`=13714, `NextQuestInChain`=13714, `ExclusiveGroup`=13714 WHERE `entry`=13703;
UPDATE `quest_template` SET `NextQuestId`=13717, `NextQuestInChain`=13717, `ExclusiveGroup`=13717 WHERE `entry`=13706;
UPDATE `quest_template` SET `NextQuestId`=13715, `NextQuestInChain`=13715, `ExclusiveGroup`=13715 WHERE `entry`=13704;
UPDATE `quest_template` SET `NextQuestId`=13716, `NextQuestInChain`=13716, `ExclusiveGroup`=13716 WHERE `entry`=13705;

UPDATE `quest_template` SET `PrevQuestId`=0, `ExclusiveGroup`=0 WHERE `entry` IN (13718, 13714, 13717, 13715, 13716);

UPDATE `quest_template` SET `NextQuestId`=13699, `NextQuestInChain`=13699 WHERE `entry`=13718;
UPDATE `quest_template` SET `NextQuestId`=13713, `NextQuestInChain`=13713  WHERE `entry`=13714;
UPDATE `quest_template` SET `NextQuestId`=13725, `NextQuestInChain`=13725  WHERE `entry`=13717;
UPDATE `quest_template` SET `NextQuestId`=13723, `NextQuestInChain`=13723  WHERE `entry`=13715;
UPDATE `quest_template` SET `NextQuestId`=13724, `NextQuestInChain`=13724  WHERE `entry`=13716;
	-- Valiant Daily Quests
		-- A Blade Fit For A Champion
		-- The Edge Of Winter
		-- A Worthy Weapon
UPDATE `quest_template` SET `PrevQuestId`=-13718, `NextQuestId`=0, `ExclusiveGroup`=13603, `NextQuestInChain`=0 WHERE `entry` IN (13603, 13600, 13616);
UPDATE `quest_template` SET `PrevQuestId`=-13714, `NextQuestId`=0, `ExclusiveGroup`=13741, `NextQuestInChain`=0 WHERE `entry` IN (13741, 13742, 13743);
UPDATE `quest_template` SET `PrevQuestId`=-13717, `NextQuestId`=0, `ExclusiveGroup`=13757, `NextQuestInChain`=0 WHERE `entry` IN (13757, 13758, 13759);
UPDATE `quest_template` SET `PrevQuestId`=-13715, `NextQuestId`=0, `ExclusiveGroup`=13746, `NextQuestInChain`=0 WHERE `entry` IN (13746, 13747, 13748);
UPDATE `quest_template` SET `PrevQuestId`=-13716, `NextQuestId`=0, `ExclusiveGroup`=13752, `NextQuestInChain`=0 WHERE `entry` IN (13752, 13753, 13754);
		-- A Valiant's Field Training
		-- The Grand Melee
		-- At The Enemy's Gates
UPDATE `quest_template` SET `PrevQuestId`=-13718, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13592, 13665, 13847);
UPDATE `quest_template` SET `PrevQuestId`=-13714, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13744, 13745, 13851);
UPDATE `quest_template` SET `PrevQuestId`=-13717, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13760, 13761, 13855);
UPDATE `quest_template` SET `PrevQuestId`=-13715, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13749, 13750, 13852);
UPDATE `quest_template` SET `PrevQuestId`=-13716, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13755, 13756, 13854);
	-- End Of Valiant Quests
UPDATE `quest_template` SET `PrevQuestId`=13718, `NextQuestId`=13702, `ExclusiveGroup`=0, `NextQuestInChain`=13702 WHERE `entry`=13699;
UPDATE `quest_template` SET `PrevQuestId`=13714, `NextQuestId`=13732, `ExclusiveGroup`=0, `NextQuestInChain`=13732 WHERE `entry`=13713;
UPDATE `quest_template` SET `PrevQuestId`=13717, `NextQuestId`=13735, `ExclusiveGroup`=0, `NextQuestInChain`=13735 WHERE `entry`=13725;
UPDATE `quest_template` SET `PrevQuestId`=13715, `NextQuestId`=13733, `ExclusiveGroup`=0, `NextQuestInChain`=13733 WHERE `entry`=13723;
UPDATE `quest_template` SET `PrevQuestId`=13716, `NextQuestId`=13734, `ExclusiveGroup`=0, `NextQuestInChain`=13734 WHERE `entry`=13724;
	-- A Champion Rises (Final Quest of a Branch)
UPDATE `quest_template` SET `PrevQuestId`=13699, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13702;
UPDATE `quest_template` SET `PrevQuestId`=13713, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13732;
UPDATE `quest_template` SET `PrevQuestId`=13725, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13735;
UPDATE `quest_template` SET `PrevQuestId`=13723, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13733;
UPDATE `quest_template` SET `PrevQuestId`=13734, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13734;

-- Debug Quest Requirements
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry` IN (13718, 13714, 13717, 13715, 13716);
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry` IN (13699, 13713, 13725, 13723, 13724);
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry` IN (13702, 13732, 13735, 13733, 13734);


-- Black Night chain
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=13641, `ExclusiveGroup`=13633, `NextQuestInChain`=13641 WHERE `entry` IN (13633, 13634);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13643 WHERE `entry`=13641;
UPDATE `quest_template` SET `PrevQuestId`=13641, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13654 WHERE `entry`=13643;
UPDATE `quest_template` SET `PrevQuestId`=13643, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13663 WHERE `entry`=13654;
UPDATE `quest_template` SET `PrevQuestId`=13654, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13664 WHERE `entry`=13663;
UPDATE `quest_template` SET `PrevQuestId`=13663, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=14016 WHERE `entry`=13664;
UPDATE `quest_template` SET `PrevQuestId`=13664, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=14017 WHERE `entry`=14016;
UPDATE `quest_template` SET `PrevQuestId`=14016, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=14017;

-- Champion Dailies
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13794; -- Eadric the Pure -- Works yet, but might bug with The Scourgebane
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13795; -- The Scourgebane
	-- Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13790; -- Alliance Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13793; -- Alliance DK Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13811; -- Horde Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13814; -- Horde DK Among The Champions
	-- Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13861; -- Alliance Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13864; -- Alliance DK Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13862; -- Horde Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13863; -- Horde DK Battle Before The Citadel
	-- Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13789; -- Alliance Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13791; -- Alliance DK Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13810; -- Horde Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13813; -- Horde DK Taking Battle To The Enemy
	-- Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13682; -- Alliance Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13788; -- Alliance DK Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13809; -- Horde Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13812; -- Horde DK Threat From Above

-- Crusader dailies
	-- Mistcaller Yngvar
	-- Drottinn Hrothgar
	-- Ornolf The Scarred
	-- Deathspeaker Kharos
UPDATE `quest_template` SET `ExclusiveGroup`=14102, `NextQuestId`=0, `NextQuestInChain`=0 WHERE `entry` IN (14102, 14101, 14104, 14105);
	-- The Fate Of The Fallen
	-- Get Kraken!
	-- Identifying the Remains
UPDATE `quest_template` SET `ExclusiveGroup`=14107, `NextQuestId`=0, `NextQuestInChain`=0 WHERE `entry` IN (14107, 14108, 14095);

-- Covenant Quests
UPDATE `quest_template` SET `PrevQuestId`=13700, `RequiredMinRepFaction`=1094, `RequiredMinRepValue`=42000, `NextQuestId`=0, `NextQuestInChain`=0 WHERE `entry` IN (14112, 14076, 14090, 14096, 14152, 14080, 14077, 14074); -- Alliance
UPDATE `quest_template` SET `PrevQuestId`=13701, `RequiredMinRepFaction`=1124, `RequiredMinRepValue`=42000, `NextQuestId`=0, `NextQuestInChain`=0 WHERE `entry` IN (14145, 14092, 14141, 14142, 14136, 14140, 14144, 14143); -- Horde
	-- What Do You Feed A Yeti, Anyway?
	-- Breakfast Of Champions
	-- Gormok Wants His Snobolds
UPDATE `quest_template` SET `ExclusiveGroup`=14112 WHERE `entry` IN (14112, 14145, 14076, 14092, 14090, 14141); -- A1, H1, A2, H2, A3, H3
	-- You've Really Done It This Time, Kul
	--
	-- Rescue At Sea
	-- Stop The Agressors
	-- The Light's Mercy
	-- A Leg Up
UPDATE `quest_template` SET `ExclusiveGroup`=14152 WHERE `entry` IN (14152, 14136, 14080, 14140, 14077, 14144, 14074, 14143); -- A1, H1, A2, H2, A3, H3, A4, H4

-- Champion Marker
UPDATE `quest_template` SET `NextQuestId`=13846, `ExclusiveGroup`=13700 WHERE `entry` IN (13700, 13701); -- Alliance, Horde

-- Contributin' To The Cause
UPDATE `quest_template` SET `RequiredMaxRepFaction`=1106, `RequiredMaxRepValue`=42000 WHERE `entry`=13846;

-- Goblin Dailies Removing
	-- The Blastbolt Brothers
	-- A Chip Off the Ulduar Block
	-- Jack Me Some Lumber
DELETE FROM `creature_questrelation` WHERE `quest` IN (13820, 13681, 13627);

-- DK Quests Restrictions
	-- The Scourgebane
	-- Taking Battle To The Enemy (A, H)
	-- Threat From Above (A, H)
	-- Among the Champions (A, H)
	-- Battle Before The Citadel (A, H)
UPDATE `quest_template` SET `SkillOrClassMask`=-32 WHERE `entry` IN (13795, 13791, 13813, 13788, 13812, 13793, 13814, 13864, 13863);
-- Non DK Quests Restrictions
	-- Eadric The Pure
	-- Taking Battle To The Enemy (A, H)
	-- Threat From Above (A, H)
	-- Among the Champions (A, H)
	-- Battle Before The Citadel (A, H)
UPDATE `quest_template` SET `SkillOrClassMask`=-1503 WHERE `entry` IN (13794, 13788, 13789, 13810, 13682, 13809, 13790, 13811, 13861, 13862);

-- Teleports Locations
DELETE FROM `spell_target_position` WHERE `id` IN (63986,63987);
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(63986,571,8574.87,700.595,547.29,5.48),
(63987,571,8460,700,547.4,3.839);

-- Armor Modificator set to null for Targets
UPDATE `creature_template` SET `Armor_mod`=0 WHERE `entry` IN (33243, 33272, 33229);

-- Debug QuestRelation A2
DELETE FROM `creature_questrelation` WHERE `quest` IN (13828, 13672, 13679, 13684, 13685, 13689, 13688, 13690);
INSERT `creature_questrelation` (`id`, `quest`) VALUES (33625, 13828), (33625, 13672), (33625, 13679), (33625, 13684), (33625, 13685), (33625,13689), (33625, 13688), (33625, 13690);

-- Debug QuestRelation H2
DELETE FROM `creature_questrelation` WHERE `quest` IN (13691, 13693, 13694, 13695, 13696, 13829, 13680, 13678);
INSERT `creature_questrelation` (`id`, `quest`) VALUES (33542, 13691), (33542, 13693), (33542, 13694), (33542, 13695), (33542, 13696), (33542,13829), (33542, 13680), (33542, 13678);

-- frog speed from sniff
UPDATE creature_template SET speed_run = 1 WHERE entry = 33211;
UPDATE creature_template SET speed_walk = 1.6 WHERE entry = 33211;

-- Quest : Le fil de l'hiver
DELETE FROM creature WHERE guid = '336364';
INSERT INTO creature VALUES  (336364,33289,571,1,1,0,0,5136.74,-83.3769,347.326,1.44434,300,0,0,12600,3994,0,0);
DELETE FROM `creature_loot_template` WHERE `entry`=33289 AND `item`=45005;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES (33289, 45005, -100);

-- Quete : Une arme remarquable
DELETE FROM `script_texts` WHERE `entry` IN (-1850000,-1850001,-1850002,-1850003);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc2`,`comment`) VALUES
(0, -1850000, 'Oh, ce sont des jacinthes d\'hiver ? Pour moi ?', 'Oh, ce sont des jacinthes d\'hiver ? Pour moi ?',''),
(0, -1850001, 'On ne m\'avait pas apporté de fleurs ici depuis si longtemps.', 'On ne m\'avait pas apporté de fleurs ici depuis si longtemps.',''),
(0, -1850002, 'Le lac est un endroit bien solitaire depuis quelques années. Les voyageurs n\'y viennent plus, et le mal en a envahi les eaux.', 'Le lac est un endroit bien solitaire depuis quelques années. Les voyageurs n\'y viennent plus, et le mal en a envahi les eaux.',''),
(0, -1850003, 'Votre cadeau révèle une rare bonté, voyageur. Je vous en prie, prenez cette lame en gage de ma gratitude. Il y a bien longtemps, c\'est un autre voyageur qui l\'avait laissée ici, mais je n\'en ai pas l\'utilité.', 'Votre cadeau révèle une rare bonté, voyageur. Je vous en prie, prenez cette lame en gage de ma gratitude. Il y a bien longtemps, c\'est un autre voyageur qui l\'avait laissée ici, mais je n\'en ai pas l\'utilité.','');
DELETE FROM `event_scripts` WHERE `id`=20990;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `x`, `y`, `z`, `o`) VALUES (20990, 0, 10, 33273, 42000, 4602.977, -1600.141, 156.7834, 0.7504916);
DELETE FROM `creature_template_addon` WHERE `entry`=33273;
INSERT INTO `creature_template_addon` (`entry`, `emote`) VALUES (33273, 13); -- 13 = EMOTE_STATE_SIT

-- Quete Entrainement sur le terrain:
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE entry IN (29720,29719,29722);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(NULL, 29720, 571, 1, 1, 0, 0, 8562.48, 2771.93, 759.958, 6.10672, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8584.64, 2760.8, 759.958, 2.59599, 300, 15, 0, 12600, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8617.49, 2735.11, 759.958, 2.32895, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8420.8, 2688.71, 759.957, 1.33806, 300, 15, 0, 12600, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8417.11, 2641.07, 759.957, 1.57604, 300, 15, 0, 12600, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8435.89, 2596.91, 759.957, 2.30577, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8477.25, 2565.16, 759.957, 2.51783, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8522.14, 2556.99, 759.957, 3.11709, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8571.58, 2559.95, 759.957, 4.05564, 300, 0, 0, 12600, 0, 0, 0),
(NULL, 29720, 571, 1, 1, 0, 0, 8609.24, 2589.19, 759.958, 0.155352, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8637.35, 2651.77, 759.958, 4.15303, 300, 15, 0, 12600, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8636.85, 2679.47, 759.958, 4.93842, 300, 15, 0, 12175, 0, 0, 1);

-- Quest : A Worthy Weapon
DELETE FROM `script_texts` WHERE `entry` IN (-1850000,-1850001,-1850002,-1850003);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc2`,`comment`) VALUES
(0, -1850000, 'Oh, these are hyacinths \ winter? For me ?', 'Oh, these are hyacinths \ winter? For me  ?',''),
(0, -1850001, 'We don\'t had not brought flowers here for so long.', 'We don\'t had not brought flowers here for so long.',''),
(0, -1850002, 'The lake is a lonely spot some years. Travelers to come over, and evil has invaded the waters.', 'The lake is a lonely spot some years. Travelers to come over, and evil has invaded the waters.',''),
(0, -1850003, 'Your gift shows a rare kindness, traveler. Please, take this blade as a token of my gratitude. There has long, is another traveler who had left here, but I do not need. ',' Your gift reveals a rare kindness, traveler. Please, take this blade as a token of my gratitude. Long ago, another passenger who had left here, but I have no use.','');
DELETE FROM `event_scripts` WHERE `id`=20990;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `x`, `y`, `z`, `o`) VALUES (20990, 0, 10, 33273, 42000, 4602.977, -1600.141, 156.7834, 0.7504916);

DELETE FROM `creature_template_addon` WHERE `entry`=33273;
INSERT INTO `creature_template_addon` (`entry`, `emote`) VALUES (33273, 13); -- 13 = EMOTE_STATE_SIT


-- Text campioni
-- Quest : A Worthy Weapon
DELETE FROM `script_texts` WHERE `entry` IN (-1850000,-1850001,-1850002,-1850003);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc2`,`comment`) VALUES
(0, -1850004, 'Stand ready !', 'Stand ready !',''),
(0, -1850005, 'Let the battle begins !', 'Let the battle begins !',''),
(0, -1850006, 'Prepare your self !', 'Prepare your self! !',''),
(0, -1850007, 'You think you have the courage in you? Will see.', 'You think you have the courage in you? Will see.',''),
(0, -1850008, 'Impressive demonstration. I think you\re quite able to join the ranks of the valiant.', 'Impressive demonstration. I think you\re quite able to join the ranks of the valiant.',''),
(0, -1850009, 'I\'ve won. You\'ll probably have more luck next time.', 'I\'ve won. You\'ll probably have more luck next time.',''),
(0, -1850010, 'I am defeated. Nice battle !', 'I am defeated. Nice battle !',''),
(0, -1850011, 'It seems that I\'ve underestimated your skills. Well done.', 'It seems that I\'ve underestimated your skills. Well done.',''),
(0, -1850012, 'You\'ll probably have more luck next time.', '','');



-- 436_world_command
ALTER TABLE db_version CHANGE COLUMN required_424_argent_quests required_436_world_command bit;

-- Achievement lookup & add
DELETE FROM command WHERE NAME IN ('lookup achievement', 'achievement add', 'achievement remove');
INSERT INTO command (name, security, help) VALUES
('lookup achievement', 1, 'Syntax: .lookup achievement $achievementname\r\n\r\nLooks up an achievement by $achievementname, and returns all matches with their Achievement ID\'s.');
INSERT INTO command (name, security, help) VALUES
('achievement add', 2, 'Syntax: .achievement add $achievementID\r\n\r\Adds the achievement with selected ID\'s.');
INSERT INTO command (name, security, help) VALUES
('achievement remove', 2, 'Syntax: .achievement remove $achievementID\r\n\r\removes the achievement with selected ID\'s.');



-- 507_world_wintergrasp
ALTER TABLE db_version CHANGE COLUMN required_436_world_command required_507_world_wintergrasp bit;

DELETE FROM `trinity_string` WHERE entry IN (756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,780,781);
INSERT INTO `trinity_string` VALUES ('756', 'Battle begins!', '', '', '', '', '', '', '', 'Áèòâà íà÷àëàñü');
INSERT INTO `trinity_string` VALUES ('757', '%s has successfully defended the fortress!', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('758', '%s has taken over the fortress!', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('759', 'The %s siege workshop has been damaged by the %s!', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('760', 'The %s siege workshop has been destroyed by the %s!', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('761', 'The %s tower has been damaged!', '', '', '', '', '', '', '', '%s áàøíÿ ïîâðåæäåíà');
INSERT INTO `trinity_string` VALUES ('762', 'The %s tower has been destroyed!', '', '', '', '', '', '', '', '%s áàøíÿ óíè÷òîæåíà!');
INSERT INTO `trinity_string` VALUES ('763', 'Wintergrasp fortress is under attack!', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('764', 'Wintergrasp is now under the control of the %s.', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('765', 'Wintergrasp timer set to %s.', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('766', 'Wintergrasp battle started.', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('767', 'Wintergrasp battle finished.', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('768', 'Wintergrasp info: %s controlled. Timer: %s. Wartime: %s. Number of Players: (Horde: %u, Alliance: %u)', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('769', 'Wintergrasp outdoorPvP is disabled.', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('770', 'Wintergrasp outdoorPvP is enabled.', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('771', 'You have reached Rank 1: Corporal', '', '', '', '', '', '', '', 'Âû äîñòèãëè Ðàíãà 1: Êàïðàë');
INSERT INTO `trinity_string` VALUES ('772', 'You have reached Rank 2: First Lieutenant', '', '', '', '', '', '', '', 'Âû äîñòèãëè Ðàíãà 2: Ëåéòåíàíò');
REPLACE INTO `trinity_string` VALUES ('780', 'Before the Battle of  Wintergrasp left 30 minutes!', '', '', '', '', '', '', '', 'Äî áèòâû íà  Îçåðå Ëåäÿíûõ Îêîâ îñòàëîñü 30 ìèíóò!');
REPLACE INTO `trinity_string` VALUES ('781', 'Before the Battle of  Wintergrasp left 10 minutes!', '', '', '', '', '', '', '', 'Äî áèòâû íà  Îçåðå Ëåäÿíûõ Îêîâ îñòàëîñü 10 ìèíóò!');
REPLACE INTO `trinity_string` VALUES ('782', 'The battle for Wintergrasp  has stopped! Not enough defenders. Wintergrasp Fortress remains  Attackers.', '', '', '', '', '', '', '', 'Áèòâà çà Îçåðî Ëåäÿíûõ Îêîâ Îñòàíîâëåíà. Íå õâàòàåò çàùèòíèêîâ. Êðåïîñòü ïåðåõîäèò àòàêóþùåé  ñòîðîíå.');
REPLACE INTO `trinity_string` VALUES ('783', 'The battle for Wintergrasp  has stopped! Not enough attackers. Wintergrasp Fortress remains  Defenders.', '', '', '', '', '', '', '', 'Áèòâà çà Îçåðî Ëåäÿíûõ Îêîâ Îñòàíîâëåíà. Íå õâàòàåò íàïàäàþùèõ. Êðåïîñòü îñòàåòñÿ çàùèòíèêàì.');

DELETE FROM `command` WHERE name IN ('wg','wg enable','wg start','wg status','wg stop','wg switch','wg timer');
INSERT INTO `command` VALUES ('wg', '3', 'Syntax: .wg $subcommand.');
INSERT INTO `command` VALUES ('wg enable', '3', 'Syntax: .wg enable [on/off] Enable/Disable Wintergrasp outdoorPvP.');
INSERT INTO `command` VALUES ('wg start', '3', 'Syntax: .wg start\r\nForce Wintergrasp battle start.');
INSERT INTO `command` VALUES ('wg status', '3', 'Syntax: .wg status\r\nWintergrasp info, defender, timer, wartime.');
INSERT INTO `command` VALUES ('wg stop', '3', 'Syntax: .wg stop\r\nForce Wintergrasp battle stop (No rewards).');
INSERT INTO `command` VALUES ('wg switch', '3', 'Syntax: .wg switch\r\nSwitchs Wintergrasp defender team.');
INSERT INTO `command` VALUES ('wg timer', '3', 'Syntax: .wg timer $minutes\r\nChange the current timer. Min value = 1, Max value 60 (Wartime), 1440 (Not Wartime)');

/* Temp removed gameobject stopping you getting to the relic
* 60070 - [Wintergrasp Keep Collision Wall X:5396.209961 Y:2840.010010 Z:432.268005 MapId:571
* 60476 - [Doodad_WG_Keep_Door01_collision01 X:5397.109863 Y:2841.540039 Z:425.901001 MapId:571]*/
DELETE FROM gameobject WHERE id IN ('194323', '194162');

/*Defender's Portal Activate Proper Spell*/
REPLACE INTO `spell_linked_spell` VALUES ('54640','54643','0','Defender\'s Portal Activate Proper Spell');

/* Teleport WG SPELLs*/
REPLACE INTO `spell_target_position` VALUES ('59096', '571', '4561.58', '2835.33', '389.79', '0.34');
REPLACE INTO `spell_target_position` VALUES ('60035', '571', '5325.06', '2843.36', '409.285', '3.20278');



-- 525_world_spell_scripts
ALTER TABLE db_version CHANGE COLUMN required_507_world_wintergrasp required_525_world_spell_scripts bit;

DELETE FROM `spell_scripts` WHERE id IN (44997,45030,49625,49634,53343,53341);
INSERT INTO `spell_scripts`(`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES 
(44997,0,0,15,45009,1,1,0,0,0,0), -- Converting Sentry
(45030,1,0,15,45088,1,1,0,0,0,0), -- Impale Emissary
(49625,0,0,15,43106,1,1,0,0,0,0), -- Brave's Flare
(49634,0,0,15,43068,1,1,0,0,0,0), -- Sergeant's Flare
(53343,1,0,15,54586,1,1,0,0,0,0), -- Rune of Razorice
(53341,1,0,15,54586,1,1,0,0,0,0); -- Rune of Cinderglacier



-- 704_world_pool_quest
ALTER TABLE db_version CHANGE COLUMN required_525_world_spell_scripts required_704_world_pool_quest bit;

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



-- 813_world_player_factionchange
-- All information for 9784 (rev. 2f4c54a93b).
-- RoCore rev. 813
-- world_player_factionchange_tc9784
DROP TABLE IF EXISTS `player_factionchange_achievement`;
CREATE TABLE `player_factionchange_achievement` (
 `alliance_id` int(8) NOT NULL,
 `horde_id` int(8) NOT NULL,
 PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `player_factionchange_items`;
CREATE TABLE `player_factionchange_items` (
 `race_A` int(8) NOT NULL,
 `alliance_id` int(8) NOT NULL,
 `commentA` text,
 `race_H` int(8) NOT NULL,
 `horde_id` int(8) NOT NULL,
 `commentH` text,
PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `player_factionchange_reputations`;
CREATE TABLE `player_factionchange_reputations` (
 `alliance_id` int(8) NOT NULL,
 `horde_id` int(8) NOT NULL,
 PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `player_factionchange_spells`;
CREATE TABLE `player_factionchange_spells` (
 `alliance_id` int(8) NOT NULL,
 `horde_id` int(8) NOT NULL,
 PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- data for wolrd_plater_factionchange_tc9784
INSERT INTO `player_factionchange_achievement` (`alliance_id`, `horde_id`) VALUES
('33','1358'),
('34','1356'),
('37','1357'),
('203','1251'),
('604','603'),
('610','615'),
('611','616'),
('612','617'),
('613','618'),
('614','619'),
('701','700'),
('707','708'),
('709','708'),
('711','710'),
('713','712'),
('873','220'),
('899','901'),
('942','943'),
('1012','1011'),
('1028','1031'),
('1029','1032'),
('1030','1033'),
('1034','1036'),
('1151','224'),
('1189','1271'),
('1191','1272'),
('1192','1273'),
('1225','259'),
('1279','1280'),
('1676','1677'),
('1678','1680'),
('1686','1685'),
('2421','2420'),
('3556','3557');

INSERT INTO `player_factionchange_reputations` (`alliance_id`, `horde_id`) VALUES
('47','530'),
('54','81'),
('69','68'),
('72','76'),
('509','510'),
('730','729'),
('890','899'),
('930','911'),
('946','947'),
('978','941'),
('1037','1052'),
('1050','1085'),
('1068','1064'),
('1126','1067');

INSERT INTO `player_factionchange_spells` (`alliance_id`, `horde_id`) values
('458','6654'),
('470','64658'),
('472','580'),
('3561','3567'),
('3562','3563'),
('6648','6653'),
('6777','8395'),
('6898','10796'),
('6899','10799'),
('8394','64977'),
('10059','11417'),
('10789','17464'),
('10793','17463'),
('10873','64657'),
('10969','18990'),
('11416','11418'),
('11419','11420'),
('13819','34769'),
('15779','18992'),
('16082','16080'),
('16083','16081'),
('17229','64659'),
('17453','18989'),
('17459','18991'),
('17460','17450'),
('17461','16084'),
('22717','22724'),
('22719','22718'),
('22720','22721'),
('22723','22722'),
('23214','34767'),
('23219','23246'),
('23221','66846'),
('23222','23247'),
('23225','23249'),
('23227','23251'),
('23228','23252'),
('23229','23250'),
('23238','23243'),
('23239','23241'),
('23240','23242'),
('23338','17465'),
('23510','23509'),
('31801','53736'),
('32182','2825'),
('32235','32245'),
('32239','32243'),
('32240','32244'),
('32242','32296'),
('32266','32267'),
('32271','32272'),
('32289','32246'),
('32290','32295'),
('32292','32297'),
('33690','35715'),
('33691','35717'),
('34406','35022'),
('35710','35020'),
('35711','34795'),
('35712','35027'),
('35713','35025'),
('35714','33660'),
('48027','35028'),
('49359','49358'),
('49360','49361'),
('60424','55531'),
('61229','61230'),
('62609','62746'),
('63232','63640'),
('63636','63635'),
('63637','63643'),
('63638','63641'),
('63639','63642'),
('65637','65639'),
('65638','65645'),
('65640','65646'),
('65642','65641'),
('65643','65644'),
('66087','66088'),
('66090','66091'),
('66847','17462'),
('68057','68056'),
('68187','68188');

INSERT IGNORE INTO `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) VALUES
('0','15196','Private''s Tabard','0','15197','Scout''s Tabard'),
('0','19032','Stormpike Battle Tabard','0','19031','Frostwolf Battle Tabard'),
('0','19506','Silverwing Battle Tabard','0','19505','Warsong Battle Tabard'),
('0','20132','Arathor Battle Tabard','0','20131','Battle Tabard of the Defilers'),
('0','23999','Honor Hold Tabard','0','24004','Thrallmar Tabard'),
('0','28234','Medallion of the Alliance(115)','0','28240','Medallion of the Horde(115)'),
('0','28235','Medallion of the Alliance(115)','0','28241','Medallion of the Horde(115)'),
('0','28236','Medallion of the Alliance(115)','0','28242','Medallion of the Horde(115)'),
('0','28237','Medallion of the Alliance(115)','0','28243','Medallion of the Horde(115)'),
('0','28238','Medallion of the Alliance(115)','0','28239','Medallion of the Horde(115)'),
('0','28379','Sergeant''s Heavy Cape(123)','0','28378','Sergeant''s Heavy Cape(123)'),
('0','28380','Sergeant''s Heavy Cloak(123)','0','28377','Sergeant''s Heavy Cloak(123)'),
('0','28952','Grand Marshal''s Quickblade(115)','0','28926','High Warlord''s Quickblade(115)'),
('0','28954','Grand Marshal''s Shanker(115)','0','28929','High Warlord''s Shanker(115)'),
('0','28955','Grand Marshal''s Shiv(115)','0','28930','High Warlord''s Shiv(115)'),
('0','29136','Far Seer''s Helm(115)','0','29135','Earthcaller''s Headdress(115)'),
('0','29140','Cloak of the Ancient Spirits(115)','0','29139','Ceremonial Cover(115)'),
('0','29142','Kurenai Kilt(115)','0','29141','Tempest Leggings(115)'),
('0','29144','Worg Hide Quiver(109)','0','29143','Clefthoof Hide Quiver(109)'),
('0','29146','Band of Elemental Spirits(115)','0','29145','Band of Ancestral Spirits(115)'),
('0','29148','Blackened Leather Spaulders(115)','0','29147','Talbuk Hide Spaulders(115)'),
('0','29153','Blade of the Archmage(100)','0','29155','Stormcaller(100)'),
('0','29166','Hellforged Halberd(115)','0','29167','Blackened Spear(115)'),
('0','29169','Ring of Convalescence(115)','0','29168','Ancestral Band(115)'),
('0','30348','Medallion of the Alliance(115)','0','30343','Medallion of the Horde(115)'),
('0','30349','Medallion of the Alliance(115)','0','30346','Medallion of the Horde(115)'),
('0','30350','Medallion of the Alliance(115)','0','30344','Medallion of the Horde(115)'),
('0','30351','Medallion of the Alliance(115)','0','30345','Medallion of the Horde(115)'),
('0','30597','Halaani Claymore(114)','0','30570','Arkadian Claymore(114)'),
('0','30599','Avenging Blades(108)','0','30568','The Sharp Cookie(108)'),
('0','31774','Kurenai Tabard','0','31773','Mag''har Tabard'),
('0','37864','Medallion of the Alliance(128)','0','37865','Medallion of the Horde(128)'),
('0','38453','Shield of the Lion-hearted(166)','0','38452','Bulwark of the Warchief(166)'),
('0','38455','Hammer of the Alliance Vanguard(166)','0','38454','Warsong Punisher(166)'),
('0','38459','Orb of the Eastern Kingdoms(166)','0','38458','Darkspear Orb(166)'),
('0','38463','Lordaeron''s Resolve(166)','0','38462','Warsong Stormshield(166)'),
('0','38465','Vanguard Soldier''s Dagger(166)','0','38461','Warsong Shanker(166)'),
('0','38589','Medallion of the Alliance(115)','0','38588','Medallion of the Horde(115)'),
('0','42123','Medallion of the Alliance(200)','0','42122','Medallion of the Horde(200)'),
('0','42124','Medallion of the Alliance(226)','0','42126','Medallion of the Horde(226)'),
('0','44413','Mekgineer''s Chopper','0','41508','Mechano-hog'),
('0','45011','Stormwind Banner','0','45014','Orgrimmar Banner'),
('0','45018','Ironforge Banner','0','45015','Sen''jin Banner'),
('0','45019','Gnomeregan Banner','0','45013','Thunder Bluff Banner'),
('0','45020','Exodar Banner','0','45017','Silvermoon City Banner'),
('0','45021','Darnassus Banner','0','45016','Undercity Banner'),
('0','45074','Claymore of the Prophet(200)','0','45205','Greatsword of the Sin''dorei(200)'),
('0','45075','Ironforge Smasher(200)','0','45203','Grimhorn Crusher(200)'),
('0','45076','Teldrassil Protector(200)','0','45204','Axe of the Sen''jin Protector(200)'),
('0','45077','Dagger of the Rising Moon(200)','0','45222','Spinal Destroyer(200)'),
('0','45078','Dagger of Lunar Purity(200)','0','45214','Scalpel of the Royal Apothecary(200)'),
('0','45128','Silvery Sylvan Stave(200)','0','45212','Staff of Feral Furies(200)'),
('0','45129','Gnomeregan Bonechopper(200)','0','45208','Blade of the Keening Banshee(200)'),
('0','45130','Blunderbuss of Khaz Modan(200)','0','45210','Sen''jin Beakblade Longrifle(200)'),
('0','45131','Jouster''s Fury(200)','0','45219','Jouster''s Fury(200)'),
('0','45152','Pendant of Azure Dreams(200)','0','45223','Razor''s Edge Pendant(200)'),
('0','45153','Susurrating Shell Necklace(200)','0','45206','Choker of Feral Fury(200)'),
('0','45154','Necklace of Valiant Blood(200)','0','45213','Pendant of Emerald Crusader(200)'),
('0','45155','Choker of Spiral Focus(200)','0','45207','Necklace of Stolen Skulls(200)'),
('0','45156','Sash of Shattering Hearts(200)','0','45209','Sash of Trumpted Pride(200)'),
('0','45159','Treads of Nimble Evasion(200)','0','45220','Treads of the Earnest Squire(200)'),
('0','45160','Girdle of Valorous Defeat(200)','0','45217','Clinch of Savage Fury(200)'),
('0','45163','Stanchions of Unseatable Furor(200)','0','45218','Blood-Caked Stompers(200)'),
('0','45181','Wrap of the Everliving Tree(200)','0','45211','Waistguard of Equine Fury(200)'),
('0','45182','Gauntlets of Shattered Pride(200)','0','45216','Gauntlets of Mending Touch(200)'),
('0','45183','Treads of the Glorious Spirit(200)','0','45221','Treads of Whispering Dreams(200)'),
('0','45184','Cinch of Bonded Servitude(200)','0','45215','Links of Unquenched Savagery(200)'),
('0','45574','Stormwind Tabard','0','45581','Orgrimmar Tabard'),
('0','45577','Ironforge Tabard','0','45582','Sen''jin Tabard'),
('0','45578','Gnomeregan Tabard','0','45584','Thunder Bluff Tabard'),
('0','45579','Darnassus Tabard','0','45583','Undercity Tabard'),
('0','45580','Exodar Tabard','0','45585','Silvermoon City Tabard'),
('0','46817','Silver Covenant Tabard','0','46818','Sunreaver Tabard'),
('0','46958','Steel Bladebreaker(245)','0','47255','Stygian Bladebreaker(245)'),
('0','46959','Band of the Violent Temperment(245)','0','47252','Ring of the Violent Temperament(245)'),
('0','46960','Breastplate of Cruel Intent(245)','0','47251','Cuirass of Cruel Intent(245)'),
('0','46961','Boneshatter Armplates(245)','0','47253','Boneshatter Vambraces(245)'),
('0','46962','Chestplate of the Towering Monstrosity(245)','0','47254','Hauberk of the Towering Monstrosity(245)'),
('0','46963','Crystal Plated Vanguard(245)','0','47260','Forlorn Barrier(245)'),
('0','46964','Crystal Plated Vanguard(258)','0','47421','Forlorn Barrier(258)'),
('0','46965','Breastplate of Cruel Intent(258)','0','47412','Cuirass of Cruel Intent(258)'),
('0','46966','Band of the Violent Temperment(258)','0','47413','Ring of the Violent Temperament(258)'),
('0','46967','Boneshatter Armplates(258)','0','47414','Boneshatter Vambraces(258)'),
('0','46968','Chestplate of the Towering Monstrosity(258)','0','47415','Hauberk of the Towering Monstrosity(258)'),
('0','46969','Steel Bladebreaker(258)','0','47416','Stygian Bladebreaker(258)'),
('0','46970','Drape of the Untamed Predator(245)','0','47257','Cloak of the Untamed Predator(245)'),
('0','46971','Drape of the Untamed Predator(258)','0','47418','Cloak of the Untamed Predator(258)'),
('0','46972','Cord of the Tenebrous Mist(245)','0','47258','Belt of the Tenebrous Mist(245)'),
('0','46973','Cord of the Tenebrous Mist(258)','0','47419','Belt of the Tenebrous Mist(258)'),
('0','46974','Leggings of the Broken Beast(245)','0','47259','Legwraps of the Broken Beast(245)'),
('0','46975','Leggings of the Broken Beast(258)','0','47420','Legwraps of the Broken Beast(258)'),
('0','46976','Shawl of the Refreshing Winds(245)','0','47256','Drape of the Refreshing Winds(245)'),
('0','46977','Shawl of the Refreshing Winds(258)','0','47417','Drape of the Refreshing Winds(258)'),
('0','46979','Blade of Tarasque(245)','0','47261','Barb of Tarasque(245)'),
('0','46980','Blade of Tarasque(258)','0','47422','Barb of Tarasque(258)'),
('0','46985','Boots of the Courageous(245)','0','47263','Sabatons of the Courageous(245)'),
('0','46986','Boots of the Courageous(258)','0','47424','Sabatons of the Courageous(258)'),
('0','46988','Boots of the Unrelenting Storm(245)','0','47262','Boots of the Harsh Winter(245)'),
('0','46989','Boots of the Unrelenting Storm(258)','0','47423','Boots of the Harsh Winter(258)'),
('0','46990','Belt of the Ice Burrower(245)','0','47265','Binding of the Ice Burrower(245)'),
('0','46991','Belt of the Ice Burrower(258)','0','47426','Binding of the Ice Burrower(258)'),
('0','46992','Flowing Vestments of Ascent(245)','0','47264','Flowing Robes of Ascent(245)'),
('0','46993','Flowing Vestments of Ascent(258)','0','47425','Flowing Robes of Ascent(258)'),
('0','46994','Talonstrike(245)','0','47267','Death''s Head Crossbow(245)'),
('0','46995','Talonstrike(258)','0','47428','Death''s Head Crossbow(258)'),
('0','46996','Lionhead Slasher(245)','0','47266','Blood Fury(245)'),
('0','46997','Dawnbreaker Greaves(245)','0','47269','Dawnbreaker Sabatons(245)'),
('0','46999','Bloodbath Belt(245)','0','47268','Bloodbath Girdle(245)'),
('0','47000','Cuirass of Calamitous Fate(245)','0','47270','Vest of Calamitous Fate(245)'),
('0','47001','Lionhead Slasher(258)','0','47427','Blood Fury(258)'),
('0','47002','Bloodbath Belt(258)','0','47429','Bloodbath Girdle(258)'),
('0','47004','Cuirass of Calamitous Fate(258)','0','47431','Vest of Calamitous Fate(258)'),
('0','47041','Solace of the Defeated(245)','0','47271','Solace of the Fallen(245)'),
('0','47042','Pride of the Eredar(245)','0','47275','Pride of the Demon Lord(245)'),
('0','47043','Charge of the Demon Lord(245)','0','47272','Charge of the Eredar(245)'),
('0','47051','Leggings of the Soothing Touch(245)','0','47274','Pants of the Soothing Touch(245)'),
('0','47052','Legguards of Feverish Dedication(245)','0','47273','Legplates of Feverish Dedication(245)'),
('0','47053','Symbol of Transgression(245)','0','47276','Talisman of Heedless Sins(245)'),
('0','47054','Band of Deplorable Violence(245)','0','47327','Lurid Manifestation(245)'),
('0','47055','Bracers of the Autumn Willow(245)','0','47277','Bindings of the Autumn Willow(245)'),
('0','47056','Bracers of Cloudy Omen(245)','0','47280','Legplates of Feverish Dedication(245)'),
('0','47057','Legplates of Failing Light(245)','0','47279','Leggings of Failing Light(245)'),
('0','47059','Solace of the Defeated(258)','0','47432','Solace of the Fallen(258)'),
('0','47060','Charge of the Demon Lord(258)','0','47433','Charge of the Eredar(258)'),
('0','47061','Legguards of Feverish Dedication(258)','0','47434','Legplates of Feverish Dedication(258)'),
('0','47062','Leggings of the Soothing Touch(258)','0','47435','Pants of the Soothing Touch(258)'),
('0','47063','Pride of the Eredar(258)','0','47436','Pride of the Demon Lord(258)'),
('0','47064','Symbol of Transgression(258)','0','47437','Talisman of Heedless Sins(258)'),
('0','47066','Bracers of the Autumn Willow(258)','0','47438','Bindings of the Autumn Willow(258)'),
('0','47067','Legplates of Failing Light(258)','0','47440','Leggings of Failing Light(258)'),
('0','47068','Bracers of Cloudy Omen(258)','0','47441','Wristwraps of Cloudy Omen(258)'),
('0','47069','Justicebringer(245)','0','47285','Dual-blade Butcher(245)'),
('0','47070','Ring of Callous Aggression(245)','0','47282','Band of Callous Aggression(245)'),
('0','47071','Treads of the Icewalker(245)','0','47284','Icewalker Treads(245)'),
('0','47072','Girdle of Bloodied Scars(245)','0','47283','Belt of Bloodied Scars(245)'),
('0','47073','Bracers of the Untold Massacre(245)','0','47281','Bracers of the Silent Massacre(245)'),
('0','47074','Bracers of the Untold Massacre(258)','0','47442','Bracers of the Silent Massacre(258)'),
('0','47075','Ring of Callous Aggression(258)','0','47443','Band of Callous Aggression(258)'),
('0','47076','Girdle of Bloodied Scars(258)','0','47444','Belt of Bloodied Scars(258)'),
('0','47077','Treads of the Icewalker(258)','0','47445','Icewalker Treads(258)'),
('0','47078','Justicebringer(258)','0','47446','Dual-blade Butcher(258)'),
('0','47079','Bastion of Purity(245)','0','47287','Bastion of Resolve(245)'),
('0','47080','Satrina''s Impeding Scarab(245)','0','47290','Juggernaut''s Vitality(245)'),
('0','47081','Cord of Biting Cold(245)','0','47286','Belt of Biting Cold(245)'),
('0','47082','Chestplate of the Frostborn Hero(245)','0','47288','Chestplate of the Frostwolf Hero(245)'),
('0','47083','Legguards of Concealed Hatred(245)','0','47289','Leggings of Concealed Hatred(245)'),
('0','47084','Cord of Biting Cold(258)','0','47447','Belt of Biting Cold(258)'),
('0','47085','Bastion of Purity(258)','0','47448','Bastion of Resolve(258)'),
('0','47086','Chestplate of the Frostborn Hero(258)','0','47449','Chestplate of the Frostwolf Hero(258)'),
('0','47087','Legguards of Concealed Hatred(258)','0','47450','Leggings of Concealed Hatred(258)'),
('0','47088','Satrina''s Impeding Scarab(258)','0','47451','Juggernaut''s Vitality(258)'),
('0','47089','Cloak of Displacement(245)','0','47291','Shroud of Displacement(245)'),
('0','47090','Boots of Tremoring Earth(245)','0','47295','Sabatons of Tremoring Earth(245)'),
('0','47092','Boots of the Mourning Widow(245)','0','47293','Sandals of the Mourning Widow(245)'),
('0','47093','Vambraces of the Broken Bond(245)','0','47294','Bracers of the Broken Bond(245)'),
('0','47094','Vestments of the Shattered Fellowship(245)','0','47292','Robes of the Shattered Fellowship(245)'),
('0','47095','Cloak of Displacement(258)','0','47452','Shroud of Displacement(258)'),
('0','47096','Vestments of the Shattered Fellowship(258)','0','47453','Robes of the Shattered Fellowship(258)'),
('0','47097','Boots of the Mourning Widow(258)','0','47454','Sandals of the Mourning Widow(258)'),
('0','47098','Vambraces of the Broken Bond(258)','0','47455','Bracers of the Broken Bond(258)'),
('0','47099','Boots of Tremoring Earth(258)','0','47456','Sabatons of Tremoring Earth(258)'),
('0','47104','Twin Spike(245)','0','47300','Gouge of the Frigid Heart(245)'),
('0','47105','The Executioner''s Malice(245)','0','47297','The Executioner''s Vice(245)'),
('0','47106','Sabatons of Ruthless Judgment(245)','0','47296','Greaves of Ruthless Judgment(245)'),
('0','47107','Belt of the Merciless Killer(245)','0','47299','Belt of the Pitiless Killer(245)'),
('0','47108','Bracers of the Shieldmaiden(245)','0','47298','Armguards of the Shieldmaiden(245)'),
('0','47109','Sabatons of Ruthless Judgment(258)','0','47457','Greaves of Ruthless Judgment(258)'),
('0','47110','The Executioner''s Malice(258)','0','47458','The Executioner''s Vice(258)'),
('0','47111','Bracers of the Shieldmaiden(258)','0','47459','Armguards of the Shieldmaiden(258)'),
('0','47112','Belt of the Merciless Killer(258)','0','47460','Belt of the Pitiless Killer(258)'),
('0','47113','Twin Spike(258)','0','47461','Gouge of the Frigid Heart(258)'),
('0','47114','Lupine Longstaff(245)','0','47302','Twin''s Pact(245)'),
('0','47115','Death''s Verdict(245)','0','47303','Death''s Choice(245)'),
('0','47116','The Arbiter''s Muse(245)','0','47305','Legionnaire''s Gorget(245)'),
('0','47121','Legguards of Ascension(245)','0','47304','Legplates of Ascension(245)'),
('0','47126','Skyweaver Robes(245)','0','47301','Skyweaver Vestments(245)'),
('0','47129','Skyweaver Robes(258)','0','47462','Skyweaver Vestments(258)'),
('0','47130','Lupine Longstaff(258)','0','47463','Twin''s Pact(258)'),
('0','47131','Death''s Verdict(258)','0','47464','Death''s Choice(258)'),
('0','47132','Legguards of Ascension(258)','0','47465','Legplates of Ascension(258)'),
('0','47133','The Arbiter''s Muse(258)','0','47466','Legionnaire''s Gorget(258)'),
('0','47138','Chalice of Searing Light(245)','0','47309','Mystifying Charm(245)'),
('0','47139','Wail of the Valkyr(245)','0','47307','Cry of the Valkyr(245)'),
('0','47140','Cord of Pale Thorns(245)','0','47308','Belt of Pale Thorns(245)'),
('0','47141','Bindings of Dark Essence(245)','0','47306','Dark Essence Bindings(245)'),
('0','47142','Breastplate of the Frozen Lake(245)','0','47310','Chestplate of the Frozen Lake(245)'),
('0','47143','Bindings of Dark Essence(258)','0','47467','Dark Essence Bindings(258)'),
('0','47144','Wail of the Val''kyr(258)','0','47468','Cry of the Val''kyr(258)'),
('0','47145','Cord of Pale Thorns(258)','0','47469','Belt of Pale Thorns(258)'),
('0','47146','Chalice of Searing Light(258)','0','47470','Mystifying Charm(258)'),
('0','47147','Breastplate of the Frozen Lake(258)','0','47471','Chestplate of the Frozen Lake(258)'),
('0','47148','Stormpike Cleaver(245)','0','47314','Hellscream Slicer(245)'),
('0','47149','Signet of the Traitor King(245)','0','47315','Band of the Traitor King(245)'),
('0','47150','Greaves of the 7th Legion(245)','0','47312','Greaves of the Saronite Citadel(245)'),
('0','47151','Bracers of Dark Determination(245)','0','47313','Armbands of Dark Determination(245)'),
('0','47152','Belt of Deathly Dominion(245)','0','47311','Waistguard of Deathly Dominion(245)'),
('0','47153','Belt of Deathly Dominion(258)','0','47472','Waistguard of Deathly Dominion(258)'),
('0','47154','Greaves of the 7th Legion(258)','0','47473','Greaves of the Saronite Citadel(258)'),
('0','47155','Bracers of Dark Determination(258)','0','47474','Armbands of Dark Determination(258)'),
('0','47156','Stormpike Cleaver(258)','0','47475','Hellscream Slicer(258)'),
('0','47157','Signet of the Traitor King(258)','0','47476','Band of the Traitor King(258)'),
('0','47182','Reign of the Unliving(245)','0','47316','Reign of the Dead(245)'),
('0','47183','Strength of the Nerub(245)','0','47320','Might of the Nerub(245)'),
('0','47184','Legguards of the Lurking Threat(245)','0','47319','Leggings of the Lurking Threat(245)'),
('0','47186','Legwraps of the Awakening(245)','0','47318','Leggings of the Awakening(245)'),
('0','47187','Leggings of the Deepening Void(245)','0','47317','Breeches of the Deepening Void(245)'),
('0','47188','Reign of the Unliving(258)','0','47477','Reign of the Dead(258)'),
('0','47189','Leggings of the Deepening Void(258)','0','47478','Breeches of the Deepening Void(258)'),
('0','47190','Legwraps of the Awakening(258)','0','47479','Leggings of the Awakening(258)'),
('0','47191','Legguards of the Lurking Threat(258)','0','47480','Leggings of the Lurking Threat(258)'),
('0','47192','Strength of the Nerub(258)','0','47481','Might of the Nerub(258)'),
('0','47193','Misery''s End(245)','0','47322','Suffering''s End(245)'),
('0','47194','Footpads of the Icy Floe(245)','0','47321','Boots of the Icy Floe(245)'),
('0','47195','Belt of the Forgotten Martyr(245)','0','47323','Girdle of the Forgotten Martyr(245)'),
('0','47203','Armbands of the Ashen Saint(245)','0','47324','Bindings of the Ashen Saint(245)'),
('0','47204','Chestguard of Flowing Elements(245)','0','47325','Cuirass of Flowing Elements(245)'),
('0','47205','Footpads of the Icy Floe(258)','0','47482','Boots of the Icy Floe(258)'),
('0','47206','Misery''s End(258)','0','47483','Suffering''s End(258)'),
('0','47207','Belt of the Forgotten Martyr(258)','0','47484','Girdle of the Forgotten Martyr(258)'),
('0','47208','Armbands of the Ashen Saint(258)','0','47485','Bindings of the Ashen Saint(258)'),
('0','47209','Chestguard of Flowing Elements(258)','0','47486','Cuirass of Flowing Elements(258)'),
('0','47223','Ring of the Darkmender(245)','0','47278','Circle of the Darkmender(245)'),
('0','47224','Ring of the Darkmender(258)','0','47439','Circle of the Darkmender(258)'),
('0','47225','Maiden''s Favor(245)','0','47328','Maiden''s Adoration(245)'),
('0','47233','Archon Glaive(245)','0','47329','Hellion Glaive(245)'),
('0','47234','Gloves of Bitter Reprisal(245)','0','47330','Gauntlets of Bitter Reprisal(245)'),
('0','47235','Gloves of the Lifeless Touch(245)','0','47326','Handwraps of the Lifeless Touch(245)'),
('0','47236','Gloves of the Lifeless Touch(258)','0','47487','Handwraps of the Lifeless Touch(258)'),
('0','47237','Band of Deplorable Violence(258)','0','47489','Lurid Manifestation(258)'),
('0','47238','Maiden''s Favor(258)','0','47490','Maiden''s Adoration(258)'),
('0','47239','Archon Glaive(258)','0','47491','Hellion Glaive(258)'),
('0','47240','Gloves of Bitter Reprisal(258)','0','47492','Gauntlets of Bitter Reprisal(258)'),
('0','47506','Silverwing Defender(258)','0','47513','Orgrim''s Deflector(258)'),
('0','47515','Decimation(258)','0','47516','Fleshrender(258)'),
('0','47517','Blade of the Unbroken Covenant(258)','0','47518','Mortalis(258)'),
('0','47519','Catastrophe(258)','0','47520','Grievance(258)'),
('0','47521','BRK-1000(258)','0','47523','Fezzik''s Autocannon(258)'),
('0','47524','Clemency(258)','0','47525','Sufferance(258)'),
('0','47526','Remorseless(258)','0','47528','Cudgel of the Damned(258)'),
('0','47545','Vereesa''s Dexterity(272)','0','47546','Sylvanas'' Cunning(272)'),
('0','47547','Varian''s Furor(272)','0','47548','Garrosh''s Rage(272)'),
('0','47549','Magni''s Resolution(272)','0','47550','Cairne''s Endurance(272)'),
('0','47552','Jaina''s Radiance(272)','0','47551','Aethas'' Intensity(272)'),
('0','47553','Bolvar''s Devotion(272)','0','47554','Lady Liadrin''s Conviction(272)'),
('0','47570','Saronite Swordbreakers(245)','0','47571','Saronite Swordbreakers(245)'),
('0','47572','Titanium Spikeguards(245)','0','47573','Titanium Spikeguards(245)'),
('0','47574','Sunforged Bracers(245)','0','47575','Sunforged Bracers(245)'),
('0','47576','Crusader''s Dragonscale Bracers(245)','0','47577','Crusader''s Dragonscale Bracers(245)'),
('0','47578','Carnivorous Band(232)','0','47854','Gormok''s Band(232)'),
('0','47579','Black Chitin Bracers(245)','0','47580','Black Chitin Bracers(245)'),
('0','47581','Bracers of Swift Death(245)','0','47582','Bracers of Swift Death(245)'),
('0','47583','Moonshadow Armguards(245)','0','47584','Moonshadow Armguards(245)'),
('0','47585','Bejeweled Wizard''s Bracers(245)','0','47586','Bejeweled Wizard''s Bracers(245)'),
('0','47587','Royal Moonshroud Bracers(245)','0','47588','Royal Moonshroud Bracers(245)'),
('0','47589','Titanium Razorplate(245)','0','47590','Titanium Razorplate(245)'),
('0','47591','Breastplate of the White Knight(245)','0','47592','Breastplate of the White Knight(245)'),
('0','47593','Sunforged Breastplate(245)','0','47594','Sunforged Breastplate(245)'),
('0','47595','Crusader''s Dragonscale Breastplate(245)','0','47596','Crusader''s Dragonscale Breastplate(245)'),
('0','47597','Ensorcelled Nerubian Breastplate(245)','0','47598','Ensorcelled Nerubian Breastplate(245)'),
('0','47599','Knightbane Carapace(245)','0','47600','Knightbane Carapace(245)'),
('0','47602','Lunar Eclipse Chestguard(245)','0','47601','Lunar Eclipse Chestguard(245)'),
('0','47603','Merlin''s Robe(245)','0','47604','Merlin''s Robe(245)'),
('0','47605','Royal Moonshroud Robe(245)','0','47606','Royal Moonshroud Robe(245)'),
('0','47607','Collar of Ceaseless Torment(232)','0','47849','Collar of Unending Torment(232)'),
('0','47608','Acidmaw Boots(232)','0','47853','Acidmaw Treads(232)'),
('0','47609','Gauntlets of Rising Anger(232)','0','47851','Gauntlets of Mounting Anger(232)'),
('0','47610','Armbands of the Northern Stalker(232)','0','47850','Bracers of the Northern Stalker(232)'),
('0','47611','Dreadscale Armguards(232)','0','47852','Dreadscale Bracers(232)'),
('0','47612','Rod of Imprisoned Souls(232)','0','47856','Scepter of Imprisoned Souls(232)'),
('0','47613','Shoulderpads of the Glacial Wilds(232)','0','47857','Pauldrons of the Glacial Wilds(232)'),
('0','47614','Girdle of the Impaler(232)','0','47859','Belt of the Impaler(232)'),
('0','47615','Belt of the Frozen Reach(232)','0','47858','Girdle of the Frozen Reach(232)'),
('0','47616','Shoulderguards of the Spirit Walker(232)','0','47860','Pauldrons of the Spirit Walker(232)'),
('0','47617','Icehowl Cinch(232)','0','47855','Icehowl Binding(232)'),
('0','47618','Firestorm Ring(232)','0','47862','Firestorm Band(232)'),
('0','47619','Amulet of Binding Elements(232)','0','47864','Pendant of Binding Elements(232)'),
('0','47620','Leggings of the Demonic Messenger(232)','0','47865','Legwraps of the Demonic Messenger(232)'),
('0','47621','Girdle of the Farseer(232)','0','47866','Darkspear Ritual Binding(232)'),
('0','47622','Plans: Breastplate of the White Knight(85)','0','47640','Plans: Breastplate of the White Knight(85)'),
('0','47623','Plans: Saronite Swordbreakers(85)','0','47641','Plans: Saronite Swordbreakers(85)'),
('0','47624','Plans: Titanium Razorplate(85)','0','47644','Plans: Titanium Razorplate(85)'),
('0','47625','Plans: Titanium Spikeguards(85)','0','47645','Plans: Titanium Spikeguards(85)'),
('0','47626','Plans: Sunforged Breastplate(85)','0','47643','Plans: Sunforged Breastplate(85)'),
('0','47627','Plans: Sunforged Bracers(85)','0','47642','Plans: Sunforged Bracers(85)'),
('0','47628','Pattern: Ensorcelled Nerubian Breastplate(85)','0','47650','Pattern: Ensorcelled Nerubian Breastplate(85)'),
('0','47629','Pattern: Black Chitin Bracers(85)','0','47646','Pattern: Black Chitin Bracers(85)'),
('0','47630','Pattern: Crusader''s Dragonscale Breastplate(85)','0','47649','Pattern: Crusader''s Dragonscale Breastplate(85)'),
('0','47631','Pattern: Crusader''s Dragonscale Bracers(85)','0','47648','Pattern: Crusader''s Dragonscale Bracers(85)'),
('0','47632','Pattern: Lunar Eclipse Chestguard(85)','0','47652','Pattern: Lunar Eclipse Chestguard(85)'),
('0','47633','Pattern: Moonshadow Armguards(85)','0','47653','Pattern: Moonshadow Armguards(85)'),
('0','47634','Pattern: Knightbane Carapace(85)','0','47651','Pattern: Knightbane Carapace(85)'),
('0','47635','Pattern: Bracers of Swift Death(85)','0','47647','Pattern: Bracers of Swift Death(85)'),
('0','47654','Pattern: Bejeweled Wizard''s Bracers(85)','0','47639','Pattern: Bejeweled Wizard''s Bracers(85)'),
('0','47655','Pattern: Merlin''s Robe(85)','0','47638','Pattern: Merlin''s Robe(85)'),
('0','47656','Pattern: Royal Moonshroud Bracers(85)','0','47637','Pattern: Royal Moonshroud Bracers(85)'),
('0','47657','Pattern: Royal Moonshroud Robe(85)','0','47636','Pattern: Royal Moonshroud Robe(85)'),
('0','47663','Felspark Bindings(232)','0','47861','Felspark Bracers(232)'),
('0','47669','Belt of the Winter Solstice(232)','0','47863','Belt of the Bloodhoof Emissary(232)'),
('0','47674','Helm of Thunderous Rampage(245)','0','47675','Faceplate of Thunderous Rampage(245)'),
('0','47676','Dirk of the Night Watch(232)','0','47871','Orcish Deathblade(232)'),
('0','47677','Faceplate of the Honorbound(245)','0','47678','Headplate of the Honorbound(245)'),
('0','47679','Endurance of the Infernal(232)','0','47872','Fortitude of the Infernal(232)'),
('0','47680','Armguards of the Nether Lord(232)','0','47869','Armplates of the Nether Lord(232)'),
('0','47681','Heaume of the Restless Watch(245)','0','47682','Helm of the Restless Watch(245)'),
('0','47683','Sentinel Scouting Greaves(232)','0','47867','Warsong Poacher''s Greaves(232)'),
('0','47685','Helm of the Brooding Dragon(245)','0','47684','Coif of the Brooding Dragon(245)'),
('0','47686','Helm of Inner Warmth(245)','0','47687','Headguard of Inner Warmth(245)'),
('0','47689','Hood of Lethal Intent(245)','0','47688','Mask of Lethal Intent(245)'),
('0','47690','Helm of Abundant Growth(245)','0','47691','Mask of Abundant Growth(245)'),
('0','47693','Hood of Fiery Aftermath(245)','0','47692','Hood of Smoldering Aftermath(245)'),
('0','47694','Helm of Clouded Sight(245)','0','47695','Hood of Clouded Sight(245)'),
('0','47697','Pauldrons of Trembling Rage(245)','0','47696','Shoulderplates of Trembling Rage(245)'),
('0','47698','Shoulderplates of Enduring Order(245)','0','47699','Shoulderguards of Enduring Order(245)'),
('0','47700','Loop of the Twin Valkyr(232)','0','47888','Band of the Twin Val''kyr(232)'),
('0','47702','Pauldrons of the Cavalier(245)','0','47701','Shoulderplates of the Cavalier(245)'),
('0','47703','Planestalker Signet(232)','0','47868','Planestalker Band(232)'),
('0','47704','Epaulets of the Devourer(245)','0','47705','Pauldrons of the Devourer(245)'),
('0','47707','Mantle of the Groundbreaker(245)','0','47706','Shoulders of the Groundbreaker(245)'),
('0','47708','Duskstalker Shoulderpads(245)','0','47709','Duskstalker Pauldrons(245)'),
('0','47712','Shoulders of the Fateful Accord(245)','0','47710','Epaulets of the Fateful Accord(245)'),
('0','47713','Mantle of Catastrophic Emanation(245)','0','47714','Pauldrons of Catastrophic Emanation(245)'),
('0','47715','Pauldrons of Revered Mortality(245)','0','47716','Mantle of Revered Mortality(245)'),
('0','47717','Faceplate of the Silver Champion(232)','0','47876','Sunreaver Champion''s Faceplate(232)'),
('0','47718','Helm of the Silver Ranger(232)','0','47875','Sunreaver Ranger''s Helm(232)'),
('0','47719','Gloves of the Silver Assassin(232)','0','47878','Sunreaver Assassin''s Gloves(232)'),
('0','47720','Pauldrons of the Silver Defender(232)','0','47877','Sunreaver Defender''s Pauldrons(232)'),
('0','47721','Sandals of the Silver Magus(232)','0','47873','Sunreaver Magus'' Sandals(232)'),
('0','47724','Blade of the Silver Disciple(232)','0','47874','Sunreaver Disciple''s Blade(232)'),
('0','47725','Victor''s Call(232)','0','47881','Vengeance of the Forsaken(232)'),
('0','47726','Talisman of Volatile Power(232)','0','47879','Fetish of Volatile Power(232)'),
('0','47727','Fervor of the Frostborn(232)','0','47882','Eitrigg''s Oath(232)'),
('0','47728','Binding Light(232)','0','47880','Binding Stone(232)'),
('0','47736','Icefall Blade(232)','0','47886','Nemesis Blade(232)'),
('0','47737','Reckoning(232)','0','47884','Edge of Agony(232)'),
('0','47738','Sabatons of the Lingering Vortex(232)','0','47885','Greaves of the Lingering Vortex(232)'),
('0','47739','Armor of Shifting Shadows(232)','0','47887','Vest of Shifting Shadows(232)'),
('0','47740','The Diplomat(232)','0','47883','Widebarrel Flintlock(232)'),
('0','47741','Baelgun''s Heavy Crossbow(232)','0','47907','Darkmaw Crossbow(232)'),
('0','47742','Chalice of Benedictus(232)','0','47913','Lightbane Focus(232)'),
('0','47743','Enlightenment(232)','0','47892','Illumination(232)'),
('0','47744','Gloves of the Azure Prophet(232)','0','47893','Sen''jin Ritualist Gloves(232)'),
('0','47745','Gloves of Looming Shadow(232)','0','47889','Looming Shadow Wraps(232)'),
('0','47746','Helm of the Snowy Grotto(232)','0','47891','Helm of the High Mesa(232)'),
('0','47747','Darkbane Pendant(232)','0','47890','Darkbane Amulet(232)'),
('0','47748','Khadgar''s Hood of Conquest','0','47774','Sunstrider''s Hood of Conquest'),
('0','47749','Khadgar''s Robe of Conquest','0','47776','Sunstrider''s Robe of Conquest'),
('0','47750','Khadgar''s Leggings of Conquest','0','47775','Sunstrider''s Leggings of Conquest'),
('0','47751','Khadgar''s Shoulderpads of Conquest','0','47777','Sunstrider''s Shoulderpads of Conquest'),
('0','47752','Khadgar''s Gauntlets of Conquest','0','47773','Sunstrider''s Gauntlets of Conquest'),
('0','47753','Khadgar''s Gauntlets of Triumph','0','47772','Sunstrider''s Gauntlets of Triumph'),
('0','47754','Khadgar''s Hood of Triumph','0','47771','Sunstrider''s Hood of Triumph'),
('0','47755','Khadgar''s Leggings of Triumph','0','47770','Sunstrider''s Leggings of Triumph'),
('0','47756','Khadgar''s Robe of Triumph','0','47769','Sunstrider''s Robe of Triumph'),
('0','47757','Khadgar''s Shoulderpads of Triumph','0','47768','Sunstrider''s Shoulderpads of Triumph'),
('0','47758','Khadgar''s Shoulderpads of Triumph','0','47767','Sunstrider''s Shoulderpads of Triumph'),
('0','47759','Khadgar''s Robe of Triumph','0','47766','Sunstrider''s Robe of Triumph'),
('0','47760','Khadgar''s Leggings of Triumph','0','47765','Sunstrider''s Leggings of Triumph'),
('0','47761','Khadgar''s Hood of Triumph','0','47764','Sunstrider''s Hood of Triumph'),
('0','47762','Khadgar''s Gauntlets of Triumph','0','47763','Sunstrider''s Gauntlets of Triumph'),
('0','47778','Kel''Thuzad''s Hood of Triumph','0','47804','Gul''dan''s Hood of Triumph'),
('0','47779','Kel''Thuzad''s Robe of Triumph','0','47806','Gul''dan''s Robe of Triumph'),
('0','47780','Kel''Thuzad''s Leggings of Triumph','0','47805','Gul''dan''s Leggings of Triumph'),
('0','47781','Kel''Thuzad''s Shoulderpads of Triumph','0','47807','Gul''dan''s Shoulderpads of Triumph'),
('0','47782','Kel''Thuzad''s Gloves of Triumph','0','47803','Gul''dan''s Gloves of Triumph'),
('0','47783','Kel''Thuzad''s Gloves of Conquest','0','47802','Gul''dan''s Gloves of Conquest'),
('0','47784','Kel''Thuzad''s Hood of Conquest','0','47801','Gul''dan''s Hood of Conquest'),
('0','47785','Kel''Thuzad''s Leggings of Conquest','0','47800','Gul''dan''s Leggings of Conquest'),
('0','47786','Kel''Thuzad''s Robe of Conquest','0','47799','Gul''dan''s Robe of Conquest'),
('0','47787','Kel''Thuzad''s Shoulderpads of Conquest','0','47798','Gul''dan''s Shoulderpads of Conquest'),
('0','47788','Kel''Thuzad''s Gloves of Triumph','0','47797','Gul''dan''s Gloves of Triumph'),
('0','47789','Kel''Thuzad''s Hood of Triumph','0','47796','Gul''dan''s Hood of Triumph'),
('0','47790','Kel''Thuzad''s Leggings of Triumph','0','47795','Gul''dan''s Leggings of Triumph'),
('0','47791','Kel''Thuzad''s Robe of Triumph','0','47794','Gul''dan''s Robe of Triumph'),
('0','47792','Kel''Thuzad''s Shoulderpads of Triumph','0','47793','Gul''dan''s Shoulderpads of Triumph'),
('0','47808','The Lion''s Maw(232)','0','47898','Frostblade Hatchet(232)'),
('0','47809','Argent Resolve(232)','0','47894','Mace of the Earthborn Chieftain(232)'),
('0','47810','Crusader''s Glory(232)','0','47899','Ardent Guard(232)'),
('0','47811','Chestguard of the Warden(232)','0','47896','Stoneskin Chestplate(232)'),
('0','47812','Vigilant Ward(232)','0','47895','Pride of the Kor''kron(232)'),
('0','47813','Helmet of the Crypt Lord(232)','0','47897','Helm of the Crypt Lord(232)'),
('0','47814','Westfall Saber(232)','0','47903','Forsaken Bonecarver(232)'),
('0','47815','Cold Convergence(232)','0','47900','Perdition(232)'),
('0','47816','The Grinder(232)','0','47905','Blackhorn Bludgeon(232)'),
('0','47829','Pauldrons of the Timeless Hunter(232)','0','47901','Pauldrons of the Shadow Hunter(232)'),
('0','47830','Legplates of the Silver Hand(232)','0','47902','Legplates of Redeemed Blood(232)'),
('0','47832','Spaulders of the Snow Bandit(232)','0','47904','Shoulderpads of the Snow Bandit(232)'),
('0','47834','Fordragon Blades(232)','0','47911','Anguish(232)'),
('0','47835','Bulwark of the Royal Guard(232)','0','47910','Aegis of the Coliseum(232)'),
('0','47836','Legplates of the Immortal Spider(232)','0','47908','Sunwalker Legguards(232)'),
('0','47837','Cinch of the Undying(232)','0','47909','Belt of the Eternal(232)'),
('0','47838','Vestments of the Sleepless(232)','0','47906','Robes of the Sleepless(232)'),
('0','47914','Velen''s Cowl of Conquest','0','48068','Zabra''s Cowl of Conquest'),
('0','47915','Collar of Ceaseless Torment(245)','0','47988','Collar of Unending Torment(245)'),
('0','47916','Armbands of the Northern Stalker(245)','0','47989','Bracers of the Northern Stalker(245)'),
('0','47917','Gauntlets of Rising Anger(245)','0','47990','Gauntlets of Mounting Anger(245)'),
('0','47918','Dreadscale Armguards(245)','0','47991','Dreadscale Bracers(245)'),
('0','47919','Acidmaw Boots(245)','0','47992','Acidmaw Treads(245)'),
('0','47920','Gormok''s Band(245)','0','47993','Carnivorous Band(245)'),
('0','47921','Icehowl Cinch(245)','0','47994','Icehowl Binding(245)'),
('0','47922','Rod of Imprisoned Souls(245)','0','47995','Scepter of Imprisoned Souls(245)'),
('0','47923','Shoulderpads of the Glacial Wilds(245)','0','47996','Pauldrons of the Glacial Wilds(245)'),
('0','47924','Belt of the Frozen Reach(245)','0','47997','Girdle of the Frozen Reach(245)'),
('0','47925','Girdle of the Impaler(245)','0','47998','Belt of the Impaler(245)'),
('0','47926','Shoulderguards of the Spirit Walker(245)','0','47999','Pauldrons of the Spirit Walker(245)'),
('0','47927','Felspark Bindings(245)','0','48000','Felspark Bracers(245)'),
('0','47928','Firestorm Ring(245)','0','48001','Firestorm Band(245)'),
('0','47929','Belt of the Winter Solstice(245)','0','48002','Belt of the Bloodhoof Emissary(245)'),
('0','47930','Amulet of Binding Elements(245)','0','48003','Pendant of Binding Elements(245)'),
('0','47931','Leggings of the Demonic Messenger(245)','0','48004','Legwraps of the Demonic Messenger(245)'),
('0','47932','Girdle of the Farseer(245)','0','48005','Darkspear Ritual Binding(245)'),
('0','47933','Sentinel Scouting Greaves(245)','0','48006','Warsong Poacher''s Greaves(245)'),
('0','47934','Planestalker Signet(245)','0','48007','Planestalker Band(245)'),
('0','47935','Armguards of the Nether Lord(245)','0','48008','Armplates of the Nether Lord(245)'),
('0','47936','Velen''s Robe of Conquest','0','48070','Zabra''s Robe of Conquest'),
('0','47938','Dirk of the Night Watch(245)','0','48010','Orcish Deathblade(245)'),
('0','47939','Endurance of the Infernal(245)','0','48011','Fortitude of the Infernal(245)'),
('0','47940','Sandals of the Silver Magus(245)','0','48012','Sunreaver Magus'' Sandals(245)'),
('0','47941','Blade of the Silver Disciple(245)','0','48013','Sunreaver Disciple''s Blade(245)'),
('0','47942','Helm of the Silver Ranger(245)','0','48014','Sunreaver Ranger''s Helm(245)'),
('0','47943','Faceplate of the Silver Champion(245)','0','48015','Sunreaver Champion''s Faceplate(245)'),
('0','47944','Pauldrons of the Silver Defender(245)','0','48016','Sunreaver Defender''s Pauldrons(245)'),
('0','47945','Gloves of the Silver Assassin(245)','0','48017','Sunreaver Assassin''s Gloves(245)'),
('0','47946','Talisman of Volatile Power(245)','0','48018','Fetish of Volatile Power(245)'),
('0','47947','Binding Light(245)','0','48019','Binding Stone(245)'),
('0','47948','Victor''s Call(245)','0','48020','Vengeance of the Forsaken(245)'),
('0','47949','Fervor of the Frostborn(245)','0','48021','Eitrigg''s Oath(245)'),
('0','47950','The Diplomat(245)','0','48022','Widebarrel Flintlock(245)'),
('0','47951','Reckoning(245)','0','48023','Edge of Agony(245)'),
('0','47952','Sabatons of the Lingering Vortex(245)','0','48024','Greaves of the Lingering Vortex(245)'),
('0','47953','Icefall Blade(245)','0','48025','Nemesis Blade(245)'),
('0','47954','Armor of Shifting Shadows(245)','0','48026','Vest of Shifting Shadows(245)'),
('0','47955','Loop of the Twin Val''kyr(245)','0','48027','Band of the Twin Val''kyr(245)'),
('0','47956','Gloves of Looming Shadow(245)','0','48028','Looming Shadow Wraps(245)'),
('0','47957','Darkbane Pendant(245)','0','48030','Darkbane Amulet(245)'),
('0','47958','Chalice of Benedictus(245)','0','48032','Lightbane Focus(245)'),
('0','47959','Helm of the Snowy Grotto(245)','0','48034','Helm of the High Mesa(245)'),
('0','47960','Enlightenment(245)','0','48036','Illumination(245)'),
('0','47961','Gloves of the Azure Prophet(245)','0','48038','Sen''jin Ritualist Gloves(245)'),
('0','47962','Argent Resolve(245)','0','48039','Mace of the Earthborn Chieftain(245)'),
('0','47963','Vigilant Ward(245)','0','48040','Pride of the Kor''kron(245)'),
('0','47964','Chestguard of the Warden(245)','0','48041','Stoneskin Chestplate(245)'),
('0','47965','Headpiece of the Crypt Lord(245)','0','48042','Helm of the Crypt Lord(245)'),
('0','47966','The Lion''s Maw(245)','0','48043','Frostblade Hatchet(245)'),
('0','47967','Crusader''s Glory(245)','0','48044','Ardent Guard(245)'),
('0','47968','Cold Convergence(245)','0','48045','Perdition(245)'),
('0','47969','Pauldrons of the Timeless Hunter(245)','0','48046','Pauldrons of the Shadow Hunter(245)'),
('0','47970','Legplates of the Silver Hand(245)','0','48047','Legplates of the Redeemed Blood Knight(245)'),
('0','47971','Westfall Saber(245)','0','48048','Forsaken Bonecarver(245)'),
('0','47972','Spaulders of the Snow Bandit(245)','0','48049','Shoulderpads of the Snow Bandit(245)'),
('0','47973','The Grinder(245)','0','48050','Blackhorn Bludgeon(245)'),
('0','47974','Vestments of the Sleepless(245)','0','48051','Robes of the Sleepless(245)'),
('0','47975','Baelgun''s Heavy Crossbow(245)','0','48052','Darkmaw Crossbow(245)'),
('0','47976','Legplates of the Immortal Spider(245)','0','48053','Sunwalker Legguards(245)'),
('0','47977','Cinch of the Undying(245)','0','48054','Belt of the Eternal(245)'),
('0','47978','Bulwark of the Royal Guard(245)','0','48055','Aegis of the Coliseum(245)'),
('0','47979','Fordragon Blades(245)','0','48056','Anguish(245)'),
('0','47980','Velen''s Leggings of Conquest','0','48069','Zabra''s Leggings of Conquest'),
('0','47981','Velen''s Shoulderpads of Conquest','0','48071','Zabra''s Shoulderpads of Conquest'),
('0','47982','Velen''s Gloves of Conquest','0','48067','Zabra''s Gloves of Conquest'),
('0','47983','Velen''s Gloves of Triumph','0','48066','Zabra''s Gloves of Triumph'),
('0','47984','Velen''s Cowl of Triumph','0','48065','Zabra''s Cowl of Triumph'),
('0','47985','Velen''s Leggings of Triumph','0','48064','Zabra''s Leggings of Triumph'),
('0','47986','Velen''s Robe of Triumph','0','48063','Zabra''s Robe of Triumph'),
('0','47987','Velen''s Shoulderpads of Triumph','0','48062','Zabra''s Shoulderpads of Triumph'),
('0','48029','Velen''s Shoulderpads of Triumph','0','48061','Zabra''s Shoulderpads of Triumph'),
('0','48031','Velen''s Robe of Triumph','0','48060','Zabra''s Robe of Triumph'),
('0','48033','Velen''s Leggings of Triumph','0','48059','Zabra''s Leggings of Triumph'),
('0','48035','Velen''s Cowl of Triumph','0','48058','Zabra''s Cowl of Triumph'),
('0','48037','Velen''s Gloves of Triumph','0','48057','Zabra''s Gloves of Triumph'),
('0','48102','Malfurion''s Headpiece of Conquest','0','48154','Runetotem''s Headpiece of Conquest'),
('0','48129','Malfurion''s Robe of Conquest','0','48156','Runetotem''s Robe of Conquest'),
('0','48130','Malfurion''s Leggings of Conquest','0','48155','Runetotem''s Leggings of Conquest'),
('0','48131','Malfurion''s Spaulders of Conquest','0','48157','Runetotem''s Spaulders of Conquest'),
('0','48132','Malfurion''s Handguards of Conquest','0','48153','Runetotem''s Handguards of Conquest'),
('0','48133','Malfurion''s Handguards of Triumph','0','48152','Runetotem''s Handguards of Triumph'),
('0','48134','Malfurion''s Headpiece of Triumph','0','48151','Runetotem''s Headpiece of Triumph'),
('0','48135','Malfurion''s Leggings of Triumph','0','48150','Runetotem''s Leggings of Triumph'),
('0','48136','Malfurion''s Robe of Triumph','0','48149','Runetotem''s Robe of Triumph'),
('0','48137','Malfurion''s Spaulders of Triumph','0','48148','Runetotem''s Spaulders of Triumph'),
('0','48138','Malfurion''s Spaulders of Triumph','0','48147','Runetotem''s Spaulders of Triumph'),
('0','48139','Malfurion''s Robe of Triumph','0','48146','Runetotem''s Robe of Triumph'),
('0','48140','Malfurion''s Leggings of Triumph','0','48145','Runetotem''s Leggings of Triumph'),
('0','48141','Malfurion''s Headpiece of Triumph','0','48144','Runetotem''s Headpiece of Triumph'),
('0','48142','Malfurion''s Handguards of Triumph','0','48143','Runetotem''s Handguards of Triumph'),
('0','48158','Malfurion''s Cover of Conquest','0','48184','Runetotem''s Cover of Conquest'),
('0','48159','Malfurion''s Vestments of Conquest','0','48186','Runetotem''s Vestments of Conquest'),
('0','48160','Malfurion''s Trousers of Conquest','0','48185','Runetotem''s Trousers of Conquest'),
('0','48161','Malfurion''s Mantle of Conquest','0','48187','Runetotem''s Mantle of Conquest'),
('0','48162','Malfurion''s Gloves of Conquest','0','48183','Runetotem''s Gloves of Conquest'),
('0','48163','Malfurion''s Gloves of Triumph','0','48182','Runetotem''s Gloves of Triumph'),
('0','48164','Malfurion''s Cover of Triumph','0','48181','Runetotem''s Cover of Triumph'),
('0','48165','Malfurion''s Trousers of Triumph','0','48180','Runetotem''s Trousers of Triumph'),
('0','48166','Malfurion''s Vestments of Triumph','0','48179','Runetotem''s Vestments of Triumph'),
('0','48167','Malfurion''s Mantle of Triumph','0','48178','Runetotem''s Mantle of Triumph'),
('0','48168','Malfurion''s Mantle of Triumph','0','48177','Runetotem''s Mantle of Triumph'),
('0','48169','Malfurion''s Vestments of Triumph','0','48176','Runetotem''s Vestments of Triumph'),
('0','48170','Malfurion''s Trousers of Triumph','0','48175','Runetotem''s Trousers of Triumph'),
('0','48171','Malfurion''s Cover of Triumph','0','48174','Runetotem''s Cover of Triumph'),
('0','48172','Malfurion''s Gloves of Triumph','0','48173','Runetotem''s Gloves of Triumph'),
('0','48203','Malfurion''s Handgrips of Triumph','0','48202','Runetotem''s Handgrips of Triumph'),
('0','48204','Malfurion''s Headguard of Triumph','0','48201','Runetotem''s Headguard of Triumph'),
('0','48205','Malfurion''s Legguards of Triumph','0','48200','Runetotem''s Legguards of Triumph'),
('0','48206','Malfurion''s Raiments of Triumph','0','48199','Runetotem''s Raiments of Triumph'),
('0','48207','Malfurion''s Shoulderpads of Triumph','0','48198','Runetotem''s Shoulderpads of Triumph'),
('0','48208','Malfurion''s Shoulderpads of Triumph','0','48197','Runetotem''s Shoulderpads of Triumph'),
('0','48209','Malfurion''s Raiments of Triumph','0','48196','Runetotem''s Raiments of Triumph'),
('0','48210','Malfurion''s Legguards of Triumph','0','48195','Runetotem''s Legguards of Triumph'),
('0','48211','Malfurion''s Headguard of Triumph','0','48194','Runetotem''s Headguard of Triumph'),
('0','48212','Malfurion''s Handgrips of Triumph','0','48193','Runetotem''s Handgrips of Triumph'),
('0','48213','Malfurion''s Handgrips of Conquest','0','48192','Runetotem''s Handgrips of Conquest'),
('0','48214','Malfurion''s Headguard of Conquest','0','48188','Runetotem''s Headguard of Conquest'),
('0','48215','Malfurion''s Legguards of Conquest','0','48190','Runetotem''s Legguards of Conquest'),
('0','48216','Malfurion''s Raiments of Conquest','0','48189','Runetotem''s Raiments of Conquest'),
('0','48217','Malfurion''s Shoulderpads of Conquest','0','48191','Runetotem''s Shoulderpads of Conquest'),
('0','48218','VanCleef''s Helmet of Conquest','0','48245','Garona''s Helmet of Conquest'),
('0','48219','VanCleef''s Breastplate of Conquest','0','48243','Garona''s Breastplate of Conquest'),
('0','48220','VanCleef''s Legplates of Conquest','0','48246','Garona''s Legplates of Conquest'),
('0','48221','VanCleef''s Pauldrons of Conquest','0','48247','Garona''s Pauldrons of Conquest'),
('0','48222','VanCleef''s Gauntlets of Conquest','0','48244','Garona''s Gauntlets of Conquest'),
('0','48223','VanCleef''s Breastplate of Triumph','0','48242','Garona''s Breastplate of Triumph'),
('0','48224','VanCleef''s Gauntlets of Triumph','0','48241','Garona''s Gauntlets of Triumph'),
('0','48225','VanCleef''s Helmet of Triumph','0','48240','Garona''s Helmet of Triumph'),
('0','48226','VanCleef''s Legplates of Triumph','0','48239','Garona''s Legplates of Triumph'),
('0','48227','VanCleef''s Pauldrons of Triumph','0','48238','Garona''s Pauldrons of Triumph'),
('0','48228','VanCleef''s Pauldrons of Triumph','0','48237','Garona''s Pauldrons of Triumph'),
('0','48229','VanCleef''s Legplates of Triumph','0','48236','Garona''s Legplates of Triumph'),
('0','48230','VanCleef''s Helmet of Triumph','0','48235','Garona''s Helmet of Triumph'),
('0','48231','VanCleef''s Gauntlets of Triumph','0','48234','Garona''s Gauntlets of Triumph'),
('0','48232','VanCleef''s Breastplate of Triumph','0','48233','Garona''s Breastplate of Triumph'),
('0','48250','Windrunner''s Headpiece of Conquest','0','48277','Windrunner''s Headpiece of Conquest'),
('0','48251','Windrunner''s Tunic of Conquest','0','48275','Windrunner''s Tunic of Conquest'),
('0','48252','Windrunner''s Legguards of Conquest','0','48278','Windrunner''s Legguards of Conquest'),
('0','48253','Windrunner''s Spaulders of Conquest','0','48279','Windrunner''s Spaulders of Conquest'),
('0','48254','Windrunner''s Handguards of Conquest','0','48276','Windrunner''s Handguards of Conquest'),
('0','48255','Windrunner''s Tunic of Triumph','0','48274','Windrunner''s Tunic of Triumph'),
('0','48256','Windrunner''s Handguards of Triumph','0','48273','Windrunner''s Handguards of Triumph'),
('0','48257','Windrunner''s Headpiece of Triumph','0','48272','Windrunner''s Headpiece of Triumph'),
('0','48258','Windrunner''s Legguards of Triumph','0','48271','Windrunner''s Legguards of Triumph'),
('0','48259','Windrunner''s Spaulders of Triumph','0','48270','Windrunner''s Spaulders of Triumph'),
('0','48260','Windrunner''s Spaulders of Triumph','0','48269','Windrunner''s Spaulders of Triumph'),
('0','48261','Windrunner''s Legguards of Triumph','0','48268','Windrunner''s Legguards of Triumph'),
('0','48262','Windrunner''s Headpiece of Triumph','0','48267','Windrunner''s Headpiece of Triumph'),
('0','48263','Windrunner''s Handguards of Triumph','0','48266','Windrunner''s Handguards of Triumph'),
('0','48264','Windrunner''s Tunic of Triumph','0','48265','Windrunner''s Tunic of Triumph'),
('0','48280','Nobundo''s Headpiece of Conquest','0','48297','Thrall''s Headpiece of Conquest'),
('0','48281','Nobundo''s Tunic of Conquest','0','48295','Thrall''s Tunic of Conquest'),
('0','48282','Nobundo''s Legguards of Conquest','0','48298','Thrall''s Legguards of Conquest'),
('0','48283','Nobundo''s Spaulders of Conquest','0','48299','Thrall''s Spaulders of Conquest'),
('0','48284','Nobundo''s Handguards of Conquest','0','48296','Thrall''s Handguards of Conquest'),
('0','48285','Nobundo''s Tunic of Triumph','0','48300','Thrall''s Tunic of Triumph'),
('0','48286','Nobundo''s Handguards of Triumph','0','48301','Thrall''s Handguards of Triumph'),
('0','48287','Nobundo''s Headpiece of Triumph','0','48302','Thrall''s Headpiece of Triumph'),
('0','48288','Nobundo''s Legguards of Triumph','0','48303','Thrall''s Legguards of Triumph'),
('0','48289','Nobundo''s Spaulders of Triumph','0','48304','Thrall''s Spaulders of Triumph'),
('0','48290','Nobundo''s Spaulders of Triumph','0','48309','Thrall''s Spaulders of Triumph'),
('0','48291','Nobundo''s Legguards of Triumph','0','48308','Thrall''s Legguards of Triumph'),
('0','48292','Nobundo''s Headpiece of Triumph','0','48307','Thrall''s Headpiece of Triumph'),
('0','48293','Nobundo''s Handguards of Triumph','0','48306','Thrall''s Handguards of Triumph'),
('0','48294','Nobundo''s Tunic of Triumph','0','48305','Thrall''s Tunic of Triumph'),
('0','48310','Nobundo''s Hauberk of Conquest','0','48336','Thrall''s Hauberk of Conquest'),
('0','48312','Nobundo''s Gloves of Conquest','0','48337','Thrall''s Gloves of Conquest'),
('0','48313','Nobundo''s Helm of Conquest','0','48338','Thrall''s Helm of Conquest'),
('0','48314','Nobundo''s Kilt of Conquest','0','48339','Thrall''s Kilt of Conquest'),
('0','48315','Nobundo''s Shoulderpads of Conquest','0','48340','Thrall''s Shoulderpads of Conquest'),
('0','48316','Nobundo''s Hauberk of Triumph','0','48335','Thrall''s Hauberk of Triumph'),
('0','48317','Nobundo''s Gloves of Triumph','0','48334','Thrall''s Gloves of Triumph'),
('0','48318','Nobundo''s Helm of Triumph','0','48333','Thrall''s Helm of Triumph'),
('0','48319','Nobundo''s Kilt of Triumph','0','48332','Thrall''s Kilt of Triumph'),
('0','48320','Nobundo''s Shoulderpads of Triumph','0','48331','Thrall''s Shoulderpads of Triumph'),
('0','48321','Nobundo''s Shoulderpads of Triumph','0','48330','Thrall''s Shoulderpads of Triumph'),
('0','48322','Nobundo''s Kilt of Triumph','0','48329','Thrall''s Kilt of Triumph'),
('0','48323','Nobundo''s Helm of Triumph','0','48328','Thrall''s Helm of Triumph'),
('0','48324','Nobundo''s Gloves of Triumph','0','48327','Thrall''s Gloves of Triumph'),
('0','48325','Nobundo''s Hauberk of Triumph','0','48326','Thrall''s Hauberk of Triumph'),
('0','48341','Nobundo''s Chestguard of Conquest','0','48366','Thrall''s Chestguard of Conquest'),
('0','48342','Nobundo''s Grips of Conquest','0','48367','Thrall''s Grips of Conquest'),
('0','48343','Nobundo''s Faceguard of Conquest','0','48368','Thrall''s Faceguard of Conquest'),
('0','48344','Nobundo''s War-Kilt of Conquest','0','48369','Thrall''s War-Kilt of Conquest'),
('0','48345','Nobundo''s Shoulderguards of Conquest','0','48370','Thrall''s Shoulderguards of Conquest'),
('0','48346','Nobundo''s Chestguard of Triumph','0','48365','Thrall''s Chestguard of Triumph'),
('0','48347','Nobundo''s Grips of Triumph','0','48364','Thrall''s Grips of Triumph'),
('0','48348','Nobundo''s Faceguard of Triumph','0','48363','Thrall''s Faceguard of Triumph'),
('0','48349','Nobundo''s War-Kilt of Triumph','0','48362','Thrall''s War-Kilt of Triumph'),
('0','48350','Nobundo''s Shoulderguards of Triumph','0','48361','Thrall''s Shoulderguards of Triumph'),
('0','48351','Nobundo''s Shoulderguards of Triumph','0','48360','Thrall''s Shoulderguards of Triumph'),
('0','48352','Nobundo''s War-Kilt of Triumph','0','48359','Thrall''s War-Kilt of Triumph'),
('0','48353','Nobundo''s Faceguard of Triumph','0','48358','Thrall''s Faceguard of Triumph'),
('0','48354','Nobundo''s Grips of Triumph','0','48357','Thrall''s Grips of Triumph'),
('0','48355','Nobundo''s Chestguard of Triumph','0','48356','Thrall''s Chestguard of Triumph'),
('0','48356','Thrall''s Chestguard of Triumph','0','48385','Wrynn''s Battleplate of Triumph'),
('0','48357','Thrall''s Grips of Triumph','0','48384','Wrynn''s Gauntlets of Triumph'),
('0','48358','Thrall''s Faceguard of Triumph','0','48383','Wrynn''s Helmet of Triumph'),
('0','48359','Thrall''s War-Kilt of Triumph','0','48382','Wrynn''s Legplates of Triumph'),
('0','48360','Thrall''s Shoulderguards of Triumph','0','48381','Wrynn''s Shoulderplates of Triumph'),
('0','48361','Thrall''s Shoulderguards of Triumph','0','48380','Wrynn''s Shoulderplates of Triumph'),
('0','48362','Thrall''s War-Kilt of Triumph','0','48379','Wrynn''s Legplates of Triumph'),
('0','48363','Thrall''s Faceguard of Triumph','0','48378','Wrynn''s Helmet of Triumph'),
('0','48364','Thrall''s Grips of Triumph','0','48377','Wrynn''s Gauntlets of Triumph'),
('0','48365','Thrall''s Chestguard of Triumph','0','48376','Wrynn''s Battleplate of Triumph'),
('0','48366','Thrall''s Chestguard of Conquest','0','48372','Wrynn''s Battleplate of Conquest'),
('0','48367','Thrall''s Grips of Conquest','0','48375','Wrynn''s Gauntlets of Conquest'),
('0','48368','Thrall''s Faceguard of Conquest','0','48371','Wrynn''s Helmet of Conquest'),
('0','48369','Thrall''s War-Kilt of Conquest','0','48373','Wrynn''s Legplates of Conquest'),
('0','48370','Thrall''s Shoulderguards of Conquest','0','48374','Wrynn''s Shoulderplates of Conquest'),
('0','48371','Wrynn''s Helmet of Conquest','0','48388','Hellscream''s Helmet of Conquest'),
('0','48372','Wrynn''s Battleplate of Conquest','0','48386','Hellscream''s Battleplate of Conquest'),
('0','48373','Wrynn''s Legplates of Conquest','0','48389','Hellscream''s Legplates of Conquest'),
('0','48374','Wrynn''s Shoulderplates of Conquest','0','48390','Hellscream''s Shoulderplates of Conquest'),
('0','48375','Wrynn''s Gauntlets of Conquest','0','48387','Hellscream''s Gauntlets of Conquest'),
('0','48376','Wrynn''s Battleplate of Triumph','0','48391','Hellscream''s Battleplate of Triumph'),
('0','48377','Wrynn''s Gauntlets of Triumph','0','48392','Hellscream''s Gauntlets of Triumph'),
('0','48378','Wrynn''s Helmet of Triumph','0','48393','Hellscream''s Helmet of Triumph'),
('0','48379','Wrynn''s Legplates of Triumph','0','48394','Hellscream''s Legplates of Triumph'),
('0','48380','Wrynn''s Shoulderplates of Triumph','0','48395','Hellscream''s Shoulderplates of Triumph'),
('0','48381','Wrynn''s Shoulderplates of Triumph','0','48400','Hellscream''s Shoulderplates of Triumph'),
('0','48382','Wrynn''s Legplates of Triumph','0','48399','Hellscream''s Legplates of Triumph'),
('0','48383','Wrynn''s Helmet of Triumph','0','48398','Hellscream''s Helmet of Triumph'),
('0','48384','Wrynn''s Gauntlets of Triumph','0','48397','Hellscream''s Gauntlets of Triumph'),
('0','48385','Wrynn''s Battleplate of Triumph','0','48396','Hellscream''s Battleplate of Triumph'),
('0','48429','Wrynn''s Greathelm of Conquest','0','48458','Hellscream''s Greathelm of Conquest'),
('0','48430','Wrynn''s Greathelm of Triumph','0','48463','Hellscream''s Greathelm of Triumph'),
('0','48433','Wrynn''s Greathelm of Triumph','0','48468','Hellscream''s Greathelm of Triumph'),
('0','48436','Wrynn''s Breastplate of Conquest','0','48456','Hellscream''s Breastplate of Conquest'),
('0','48445','Wrynn''s Legguards of Conquest','0','48459','Hellscream''s Legguards of Conquest'),
('0','48446','Wrynn''s Legguards of Triumph','0','48464','Hellscream''s Legguards of Triumph'),
('0','48447','Wrynn''s Legguards of Triumph','0','48469','Hellscream''s Legguards of Triumph'),
('0','48448','Wrynn''s Pauldrons of Conquest','0','48460','Hellscream''s Pauldrons of Conquest'),
('0','48449','Wrynn''s Handguards of Conquest','0','48457','Hellscream''s Handguards of Conquest'),
('0','48450','Wrynn''s Breastplate of Triumph','0','48461','Hellscream''s Breastplate of Triumph'),
('0','48451','Wrynn''s Breastplate of Triumph','0','48466','Hellscream''s Breastplate of Triumph'),
('0','48452','Wrynn''s Handguards of Triumph','0','48462','Hellscream''s Handguards of Triumph'),
('0','48453','Wrynn''s Handguards of Triumph','0','48467','Hellscream''s Handguards of Triumph'),
('0','48454','Wrynn''s Pauldrons of Triumph','0','48465','Hellscream''s Pauldrons of Triumph'),
('0','48455','Wrynn''s Pauldrons of Triumph','0','48470','Hellscream''s Pauldrons of Triumph'),
('0','48472','Thassarian''s Helmet of Conquest','0','48503','Koltira''s Helmet of Conquest'),
('0','48474','Thassarian''s Battleplate of Conquest','0','48501','Koltira''s Battleplate of Conquest'),
('0','48476','Thassarian''s Legplates of Conquest','0','48504','Koltira''s Legplates of Conquest'),
('0','48478','Thassarian''s Shoulderplates of Conquest','0','48505','Koltira''s Shoulderplates of Conquest'),
('0','48480','Thassarian''s Gauntlets of Conquest','0','48502','Koltira''s Gauntlets of Conquest'),
('0','48481','Thassarian''s Battleplate of Triumph','0','48500','Koltira''s Battleplate of Triumph'),
('0','48482','Thassarian''s Gauntlets of Triumph','0','48499','Koltira''s Gauntlets of Triumph'),
('0','48483','Thassarian''s Helmet of Triumph','0','48498','Koltira''s Helmet of Triumph'),
('0','48484','Thassarian''s Legplates of Triumph','0','48497','Koltira''s Legplates of Triumph'),
('0','48485','Thassarian''s Shoulderplates of Triumph','0','48496','Koltira''s Shoulderplates of Triumph'),
('0','48486','Thassarian''s Shoulderplates of Triumph','0','48495','Koltira''s Shoulderplates of Triumph'),
('0','48487','Thassarian''s Legplates of Triumph','0','48494','Koltira''s Legplates of Triumph'),
('0','48488','Thassarian''s Helmet of Triumph','0','48493','Koltira''s Helmet of Triumph'),
('0','48489','Thassarian''s Gauntlets of Triumph','0','48492','Koltira''s Gauntlets of Triumph'),
('0','48490','Thassarian''s Battleplate of Triumph','0','48491','Koltira''s Battleplate of Triumph'),
('0','48529','Thassarian''s Faceguard of Conquest','0','48560','Koltira''s Faceguard of Conquest'),
('0','48531','Thassarian''s Chestguard of Conquest','0','48558','Koltira''s Chestguard of Conquest'),
('0','48533','Thassarian''s Legguards of Conquest','0','48561','Koltira''s Legguards of Conquest'),
('0','48535','Thassarian''s Pauldrons of Conquest','0','48562','Koltira''s Pauldrons of Conquest'),
('0','48537','Thassarian''s Handguards of Conquest','0','48559','Koltira''s Handguards of Conquest'),
('0','48538','Thassarian''s Chestguard of Triumph','0','48557','Koltira''s Chestguard of Triumph'),
('0','48539','Thassarian''s Handguards of Triumph','0','48556','Koltira''s Handguards of Triumph'),
('0','48540','Thassarian''s Faceguard of Triumph','0','48555','Koltira''s Faceguard of Triumph'),
('0','48541','Thassarian''s Legguards of Triumph','0','48554','Koltira''s Legguards of Triumph'),
('0','48542','Thassarian''s Pauldrons of Triumph','0','48553','Koltira''s Pauldrons of Triumph'),
('0','48543','Thassarian''s Pauldrons of Triumph','0','48552','Koltira''s Pauldrons of Triumph'),
('0','48544','Thassarian''s Legguards of Triumph','0','48551','Koltira''s Legguards of Triumph'),
('0','48545','Thassarian''s Faceguard of Triumph','0','48550','Koltira''s Faceguard of Triumph'),
('0','48546','Thassarian''s Handguards of Triumph','0','48549','Koltira''s Handguards of Triumph'),
('0','48547','Thassarian''s Chestguard of Triumph','0','48548','Koltira''s Chestguard of Triumph'),
('0','48564','Turalyon''s Headpiece of Conquest','0','48597','Liadrin''s Headpiece of Conquest'),
('0','48566','Turalyon''s Tunic of Conquest','0','48599','Liadrin''s Tunic of Conquest'),
('0','48568','Turalyon''s Greaves of Conquest','0','48596','Liadrin''s Greaves of Conquest'),
('0','48572','Turalyon''s Spaulders of Conquest','0','48595','Liadrin''s Spaulders of Conquest'),
('0','48574','Turalyon''s Gloves of Conquest','0','48598','Liadrin''s Gloves of Conquest'),
('0','48575','Turalyon''s Tunic of Triumph','0','48594','Liadrin''s Tunic of Triumph'),
('0','48576','Turalyon''s Gloves of Triumph','0','48593','Liadrin''s Gloves of Triumph'),
('0','48577','Turalyon''s Headpiece of Triumph','0','48592','Liadrin''s Headpiece of Triumph'),
('0','48578','Turalyon''s Greaves of Triumph','0','48591','Liadrin''s Greaves of Triumph'),
('0','48579','Turalyon''s Spaulders of Triumph','0','48590','Liadrin''s Spaulders of Triumph'),
('0','48580','Turalyon''s Spaulders of Triumph','0','48585','Liadrin''s Spaulders of Triumph'),
('0','48581','Turalyon''s Greaves of Triumph','0','48586','Liadrin''s Greaves of Triumph'),
('0','48582','Turalyon''s Headpiece of Triumph','0','48587','Liadrin''s Headpiece of Triumph'),
('0','48583','Turalyon''s Gloves of Triumph','0','48588','Liadrin''s Gloves of Triumph'),
('0','48584','Turalyon''s Tunic of Triumph','0','48589','Liadrin''s Tunic of Triumph'),
('0','48602','Turalyon''s Battleplate of Conquest','0','48631','Liadrin''s Battleplate of Conquest'),
('0','48603','Turalyon''s Gauntlets of Conquest','0','48630','Liadrin''s Gauntlets of Conquest'),
('0','48604','Turalyon''s Helm of Conquest','0','48629','Liadrin''s Helm of Conquest'),
('0','48605','Turalyon''s Legplates of Conquest','0','48628','Liadrin''s Legplates of Conquest'),
('0','48606','Turalyon''s Shoulderplates of Conquest','0','48627','Liadrin''s Shoulderplates of Conquest'),
('0','48607','Turalyon''s Battleplate of Triumph','0','48626','Liadrin''s Battleplate of Triumph'),
('0','48608','Turalyon''s Gauntlets of Triumph','0','48625','Liadrin''s Gauntlets of Triumph'),
('0','48609','Turalyon''s Helm of Triumph','0','48624','Liadrin''s Helm of Triumph'),
('0','48610','Turalyon''s Legplates of Triumph','0','48623','Liadrin''s Legplates of Triumph'),
('0','48611','Turalyon''s Shoulderplates of Triumph','0','48622','Liadrin''s Shoulderplates of Triumph'),
('0','48612','Turalyon''s Shoulderplates of Triumph','0','48621','Liadrin''s Shoulderplates of Triumph'),
('0','48613','Turalyon''s Legplates of Triumph','0','48620','Liadrin''s Legplates of Triumph'),
('0','48614','Turalyon''s Helm of Triumph','0','48619','Liadrin''s Helm of Triumph'),
('0','48615','Turalyon''s Gauntlets of Triumph','0','48618','Liadrin''s Gauntlets of Triumph'),
('0','48616','Turalyon''s Battleplate of Triumph','0','48617','Liadrin''s Battleplate of Triumph'),
('0','48632','Turalyon''s Breastplate of Conquest','0','48652','Liadrin''s Breastplate of Conquest'),
('0','48633','Turalyon''s Handguards of Conquest','0','48653','Liadrin''s Handguards of Conquest'),
('0','48634','Turalyon''s Faceguard of Conquest','0','48654','Liadrin''s Faceguard of Conquest'),
('0','48635','Turalyon''s Legguards of Conquest','0','48655','Liadrin''s Legguards of Conquest'),
('0','48636','Turalyon''s Shoulderguards of Conquest','0','48656','Liadrin''s Shoulderguards of Conquest'),
('0','48637','Turalyon''s Shoulderguards of Triumph','0','48661','Liadrin''s Shoulderguards of Triumph'),
('0','48638','Turalyon''s Legguards of Triumph','0','48660','Liadrin''s Legguards of Triumph'),
('0','48639','Turalyon''s Faceguard of Triumph','0','48659','Liadrin''s Faceguard of Triumph'),
('0','48640','Turalyon''s Handguards of Triumph','0','48658','Liadrin''s Handguards of Triumph'),
('0','48641','Turalyon''s Breastplate of Triumph','0','48657','Liadrin''s Breastplate of Triumph'),
('0','48642','Turalyon''s Breastplate of Triumph','0','48651','Liadrin''s Breastplate of Triumph'),
('0','48643','Turalyon''s Handguards of Triumph','0','48650','Liadrin''s Handguards of Triumph'),
('0','48644','Turalyon''s Faceguard of Triumph','0','48649','Liadrin''s Faceguard of Triumph'),
('0','48645','Turalyon''s Legguards of Triumph','0','48648','Liadrin''s Legguards of Triumph'),
('0','48646','Turalyon''s Shoulderguards of Triumph','0','48647','Liadrin''s Shoulderguards of Triumph'),
('0','48671','Drape of Bitter Incantation(258)','0','48666','Drape of the Sunreavers(258)'),
('0','48672','Shawl of Fervent Crusader(258)','0','48667','Shawl of the Devout Crusader(258)'),
('0','48673','Cloak of the Silver Covenant(258)','0','48668','Cloak of Serrated Blades(258)'),
('0','48674','Cloak of the Victorious Combatant(258)','0','48669','Cloak of the Triumphant Combatant(258)'),
('0','48675','Cloak of the Unmoving Guardian(258)','0','48670','Cloak of the Unflinching Guardian(258)'),
('0','48708','Spellstorm Blade(245)','0','48701','Spellharvest(245)'),
('0','48709','Heartcrusher(245)','0','48693','Heartsmasher(245)'),
('0','48710','Paragon''s Breadth(245)','0','48705','Attrition(245)'),
('0','48711','Rhok''shalla, the Shadow''s Bane(245)','0','48697','Frenzystrike Longbow(245)'),
('0','48712','The Spinebreaker(245)','0','48703','The Facebreaker(245)'),
('0','48713','Lothar''s Edge(245)','0','48695','Mor''kosh, the Bloodreaver(245)'),
('0','48714','Honor of the Fallen(245)','0','48699','Blood and Glory(245)'),
('0','48743','Kel''Thuzad''s Robe ','0','47799','Gul''dan''s Robe of Conquest'),
('0','49052','Tabard of Conquest(A)','0','49054','Tabard of Conquest(H)'),
('0','49231','Boots of the Grieving Soul(232)','0','49232','Sandals of the Grieving Soul(232)'),
('0','49234','Boots of the Grieving Soul(245)','0','49233','Sandals of the Grieving Soul(245)'),
('0','49235','Boots of Tortured Space(232)','0','49236','Sabatons of Tortured Space(232)'),
('0','49238','Boots of Tortured Space(245)','0','49237','Sabatons of Tortured Space(245)'),
('0','51377','Medallion of the Alliance(264)','0','51378','Medallion of the Horde(264)');



-- ro_world_spell_fixes
-- HERE WILL BE ADD ALL LITTLE SPELL FIXES FOR ROCORE JUST NOT TO HAVE MANY FILES IN UPDATE FOLDER

UPDATE spell_proc_event SET procFlags = 20, procEx = 2 WHERE entry IN (53486, 53488);
DELETE FROM `spell_bonus_data` where entry=50444;
INSERT INTO `spell_bonus_data`(`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `comments`) VALUES (50444, 0, 0, 0.105, "Death Knight - Corpse Explosion Triggered");

-- DK's should now be immune to Psychic Horror when they are affected by Anti-Magic Shell.
-- by Andu
-- Fixed Psychic Horror piercing through Anti-Magic Shell
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`= 48707;
INSERT INTO `spell_linked_spell` VALUES (48707, -64044, 2, 'Anti-Magic Shell immune to Psychic Horror');

-- Paladins should now be immune to Cyclone when they are affected by Divine Shield
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`= 642;
INSERT INTO `spell_linked_spell` VALUES (642, -33786, 2, 'Divine Shield immune to Cyclone');

-- Fingers of Frost

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN ('44544', '-44544');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('44544','74396','0','Fingers of Frost (ADD)'),
('-44544','-74396','0','Fingers of Frost (REMOVE)');


-- -------------------------------- --
-- SCRIPT NAMES OF ALL SINGLE FILES --
-- -------------------------------- --

-- Script_names of RoCore update files
-- Argent tournament
UPDATE `creature_template` SET `ScriptName` = 'npc_squire_danny' WHERE entry = 33518;
UPDATE `creature_template` SET `ScriptName` = 'npc_argent_valiant' WHERE entry = 33448;
UPDATE `creature_template` SET `ScriptName` = 'npc_argent_champion' WHERE entry = 33707;

-- Borean tundra
UPDATE `creature_template` SET  `ScriptName` = 'npc_fizzcrank_fullthrottle' WHERE entry = 25590; -- Fizzcrank Fullthrottle
UPDATE `creature_template` SET  `ScriptName` = 'npc_surristrasz' WHERE entry =24795; -- Surristrasz
UPDATE `creature_template` SET  `ScriptName` = 'npc_tiare' WHERE entry =30051; -- Librarian Tiare

-- Eye of eternity
UPDATE `creature_template` SET `ScriptName` = 'boss_malygos', unit_flags = unit_flags & ~256 WHERE entry = 28859;
UPDATE `creature_template` SET `ScriptName` = 'mob_nexus_lord' WHERE entry = 30245; -- Nexus Lord
UPDATE `creature_template` SET `ScriptName` = 'mob_scion_of_eternity' WHERE entry = 30249; -- Scion of Eternity
UPDATE `creature_template` SET `ScriptName` = 'mob_power_spark' WHERE entry = 30084;  -- Power Spark
UPDATE `creature_template` SET `ScriptName` = 'npc_arcane_overload' WHERE entry = 30282; -- Arcane Overload

-- Obsidian Santum
UPDATE `creature_template` SET `ScriptName`='boss_sartharion' WHERE `entry`=28860;
UPDATE `creature_template` SET `ScriptName`='mob_vesperon' WHERE `entry`=30449;
UPDATE `creature_template` SET `ScriptName`='mob_shadron' WHERE `entry`=30451;
UPDATE `creature_template` SET `ScriptName`='mob_tenebron' WHERE `entry`=30452;
UPDATE `creature_template` SET `ScriptName`='mob_acolyte_of_shadron' WHERE `entry`=31218;
UPDATE `creature_template` SET `ScriptName`='mob_acolyte_of_vesperon' WHERE `entry`=31219;
UPDATE `creature_template` SET `ScriptName`='npc_twilight_fissure' WHERE entry=30641; 
UPDATE `creature_template` SET `ScriptName`='npc_flame_tsunami' WHERE entry=30616;
UPDATE `creature_template` SET `ScriptName`='npc_twilight_fissure' WHERE entry = 30641;
UPDATE `creature_template` SET `ScriptName`='npc_flame_tsunami' WHERE entry = 30616;
UPDATE `creature_template` SET `ScriptName`='mob_twilight_eggs' WHERE entry IN (30882, 31204);
-- Revisar: tiene script_name en 2 ids mas 31214 & 31548, la principal es 30890, producia un error "ERROR: Creature (Entry: 31214) lists difficulty 1 mode entry 31548 with `ScriptName` filled in. `ScriptName` of difficulty 0 mode creature is always used instead."
-- UPDATE `creature_template` SET `ScriptName`='mob_twilight_whelp' WHERE entry IN (30890, 31214, 31548);
-- ahora solo esta asignado a un solo id 30890, hay que probar si va bien.
UPDATE `creature_template` SET `ScriptName`='mob_twilight_whelp' WHERE entry IN (30890);
UPDATE `creature_template` SET `ScriptName`='npc_disciple_of_vesperon' WHERE entry = 30858;
UPDATE `creature_template` SET `ScriptName`='npc_flame_tsunami' WHERE entry=30616;

-- Oculus
UPDATE `creature_template` SET `ScriptName`='npc_unstable_sphere' WHERE `entry`=28166;
UPDATE `creature_template` SET `ScriptName`='npc_oculus_drake' WHERE `entry` IN (27657,27658,27659);
UPDATE `creature_template` SET `ScriptName`='boss_drakos' WHERE entry = 27654;
UPDATE `creature_template` SET `ScriptName`='boss_urom' WHERE entry = 27655;
UPDATE `creature_template` SET `ScriptName`='mob_centrifige_construct' WHERE entry = 27641;
UPDATE `creature_template` SET `ScriptName`='boss_varos' WHERE entry = 27447;
UPDATE `creature_template` SET `ScriptName`='boss_eregos' WHERE entry = 27656;
UPDATE `creature_template` SET `ScriptName`= 'npc_planar_anomaly' WHERE entry = 30879; -- Planar Anomlay di Eregos 

-- Ruby Sanctum
UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus' WHERE `entry` = '39751';
UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus_clone' WHERE `entry` = '39899';
UPDATE `creature_template` SET `ScriptName` = 'npc_xerestrasza' WHERE `entry` = '40429';
UPDATE `creature_template` SET `ScriptName` = 'boss_zarithrian' WHERE `entry` = '39746';
UPDATE `creature_template` SET `ScriptName` = 'boss_ragefire' WHERE `entry` = '39747';
UPDATE `creature_template` SET `ScriptName` = 'boss_halion' WHERE `entry`= '39863';
UPDATE `creature_template` SET `ScriptName` = 'boss_twilight_halion' WHERE `entry` = '40142';
UPDATE `creature_template` SET `ScriptName` = 'npc_onyx_flamecaller' WHERE `entry` = '39814';
UPDATE `creature_template` SET `ScriptName` = 'npc_meteor_strike' WHERE `entry` = '40055';
UPDATE `creature_template` SET `ScriptName` = 'npc_combustion' WHERE `entry` = '40001';
UPDATE `creature_template` SET `ScriptName` = 'npc_consumption' WHERE `entry` = '40135';
UPDATE `creature_template` SET `ScriptName` = 'npc_meteor_flame' WHERE `entry` = '40044';

-- Anuncios al comienzo del evento.
-- Here does not exist the NPC, the we fix the script_name in this way
-- Later we will fix in the right way
DELETE FROM `creature_template` WHERE `entry` in (35591,35592);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES 
(35591, 0, 0, 0, 0, 0, 29894, 0, 0, 0, 'Jaeren Sunsworn', '', '', 0, 75, 75, 2, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 2000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_anstart'),
(35592, 0, 0, 0, 0, 0, 29893, 0, 0, 0, 'Arelas Brightstar', '', '', 0, 75, 75, 2, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_anstart');

-- Solo nos quedan estos antiguos, no sé si nos sobran o deben quedarse, que opinas?
-- Trial of the champion
UPDATE `creature_template` SET `ScriptName`='npc_announcer_toc5' WHERE `entry`IN (35004,35005);
UPDATE `creature_template` SET `ScriptName`='npc_gr' WHERE `entry`IN (35492);
UPDATE `creature_template` SET `ScriptName`='npc_anstart' WHERE `entry`IN (35591,35592);

-- Trial of the crusader
UPDATE `creature_template` SET `ScriptName`='mob_firebomb_trigger' WHERE (`entry`='34854');
UPDATE `creature_template` SET `ScriptName`='Mob_NerubianTrigger' WHERE (`entry`='34862');
UPDATE `creature_template` SET `ScriptName`='mob_swarm_scarab' WHERE (`entry`='34605');
UPDATE `creature_template` SET `ScriptName`='creature_impale' WHERE (`entry`='29184');

-- TOC segun TC
UPDATE `creature_template` SET `scriptname`='npc_announcer_toc10' WHERE `entry` in (34816);
UPDATE `creature_template` SET `scriptname`='boss_lich_king_toc' WHERE `entry`=35877;
UPDATE `creature_template` SET `scriptname`='npc_fizzlebang_toc' WHERE `entry`=35458;
UPDATE `creature_template` SET `scriptname`='npc_tirion_toc' WHERE `entry`=34996;
UPDATE `creature_template` SET `scriptname`='npc_garrosh_toc' WHERE `entry`=34995;
UPDATE `creature_template` SET `scriptname`='npc_varian_toc' WHERE `entry`=34990;
UPDATE `creature_template` SET `scriptname`='boss_gormok', `AIName` ='' WHERE `entry`=34796;
UPDATE `creature_template` SET `scriptname`='mob_snobold_vassal', `AIName` ='' WHERE `entry`=34800;
UPDATE `creature_template` SET `scriptname`='boss_dreadscale', `AIName` ='' WHERE `entry`=34799;
UPDATE `creature_template` SET `scriptname`='boss_acidmaw', `AIName` ='' WHERE `entry`=35144;
UPDATE `creature_template` SET `scriptname`='mob_slime_pool', `AIName` ='' WHERE `entry` = 35176;
UPDATE `creature_template` SET `scriptname`='boss_icehowl', `AIName` ='' WHERE `entry`=34797;
UPDATE `creature_template` SET `scriptname`='boss_jaraxxus', `AIName` ='' WHERE `entry`= 34780;
UPDATE `creature_template` SET `scriptname`='mob_legion_flame', `AIName` ='' WHERE `entry` = 34784;
UPDATE `creature_template` SET `scriptname`='mob_infernal_volcano', `AIName` ='' WHERE `entry` = 34813;
UPDATE `creature_template` SET `scriptname`='mob_nether_portal', `AIName` ='' WHERE `entry` = 34825;
UPDATE `creature_template` SET `scriptname`='mob_fel_infernal', `AIName` ='' WHERE `entry` = 34815;
UPDATE `creature_template` SET `scriptname`='mob_mistress_of_pain', `AIName` ='' WHERE `entry` = 34826;
UPDATE `creature_template` SET `scriptname`='boss_toc_champion_controller', `AIName` ='' WHERE `entry` IN (34781);
UPDATE `creature_template` SET `scriptname`='boss_anubarak_trial', `AIName` ='' WHERE `entry`=34564;
UPDATE `creature_template` SET `scriptname`='boss_fjola', `AIName` ='' WHERE `entry`=34497;
UPDATE `creature_template` SET `scriptname`='boss_eydis', `AIName` ='' WHERE `entry`=34496;
UPDATE `creature_template` SET `scriptname`='mob_essence_of_twin', `AIName` ='' WHERE `entry` IN (34567,34568);
UPDATE `creature_template` SET `scriptname`='mob_unleashed_dark', `AIName` ='' WHERE entry = 34628;
UPDATE `creature_template` SET `scriptname`='mob_unleashed_light', `AIName` ='' WHERE entry = 34630;
UPDATE `creature_template` SET `ScriptName`='mob_frost_sphere', `AIName` = '' WHERE `entry` = 34606;
UPDATE `creature_template` SET `scriptname`='mob_nerubian_burrower', `AIName` ='' WHERE `entry`=34607;
UPDATE `creature_template` SET `scriptname`='mob_anubarak_spike', `AIName` ='' WHERE `entry`=34660;

-- Faction Champions Horde

-- Faction Champions Alliance

-- Segun TC
-- Lo han hech muy bien un solo script_name para ambos en cada facción mucho mas fácil
UPDATE `creature_template` SET `scriptname`='mob_toc_warrior', `AIName` ='' WHERE `entry` IN (34475,34453);
UPDATE `creature_template` SET `scriptname`='mob_toc_mage', `AIName` ='' WHERE `entry` IN (34468,34449);
UPDATE `creature_template` SET `scriptname`='mob_toc_shaman', `AIName` ='' WHERE `entry` IN (34470,34444);
UPDATE `creature_template` SET `scriptname`='mob_toc_enh_shaman', `AIName` ='' WHERE `entry` IN (34463,34455);
UPDATE `creature_template` SET `scriptname`='mob_toc_hunter', `AIName` ='' WHERE `entry` IN (34467,34448);
UPDATE `creature_template` SET `scriptname`='mob_toc_rogue', `AIName` ='' WHERE `entry` IN (34472,34454);
UPDATE `creature_template` SET `scriptname`='mob_toc_priest', `AIName` ='' WHERE `entry` IN (34466,34447);
UPDATE `creature_template` SET `scriptname`='mob_toc_shadow_priest', `AIName` ='' WHERE `entry` IN (34473,34441);
UPDATE `creature_template` SET `scriptname`='mob_toc_dk', `AIName` ='' WHERE `entry` IN (34461,34458);
UPDATE `creature_template` SET `scriptname`='mob_toc_paladin', `AIName` ='' WHERE `entry` IN (34465,34445);
UPDATE `creature_template` SET `scriptname`='mob_toc_retro_paladin', `AIName` ='' WHERE `entry` IN (34471,34456);
UPDATE `creature_template` SET `scriptname`='mob_toc_druid', `AIName` ='' WHERE `entry` IN (34469,34459);
UPDATE `creature_template` SET `scriptname`='mob_toc_boomkin', `AIName` ='' WHERE `entry` IN (34460,34451);
UPDATE `creature_template` SET `scriptname`='mob_toc_warlock' WHERE `entry` IN (34474,34450);

-- Ulduar
UPDATE `creature_template` SET `ScriptName`= '' WHERE `entry` IN (33365,33370,33312,33367,33686,33579,34275,33214);
UPDATE `creature_template` SET `ScriptName`='boss_auriaya' WHERE `entry`=33515;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan' WHERE `entry`=33113;
UPDATE `creature_template` SET `AIName`='TurretAI',`ScriptName`='' WHERE `entry`=33139;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan_seat' WHERE `entry`=33114;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan_defense_turret' WHERE `entry`=33142;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan_overload_device' WHERE `entry`=33143;
UPDATE `creature_template` SET `ScriptName`='spell_pool_of_tar' WHERE `entry`=33090;
UPDATE `creature_template` SET `ScriptName`='boss_ignis' WHERE `entry`=33118;
UPDATE `creature_template` SET `ScriptName`='boss_razorscale' WHERE `entry`=33186;
UPDATE `creature_template` SET `ScriptName`='boss_xt002' WHERE `entry`=33293;
UPDATE `creature_template` SET `ScriptName`='mob_xt002_heart' WHERE `entry`=33329;
UPDATE `creature_template` SET `ScriptName`='mob_scrapbot' WHERE `entry`=33343;
UPDATE `creature_template` SET `ScriptName`='mob_pummeller' WHERE `entry`=33344;
UPDATE `creature_template` SET `ScriptName`='mob_boombot' WHERE `entry`=33346;
UPDATE `creature_template` SET `ScriptName`='mob_void_zone' WHERE `entry`=34001;
UPDATE `creature_template` SET `ScriptName`='mob_life_spark' WHERE `entry`=34004;
UPDATE `creature_template` SET `ScriptName`='mob_rune_of_summoning' WHERE `entry`=33051;
UPDATE `creature_template` SET `ScriptName`='boss_algalon' WHERE `entry`=32871;
UPDATE `creature_template` SET `ScriptName`='mob_collapsing_star' WHERE `entry`=32955;
UPDATE `creature_template` SET `ScriptName`= 'mob_iron_construct' WHERE `entry` = 33121;
UPDATE `creature_template` SET `ScriptName`= 'mob_darkrune_watcher' WHERE `entry` = 33453;
UPDATE `creature_template` SET `ScriptName`= 'mob_darkrune_sentinel' WHERE `entry` = 33846;
UPDATE `creature_template` SET `ScriptName`= 'mob_darkrune_guardian' WHERE `entry` = 33388;
UPDATE `creature_template` SET `ScriptName`= 'mob_devouring_flame' WHERE `entry` = 34188;
UPDATE `creature_template` SET `ScriptName`= 'npc_expedition_commander_ulduar' WHERE `entry` = 33210;
UPDATE `creature_template` SET `ScriptName`= 'mole_machine_trigger' WHERE `entry` = 33282;
UPDATE `creature_template` SET `ScriptName`= 'mob_focused_eyebeam' WHERE `entry` IN (33632, 33802);
UPDATE `creature_template` SET `ScriptName`= 'mob_left_arm' WHERE `entry` = 32933;
UPDATE `creature_template` SET `ScriptName`= 'mob_right_arm' WHERE `entry` = 32934;
UPDATE `creature_template` SET `ScriptName`= 'boss_steelbreaker' WHERE `entry` = 32867;
UPDATE `creature_template` SET `ScriptName`= 'boss_runemaster_molgeim' WHERE `entry` = 32927;
UPDATE `creature_template` SET `ScriptName`= 'boss_stormcaller_brundir' WHERE `entry` = 32857;
UPDATE `creature_template` SET `ScriptName`='mob_rune_of_power' WHERE entry = 33705;
UPDATE `creature_template` SET `ScriptName`='mob_lightning_elemental' WHERE entry = 32958;
UPDATE `creature_template` SET `ScriptName`= 'feral_defender_trigger' WHERE `entry` = 34096;
UPDATE `creature_template` SET `ScriptName`= 'mob_feral_defender' WHERE `entry` = 34035;
UPDATE `creature_template` SET `ScriptName`= 'mob_sanctum_sentry' WHERE `entry` = 34014;
UPDATE `creature_template` SET `ScriptName`= 'seeping_trigger' WHERE `entry` = 34098;
UPDATE `creature_template` SET `ScriptName`= 'npc_keeper_norgannon' WHERE `entry` = 33686;
UPDATE `creature_template` SET `ScriptName`= 'boss_hodir' WHERE `entry` = 32845;
UPDATE `creature_template` SET `ScriptName`= 'mob_flash_freeze' WHERE `entry` = 32938;
UPDATE `creature_template` SET `ScriptName`= 'mob_icicle' WHERE `entry` = 33169;
UPDATE `creature_template` SET `ScriptName`= 'mob_icicle_snowdrift' WHERE `entry` = 33173;
UPDATE `creature_template` SET `ScriptName`= 'mob_hodir_priest' WHERE `entry` IN (32897, 33326, 32948, 33330);
UPDATE `creature_template` SET `ScriptName`= 'mob_hodir_shaman' WHERE `entry` IN (33328, 32901, 33332, 32950);
UPDATE `creature_template` SET `ScriptName`= 'mob_hodir_druid' WHERE `entry` IN (33325, 32900, 32941, 33333);
UPDATE `creature_template` SET `ScriptName`= 'mob_hodir_mage' WHERE `entry` IN (32893, 33327, 33331, 32946);
UPDATE `creature_template` SET `ScriptName`= 'toasty_fire' WHERE `entry` = 33342;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_brightleaf' WHERE `entry` =32915;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_ironbranch' WHERE `entry` =32913;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_stonebark' WHERE `entry` =32914;
UPDATE `creature_template` SET `ScriptName` = 'creature_sun_beam'WHERE `entry` =33170;
UPDATE `creature_template` SET `ScriptName` = 'creature_iron_roots' WHERE `entry` = 33168;
UPDATE `creature_template` SET `ScriptName` = 'boss_freya' WHERE `entry` =32906;
UPDATE `creature_template` SET `ScriptName` = 'creature_eonars_gift' WHERE `entry` =33228;
UPDATE `creature_template` SET `ScriptName` = 'creature_nature_bomb' WHERE `entry` =34129;
UPDATE `creature_template` SET `ScriptName` = 'creature_detonating_lasher' WHERE `entry` =32918;
UPDATE `creature_template` SET `ScriptName` = 'creature_ancient_conservator' WHERE `entry` =33203;
UPDATE `creature_template` SET `ScriptName` = 'creature_storm_lasher' WHERE `entry` =32919;
UPDATE `creature_template` SET `ScriptName` = 'creature_snaplasher' WHERE `entry` =32916;
UPDATE `creature_template` SET `ScriptName` = 'creature_ancient_water_spirit' WHERE `entry` =33202;
UPDATE `creature_template` SET `ScriptName` = 'creature_healthy_spore' WHERE `entry` =33215;
UPDATE `creature_template` SET `ScriptName` = 'creature_unstable_sun_beam' WHERE `entry` = 33050;
UPDATE `creature_template` SET `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;
UPDATE `creature_template` SET `ScriptName` = 'mob_scorch_ground' WHERE `entry` = 33221;
UPDATE `creature_template` SET `ScriptName` = 'mob_pre_phase' WHERE `entry` IN (32882, 32908, 32885, 33110);
UPDATE `creature_template` SET `ScriptName` = 'mob_arena_phase' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875);
UPDATE `creature_template` SET `ScriptName` = 'mob_runic_colossus' WHERE `entry` = 32872;
UPDATE `creature_template` SET `ScriptName` = 'mob_rune_giant' WHERE `entry` = 32873;
UPDATE `creature_template` SET `ScriptName` = 'thorim_trap_bunny' WHERE `entry` IN (33725, 33282);
UPDATE `creature_template` SET `ScriptName` = 'thorim_energy_source' WHERE `entry` = 32892;
UPDATE `creature_template` SET `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 33725;
UPDATE `creature_template` SET `ScriptName` = 'thorim_phase_trigger' WHERE `entry` = 32892;
UPDATE `creature_template` SET `ScriptName` = 'mob_pre_phase' WHERE `entry` IN (32907, 32883);
UPDATE `creature_template` SET `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33282;
UPDATE `creature_template` SET `ScriptName` = 'go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
UPDATE `creature_template` SET `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33245;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 33282;
UPDATE `creature_template` SET `ScriptName` = 'boss_mimiron' WHERE entry = 33350;
UPDATE `creature_template` SET `ScriptName` = 'boss_leviathan_mk' WHERE entry = 33432;
UPDATE `creature_template` SET `ScriptName` = 'boss_leviathan_mk_turret' WHERE entry = 34071;
UPDATE `creature_template` SET `ScriptName` = 'mob_proximity_mine' WHERE entry = 34362;
UPDATE `creature_template` SET `ScriptName` = 'boss_vx_001'WHERE `entry` = 33651;
UPDATE `creature_template` SET `ScriptName` = 'boss_aerial_unit'WHERE `entry` = 33670;
UPDATE `creature_template` SET `ScriptName` = 'mob_boom_bot' WHERE `entry` = 33836;
UPDATE `creature_template` SET `ScriptName` = 'rocket_strike' WHERE `entry` = 34047;
UPDATE `creature_template` SET `ScriptName` = 'magnetic_core' WHERE `entry` = 34068;
UPDATE `creature_template` SET `ScriptName` = 'boss_general_vezax' WHERE `entry` = 33271;
UPDATE `creature_template` SET `ScriptName` = 'mob_saronite_vapors' WHERE `entry` = 33488;
UPDATE `creature_template` SET `ScriptName` = 'mob_saronite_animus' WHERE `entry` = 33524;
UPDATE `creature_template` SET `ScriptName` = 'mob_mimiron_flame' WHERE `entry` = 34363;
UPDATE `creature_template` SET `ScriptName` = 'mob_frost_bomb' WHERE `entry` = 34149;
UPDATE `creature_template` SET `ScriptName` = 'mob_junk_bot' WHERE `entry` = 33855;
UPDATE `creature_template` SET `ScriptName` = 'mob_assault_bot' WHERE `entry` = 34057;
UPDATE `creature_template` SET `ScriptName` = 'mob_boom_bot' WHERE `entry` = 33836;
UPDATE `creature_template` SET `ScriptName` = 'mob_emergency_bot' WHERE `entry` = 34147;
UPDATE `creature_template` SET `ScriptName` = 'npc_keeper_image' WHERE `entry` IN (33213, 33241, 33242, 33244);
UPDATE `creature_template` SET `ScriptName`='boss_thorim' WHERE (`entry`='32865');
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_freya' WHERE `entry` = 33410;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_hodir' WHERE `entry` = 33411;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_mimiron' WHERE `entry` = 33412;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_thorim' WHERE `entry` = 33413;
UPDATE `creature_template` SET `ScriptName` = 'npc_sanity_well' WHERE `entry` = 33991;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_ironbranch' WHERE `entry` =32913;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_stonebark' WHERE `entry` =32914;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_brightleaf' WHERE `entry` =32195;
UPDATE `creature_template` SET `ScriptName` = 'creature_iron_roots' WHERE `entry` =33088;
UPDATE `creature_template` SET `ScriptName` = 'creature_sun_beam' WHERE `entry` =33170;
UPDATE `creature_template` SET `ScriptName` = 'mob_colossus' WHERE `entry` = 33237;
UPDATE `creature_template` SET `ScriptName` = 'npc_sif' WHERE `entry` = 33196;
-- I set here this scriptname because I thi we are using a entrie script and them this is correct
-- When we use it we have another error thorim_phase_trigger because this scriptname is assigned to this NPC from TC
UPDATE `creature_template` SET `flags_extra` = 0, `ScriptName` = 'thorim_energy_source' WHERE `entry` = 32892;

-- Icecrown Citadel
-- First declaring scripts names
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry` IN (37813,38508,36626,36855,38222,36678,37697,36853,36597,38995,36633,36609,37695,38757,36701,36725,37011,36724,37012,37007,36811,36807,36829,36844,36808,38135,37949,36627,36897,36899,37973,37970,37972,36789,38429,38068,38369,38332,38454,38422,38451);

# Boss
UPDATE `creature_template` SET `ScriptName`='boss_blood_queen_lanathel' WHERE (`entry`='37955');
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_keleset_icc' WHERE `entry` = 37972;
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_taldaram_icc' WHERE `entry` = 37973;
UPDATE `creature_template` SET `ScriptName`='boss_blood_council' WHERE (`entry`='37970');
UPDATE `creature_template` SET `ScriptName`='boss_festergut' WHERE (`entry`='36626');
UPDATE `creature_template` SET `ScriptName`='boss_deathbringer_saurfang' WHERE (`entry`='37813');
UPDATE `creature_template` SET `ScriptName`='boss_professor_putricide' WHERE (`entry`='36678');
UPDATE `creature_template` SET `ScriptName`='boss_sindragosa' WHERE (`entry`='36853');
UPDATE `creature_template` SET `ScriptName`='boss_valithria' WHERE `entry` = 36789;
UPDATE `creature_template` SET `ScriptName`='boss_the_lich_king' WHERE (`entry`='36597');
UPDATE `creature_template` SET `ScriptName`='boss_rotface' WHERE `entry`= 36627;

-- Script_names segun TC
UPDATE `creature_template` SET `ScriptName`='boss_lord_marrowgar' WHERE `entry`=36612;
UPDATE `creature_template` SET `ScriptName`='boss_lady_deathwhisper' WHERE `entry`=36855;

# Mobs
UPDATE `creature_template` SET `ScriptName`='npc_tirion_icc' WHERE (`entry`='38995');
UPDATE `creature_template` SET `ScriptName`='npc_swarming_shadows' WHERE (`entry`='38163');
UPDATE `creature_template` SET `ScriptName`='npc_bloodbeast' WHERE (`entry`='38508');
UPDATE `creature_template` SET `ScriptName`='npc_volatile_ooze' WHERE (`entry`='37697');  
UPDATE `creature_template` SET `ScriptName`='npc_ice_puls_icc' WHERE (`entry`='36633');
UPDATE `creature_template` SET `ScriptName`='npc_valkyr_icc' WHERE (`entry`='36609');
UPDATE `creature_template` SET `ScriptName`='npc_ghoul_icc' WHERE (`entry`='37695');
UPDATE `creature_template` SET `ScriptName`='npc_defile_icc' WHERE (`entry`='38757');
UPDATE `creature_template` SET `ScriptName`='npc_raging_spirit_icc' WHERE (`entry`='36701');
UPDATE `creature_template` SET `ScriptName`='npc_ooze_little' WHERE `entry`= 36897;
UPDATE `creature_template` SET `ScriptName`='npc_ooze_big' WHERE `entry`= 36899;
UPDATE `creature_template` SET `ScriptName`='npc_nerubar_brood_keeper' WHERE `entry` = 36725;
UPDATE `creature_template` SET `ScriptName`='npc_the_damned' WHERE `entry` = 37011;
UPDATE `creature_template` SET `ScriptName`='npc_servant_of_the_throne' WHERE `entry` = 36724;
UPDATE `creature_template` SET `ScriptName`='npc_ancient_skeletal_soldier' WHERE `entry` = 37012;
UPDATE `creature_template` SET `ScriptName`='npc_death_bound_ward' WHERE `entry` = 37007;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_attedant' WHERE `entry` = 36811;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_disciple' WHERE `entry` = 36807;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_high_priest' WHERE `entry` = 36829;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_servant' WHERE `entry` = 36844;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_zealot' WHERE `entry` = 36808;
UPDATE `creature_template` SET `ScriptName`='npc_skellmage_icc' WHERE `entry` = 37868;
UPDATE `creature_template` SET `ScriptName`='npc_fireskell_icc' WHERE `entry` = 36791;
UPDATE `creature_template` SET `ScriptName`='npc_suppressor_icc' WHERE `entry` = 37863;
UPDATE `creature_template` SET `ScriptName`='npc_manavoid_icc' WHERE `entry` = 38068;
UPDATE `creature_template` SET `ScriptName`='npc_glutabomination_icc' WHERE `entry` = 37886;
UPDATE `creature_template` SET `ScriptName`='npc_blistzombie_icc' WHERE `entry` = 37934;
UPDATE `creature_template` SET `ScriptName`='npc_dreamcloud_icc' WHERE `entry` = 37985;
UPDATE `creature_template` SET `ScriptName`='npc_dreamportal_icc' WHERE `entry` = 37945;
UPDATE `creature_template` SET `ScriptName`='npc_nucleus_icc' WHERE `entry`=38369;
UPDATE `creature_template` SET `ScriptName`='npc_fireball_icc' WHERE `entry`=38332;
UPDATE `creature_template` SET `ScriptName`='npc_bomb_icc' WHERE `entry`=38454;
UPDATE `creature_template` SET `ScriptName`='npc_vortex_icc' WHERE `entry`=38422;
UPDATE `creature_template` SET `ScriptName`='npc_empfireball_icc' WHERE `entry`=38451;
UPDATE `creature_template` SET `ScriptName`='npc_precious' WHERE (`entry`='37217');
UPDATE `creature_template` SET `ScriptName`='npc_stinky_icc' WHERE (`entry`='37025');
UPDATE `creature_template` SET `ScriptName`='npc_coldflame' WHERE (`entry`='36672');
UPDATE `creature_template` SET `ScriptName`='npc_precious_icc' WHERE (`entry`='37217');
UPDATE `creature_template` SET `ScriptName`='npc_puddle_ooze' WHERE (`entry`='37690');
UPDATE `creature_template` SET `ScriptName`='npc_malleable_goo' WHERE (`entry`='38556');
UPDATE `creature_template` SET `ScriptName`='npc_abomination' WHERE (`entry`='37672');
UPDATE `creature_template` SET `ScriptName`='npc_spinestalker' WHERE (`entry`='37534');
UPDATE `creature_template` SET `ScriptName`='npc_rimefang' WHERE (`entry`='37533');
UPDATE `creature_template` SET `ScriptName`='npc_ice_tomb' WHERE (`entry`='36980');
UPDATE `creature_template` SET `ScriptName`='npc_frost_bomb' WHERE (`entry`='37186');
UPDATE `creature_template` SET `ScriptName`='npc_shambling_horror' WHERE (`entry`='37698');
UPDATE `creature_template` SET `ScriptName`='npc_terenas_menethil' WHERE (`entry`='36823');
UPDATE `creature_template` SET `ScriptName`='npc_spirit_warden' WHERE (`entry`='36824');
UPDATE `creature_template` SET `ScriptName`='npc_sister_svalna' WHERE `entry` = '37126';
UPDATE `creature_template` SET `ScriptName` = 'npc_impaling_spear' WHERE `entry` = '38248';
UPDATE `creature_template` SET `ScriptName` = 'npc_gas_cloud' WHERE `entry` = '37562';
UPDATE `creature_template` SET `ScriptName`='lanathel_intro' WHERE (`entry`='38004');
UPDATE `creature_template` SET `vehicleId`=533 WHERE `entry`=36619;
UPDATE `creature_template` SET `ScriptName`='npc_choke_bomb' WHERE (`entry`='38159');
UPDATE `creature_template` SET `ScriptName`='npc_sticky_ooze' WHERE (`entry`='37006');
UPDATE `creature_template` SET `ScriptName`='npc_flood_ooze' WHERE (`entry`='37013');

-- Script_names segun TC
UPDATE `creature_template` SET `ScriptName`='npc_bone_spike' WHERE `entry`=38711;
UPDATE `creature_template` SET `ScriptName`='npc_cult_fanatic' WHERE `entry` IN (37890,38009,38135);
UPDATE `creature_template` SET `ScriptName`='npc_cult_adherent' WHERE `entry` IN(37949,38010,38136);
UPDATE `creature_template` SET `ScriptName`='npc_vengeful_shade' WHERE `entry`=38222;

-- Halls of Reflection
-- Cleanup first
UPDATE `creature_template` SET `Scriptname`=' ' WHERE `entry` IN (38112,38113,37221,37223,38175,38172,38567,38177,38173,38176);

UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRintro' WHERE `entry` IN (37221, 37223);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_falric' WHERE `entry` IN (38112);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_marwyn' WHERE `entry` IN (38113);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_lich_king_hr' WHERE `entry` IN (36954);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_hor' WHERE `entry` IN (37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRextro' WHERE `entry` IN (36955, 37554);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='generic_creature' WHERE `entry` IN (36940,36941,37069);
UPDATE `creature_template` SET `ScriptName`='generic_creature' WHERE `entry` IN (38177,38176,38173,38172,38567,38175);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_frostworn_general' WHERE `entry`=36723;
update `creature_template` set `AIName`='', `Scriptname`='npc_raging_gnoul' where `entry` in (36940);
update `creature_template` set `AIName`='', `Scriptname`='npc_risen_witch_doctor' where `entry` in (36941);
update `creature_template` set `AIName`='', `Scriptname`='npc_abon' where `entry` in (37069);

-- Argent quest
-- Scriptname for training_dummy_argent
-- with this now you can ride the mount and use the skills on the dummies
UPDATE `creature_template` SET `ScriptName`='npc_training_dummy_argent' WHERE `entry` IN ('33172','33243');
-- Add Scripts to NPCs
UPDATE `creature_template` SET `ScriptName`='npc_quest_givers_argent_tournament' WHERE `entry` IN (33593, 33592, 33225, 33312, 33335, 33379, 33373, 33361, 33403, 33372);
UPDATE `creature_template` SET `ScriptName`='npc_quest_givers_for_crusaders' WHERE `entry` IN (34882, 35094);
UPDATE `creature_template` SET `ScriptName`='npc_crusader_rhydalla' WHERE `entry`=33417;
UPDATE `creature_template` SET `ScriptName`='npc_eadric_the_pure' WHERE `entry`=33759;
UPDATE `creature_template` SET `ScriptName`='npc_crok_scourgebane' WHERE `entry`=33762;
UPDATE `creature_template` SET `ScriptName`='npc_valis_windchaser' WHERE `entry`=33974;
UPDATE `creature_template` SET `ScriptName`='npc_rugan_steelbelly' WHERE `entry`=33972;
UPDATE `creature_template` SET `ScriptName`='npc_jeran_lockwood' WHERE `entry`=33973;
UPDATE `creature_template` SET `Scriptname`='npc_justicar_mariel_trueheart' WHERE `entry` = '33817';
UPDATE `creature_template` SET `Scriptname`='npc_vendor_argent_tournament' WHERE `entry` IN(33553,33554,33556,33555,33557,33307,33310,33653,33650,33657);
-- Quest 13666 & 13673:  Une lame digne d'un champion!
-- Lake Frog
-- Maiden Of Ahswood Lake
UPDATE `creature_template` SET `ScriptName` = 'npc_lake_frog' WHERE `creature_template`.`entry` =33211 LIMIT 1 ;
UPDATE `creature_template` SET `npcflag` = `npcflag` | 1, `ScriptName` = 'npc_maiden_of_ashwood_lake' WHERE `creature_template`.`entry` =33220;
UPDATE `creature_template` SET `InhabitType`=5, `ScriptName`='npc_maiden_of_drak_mar' WHERE `entry`=33273;

-- Quest Free your mind
-- Leaper
UPDATE `creature_template` SET `ScriptName`='npc_leaper' WHERE `entry`='29840';
-- Lady Nightswood
UPDATE `creature_template` SET `ScriptName`='npc_lady_nightswood' WHERE `entry`='29770';
-- The Vile
UPDATE `creature_template` SET `ScriptName`='npc_vile' WHERE `entry`='29769';

-- Declaring zones
UPDATE `instance_template` SET `script` = 'instance_eye_of_eternity' WHERE `map`= 616;
UPDATE `instance_template` SET `script` = 'instance_obsidian_sanctum' WHERE `map`= 615;
UPDATE `instance_template` SET `script` = 'instance_oculus' WHERE `map`= 578;
UPDATE `instance_template` SET `script` = 'instance_ruby_sanctum' WHERE `map`= 724;
UPDATE `instance_template` SET `script` = 'instance_trial_of_the_champion' WHERE `map`= 650;
UPDATE `instance_template` SET `script` = 'instance_ulduar' WHERE `map`= 603;
UPDATE `instance_template` SET `script`=  'instance_icecrown_citadel' WHERE `map`= 631;
UPDATE `instance_template` SET `script` = 'instance_halls_of_reflection' WHERE `map`= 668;

-- Segun TC
UPDATE `instance_template` SET `script`='instance_trial_of_the_crusader' WHERE `map`=649;

-- Is fix here if not "error" - Lo implemento aqui sino da error
DELETE FROM gameobject_template WHERE entry = '194438';
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');

-- Gameobject
UPDATE `gameobject_template` SET `ScriptName` = 'go_malygos_iris' WHERE `entry` IN (193960,193958); 
UPDATE `gameobject_template` SET `ScriptName` = 'go_firefield' WHERE `entry` = '203005';
UPDATE `gameobject_template` SET `ScriptName`= '' WHERE `entry` IN (194375,194371,194370,194377);
UPDATE `gameobject_template` SET `ScriptName`='ulduar_teleporter' WHERE `entry`=194569;
UPDATE `gameobject_template` SET `ScriptName` = 'icecrown_teleporter' WHERE `entry` IN (202223,202235,202242,202243,202244,202245,202246);
UPDATE `gameobject_template` SET `ScriptName` = 'go_call_tram' WHERE `entry` = 194438;
UPDATE `gameobject_template` SET `ScriptName` = 'not_push_button' WHERE `entry` = 194739;


-- WG
DELETE FROM `outdoorpvp_template` WHERE `TypeId` IN (7);
INSERT INTO `outdoorpvp_template` (`TypeId`, `ScriptName`, `Comment`) VALUES (7, 'outdoorpvp_wg', 'Wintergrasp');

-- Clean error from started
-- This delete was on Ulduar sql but i move here for start server with any error
DELETE FROM `script_waypoint` WHERE `entry`=33370;


-- ------------------------------------------------------------------------------------------------------------------------------------------- --
-- -------------- FINISH SCRIPT NAMES ------------------------ FINISH SCRIPT NAMES --------------------- FINISH SCRIPT NAMES ----------------- --
-- ------------------------------------------------------------------------------------------------------------------------------------------- --