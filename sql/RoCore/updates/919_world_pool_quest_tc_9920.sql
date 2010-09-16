-- Weekly and daily quest base in tc 9920 and info.
-- I will be adding more info for pvp quests and others.
-- 9920_world_pool_quest
DROP TABLE IF EXISTS `pool_quest`;
CREATE TABLE `pool_quest` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`),
  KEY `idx_guid` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- info para 9920_world_pool_quest
-- ATENCION: TENEMOS QUE VER COMO IMPLEMENTAMOS LA S QUEST PVP DE WG.
-- [9920] pool_quest
SET @pool := 5662;
DELETE FROM `pool_quest` WHERE `pool_entry` BETWEEN @pool AND @pool+22;
INSERT INTO `pool_quest` (`entry`,`pool_entry`,`description`) VALUES
-- Sunreavers
(13673,@pool, 'A Blade Fit For A Champion Sunreavers'), -- A Blade Fit For A Champion (Sunreavers)
(13674,@pool, 'A Worthy Weapon Sunreavers'), -- A Worthy Weapon (Sunreavers)
(13675,@pool, 'The Edge of Winter Sunreavers'), -- The Edge of Winter (Sunreavers)
-- Orc
(13762,@pool+1, 'A Blade Fit For A Champion Orks'), -- A Blade Fit For A Champion (Orc)
(13763,@pool+1, 'A Worthy Weapon Orks'), -- A Worthy Weapon (Orc)
(13764,@pool+1, 'The Edge of Winter Orks'), -- The Edge of Winter (orc)
-- Troll
(13768,@pool+2, 'A Blade Fit For A Champion Trolls'), -- A Blade Fit For A Champion (Troll)
(13769,@pool+2, 'A Worthy Weapon Trolls'), -- A Worthy Weapon (Troll)
(13770,@pool+2, 'The Edge of Winter Trolls'), -- The Edge of Winter (Troll)
-- Tauren
(13773,@pool+3, 'A Blade Fit For A Champion Taurens'), -- A Blade Fit For A Champion (Taurens)
(13774,@pool+3, 'A Worthy Weapon Taurens'), -- A Worthy Weapon (Taurens)
(13775,@pool+3, 'The Edge of Winter Taurens'), -- The Edge of Winter (Taurens)
-- Undead
(13778,@pool+4, 'A Blade Fit For A Champion Undeads'), -- A Blade Fit For A Champion (Undead)
(13779,@pool+4, 'A Worthy Weapon Undeads'), -- A Worthy Weapon (Undead)
(13780,@pool+4, 'The Edge of Winter Undeads'), -- The Edge of Winter (Undead)
-- Blood Elf
(13783,@pool+5, 'A Blade Fit For A Champion Bloodelfs'), -- A Blade Fit For A Champion (Blood Elf)
(13784,@pool+5, 'A Worthy Weapon Bloodelfs'), -- A Worthy Weapon (Blood Elf)
(13785,@pool+5, 'The Edge of Winter Bloodelfs'), -- The Edge of Winter (Blood Elf)
-- Silver Convenant
(13666,@pool+6, 'A Blade Fit For A Champion Convenant'), -- A Blade Fit For A Champion (Silver Convenant)
(13669,@pool+6, 'A Worthy Weapon Convenant'), -- A Worthy Weapon (Silver Convenant)
(13670,@pool+6, 'The Edge of Winter Convenant'), -- The Edge of Winter (Silver Convenant)
-- Human
(13603,@pool+7, 'A Blade Fit For A Champion Humans'), -- A Blade Fit For A Champion (Human)
(13600,@pool+7, 'A Worthy Weapon Humans'), -- A Worthy Weapon (Human)
(13616,@pool+7, 'The Edge of Winter Humans'), -- The Edge of Winter (Human)
-- Dwarf
(13741,@pool+8, 'A Blade Fit For A Champion Dwarfs'), -- A Blade Fit For A Champion (Dwarf)
(13742,@pool+8, 'A Worthy Weapon Dwarfs'), -- A Worthy Weapon (Dwarf)
(13743,@pool+8, 'The Edge of Winter Dwarfs'), -- The Edge of Winter (Dwarf)
-- Gnome
(13746,@pool+9, 'A Blade Fit For A Champion Gnomes'), -- A Blade Fit For A Champion (Gnome)
(13747,@pool+9, 'A Worthy Weapon Gnomes'), -- A Worthy Weapon (Gnome)
(13748,@pool+9, 'The Edge of Winter Gnomes'), -- The Edge of Winter (Gnome)
-- Night Elf
(13757,@pool+10, 'A Blade Fit For A Champion Nightelfs'), -- A Blade Fit For A Champion (Night Elf)
(13758,@pool+10, 'A Worthy Weapon Nightelfs'), -- A Worthy Weapon (Night Elf)
(13759,@pool+10, 'The Edge of Winter Nightelfs'), -- The Edge of Winter (Night Elf)
-- Dranei
(13752,@pool+11, 'A Blade Fit For A Champion Dranei'), -- A Blade Fit For A Champion (Dranei)
(13753,@pool+11, 'A Worthy Weapon Dranei'), -- A Worthy Weapon (Dranei)
(13754,@pool+11, 'The Edge of Winter Dranei'), -- The Edge of Winter (Dranei)
-- Cooking Dailies:
-- alliance
(13100,@pool+12, 'Infused mushroom Meatloaf Ally'),
(13101,@pool+12, 'Convention at the Legerdemain Ally'),
(13102,@pool+12, 'Sewer Stew Ally'),
(13103,@pool+12, 'Cheese for Glowergold Ally'),
(13107,@pool+12, 'Mustard Dogs! Ally'),
-- horde
(13112,@pool+13, 'Infused mushroom Meatloaf Horde'),
(13113,@pool+13, 'Convention at the Legerdemain Horde'),
(13114,@pool+13, 'Sewer Stew Horde'),
(13115,@pool+13, 'Cheese for Glowergold Horde'),
(13116,@pool+13, 'Mustard Dogs! Horde'),
-- Fishing Dailies
(13830,@pool+14, 'The Ghostfish'),
(13832,@pool+14, 'Jewel Of The Sewers'),
(13833,@pool+14, 'Blood Is Thicker'),
(13834,@pool+14, 'Dangerously Delicious'),
(13836,@pool+14, 'Disarmed!'), 
-- Jewelcrafting Dailies
(12958,@pool+15, 'Shipment Blood Jade Amulet'),
(12962,@pool+15, 'Shipment Bright Armor Relic'),
(12959,@pool+15, 'Shipment Glowing Ivory Figurine'),
(12961,@pool+15, 'Shipment Intrincate Bone Figurine'),
(12963,@pool+15, 'Shipment Shifting Sun Curio'),
(12960,@pool+15, 'Shipment Wicked Sun Brooch'),
-- Raiding Weeklies:
(24579,@pool+16, 'Sartharion Must Die!'),
(24580,@pool+16, 'Anub Rekhan Must Die!'),
(24581,@pool+16, 'Noth the Plaguebringer Must Die!'),
(24582,@pool+16, 'Instructor Razuvious Must Die!'),
(24583,@pool+16, 'Patchwerk Must Die!'),
(24584,@pool+16, 'Malygos Must Die!'),
(24585,@pool+16, 'Flame Leviathan Must Die!'),
(24586,@pool+16, 'Razorscale Must Die!'),
(24587,@pool+16, 'Ignis the Furnace Master Must Die!'),
(24588,@pool+16, 'XT-002 Deconstructor Must Die!'),
(24589,@pool+16, 'Lord Jaraxxus Must Die!'),
(24590,@pool+16, 'Lord Marrowgar Must Die!'),
-- Icc Pools
(24874,@pool+18, 'Blood Quickening (10)'),
(24869,@pool+19, 'Deprogramming (10)'),
(24873,@pool+20, 'Residue Rendezvous (10)'),
(24872,@pool+21, 'Respite for a Tormented Soul (10)'),
(24870,@pool+22, 'Securing the Ramparts HORDE (10)'),
(24871,@pool+22, 'Securing the Ramparts ALLY (10)'),
(24879,@pool+18, 'Blood Quickening (25)'),
(24875,@pool+19, 'Deprogramming (25)'),
(24878,@pool+20, 'Residue Rendezvous (25)'),
(24880,@pool+21, 'Respite for a Tormented Soul (25)'),
(24876,@pool+22, 'Securing the Ramparts ALLY (25)'),
(24877,@pool+22, 'Securing the Ramparts HORDE (25)');

DELETE FROM `pool_template` WHERE `entry` BETWEEN @pool AND @pool+22;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(@pool+0,1, 'TournamentDaily Sunreavers'),
(@pool+1,1, 'TournamentDaily Orks'),
(@pool+2,1, 'TournamentDaily Trolls'),
(@pool+3,1, 'TournamentDaily Taurens'),
(@pool+4,1, 'TournamentDaily Undeads '),
(@pool+5,1, 'TournamentDaily Bloodelfs'),
(@pool+6,1, 'TournamentDaily Convenant'),
(@pool+7,1, 'TournamentDaily Humans'),
(@pool+8,1, 'TournamentDaily Dwarfs'),
(@pool+9,1, 'TournamentDaily Gnomes'),
(@pool+10,1, 'TournamentDaily Nightelfs'),
(@pool+11,1, 'TournamentDaily Dranei'),
(@pool+12,1, 'DalaranCookingDaily Ally'),
(@pool+13,1, 'DalaranCookingDaily Horde'),
(@pool+14,1, 'DalaranFishingDaily'),
(@pool+15,1, 'DalaranJewelcraftingDaily'),
(@pool+16,1, 'Raiding weeklies'),
(@pool+17,1, 'ICC weeklies'),
(@pool+18,2, 'Blood Quickening'),
(@pool+19,2, 'Deprogramming'),
(@pool+20,2, 'Residue Rendezvous'),
(@pool+21,2, 'Respite for a Tormented Soul'),
(@pool+22,4, 'Securing the Ramparts');

DELETE FROM `pool_pool` WHERE `mother_pool`=@pool+17;
INSERT INTO `pool_pool` (`pool_id`,`mother_pool`,`chance`,`description`) VALUES
(@pool+18,@pool+17,0, 'Blood Quickening'),
(@pool+19,@pool+17,0, 'Deprogramming'),
(@pool+20,@pool+17,0, 'Residue Rendezvous'),
(@pool+21,@pool+17,0, 'Respite for a Tormented Soul'),
(@pool+22,@pool+17,0, 'Securing the Ramparts');

DELETE FROM `creature_questrelation` WHERE `quest` IN (24874,24872,24871,24880,24876);
INSERT INTO `creature_questrelation` VALUES
(38551,24874), -- Blood Quickening (10)
(38589,24872), -- Respite for a Tormented Soul (10)
(38492,24871), -- Securing the Ramparts ALLY (10)
(38589,24880), -- Respite for a Tormented Soul (25)
(38492,24876); -- Securing the Ramparts ALLY (25)

DELETE FROM `creature_involvedrelation` WHERE `quest` IN (24874,24872,24871,24880,24876);
INSERT INTO `creature_involvedrelation` VALUES
(38551,24874), -- Blood Quickening (10)
(38589,24872), -- Respite for a Tormented Soul (10)
(38492,24871), -- Securing the Ramparts ALLY (10)
(38589,24880), -- Respite for a Tormented Soul (25)
(38492,24876); -- Securing the Ramparts ALLY (25)

UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=38492; 