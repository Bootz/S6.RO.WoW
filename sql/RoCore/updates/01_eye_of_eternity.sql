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


