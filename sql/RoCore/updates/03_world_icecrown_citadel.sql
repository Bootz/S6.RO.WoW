-- Icecrown Citadel
-- Db version requirement
ALTER TABLE db_version CHANGE COLUMN required_31_world_db_version required_3_world_icecrown_citadel bit;

DELETE FROM `creature_template` WHERE `entry` IN (36823, 36824);
REPLACE INTO `creature_template` VALUES
('36823','0','0','0','0','0','31021','0','0','0','Terenas Menethil','','','0','80','80','2','35','35','0','1','1.14286','1','1','391','585','0','146','2.2','2000','2000','2','524288','0','0','0','0','0','0','313','468','117','7','4096','0','0','0','0','0','0','0','0','0','69382','72595','0','0','0','0','0','0','0','0','0','0','','0','3','25','15','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_terenas_menethil','1'),
('36824','39296','0','0','0','38121','31471','0','0','0','Spirit Warden','','','0','80','80','2','14','14','0','1','1.14286','1','1','391','585','0','146','2','2000','2000','2','524288','0','0','0','0','0','0','313','468','117','6','4096','0','0','0','0','0','0','0','0','0','69383','74086','69397','0','0','0','0','0','0','0','0','0','','0','3','20','15','1','0','0','0','0','0','0','0','0','1','0','1758157559','0','npc_spirit_warden','1');

-- Wrong faction(I did not add these)
UPDATE `creature_template` SET `faction_A`='16', `faction_H`='16' WHERE `entry`='27805'; 
UPDATE `creature_template` SET `faction_A`='1801', `faction_H`='1801' WHERE `entry`='27826'; 

-- Wrong move generation
UPDATE `creature_template` SET `MovementType`='1'WHERE `entry`='438700'; 
UPDATE `creature` SET `MovementType`='1'WHERE `guid`='54575'; 

-- Declaring instance
UPDATE `instance_template` SET `script`='instance_icecrown_citadel' WHERE (`map`='631');

-- Some gameobjet for ICC (teleporters)
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 202223;
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 202242;

-- Halion Flame Ring
DELETE FROM `gameobject` WHERE `id`=203624;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(2151041, 203624, 724, 1, 32, 3154.56, 535.418, 72.8889, 5.53401, 0, 0, 0.36589, -0.930658, 3000, 0, 1);

REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`) VALUES (202796, 10, 1327, 'Twilight Portal', '', '', '', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- this is not necessary, is already implemented in ytdb 562
/*
-- Icc Platform Positions
DELETE FROM `gameobject_template` WHERE (`entry`=202078);
REPLACE INTO `gameobject_template` VALUES (202078, 14, 9256, 'Arthas Precipice', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);
DELETE FROM `gameobject_template` WHERE (`entry`=202161);
REPLACE INTO `gameobject_template` VALUES (202161, 14, 9276, 'Arthas Platform',  '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);
*/

-- Some creature_ai_scripts
-- Some events cant be repetables set to 0 to can be repeteable
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34606);
REPLACE INTO `creature_ai_scripts` VALUES 
(270000, 34606, 0, 0, 100, 7, 0, 0, 0, 0, 11, 66193, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Force Cast');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=38879);
REPLACE INTO `creature_ai_scripts` VALUES 
(3887900, 38879, 9, 0, 100, 6, 1, 25, 15000, 20000, 11, 70460, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Putricide Trap Trigger');

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
REPLACE INTO `creature_template_addon` (`entry`,`mount`,`bytes2`) VALUES ('5542668', '36476', '4097');
REPLACE INTO `creature_template_addon` (`entry`,`mount`,`bytes2`) VALUES ('5542667', '36661', '4097');
*/
-- where is the npc 500202 to use creature_ai_scripts?....
/*
UPDATE `creature_template` SET `baseattacktime` = 3000, `Health_mod` = 100, `Mana_mod` = 100 WHERE `entry` = 500202;
UPDATE `creature_template` SET `type` = 3 WHERE `entry` = 500202;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500202);
REPLACE INTO `creature_ai_scripts` VALUES 
( 50020211, 500202, 0, 0, 100, 7, 10000, 20000, 15000, 30000, 11, 59971, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rain of fire'),
(50020212, 500202, 2, 0, 100, 7, 10, 10, 0, 0, 11, 59971, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Hellfire');
*/
-- you can put an arm or mount but not cloth an npc
/*
DELETE FROM `creature_equip_template` WHERE `entry` IN (500203, 500204);
REPLACE INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (500203, 20033, 20009, 9060);
*/
-- what is this update for?... this NPC does not exist in db use to check: SELECT * FROM `creature_template` WHERE `entry` IN (500203, 500204, 500206, 500208);
/*
UPDATE `creature_template` SET `type` = 3 WHERE `entry` = 500203;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500203);
REPLACE INTO `creature_ai_scripts` VALUES 
(50020301, 500203, 0, 0, 100, 7, 10000, 10000, 10000, 10000, 11, 13009, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Knockback');

UPDATE `creature_template` SET `type` = 3 WHERE `entry` = 500204;
UPDATE `creature_template` SET `spell2` = 69389 WHERE `entry` = 500204;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500204);
REPLACE INTO `creature_ai_scripts` VALUES 
(50020401, 500204, 0, 0, 100, 7, 1000, 2000, 3000, 3000, 11, 70281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emp Shadow Bolt');
UPDATE `creature_template` SET `mindmg` = 20000, `maxdmg` = 25000 WHERE `entry` = 500206;
DELETE FROM `creature_equip_template` WHERE (`entry`=500206);
REPLACE INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (500206, 19352, 0, 0);
UPDATE `creature_template` SET `spell1` = 17012 WHERE `entry` = 500208;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500208);
REPLACE INTO `creature_ai_scripts` VALUES 
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
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
(13,0,70572,0,18,1,37920,0,0, '', 'Deathbringer Saurfang - Grip of Agony'),
(13,0,70572,0,18,1,37200,0,0, '', 'Deathbringer Saurfang - Grip of Agony'),
(13,0,70572,0,18,1,37187,0,0, '', 'Deathbringer Saurfang - Grip of Agony'),
(13,0,70572,0,18,1,37830,0,0, '', 'Deathbringer Saurfang - Grip of Agony'),
(13,0,72202,0,18,1,37813,0,0, '', 'Deathbringer Saurfang - Blood Link');

-- Deathbringer's Cache
-- blizzlike position
DELETE FROM `gameobject` WHERE `id` IN (@DeathbringerCache10N,@DeathbringerCache25N,@DeathbringerCache10H,@DeathbringerCache25H);
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(2753,@DeathbringerCache10N,631,1,1,-489.7205,2172.06763,539.289368,2.652894,0,0,0,0,-120,0,1),
(2761,@DeathbringerCache25N,631,2,1,-489.7205,2172.06763,539.289368,2.652894,0,0,0,0,-120,0,1),
(2724,@DeathbringerCache10H,631,4,1,-489.7205,2172.06763,539.289368,2.652894,0,0,0,0,-120,0,1),
(2910,@DeathbringerCache25H,631,8,1,-489.7205,2172.06763,539.289368,2.652894,0,0,0,0,-120,0,1);

-- Achievements
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12776,12997,12995,12998,12778,13036,13035,13037) AND `type`!=11;
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
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
REPLACE INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
(@NPCOverlord25N,0,0,0,0,0,30583,0,0,0, 'High Overlord Saurfang (1)', '', '',0,83,83,2,1735,1735,1,1,1.14286,1,3,509,683,0,805,35,0,0,1,33600,8,0,0,0,0,0,371,535,135,7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,599,0,0, '',0,3,300,1,1,0,0,0,0,0,0,0,164,1,0,0,0, '',1),
(@NPCOverlord10H,0,0,0,0,0,30583,0,0,0, 'High Overlord Saurfang (2)', '', '',0,83,83,2,1735,1735,1,1,1.14286,1,3,509,683,0,805,35,0,0,1,33600,8,0,0,0,0,0,371,535,135,7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,599,0,0, '',0,3,300,1,1,0,0,0,0,0,0,0,164,1,0,0,0, '',1),
(@NPCOverlord25H,0,0,0,0,0,30583,0,0,0, 'High Overlord Saurfang (3)', '', '',0,83,83,2,1735,1735,1,1,1.14286,1,3,509,683,0,805,35,0,0,1,33600,8,0,0,0,0,0,371,535,135,7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,599,0,0, '',0,3,300,1,1,0,0,0,0,0,0,0,164,1,0,0,0, '',1);

-- info for tc 9607 Deathbringer Saurfang - additional data missed in previous topic
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=72260;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,72260,0,18,1,37920,0,0, '', 'Deathbringer Saurfang - Mark of the Fallen Champion heal');

-- Equip templates
DELETE FROM `creature_equip_template` WHERE (`entry`=500207);
REPLACE INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (500207, 25210, 0, 0);
UPDATE `creature_template` SET `mindmg` = 15000, `maxdmg` = 20000 WHERE `entry` = 500207;

-- Fix for vehicles
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38402';
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38582';
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38583';

-- Some loots
DELETE FROM `creature_loot_template` WHERE (`entry`=500209) AND (`item`=50307);
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES (500209, 50307, 100,  '1', '1');
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
UPDATE `creature_template` SET `ScriptName`='npc_volatile_ooze' WHERE `entry` = 37697;
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
UPDATE `creature_template` SET `ScriptName`='npc_shambling_horror_icc' WHERE (`entry`='37698');
UPDATE `creature_template` SET `ScriptName`='npc_terenas_menethil' WHERE (`entry`='36823');
UPDATE `creature_template` SET `ScriptName`='npc_spirit_warden' WHERE (`entry`='36824');
UPDATE `creature_template` SET `ScriptName`='npc_sister_svalna' WHERE (`entry` = '37126');
UPDATE `creature_template` SET `ScriptName`='npc_impaling_spear' WHERE (`entry` = '38248');
UPDATE `creature_template` SET `ScriptName`='npc_gas_cloud_icc' WHERE `entry` = 37562;
UPDATE `creature_template` SET `ScriptName`='lanathel_intro' WHERE (`entry`='38004');

-- Inserting NPC's on world
DELETE FROM `creature` WHERE `id`=38004;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(1084973, 38004, 631, 1, 128, 0, 0, 4689.4, 2766.9, 383.049, 3.47957, 300, 0, 0, 861, 60, 0, 0);

DELETE FROM `creature` WHERE `id`=37985;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
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
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5543011, 36658, 658 <--- NOT ICC MAP, 15, 3, 0, 2013, 969.309, 180.069, 628.156, 5.95328, 300, 0, 0, 653829, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=36661;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5543609, 36661, 658 <--- NOT ICC MAP, 1, 3, 0, 0, 967.121, 181.192, 639.719, 5.84175, 300, 0, 0, 3235440, 41690, 0, 0);
*/

DELETE FROM `creature` WHERE `id`=36823;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5566038, 36823, 631, 1, 64, 0, 0, 505.56, -2522.96, 1249.87, 3.12086, 300, 0, 0, 315000, 59910, 0, 0);

DELETE FROM `creature` WHERE `id`=36824;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5565952, 36824, 631, 1, 64, 0, 0, 482.812, -2523.32, 1249.87, 6.24047, 300, 0, 0, 252000, 59910, 0, 0);

-- Deleting scripts text
DELETE FROM script_texts WHERE entry <= -1665902 AND entry >= -1666080;
DELETE FROM script_texts WHERE entry <= -1810001 AND entry >= -1810031;

-- Scripts texts

# 3
REPLACE INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
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
REPLACE INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
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
REPLACE INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
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
REPLACE INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
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
REPLACE INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
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
REPLACE INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
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
REPLACE INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666063,'Heroes, lend me your aid! I... I cannot hold them off much longer! You must heal my wounds!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17064,1,0,0,''),
(0,-1666064,'I have opened a portal into the Emerald Dream. Your salvation lies within, heroes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17068,1,0,0,''),
(0,-1666065,'My strength is returning! Press on, heroes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17070,1,0,0,''),
(0,-1666066,'I will not last much longer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17069,1,0,0,''),
(0,-1666067,'Forgive me for what I do! I... cannot... stop... ONLY NIGHTMARES REMAIN!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17072,1,0,0,''),
(0,-1666068,'A tragic loss...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17066,1,0,0,''),
(0,-1666069,'FAILURES!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17067,1,0,0,''),
(0,-1666070,'I am renewed! Ysera grants me the favor to lay these foul creatures to rest!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17071,1,0,0,'');

# 11
REPLACE INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
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
REPLACE INTO script_texts (entry,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8,sound,type,language,emote,comment)VALUES
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
REPLACE INTO script_texts (entry,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8,sound,type,language,emote,comment)VALUES
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
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
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
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
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
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
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
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
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
REPLACE INTO `creature_ai_scripts` VALUES  (3887900, 38879, 9, 0, 100, 6, 1, 30, 8000, 10000, 11, 70460, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- OTHER
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128,minlevel=80,maxlevel=80 WHERE `entry`=36672;

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
REPLACE INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
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
REPLACE INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
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
REPLACE INTO `creature_ai_scripts` VALUES 
(3887900, 38879, 9, 0, 100, 6, 1, 30, 8000, 10000, 11, 70460, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `creature_template` SET `spell4` = 34873, `spell5` = 60534 WHERE `entry` = 27258;
DELETE FROM `creature_questrelation` WHERE `quest` = 12779;
DELETE FROM `gameobject_questrelation` WHERE `quest` = 12779;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 12779;
REPLACE INTO `creature_questrelation` (`id`, `quest`) VALUES (29110, 12779);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 29110;
REPLACE INTO `creature_questrelation` (`id`, `quest`) VALUES (25462, 12779);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 25462;
DELETE FROM `creature_involvedrelation` WHERE `quest` = 12779;
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 12779;
REPLACE INTO `creature_involvedrelation` (`id`, `quest`) VALUES (29110, 12779);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=29110;
REPLACE INTO `creature_involvedrelation` (`id`, `quest`) VALUES (25462, 12779);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=25462;
DELETE FROM `creature` WHERE `id`=25462;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(96146, 25462, 609, 1, 7, 0, 0, 2345.3, -5671.36, 426.03, 3.78, 120, 0, 0, 27890000, 0, 0, 0),
(5683368, 25462, 609, 1, 64, 0, 0, 2310.21, -5741.9, 161.147, 0.561972, 300, 0, 0, 17964000, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=25462;

REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(96146, 25462, 609, 1, 7, 0, 0, 2345.3, -5671.36, 426.03, 3.78, 120, 0, 0, 27890000, 0, 0, 0),
(5683368, 25462, 609, 1, 64, 0, 0, 2310.21, -5741.9, 161.147, 0.561972, 300, 0, 0, 17964000, 0, 0, 0);

# GameObject
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

REPLACE INTO creature_addon (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(136107, 0, 0, 0, 1, 0, '18950 0 18950 1 72242 0');

REPLACE INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(37690, 0, 0, 0, 0, 0, '70345 0  70343 0'),
(37672, 0, 0, 0, 0, 0, '70385 0 70405 0');

#Thanks YTDB

# Conditions

DELETE FROM `conditions` WHERE `SourceEntry` IN (69508,69785,69788,70881,69248,69240,70341,70360,71617);

REPLACE INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`) VALUES
(13,0,69508,0,18,1,37986,0),
(13,0,70881,0,18,1,37986,0),
(13,0,70360,0,18,1,37690,0);

#creature

DELETE FROM `creature` WHERE `id`=37013;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(48969,37013,631,1,1,11686,0,4291.18,3092.92,372.97,2.33874,300,0,0,25200,0,0,0),
(48971,37013,631,1,1,11686,0,4312.14,3112.98,372.97,2.51327,300,0,0,25200,0,0,0),
(48973,37013,631,1,1,11686,0,4244.04,3092.66,372.97,0.97738,300,0,0,25200,0,0,0),
(48976,37013,631,1,1,11686,0,4223.47,3113.58,372.97,0.76794,300,0,0,25200,0,0,0),
(48981,37013,631,1,1,11686,0,4222.44,3161.69,372.97,5.53269,300,0,0,25200,0,0,0),
(48983,37013,631,1,1,11686,0,4243.89,3181.74,372.97,5.44543,300,0,0,25200,0,0,0),
(48989,37013,631,1,1,11686,0,4312.36,3160.84,372.97,3.80482,300,0,0,25200,0,0,0),
(48990,37013,631,1,1,11686,0,4291.45,3181.25,372.97,4.10152,300,0,0,25200,0,0,0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (70107);
REPLACE INTO `spell_proc_event` VALUES (70107, 0x08, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000054, 0x00000000, 0, 20, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (69762);
REPLACE INTO `spell_proc_event` VALUES (69762, 0x00, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00014000, 0x00000000, 0, 101, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (72178);
REPLACE INTO `spell_proc_event` VALUES (72178, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00055510, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (72176);
REPLACE INTO `spell_proc_event` VALUES (72176, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00051154, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (70602);
REPLACE INTO `spell_proc_event` VALUES (70602, 0x20, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x000AAA20, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (71494);
REPLACE INTO `spell_proc_event` VALUES (71494, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 101, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (72176);
REPLACE INTO `spell_proc_event` VALUES (72176, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00051154, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (72178);
REPLACE INTO `spell_proc_event` VALUES (72178, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00055510, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (71604);
REPLACE INTO `spell_proc_event` VALUES (71604, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (70001);
REPLACE INTO `spell_proc_event` VALUES (70001, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (71971);
REPLACE INTO `spell_proc_event` VALUES (71971, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (72256);
REPLACE INTO `spell_proc_event` VALUES (72256, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (72408);
REPLACE INTO `spell_proc_event` VALUES (72408, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000000, 0, 100, 0);

DELETE FROM `spell_proc_event` WHERE `entry` IN (72455);
REPLACE INTO `spell_proc_event` VALUES (72455, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000000, 0, 100, 0);

UPDATE `creature_template` SET `ScriptName`='npc_bloodbeast' WHERE `entry` = 38508;

UPDATE `creature_template` SET `faction_A` = 21, `faction_H` = 21, `unit_flags` = 33600, `vehicleId` = 639 WHERE `entry` IN (37813,38402,38582,38583);

DELETE FROM `creature` WHERE `id`=37813;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(136107, 37813, 631, 15, 1, 30790, 0, -461.512, 2211.11, 541.197, 3.14159, 300, 0, 0, 12299490, 0, 0, 0);

#Linked spell

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 72202;
DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN(72202,69166,70347,72380);
REPLACE INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(70360,70347,0,'Eat Ooze'),
(72379,72380,0,'Blood Nova'),
(72380,72202,0,'Blood Nova 10N'),
(72438,72202,0,'Blood Nova 25N'),
(72439,72202,0,'Blood Nova 10H'),
(72440,72202,0,'Blood Nova 25H'),
(72409,72202,0,'Rune of Blood 25N'),
(72447,72202,0,'Rune of Blood 10H'),
(73448,72202,0,'Rune of Blood 25H'),
(73449,72202,0,'Rune of Blood 25H'),
(69195,69166,0,'Pungent Blight 10N'),
(71279,69166,0,'Pungent Blight 25N'),
(73031,69166,0,'Pungent Blight 10H'),
(73032,69166,0,'Pungent Blight 25H');

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

UPDATE `creature_template` SET `vehicleId` = 318 WHERE `entry` IN (36609,39120,39121,39122);

UPDATE `gameobject_template` SET `ScriptName` = 'go_icecrown_teleporter' WHERE `entry` IN (202223,202235,202242,202243,202244,202245,202246);

UPDATE `creature_template` SET `spell1` = 70360, `spell2` = 70539, `spell3` = 70542, `VehicleId` = 591 WHERE `entry` IN (37672,38605,38786,38787);

UPDATE `creature_template` SET `ScriptName`='npc_choking_gas_bomb' WHERE `entry` = 38159;
UPDATE `creature_template` SET `ScriptName`='npc_bomb_icc' WHERE `entry`=38454;