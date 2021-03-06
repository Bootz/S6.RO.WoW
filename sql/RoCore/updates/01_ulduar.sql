-- Some cleanup
DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5369,5423);

DELETE FROM areatrigger_scripts WHERE `entry`=4156;
REPLACE INTO areatrigger_scripts VALUES (4156,'at_naxxramas_frostwyrm_wing');

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
REPLACE INTO `creature_template` VALUES
('33119','0','0','0','0','0','13069','0','0','0','Scorch trigger','',NULL,'0','83','83','2','16','16','0','2','2','85','3','0','0','0','0','0','0','0','8','34340934','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','62548','0','0','0','0','0','0','0','0','0','1305000','1595000','EventAI','0','3','310','30','1','0','0','0','0','0','0','0','169','1','0','617299803','1','trigger_periodic','0');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33119);
REPLACE INTO `creature_ai_scripts` VALUES 
( 10033119, 33119, 0, 0, 100, 3, 1000, 1000, 1000, 1000, 11, 62548, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Scorch Ground');

UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `unit_flags` = 33554434, `flags_extra` = 0 WHERE `entry` = 33121;

-- 7796_xt002_vehicleid
UPDATE `creature_template` SET `vehicleId` = 332 WHERE `entry` = 33293;

-- 7930_leviathan_trigger
DELETE FROM `creature_template` WHERE `entry` IN (33115);
REPLACE INTO `creature_template` VALUES
('33115','0','0','0','0','0','13069','0','0','0','Leviathan trigger','',NULL,'0','83','83','2','16','16','0','2','2','1','3','0','0','0','0','0','0','0','8','34340934','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','62548','0','0','0','0','0','0','0','0','0','1305000','1595000','','0','3','310','30','1','0','0','0','0','0','0','0','169','1','0','617299803','1','flame_leviathan_trigger','0');

DELETE FROM creature WHERE `id` IN (33115, 33060, 33062, 33109);
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES (33115,603,1,1,0,0,-784.969,-135.608,429.774,0.351076,480000,0,0,3458360,279750,0,0);

-- 8042_boss_leviathan
DELETE FROM `creature_template` WHERE `entry` IN (33240);
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES('33240','33240','0','0','0','0','28517','0','0','0','Ulduar Colossus','','','0','80','80','2','1692','1692','0','1.2','1.14286','1','1','422','586','0','642','7.5','2000','0','1','32832','0','0','0','0','0','0','345','509','103','5','524352','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','125','1','1','0','0','0','0','0','0','0','124','1','0','0','0','mob_colossus','11403');
-- ubicaci�n Leviathan
DELETE FROM `creature` WHERE `id`=33113;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(94374, 33113, 603, 1, 1, 0, 0, 435.89, -8.417, 409.886, 3.12723, 480000, 0, 0, 23009250, 0, 0, 0);
-- Refuerzo orbital
UPDATE `creature_template` SET `unit_flags` = 33685510, `type_flags` = 0 WHERE `entry` = 34286;

-- 8047_ignis_scorchground
DELETE FROM `creature_template` WHERE `entry` IN (33119);
REPLACE INTO `creature_template` VALUES
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
REPLACE INTO `creature_equip_template` VALUES ('2500','45315','0','0');

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
REPLACE INTO `spell_linked_spell` VALUES 
(61990, -62457, 2, "Ice Shards Immunity (Hodir)"),
(61990, -65370, 2, "Ice Shards Immunity (Hodir)");

UPDATE `creature_template` SET `unit_flags` = 33817094 WHERE `entry` = 33174;
UPDATE `creature_template` SET `mechanic_immune_mask` = 612581215 WHERE `entry` = 32938;
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 32941;
UPDATE `creature_template` SET `unit_flags` = 33686016, `flags_extra` = 2 WHERE `entry` = 30298;

DELETE FROM `creature` WHERE `id` = 32938;

-- 8153_razorscale_event
DELETE FROM `creature` WHERE `id`=33186;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
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
UPDATE `script_texts` SET `content_default` = "Move! Quickly! She won�t remain grounded for long.", `type` = 1  WHERE `entry` = -1603261;
UPDATE `script_texts` SET `type` = 2  WHERE `entry` = -1603053;
UPDATE `script_texts` SET `type` = 2  WHERE `entry` = -1603214;

-- 8166_hodir_flashfreeze
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (61990, -61990);
REPLACE INTO `spell_linked_spell` VALUES 
(61990, 7940, 2, "Hodir Flash Freeze immunity");

-- 8172_freya_elders
UPDATE `creature_template` SET `unit_flags` = 33685510, `modelid1` = 11686, `modelid2` = 0 WHERE `entry` =33170;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 393220 WHERE `entry` = 33168;

DELETE FROM `spell_linked_spell` WHERE `spell_effect` = -62243;
REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
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
REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(64321, -62532, 1, 'Potent Pheromones ward off the Conservator''s Grip'),
(62619, -62532, 1, 'Pheromones ward off the Conservator''s Grip');

-- 8195_freya_event
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `unit_flags` = 33686022 WHERE `entry` = 33050;

-- 8199_ulduar_cleanup
DELETE FROM `gameobject` WHERE `id` = '194905';
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
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
REPLACE INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
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
REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62042','62470','1','Thorim: Deafening Thunder');

UPDATE `creature_template` SET `unit_flags` = 33686020 WHERE `entry` = 33378;

DELETE FROM `creature` WHERE `id` IN (33378, 32892);
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(131835, 33378, 603, 1, 1, 16925, 0, 2104.99, -233.484, 433.573, 5.49779, 604800, 0, 0, 12600, 0, 0, 1),
(131836, 33378, 603, 1, 1, 16925, 0, 2092.64, -262.594, 433.576, 6.26573, 604800, 0, 0, 12600, 0, 0, 1),
(131837, 33378, 603, 1, 1, 16925, 0, 2104.76, -292.719, 433.181, 0.785398, 604800, 0, 0, 12600, 0, 0, 1),
(131839, 33378, 603, 1, 1, 16925, 0, 2164.97, -293.375, 433.526, 2.35619, 604800, 0, 0, 12600, 0, 0, 1),
(131840, 33378, 603, 1, 1, 16925, 0, 2164.58, -233.333, 433.892, 3.90954, 604800, 0, 0, 12600, 0, 0, 1),
(131841, 33378, 603, 1, 1, 16925, 0, 2145.8, -222.196, 433.293, 4.45059, 604800, 0, 0, 12600, 0, 0, 1),
(131842, 33378, 603, 1, 1, 16925, 0, 2123.91, -222.443, 433.375, 4.97419, 604800, 0, 0, 12600, 0, 0, 1);

/*
DELETE FROM `spell_script_target` WHERE `entry`=62016;
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES('62016','1','33378');
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
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) values 
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
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194265','1','295','Lever','','','','0','16','3','0','0','0','0','0','0','0','0','6000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','11403');
DELETE FROM `gameobject` WHERE `id`=194265;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(2002365, 194265, 603, 1, 64, 2173.24, -252.985, 420.146, 5.27078, 0, 0, 1, 0, 7200, 100, 1);

UPDATE `gameobject` SET `id` = 194265, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 2002365;

DELETE FROM `creature` WHERE `guid`=131934;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('131934','33725','603','1','1','16925','0','2134.93','-339.696','437.311','0','604800','0','0','12600','0','0','0');


UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 32892;

DELETE FROM `creature_addon` WHERE `guid`IN (131817, 131934);
REPLACE INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('131817','0','0','0','1','0','40775 0'),
('131934','0','0','0','1','0','40775 0');

-- 8264_thorim_preadds
UPDATE `creature_template` SET `mindmg` = 488, `maxdmg` = 642, `attackpower` = 682, `dmg_multiplier` = 7.5, `equipment_id` = 1852 WHERE `entry` = 32908;
UPDATE `creature_template` SET `mindmg` = 488, `maxdmg` = 642, `attackpower` = 482, `dmg_multiplier` = 7.5, `equipment_id` = 1847 WHERE `entry` = 32885;

-- 8265_thorim_chest
DELETE FROM `gameobject` WHERE `id`=194314;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(7143, 194314, 603, 1, 1, 2134.58, -286.908, 419.495, 1.55988, 0, 0, 0.703237, 0.710955, -604800, 0, 1);

-- 8266_thorim_hardmode
DELETE FROM creature_template WHERE `entry` IN (33196, 33234);
REPLACE INTO `creature_template`  values
('33196','33234','0','0','0','0','28488','0','0','0','Sif','','','0','83','83','2','16','16','0','1','1.14286','1','3','370','531','4','343','35','2000','0','8','33587202','8','0','0','0','0','0','365','542','84','7','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','350','1','1','0','0','0','0','0','0','0','0','1','850','0','0','npc_sif','11159'),
('33234','0','0','0','0','0','28488','0','0','0','Sif (1)','','','0','83','83','2','35','35','0','1','1.14286','1','3','370','531','0','343','70','2000','0','8','0','8','0','0','0','0','0','365','542','84','7','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','350','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','1');

-- 8270_razorscale_triggers
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0, `flags_extra` = 2 WHERE `entry` = 33282;

-- 8274_thorim_tram
UPDATE `gameobject_template` SET `flags` = 32, `data2` = 3000 WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM gameobject WHERE id = '194437';
REPLACE INTO `gameobject` (`guid`,`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(' 270010','194437','603','1','1','2306.87','274.237','424.288','1.52255','0','0','0.689847','0.723956','300','0','1');

-- 8275_tram_packets
DELETE FROM gameobject_template WHERE entry = '194438';
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');
DELETE FROM gameobject WHERE id = '194438';
REPLACE INTO `gameobject` (`guid`,`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
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
REPLACE INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28638, 0.15, 20, 2, 0),
(28821, 0.35, 20, 2, 0),
(28822, 0.35, 20, 2, 0);

-- 8291_hodir_adds_resistance
UPDATE `creature_template` SET `resistance4` = 1000 WHERE `entry` IN (33325, 32901, 33328, 32900, 32893, 33327, 32897, 33326, 32941, 33333, 33332, 32950, 33331, 32946, 32948, 33330);

-- 8297_mimiron_phase1
UPDATE `creature_template` SET `vehicleId` = 336 WHERE `entry` = 33432; -- Leviathan Mk II
DELETE FROM creature WHERE id = 34071;
DELETE FROM vehicle_accessory WHERE entry = 33432;
REPLACE INTO vehicle_accessory VALUE (33432, 34071, 7, 1, 'Leviathan Mk II turret');
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
REPLACE INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0.5, 7, 2, 0);

-- 8320 mimiron_encounter
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
REPLACE INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0, 0, 2, 0);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33856, 34143, 34050);
UPDATE `creature_template` SET `unit_flags` = 33686018 WHERE `entry` = 34050;
UPDATE `creature` SET `position_x` = 2736.92, `position_y` = 2572.30, `orientation` = 5.723 WHERE `guid` = 137630;
UPDATE `creature_template` SET `unit_flags` = 0, `vehicleid` = 371, `Health_mod` = 375 WHERE `entry` = 33651;
UPDATE `creature_template` SET `unit_flags` = 0, `vehicleid` = 388, `Health_mod` = 250 WHERE `entry` = 33670;
UPDATE `creature_template` SET `vehicleid` = 370, `Health_mod` = 156.185 WHERE `entry` = 33432;
UPDATE `creature_template` SET `Health_mod` = 156.185 WHERE `entry` = 34071;

DELETE FROM vehicle_accessory WHERE entry = 33432;
REPLACE INTO vehicle_accessory VALUE (33432, 34071, 3, 1, 'Leviathan Mk II turret');
UPDATE `creature_template` SET `modelid1` = 17188, `modelid2` = 0 WHERE `entry` = 25171;
UPDATE `creature_template` SET `speed_walk` = 0.5, `speed_run` = 0.5 WHERE `entry` = 33836;

DELETE FROM `creature` WHERE `id`=33651;
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33651, 603, 1, 1, 28841, 0, 2744.65, 2569.46, 364.397, 3.14159, 604800, 0, 0, 1742400, 0, 0, 0);
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2 WHERE `entry` = 34047;

DELETE FROM `creature` WHERE `id`=33670;
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33670, 603, 1, 1, 28979, 0, 2744.65, 2569.46, 380.040, 3.14159, 604800, 0, 0, 1742400, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 33686020, `type_flags` = 0, `flags_extra` = 2 WHERE `entry` = 34068;
-- 8334_mimiron_chest
UPDATE `gameobject_template` SET `size` = 1.5 WHERE `entry` = 194956;
DELETE FROM `gameobject` WHERE `id`=194956;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(5868, 194956, 603, 1, 1, 2744.65, 2569.46, 364.397, 3.14159, 0, 0, 0.703237, 0.710955, -604800, 0, 1);

UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (33432, 33651, 33670);

-- 8338_ulduar_teleports
DELETE FROM `gameobject` WHERE `id`=194569;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
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
REPLACE INTO `creature_ai_scripts` VALUES 
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
REPLACE INTO `creature_ai_scripts` VALUES 
(3323601, 33236, 0, 0, 100, 3, 4000, 6000, 15000, 20000, 11, 62845, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Hamstring 10'),
(3323602, 33236, 0, 0, 100, 5, 4000, 6000, 15000, 20000, 11, 62845, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Hamstring 25'),
(3323603, 33236, 0, 0, 100, 3, 0, 4000, 6000, 8000, 11, 57780, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Lightning Bolt 10'),
(3323604, 33236, 0, 0, 100, 5, 0, 4000, 6000, 8000, 11, 57780, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Lightning Bolt 25'),
(3323605, 33236, 0, 0, 100, 3, 5000, 6000, 4000, 6000, 11, 50370, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Sunder Armor 10'),
(3323606, 33236, 0, 0, 100, 5, 5000, 6000, 4000, 6000, 11, 50370, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Sunder Armor 25');

-- Mechagnome Battletank
UPDATE `creature_template` SET `spell1` = 64693, `spell2` = 64953, `mindmg` = 417, `maxdmg` = 582, `attackpower` = 968, `minrangedmg` = 341, `maxrangedmg` = 506, `AIName` = 'EventAI' WHERE `entry` = 34164;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34164);
REPLACE INTO `creature_ai_scripts` VALUES 
(3416401, 34164, 0, 0, 100, 3, 3000, 4000, 6000, 8000, 11, 64693, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Flame Cannon 10'),
(3416402, 34164, 0, 0, 100, 5, 3000, 4000, 6000, 8000, 11, 64693, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Flame Cannon 25'),
(3416403, 34164, 0, 0, 100, 3, 10000, 10000, 15000, 20000, 11, 64953, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Jump Attack 10'),
(3416404, 34164, 0, 0, 100, 5, 10000, 10000, 15000, 20000, 11, 64953, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Jump Attack 25');

-- Ulduar Colossus
UPDATE `creature_template` SET `spell1` = 62625, `attackpower` = 987, `AIName` = 'EventAI' WHERE `entry` = 33237;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33237);
REPLACE INTO `creature_ai_scripts` VALUES 
(3323701, 33237, 0, 0, 100, 3, 8000, 10000, 20000, 25000, 11, 62625, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ulduar Colossus - Cast Ground Slam 10'),
(3323702, 33237, 0, 0, 100, 5, 8000, 10000, 20000, 25000, 11, 62625, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ulduar Colossus - Cast Ground Slam 25');

-- invisible triggers
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33377, 33742, 34286, 33500);

-- Molten Colossus
UPDATE `creature_template` SET `spell1` = 64697, `spell2` = 64698, `attackpower` = 982, `dmg_multiplier` = 30, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34069;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34069);
REPLACE INTO `creature_ai_scripts` VALUES 
(3406901, 34069, 0, 0, 100, 3, 6000, 10000, 10000, 12000, 11, 64697, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Earthquake 10'),
(3406902, 34069, 0, 0, 100, 5, 6000, 10000, 10000, 12000, 11, 64697, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Earthquake 25'),
(3406903, 34069, 0, 0, 100, 3, 2000, 4000, 6000, 9000, 11, 64698, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Pyroblast 10'),
(3406904, 34069, 0, 0, 100, 5, 2000, 4000, 6000, 9000, 11, 64698, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Pyroblast 25');

-- Magma Rager
UPDATE `creature_template` SET `spell1` = 64773, `spell2` = 64746, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34086;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34086);
REPLACE INTO `creature_ai_scripts` VALUES 
(3408601, 34086, 0, 0, 100, 3, 2000, 40000, 6000, 8000, 11, 64773, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Fire Blast 10'),
(3408602, 34086, 0, 0, 100, 5, 2000, 40000, 6000, 8000, 11, 64773, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Fire Blast 25'),
(3408603, 34086, 0, 0, 100, 3, 8000, 16000, 15000, 25000, 11, 64746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Superheated winds 10'),
(3408604, 34086, 0, 0, 100, 5, 8000, 16000, 15000, 25000, 11, 64746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Superheated winds 25');
UPDATE `creature_template` SET `unit_flags` = 33718790, modelid1 = 11686, modelid2 = 0, `spell1` = 64724, `AIName` = 'EventAI' WHERE `entry` = 34194;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34194);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419401, 34194, 0, 0, 100, 3, 0, 0, 10000, 10000, 11, 64724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Superheated Winds'),
(3419402, 34194, 0, 0, 100, 5, 0, 0, 10000, 10000, 11, 64724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Superheated Winds');

-- Forge Construct
UPDATE `creature_template` SET `spell1` = 64719, `spell2` = 64720, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34085;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34085);
REPLACE INTO `creature_ai_scripts` VALUES 
(3408501, 34085, 0, 0, 100, 3, 8000, 12000, 10000, 15000, 11, 64719, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Charge 10'),
(3408502, 34085, 0, 0, 100, 5, 8000, 12000, 10000, 15000, 11, 64719, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Charge 25'),
(3408503, 34085, 0, 0, 100, 3, 2000, 6000, 6000, 9000, 11, 64720, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Flame Emission 10'),
(3408504, 34085, 0, 0, 100, 5, 2000, 6000, 6000, 9000, 11, 64721, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Flame Emission 25');

-- XB-488 Disposalbot
UPDATE `creature_template` SET `spell1` = 65080, `spell2` = 65084, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34273;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34273);
REPLACE INTO `creature_ai_scripts` VALUES
(3427301, 34273, 2, 0, 100, 30, 20, 0, 0, 0, 11, 65084, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Self Destruct at 20% HP on 10 and 25 normal and heroic'),
(3427303, 34273, 0, 0, 100, 11, 2000, 6000, 10000, 15000, 11, 65080, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 10 normal and heroic'),
(3427304, 34273, 0, 0, 100, 21, 2000, 6000, 10000, 15000, 11, 65104, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 25 normal and heroic');

-- Parts Recovery Technician
UPDATE `creature_template` SET `spell1` = 65071, `spell2` = 65070, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554432, `AIName` = 'EventAI' WHERE `entry` = 34267;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34267);
REPLACE INTO `creature_ai_scripts` VALUES 
(3426701, 34267, 0, 0, 100, 3, 8000, 12000, 10000, 15000, 11, 65071, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Mechano Kick 10'),
(3426702, 34267, 0, 0, 100, 5, 8000, 12000, 10000, 15000, 11, 65071, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Mechano Kick 25'),
(3426703, 34267, 0, 0, 100, 3, 6000, 8000, 25000, 30000, 11, 65070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Defense Matrix 10'),
(3426704, 34267, 0, 0, 100, 5, 6000, 8000, 25000, 30000, 11, 65070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Defense Matrix 25');

-- XD-175 Compactobot
UPDATE `creature_template` SET `spell1` = 65073, `spell2` = 65106, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34271;
UPDATE `creature_template` SET `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600 WHERE `entry` = 34269;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34271);
REPLACE INTO `creature_ai_scripts` VALUES 
(3427101, 34271, 0, 0, 100, 3, 8000, 12000, 15000, 20000, 11, 65073, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XD-175 Compactobot - Cast Trash Compactor 10'),
(3427102, 34271, 0, 0, 100, 5, 8000, 12000, 15000, 20000, 11, 65106, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XD-175 Compactobot - Cast Trash Compactor 25');

-- Lightning Charged Iron Dwarf
UPDATE `creature_template` SET `spell1` = 64889, `spell2` = 64975, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34199;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34199);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419901, 34199, 0, 0, 100, 3, 0, 0, 10000, 15000, 11, 64889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 10'),
(3419902, 34199, 0, 0, 100, 5, 0, 0, 10000, 15000, 11, 64975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 25');

-- Hardened Iron Golem
UPDATE `creature_template` SET `spell1` = 64877, `spell2` = 64874, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34190;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34190);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419001, 34190, 0, 0, 100, 3, 4000, 8000, 25000, 30000, 11, 64877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Harden Fists 10'),
(3419002, 34190, 0, 0, 100, 5, 4000, 8000, 25000, 30000, 11, 64877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Harden Fists 25'),
(3419003, 34190, 0, 0, 100, 3, 5000, 7000, 20000, 30000, 11, 64874, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Rune Punch 10'),
(3419004, 34190, 0, 0, 100, 5, 5000, 7000, 20000, 30000, 11, 64967, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Rune Punch 25');

-- Iron Mender
UPDATE `creature_template` SET `spell1` = 64918, `spell2` = 64903, `spell3` = 64897, `dmg_multiplier` = 25, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34198;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34198);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419801, 34198, 0, 0, 100, 3, 2000, 4000, 4000, 6000, 11, 64918, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Electro Shock 10'),
(3419802, 34198, 0, 0, 100, 5, 2000, 4000, 4000, 6000, 11, 64971, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Electro Shock 25'),
(3419803, 34198, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 64903, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Lightning 10'),
(3419804, 34198, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 64970, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Lightning 25'),
(3419805, 34198, 0, 0, 100, 3, 10000, 25000, 30000, 45000, 11, 64897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Metal 10'),
(3419806, 34198, 0, 0, 100, 5, 10000, 25000, 30000, 45000, 11, 64968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Metal 25');

-- Rune Etched Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `mechanic_immune_mask` = 33554496, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34196;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34196);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419601, 34196, 0, 0, 100, 3, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Flaming Rune 10'),
(3419602, 34196, 0, 0, 100, 5, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Flaming Rune 25'),
(3419603, 34196, 0, 0, 100, 3, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Lava Burst 10'),
(3419604, 34196, 0, 0, 100, 5, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Lava Burst 25'),
(3419605, 34196, 0, 0, 100, 3, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Runed Flame Jets 10'),
(3419606, 34196, 0, 0, 100, 5, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Runed Flame Jets 25');

-- Chamber Overseer
UPDATE `creature_template` SET `spell1` = 64820, `spell2` = 64825, `dmg_multiplier` = 55, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34197;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34197);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419701, 34197, 0, 0, 100, 3, 4000, 8000, 6000, 9000, 11, 64820, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Devastating Leap 10'),
(3419702, 34197, 0, 0, 100, 5, 4000, 8000, 6000, 9000, 11, 64943, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Devastating Leap 25'),
(3419703, 34197, 0, 0, 100, 3, 10000, 12000, 8000, 12000, 11, 64825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Staggering Roar 10'),
(3419704, 34197, 0, 0, 100, 5, 10000, 12000, 8000, 12000, 11, 64944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Staggering Roar 25');

-- Storm Tempered Keeper
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `dmg_multiplier` = 45, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33722;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33722);
REPLACE INTO `creature_ai_scripts` VALUES 
(3372201, 33722, 0, 0, 100, 3, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 10'),
(3372202, 33722, 0, 0, 100, 5, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 25'),
(3372203, 33722, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 10'),
(3372204, 33722, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 25');

-- Storm Tempered Keeper
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `dmg_multiplier` = 45, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33699;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33699);
REPLACE INTO `creature_ai_scripts` VALUES 
(3369901, 33699, 0, 0, 100, 3, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 10'),
(3369902, 33699, 0, 0, 100, 5, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 25'),
(3369903, 33699, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 10'),
(3369904, 33699, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 25');

-- Champion of Hodir
UPDATE `creature_template` SET `spell1` = 64639, `dmg_multiplier` = 55, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34133;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34133);
REPLACE INTO `creature_ai_scripts` VALUES 
(3413301, 34133, 0, 0, 100, 3, 3000, 6000, 12000, 16000, 11, 64639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion of Hodir - Cast Stomp 10'),
(3413302, 34133, 0, 0, 100, 5, 3000, 6000, 12000, 16000, 11, 64652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion of Hodir - Cast Stomp 25');
DELETE FROM `creature` WHERE `guid` IN (136293, 136294, 136295, 136292, 136313, 136314, 136312, 136321, 136319, 136320, 136322, 136346, 136343, 136536, 136533, 137563);

-- Winter Jormungar
UPDATE `creature_template` SET `spell1` = 64638, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34137;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34137);
REPLACE INTO `creature_ai_scripts` VALUES 
(3413701, 34137, 0, 0, 100, 3, 3000, 6000, 6000, 9000, 11, 64638, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Jormungar - Cast Acidic Bite 10'),
(3413702, 34137, 0, 0, 100, 5, 3000, 6000, 6000, 9000, 11, 64638, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Jormungar - Cast Acidic Bite 25');
UPDATE `creature` SET `spawndist` = 2 WHERE `id` = 34137;

-- Winter Revenant
UPDATE `creature_template` SET `spell1` = 64642, `spell2` = 64643, `spell3` = 64644, `mechanic_immune_mask` = 33554496, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34134;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34134);
REPLACE INTO `creature_ai_scripts` VALUES 
(3413401, 34134, 0, 0, 100, 3, 8000, 12000, 15000, 20000, 11, 64642, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Blizzard 10'),
(3413402, 34134, 0, 0, 100, 5, 8000, 12000, 15000, 20000, 11, 64653, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Blizzard 25'),
(3413403, 34134, 0, 0, 100, 3, 3000, 5000, 10000, 12000, 11, 64643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Whirling Strike 10'),
(3413404, 34134, 0, 0, 100, 5, 3000, 5000, 10000, 12000, 11, 64643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Whirling Strike 25'),
(3413405, 34134, 0, 0, 100, 3, 15000, 20000, 60000, 75000, 11, 64644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Shield of the Winter Revenant 10'),
(3413406, 34134, 0, 0, 100, 5, 15000, 20000, 60000, 75000, 11, 64644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Shield of the Winter Revenant 25');

-- Winter Rumbler
UPDATE `creature_template` SET `spell1` = 64645, `spell2` = 64647, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34135;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34135);
REPLACE INTO `creature_ai_scripts` VALUES 
(3413501, 34135, 0, 0, 100, 3, 6000, 12000, 10000, 16000, 11, 64645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Cone of Cold 10'),
(3413502, 34135, 0, 0, 100, 5, 6000, 12000, 10000, 16000, 11, 64655, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Cone of Cold 25'),
(3413503, 34135, 0, 0, 100, 3, 3000, 6000, 8000, 12000, 11, 64647, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Snow Blindness 10'),
(3413504, 34135, 0, 0, 100, 5, 3000, 6000, 8000, 12000, 11, 64654, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Snow Blindness 25');

-- Guardian Lasher
UPDATE `creature_template` SET `spell1` = 63007, `spell2` = 63047, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33430;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33430);
REPLACE INTO `creature_ai_scripts` VALUES
(3343001, 33430, 4, 0, 100, 30, 0, 0, 0, 0, 11, 63007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian Pheromones 10 and 25'),
(3343003, 33430, 0, 0, 100, 31, 3000, 6000, 10000, 14000, 11, 63047, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian''s Lash 10 and 25');

-- Forest Swarmer
UPDATE `creature_template` SET `spell1` = 63059, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33431;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33431);
REPLACE INTO `creature_ai_scripts` VALUES 
(3343101, 33431, 0, 0, 100, 3, 3000, 9000, 10000, 20000, 11, 63059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forest Swarmer - Cast Pollinate 10'),
(3343102, 33431, 0, 0, 100, 5, 3000, 9000, 10000, 20000, 11, 63059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forest Swarmer - Cast Pollinate 25');
/*
DELETE FROM `spell_script_target` WHERE `entry`=63059;
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES('63059','1','33430');
*/

-- Guardian of Life
UPDATE `creature_template` SET `spell1` = 63226, `mingold` = 7100, `maxgold` = 7600, `dmg_multiplier` = 15, `AIName` = 'EventAI' WHERE `entry` = 33528;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33528);
REPLACE INTO `creature_ai_scripts` VALUES 
(3352801, 33528, 0, 0, 100, 3, 3000, 9000, 15000, 20000, 11, 63226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Life - Cast Poison Breath 10'),
(3352802, 33528, 0, 0, 100, 5, 3000, 9000, 15000, 20000, 11, 63551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Life - Cast Poison Breath 25');

-- Nature's Blade
UPDATE `creature_template` SET `spell1` = 63247, `mingold` = 7100, `maxgold` = 7600, `dmg_multiplier` = 25, `AIName` = 'EventAI' WHERE `entry` = 33527;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33527);

-- Ironroot Lasher
UPDATE `creature_template` SET `spell1` = 63240, `mingold` = 7100, `maxgold` = 7600, `dmg_multiplier` = 15, `AIName` = 'EventAI' WHERE `entry` = 33526;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33526);
REPLACE INTO `creature_ai_scripts` VALUES 
(3352601, 33526, 0, 0, 100, 3, 3000, 8000, 12000, 16000, 11, 63240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironroot Lasher - Cast Ironroot Thorns 10'),
(3352602, 33526, 0, 0, 100, 5, 3000, 8000, 12000, 16000, 11, 63553, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironroot Lasher - Cast Ironroot Thorns 25');

-- Mangrove Ent
UPDATE `creature_template` SET `spell1` = 63272, `spell2` = 63242, `spell3` = 63241, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33525;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33525);
REPLACE INTO `creature_ai_scripts` VALUES 
(3352501, 33525, 0, 0, 100, 3, 8000, 12000, 25000, 30000, 11, 63272, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Hurricane 10'),
(3352502, 33525, 0, 0, 100, 5, 8000, 12000, 25000, 30000, 11, 63272, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Hurricane 25'),
(3352503, 33525, 0, 0, 100, 3, 12000, 16000, 12000, 16000, 11, 63242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Nourish 10'),
(3352504, 33525, 0, 0, 100, 5, 12000, 16000, 12000, 16000, 11, 63556, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Nourish 25'),
(3352505, 33525, 0, 0, 100, 3, 25000, 30000, 25000, 30000, 11, 63241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Tranquility 10'),
(3352506, 33525, 0, 0, 100, 5, 25000, 30000, 25000, 30000, 11, 63554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Tranquility 25');

-- Misguided Nymph
UPDATE `creature_template` SET `spell1` = 63082, `spell2` = 63111, `spell3` = 63136, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33355;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33355);
REPLACE INTO `creature_ai_scripts` VALUES 
(3335501, 33355, 0, 0, 100, 3, 8000, 12000, 25000, 30000, 11, 63082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Bind Life 10'),
(3335502, 33355, 0, 0, 100, 5, 8000, 12000, 25000, 30000, 11, 63559, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Bind Life 25'),
(3335503, 33355, 0, 0, 100, 3, 4000, 6000, 12000, 16000, 11, 63111, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Frost Spear 10'),
(3335504, 33355, 0, 0, 100, 5, 4000, 6000, 12000, 16000, 11, 63562, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Frost Spear 25'),
(3335505, 33355, 0, 0, 100, 3, 15000, 20000, 15000, 20000, 11, 63136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Winter''s Embrace 10'),
(3335506, 33355, 0, 0, 100, 5, 15000, 20000, 15000, 20000, 11, 63564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Winter''s Embrace 25');

-- Corrupted Servitor
UPDATE `creature_template` SET `spell1` = 63169, `spell2` = 63149, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33354;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33354);
REPLACE INTO `creature_ai_scripts` VALUES 
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
REPLACE INTO `creature_ai_scripts` VALUES 
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
REPLACE INTO `creature_ai_scripts` VALUES 
(3419201, 34192, 9, 0, 100, 3, 0, 3, 0, 0, 11, 55714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Boomer XP-500 - Explode 10'),
(3419202, 34192, 9, 0, 100, 5, 0, 3, 0, 0, 11, 55714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Boomer XP-500 - Explode 25');

-- Clockwork Sapper
UPDATE `creature_template` SET `spell1` = 64740, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 20, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34193;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34193);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419301, 34193, 0, 0, 100, 3, 2000, 6000, 12000, 16000, 11, 64740, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clockwork Sapper - Cast Energy Sap 10'),
(3419302, 34193, 0, 0, 100, 5, 2000, 6000, 12000, 16000, 11, 64740, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clockwork Sapper - Cast Energy Sap 25');

-- Twilight Adherent
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63760, `spell3` = 13704, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33818;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33818);
REPLACE INTO `creature_ai_scripts` VALUES 
(3381801, 33818, 0, 0, 100, 3, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Arcane Burst 10'),
(3381802, 33818, 0, 0, 100, 5, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Arcane Burst 25'),
(3381803, 33818, 0, 0, 100, 3, 18000, 24000, 20000, 24000, 11, 63760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Greater Heal 10'),
(3381804, 33818, 0, 0, 100, 5, 18000, 24000, 20000, 24000, 11, 63760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Greater Heal 25'),
(3381805, 33818, 0, 0, 100, 3, 2000, 4000, 10000, 16000, 11, 13704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Psychic Scream 10'),
(3381806, 33818, 0, 0, 100, 5, 2000, 4000, 10000, 16000, 11, 13704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Psychic Scream 25');

-- Twilight Guardian
UPDATE `creature_template` SET `spell1` = 52719, `spell2` = 62317, `spell3` = 63757, `mechanic_immune_mask` = 33554513, `equipment_id` = 1852, `dmg_multiplier` = 40, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33822;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33822);
REPLACE INTO `creature_ai_scripts` VALUES 
(3382201, 33822, 0, 0, 100, 3, 6000, 10000, 8000, 10000, 11, 52719, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Concussion Blow 10'),
(3382202, 33822, 0, 0, 100, 5, 6000, 10000, 8000, 10000, 11, 52719, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Concussion Blow 25'),
(3382203, 33822, 0, 0, 100, 3, 2000, 3000, 3000, 6000, 11, 62317, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Devastate 10'),
(3382204, 33822, 0, 0, 100, 5, 2000, 3000, 3000, 6000, 11, 62317, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Devastate 25'),
(3382205, 33822, 0, 0, 100, 3, 16000, 18000, 14000, 16000, 11, 63757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Thunderclap 10'),
(3382206, 33822, 0, 0, 100, 5, 16000, 18000, 14000, 16000, 11, 63757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Thunderclap 25');

-- Twilight Shadowblade
UPDATE `creature_template` SET `spell1` = 63753, `mechanic_immune_mask` = 33554513,  `equipment_id` = 1862, `dmg_multiplier` = 25, `baseattacktime` = 1000, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33824;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33824);
REPLACE INTO `creature_ai_scripts` VALUES 
(3382401, 33824, 0, 0, 100, 3, 6000, 8000, 14000, 16000, 11, 63753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Shadowblade - Cast Fan of Knives 10'),
(3382402, 33824, 0, 0, 100, 5, 6000, 8000, 14000, 16000, 11, 63753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Shadowblade - Cast Fan of Knives 25');

-- Twilight Slayer
UPDATE `creature_template` SET `spell1` = 63784, `spell2` = 35054, `mechanic_immune_mask` = 33554513, `equipment_id` = 1847, `dmg_multiplier` = 50, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33823;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33823);
REPLACE INTO `creature_ai_scripts` VALUES 
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
REPLACE INTO `creature_ai_scripts` VALUES 
(3377201, 33772, 0, 0, 100, 31, 18000, 22000, 15000, 20000, 11, 64429, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Death Grip 10 and 25'),
(3377203, 33772, 0, 0, 100, 31, 2000, 4000, 10000, 12000, 11, 63722, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Shadow Crash 10 and 25'),
(3377205, 33772, 4, 0, 100, 30, 0, 0, 0, 0, 11, 63703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Void Wave 10 and 25');

-- Twilight Frost Mage
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63758, `spell3` = 63912, `spell4` = 63913, `equipment_id` = 1849, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33819;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33819);
REPLACE INTO `creature_ai_scripts` VALUES 
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
REPLACE INTO `creature_ai_scripts` VALUES 
(3382001, 33820, 0, 0, 100, 3, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Arcane Burst 10'),
(3382002, 33820, 0, 0, 100, 5, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Arcane Burst 25'),
(3382003, 33820, 0, 0, 100, 3, 1000, 2000, 6000, 8000, 11, 63789, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Fireball 10'),
(3382004, 33820, 0, 0, 100, 5, 1000, 2000, 6000, 8000, 11, 63789, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Fireball 25'),
(3382005, 33820, 0, 0, 100, 3, 2000, 4000, 10000, 16000, 11, 63775, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Flamestrike 10'),
(3382006, 33820, 0, 0, 100, 5, 2000, 4000, 10000, 16000, 11, 63775, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Flamestrike 25');

-- Enslaved Fire Elemental
UPDATE `creature_template` SET `spell1` = 38064, `spell2` = 63778, `mechanic_immune_mask` = 33554513, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33838;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33838);
REPLACE INTO `creature_ai_scripts` VALUES
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
REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62475','9032','2','System Shutdown');

DELETE FROM areatrigger_scripts WHERE entry IN (5369, 5423);
REPLACE INTO areatrigger_scripts VALUES
(5369,'at_RX_214_repair_o_matic_station'),
(5423,'at_RX_214_repair_o_matic_station');

-- 8436_dalaran_teleporter
UPDATE `gameobject_template` SET `type` = 22, `data0` = 53141, `data2` = 1, `data3` = 1 WHERE `entry` = 194481;

-- 8440_achievement_antechamber
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10578, 10579, 10580, 10581);
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
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
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
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
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
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
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
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
REPLACE INTO `game_tele` VALUES
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `creature_loot_template` VALUES 
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
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
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
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('45481','45644','0','1','1','1','1'),
('45481','45645','0','1','1','1','1'),
('45481','45646','0','1','1','1','1');

-- Redone ref for TIER
DELETE FROM `reference_loot_template` WHERE `entry`='33955';
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
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
REPLACE INTO `gameobject_loot_template` VALUES 
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
REPLACE INTO `gameobject_loot_template` VALUES 
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
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES ('94382','32867','603','3','65535','0','0','1552.15','120.145','427.277','6.20744','604800','0','0','2998175','0','0','0');

DELETE FROM `creature` WHERE `guid`='94387';
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES ('94387','32927','603','3','65535','0','0','1596.43','105.539','427.273','0.759136','604800','0','0','2998175','4258','0','0');

DELETE FROM `creature` WHERE `guid`='94390';
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES ('94390','32857','603','3','65535','0','0','1596.37','134.229','427.271','5.65217','604800','0','0','2998175','212900','0','0');

-- 8642_ulduar_hodir
UPDATE `creature_template` SET `difficulty_entry_1` = 33909, `unit_flags` = 0 WHERE `entry` = 32930;
UPDATE `creature_template` SET `ScriptName` = 'mob_snowpacked_icicle' WHERE `entry` = 33174;
-- toasty fire immunities
DELETE FROM spell_linked_spell WHERE spell_trigger=65280;
REPLACE INTO spell_linked_spell VALUES
(65280,-62469,2,'Toasty fire - Freeze imunity'),
(65280,-62039,2,'Toasty fire - Biting cold imunity');

-- 8650_mimiron_hardmode
-- Mimiron Flames
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `modelid1` = 11686, `ScriptName` = 'mob_mimiron_flame_spread' WHERE `entry` = 34121;

-- 8655_ulduar_25_stats
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
-- NOTE NECESSARY INFO ALSO THIS INFO IS DELETING THE MODELID AND LOOTID, THIS IS ALREADY IN CTDB
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

-- Sif
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `unit_flags` = 33554434 WHERE `entry` IN (33196, 33234);
-- Kel Thuzad immunity
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299839 WHERE `entry` IN (15990, 30061);

-- Archivum Data Disc drop
DELETE FROM `creature_loot_template` WHERE entry IN (32927, 32867) AND item = 45506;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('32927','45506','100','1','0','1','1','0','0','0'),
('32867','45506','100','1','0','1','1','0','0','0');

-- Runed Orb ai keepers
DELETE FROM `gameobject_loot_template` WHERE entry IN (27085, 27086, 27068, 27073,27074) AND item = 45087;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('27085','45087','75','1','0','1','1','0','0','0'),
('27086','45087','75','1','0','1','1','0','0','0'),
('27068','45087','75','1','0','1','1','0','0','0'),
('27073','45087','75','1','0','1','1','0','0','0'),
('27074','45087','75','1','0','1','1','0','0','0');

-- Hodir Flash Freeze
UPDATE `creature_template` SET `difficulty_entry_1` = 33352, `modelid1` = 25865, `modelid2` = 0, `mechanic_immune_mask` = 612597599, `flags_extra` = 0, `ScriptName` = 'npc_flash_freeze_pre' WHERE `entry` = 32926;
UPDATE `creature_template` SET `difficulty_entry_1` = 33353, `mechanic_immune_mask` = 612597599 WHERE `entry` = 32938;
UPDATE `creature_template` SET `modelid1` = 25865, `modelid2` = 0, `faction_A` = 14, `faction_H` = 14, `unit_flags` = 393220, `mechanic_immune_mask` = 612597599, `flags_extra` = 0 WHERE `entry` IN (33352, 33353);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (61969, 61990);
REPLACE INTO `spell_linked_spell` VALUES
(61969, 7940, 2, "Hodir Flash Freeze immunity"),
(61990, 7940, 2, "Hodir Flash Freeze immunity");

-- Ulduar chain
DELETE FROM reference_loot_template WHERE entry = 34111 AND item = 45538;

DELETE FROM gameobject WHERE id = 194555;
REPLACE INTO gameobject VALUES (NULL, 194555, 603, 3, 1, 1435.56, 118.954, 423.641, 0, 0, 0, 0, 1, 300, 0, 1);
DELETE FROM creature WHERE id = 33956;
REPLACE INTO creature VALUES (NULL, 33956, 603, 3, 1, 0, 0, 1443.61, 119.143, 423.641, 3.1675, 300, 0, 0, 75600, 0, 0, 0);

DELETE FROM `gameobject_loot_template` WHERE entry IN (27074, 27086) AND item IN (45784, 45787);
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('27074','45784','-100','1','0','1','1','9','13610','0'),
('27086','45787','-100','1','0','1','1','9','13611','0');

UPDATE `quest_template` SET `PrevQuestId` = 13607, `NextQuestId` = 13614, `ExclusiveGroup` = -13606, `NextQuestInChain` = 0, `QuestFlags` = 192 WHERE `entry` IN (13606, 13609, 13611, 13610);
UPDATE `quest_template` SET `PrevQuestId` = 13604, `SpecialFlags` = 2 WHERE `entry` = 13607;
DELETE FROM `areatrigger_involvedrelation` WHERE `quest` = 13607;
REPLACE INTO `areatrigger_involvedrelation` (`id`, `quest`) VALUES (5400, 13607);

DELETE FROM `item_loot_template` WHERE entry = 45875;
REPLACE INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('45875','45087','100','1','0','1','1','0','0','0'),
('45875','45624','100','1','0','5','5','0','0','0');

-- Archivum Data Disc drop
DELETE FROM `creature_loot_template` WHERE entry IN (33692, 33693) AND item = 45857;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('33692','45857','100','1','0','1','1','0','0','0'),
('33693','45857','100','1','0','1','1','0','0','0');