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

-- Glyph of Totem of Wrath

DELETE FROM `spell_group` WHERE `spell_id` IN ('63283');
DELETE FROM `spell_proc_event` WHERE `entry` IN ('63280');
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
('63280','0','11','536870912','0','0','0','0','0','0','0');

-- Fingers of Frost

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN ('44544', '-44544');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('44544','74396','0','Fingers of Frost (ADD)'),
('-44544','-74396','0','Fingers of Frost (REMOVE)');
