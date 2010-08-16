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

-- Patch acherus
DELETE FROM `creature_template` WHERE `entry` = 438700;
INSERT INTO `creature_template` VALUES (438700, 0, 0, 0, 0, 0, 18, 0, 18, 0, 'Acherus_porter', NULL, NULL, 0, 80, 80, 0, 35, 35, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `faction_A`=2082 WHERE `entry`=438700;
UPDATE `creature_template` SET `faction_H`=2082 WHERE `entry`=438700;
UPDATE `creature_template` SET `npcflag`=1 WHERE `entry`=438700;
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=438700;
UPDATE `creature_template` SET `flags_extra`=130 WHERE `entry`=438700;
DELETE FROM `creature` WHERE `id`=438700;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(438700, 0, 1, 256, 0, 0, 2390.19, -5641.09, 378.069, 0.760892, 300, 0, 0, 5342, 0, 0, 0),
(438700, 609, 1, 1, 0, 0, 2386.42, -5643.42, 420.97, 0.629104, 300, 0, 0, 5342, 0, 0, 0),
(438700, 609, 1, 1, 0, 0, 2392.36, -5639.5, 377.518, 0.616926, 300, 0, 0, 5342, 0, 0, 0),
(438700, 0, 1, 65535, 0, 0, 2386.39, -5643.9, 421.156, 3.57475, 25, 0, 0, 12, 12, 0, 0);

-- Argent Tournament
UPDATE gameobject SET state = 0 WHERE id = 194618;
DELETE FROM `gameobject_loot_template` WHERE entry = 194618;
INSERT INTO `gameobject_loot_template` VALUES(
194618, 46070, 100, 1, 0, 1, 1);
UPDATE quest_template SET QuestFlags = 0 WHERE entry = 13678;
UPDATE quest_template SET NextQuestId = 0 WHERE NextQuestId = 13678;
UPDATE quest_template SET ReqCreatureOrGOId1 = 24108 WHERE entry = 13679;
UPDATE quest_template SET NextQuestId = 0 WHERE NextQuestId = 13672;
UPDATE creature_template SET mindmg = 500, maxdmg = 800 WHERE entry = 33448;
UPDATE creature_template SET ScriptName = 'npc_squire_danny' WHERE entry = 33518;
UPDATE creature_template SET mindmg = 650, maxdmg = 1000, ScriptName = 'npc_argent_champion' WHERE entry = 33707;
UPDATE quest_template SET PrevQuestId = 13680 WHERE PrevQuestId = 13687;
UPDATE quest_template SET PrevQuestId = 13679 WHERE PrevQuestId = 13686;
UPDATE quest_template SET ReqSourceId2 = 0, ReqSourceCount2 = 0 WHERE ReqSourceId2 = 45000;
UPDATE item_template SET maxcount = 1 WHERE entry = 45005;
UPDATE creature_template SET  ScriptName = 'npc_argent_valiant' WHERE entry = 33448;

-- script boreal tundra
-- Fizzcrank Fullthrottle
UPDATE creature_template SET  ScriptName = 'npc_fizzcrank_fullthrottle' WHERE entry = 25590;
-- Surristrasz
UPDATE creature_template SET  ScriptName = 'npc_surristrasz' WHERE entry =24795;
-- Librarian Tiare
UPDATE creature_template SET  ScriptName = 'npc_tiare' WHERE entry =30051;

UPDATE instance_template SET script = 'instance_eye_of_eternity' WHERE map = 616;
UPDATE creature_template SET VehicleId=264 WHERE entry = 30248;
UPDATE `gameobject_template` SET `ScriptName` = 'go_malygos_iris' WHERE `entry` IN (193960,193958); 

UPDATE creature_template SET ScriptName = 'boss_malygos', unit_flags = unit_flags & ~256 WHERE entry = 28859;
UPDATE creature_template SET ScriptName = 'mob_nexus_lord' WHERE entry = 30245; -- Nexus Lord
UPDATE creature_template SET ScriptName = 'mob_scion_of_eternity' WHERE entry = 30249; -- Scion of Eternity
UPDATE creature_template SET ScriptName = 'mob_power_spark' WHERE entry = 30084;  -- Power Spark
UPDATE creature_template SET ScriptName = 'npc_arcane_overload' WHERE entry = 30282; -- Arcane Overload

UPDATE creature_template SET unit_flags = 1 WHERE entry = 28859;

UPDATE creature_template SET mindmg = 3684, maxdmg = 4329, dmg_multiplier = 7.5, mechanic_immune_mask = 1072918979 WHERE entry = 30245; -- Nexus Lord
UPDATE creature_template SET mindmg = 3684, maxdmg = 4329, dmg_multiplier = 13,  mechanic_immune_mask = 1072918979 WHERE entry = 31750; -- Nexus Lord (1)
UPDATE creature_template SET mechanic_immune_mask = 1072918979 WHERE entry IN (30249, 31751);

DELETE FROM creature WHERE id = 33224;
INSERT INTO creature (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33224, 571, 1, 1, 0, 0, 3730.57, -4302.91, 182.097, 2.35789, 300, 0, 0, 40, 120, 0, 0),  
(33224, 571, 1, 1, 0, 0, 3726.49, -4312.76, 179.671, 1.68559, 300, 0, 0, 40, 120, 0, 0),  
(33224, 571, 1, 1, 0, 0, 3714.32, -4311.07, 181.014, 0.81772, 300, 0, 0, 40, 120, 0, 0),  
(33224, 571, 1, 1, 0, 0, 3715.14, -4305.41, 182.313, 1.36436, 300, 0, 0, 40, 120, 0, 0),
(33224, 571, 1, 1, 0, 0, 3723.58, -4306.54, 182.245, 1.89215, 300, 0, 0, 40, 120, 0, 0);  

UPDATE `gameobject_template` SET `data10` = 26572 WHERE `entry`=180912;
UPDATE `gameobject_template` SET `data10` = 26566 WHERE `entry`=180911;

/*
-- achievement realm first magic seeker non-existing criteria Entry: 1400
DELETE FROM achievement_criteria_data WHERE criteria_id = 1400;
INSERT INTO achievement_criteria_data VALUES
(1400, 1, 28859, 0);
*/

UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 30090;
UPDATE creature_template SET flags_extra = flags_extra | 2, faction_A = 35, faction_H = 35, VehicleId = 165 WHERE entry IN (30234, 30248);
UPDATE creature_template SET flags_extra = flags_extra | 2, faction_A = 35, faction_H = 35 WHERE entry = 30118;
UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 30282;
UPDATE creature_template SET mindmg = 1, maxdmg = 1, dmg_multiplier = 1 WHERE entry = 30592;
UPDATE creature_template SET modelid1 = 11686, modelid2 = 11686 WHERE entry = 22517;
-- Wyrmest Drake Spell & mount
UPDATE creature_template SET spell1 = 56091, spell2 = 56092, spell3 = 57090, spell4 = 57143, spell5 = 57108, spell6 = 57403, VehicleId = 165 WHERE entry IN (30161, 31752);
-- add de malygos & gameobject
UPDATE gameobject_template SET flags = 4, data0 = 43 WHERE entry in (193967, 193905);

-- Aggro Malygos
UPDATE creature_model_info SET combat_reach = '30' WHERE modelid = 26752;

-- drakes_disks
UPDATE creature_template SET InhabitType = 4, VehicleId = 223 WHERE entry IN (30234, 30248);
UPDATE creature_template SET spell6 = 57092, spell7 = 57403 WHERE entry IN (30161, 31752);

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

#Icecrown Citadel
#Cleanup first

UPDATE `creature_template` SET `ScriptName`='' WHERE `entry` IN (37813,38508,36626,36855,38222,36672,36612,38711,36678,37697,36853,36597,38995,36633,36609,37695,38757,36701,36725,37011,36724,37012,37007,36811,36807,36829,36844,36808,38135,37949,36627,36897,36899,37973,37970,37972,36789,38429,38068,38369,38332,38454,38422,38451);
UPDATE `gameobject_template` SET `ScriptName`='' WHERE `entry` IN (202235,202242,202244,202243,202245,202246,202182,202181);
DELETE FROM `creature` WHERE `id`=38995;

# GameObject
UPDATE `gameobject_template` SET `ScriptName` = 'icecrown_teleporter' WHERE `entry` IN (202223,202235,202242,202243,202244,202245,202246);
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 202223;
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 202242;

# Boss
UPDATE `creature_template` SET `ScriptName`='boss_blood_queen_lanathel' WHERE (`entry`='37955');
UPDATE `creature_template` SET `ScriptName`='boss_festergut' WHERE (`entry`='36626');
UPDATE `creature_template` SET `ScriptName`='boss_saurfang' WHERE (`entry`='37813');
UPDATE `creature_template` SET `ScriptName`='boss_lady_deathwisper' WHERE (`entry`='36855');
UPDATE `creature_template` SET `ScriptName`='boss_professor_putricide' WHERE (`entry`='36678');
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_valanar_icc' WHERE `entry` = 37970;
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_keleset_icc' WHERE `entry` = 37972;
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_taldaram_icc' WHERE `entry` = 37973;
UPDATE `creature_template` SET `ScriptName`='boss_sindragosa' WHERE (`entry`='36853');
UPDATE `creature_template` SET `ScriptName`='boss_valithria' WHERE `entry` = 36789;
UPDATE `creature_template` SET `ScriptName`='boss_the_lich_king' WHERE (`entry`='36597');
UPDATE `creature_template` SET `ScriptName`='boss_rotface' WHERE `entry`= 36627;
UPDATE `creature_template` SET `ScriptName`='boss_lord_marrowgar' WHERE (`entry`='36612');

# Mobs
UPDATE `creature_template` SET `ScriptName`='npc_tirion_icc' WHERE (`entry`='38995');
UPDATE `creature_template` SET `ScriptName`='npc_swarming_shadows' WHERE (`entry`='38163');
UPDATE `creature_template` SET `ScriptName`='npc_bloodbeast' WHERE (`entry`='38508');
UPDATE `creature_template` SET `ScriptName`='npc_cold_flame' WHERE (`entry`='36672');
UPDATE `creature_template` SET `ScriptName`='npc_bone_spike' WHERE (`entry`='38711'); 
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
UPDATE `creature_template` SET `ScriptName`='npc_cult_fanatic' WHERE `entry` = 38135;
UPDATE `creature_template` SET `ScriptName`='npc_cult_adherent' WHERE `entry` = 37949;
UPDATE `creature_template` SET `ScriptName`='npc_shade' WHERE `entry` = 38222;
UPDATE `creature_template` SET `ScriptName`='npc_skellmage_icc' WHERE `entry` = 37868;
UPDATE `creature_template` SET `ScriptName`='npc_fireskell_icc' WHERE `entry` = 36791;
UPDATE `creature_template` SET `ScriptName`='npc_suppressor_icc' WHERE `entry` = 37863;
UPDATE `creature_template` SET `ScriptName`='npc_manavoid_icc' WHERE `entry` = 38068;
UPDATE `creature_template` SET `ScriptName`='npc_glutabomination_icc' WHERE `entry` = 37886;
UPDATE `creature_template` SET `ScriptName`='npc_blistzombie_icc' WHERE `entry` = 37934;
UPDATE `creature_template` SET `ScriptName`='npc_dreamcloud_icc' WHERE `entry` = 37985;
UPDATE `creature_template` SET `ScriptName`='npc_dreamportal_icc' WHERE `entry` = 37945;
UPDATE `creature_template` set `minlevel` = 80,`maxlevel` = 80,`faction_A` = 16,`Faction_H` = 16,`unit_flags` = 2 where `entry` in (36672);
UPDATE creature_template SET ScriptName='npc_nucleus_icc' WHERE entry=38369;
UPDATE creature_template SET ScriptName='npc_fireball_icc' WHERE entry=38332;
UPDATE creature_template SET ScriptName='npc_bomb_icc' WHERE entry=38454;
UPDATE creature_template SET ScriptName='npc_vortex_icc' WHERE entry=38422;
UPDATE creature_template SET ScriptName='npc_empfireball_icc' WHERE entry=38451;
UPDATE `creature_template` SET `ScriptName`='npc_precious' WHERE (`entry`='37217');
UPDATE `creature_template` SET `ScriptName`='npc_stinky' WHERE (`entry`='37025');

-- more scriptnames
UPDATE `creature_template` SET `ScriptName`='boss_blood_council' WHERE (`entry`='37970');
UPDATE `creature_template` SET `ScriptName`='npc_puddle_ooze' WHERE (`entry`='37690');
UPDATE `creature_template` SET `ScriptName`='npc_malleable_goo' WHERE (`entry`='38556');
UPDATE `creature_template` SET `ScriptName`='npc_abomination' WHERE (`entry`='37672');
UPDATE `creature_template` SET `ScriptName`='npc_spinestalker' WHERE (`entry`='37534');
UPDATE `creature_template` SET `ScriptName`='npc_rimefang' WHERE (`entry`='37533');
UPDATE `creature_template` SET `ScriptName`='npc_ice_tomb' WHERE (`entry`='36980');
UPDATE `creature_template` SET `ScriptName`='npc_frost_bomb' WHERE (`entry`='37186');
UPDATE `creature_template` SET `ScriptName`='npc_shambling_horror_icc' WHERE (`entry`='37698');
-- icecrown zone
UPDATE `creature_template` SET `ScriptName`='lanathel_intro' WHERE (`entry`='38004');

# Other
UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35', `unit_flags` = '8', `type_flags` = '67113038' WHERE `entry` IN(36789,10067,10068,10069);

# Instance
UPDATE `instance_template` SET `script`='instance_icecrown_citadel' WHERE (`map`='631');

# Script Texts

DELETE FROM script_texts WHERE entry <= -1665892 AND entry >= -1666080;
DELETE FROM script_texts WHERE entry <= -1810001 AND entry >= -1810031;

# 1
INSERT INTO `script_texts` VALUES ('36612', '-1665892', 'This is the beginning AND the end, mortals. None may enter the master''s sanctum!', '', '', '', '', '', '', '', '', '16950', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('36612', '-1665893', 'The Scourge will wash over this world as a swarm of death and destruction!', '', '', '', '', '', '', '', '', '16941', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('36612', '-1665894', 'BONE STORM!', '', '', '', '', '', '', '', '', '16946', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('36612', '-1665895', 'Bound by bone!', '', '', '', '', '', '', '', '', '16947', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36612', '-1665896', 'Stick Around!', '', '', '', '', '', '', '', '', '16948', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36612', '-1665897', 'The only escape is death!', '', '', '', '', '', '', '', '', '16949', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36612', '-1665898', 'More bones for the offering!', '', '', '', '', '', '', '', '', '16942', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36612', '-1665899', 'Languish in damnation!', '', '', '', '', '', '', '', '', '16943', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36612', '-1665900', 'I see... only darkness...', '', '', '', '', '', '', '', '', '16944', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36612', '-1665901', 'THE MASTER''S RAGE COURSES THROUGH ME!', '', '', '', '', '', '', '', '', '16945', '1', '0', '0', '');

# 2
INSERT INTO `script_texts` VALUES ('36855', '-1665902', 'You have found your way here, because you are among the few gifted with true vision in a world cursed with blindness!', '', '', '', '', '', '', '', '', '17272', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665903', 'You can see through the fog that hangs over this world like a shroud and grasp where true power lies!', '', '', '', '', '', '', '', '', '17273', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665904', 'Fix your eyes upon your crude hands! The sinew, the soft meat, the dark blood coursing within!', '', '', '', '', '', '', '', '', '16878', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665905', 'It is a weakness! A crippling flaw! A joke played by the creators upon their own creations!', '', '', '', '', '', '', '', '', '17268', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665906', 'The sooner you come to accept your condition as a defect, the sooner you will find yourselves in a position to transcend it!', '', '', '', '', '', '', '', '', '17269', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665907', 'Through our master all things are possible! His power is without limit, and his will unbending!', '', '', '', '', '', '', '', '', '17270', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665908', 'Those who oppose him will be destroyed utterly! And those who serve, who serve wholly, unquestioningly, with utter devotion of mind and soul? Elevated! To heights beyond your ken!', '', '', '', '', '', '', '', '', '17271', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665909', 'What is this disturbance?! You dare trespass upon this hallowed ground? This shall be your final resting place.', '', '', '', '', '', '', '', '', '16868', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665910', 'Enough! I see I must take matters into my own hands!', '', '', '', '', '', '', '', '', '16877', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665911', 'Take this blessing and show these intruders a taste of our master''s power.', '', '', '', '', '', '', '', '', '16873', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665912', 'I release you from the curse of flesh!', '', '', '', '', '', '', '', '', '16874', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665913', 'Arise and exalt in your pure form!', '', '', '', '', '', '', '', '', '16875', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665914', 'You are weak, powerless to resist my will!', '', '', '', '', '', '', '', '', '16876', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665915', 'This charade has gone on long enough.', '', '', '', '', '', '', '', '', '16872', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665916', 'All part of the masters plan! Your end is... inevitable!', '', '', '', '', '', '', '', '', '16871', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665917', 'Do you yet grasp of the futility of your actions?', '', '', '', '', '', '', '', '', '16869', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665918', 'Embrace the darkness... Darkness eternal!', '', '', '', '', '', '', '', '', '16870', '1', '0', '0', '');

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

# 4
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1665960,'For every Horde soldier that you killed, for every Alliance dog that fell, the Lich King''s armies grew. Even now the Val''kyr work to raise your fallen... As Scourge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665961,'Things are about to get much worse. Come, taste the power that the Lich King has bestowed upon me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665962,'A lone orc, against the might of the Alliance? Charge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665963,'Hahahaha! Dwarves.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665964,'Kor''kron, move out! Champions, watch your backs! The Scourge have been...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665965,'Join me, father. Join me and we will crush this world in the name of the Scourge. For the glory of the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665966,'My boy died at the Wrathgate. I am here only to collect his body!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665967,'Stubborn and old. What chance do you have? I am stronger and more powerful than you ever were!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665968,'We named him Dranosh. It means "Heart of Draenor" in Orcish. I would not let the warlocks take him. My boy would be safe, hidden away by the elders of Garadar.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665969,'I made a promise to his mother before she died: that I would cross the Dark Portal alone - whether I lived or died, my son would be safe. Untainted...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665970,'Today, I fulfill that promise.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665971,'High Overlord Saurfang charges!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665972,'Pathetic old orc. Come then heroes, come and face the might of the Scourge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665973,'BY THE MIGHT OF THE LICH KING!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16694,1,0,0,''),
(0,-1665974,'The ground runs red with your blood!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16699,1,0,0,''),
(0,-1665975,'Feast, my minions!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16700,1,0,0,''),
(0,-1665976,'You are nothing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16695,1,0,0,''),
(0,-1665977,'Your soul will find no redemption here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16696,1,0,0,''),
(0,-1665978,'I have become...DEATH!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16698,1,0,0,''),
(0,-1665979,'I... Am... Released.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16697,1,0,0,''),
(0,-1665980,'Muradin Bronzebeard gasps for air.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665981,'That was Saurfang''s boy - the Horde commander at the Wrath Gate. Such a tragic end...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665982,'What in the... There, in the distance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665983,'A Horde Zeppelin flies up to the rise',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665984,'Soldiers, fall in! Looks like the Horde are comin in to take another shot!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665985,'The Zeppelin docks, and High Overlord Saurfang hops out, confronting the Alliance soldiers and Muradin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665986,'Don''t force my hand, orc. We can''t let you pass.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665987,'Behind you lies the body of my only son. Nothing will keep me from him.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665988,'He... I can''t do it. Get back on your ship and we''ll spare your life.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665989,'Stand down, Muradin. Let a grieving father pass.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665990,'High Overlord Saurfang kneels over his son''s body.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665991,'[Orcish] No''ku kil zil''nok ha tar.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665992,'Higher Overlord Saurfang picks up the body of his son and walks over towards Varian',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665993,'I will not forget this kindess. I thank you, highness.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665994,'I... I was not at the Wrathgate. But the soldiers who survived told me much of what happened. Your son fought with honor. He died a hero''s death. He deserves a hero''s burial.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665995,'Lady Jaina Proudmoore cries.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665996,'Jaina, why are you crying?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665997,'It was nothing, your majesty. Just... I''m proud of my king.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665998,'Muradin, secure the deck and prepare our soldiers for an assault on the Upper Citadel. I''ll send out another regiment from Stormwind.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665999,'Let''s get the move then. Move out!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666000,'High Overlord Saurfang coughs.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666001,'High Overlord Saurfang weeps over the corpse of his son.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666002,'You will have a proper ceremony in Nagrand next to the pyres of your mother and ancestors.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666003,'Honor, young heroes... no matter how dire the battle... Never forsake it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'');

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
DELETE FROM `script_texts` where `entry` IN (-2500000);
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
(0,-2500000,'My cup runneth over.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16686,1,0,0,''),
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

DELETE FROM script_texts where `entry` in (-1900001,-1900002,-1900003,-1900004,-1900005,-1900006,-1900007);
INSERT INTO script_texts (entry,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8,sound,type,language,emote,comment)VALUES
(-1900001, 'You may have once fought beside me, Crok, but now you are nothing more than a traitor. Come, your second death approaches!',null,null,null,null,null,null,null,null,17017,1,0,0,''),
(-1900002, 'Miserable creatures, Die!',null,null,null,null,null,null,null,null,17018,1,0,0,''),
(-1900003, 'Foolish Crok, you brought my reinforcements with you! Arise Argent Champions and serve the Lich King in death!',null,null,null,null,null,null,null,null,17019,1,0,0,''),
(-1900004, 'Come Scourgebane, I''ll show the Lich King which one of us is truly worthy of the title, champion!',null,null,null,null,null,null,null,null,17020,1,0,0,''),
(-1900005, 'What a pitiful choice of an ally Crok.',null,null,null,null,null,null,null,null,17021,1,0,0,''),
(-1900006, 'What? They died so easily? No matter.',null,null,null,null,null,null,null,null,17022,1,0,0,''),
(-1900007, 'Perhaps... you were right... Crok.',null,null,null,null,null,null,null,null,17023,1,0,0,'');

DELETE FROM `gameobject_scripts` WHERE `id`=201584;
REPLACE INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`) VALUES
(201584, 0, 15, 70308, 0, '0'), -- transformation
(201584, 5000, 15, 70311, 0, '0'), -- transformation end
(201584, 5000, 13, 201584, 0, '0'); -- spawn

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38159, 0, 0, 0, 0, 0, 1126, 27823, 1126, 0, 'Choking Gas Bomb', '', '', 0, 80, 80, 2, 2068, 2068, 0, 1, 0, 422, 586, 0, 642, 1.4, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 345, 509, 103, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 4.71733, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_choke_bomb');
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (37006, 0, 0, 0, 0, 0, 1126, 11686, 1126, 0, 'Sticky Ooze', '', '', 0, 1, 1, 0, 16, 16, 0, 1, 0, 2, 2, 0, 24, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 1, 1, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 201786289, 0, 'npc_sticky_ooze');
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (37013, 0, 0, 0, 0, 0, 1126, 11686, 1126, 0, 'Puddle Stalker', '', '', 0, 1, 1, 0, 14, 14, 0, 1, 0, 2, 2, 0, 24, 1, 2000, 2000, 1, 33554432, 8, 0, 0, 0, 0, 0, 1, 1, 100, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2067619643, 0, 'npc_flood_ooze');
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`,  `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (37985, 0, 0, 0, 0, 0, 30877, 169, 30877, 0, 'Dream Cloud', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 1, 1, 1, 10, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2128592795, 0, 'npc_dreamcloud_icc');
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`,  `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38068, 0, 0, 0, 0, 0, 169, 11686, 169, 0, 'Mana Void', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 0, 307, 459, 0, 115, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 246, 367, 92, 10, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 71085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100677675, 0, 'npc_manavoid_icc');

DELETE FROM spell_linked_spell where `spell_trigger`='-69290' AND `spell_effect`='72103';
REPLACE INTO spell_linked_spell VALUES (-69290, 72103, 0, 'Festergut: Spores end => Inoculated');

DELETE FROM spell_linked_spell where `spell_trigger` IN ('70157','70117',69785,71340,65684,65686);
DELETE FROM spell_linked_spell where `spell_trigger`='-71224';
DELETE FROM spell_linked_spell where `spell_trigger`='-73022';
DELETE FROM spell_linked_spell where `spell_trigger`='-69783';
DELETE FROM spell_linked_spell where `spell_trigger`='-70308';

REPLACE INTO spell_linked_spell VALUES (70157, 71665, 1, 'Sindragosa: Frost Tomb => Asphyxiation');
REPLACE INTO spell_linked_spell VALUES (70117, 70122, 1, 'Sindragosa: Icy Grip Trigger => Icy Grip');
REPLACE INTO spell_linked_spell VALUES (-71224, 69706, 0, 'Rotface: Mutated Infection => Little Ooze');
REPLACE INTO spell_linked_spell VALUES (-73022, 69706, 0, 'Rotface: Mutated Infection HC => Little Ooze');
REPLACE INTO spell_linked_spell VALUES (-69783, 69785, 0, 'Rotface: Flood => Flood1');
REPLACE INTO spell_linked_spell VALUES (69785, 69788, 2, 'Rotface: Flood1 => Flood2');
REPLACE INTO spell_linked_spell VALUES (71340, 71341, 2, 'Lanathel: Darkfallen1 => Darkfallen2');
REPLACE INTO spell_linked_spell VALUES (-70308, 70311, 0, 'Abomination Transformation');
REPLACE INTO spell_linked_spell VALUES (65684, -65686, 0, 'Light Essence -> Dark Essence '); 
REPLACE INTO spell_linked_spell VALUES (65686, -65684, 0, 'Dark Essence -> Light Essence');

UPDATE creature_template SET ScriptName='boss_blood_council' WHERE entry=37970;
UPDATE creature_template SET ScriptName='boss_blood_elf_taldaram_icc' WHERE entry=37973;
UPDATE creature_template SET ScriptName='boss_blood_elf_keleset_icc' WHERE entry=37972;
UPDATE creature_template SET ScriptName='npc_nucleus_icc' WHERE entry=38369;
UPDATE creature_template SET ScriptName='npc_fireball_icc' WHERE entry=38332;
UPDATE creature_template SET ScriptName='npc_bomb_icc' WHERE entry=38454;
UPDATE creature_template SET ScriptName='npc_vortex_icc' WHERE entry=38422;
UPDATE creature_template SET ScriptName='npc_empfireball_icc' WHERE entry=38451; 

UPDATE `creature_template` SET `ScriptName` = 'boss_sindragosa' WHERE `entry` = '36853';
UPDATE `creature_template` SET `ScriptName` = 'npc_rimefang' WHERE `entry` = '37533';
UPDATE `creature_template` SET `ScriptName` = 'npc_spinestalker' WHERE `entry` = '37534';
UPDATE `creature_template` SET `ScriptName` = 'npc_ice_tomb' WHERE `entry` = '36980';
UPDATE `creature_template` SET `ScriptName` = 'npc_frost_bomb' WHERE `entry` = '37186';
UPDATE `creature_template` SET `ScriptName` = 'lanathel_intro' WHERE `entry` = '38004';
UPDATE `creature_template` SET `ScriptName` = 'npc_puddle_ooze' WHERE `entry` = '37690';
UPDATE `creature_template` SET `ScriptName` = 'npc_malleable_goo' WHERE `entry` = '38556';

UPDATE `creature_template` SET `ScriptName` = 'npc_sister_svalna' WHERE `entry` = '37126';
UPDATE `creature_template` SET `ScriptName` = 'npc_impaling_spear' WHERE `entry` = '38248';

REPLACE INTO spell_linked_spell VALUES (-74562, 74610, 0, 'Fiery Combustion removed -> Combustion');
REPLACE INTO spell_linked_spell VALUES (-74792, 74800, 0, 'Soul Consumption removed -> Consumption');

DELETE FROM `gameobject_scripts` WHERE `id`=201584;
REPLACE INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`) VALUES
(201584, 0, 15, 70308, 0, '0'), -- transformation
(201584, 5000, 15, 70311, 0, '0'), -- transformation end
(201584, 5000, 13, 201584, 0, '0'); -- spawn

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (34606, 0, 0, 0, 0, 0, 25144, 25144, 25144, 25144, 'Frost Sphere', '', '', 0, 80, 80, 2, 15, 15, 0, 1, 0, 420, 630, 0, 157, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 336, 504, 126, 8, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66193, 67855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0.238095, 1, 0, 0, 0, 0, 0, 0, 0, 721, 1, 0, 536961024, 0, 'frost_sphere');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34606);
INSERT INTO `creature_ai_scripts` VALUES 
(270000, 34606, 6, 0, 100, 7, 0, 0, 0, 0, 11, 66193, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Force Cast');


REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38159, 0, 0, 0, 0, 0, 27823, 27823, 27823, 0, 'Choking Gas Bomb', '', '', 0, 80, 80, 2, 2068, 2068, 0, 1, 0, 422, 586, 0, 642, 1.4, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 345, 509, 103, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 4.71733, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 118429499, 0, 'npc_choke_bomb');

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



DELETE FROM `gameobject_scripts` WHERE `id`=201584;
REPLACE INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`) VALUES
(201584, 0, 15, 70308, 0, '0'), -- transformation
(201584, 5000, 15, 70311, 0, '0'), -- transformation end
(201584, 5000, 13, 201584, 0, '0'); -- spawn



UPDATE `creature_template` SET `ScriptName` = 'npc_gas_cloud' WHERE `entry` = '37562';

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38332, 0, 0, 0, 0, 0, 26767, 19725, 26767, 0, 'Ball of Flame', '', '', 0, 1, 1, 0, 16, 16, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 1, 2, 0, 10, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 162, 1, 0, 0, 0, 'npc_fireball_icc');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38451, 0, 0, 0, 0, 0, 26767, 19725, 26767, 0, 'Ball of Inferno Flame', '', '', 0, 1, 1, 2, 16, 16, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 1, 2, 0, 10, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 162, 1, 0, 0, 0, 'npc_empfireball_icc');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38004, 0, 0, 0, 0, 0, 31093, 31093, 31093, 0, 'Blood-Queen Lana\'thel', '', '', 0, 80, 80, 2, 14, 14, 0, 1, 3, 1, 1, 0, 1, 2, 2000, 2000, 2, 16777220, 8, 0, 0, 0, 0, 0, 1, 1, 1, 6, 110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 861, 1, 0, 0, 0, 0, 0, 0, 0, 150, 1, 0, 1610612735, 0, 'lanathel_intro');

DELETE FROM `creature` WHERE `id`=38004;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(1084973, 38004, 631, 1, 128, 0, 0, 4689.4, 2766.9, 383.049, 3.47957, 300, 0, 0, 861, 60, 0, 0);

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38422, 0, 0, 0, 0, 0, 23258, 23258, 23258, 0, 'Shock Vortex', '', '', 0, 80, 80, 2, 16, 16, 0, 1, 1, 1, 1, 0, 1, 2, 2000, 2000, 1, 524290, 8, 0, 0, 0, 0, 0, 1, 1, 1, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 116345719, 0, 'npc_vortex_icc');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38458, 0, 0, 0, 0, 0, 19725, 19725, 19725, 19725, 'Kinetic Bomb Target', '', '', 0, 80, 80, 2, 35, 35, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 2, 8, 0, 0, 0, 0, 0, 1, 2, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 439306935, 128, '');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38454, 0, 0, 0, 0, 0, 19725, 19725, 19725, 0, 'Kinetic Bomb', '', '', 0, 82, 82, 2, 14, 14, 0, 1, 1, 452, 678, 0, 169, 17.6, 2000, 2000, 1, 2, 8, 0, 0, 0, 0, 0, 362, 542, 135, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0.074179, 1, 0, 0, 0, 0, 0, 0, 0, 64, 1, 0, 805306367, 0, 'npc_bomb_icc');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (37985, 0, 0, 0, 0, 0, 30877, 30877, 30877, 0, 'Dream Cloud', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 1, 1, 1, 10, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2128592795, 0, 'npc_dreamcloud_icc');

DELETE FROM `creature` WHERE `id`=37985;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5498489, 37985, 631, 30, 16, 0, 0, 4214.66, 2463.52, 364.869, 1.98975, 100, 0, 0, 2136800, 0, 0, 0),
(506554, 37985, 631, 30, 16, 0, 0, 4243.66, 2484.51, 364.872, 5.31148, 100, 0, 0, 2136800, 0, 0, 0),
(506475, 37985, 631, 30, 16, 0, 0, 4236.5, 2497.72, 364.535, 3.20033, 100, 0, 0, 2136800, 0, 0, 0),
(506471, 37985, 631, 30, 16, 0, 0, 4239.48, 2490.41, 364.872, 0.948594, 100, 0, 0, 2136800, 0, 0, 0),
(506327, 37985, 631, 30, 16, 0, 0, 4237.79, 2475.92, 364.869, 3.54434, 100, 0, 0, 2136800, 0, 0, 0),
(506325, 37985, 631, 30, 16, 0, 0, 4245.1, 2482.25, 364.872, 4.08862, 100, 0, 0, 2136800, 0, 0, 0),
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

DELETE FROM `gameobject` WHERE `id`=203624;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(2151041, 203624, 724, 1, 32, 3154.56, 535.418, 72.8889, 5.53401, 0, 0, 0.36589, -0.930658, 3000, 0, 1);

REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`) VALUES (202796, 10, 1327, 'Twilight Portal', '', '', '', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

UPDATE creature_template SET flags_extra = 2 WHERE entry = 30090; -- Vortex 'Arcane Overload', 'Hover Disk');
UPDATE creature_template SET flags_extra = 2, faction_A = 35, faction_H = 35, VehicleId = 165 WHERE entry IN (30234, 30248); -- Hover Disk
UPDATE creature_template SET flags_extra = 2, faction_A = 35, faction_H = 35 WHERE entry = 30118; -- Portal (Malygos)
UPDATE creature_template SET flags_extra = 2 WHERE entry = 30282;

DELETE FROM `creature` WHERE `id`=36658;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5542667, 36658, 658, 3, 64, 0, 2013, 819.895, 193.352, 558.051, 5.11291, 300, 0, 0, 653829, 0, 0, 0),
(5543011, 36658, 658, 3, 64, 0, 2013, 969.309, 180.069, 628.156, 5.95328, 300, 0, 0, 653829, 0, 0, 0);

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (36610, 0, 0, 0, 0, 0, 1126, 11686, 1126, 0, 'Exploding Orb', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 1, 2, 0, 10, 1024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69019, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'TotemAI', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');



INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5542658, 36477, 658, 3, 1, 0, 0, 852.322, 127.969, 509.89, 3.82145, 43200, 0, 0, 600533, 0, 0, 0);


DELETE FROM `creature_template_addon` where `entry` IN (5542668,5542667);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes2`) VALUES ('5542668', '36476', '4097');
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes2`) VALUES ('5542667', '36661', '4097');

DELETE FROM `creature` WHERE `id`=36661;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5543609, 36661, 658, 1, 64, 0, 0, 967.121, 181.192, 639.719, 5.84175, 300, 0, 0, 3235440, 41690, 0, 0);

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500200, 0, 0, 0, 0, 0, 31962, 31962, 31962, 0, 'Andu', 'Awesome Developer - IMMA FIRING MY LAZER', '', 0, 82, 82, 2, 14, 14, 0, 0.8, 3, 391, 744, 0, 192, 69, 1340, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 362, 542, 135, 7, 0, 500200, 0, 0, 155, 155, 155, 155, 155, 155, 40859, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8934, 8934, 'EventAI', 0, 3, 260.5, 20, 0, 0, 0, 0, 0, 0, 0, 179, 1, 2013, 670007231, 1, '');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500200);
INSERT INTO `creature_ai_scripts` VALUES 
( 5002004, 500200, 0, 0, 100, 6, 18000, 28000, 38000, 39000, 11, 33525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'LAZER4'),
( 5002003, 500200, 0, 0, 100, 6, 6000, 18000, 8000, 11000, 11, 40860, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'LAZER3'),
( 5002001, 500200, 0, 0, 100, 0, 9000, 12000, 4000, 8000, 11, 40861, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'LAZER2'),
( 5002000, 500200, 0, 0, 100, 0, 4000, 4000, 2000, 2000, 11, 40859, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Awesome'),
( 5002002, 500200, 0, 0, 100, 7, 17000, 17000, 32000, 32000, 11, 64766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'LAZER1'),
(5002005, 500200, 0, 0, 100, 6, 18000, 28000, 38000, 39000, 12, 500201, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SUMMON!');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500201, 0, 0, 0, 0, 0, 12345, 12345, 12345, 0, 'Rikimarus Impilus', 'Narcisus Handsomus Gmus - HESA FIRING ZE LAZER', '', 0, 81, 81, 2, 14, 14, 0, 1.3, 1, 452, 678, 0, 133, 44, 3000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 362, 542, 135, 4, 0, 500201, 0, 0, 30, 30, 30, 30, 30, 30, 66532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8934, 8934, 'EventAI', 0, 3, 69.5, 20, 0, 0, 0, 0, 0, 0, 0, 179, 2, 2013, 646922239, 1, '');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500201);
INSERT INTO `creature_ai_scripts` VALUES 
( 5002011, 500201, 0, 0, 100, 6, 4000, 6000, 3000, 5000, 11, 69405, 0, 1, 5, 3, 0, 0, 0, 0, 0, 0, '0'),
( 5002012, 500201, 0, 0, 100, 6, 2000, 3000, 10000, 15000, 11, 74648, 0, 1, 5, 3, 0, 0, 0, 0, 0, 0, '0'),
( 5002013, 500201, 0, 0, 100, 6, 8000, 12000, 4000, 9000, 11, 51074, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
(5002014, 500201, 0, 0, 100, 6, 30000, 50000, 45000, 90000, 11, 45717, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '0');

REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (5002005, 500200, 0, 0, 100, 6, 30000, 36000, 100000, 140000, 12, 500201, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SUMMON!');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500202, 0, 0, 0, 0, 0, 17312, 0, 0, 0, 'Andu', '', '', 0, 83, 83, 0, 16, 16, 0, 1, 1, 3000, 7000, 0, 0, 1, 2.7, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500202, 0, 0, 0, 0, 0, 0, 0, 0, 59971, 68147, 0, 0, 0, 0, 0, 0, 0, 0, 30, 60, 'EventAI', 0, 1, 500000, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');
UPDATE `creature_template` SET `baseattacktime` = 3000, `Health_mod` = 100, `Mana_mod` = 100 WHERE `entry` = 500202;
UPDATE `creature_template` SET `type` = 3 WHERE `entry` = 500202;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500202);
INSERT INTO `creature_ai_scripts` VALUES 
( 50020211, 500202, 0, 0, 100, 7, 10000, 20000, 15000, 30000, 11, 59971, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rain of fire'),
(50020212, 500202, 2, 0, 100, 7, 10, 10, 0, 0, 11, 59971, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Hellfire');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500203, 0, 0, 0, 0, 0, 20047, 0, 0, 0, 'Wrathkeeper', '', '', 0, 80, 82, 0, 16, 16, 0, 1.5, 1, 7000, 12000, 0, 0, 1, 2000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500203, 0, 0, 0, 0, 0, 0, 0, 0, 13009, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 100, 'EventAI', 1, 1, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');
DELETE FROM `creature_equip_template` WHERE (`entry`=500203);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (500203, 20033, 20009, 9060);
UPDATE `creature_template` SET `type` = 3 WHERE `entry` = 500203;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500203);
INSERT INTO `creature_ai_scripts` VALUES 
(50020301, 500203, 0, 0, 100, 7, 10000, 10000, 10000, 10000, 11, 13009, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Knockback');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500204, 0, 0, 0, 0, 0, 10691, 0, 0, 0, 'Dreadcaller', '', '', 0, 80, 82, 0, 16, 16, 0, 1.2, 1, 3000, 5000, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500204, 0, 0, 0, 0, 0, 0, 0, 0, 70281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 1, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');
UPDATE `creature_template` SET `type` = 3 WHERE `entry` = 500204;
UPDATE `creature_template` SET `spell2` = 69389 WHERE `entry` = 500204;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500204);
INSERT INTO `creature_ai_scripts` VALUES 
(50020401, 500204, 0, 0, 100, 7, 1000, 2000, 3000, 3000, 11, 70281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emp Shadow Bolt');

DELETE FROM `creature_template` WHERE (`entry`=500205);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500205, 0, 0, 0, 0, 0, 20214, 0, 0, 0, 'Mistress of Pain', '', '', 0, 80, 82, 0, 16, 6, 0, 1.1, 1, 3000, 5000, 0, 0, 1, 1700, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 500205, 0, 0, 0, 0, 0, 0, 0, 0, 71289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 60, 'EventAI', 0, 3, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500205);
INSERT INTO `creature_ai_scripts` VALUES 
(50020501, 500205, 0, 0, 100, 7, 10000, 10000, 10000, 10000, 11, 71289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Possess');

DELETE FROM `creature_template` WHERE (`entry`=500206);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500206, 0, 0, 0, 0, 0, 19200, 0, 0, 0, 'Terrormaster', '', '', 0, 80, 82, 0, 16, 16, 0, 1.2, 1, 10000, 15000, 0, 0, 1, 3000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 130, 'EventAI', 0, 3, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');
UPDATE `creature_template` SET `mindmg` = 20000, `maxdmg` = 25000 WHERE `entry` = 500206;
DELETE FROM `creature_equip_template` WHERE (`entry`=500206);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (500206, 19352, 0, 0);

DELETE FROM `creature_template` WHERE (`entry`=500207);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500207, 0, 0, 0, 0, 0, 18654, 0, 0, 0, 'Felguard Summoner', '', '', 0, 80, 82, 0, 16, 16, 0, 1.2, 1, 4000, 10000, 0, 0, 1, 2000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 00, 'EventAI', 0, 1, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');
DELETE FROM `creature_equip_template` WHERE (`entry`=500207);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (500207, 25210, 0, 0);
UPDATE `creature_template` SET `mindmg` = 15000, `maxdmg` = 20000 WHERE `entry` = 500207;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500207);
INSERT INTO `creature_ai_scripts` VALUES 
(50020701, 500207, 4, 0, 100, 7, 0, 0, 0, 0, 12, 500208, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summon Felpuppy');

DELETE FROM `creature_template` WHERE (`entry`=500208);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500208, 0, 0, 0, 0, 0, 6173, 0, 0, 0, 'Felpuppy', '', '', 0, 80, 82, 0, 16, 16, 0, 1.1, 1, 1000, 5000, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 30, 'EventAI', 0, 1, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');
UPDATE `creature_template` SET `spell1` = 17012 WHERE `entry` = 500208;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500208);
INSERT INTO `creature_ai_scripts` VALUES 
(50020801, 500208, 0, 0, 100, 7, 10000, 10000, 10000, 15000, 11, 17012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Devour Magic');



DELETE FROM `creature_loot_template` WHERE (`entry`=500209) AND (`item`=50307);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES (500209, 50307, 100,  '1', '1');

UPDATE `creature_template` SET `lootid` = '500209' WHERE `entry` = '38248';

UPDATE `creature_template` SET `ScriptName` = 'npc_gas_cloud' WHERE `entry` = '37562';

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (37690, 0, 0, 0, 0, 0, 24719, 24719, 24719, 0, 'Growing Ooze Puddle', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0.0238095, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_puddle_ooze');

UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '37813';
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38402';
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38582';
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38583';
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38583';
UPDATE `creature_template` SET `VehicleId` = '591' WHERE `entry` = '38583';


REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (37813, 38402, 38582, 38583, 0, 0, 30790, 0, 30790, 0, 'Deathbringer Saurfang', '', 'vehichleCursor', 0, 83, 83, 2, 2212, 2212, 0, 1, 3, 468, 702, 0, 175, 47.2, 2000, 2000, 4, 0, 0, 0, 0, 0, 0, 0, 374, 562, 140, 6, 108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26662, 72378, 73058, 72385, 0, 0, 0, 0, 0, 639, 0, 0, '', 0, 3, 630, 1, 0, 0, 0, 0, 0, 0, 0, 150, 1, 2064, 650854399, 1, 'boss_saurfang');
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38285, 0, 0, 0, 0, 0, 31008, 0, 31008, 0, 'Mutated Abomination', '', 'vehichleCursor', 0, 82, 82, 2, 35, 35, 0, 1, 1, 488, 642, 0, 782, 8.5, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 363, 521, 121, 6, 108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72508, 72527, 70539, 70542, 0, 0, 0, 0, 0, 591, 0, 0, '', 0, 3, 167.345, 1, 0, 0, 0, 0, 0, 0, 0, 170, 1, 0, 609320197, 0, 'npc_abomination');


REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES

('20021001','37012','13','0','100','31','10000','20000','0','0','11','70964','1','0','0','0','0','0','0','0','0','0','Ancient Skeletal Soldier - Cast Shield Bash When player casts a spell'),
('20021002','37928','4','0','100','30','0','0','0','0','11','53625','1','0','0','0','0','0','0','0','0','0','Argent Champion - Casts Defensive Stance on Aggro'),
('20021003','36899','2','0','100','31','50','0','12300','14900','11','69760','0','0','0','0','0','0','0','0','0','0','Big Ooze - Casts Radiating Ooze at 50% HP'),
('20021004','36899','0','0','100','31','8000','12000','17000','22000','11','69774','4','0','0','0','0','0','0','0','0','0','Big Ooze - Casts Sticky Ooze'),
('20021005','36899','0','0','100','31','10000','10000','28000','28000','11','69558','0','1','0','0','0','0','0','0','0','0','Big Ooze - Casts Unstable Ooze'),
('20021006','36899','0','0','100','31','25000','25000','34000','34000','11','69839','0','0','0','0','0','0','0','0','0','0','Big Ooze - Casts Unstable Ooze Explosion'),
('20021007','36791','0','0','100','7','8000','8000','22000','25000','11','69325','0','1','0','0','0','0','0','0','0','0','Blazing Skeleton - Casts Lay Waste'),
('20021008','36791','0','0','100','25','8000','8000','22000','25000','11','71730','0','1','0','0','0','0','0','0','0','0','Blazing Skeleton - Casts Lay Waste'),
('20021009','36791','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Stop Movement on Aggro'),
('20021010','36791','4','0','100','6','0','0','0','0','11','70754','1','0','22','6','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball and Set Phase 1 on Aggro'),
('20021011','36791','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Blazing Skeleton - Start Movement and Set Phase 2 when Mana is at 15%'),
('20021012','36791','0','6','100','7','0','0','1500','3000','11','70754','1','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball above 15% Mana (Phase 1)'),
('20021013','36791','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Blazing Skeleton - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('20021014','36791','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Start Movement Beyond 30 Yards'),
('20021015','36791','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - On Evade set Phase to 0'),
('20021016','36791','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Stop Movement on Aggro'),
('20021017','36791','4','0','100','24','0','0','0','0','11','71748','1','0','22','6','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball and Set Phase 1 on Aggro'),
('20021018','36791','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Blazing Skeleton - Start Movement and Set Phase 2 when Mana is at 15%'),
('20021019','36791','0','6','100','25','0','0','1500','3000','11','71748','1','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball above 15% Mana (Phase 1)'),
('20021020','36791','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Blazing Skeleton - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('20021021','36791','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Start Movement Beyond 30 Yards'),
('20021022','36791','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - On Evade set Phase to 0'),
('20021023','37022','0','0','100','31','8000','12000','17000','22500','11','40504','4','0','0','0','0','0','0','0','0','0','Blighted Abomination - Casts Cleave'),
('20021024','37022','4','0','100','30','0','0','0','0','11','71140','4','1','0','0','0','0','0','0','0','0','Blighted Abomination - Casts Scourge Hook on Aggro'),
('20021025','37022','0','0','100','31','15000','15000','35000','35500','11','71150','0','0','0','0','0','0','0','0','0','0','Blighted Abomination - Casts Plague Cloud'),
('20021026','37934','2','0','100','7','10','0','12300','14900','11','70744','0','0','0','0','0','0','0','0','0','0','Blistering Zombie - Casts Acid Burst at 10% HP'),
('20021027','37934','2','0','100','25','10','0','12300','14900','11','71733','0','0','0','0','0','0','0','0','0','0','Blistering Zombie - Casts Acid Burst at 10% HP'),
('20021028','38508','0','0','100','31','5000','7000','12000','18000','11','72176','0','1','0','0','0','0','0','0','0','0','Blood Beast - Casts Blood Link'),
('20021029','38508','1','0','100','31','1500','1500','1850000','1850000','11','72723','0','0','0','0','0','0','0','0','0','0','Blood Beast - Casts Resistant Skin on Spawn'),
('20021030','37122','0','0','100','31','15000','17000','35000','38000','11','14515','4','1','0','0','0','0','0','0','0','0','Captain Arnath - Casts Dominate Mind'),
('20021031','37122','14','0','90','6','320','40','0','0','11','71595','6','1','0','0','0','0','0','0','0','0','Captain Arnath - Casts Healing Wave on Friendlies'),
('20021032','37122','14','0','90','24','320','40','0','0','11','71783','6','1','0','0','0','0','0','0','0','0','Captain Arnath - Casts Healing Wave on Friendlies'),
('20021033','37122','0','0','100','7','10000','10000','38000','48000','11','71548','0','1','0','0','0','0','0','0','0','0','Captain Arnath - Casts Power Word: Shield'),
('20021034','37122','0','0','100','25','10000','10000','38000','48000','11','71780','0','1','0','0','0','0','0','0','0','0','Captain Arnath - Casts Power Word: Shield'),
('20021035','37122','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Stop Movement on Aggro'),
('20021036','37122','4','0','100','6','0','0','0','0','11','71546','1','0','22','6','0','0','0','0','0','0','Captain Arnath - Cast Smite and Set Phase 1 on Aggro'),
('20021037','37122','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Captain Arnath - Start Movement and Set Phase 2 when Mana is at 15%'),
('20021038','37122','0','6','100','7','0','0','1500','3000','11','71546','1','0','0','0','0','0','0','0','0','0','Captain Arnath - Cast Smite above 15% Mana (Phase 1)'),
('20021039','37122','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Captain Arnath - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('20021040','37122','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Start Movement Beyond 30 Yards'),
('20021041','37122','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Captain Arnath - On Evade set Phase to 0'),
('20021042','37122','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Stop Movement on Aggro'),
('20021043','37122','4','0','100','24','0','0','0','0','11','71547','1','0','22','6','0','0','0','0','0','0','Captain Arnath - Cast Smite and Set Phase 1 on Aggro'),
('20021044','37122','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Captain Arnath - Start Movement and Set Phase 2 when Mana is at 15%'),
('20021045','37122','0','6','100','25','0','0','1500','3000','11','71547','1','0','0','0','0','0','0','0','0','0','Captain Arnath - Cast Smite above 15% Mana (Phase 1)'),
('20021046','37122','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Captain Arnath - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('20021047','37122','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Start Movement Beyond 30 Yards'),
('20021048','37122','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Captain Arnath - On Evade set Phase to 0'),
('20021049','37122','0','0','100','31','12000','16000','24000','28000','11','70089','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Casts Undeath'),
('20021050','37123','0','0','100','31','12000','16000','24000','28000','11','70089','0','0','0','0','0','0','0','0','0','0','Captain Brandon - Casts Undeath'),
('20021051','37123','0','0','80','31','8000','14000','21000','29000','11','71551','4','0','0','0','0','0','0','0','0','0','Captain Brandon - Casts Judgement of Command'),
('20021052','37123','0','0','100','31','15000','19000','27000','35000','11','71784','4','0','0','0','0','0','0','0','0','0','Captain Brandon - Casts Hammer of Betrayal'),
('20021053','37123','2','0','100','31','20','0','10300','12900','11','71550','0','0','0','0','0','0','0','0','0','0','Captain Brandon - Cast Divine Shield When Below 20% HP'),
('20021054','37123','0','0','100','31','5000','6000','14500','18800','11','71549','1','0','0','0','0','0','0','0','0','0','Captain Brandon - Casts Crusader Strike'),
('20021055','37124','0','0','100','31','12000','16000','24000','28000','11','70089','0','0','0','0','0','0','0','0','0','0','Captain Grondel - Casts Undeath'),
('20021056','37124','0','0','70','31','7000','11000','14000','18000','11','71554','1','0','0','0','0','0','0','0','0','0','Captain Grondel - Casts Sunder Armor'),
('20021057','37124','0','0','50','31','5000','5000','10000','15000','11','71552','1','0','0','0','0','0','0','0','0','0','Captain Grondel - Casts Mortal Strike'),
('20021058','37124','0','0','80','31','15000','15000','25000','25000','11','71785','4','0','0','0','0','0','0','0','0','0','Captain Grondel - Casts Conflagration'),
('20021059','37124','4','0','100','30','0','0','0','0','11','71553','1','0','0','0','0','0','0','0','0','0','Captain Grondel - Cast Charge on Aggro'),
('20021060','37125','0','0','100','31','12000','16000','24000','28000','11','70089','0','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Undeath'),
('20021061','37125','0','0','80','7','14000','15000','20000','25000','11','71590','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Rocket Launch'),
('20021062','37125','0','0','80','25','14000','15000','20000','25000','11','71786','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Rocket Launch'),
('20021063','37125','0','0','100','7','11000','17000','19000','28000','11','71592','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Fel Iron Bomb'),
('20021064','37125','0','0','100','25','11000','17000','19000','28000','11','71787','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Fel Iron Bomb'),
('20021065','37125','0','0','90','7','8000','12000','17000','22000','11','71594','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Machine Gun'),
('20021066','37125','0','0','90','25','8000','12000','17000','22000','11','71788','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Machine Gun'),
('20021067','37129','0','0','100','31','5000','7000','12000','15000','11','71785','4','0','0','0','0','0','0','0','0','0','Crok Scourgebane - Casts Death Coil'),
('20021068','37129','0','0','80','31','9000','11000','17000','19000','11','71489','1','0','0','0','0','0','0','0','0','0','Crok Scourgebane - Casts Death Strike'),
('20021069','37129','0','0','60','31','13000','13000','21000','22000','11','71488','1','0','0','0','0','0','0','0','0','0','Crok Scourgebane - Casts Scourge Strike'),
('20021070','37129','0','0','100','31','20000','20000','7000','7000','11','70714','0','0','0','0','0','0','0','0','0','0','Crok Scourgebane - Casts Icebound Armor'),
('20021071','37949','0','0','100','31','8000','9000','21000','25000','11','71237','4','0','0','0','0','0','0','0','0','0','Cult Adherent - Casts Curse of Torpor'),
('20021072','37949','0','0','100','31','3000','4000','250000','250000','11','70901','0','1','0','0','0','0','0','0','0','0','Cult Adherent - Casts Dark Empowerment'),
('20021073','37949','0','0','100','7','15000','15000','25000','25000','11','70903','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Casts Dark Martyrdom'),
('20021074','37949','0','0','100','25','15000','15000','25000','25000','11','72498','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Casts Dark Martyrdom'),
('20021075','37949','2','0','100','31','50','0','12300','14900','11','70768','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Casts Shroud of the Occult at 50% HP'),
('20021076','37949','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Stop Movement on Aggro'),
('20021077','37949','4','0','100','6','0','0','0','0','11','70594','1','0','22','6','0','0','0','0','0','0','Cult Adherent - Cast Deathchill Bolt and Set Phase 1 on Aggro'),
('20021078','37949','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Cult Adherent - Start Movement and Set Phase 2 when Mana is at 15%'),
('20021079','37949','0','6','100','7','0','0','1500','3000','11','70594','1','0','0','0','0','0','0','0','0','0','Cult Adherent - Cast Deathchill Bolt above 15% Mana (Phase 1)'),
('20021080','37949','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Cult Adherentn - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('20021081','37949','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Start Movement Beyond 30 Yards'),
('20021082','37949','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Cult Adherent - On Evade set Phase to 0'),
('20021083','37949','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Stop Movement on Aggro'),
('20021084','37949','4','0','100','24','0','0','0','0','11','72005','1','0','22','6','0','0','0','0','0','0','Cult Adherent - Cast Deathchill Bolt and Set Phase 1 on Aggro'),
('20021085','37949','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Cult Adherent - Start Movement and Set Phase 2 when Mana is at 15%'),
('20021086','37949','0','6','100','25','0','0','1500','3000','11','72005','1','0','0','0','0','0','0','0','0','0','Cult Adherent - Cast Deathchill Bolt above 15% Mana (Phase 1)'),
('20021087','37949','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Cult Adherent - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('20021088','37949','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Start Movement Beyond 30 Yards'),
('20021089','37949','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Cult Adherent - On Evade set Phase to 0'),
('20021090','37890','0','0','100','7','15000','15000','25000','25000','11','71236','0','0','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Dark Martyrdom'),
('20021091','37890','0','0','100','25','15000','15000','25000','25000','11','72495','0','0','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Dark Martyrdom'),
('20021092','37890','2','0','100','31','20','0','12300','14900','11','70900','0','1','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Dark Transformation at 20% HP'),
('20021093','37890','0','0','100','7','5000','8000','14000','21000','11','70659','1','0','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Necrotic Strike'),
('20021094','37890','0','0','100','25','5000','8000','14000','21000','11','72490','1','0','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Necrotic Strike'),
('20021095','37890','0','0','90','7','10000','10000','18000','25000','11','70670','1','0','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Shadow Cleave'),
('20021096','37890','0','0','90','25','10000','10000','18000','25000','11','72006','1','0','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Shadow Cleave'),
('20021097','37890','0','0','100','31','15000','15000','35000','42000','11','70674','0','1','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Vampiric Might'),
('20021098','38369','0','0','100','31','10000','12000','35000','40000','11','71822','4','0','0','0','0','0','0','0','0','0','Dark Nucleus - Casts Shadow Resonance'),
('20021099','37571','0','0','100','7','8000','12000','19000','27000','11','72057','1','0','0','0','0','0','0','0','0','0','Darkfallen Advisor - Casts Lich Slap'),
('22021001','37571','0','0','100','25','8000','12000','19000','27000','11','72421','1','0','0','0','0','0','0','0','0','0','Darkfallen Advisor - Casts Lich Slap'),
('22021002','37571','14','0','90','30','320','20','0','0','11','72065','6','1','0','0','0','0','0','0','0','0','Darkfallen Advisor - Casts Shroud of Protection on Friendlies at 20% HP'),
('22021003','37571','14','0','90','30','320','50','0','0','11','72066','6','1','0','0','0','0','0','0','0','0','Darkfallen Advisor - Casts Shroud of Spell Warding on Friendlies at 50% HP'),
('22021004','37664','0','0','100','7','8000','12000','35000','35000','11','70408','1','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Casts Amplify Magic'),
('22021005','37664','0','0','100','25','8000','12000','35000','35000','11','72336','1','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Casts Amplify Magic'),
('22021006','37664','0','0','100','7','15000','16000','25000','26000','11','70407','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Casts Blast Wave'),
('22021007','37664','0','0','100','25','15000','16000','25000','26000','11','71151','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Casts Blast Wave'),
('22021009','37664','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Stop Movement on Aggro'),
('22021010','37664','4','0','100','6','0','0','0','0','11','70409','1','0','22','6','0','0','0','0','0','0','Darkfallen Archmage - Cast Fireball and Set Phase 1 on Aggro'),
('22021011','37664','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Darkfallen Archmage - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021012','37664','0','6','100','7','0','0','1500','3000','11','70409','1','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Cast Fireball above 15% Mana (Phase 1)'),
('22021013','37664','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Darkfallen Archmage - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021014','37664','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Start Movement Beyond 30 Yards'),
('22021015','37664','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - On Evade set Phase to 0'),
('22021016','37664','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Stop Movement on Aggro'),
('22021017','37664','4','0','100','24','0','0','0','0','11','71153','1','0','22','6','0','0','0','0','0','0','Darkfallen Archmage - Cast Fireball and Set Phase 1 on Aggro'),
('22021018','37664','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Darkfallen Archmage - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021019','37664','0','6','100','25','0','0','1500','3000','11','71153','1','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Cast Fireball above 15% Mana (Phase 1)'),
('22021020','37664','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Darkfallen Archmage - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021021','37664','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Start Movement Beyond 30 Yards'),
('22021022','37664','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - On Evade set Phase to 0'),
('22021023','37664','0','0','100','31','10000','11000','20000','29000','11','70410','4','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Casts Polymorph: Spider'),
('22021024','37595','0','0','100','31','15000','15000','28000','29000','11','70450','4','1','0','0','0','0','0','0','0','0','Darkfallen Blood Knight - Casts Blood Mirror'),
('22021025','37595','0','0','100','31','8000','11000','14000','16000','11','70437','1','0','0','0','0','0','0','0','0','0','Darkfallen Blood Knight - Casts Unholy Strike'),
('22021026','37595','1','0','100','31','1000','1000','1800000','1800000','11','71736','0','1','0','0','0','0','0','0','0','0','Darkfallen Blood Knight - Casts Vampiric Aura on Spawn'),
('22021027','37662','0','0','100','31','10000','12000','35000','36000','11','70750','0','0','0','0','0','0','0','0','0','0','Darkfallen Commander - Casts Battle Shout'),
('22021028','37622','4','0','100','6','0','0','0','0','11','70449','1','0','0','0','0','0','0','0','0','0','Darkfallen Commander - Casts Vampire Rush on Aggro'),
('22021029','37622','4','0','100','24','0','0','0','0','11','71155','1','0','0','0','0','0','0','0','0','0','Darkfallen Commander - Casts Vampire Rush on Aggro'),
('22021030','36939','0','0','100','31','10000','11000','14000','18000','11','15284','1','0','0','0','0','0','0','0','0','0','High Overlord Saurfang - Casts Cleave'),
('22021031','36939','4','0','100','30','0','0','0','0','11','70309','4','0','0','0','0','0','0','0','0','0','High Overlord Saurfang - Casts Rending Throw on Aggro'),
('22021032','36939','0','0','100','31','18000','19000','35000','35000','11','69634','0','1','0','0','0','0','0','0','0','0','High Overlord Saurfang - Casts Taste of Blood'),
('22021033','37886','0','0','100','7','10000','11000','22000','28000','11','70633','4','0','0','0','0','0','0','0','0','0','Gluttonous Abomination - Casts Gut Spray'),
('22021034','37886','0','0','100','25','10000','11000','22000','28000','11','71283','4','0','0','0','0','0','0','0','0','0','Gluttonous Abomination - Casts Gut Spray'),
('22021035','37562','0','0','100','7','5000','8000','14000','19000','11','70215','4','0','0','0','0','0','0','0','0','0','Gas Cloud - Casts Gaseous Bloat'),
('22021036','37562','0','0','100','25','5000','8000','14000','19000','11','70672','4','0','0','0','0','0','0','0','0','0','Gas Cloud - Casts Gaseous Bloat'),
('22021037','37532','0','0','100','7','5000','8000','14000','14000','11','71361','4','0','0','0','0','0','0','0','0','0','Frostwing Whelp - Casts Frost Blast'),
('22021038','37532','0','0','100','25','5000','8000','14000','14000','11','71362','4','0','0','0','0','0','0','0','0','0','Frostwing Whelp - Casts Frost Blast'),
('22021039','37532','0','0','100','31','3000','3000','12000','18000','11','71350','1','0','0','0','0','0','0','0','0','0','Frostwing Whelp - Casts Focus Fire'),
('22021040','37228','0','0','100','7','9000','10000','25000','27000','11','71316','4','0','0','0','0','0','0','0','0','0','Frostwarden Warrior - Casts Glacial Strike'),
('22021041','37228','0','0','100','25','9000','10000','25000','27000','11','71317','4','0','0','0','0','0','0','0','0','0','Frostwarden Warrior - Casts Glacial Strike'),
('22021042','37228','0','0','100','31','15000','18000','35000','35000','11','71325','0','1','0','0','0','0','0','0','0','0','Frostwarden Warrior - Casts Frostblade'),
('22021043','37229','0','0','100','31','15000','15000','22000','25000','11','71320','0','0','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Casts Frost Nova'),
('22021044','37229','0','0','100','31','5000','9000','19000','25000','11','71331','4','0','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Casts Ice Tomb'),
('22021045','36791','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Stop Movement on Aggro'),
('22021046','36791','4','0','100','30','0','0','0','0','11','71318','1','0','22','6','0','0','0','0','0','0','Frostwarden Sorceress - Cast Frostbolt and Set Phase 1 on Aggro'),
('22021047','36791','3','0','100','30','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Frostwarden Sorceress - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021048','36791','0','6','100','31','0','0','1500','3000','11','71318','1','0','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Cast Frostbolt above 15% Mana (Phase 1)'),
('22021049','36791','3','5','100','30','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Frostwarden Sorceress - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021050','36791','9','0','100','31','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Start Movement Beyond 30 Yards'),
('22021051','36791','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Frostwarden Sorceress - On Evade set Phase to 0'),
('22021052','37531','0','0','100','7','15000','15000','22000','25000','11','71337','0','0','0','0','0','0','0','0','0','0','Frostwarden Handler - Casts Concussive Shock'),
('22021053','37531','0','0','100','25','15000','15000','22000','25000','11','71338','0','0','0','0','0','0','0','0','0','0','Frostwarden Handler - Casts Concussive Shock'),
('22021054','37546','0','0','100','31','8000','11000','14000','19000','11','70191','1','0','0','0','0','0','0','0','0','0','Frenzied Abomination - Casts Cleave'),
('22021055','37546','2','0','100','30','30','0','0','0','11','70371','0','0','1','-106','0','0','0','0','0','0','Frenzied Abomination - Casts Enrage at 30% HP'),
('22021056','37919','0','0','100','31','12000','15000','22000','27000','11','70710','4','0','0','0','0','0','0','0','0','0','Empowered Vampiric Fiend  - Casts Leeching Rot'),
('22021057','37919','0','0','100','31','10000','10000','40000','40000','11','70711','0','1','0','0','0','0','0','0','0','0','Empowered Vampiric Fiend  - Casts Empowered Blood'),
('22021058','37919','1','0','100','31','1000','1000','1800000','1800000','11','41290','0','0','0','0','0','0','0','0','0','0','Empowered Vampiric Fiend - Casts Disease Cloud on Spawn'),
('22021059','37996','0','0','100','7','12000','12000','21000','21000','11','66019','4','0','0','0','0','0','0','0','0','0','Ebon Champion - Casts Death Coil'),
('22021060','37996','0','0','100','25','12000','12000','21000','21000','11','67929','4','0','0','0','0','0','0','0','0','0','Ebon Champion - Casts Death Coil'),
('22021061','37996','0','0','80','7','9000','9000','14000','18000','11','66047','1','0','0','0','0','0','0','0','0','0','Ebon Champion - Casts Frost Strike'),
('22021062','37996','0','0','80','25','9000','9000','14000','18000','11','67935','1','0','0','0','0','0','0','0','0','0','Ebon Champion - Casts Frost Strike'),
('22021063','37996','0','0','100','31','10000','10000','35000','35000','11','66023','0','1','0','0','0','0','0','0','0','0','Ebon Champion - Casts Icebound Fortitude'),
('22021064','37996','0','0','70','7','5000','5000','13000','16000','11','66021','4','0','0','0','0','0','0','0','0','0','Ebon Champion - Casts Icy Touch'),
('22021065','37996','0','0','70','25','5000','5000','13000','16000','11','67938','4','0','0','0','0','0','0','0','0','0','Ebon Champion - Casts Icy Touch'),
('22021066','36880','0','0','90','7','15000','15000','35000','39000','11','71114','0','0','0','0','0','0','0','0','0','0','Decaying Colossus - Casts Massive Stomp'),
('22021067','36880','0','0','90','25','15000','15000','35000','39000','11','71115','0','0','0','0','0','0','0','0','0','0','Decaying Colossus - Casts Massive Stomp'),
('22021068','36808','0','0','100','31','11000','11000','22000','25000','11','69492','1','0','0','0','0','0','0','0','0','0','Deathspeaker Zealot  - Casts Shadow Cleave'),
('22021069','36805','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Stop Movement on Aggro'),
('22021070','36805','4','0','100','6','0','0','0','0','11','69576','1','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt and Set Phase 1 on Aggro'),
('22021071','36805','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Deathspeaker Servant - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021072','36805','0','6','100','7','0','0','1500','3000','11','69576','1','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt above 15% Mana (Phase 1)'),
('22021073','36805','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021074','36805','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Start Movement Beyond 30 Yards'),
('22021075','36805','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - On Evade set Phase to 0'),
('22021076','36805','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Stop Movement on Aggro'),
('22021077','36805','4','0','100','24','0','0','0','0','11','71108','1','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt and Set Phase 1 on Aggro'),
('22021078','36805','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Deathspeaker Servant - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021079','36805','0','6','100','25','0','0','1500','3000','11','71108','1','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt above 15% Mana (Phase 1)'),
('22021080','36805','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021081','36805','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Start Movement Beyond 30 Yards'),
('22021082','36805','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - On Evade set Phase to 0'),
('27021066','36805','0','0','100','7','5000','7000','15000','19000','11','69404','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Casts Curse of Agony'),
('27021067','36805','0','0','100','25','5000','7000','15000','19000','11','71112','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Casts Curse of Agony'),
('27021068','36805','0','0','100','31','12000','14000','30000','32000','11','69405','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Casts Consuming Shadows'),
('27021069','36829','0','0','100','31','12000','14000','22000','22000','11','69483','4','0','0','0','0','0','0','0','0','0','Deathspeaker High Priest  - Casts Dark Reckoning'),
('27021070','36829','1','0','100','31','1000','1000','1800000','1800000','11','69491','0','0','0','0','0','0','0','0','0','0','Deathspeaker High Priest - Casts Aura of Darkness on Spawn'),
('27021071','37666','0','0','100','31','12000','14000','22000','23000','11','70437','1','0','0','0','0','0','0','0','0','0','Darkfallen Tactician - Casts Unholy Strike'),
('27021072','37666','4','0','100','30','0','0','0','0','11','70431','1','0','0','0','0','0','0','0','0','0','Darkfallen Tactician - Cast Shadowstep on Aggro'),
('27021073','37666','0','0','80','31','9000','9000','15000','25000','11','70432','1','0','0','0','0','0','0','0','0','0','Darkfallen Tactician - Casts Blood Sap'),
('27021074','37665','0','0','100','7','9000','9000','32000','35000','11','70435','1','0','0','0','0','0','0','0','0','0','Darkfallen Lieutenant - Casts Rend Flesh'),
('27021075','37665','0','0','100','25','9000','9000','32000','35000','11','71154','1','0','0','0','0','0','0','0','0','0','Darkfallen Lieutenant - Casts Rend Flesh'),
('27021076','37665','0','0','100','31','9000','9000','22000','25000','11','70423','4','0','0','0','0','0','0','0','0','0','Darkfallen Lieutenant - Casts Vampiric Curse'),
('27021077','37007','0','0','100','31','15000','15000','25000','25000','11','71022','0','0','0','0','0','0','0','0','0','0','Deathbound Ward - Casts Disrupting Shout'),
('27021078','37007','0','0','100','31','12000','12000','20000','29000','11','71021','1','0','0','0','0','0','0','0','0','0','Deathbound Ward - Casts Saber Lash'),
('27021079','36807','14','0','90','6','320','40','0','0','11','69389','6','1','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Casts Shadow Mend on Friendlies'),
('27021080','36807','14','0','90','24','320','40','0','0','11','71107','6','1','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Casts Shadow Mend on Friendlies'),
('27021081','36807','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Stop Movement on Aggro'),
('27021082','36807','4','0','100','30','0','0','0','0','11','69387','1','0','22','6','0','0','0','0','0','0','Deathspeaker Disciple - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('27021083','36807','3','0','100','30','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Deathspeaker Disciple - Start Movement and Set Phase 2 when Mana is at 15%'),
('27021084','36807','0','6','100','31','0','0','1500','3000','11','69387','1','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('27021085','36807','3','5','100','30','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Deathspeaker Disciple - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021086','36807','9','0','100','31','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Start Movement Beyond 30 Yards'),
('22021087','36807','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - On Evade set Phase to 0'),
('22021088','36807','0','0','100','31','9000','9000','25000','28000','11','69391','0','1','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Casts Dark Blessing'),
('22021089','36811','0','0','100','7','12000','15000','25000','25000','11','69355','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant  - Casts Shadow Nova'),
('22021090','36811','0','0','100','25','12000','15000','25000','25000','11','71106','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant  - Casts Shadow Nova'),
('22021091','36811','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant  - Stop Movement on Aggro'),
('22021092','36811','4','0','100','30','0','0','0','0','11','69387','1','0','22','6','0','0','0','0','0','0','Deathspeaker Attendant  - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('22021093','36811','3','0','100','30','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Deathspeaker Attendant  - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021094','36811','0','6','100','31','0','0','1500','3000','11','69387','1','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant  - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('22021095','36811','3','5','100','30','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Deathspeaker Attendant  - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021096','36811','9','0','100','31','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant  - Start Movement Beyond 30 Yards'),
('22021097','36811','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant  - On Evade set Phase to 0'),
('22021098','37663','0','0','100','31','12000','12000','24000','26000','11','70645','4','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Casts Chains of Shadow'),
('22021099','37663','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Stop Movement on Aggro'),
('22021100','37663','4','0','100','6','0','0','0','0','11','72960','1','0','22','6','0','0','0','0','0','0','Darkfallen Noble - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('22021101','37663','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Darkfallen Noble - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021102','37663','0','6','100','7','0','0','1500','3000','11','72960','1','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('22021103','37663','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Darkfallen Noble - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021104','37663','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Start Movement Beyond 30 Yards'),
('22021105','37663','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - On Evade set Phase to 0'),
('22021106','37663','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Stop Movement on Aggro'),
('22021107','37663','4','0','100','24','0','0','0','0','11','72961','1','0','22','6','0','0','0','0','0','0','Darkfallen Noble - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('22021108','37663','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Darkfallen Noble - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021109','37663','0','6','100','25','0','0','1500','3000','11','72961','1','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('22021110','37663','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Darkfallen Noble - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021111','37663','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Start Movement Beyond 30 Yards'),
('22021112','37663','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - On Evade set Phase to 0'),
('22021113','38472','0','0','100','31','9000','9000','25000','28000','11','69391','0','0','0','0','0','0','0','0','0','0','Darnavan - Casts Bladestorm'),
('22021114','38472','0','0','70','31','12000','13000','28000','29000','11','65946','0','0','0','0','0','0','0','0','0','0','Darnavan - Casts Bladestorm'),
('22021115','38472','4','0','100','30','0','0','0','0','11','65927','1','0','0','0','0','0','0','0','0','0','Darnavan  - Cast Charge on Aggro'),
('22021116','38472','0','0','50','31','7000','7000','15000','15000','11','65930','4','0','0','0','0','0','0','0','0','0','Darnavan - Cast Intimidating Shout'),
('22021117','38472','0','0','80','31','5000','10000','11000','18000','11','65926','1','0','0','0','0','0','0','0','0','0','Darnavan - Cast Mortal Strike'),
('22021118','38472','0','0','80','31','10000','10000','14000','22000','11','65924','1','0','0','0','0','0','0','0','0','0','Darnavan - Cast Overpower'),
('22021119','38472','0','0','60','31','11000','11000','16000','18000','11','65936','1','0','0','0','0','0','0','0','0','0','Darnavan - Cast Sunder Armor'),
('22021120','38485','0','0','100','31','9000','9000','25000','28000','11','69391','0','0','0','0','0','0','0','0','0','0','Darnavan - Casts Bladestorm'),
('22021121','38485','0','0','70','31','12000','13000','28000','29000','11','65946','0','0','0','0','0','0','0','0','0','0','Darnavan - Casts Bladestorm'),
('22021122','38485','4','0','100','30','0','0','0','0','11','65927','1','0','0','0','0','0','0','0','0','0','Darnavan  - Cast Charge on Aggro'),
('22021123','38485','0','0','50','31','7000','7000','15000','15000','11','65930','4','0','0','0','0','0','0','0','0','0','Darnavan - Cast Intimidating Shout'),
('22021124','38485','0','0','80','31','5000','10000','11000','18000','11','65926','1','0','0','0','0','0','0','0','0','0','Darnavan - Cast Mortal Strike'),
('22021125','38485','0','0','80','31','10000','10000','14000','22000','11','65924','1','0','0','0','0','0','0','0','0','0','Darnavan - Cast Overpower'),
('22021126','38485','0','0','60','31','11000','11000','16000','18000','11','65936','1','0','0','0','0','0','0','0','0','0','Darnavan - Cast Sunder Armor'),
('22021127','38454','0','0','100','7','11000','11000','26000','28000','11','72052','0','0','0','0','0','0','0','0','0','0','Kinetic Bomb - Cast Kinetic Bomb'),
('22021128','38454','0','0','100','25','11000','11000','26000','28000','11','72800','0','0','0','0','0','0','0','0','0','0','Kinetic Bomb - Cast Kinetic Bomb'),
('22021129','38454','0','0','100','7','10000','12000','24000','25000','11','70161','1','0','0','0','0','0','0','0','0','0','Korkron Axethrower - Cast Hurl Axe'),
('22021130','38454','0','0','100','25','10000','12000','24000','25000','11','72539','1','0','0','0','0','0','0','0','0','0','Korkron Axethrower - Cast Hurl Axe'),
('22021131','38454','0','0','100','31','15000','15000','20000','29000','11','71339','1','0','0','0','0','0','0','0','0','0','Korkron Axethrower - Cast Burning Pitch'),
('22021132','37117','4','0','100','30','0','0','0','0','11','69705','1','0','0','0','0','0','0','0','0','0','Korkron Battle-Mage - Cast Below Zero on Aggro'),
('22021133','37032','0','0','100','31','10000','10000','18000','24000','11','69902','1','0','0','0','0','0','0','0','0','0','Korkron Defender - Cast Devastate'),
('22021134','37032','0','0','100','7','5000','6000','14000','25000','11','69903','4','0','0','0','0','0','0','0','0','0','Korkron Defender - Cast Shield Slam'),
('22021135','37032','0','0','100','25','5000','6000','14000','25000','11','72645','4','0','0','0','0','0','0','0','0','0','Korkron Defender - Cast Shield Slam'),
('22021136','37032','0','0','80','7','14000','14000','20000','20000','11','69965','0','0','0','0','0','0','0','0','0','0','Korkron Defender - Cast Thunderclap'),
('22021137','37032','0','0','80','25','14000','14000','20000','20000','11','71147','0','0','0','0','0','0','0','0','0','0','Korkron Defender - Cast Thunderclap'),
('22021138','37032','0','0','100','31','8000','11000','18000','29000','11','69901','0','1','0','0','0','0','0','0','0','0','Korkron Defender - Cast Spell Reflect'),
('22021139','37033','0','0','100','31','10000','10000','180000','190000','11','69811','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - Cast Summon Korkron Battle Standard'),
('22021140','37044','0','0','100','31','3000','3000','180000','190000','11','69809','0','0','0','0','0','0','0','0','0','0','Korkron Battle Standard - Cast Summon Korkron Battle Standard'),
('22021141','37033','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - Stop Movement on Aggro'),
('22021142','37033','4','0','100','6','0','0','0','0','11','69869','1','0','22','6','0','0','0','0','0','0','Korkron Invoker - Cast Frostfire Bolt and Set Phase 1 on Aggro'),
('22021143','37033','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Invoker - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021144','37033','0','6','100','7','0','0','1500','3000','11','69869','1','0','0','0','0','0','0','0','0','0','Korkron Invoker - Cast Frostfire Bolt above 15% Mana (Phase 1)'),
('22021145','37033','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Invoker - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021146','37033','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - Start Movement Beyond 30 Yards'),
('22021147','37033','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - On Evade set Phase to 0'),
('22021148','37033','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - Stop Movement on Aggro'),
('22021149','37033','4','0','100','24','0','0','0','0','11','71130','1','0','22','6','0','0','0','0','0','0','Korkron Invoker - Cast Frostfire Bolt and Set Phase 1 on Aggro'),
('22021150','37033','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Invoker - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021151','37033','0','6','100','25','0','0','1500','3000','11','71130','1','0','0','0','0','0','0','0','0','0','Korkron Invoker - Cast Frostfire Bolt above 15% Mana (Phase 1)'),
('22021152','37033','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Invoker - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021153','37033','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - Start Movement Beyond 30 Yards'),
('22021154','37033','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - On Evade set Phase to 0'),
('22021155','37033','2','0','100','31','20','0','12300','14900','11','69904','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - Casts Blink at 20% HP'),
('22021156','37149','0','0','100','7','8000','11000','18000','24000','11','69969','4','0','0','0','0','0','0','0','0','0','Korkron  Necrolyte - Cast Curse of Doom'),
('22021157','37149','0','0','100','25','8000','11000','18000','24000','11','71124','4','0','0','0','0','0','0','0','0','0','Korkron  Necrolyte - Cast Curse of Doom'),
('22021158','37149','0','0','100','7','10000','12000','14000','19000','11','69973','4','0','0','0','0','0','0','0','0','0','Korkron  Necrolyte - Cast Incinerate'),
('22021159','37149','0','0','100','25','10000','12000','14000','19000','11','71135','4','0','0','0','0','0','0','0','0','0','Korkron  Necrolyte - Cast Incinerate'),
('22021160','37149','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - Stop Movement on Aggro'),
('22021161','37149','4','0','100','6','0','0','0','0','11','69972','1','0','22','6','0','0','0','0','0','0','Korkron Necrolyte - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('22021162','37149','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Necrolyte - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021163','37149','0','6','100','7','0','0','1500','3000','11','69972','1','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('22021164','37149','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Necrolyte - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021165','37149','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - Start Movement Beyond 30 Yards'),
('22021166','37149','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - On Evade set Phase to 0'),
('22021167','37149','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - Stop Movement on Aggro'),
('22021168','37149','4','0','100','24','0','0','0','0','11','71143','1','0','22','6','0','0','0','0','0','0','Korkron Necrolyte - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('22021169','37149','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Necrolyte - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021170','37149','0','6','100','25','0','0','1500','3000','11','71143','1','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('22021171','37149','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Necrolyte - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021172','37149','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - Start Movement Beyond 30 Yards'),
('22021173','37149','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - On Evade set Phase to 0'),
('22021174','37031','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Oracle - Stop Movement on Aggro'),
('22021175','37031','4','0','100','6','0','0','0','0','11','69970','1','0','22','6','0','0','0','0','0','0','Korkron Oracle - Cast Lightning Bolt and Set Phase 1 on Aggro'),
('22021176','37031','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Oracle - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021177','37031','0','6','100','7','0','0','1500','3000','11','69970','1','0','0','0','0','0','0','0','0','0','Korkron Oracle - Cast Lightning Bolt above 15% Mana (Phase 1)'),
('22021178','37031','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Oracle - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021179','37031','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Oracle- Start Movement Beyond 30 Yards'),
('22021180','37031','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Oracle - On Evade set Phase to 0'),
('22021181','37031','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Oracle - Stop Movement on Aggro'),
('22021182','37031','4','0','100','24','0','0','0','0','11','71136','1','0','22','6','0','0','0','0','0','0','Korkron Oracle - Cast Lightning Bolt and Set Phase 1 on Aggro'),
('22021183','37031','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Oracle - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021184','37031','0','6','100','25','0','0','1500','3000','11','71136','1','0','0','0','0','0','0','0','0','0','Korkron Oracle - Cast Lightning Bolt above 15% Mana (Phase 1)'),
('22021185','37031','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Oracle - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021186','37031','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Oracle - Start Movement Beyond 30 Yards'),
('22021187','37031','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Oracle - On Evade set Phase to 0'),
('22021188','37031','1','0','100','31','1000','1000','1200000','1200000','11','69926','0','1','0','0','0','0','0','0','0','0','Korkron Oracle - Casts Earth Shield on Spawn'),
('22021189','37031','14','0','90','6','320','40','0','0','11','69923','6','1','0','0','0','0','0','0','0','0','Korkron Oracle - Casts Chain Heal on Friendlies'),
('22021190','37031','14','0','90','24','320','40','0','0','11','71120','6','1','0','0','0','0','0','0','0','0','Korkron Oracle - Casts Chain Heal on Friendlies'),
('22021191','37031','2','0','100','7','50','0','12300','14900','11','69958','0','1','0','0','0','0','0','0','0','0','Korkron Oracle - Casts Healing Wave at 50% HP'),
('22021192','37031','2','0','100','25','50','0','12300','14900','11','71133','0','1','0','0','0','0','0','0','0','0','Korkron Oracle - Casts Healing Wave at 50% HP'),
('22021193','37030','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Primalist - Stop Movement on Aggro'),
('22021194','37030','4','0','100','6','0','0','0','0','11','69968','1','0','22','6','0','0','0','0','0','0','Korkron Primalist - Cast Wrath and Set Phase 1 on Aggro'),
('22021195','37030','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Primalist - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021196','37030','0','6','100','7','0','0','1500','3000','11','69968','1','0','0','0','0','0','0','0','0','0','Korkron Primalist - Cast Wrath above 15% Mana (Phase 1)'),
('22021197','37030','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Primalist - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021198','37030','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Primalist- Start Movement Beyond 30 Yards'),
('22021199','37030','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Primalist- On Evade set Phase to 0'),
('22021200','37030','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Primalist - Stop Movement on Aggro'),
('22021201','37030','4','0','100','24','0','0','0','0','11','71148','1','0','22','6','0','0','0','0','0','0','Korkron Primalist - Cast Wrath and Set Phase 1 on Aggro'),
('22021202','37030','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Primalist - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021203','37030','0','6','100','25','0','0','1500','3000','11','71148','1','0','0','0','0','0','0','0','0','0','Korkron Primalist - Cast Wrath above 15% Mana (Phase 1)'),
('22021204','37030','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Primalist - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021205','37030','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Primalist - Start Movement Beyond 30 Yards'),
('22021206','37030','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Primalist - On Evade set Phase to 0'),
('22021208','37030','14','0','90','6','3200','40','0','0','11','69882','6','1','0','0','0','0','0','0','0','0','Korkron Primalist - Casts Regrowth on Friendlies'),
('22021209','37030','14','0','90','24','3200','40','0','0','11','71141','6','1','0','0','0','0','0','0','0','0','Korkron Primalist - Casts Regrowth on Friendlies'),
('22021210','37030','2','0','50','7','50','0','12300','14900','11','69898','0','1','0','0','0','0','0','0','0','0','Korkron Primalist - Casts Rejuvenation at 50% HP'),
('22021211','37030','2','0','50','25','50','0','12300','14900','11','71142','0','1','0','0','0','0','0','0','0','0','Korkron Primalist - Casts Rejuvenation at 50% HP'),
('22021212','37030','2','0','50','7','50','0','12300','14900','11','69899','0','1','0','0','0','0','0','0','0','0','Korkron Primalist - Casts Healing Touch at 50% HP'),
('22021213','37030','2','0','50','25','50','0','12300','14900','11','71121','0','1','0','0','0','0','0','0','0','0','Korkron Primalist - Casts Healing Touch at 50% HP'),
('22021214','36957','0','0','100','31','8000','8000','16000','21000','11','71339','4','0','0','0','0','0','0','0','0','0','Korkron Reaver - Cast Burning Pitch'),
('22021215','36957','0','0','100','7','10000','10000','41000','42000','11','69647','0','1','0','0','0','0','0','0','0','0','Korkron Reaver - Cast Desperate Resolve'),
('22021216','36957','0','0','100','25','10000','10000','41000','42000','11','72536','0','1','0','0','0','0','0','0','0','0','Korkron Reaver - Cast Desperate Resolve'),
('22021217','37029','0','0','100','31','10000','10000','15000','16000','11','69912','1','0','0','0','0','0','0','0','0','0','Korkron Reaver - Cast Plague Strike'),
('22021218','37029','0','0','100','31','7000','12000','14000','24000','11','69916','1','0','0','0','0','0','0','0','0','0','Korkron Reaver - Cast Icy Touch'),
('22021219','36982','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Rocketeer - Stop Movement on Aggro'),
('22021220','36982','0','0','80','31','2000','2000','7000','9000','11','69679','4','0','0','0','0','0','0','0','0','0','Korkron Reaver - Cast Rocket Artillery'),
('25021001','36960','0','0','100','31','10000','10000','25000','29000','11','69652','0','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Bladestorm'),
('25021002','36960','0','0','100','31','15000','15000','30000','31000','11','69653','0','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Bladestorm'),
('25021003','36960','0','0','100','31','8000','16000','21000','32000','11','71339','4','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Burning Pitch'),
('25021004','36960','2','0','100','3','50','0','12300','14900','11','69647','0','1','0','0','0','0','0','0','0','0','Korkron Sergeant - Casts Desperate Resolve at 50% HP'),
('25021005','36960','2','0','100','9','50','0','12300','14900','11','72536','0','1','0','0','0','0','0','0','0','0','Korkron Sergeant - Casts Desperate Resolve at 50% HP'),
('25021006','36960','2','0','100','5','50','0','12300','14900','11','72537','0','1','0','0','0','0','0','0','0','0','Korkron Sergeant - Casts Desperate Resolve at 50% HP'),
('25021007','36960','2','0','100','17','50','0','12300','14900','11','72538','0','1','0','0','0','0','0','0','0','0','Korkron Sergeant - Casts Desperate Resolve at 50% HP'),
('25021008','36960','0','0','80','3','5000','5000','18000','25000','11','69651','1','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Wounding Strike'),
('28021008','36960','0','0','80','9','5000','5000','18000','25000','11','72569','1','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Wounding Strike'),
('25021009','36960','0','0','80','5','5000','5000','18000','25000','11','72570','1','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Wounding Strike'),
('29021010','36960','0','0','80','17','5000','5000','18000','25000','11','72571','1','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Wounding Strike'),
('29021011','37146','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Stop Movement on Aggro'),
('29021012','37146','4','0','100','6','0','0','0','0','11','69974','1','0','22','1','0','0','0','0','0','0','Korkron Sniper - Cast Shoot and Set Phase 1 on Aggro'),
('29021013','37146','0','13','100','7','2200','4700','2200','4700','11','69974','1','0','0','0','0','0','0','0','0','0','Korkron Sniper - Cast Shoot (Phase 1)'),
('29021014','37146','9','13','100','7','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Start Movement at 20 Yards (Phase 1)'),
('29021015','37146','9','13','100','7','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Stop Movement at 10 Yards (Phase 1)'),
('29021016','37146','9','13','100','7','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Start Movement at 5 Yards (Phase 1)'),
('29021017','37146','2','0','100','6','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Set Phase 2 at 15% HP'),
('29021018','37146','2','11','100','6','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Korkron Sniper - Start Movement and Flee at 15% HP (Phase 2)'),
('29021019','37146','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - On Evade set Phase to 0'),
('29021020','37146','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Stop Movement on Aggro'),
('29021021','37146','4','0','100','24','0','0','0','0','11','71144','1','0','22','1','0','0','0','0','0','0','Korkron Sniper - Cast Shoot and Set Phase 1 on Aggro'),
('29021022','37146','0','13','100','25','2200','4700','2200','4700','11','71144','1','0','0','0','0','0','0','0','0','0','Korkron Sniper - Cast Shoot (Phase 1)'),
('29021023','37146','9','13','100','25','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Start Movement at 20 Yards (Phase 1)'),
('29021024','37146','9','13','100','25','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Stop Movement at 10 Yards (Phase 1)'),
('29021025','37146','9','13','100','25','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Start Movement at 5 Yards (Phase 1)'),
('29021026','37146','2','0','100','24','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Set Phase 2 at 15% HP'),
('29021027','37146','2','11','100','24','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Korkron Sniper - Start Movement and Flee at 15% HP (Phase 2)'),
('29021028','37146','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - On Evade set Phase to 0'),
('25021010','37146','0','0','80','7','5000','5000','18000','25000','11','69989','4','0','0','0','0','0','0','0','0','0','Korkron Sniper - Cast Arcane Shot'),
('25021011','37146','0','0','80','25','5000','5000','18000','25000','11','71116','4','0','0','0','0','0','0','0','0','0','Korkron Sniper - Cast Arcane Shot'),
('25021012','37146','0','0','70','7','10000','12000','24000','29000','11','69975','4','0','0','0','0','0','0','0','0','0','Korkron Sniper - Cast Explosive Shot'),
('25021013','37146','0','0','70','25','10000','12000','24000','29000','11','71126','4','0','0','0','0','0','0','0','0','0','Korkron Sniper - Cast Explosive Shot'),
('25021014','37034','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Templar - Stop Movement on Aggro'),
('25021015','37034','4','0','100','6','0','0','0','0','11','69967','1','0','22','6','0','0','0','0','0','0','Korkron Templar - Cast Smite and Set Phase 1 on Aggro'),
('25021016','37034','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Templar - Start Movement and Set Phase 2 when Mana is at 15%'),
('25021017','37034','0','6','100','7','0','0','1500','3000','11','69967','1','0','0','0','0','0','0','0','0','0','Korkron Templar - Cast Smite above 15% Mana (Phase 1)'),
('25021018','37034','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Templar - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('25021019','37034','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Templar - Start Movement Beyond 30 Yards'),
('25021020','37034','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Templar - On Evade set Phase to 0'),
('25021021','37034','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Templar - Stop Movement on Aggro'),
('25021022','37034','4','0','100','24','0','0','0','0','11','71146','1','0','22','6','0','0','0','0','0','0','Korkron Templar - Cast Smite and Set Phase 1 on Aggro'),
('25021023','37034','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Templar - Start Movement and Set Phase 2 when Mana is at 15%'),
('25021024','37034','0','6','100','25','0','0','1500','3000','11','71146','1','0','0','0','0','0','0','0','0','0','Korkron Templar - Cast Smite above 15% Mana (Phase 1)'),
('25021025','37034','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Templar - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('25021026','37034','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Templar - Start Movement Beyond 30 Yards'),
('25021027','37034','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Templar - On Evade set Phase to 0'),
('25021028','37034','14','0','90','6','48000','40','0','0','11','69963','6','1','0','0','0','0','0','0','0','0','Korkron Templar - Casts Greater Heal on Friendlies'),
('25021029','37034','14','0','90','24','48000','40','0','0','11','71131','6','1','0','0','0','0','0','0','0','0','Korkron Templar - Casts Greater Heal on Friendlies'),
('25021030','37034','0','0','100','31','8000','12000','24000','30000','11','69910','0','1','0','0','0','0','0','0','0','0','Korkron Templar - Cast Pain Suppression'),
('25021031','37035','4','0','100','6','0','0','0','0','11','69927','1','0','0','0','0','0','0','0','0','0','Korkron Vanquisher - Cast Avengers Shield on Aggro'),
('25021032','37035','4','0','100','24','0','0','0','0','11','71117','1','0','0','0','0','0','0','0','0','0','Korkron Vanquisher - Cast Avengers Shield on Aggro'),
('25021033','37035','0','0','100','7','15000','15000','25000','35000','11','69930','0','0','0','0','0','0','0','0','0','0','Korkron Vanquisher - Cast Consecration'),
('25021034','37035','0','0','100','25','15000','15000','25000','35000','11','71122','0','0','0','0','0','0','0','0','0','0','Korkron Vanquisher - Cast Consecration'),
('25021035','37035','0','0','100','7','10000','10000','20000','21000','11','69934','0','0','0','0','0','0','0','0','0','0','Korkron Vanquisher - Cast Holy Wrath'),
('25021036','37035','0','0','100','25','10000','10000','20000','21000','11','71134','0','0','0','0','0','0','0','0','0','0','Korkron Vanquisher - Cast Holy Wrath'),
('25021037','36897','2','0','100','31','50','0','12300','14900','11','69889','0','0','0','0','0','0','0','0','0','0','Little Ooze - Casts Merge at 50% HP'),
('25021038','36897','0','0','100','31','8000','10000','17000','21000','11','69774','4','32','0','0','0','0','0','0','0','0','Little Ooze - Cast Sticky Ooze'),
('25021039','36897','0','0','100','31','14000','15000','27000','31000','11','69750','0','0','0','0','0','0','0','0','0','0','Little Ooze - Cast Weak Radiating Ooze'),
('25021040','36725','0','0','100','31','5000','5000','35000','35000','11','70965','0','0','0','0','0','0','0','0','0','0','Nerubar Broodkeeper - Cast Crypt Scarabs'),
('25021041','36725','14','0','90','30','45000','40','0','0','11','71020','6','1','0','0','0','0','0','0','0','0','Nerubar Broodkeeper - Casts Dark Mending on Friendlies'),
('25021042','36725','0','0','100','31','10000','10000','21000','22000','11','70980','4','0','0','0','0','0','0','0','0','0','Nerubar Broodkeeper - Cast Web Wrap'),
('25021043','37501','4','0','100','30','0','0','0','0','11','71801','0','1','0','0','0','0','0','0','0','0','Nerubar Champion - Cast Rush on Aggro'),
('25021044','37502','0','0','100','31','5000','5000','35000','35000','11','71326','0','0','0','0','0','0','0','0','0','0','Nerubar Webweaver - Cast Crypt Scarabs'),
('25021045','37502','0','0','100','31','8000','11000','14000','21000','11','71327','4','0','0','0','0','0','0','0','0','0','Nerubar Webweaver - Cast Web'),
('25021046','37023','0','0','100','31','8000','11500','18000','21000','11','71103','4','0','0','0','0','0','0','0','0','0','Plague Scientist - Cast Combobulating Spray'),
('25021047','37023','0','0','100','31','10000','10000','14000','17000','11','71079','1','0','0','0','0','0','0','0','0','0','Plague Scientist - Cast Plague Blast'),
('25021048','37023','0','0','100','31','15000','15000','25000','27000','11','69871','4','32','0','0','0','0','0','0','0','0','Plague Scientist - Cast Plague Stream'),
('25021049','37217','0','0','100','31','15000','15000','35000','35000','11','71123','0','0','0','0','0','0','0','0','0','0','Precious - Cast Decimate'),
('25021050','37217','0','0','90','31','5000','8000','19000','22000','11','71127','1','0','0','0','0','0','0','0','0','0','Precious - Cast Mortal Wound'),
('25021051','10404','2','0','100','30','20','0','0','0','11','71088','0','0','0','0','0','0','0','0','0','0','Pustulating Horror - Casts Blight Bomb at 20% HP'),
('25021052','10404','0','0','90','7','5000','8000','20000','22000','11','71089','4','0','0','0','0','0','0','0','0','0','Pustulating Horror - Cast Bubbling Pus'),
('25021053','10404','0','0','90','25','5000','8000','20000','22000','11','71089','4','0','0','0','0','0','0','0','0','0','Pustulating Horror - Cast Bubbling Pus'),
('25021054','36701','0','0','100','7','10000','10000','25000','35000','11','69242','0','0','0','0','0','0','0','0','0','0','Raging Spirit - Cast Soul Shriek'),
('25021055','36701','0','0','100','25','10000','10000','25000','35000','11','73800','0','0','0','0','0','0','0','0','0','0','Raging Spirit - Cast Soul Shriek'),
('25021056','37533','1','0','100','31','1000','1000','1900000','1900000','11','71387','0','1','0','0','0','0','0','0','0','0','Rimefang - Casts Frost Aura on Spawn'),
('25021057','37533','0','0','100','31','15000','15000','25000','27000','11','71386','0','0','0','0','0','0','0','0','0','0','Rimefang - Cast Frost Breath'),
('25021058','37533','0','0','100','31','8000','17000','21000','32000','11','71376','1','0','0','0','0','0','0','0','0','0','Rimefang - Cast Icy Blast'),
('25021059','37868','0','0','100','7','15000','15000','27000','27000','11','71179','4','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Mana Void'),
('25021060','37868','0','0','100','25','15000','15000','27000','27000','11','71741','4','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Mana Void'),
('25021061','37868','0','0','100','3','10000','10000','18000','22000','11','70759','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('25021062','37868','0','0','100','9','10000','10000','18000','22000','11','71889','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('25021063','37868','0','0','100','5','10000','10000','18000','22000','11','72015','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('25021064','37868','0','0','100','17','10000','10000','18000','22000','11','72016','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('25021065','37868','0','0','100','31','18000','18000','28000','28000','11','70602','4','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Corruption'),
('16021069','36844','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Risen Deathspeaker Servant - Stop Movement on Aggro'),
('16021070','36844','4','0','100','6','0','0','0','0','11','69576','1','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt and Set Phase 1 on Aggro'),
('16021071','36844','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Deathspeaker Servant - Start Movement and Set Phase 2 when Mana is at 15%'),
('16021072','36844','0','6','100','7','0','0','1500','3000','11','69576','1','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt above 15% Mana (Phase 1)'),
('16021073','36844','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('16021074','36844','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Start Movement Beyond 30 Yards'),
('16021075','36844','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - On Evade set Phase to 0'),
('16021076','36844','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Stop Movement on Aggro'),
('16021077','36844','4','0','100','24','0','0','0','0','11','71108','1','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt and Set Phase 1 on Aggro'),
('16021078','36844','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Deathspeaker Servant - Start Movement and Set Phase 2 when Mana is at 15%'),
('16021079','36844','0','6','100','25','0','0','1500','3000','11','71108','1','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt above 15% Mana (Phase 1)'),
('16021080','36844','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('16021081','36844','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Start Movement Beyond 30 Yards'),
('15021082','36844','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - On Evade set Phase to 0'),
('25021066','36844','0','0','100','7','5000','7000','15000','19000','11','69404','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Casts Curse of Agony'),
('25021067','36844','0','0','100','25','5000','7000','15000','19000','11','71112','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Casts Curse of Agony'),
('25021068','36844','0','0','100','31','12000','14000','30000','32000','11','69405','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Casts Consuming Shadows'),
('25021069','38494','0','0','100','31','15000','15000','27000','27000','11','64652','0','0','0','0','0','0','0','0','0','0','Rotting Frost Giant - Casts Stomp'),
('25021070','38494','0','0','100','31','5000','8000','18000','25000','11','72865','4','0','0','0','0','0','0','0','0','0','Rotting Frost Giant - Casts Death Plague'),
('25021071','38490','0','0','100','31','15000','15000','27000','27000','11','64652','0','0','0','0','0','0','0','0','0','0','Rotting Frost Giant - Casts Stomp'),
('25021072','38490','0','0','100','31','5000','8000','18000','25000','11','72865','4','0','0','0','0','0','0','0','0','0','Rotting Frost Giant - Casts Death Plague'),
('25021073','36724','0','0','100','31','8000','12000','22000','26000','11','71029','4','0','0','0','0','0','0','0','0','0','Servant of the Throne - Casts Glacial Blast'),
('25021074','38410','0','0','100','31','5000','9000','12000','17000','11','71937','4','0','0','0','0','0','0','0','0','0','Severed Essence - Casts Corruption'),
('25021075','37698','2','0','100','6','25','0','0','0','11','72143','0','0','1','-106','0','0','0','0','0','0','Shambling Horror - Casts Enrage at 25% HP'),
('25021076','37698','2','0','100','24','25','0','0','0','11','72146','0','0','1','-106','0','0','0','0','0','0','Shambling Horror - Casts Enrage at 25% HP'),
('25021077','37698','0','0','100','7','7000','9000','15000','17000','11','72149','0','0','0','0','0','0','0','0','0','0','Shambling Horror - Casts Shockwave'),
('25021078','37698','0','0','100','25','7000','9000','15000','17000','11','73794','0','0','0','0','0','0','0','0','0','0','Shambling Horror - Casts Shockwave'),
('25021079','37017','0','0','80','7','7000','9000','15000','15000','11','69921','0','0','0','0','0','0','0','0','0','0','Skybreaker Assassin - Casts Fan of Knives'),
('25021080','37017','0','0','80','25','7000','9000','15000','15000','11','71128','0','0','0','0','0','0','0','0','0','0','Skybreaker Assassin - Casts Fan of Knives'),
('25021081','37017','0','0','90','7','12000','14000','24000','25000','11','69920','1','0','0','0','0','0','0','0','0','0','Skybreaker Assassin - Casts Sinister Strike'),
('25021082','37017','0','0','90','25','12000','14000','24000','25000','11','71145','1','0','0','0','0','0','0','0','0','0','Skybreaker Assassin - Casts Sinister Strike'),
('25021083','37126','0','0','100','7','12000','14000','25000','25000','11','71468','4','0','0','0','0','0','0','0','0','0','Sister Svalna - Casts Aether Burst'),
('25021084','37126','0','0','100','25','12000','14000','25000','25000','11','71469','4','0','0','0','0','0','0','0','0','0','Sister Svalna - Casts Aether Burst'),
('25021085','37126','2','0','100','31','40','0','12300','14900','11','71463','0','1','0','0','0','0','0','0','0','0','Sister Svalna - Casts Aether Shield at 40% HP'),
('25021086','37126','0','0','100','31','15000','15000','35000','35000','11','71465','0','0','0','0','0','0','0','0','0','0','Sister Svalna - Casts Divine Surge'),
('25021087','37126','0','0','100','31','12000','12000','19000','28000','11','71443','4','0','0','0','0','0','0','0','0','0','Sister Svalna - Casts Impaling Spear'),
('25021088','37126','4','0','100','30','0','0','0','0','11','70053','0','0','0','0','0','0','0','0','0','0','Sister Svalna - Cast Revive Champion on Aggro'),
('25021089','37004','0','0','100','31','8000','12000','18000','26000','11','69916','1','0','0','0','0','0','0','0','0','0','Skybreaker Dreadblade - Casts Icy Touch'),
('25021090','37004','0','0','90','31','5000','5000','14000','19000','11','69912','1','0','0','0','0','0','0','0','0','0','Skybreaker Dreadblade - Casts Plague Strike'),
('25021193','37027','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Stop Movement on Aggro'),
('25021194','37027','4','0','100','6','0','0','0','0','11','69968','1','0','22','6','0','0','0','0','0','0','Skybreaker Hierophant - Cast Wrath and Set Phase 1 on Aggro'),
('25021195','37027','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Hierophant - Start Movement and Set Phase 2 when Mana is at 15%'),
('25021196','37027','0','6','100','7','0','0','1500','3000','11','69968','1','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Cast Wrath above 15% Mana (Phase 1)'),
('25021197','37027','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Hierophant - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('25021198','37027','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant- Start Movement Beyond 30 Yards'),
('25021199','37027','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant- On Evade set Phase to 0'),
('25021200','37027','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Stop Movement on Aggro'),
('25021201','37027','4','0','100','24','0','0','0','0','11','71148','1','0','22','6','0','0','0','0','0','0','Skybreaker Hierophant - Cast Wrath and Set Phase 1 on Aggro'),
('25021202','37027','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Hierophant - Start Movement and Set Phase 2 when Mana is at 15%'),
('25021203','37027','0','6','100','25','0','0','1500','3000','11','71148','1','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Cast Wrath above 15% Mana (Phase 1)'),
('25021204','37027','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Hierophant - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('25021205','37027','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Start Movement Beyond 30 Yards'),
('25021206','37027','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant - On Evade set Phase to 0'),
('25021208','37027','14','0','90','6','3200','40','0','0','11','69882','6','1','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Casts Regrowth on Friendlies'),
('25021209','37027','14','0','90','24','3200','40','0','0','11','71141','6','1','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Casts Regrowth on Friendlies'),
('25021210','37027','2','0','50','7','50','0','12300','14900','11','69898','0','1','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Casts Rejuvenation at 50% HP'),
('25021211','37027','2','0','50','25','50','0','12300','14900','11','71142','0','1','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Casts Rejuvenation at 50% HP'),
('25021212','37027','2','0','50','7','50','0','12300','14900','11','69899','0','1','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Casts Healing Touch at 50% HP'),
('25021213','37027','2','0','50','25','50','0','12300','14900','11','71121','0','1','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Casts Healing Touch at 50% HP'),
('25021274','37016','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - Stop Movement on Aggro'),
('25021275','37016','4','0','100','6','0','0','0','0','11','69970','1','0','22','6','0','0','0','0','0','0','Skybreaker Luminary - Cast Lightning Bolt and Set Phase 1 on Aggro'),
('25021276','37016','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Luminary - Start Movement and Set Phase 2 when Mana is at 15%'),
('25021277','37016','0','6','100','7','0','0','1500','3000','11','69970','1','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - Cast Lightning Bolt above 15% Mana (Phase 1)'),
('25021278','37016','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Luminary - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('25021279','37016','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Luminary- Start Movement Beyond 30 Yards'),
('25021280','37016','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - On Evade set Phase to 0'),
('25021281','37016','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - Stop Movement on Aggro'),
('25021282','37016','4','0','100','24','0','0','0','0','11','71136','1','0','22','6','0','0','0','0','0','0','Skybreaker Luminary - Cast Lightning Bolt and Set Phase 1 on Aggro'),
('25021283','37016','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Luminary - Start Movement and Set Phase 2 when Mana is at 15%'),
('25021284','37016','0','6','100','25','0','0','1500','3000','11','71136','1','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - Cast Lightning Bolt above 15% Mana (Phase 1)'),
('25021285','37016','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Luminary - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('25021286','37016','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - Start Movement Beyond 30 Yards'),
('25021287','37016','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - On Evade set Phase to 0'),
('25021288','37016','1','0','100','31','1000','1000','1200000','1200000','11','69926','0','1','0','0','0','0','0','0','0','0','Skybreaker Luminary - Casts Earth Shield on Spawn'),
('25021289','37016','14','0','90','6','320','40','0','0','11','69923','6','1','0','0','0','0','0','0','0','0','Skybreaker Luminary - Casts Chain Heal on Friendlies'),
('25021290','37016','14','0','90','24','320','40','0','0','11','71120','6','1','0','0','0','0','0','0','0','0','Skybreaker Luminary - Casts Chain Heal on Friendlies'),
('25021291','37016','2','0','100','7','50','0','12300','14900','11','69958','0','1','0','0','0','0','0','0','0','0','Skybreaker Luminary - Casts Healing Wave at 50% HP'),
('25021292','37016','2','0','100','25','50','0','12300','14900','11','71133','0','1','0','0','0','0','0','0','0','0','Skybreaker Luminary - Casts Healing Wave at 50% HP'),
('25021293','36950','0','0','100','31','15000','15000','20000','29000','11','71335','4','0','0','0','0','0','0','0','0','0','Skybreaker Marine - Cast Burning Pitch'),
('25021294','36950','0','0','100','3','10000','10000','41000','42000','11','69647','0','1','0','0','0','0','0','0','0','0','Skybreaker Marine - Cast Desperate Resolve'),
('25021295','36950','0','0','100','9','10000','10000','41000','42000','11','72536','0','1','0','0','0','0','0','0','0','0','Skybreaker Marine - Cast Desperate Resolve'),
('25021296','36950','0','0','100','21','10000','10000','41000','42000','11','72537','0','1','0','0','0','0','0','0','0','0','Skybreaker Marine - Cast Desperate Resolve'),
('36021011','37144','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Stop Movement on Aggro'),
('36021012','37144','4','0','100','6','0','0','0','0','11','69974','1','0','22','1','0','0','0','0','0','0','Skybreaker Marksman - Cast Shoot and Set Phase 1 on Aggro'),
('36021013','37144','0','13','100','7','2200','4700','2200','4700','11','69974','1','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Cast Shoot (Phase 1)'),
('36021014','37144','9','13','100','7','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman- Start Movement at 20 Yards (Phase 1)'),
('36021015','37144','9','13','100','7','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Stop Movement at 10 Yards (Phase 1)'),
('36021016','37144','9','13','100','7','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Start Movement at 5 Yards (Phase 1)'),
('36021017','37144','2','0','100','6','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Set Phase 2 at 15% HP'),
('36021018','37144','2','11','100','6','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Skybreaker Marksman - Start Movement and Flee at 15% HP (Phase 2)'),
('36021019','37144','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - On Evade set Phase to 0'),
('36021020','37144','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Stop Movement on Aggro'),
('36021021','37144','4','0','100','24','0','0','0','0','11','71144','1','0','22','1','0','0','0','0','0','0','Skybreaker Marksman - Cast Shoot and Set Phase 1 on Aggro'),
('36021022','37144','0','13','100','25','2200','4700','2200','4700','11','71144','1','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Cast Shoot (Phase 1)'),
('36021023','37144','9','13','100','25','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Start Movement at 20 Yards (Phase 1)'),
('36021024','37144','9','13','100','25','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Stop Movement at 10 Yards (Phase 1)'),
('36021025','37144','9','13','100','25','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Start Movement at 5 Yards (Phase 1)'),
('36021026','37144','2','0','100','24','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Set Phase 2 at 15% HP'),
('36021027','37144','2','11','100','24','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Skybreaker Marksman - Start Movement and Flee at 15% HP (Phase 2)'),
('36021028','37144','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - On Evade set Phase to 0'),
('26011010','37144','0','0','80','7','5000','5000','18000','25000','11','69989','4','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Cast Arcane Shot'),
('26011011','37144','0','0','80','25','5000','5000','18000','25000','11','71116','4','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Cast Arcane Shot'),
('26011012','37144','0','0','70','7','10000','12000','24000','29000','11','69975','4','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Cast Explosive Shot'),
('26011013','37144','0','0','70','25','10000','12000','24000','29000','11','71126','4','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Cast Explosive Shot'),
('26011014','36978','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Mortar Soldier - Stop Movement on Aggro'),
('26011015','36978','0','0','80','31','2000','2000','7000','9000','11','69679','4','0','0','0','0','0','0','0','0','0','Skybreaker Mortar Soldier - Cast Rocket Artillery'),
('26011016','36998','0','0','100','31','10000','10000','18000','24000','11','69902','1','0','0','0','0','0','0','0','0','0','Skybreaker Protector - Cast Devastate'),
('26011017','36998','0','0','100','7','5000','6000','14000','25000','11','69903','4','0','0','0','0','0','0','0','0','0','Skybreaker Protector - Cast Shield Slam'),
('26011018','36998','0','0','100','25','5000','6000','14000','25000','11','72645','4','0','0','0','0','0','0','0','0','0','Skybreaker Protector - Cast Shield Slam'),
('26011019','36998','0','0','80','7','14000','14000','20000','20000','11','69965','0','0','0','0','0','0','0','0','0','0','Skybreaker Protector - Cast Thunderclap'),
('26011020','36998','0','0','80','25','14000','14000','20000','20000','11','71147','0','0','0','0','0','0','0','0','0','0','Skybreaker Protector - Cast Thunderclap'),
('26011021','36998','0','0','100','31','8000','11000','18000','29000','11','69901','0','1','0','0','0','0','0','0','0','0','Skybreaker Protector - Cast Spell Reflect'),
('26011022','36969','0','0','100','31','15000','15000','20000','29000','11','71335','4','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Cast Burning Pitch'),
('26011023','36969','0','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement on Aggro'),
('26011024','36969','4','0','100','2','0','0','0','0','11','70162','1','0','22','1','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot and Set Phase 1 on Aggro'),
('26011025','36969','0','13','100','3','2200','4700','2200','4700','11','70162','1','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot (Phase 1)'),
('26011026','36969','9','13','100','3','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 20 Yards (Phase 1)'),
('26011027','36969','9','13','100','3','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement at 10 Yards (Phase 1)'),
('26011028','36969','9','13','100','3','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 5 Yards (Phase 1)'),
('26011029','36969','2','0','100','2','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Set Phase 2 at 15% HP'),
('26011030','36969','2','11','100','2','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Skybreaker Rifleman - Start Movement and Flee at 15% HP (Phase 2)'),
('26011031','36969','7','0','100','2','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - On Evade set Phase to 0'),
('26011032','36969','0','0','100','8','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement on Aggro'),
('26011033','36969','4','0','100','8','0','0','0','0','11','72566','1','0','22','1','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot and Set Phase 1 on Aggro'),
('26011034','36969','0','13','100','9','2200','4700','2200','4700','11','72566','1','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot (Phase 1)'),
('26011035','36969','9','13','100','9','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 20 Yards (Phase 1)'),
('26011036','36969','9','13','100','9','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement at 10 Yards (Phase 1)'),
('26011037','36969','9','13','100','9','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 5 Yards (Phase 1)'),
('26011038','36969','2','0','100','8','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Set Phase 2 at 15% HP'),
('26011039','36969','2','11','100','8','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Skybreaker Rifleman - Start Movement and Flee at 15% HP (Phase 2)'),
('26011040','36969','7','0','100','8','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - On Evade set Phase to 0'),
('26011041','36969','0','0','100','4','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement on Aggro'),
('26011042','36969','4','0','100','4','0','0','0','0','11','72567','1','0','22','1','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot and Set Phase 1 on Aggro'),
('26011043','36969','0','13','100','5','2200','4700','2200','4700','11','72567','1','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot (Phase 1)'),
('26011044','36969','9','13','100','5','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 20 Yards (Phase 1)'),
('26011045','36969','9','13','100','5','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement at 10 Yards (Phase 1)'),
('26011046','36969','9','13','100','5','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 5 Yards (Phase 1)'),
('26011047','36969','2','0','100','4','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Set Phase 2 at 15% HP'),
('26011048','36969','2','11','100','4','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Skybreaker Rifleman - Start Movement and Flee at 15% HP (Phase 2)'),
('26011049','36969','7','0','100','4','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - On Evade set Phase to 0'),
('26011050','36969','0','0','100','16','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement on Aggro'),
('26011051','36969','4','0','100','16','0','0','0','0','11','72568','1','0','22','1','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot and Set Phase 1 on Aggro'),
('26011052','36969','0','13','100','17','2200','4700','2200','4700','11','72568','1','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot (Phase 1)'),
('26011053','36969','9','13','100','17','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 20 Yards (Phase 1)'),
('26011054','36969','9','13','100','17','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement at 10 Yards (Phase 1)'),
('26011055','36969','9','13','100','17','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 5 Yards (Phase 1)'),
('26011056','36969','2','0','100','16','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Set Phase 2 at 15% HP'),
('26011057','36969','2','11','100','16','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Skybreaker Rifleman - Start Movement and Flee at 15% HP (Phase 2)'),
('26011058','36969','7','0','100','16','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - On Evade set Phase to 0'),
('26021001','36961','0','0','100','31','9000','9000','25000','28000','11','69652','0','0','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Casts Bladestorm'),
('26021002','36961','0','0','80','7','5000','10000','11000','18000','11','69651','1','0','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Mortal Strike'),
('26021003','36961','0','0','80','9','5000','10000','11000','18000','11','72569','1','0','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Mortal Strike'),
('26021004','36961','0','0','80','17','5000','10000','11000','18000','11','72570','1','0','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Mortal Strike'),
('26021005','36961','0','0','100','7','10000','10000','41000','42000','11','69647','0','1','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Desperate Resolve'),
('26021006','36961','0','0','100','9','10000','10000','41000','42000','11','72536','0','1','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Desperate Resolve'),
('26021007','36961','0','0','100','17','10000','10000','41000','42000','11','72537','0','1','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Desperate Resolve'),
('26021008','36961','0','0','100','31','15000','15000','20000','29000','11','71335','4','0','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Burning Pitch'),
('26021009','36961','0','0','100','31','15000','15000','30000','31000','11','69653','0','0','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Bladestorm'),
('26021010','37026','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Stop Movement on Aggro'),
('26021011','37026','4','0','100','6','0','0','0','0','11','69869','1','0','22','6','0','0','0','0','0','0','Skybreaker Sorcerer - Cast Frostfire Bolt and Set Phase 1 on Aggro'),
('26021012','37026','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Sorcerer - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021013','37026','0','6','100','7','0','0','1500','3000','11','69869','1','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Cast Frostfire Bolt above 15% Mana (Phase 1)'),
('26021014','37026','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Sorcerer - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021015','37026','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Start Movement Beyond 30 Yards'),
('26021016','37026','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - On Evade set Phase to 0'),
('26021017','37026','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Stop Movement on Aggro'),
('26021018','37026','4','0','100','24','0','0','0','0','11','71130','1','0','22','6','0','0','0','0','0','0','Skybreaker Sorcerer - Cast Frostfire Bolt and Set Phase 1 on Aggro'),
('26021019','37026','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Sorcerer - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021020','37026','0','6','100','25','0','0','1500','3000','11','71130','1','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Cast Frostfire Bolt above 15% Mana (Phase 1)'),
('26021021','37026','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Sorcerer - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021022','37026','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Start Movement Beyond 30 Yards'),
('26021023','37026','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - On Evade set Phase to 0'),
('26021024','37026','2','0','100','31','20','0','12300','14900','11','69904','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Casts Blink at 20% HP'),
('26021025','37026','0','0','100','31','10000','10000','180000','190000','11','69810','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Cast Summon Skybreaker Battle Standard'),
('26021026','37041','0','0','100','31','3000','3000','180000','190000','11','69808','0','0','0','0','0','0','0','0','0','0','Skybreaker Battle Standard - Cast Skybreaker Battle Standard'),
('26021027','37116','4','0','100','30','0','0','0','0','11','69705','1','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Cast Below Zero on Aggro'),
('26021028','37148','0','0','100','7','8000','11000','18000','24000','11','69969','4','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Cast Curse of Doom'),
('26021029','37148','0','0','100','25','8000','11000','18000','24000','11','71124','4','0','0','0','0','0','0','0','0','0','Skybreaker Summoner- Cast Curse of Doom'),
('26021030','37148','0','0','100','7','10000','12000','14000','19000','11','69973','4','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Cast Incinerate'),
('26021031','37148','0','0','100','25','10000','12000','14000','19000','11','71135','4','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Cast Incinerate'),
('26021032','37148','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Stop Movement on Aggro'),
('26021033','37148','4','0','100','6','0','0','0','0','11','69972','1','0','22','6','0','0','0','0','0','0','Skybreaker Summoner - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('26021034','37148','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Summoner - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021035','37148','0','6','100','7','0','0','1500','3000','11','69972','1','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('26021036','37148','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Summoner - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021037','37148','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Start Movement Beyond 30 Yards'),
('26021038','37148','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - On Evade set Phase to 0'),
('26021039','37148','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Stop Movement on Aggro'),
('26021040','37148','4','0','100','24','0','0','0','0','11','71143','1','0','22','6','0','0','0','0','0','0','Skybreaker Summoner - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('26021041','37148','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Summoner - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021042','37148','0','6','100','25','0','0','1500','3000','11','71143','1','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('26021043','37148','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Summoner - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021044','37148','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Start Movement Beyond 30 Yards'),
('26021045','37148','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - On Evade set Phase to 0'),
('26021046','37021','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - Stop Movement on Aggro'),
('26021047','37021','4','0','100','6','0','0','0','0','11','69967','1','0','22','6','0','0','0','0','0','0','Skybreaker Vicar - Cast Smite and Set Phase 1 on Aggro'),
('26021048','37021','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Vicar - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021049','37021','0','6','100','7','0','0','1500','3000','11','69967','1','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - Cast Smite above 15% Mana (Phase 1)'),
('26021050','37021','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Vicar - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021051','37021','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - Start Movement Beyond 30 Yards'),
('26021052','37021','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - On Evade set Phase to 0'),
('26021053','37021','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - Stop Movement on Aggro'),
('26021054','37021','4','0','100','24','0','0','0','0','11','71146','1','0','22','6','0','0','0','0','0','0','Skybreaker Vicar - Cast Smite and Set Phase 1 on Aggro'),
('26021055','37021','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Vicar - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021056','37021','0','6','100','25','0','0','1500','3000','11','71146','1','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - Cast Smite above 15% Mana (Phase 1)'),
('26021057','37021','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Vicar - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021058','37021','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - Start Movement Beyond 30 Yards'),
('26021059','37021','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - On Evade set Phase to 0'),
('26021060','37021','14','0','90','6','48000','40','0','0','11','69963','6','1','0','0','0','0','0','0','0','0','Skybreaker Vicar - Casts Greater Heal on Friendlies'),
('26021061','37021','14','0','90','24','48000','40','0','0','11','71131','6','1','0','0','0','0','0','0','0','0','Skybreaker Vicarr - Casts Greater Heal on Friendlies'),
('26021062','37021','0','0','100','31','8000','12000','24000','30000','11','69910','0','1','0','0','0','0','0','0','0','0','Skybreaker Vicar - Cast Pain Suppression'),
('26021063','37003','4','0','100','6','0','0','0','0','11','69927','1','0','0','0','0','0','0','0','0','0','Skybreaker Vindicator - Cast Avengers Shield on Aggro'),
('26021064','37003','4','0','100','24','0','0','0','0','11','71117','1','0','0','0','0','0','0','0','0','0','Skybreaker Vindicator - Cast Avengers Shield on Aggro'),
('26021065','37003','0','0','100','7','15000','15000','25000','35000','11','69930','0','0','0','0','0','0','0','0','0','0','Skybreaker Vindicator - Cast Consecration'),
('26021066','37003','0','0','100','25','15000','15000','25000','35000','11','71122','0','0','0','0','0','0','0','0','0','0','Skybreaker Vindicator - Cast Consecration'),
('26021067','37003','0','0','100','7','10000','10000','20000','21000','11','69934','0','0','0','0','0','0','0','0','0','0','Skybreaker Vindicator - Cast Holy Wrath'),
('26021068','37003','0','0','100','25','10000','10000','20000','21000','11','71134','0','0','0','0','0','0','0','0','0','0','Skybreaker Vindicator - Cast Holy Wrath'),
('26021069','37534','0','0','100','31','15000','15000','35000','35000','11','36922','0','0','0','0','0','0','0','0','0','0','Spinestalker - Cast Bellowing Roar'),
('26021070','37534','0','0','100','7','10000','10000','30000','30000','11','71369','0','0','0','0','0','0','0','0','0','0','Spinestalker - Cast Tail Sweep'),
('26021071','37534','0','0','80','25','10000','10000','30000','30000','11','71370','0','0','0','0','0','0','0','0','0','0','Spinestalker - Cast Tail Sweep'),
('26021072','37534','0','0','100','31','8000','12000','24000','32000','11','40505','1','0','0','0','0','0','0','0','0','0','Spinestalker - Cast Cleave'),
('26021073','37230','0','0','100','7','15500','15500','35500','35500','11','70362','4','0','0','0','0','0','0','0','0','0','Spire Frostwyrm - Cast Blizzard'),
('26021074','37230','0','0','100','25','15500','15500','35500','35500','11','71118','4','0','0','0','0','0','0','0','0','0','Spire Frostwyrm - Cast Blizzard'),
('26021075','37230','0','0','100','31','8000','10000','25000','30000','11','70361','1','0','0','0','0','0','0','0','0','0','Spire Frostwyrm - Cast Cleave'),
('26021076','37230','0','0','80','7','8000','8000','15000','25000','11','70116','1','0','0','0','0','0','0','0','0','0','Spire Frostwyrm - Cast Frost Breath'),
('26021077','37230','0','0','80','25','8000','8000','15000','25000','11','72641','1','0','0','0','0','0','0','0','0','0','Spire Frostwyrm - Cast Frost Breath'),
('26021078','37544','0','0','100','31','8000','10000','18000','22000','11','70189','4','32','0','0','0','0','0','0','0','0','Spire Gargoyle - Cast Poison Spit'),
('26021079','37545','0','0','100','31','8000','9000','14000','19000','11','70396','1','0','0','0','0','0','0','0','0','0','Spire Minion - Cast Ghoul Slash'),
('26021080','37545','2','0','100','31','50','0','12300','14900','11','70363','0','0','0','0','0','0','0','0','0','0','Spire Minion - Casts Cannibalize at 50% HP'),
('26021081','36824','0','0','100','31','10000','10000','28000','34000','11','69397','4','0','0','0','0','0','0','0','0','0','Spirit Warden - Cast Soul Rip'),
('26021082','36824','2','0','100','31','25','0','10300','12900','11','69383','0','1','0','0','0','0','0','0','0','0','Spirit Warden - Cast Dark Hunger When Below 25% HP'),
('26021083','37025','11','0','100','30','0','0','0','0','11','71805','0','0','0','0','0','0','0','0','0','0','Stinky - Cast Plague Stench on spawn'),
('26021084','37025','0','0','100','31','10000','10000','24000','25000','11','71127','1','0','0','0','0','0','0','0','0','0','Stinky - Cast Mortal Wound'),
('26021085','37025','0','0','100','31','15000','15000','35000','35000','11','71123','0','0','0','0','0','0','0','0','0','0','Stinky - Cast Decimate'),
('26021086','37863','4','0','100','30','0','0','0','0','11','70588','1','0','0','0','0','0','0','0','0','0','Suppresser - Cast Suppression'),
('26021087','38194','0','0','80','31','5000','5000','13000','16000','11','66021','4','0','0','0','0','0','0','0','0','0','Torgo the Elder - Casts Icy Touch'),
('26021088','38194','0','0','100','31','10000','10000','18000','22000','11','66047','1','0','0','0','0','0','0','0','0','0','Torgo the Elder - Casts Frost Strike'),
('26021089','37011','0','0','100','31','15000','15000','34000','36000','11','70960','0','1','0','0','0','0','0','0','0','0','The Damned - Casts Bone Flurry'),
('26021090','37011','6','0','100','30','0','0','0','0','11','70961','0','3','0','0','0','0','0','0','0','0','The Damned - Cast Shattered Bones On Death'),
('26021091','37098','0','0','100','7','14000','17000','27000','37000','11','71906','4','0','0','0','0','0','0','0','0','0','Valkyr Herald - Casts Severed Essence'),
('26021092','37098','0','0','100','25','14000','17000','27000','37000','11','71942','4','0','0','0','0','0','0','0','0','0','Valkyr Herald - Casts Severed Essence'),
('26021093','37133','0','0','100','7','15000','15000','25000','25000','11','41056','0','0','0','0','0','0','0','0','0','0','Ymirjar Warlord - Casts Whirlwind'),
('26021094','37133','0','0','100','25','15000','15000','25000','25000','11','41057','0','0','0','0','0','0','0','0','0','0','Ymirjar Warlord - Casts Whirlwind'),
('26021095','37697','0','0','80','7','14000','15000','25000','30000','11','70492','0','0','0','0','0','0','0','0','0','0','Volatile Ooze - Casts Ooze Eruption'),
('26021096','37697','0','0','80','9','14000','15000','25000','30000','11','72505','0','0','0','0','0','0','0','0','0','0','Volatile Ooze - Casts Ooze Eruption'),
('26021097','37697','0','0','80','17','14000','15000','25000','30000','11','72624','0','0','0','0','0','0','0','0','0','0','Volatile Ooze - Casts Ooze Eruption'),
('26021098','37697','0','0','100','7','12000','12000','22000','28000','11','70447','4','0','0','0','0','0','0','0','0','0','Volatile Ooze - Casts Volatile Ooze Adhesive'),
('26021099','37697','0','0','100','9','12000','12000','22000','28000','11','72836','4','0','0','0','0','0','0','0','0','0','Volatile Ooze - Casts Volatile Ooze Adhesive'),
('26021100','37697','0','0','100','17','12000','12000','22000','28000','11','72837','4','0','0','0','0','0','0','0','0','0','Volatile Ooze - Casts Volatile Ooze Adhesive'),
('26021101','37038','4','0','100','30','0','0','0','0','11','71164','0','0','0','0','0','0','0','0','0','0','Vengeful Fleshreaper - Cast Leaping Face Maul on Aggro'),
('26021102','37132','0','0','80','31','15000','15000','27000','32000','11','72624','0','1','0','0','0','0','0','0','0','0','Ymirjar Battle-Maiden - Casts Adrenaline Rush'),
('26021103','37132','0','0','70','31','10000','10000','17000','19000','11','71257','1','0','0','0','0','0','0','0','0','0','Ymirjar Battle-Maiden - Casts Barbaric Strike'),
('26021104','37901','0','0','100','31','12000','15000','22000','27000','11','70671','4','0','0','0','0','0','0','0','0','0','Vampiric Fiend - Casts Leeching Rot'),
('26021105','37901','11','0','100','30','0','0','0','0','11','41290','0','0','0','0','0','0','0','0','0','0','Vampiric Fiend - Cast Disease Cloud on spawn'),
('26021106','37127','2','0','100','30','40','0','0','0','11','71270','0','0','0','0','0','0','0','0','0','0','Ymirjar Frostbinder - Casts Arctic Chill at 40% HP'),
('26021107','37127','0','0','100','31','15000','15000','31000','32000','11','71274','0','0','0','0','0','0','0','0','0','0','Ymirjar Frostbinder - Casts Frozen Orb'),
('26021108','37127','0','0','100','31','18000','18000','28000','36000','11','69929','4','0','0','0','0','0','0','0','0','0','Ymirjar Frostbinder - Casts Spirit Stream'),
('26021109','37127','0','0','100','31','10000','10000','25000','25000','11','71306','4','1','0','0','0','0','0','0','0','0','Ymirjar Frostbinder - Casts Twisted Winds'),
('26021110','38125','0','0','100','31','18000','18000','28000','36000','11','69929','4','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Casts Spirit Stream'),
('26021111','38125','0','0','100','31','11000','11000','16000','21500','11','71298','4','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Casts Banish'),
('26021112','38125','0','0','80','7','20000','20000','45000','45500','11','71299','0','1','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Casts Deaths Embrace'),
('26021113','38125','0','0','80','25','20000','20000','45000','45500','11','71300','0','1','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Casts Deaths Embrace'),
('26021114','38125','0','0','100','31','8000','8000','50000','55000','11','71303','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Casts Summon Ymirjar'),
('26021115','38125','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Stop Movement on Aggro'),
('26021116','38125','4','0','100','6','0','0','0','0','11','71296','1','0','22','6','0','0','0','0','0','0','Ymirjar Deathbringer - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('26021117','38125','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Ymirjar Deathbringer - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021118','38125','0','6','100','7','0','0','1500','3000','11','71296','1','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('26021119','38125','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Ymirjar Deathbringer- Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021120','38125','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Start Movement Beyond 30 Yards'),
('26021121','38125','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - On Evade set Phase to 0'),
('26021122','38125','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Stop Movement on Aggro'),
('26021123','38125','4','0','100','24','0','0','0','0','11','71297','1','0','22','6','0','0','0','0','0','0','Ymirjar Deathbringer - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('26021124','38125','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Ymirjar Deathbringer - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021125','38125','0','6','100','25','0','0','1500','3000','11','71297','1','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('26021126','38125','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Ymirjar Deathbringer- Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021127','38125','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Start Movement Beyond 30 Yards'),
('26021128','38125','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - On Evade set Phase to 0'),
('26021129','37134','0','0','70','31','10000','10000','24000','28000','11','71252','4','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Casts Volley'),
('26021130','37134','0','0','90','31','15000','15000','30000','37000','11','71251','4','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Casts Rapid Shot'),
('26021131','37134','0','0','100','31','5000','5000','14000','17000','11','71249','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Casts Ice Trap'),
('26021132','37134','1','0','100','30','1000','1000','0','0','11','71705','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Casts Summon Warhawk OOC'),
('26021133','37134','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Stop Movement on Aggro'),
('26021134','37134','4','0','100','30','0','0','0','0','11','71253','1','0','22','1','0','0','0','0','0','0','Ymirjar Huntress - Cast Shoot and Set Phase 1 on Aggro'),
('26021135','37134','0','13','100','31','2200','4700','2200','4700','11','71253','1','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Cast Shoot (Phase 1)'),
('26021136','37134','9','13','100','31','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Start Movement at 20 Yards (Phase 1)'),
('26021137','37134','9','13','100','31','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Stop Movement at 10 Yards (Phase 1)'),
('26021138','37134','9','13','100','31','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Start Movement at 5 Yards (Phase 1)'),
('26021139','37134','2','0','100','30','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Set Phase 2 at 15% HP'),
('26021140','37134','2','11','100','30','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Ymirjar Huntress - Start Movement and Flee at 15% HP (Phase 2)'),
('26021141','37134','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - On Evade set Phase to 0');

UPDATE `creature_ai_scripts` SET `action1_param1` = 71258 WHERE `id` = 26021102;

DELETE FROM `gameobject_scripts` WHERE `id`=201584;
REPLACE INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`) VALUES
(201584, 0, 15, 70308, 0, '0'), -- transformation
(201584, 5000, 15, 70311, 0, '0'), -- transformation end
(201584, 5000, 13, 201584, 0, '0'); -- spawn

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

--
-- Obsidian Sanctum
--
UPDATE `instance_template` SET `script`='instance_obsidian_sanctum' WHERE `map`=615;
UPDATE `creature_template` SET `ScriptName`='boss_sartharion' WHERE `entry`=28860;
UPDATE `creature_template` SET `ScriptName`='mob_vesperon' WHERE `entry`=30449;
UPDATE `creature_template` SET `ScriptName`='mob_shadron' WHERE `entry`=30451;
UPDATE `creature_template` SET `ScriptName`='mob_tenebron' WHERE `entry`=30452;
UPDATE `creature_template` SET `ScriptName`='mob_acolyte_of_shadron' WHERE `entry`=31218;
UPDATE `creature_template` SET `ScriptName`='mob_acolyte_of_vesperon' WHERE `entry`=31219;
-- flametsunami
UPDATE creature_template SET minlevel=83, maxlevel=83, faction_A=14, faction_H=14, unit_flags=0x02000000, flags_extra=0x00000002, ScriptName="npc_flame_tsunami" WHERE entry=30616;

UPDATE creature_template SET ScriptName="npc_twilight_fissure" WHERE entry=30641; 
UPDATE creature_template SET ScriptName="npc_flame_tsunami" WHERE entry=30616;

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
UPDATE creature SET spawndist = 0 WHERE id = 30648; -- Fire Cyclone
UPDATE creature_template SET ScriptName = 'npc_twilight_fissure' WHERE entry = 30641;
UPDATE creature_template SET ScriptName = 'npc_flame_tsunami' WHERE entry = 30616;
UPDATE creature_template SET ScriptName = 'mob_twilight_eggs' WHERE entry IN (30882, 31204);
UPDATE creature_template SET ScriptName = 'mob_twilight_whelp' WHERE entry IN (30890, 31540, 31214, 31548);
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
UPDATE creature_template SET faction_H = 16, faction_A = 16, ScriptName = 'npc_disciple_of_vesperon' WHERE entry = 30858;
UPDATE gameobject SET spawntimesecs = -60 WHERE id = 193988;

UPDATE `instance_template` SET `script`='instance_oculus' WHERE `map`=578;
UPDATE `creature_template` SET `ScriptName`='npc_unstable_sphere' WHERE `entry`=28166;
UPDATE `creature_template` SET `ScriptName`='npc_oculus_drake' WHERE `entry` IN (27657,27658,27659);

-- Ruby drake
UPDATE creature_template SET spell1 = 50232, spell2 = 50248, spell3 = 50240, spell4 =  50253, spell5 = 53112, VehicleId = 70 WHERE entry = 27756;
-- Amber Drake
UPDATE creature_template SET spell1 = 49840, spell2 = 49838, spell3 = 49592, spell4 =  0, spell5 = 53112, VehicleId = 70 WHERE entry = 27755;
-- Emerald Drake
UPDATE creature_template SET spell1 = 50328, spell2 = 50341, spell3 = 50344, spell4 =  0, spell5 = 53112, VehicleId = 70 WHERE entry = 27692;
/*
UPDATE creature_template SET npcflag=1 WHERE entry IN (27657,27658,27659);
*/
UPDATE creature_template SET ScriptName='boss_drakos' WHERE entry = 27654;
UPDATE creature_template SET ScriptName='boss_urom' WHERE entry = 27655;
UPDATE creature_template SET ScriptName='mob_centrifige_construct' WHERE entry = 27641;
UPDATE creature_template SET ScriptName='boss_varos' WHERE entry = 27447;
UPDATE creature_template SET ScriptName='boss_eregos' WHERE entry = 27656;

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
-- Planar Anomlay di Eregos
UPDATE creature_template SET ScriptName = 'npc_planar_anomaly' WHERE entry = 30879;
-- Arcane beam
DELETE FROM creature WHERE id = 28239;
UPDATE creature_template SET modelid3 = 0 WHERE entry = 30879;

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

-- Scriptnames
UPDATE `instance_template` SET `script`='instance_ruby_sanctum' WHERE (`map`='724');
UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus' WHERE `entry` = '39751';
UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus_clone' WHERE `entry` = '39899';
UPDATE `creature_template` SET `ScriptName` = 'npc_xerestrasza' WHERE `entry` = '40429';
UPDATE `creature_template` SET `ScriptName` = 'boss_zarithrian' WHERE `entry` = '39746';
UPDATE `creature_template` SET `ScriptName` = 'boss_ragefire' WHERE `entry` = '39747';
UPDATE `creature_template` SET `ScriptName` = 'boss_halion' WHERE `entry`= '39863';
UPDATE `creature_template` SET `ScriptName` = 'boss_twilight_halion' WHERE `entry` = '40142';
UPDATE `creature_template` SET `ScriptName` = 'npc_onyx_flamecaller' WHERE `entry` = '39814';
UPDATE `gameobject_template` SET `ScriptName` = 'go_firefield' WHERE `entry` = '203005';
UPDATE `creature_template` SET `ScriptName` = 'npc_meteor_strike' WHERE `entry` = '40055';
UPDATE `creature_template` SET `ScriptName` = 'npc_combustion' WHERE `entry` = '40001';
UPDATE `creature_template` SET `ScriptName` = 'npc_consumption' WHERE `entry` = '40135';
UPDATE `creature_template` SET `ScriptName` = 'npc_meteor_flame' WHERE `entry` = '40044';


DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`='-74562') AND (`spell_effect`='74610');
DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`='-74792') AND (`spell_effect`='74800');
INSERT INTO spell_linked_spell VALUES (-74562, 74610, 0, 'Fiery Combustion removed -> Combustion');
INSERT INTO spell_linked_spell VALUES (-74792, 74800, 0, 'Soul Consumption removed -> Consumption');

UPDATE `instance_template` SET `script`='instance_trial_of_the_champion' WHERE `map`=650;
UPDATE `creature_template` SET `ScriptName`='npc_announcer_toc5' WHERE `entry`IN (35004,35005);

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


-- actualizaci�n nueva de todos los npc relacionado a prueba del campe�n
-- Update mob's stats
-- Memory's Stats
-- Health, mana, vehicle id, etc...
-- Equipment
-- Faction for Vehicle

DELETE FROM `creature_template` WHERE `entry` IN 
(33297, 33298, 33299, 33300, 33301, 33408, 33409, 33414, 33416, 33418, 34657, 34658, 34701, 34702, 34703, 34705, 34928, 34942, 35028, 35029, 
35030, 35031, 35032, 35033, 35034, 35035, 35036, 35037, 35038, 35039, 35040, 35041, 35042, 35043, 35044, 35045, 35046, 35047, 35048, 35049, 
35050, 35051, 35052, 35119, 35305, 35306, 35307, 35308, 35309, 35310, 35314, 35323, 35325, 35326, 35327, 35328, 35329, 35330, 35331, 35332, 
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
('35048','35539','0','0','0','0','21401','0','21401','0','Memory of Onyxia','','','0','82','82','2'