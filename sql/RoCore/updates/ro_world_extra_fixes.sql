-- HERE WILL BE ADD ALL LITTLE SPELL FIXES AND EXTRA FIXES FOR ROCORE JUST NOT TO HAVE MANY FILES IN UPDATE FOLDER

UPDATE spell_proc_event SET procFlags = 20, procEx = 2 WHERE entry IN (53486, 53488);
DELETE FROM `spell_bonus_data` where entry=50444;
REPLACE INTO `spell_bonus_data`(`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `comments`) VALUES (50444, 0, 0, 0.105, "Death Knight - Corpse Explosion Triggered");

-- DK's should now be immune to Psychic Horror when they are affected by Anti-Magic Shell.
-- by Andu
-- Fixed Psychic Horror piercing through Anti-Magic Shell
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`= 48707;
REPLACE INTO `spell_linked_spell` VALUES (48707, -64044, 2, 'Anti-Magic Shell immune to Psychic Horror');

-- Paladins should now be immune to Cyclone when they are affected by Divine Shield
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`= 642;
REPLACE INTO `spell_linked_spell` VALUES (642, -33786, 2, 'Divine Shield immune to Cyclone');

-- Fingers of Frost
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN ('44544', '-44544');
REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('44544','74396','0','Fingers of Frost (ADD)'),
('-44544','-74396','0','Fingers of Frost (REMOVE)');

-- Vanish
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = -1784;
REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(-1784, -11327, 0, 'Vanish - Rank 1'),
(-1784, -11329, 0, 'Vanish - Rank 2'),
(-1784, -26888, 0, 'Vanish - Rank 3');
										  
-- Sif http://www.wowhead.com/npc=33196
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `unit_flags` = 33554434 WHERE `entry` IN (33196, 33234);
-- Kel Thuzad immunity http://www.wowhead.com/npc=15990
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299839 WHERE `entry` IN (15990, 30061);

-- ----------------- --
-- Utgarde Pinnacle. --
-- ----------------- --
-- Utgarde Pinnacle.
-- Delete double spawn Grauf, it is summon by core.
DELETE FROM `creature` WHERE `guid`= 81815;

-- Svala respawn (provisional).
DELETE FROM `creature` WHERE `id`= 26668;
REPLACE INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
('26668','575','2','1','0','685','296.679','-346.313','90.5481','1.57858','300','0','0','431392','0','0','0');