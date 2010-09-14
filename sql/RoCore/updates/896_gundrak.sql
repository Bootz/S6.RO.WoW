-- GUNDRAK
-- Working 100% full blizz with CTDB
-- Modify some factions.
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry` IN (29573, 31367, 29680, 29713, 30940, 30943);
UPDATE `creature_template` SET `faction_A`=7, `faction_H`=7 WHERE `entry`=29932;

-- DB spawn eck (serverdown issues, in case of crash do not appear again).
DELETE FROM `creature` WHERE `id`=29932;
INSERT INTO `creature` (`guid`,`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
('81823','29932','604','2','1','26644','0','1640.008423','931.781738','107.357620','0.668432','86400','0','0','431392','0','0','0');

-- dont spawn drakkari colossus related living mojo, remove respawn links
UPDATE `creature` SET `spawnMask` = '0' WHERE `guid` IN ('85542','85543','85544','85545','85555');
DELETE FROM `creature_linked_respawn` WHERE `guid` IN ('85542','85543','85544','85545','85555');

-- Scriptname Gal'darah <High Prophet of Akali> summon
update `creature_template` set `ScriptName` = 'mob_rhino_spirit' where `entry` = '29791';
-- Experimental vehicle id for Impaling Charge http://www.wowhead.com/spell=54958
update `creature_template` set `VehicleId` = '169' where `entry` in ('29306','31368');

-- Trigger Eck residue: Eck Spit http://www.wowhead.com/spell=55814 to Eck Residue http://www.wowhead.com/spell=55817
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = '55814';
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
('55814','55817','1','Eck Spit - Apply Eck Residue');

-- Gundrak script text data (sd2)
-- Cleaning 
DELETE FROM `script_texts` WHERE `entry` BETWEEN '-1604030' AND '-1604000';
-- -1 604 000 GUNDRAK
INSERT INTO script_texts (npc_entry,entry,content_default,sound,TYPE,LANGUAGE,emote,COMMENT) VALUES
(29304,-1604000,'Drakkari gonna kill anybody who trespass on these lands!',14443,1,0,0,'sladran SAY_AGGRO'),
(29304,-1604001,'Minions of the scale, heed my call!',14444,1,0,0,'sladran SAY_SUMMON_SNAKE'),
(29304,-1604002,'Our thousand fangs gonna rend your flesh! ',14445,1,0,0,'sladran SAY_SUMMON_CONSTRICTOR'),
(29304,-1604003,'Ye not breathin\'! Good.',14446,1,0,0,'sladran SAY_SLAY_1'),
(29304,-1604004,'You scared now?',14447,1,0,0,'sladran SAY_SLAY_2'),
(29304,-1604005,'I\'ll eat you next, mon!',14448,1,0,0,'sladran SAY_SLAY_3'),
(29304,-1604006,'I sssee now... Ssscourge wasss not... our greatessst enemy...',14449,1,0,0,'sladran SAY_DEATH'),
(29304,-1604007,'%s begins to cast Poison Nova!',0,3,0,0,'sladran EMOTE_NOVA'),

(29307,-1604008,'%s surges forward!',0,2,0,0,'colossus EMOTE_SURGE'),
(29307,-1604009,'%s seep into the ground.',0,2,0,0,'colossus EMOTE_SEEP'),
(29307,-1604010,'%s begins to glow faintly.',0,2,0,0,'colossus EMOTE_GLOW'),

(29305,-1604011,'We fought back da Scourge. What chance joo be thinkin\' JOO got?',14721,1,0,0,'moorabi SAY_AGGRO'),
(29305,-1604012,'Da ground gonna swallow you up! ',14723,1,0,0,'moorabi SAY_QUAKE'),
(29305,-1604013,'Get ready for somethin\'... much... BIGGAH!',14722,1,0,0,'moorabi SAY_TRANSFORM'),
(29305,-1604014,'I crush you, cockroaches!',14725,1,0,0,'moorabi SAY_SLAY_1'),
(29305,-1604015,'Who gonna stop me; you?',14726,1,0,0,'moorabi SAY_SLAY_2'),
(29305,-1604016,'Not so tough now.',14727,1,0,0,'moorabi SAY_SLAY_3'),
(29305,-1604017,'If our gods can die... den so can we...',14728,1,0,0,'moorabi SAY_DEATH'),
(29305,-1604018,'%s begins to transform!',0,3,0,0,'moorabi EMOTE_TRANSFORM'),

(29306,-1604019,'I\'m gonna spill your guts, mon!',14430,1,0,0,'galdarah SAY_AGGRO'),
(29306,-1604020,'Ain\'t gonna be nottin\' left after this!',14431,1,0,0,'galdarah SAY_TRANSFORM_1'),
(29306,-1604021,'You wanna see power? I\'m gonna show you power!',14432,1,0,0,'galdarah SAY_TRANSFORM_2'),
(29306,-1604022,'Gut them! Impale them!',14433,1,0,0,'galdarah SAY_SUMMON_1'),
(29306,-1604023,'Kill them all!',14434,1,0,0,'galdarah SAY_SUMMON_2'),
(29306,-1604024,'Say hello to my BIG friend!',14435,1,0,0,'galdarah SAY_SUMMON_3'),
(29306,-1604025,'What a rush!',14436,1,0,0,'galdarah SAY_SLAY_1'),
(29306,-1604026,'Who needs gods, when WE ARE GODS!',14437,1,0,0,'galdarah SAY_SLAY_2'),
(29306,-1604027,'I told ya so!',14438,1,0,0,'galdarah SAY_SLAY_3'),
(29306,-1604028,'Even the mighty... can fall.',14439,1,0,0,'galdarah SAY_DEATH'),
(29305,-1604029,'%s transforms into a Mammoth!',14724,2,0,0,'moorabi EMOTE_TRANSFORMED');

-- Loot & Rep
-- Disable loot for Drakkari Colossus, add heroic skinloot
-- This need checking.
-- UPDATE `creature_template` SET `lootid` = '0', `skinloot` = '80103' WHERE `entry` IN ('29307','31365');

-- Disable rep for Drakkari Colossus
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` IN ('29307','31365');

-- Immunities ***/
-- All bosses
update `creature_template` set `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 where `entry` in (29304,31370,29307,31365,29573,31367,29306,31368,29932,29305,30530);
-- Moorabi
update `creature_template` set `mechanic_immune_mask` = `mechanic_immune_mask` &~ 256 &~ 2048 &~ 33554432 where `entry` in (29305,30530); 
update `creature_template` set `mechanic_immune_mask` = `mechanic_immune_mask` &~ 2097152 where `entry` in (29304,31370,29307,31365,29573,31367,29306,31368,29932,29305,30530);

-- Modify snake wrap faction
update `creature_template` set `faction_A` = '16', `faction_H` = '16' where `entry` in ('29742','32218');
-- Set snake wrap scriptname
update `creature_template` set `ScriptName` = 'mob_snake_wrap' where `entry` = '29742';

-- Adjust rhino spirit npclevel
update `creature_template` set `minlevel` = '78', `maxlevel` = '82' where `entry` = '29791';

-- Creature_ai_scripts
-- Change spitting cobra events
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = '29774';
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, 
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, 
`action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('2977401','29774','1','0','100','6','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Spitting Cobra - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('2977402','29774','4','0','100','2','0','0','0','0','11','32860','1','0','23','1','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit and Set Phase 1 on Aggro'),
('2977403','29774','9','5','100','3','0','30','12000','15000','11','32860','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit (Phase 1)'),
('2977404','29774','4','0','100','4','0','0','0','0','11','38378','1','0','23','1','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit and Set Phase 1 on Aggro'),
('2977405','29774','9','5','100','5','0','30','12000','15000','11','38378','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit (Phase 1)'),
('2977406','29774','3','5','100','6','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Spitting Cobra - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('2977407','29774','9','5','100','6','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Spitting Cobra - Start Combat Movement at 35 Yards (Phase 1)'),
('2977408','29774','9','5','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Spitting Cobra - Prevent Combat Movement at 15 Yards (Phase 1)'),
('2977409','29774','9','5','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Spitting Cobra - Start Combat Movement Below 5 Yards'),
('2977410','29774','3','3','100','7','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Spitting Cobra - Set Phase 1 when Mana is above 15% (Phase 2)'),
('2977411','29774','0','0','100','3','5000','10000','17000','20000','11','55703','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Cobra Strike'),
('2977412','29774','0','0','100','5','5000','10000','17000','20000','11','59020','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Cobra Strike'),
('2977413','29774','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Spitting Cobra - Set Phase to 0 on Evade');
/*
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = '29774';
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('2977401','29774','4','0','100','2','0','0','0','0','11','55700','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('2977402','29774','4','0','100','4','0','0','0','0','11','59019','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('2977403','29774','9','0','100','3','5','30','2300','5000','11','55700','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('2977404','29774','9','0','100','5','5','30','2300','5000','11','59019','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('2977405','29774','9','0','100','3','0','5','5000','9000','11','55703','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Cobra Strike');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('2977406','29774','9','0','100','5','0','5','5000','9000','11','59020','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Cobra Strike');
*/
-- Add selfheal to drakkari medicine man
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = '29826';
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, 
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, 
`action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('2982601','29826','14','0','100','7','10000','30','12000','15000','11','55598','6','0','0','0','0','0','0','0','0','0','Drakkari Medecine Man - Cast Cleanse Magic on Friendlies'),
('2982602','29826','3','0','100','7','30','0','22000','29000','11','55582','4','1','0','0','0','0','0','0','0','0','Drakkari Medecine Man - Cast Mana Link at 30% MP'),
('2982603','29826','14','0','100','3','30000','40','14000','21000','11','55597','6','1','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Normal) - Cast Healing Wave on Friendlies'),
('2982604','29826','14','0','100','5','45000','40','14000','21000','11','58980','6','1','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Heroic) - Cast Healing Wave on Friendlies'),
('2982605','29826','2','0','100','2','50','0','0','0','11','55599','0','1','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Normal) - Cast Earth Shield at 50% HP'),
('2982606','29826','2','0','100','4','50','0','0','0','11','58981','0','1','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Heroic) - Cast Earth Shield at 50% HP'),
('2982607','29826','2','0','100','3','75','0','10000','16000','11','55597','0','0','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Normal) - Cast Healing Wave on Self'),
('2982608','29826','2','0','100','5','75','0','10000','16000','11','58980','0','0','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Heroic) - Cast Healing Wave on Self');
