-- HALL OF STONE.
-- Tribunal Chest
-- Make looteable when event finish.
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` IN (190586,193996);
-- Respawn each 24h
UPDATE `gameobject` SET `spawntimesecs` = 86400 WHERE `id` IN (190586,193996);

-- Ignore faction and aggroof "Channel Target" http://www.wowhead.com/npc=28055
UPDATE `creature_template` SET `flags_extra` = `flags_extra`|2 , `unit_flags` = `unit_flags`|2 WHERE `entry` = 28055;

-- Flags_extra for tribunal npcs.
UPDATE `creature_template` SET `flags_extra`= `flags_extra`|2|128 , `InhabitType`= 4 WHERE `entry` IN (28234,28235,28237,28265,30897,30898,30899,31874,31875,31878);

-- kleines model für dunkle materie
UPDATE `creature_template` SET `modelid1` = 17200, `modelid2` = 17200 WHERE `entry` IN (28235,31874);

-- Dark Matter http://www.wowhead.com/npc=28235
UPDATE `creature` SET `spawnMask` = 0 WHERE `guid` = 123473;

-- Inmunidad for all bosses
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (27975,27977,27978,31384,31381,31386);

-- Door for last boss Sjonnir The Ironshaper need to be open by Brann Bronzebeard http://www.wowhead.com/npc=28070 after event finish and not for players.
UPDATE gameobject_template SET flags=flags|0x1 WHERE entry=191296;

-- Scriptnamen for Dark Matter http://www.wowhead.com/npc=28235 and Searing Gaze http://www.wowhead.com/npc=28265
UPDATE `creature_template` SET `ScriptName` = 'mob_dark_matter' WHERE `entry` = 28235;
UPDATE `creature_template` SET `ScriptName` = 'mob_searing_gaze' WHERE `entry` = 28265;

-- Spells
UPDATE `creature_template` SET `spell1` = 22120, `spell2` = 42724 WHERE `entry` = 27983;
UPDATE `creature_template` SET `spell1` = 22120, `spell2` = 42724 WHERE `entry` = 31876; --
UPDATE `creature_template` SET `spell1` = 12167, `spell2` = 15654 WHERE `entry` = 27984;
UPDATE `creature_template` SET `spell1` = 59863, `spell2` = 59864 WHERE `entry` = 31877; --
UPDATE `creature_template` SET `spell1` = 33661, `spell2` = 12734 WHERE `entry` = 27985;
UPDATE `creature_template` SET `spell1` = 33661, `spell2` = 59865 WHERE `entry` = 31380; --

-- EventAi data for tribunal mobs.
-- http://www.wowhead.com/npc=27979
-- http://www.wowhead.com/npc=27982
-- http://www.wowhead.com/npc=27983
-- http://www.wowhead.com/npc=27984
-- http://www.wowhead.com/npc=27985
UPDATE `creature_template` SET `AIName`= 'EventAI' WHERE `entry` IN (27979,27982,27983,27984,27985);
-- This is for YTDB, they use Acid, but CTDB use Heisei scripts and are more complete.
/*
-- EventAi
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (27979,27982,27983,27984,27985);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) 
VALUES
('2798401','27984','0','0','100','3','7000','10000','7000','10000','11','12167','4','1','0','0','0','0','0','0','0','0','Dark Rune Stormcaller (Normal) - Cast Lightning Bolt'),
('2798402','27984','0','0','100','5','7000','10000','7000','10000','11','59863','4','1','0','0','0','0','0','0','0','0','Dark Rune Stormcaller (Heroic) - Cast Lightning Bolt'),
('2798403','27984','0','0','100','3','4000','7000','12000','15000','11','15654','4','0','0','0','0','0','0','0','0','0','Dark Rune Stormcaller (Normal) - Cast Shadow Word: Pain'),
('2798404','27984','0','0','100','5','4000','7000','12000','15000','11','59864','4','0','0','0','0','0','0','0','0','0','Dark Rune Stormcaller (Heroic) - Cast Shadow Word: Pain'),

('2798301','27983','0','0','100','7','4000','7000','5000','8000','11','42724','1','0','0','0','0','0','0','0','0','0','Dark Rune Protector - Cast Cleave'),
('2798302','27983','0','0','100','7','7000','10000','15000','20000','11','22120','4','2','0','0','0','0','0','0','0','0','Dark Rune Protector - Cast Charge'),
('2798501','27985','0','0','100','7','4000','7000','10000','15000','11','33661','1','0','0','0','0','0','0','0','0','0','Iron Golem Custodian - Cast Crush Armor'),
('2798502','27985','0','0','100','3','7000','10000','15000','20000','11','12734','0','0','0','0','0','0','0','0','0','0','Iron Golem Custodian (Normal) - Cast Ground Smash'),
('2798503','27985','0','0','100','5','7000','10000','15000','20000','11','59865','0','0','0','0','0','0','0','0','0','0','Iron Golem Custodian (Heroic) - Cast Ground Smash'),

('2798201','27982','0','0','100','3','4000','7000','10000','15000','11','50895','4','0','0','0','0','0','0','0','0','0','Forged Iron Dwarf (Normal) - Cast Lightning Tether'),
('2798202','27982','0','0','100','5','4000','7000','10000','15000','11','59851','4','0','0','0','0','0','0','0','0','0','Forged Iron Dwarf (Heroic) - Cast Lightning Tether'),

('2797901','27979','0','0','100','3','4000','7000','7000','12000','11','50900','4','0','0','0','0','0','0','0','0','0','Forged Iron Trogg (Normal) - Cast Lightning Shock'),
('2797902','27979','0','0','100','5','4000','7000','7000','12000','11','59852','4','0','0','0','0','0','0','0','0','0','Forged Iron Trogg (Heroic) - Cast Lightning Shock');
*/
-- Hero mode
-- http://www.wowhead.com/npc=27983
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=31876;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
(3187601, 31876, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 22120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell'),
(3187602, 31876, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 42724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell');
-- http://www.wowhead.com/npc=27984
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=31877;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
(3187701, 31877, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 59863, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell'),
(3187702, 31877, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 59864, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell');
-- http://www.wowhead.com/npc=27985
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=31380;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
(3138001, 31380, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 33661, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell'),
(3138002, 31380, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 59865, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell');