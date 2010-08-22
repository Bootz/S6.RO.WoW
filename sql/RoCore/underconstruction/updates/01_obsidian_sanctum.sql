--
-- Obsidian Sanctum
--
-- flametsunami
UPDATE creature_template SET minlevel=83, maxlevel=83, faction_A=14, faction_H=14, unit_flags=0x02000000, flags_extra=0x00000002 WHERE entry=30616;

-- safezone flag
UPDATE creature_template SET flags_extra = 0x00000002 WHERE entry=30494;

-- sartharion door
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 181247;

-- Add Twilight Portals
DELETE FROM gameobject WHERE id=193988;
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(193988, 615, 3, 1, 3137.26, 501.08, 87.9118, 0.846795, 0, 0, 0.41086, 0.911698, -30, 0, 1),
(193988, 615, 3, 1, 3238.37, 518.595, 58.9057, 0.739184, 0, 0, 0.361235, 0.932475, -30, 0, 1),
(193988, 615, 3, 1, 3362.01, 553.726, 95.7068, 4.56818, 0, 0, 0.756211, -0.654328, -30, 0, 1),
(193988, 615, 3, 1, 3219.67, 656.795, 87.2898, 5.92596, 0, 0, 0.177664, -0.984091, 25, 0, 1);

-- Set creature data to creatures used in Sartharion encounter
UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 31103; -- Twilight Egg (Cosmetic)
UPDATE creature_template SET unit_flags = unit_flags | 4, faction_A = 103, faction_H = 103, flags_extra = 2 WHERE entry = 30648; -- Fire Cyclone

-- esta linea produce un error:
-- ERROR: Table `creature` have creature (GUID: 123400 Entry: 30648) with `MovementType`=1 (random movement) but with `spawndist`=0, replace by idle movement type (0).
-- ERROR: Table `creature` have creature (GUID: 123401 Entry: 30648) with `MovementType`=1 (random movement) but with `spawndist`=0, replace by idle movement type (0).
-- ERROR: Table `creature` have creature (GUID: 123402 Entry: 30648) with `MovementType`=1 (random movement) but with `spawndist`=0, replace by idle movement type (0).
-- ERROR: Table `creature` have creature (GUID: 123403 Entry: 30648) with `MovementType`=1 (random movement) but with `spawndist`=0, replace by idle movement type (0).
-- ERROR: Table `creature` have creature (GUID: 123404 Entry: 30648) with `MovementType`=1 (random movement) but with `spawndist`=0, replace by idle movement type (0).
-- porque le cambia el spawndist a "0" y si haces un SELECT * FROM creature WHERE id=30648; veras que esta en "5", no sesi es correcto ya que este querie se hiso para TDB
/*
UPDATE creature SET spawndist = 0 WHERE id = 30648; -- Fire Cyclone
*/
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81, mindmg = 1857, maxdmg = 2703 WHERE entry IN (30890, 31214);
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81, mindmg = 3032, maxdmg = 5194 WHERE entry IN (31540, 31548);
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81 WHERE entry IN (30882, 31539); -- Twilight Egg
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81 WHERE entry IN (31204, 31547); -- Sartharion Twilight Egg
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81, flags_extra = 2, scale = 0.75 WHERE entry IN (30641, 31521); -- Twilight Fissure
UPDATE creature_template SET faction_A = 14, faction_H = 14, minlevel = 81, maxlevel = 81, mindmg = 693, maxdmg = 963, attackpower = 1567, dmg_multiplier = 1 WHERE entry = 30643; -- Lava Blaze
UPDATE creature_template SET faction_A = 14, faction_H = 14, minlevel = 81, maxlevel = 81, mindmg = 894, maxdmg = 1203, attackpower = 3134, dmg_multiplier = 1 WHERE entry = 31317; -- Lava Blaze (1)
UPDATE creature_template SET faction_A = 14, faction_H = 14, minlevel = 81, maxlevel = 81, flags_extra = 2 WHERE entry = 30616; -- Flame Tsunami
UPDATE creature_template SET faction_A = 103, faction_H = 103, mindmg = 409, maxdmg = 502, attackpower = 780, dmg_multiplier = 35, mechanic_immune_mask = 617299803, minlevel = 81, maxlevel = 81 WHERE entry IN (31218, 31219); -- Acolytes of Vesperon/Shandron
--  twilight fissure
UPDATE creature_template SET flags_extra = 0 WHERE entry IN (30641, 31521);
UPDATE creature_template SET modelid1 = 29038 WHERE entry IN (30641, 31521);

-- mob obsidian
UPDATE creature_template SET unit_flags = 33554434 WHERE entry IN (30641, 31521, 31103);

-- disciple of vesperon
UPDATE creature_template SET faction_H = 16, faction_A = 16 WHERE entry = 30858;
UPDATE gameobject SET spawntimesecs = -60 WHERE id = 193988;