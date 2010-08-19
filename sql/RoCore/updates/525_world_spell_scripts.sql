ALTER TABLE db_version CHANGE COLUMN required_507_world_wintergrasp required_525_world_spell_scripts bit;

DELETE FROM `spell_scripts` WHERE id IN (44997,45030,49625,49634,53343,53341);
INSERT INTO `spell_scripts`(`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES 
(44997,0,0,15,45009,1,1,0,0,0,0), -- Converting Sentry
(45030,1,0,15,45088,1,1,0,0,0,0), -- Impale Emissary
(49625,0,0,15,43106,1,1,0,0,0,0), -- Brave's Flare
(49634,0,0,15,43068,1,1,0,0,0,0), -- Sergeant's Flare
(53343,1,0,15,54586,1,1,0,0,0,0), -- Rune of Razorice
(53341,1,0,15,54586,1,1,0,0,0,0); -- Rune of Cinderglacier