ALTER TABLE db_version CHANGE COLUMN required_525_world_spell_scripts required_529_world_quest_free_your_mind bit;

-- Leaper
UPDATE `creature_template` SET `ScriptName`='npc_leaper' WHERE `entry`='29840';
-- Lady Nightswood
UPDATE `creature_template` SET `ScriptName`='npc_lady_nightswood' WHERE `entry`='29770';
-- The Vile
UPDATE `creature_template` SET `ScriptName`='npc_vile' WHERE `entry`='29769';