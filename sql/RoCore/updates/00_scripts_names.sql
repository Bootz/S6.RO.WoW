-- Script_names of RoCore update files
-- Argent tournament
UPDATE `creature_template` SET `ScriptName` = 'npc_squire_danny' WHERE entry = 33518;
UPDATE `creature_template` SET `ScriptName` = 'npc_argent_valiant' WHERE entry = 33448;
UPDATE `creature_template` SET `ScriptName` = 'npc_argent_champion' WHERE entry = 33707;

-- Borean tundra
UPDATE `creature_template` SET  `ScriptName` = 'npc_fizzcrank_fullthrottle' WHERE entry = 25590; -- Fizzcrank Fullthrottle
UPDATE `creature_template` SET  `ScriptName` = 'npc_surristrasz' WHERE entry =24795; -- Surristrasz
UPDATE `creature_template` SET  `ScriptName` = 'npc_tiare' WHERE entry =30051; -- Librarian Tiare

-- Eye of eternity
UPDATE `creature_template` SET `ScriptName` = 'boss_malygos', unit_flags = unit_flags & ~256 WHERE entry = 28859;
UPDATE `creature_template` SET `ScriptName` = 'mob_nexus_lord' WHERE entry = 30245; -- Nexus Lord
UPDATE `creature_template` SET `ScriptName` = 'mob_scion_of_eternity' WHERE entry = 30249; -- Scion of Eternity
UPDATE `creature_template` SET `ScriptName` = 'mob_power_spark' WHERE entry = 30084;  -- Power Spark
UPDATE `creature_template` SET `ScriptName` = 'npc_arcane_overload' WHERE entry = 30282; -- Arcane Overload

-- Obsidian Santum
UPDATE `creature_template` SET `ScriptName`='boss_sartharion' WHERE `entry`=28860;
UPDATE `creature_template` SET `ScriptName`='mob_vesperon' WHERE `entry`=30449;
UPDATE `creature_template` SET `ScriptName`='mob_shadron' WHERE `entry`=30451;
UPDATE `creature_template` SET `ScriptName`='mob_tenebron' WHERE `entry`=30452;
UPDATE `creature_template` SET `ScriptName`='mob_acolyte_of_shadron' WHERE `entry`=31218;
UPDATE `creature_template` SET `ScriptName`='mob_acolyte_of_vesperon' WHERE `entry`=31219;
UPDATE `creature_template` SET `ScriptName`='npc_twilight_fissure' WHERE entry=30641; 
UPDATE `creature_template` SET `ScriptName`='npc_flame_tsunami' WHERE entry=30616;
UPDATE `creature_template` SET `ScriptName`='npc_twilight_fissure' WHERE entry = 30641;
UPDATE `creature_template` SET `ScriptName`='npc_flame_tsunami' WHERE entry = 30616;
UPDATE `creature_template` SET `ScriptName`='mob_twilight_eggs' WHERE entry IN (30882, 31204);
-- Revisar: tiene script_name en 2 ids mas 31214 & 31548, la principal es 30890, producia un error "ERROR: Creature (Entry: 31214) lists difficulty 1 mode entry 31548 with `ScriptName` filled in. `ScriptName` of difficulty 0 mode creature is always used instead."
-- UPDATE `creature_template` SET `ScriptName`='mob_twilight_whelp' WHERE entry IN (30890, 31214, 31548);
-- ahora solo esta asignado a un solo id 30890, hay que probar si va bien.
UPDATE `creature_template` SET `ScriptName`='mob_twilight_whelp' WHERE entry IN (30890);
UPDATE `creature_template` SET `ScriptName`='npc_disciple_of_vesperon' WHERE entry = 30858;
UPDATE `creature_template` SET `ScriptName`='npc_flame_tsunami' WHERE entry=30616;

-- Oculus
UPDATE `creature_template` SET `ScriptName`='npc_unstable_sphere' WHERE `entry`=28166;
UPDATE `creature_template` SET `ScriptName`='npc_oculus_drake' WHERE `entry` IN (27657,27658,27659);
UPDATE `creature_template` SET `ScriptName`='boss_drakos' WHERE entry = 27654;
UPDATE `creature_template` SET `ScriptName`='boss_urom' WHERE entry = 27655;
UPDATE `creature_template` SET `ScriptName`='mob_centrifige_construct' WHERE entry = 27641;
UPDATE `creature_template` SET `ScriptName`='boss_varos' WHERE entry = 27447;
UPDATE `creature_template` SET `ScriptName`='boss_eregos' WHERE entry = 27656;
UPDATE `creature_template` SET `ScriptName`= 'npc_planar_anomaly' WHERE entry = 30879; -- Planar Anomlay di Eregos 

-- Ruby Sanctum
UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus' WHERE `entry` = '39751';
UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus_clone' WHERE `entry` = '39899';
UPDATE `creature_template` SET `ScriptName` = 'npc_xerestrasza' WHERE `entry` = '40429';
UPDATE `creature_template` SET `ScriptName` = 'boss_zarithrian' WHERE `entry` = '39746';
UPDATE `creature_template` SET `ScriptName` = 'boss_ragefire' WHERE `entry` = '39747';
UPDATE `creature_template` SET `ScriptName` = 'boss_halion' WHERE `entry`= '39863';
UPDATE `creature_template` SET `ScriptName` = 'boss_twilight_halion' WHERE `entry` = '40142';
UPDATE `creature_template` SET `ScriptName` = 'npc_onyx_flamecaller' WHERE `entry` = '39814';
UPDATE `creature_template` SET `ScriptName` = 'npc_meteor_strike' WHERE `entry` = '40055';
UPDATE `creature_template` SET `ScriptName` = 'npc_combustion' WHERE `entry` = '40001';
UPDATE `creature_template` SET `ScriptName` = 'npc_consumption' WHERE `entry` = '40135';
UPDATE `creature_template` SET `ScriptName` = 'npc_meteor_flame' WHERE `entry` = '40044';

-- Anuncios al comienzo del evento.
-- Here does not exist the NPC, the we fix the script_name in this way
-- Later we will fix in the right way
DELETE FROM `creature_template` WHERE `entry` in (35591,35592);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES 
(35591, 0, 0, 0, 0, 0, 29894, 0, 0, 0, 'Jaeren Sunsworn', '', '', 0, 75, 75, 2, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 2000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_anstart'),
(35592, 0, 0, 0, 0, 0, 29893, 0, 0, 0, 'Arelas Brightstar', '', '', 0, 75, 75, 2, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_anstart');

-- Solo nos quedan estos antiguos, no sé si nos sobran o deben quedarse, que opinas?
-- Trial of the champion
UPDATE `creature_template` SET `ScriptName`='npc_announcer_toc5' WHERE `entry`IN (35004,35005);
UPDATE `creature_template` SET `ScriptName`='npc_gr' WHERE `entry`IN (35492);
UPDATE `creature_template` SET `ScriptName`='npc_anstart' WHERE `entry`IN (35591,35592);

-- Trial of the crusader
UPDATE `creature_template` SET `ScriptName`='mob_firebomb_trigger' WHERE (`entry`='34854');
UPDATE `creature_template` SET `ScriptName`='Mob_NerubianTrigger' WHERE (`entry`='34862');
UPDATE `creature_template` SET `ScriptName`='mob_swarm_scarab' WHERE (`entry`='34605');
UPDATE `creature_template` SET `ScriptName`='creature_impale' WHERE (`entry`='29184');

-- TOC segun TC
UPDATE `creature_template` SET `scriptname`='npc_announcer_toc10' WHERE `entry` in (34816);
UPDATE `creature_template` SET `scriptname`='boss_lich_king_toc' WHERE `entry`=35877;
UPDATE `creature_template` SET `scriptname`='npc_fizzlebang_toc' WHERE `entry`=35458;
UPDATE `creature_template` SET `scriptname`='npc_tirion_toc' WHERE `entry`=34996;
UPDATE `creature_template` SET `scriptname`='npc_garrosh_toc' WHERE `entry`=34995;
UPDATE `creature_template` SET `scriptname`='npc_varian_toc' WHERE `entry`=34990;
UPDATE `creature_template` SET `scriptname`='boss_gormok', `AIName` ='' WHERE `entry`=34796;
UPDATE `creature_template` SET `scriptname`='mob_snobold_vassal', `AIName` ='' WHERE `entry`=34800;
UPDATE `creature_template` SET `scriptname`='boss_dreadscale', `AIName` ='' WHERE `entry`=34799;
UPDATE `creature_template` SET `scriptname`='boss_acidmaw', `AIName` ='' WHERE `entry`=35144;
UPDATE `creature_template` SET `scriptname`='mob_slime_pool', `AIName` ='' WHERE `entry` = 35176;
UPDATE `creature_template` SET `scriptname`='boss_icehowl', `AIName` ='' WHERE `entry`=34797;
UPDATE `creature_template` SET `scriptname`='boss_jaraxxus', `AIName` ='' WHERE `entry`= 34780;
UPDATE `creature_template` SET `scriptname`='mob_legion_flame', `AIName` ='' WHERE `entry` = 34784;
UPDATE `creature_template` SET `scriptname`='mob_infernal_volcano', `AIName` ='' WHERE `entry` = 34813;
UPDATE `creature_template` SET `scriptname`='mob_nether_portal', `AIName` ='' WHERE `entry` = 34825;
UPDATE `creature_template` SET `scriptname`='mob_fel_infernal', `AIName` ='' WHERE `entry` = 34815;
UPDATE `creature_template` SET `scriptname`='mob_mistress_of_pain', `AIName` ='' WHERE `entry` = 34826;
UPDATE `creature_template` SET `scriptname`='boss_toc_champion_controller', `AIName` ='' WHERE `entry` IN (34781);
UPDATE `creature_template` SET `scriptname`='boss_anubarak_trial', `AIName` ='' WHERE `entry`=34564;
UPDATE `creature_template` SET `scriptname`='boss_fjola', `AIName` ='' WHERE `entry`=34497;
UPDATE `creature_template` SET `scriptname`='boss_eydis', `AIName` ='' WHERE `entry`=34496;
UPDATE `creature_template` SET `scriptname`='mob_essence_of_twin', `AIName` ='' WHERE `entry` IN (34567,34568);
UPDATE `creature_template` SET `scriptname`='mob_unleashed_dark', `AIName` ='' WHERE entry = 34628;
UPDATE `creature_template` SET `scriptname`='mob_unleashed_light', `AIName` ='' WHERE entry = 34630;
UPDATE `creature_template` SET `ScriptName`='mob_frost_sphere', `AIName` = '' WHERE `entry` = 34606;
UPDATE `creature_template` SET `scriptname`='mob_nerubian_burrower', `AIName` ='' WHERE `entry`=34607;
UPDATE `creature_template` SET `scriptname`='mob_anubarak_spike', `AIName` ='' WHERE `entry`=34660;

-- Faction Champions Horde

-- Faction Champions Alliance

-- Segun TC
-- Lo han hech muy bien un solo script_name para ambos en cada facción mucho mas fácil
UPDATE `creature_template` SET `scriptname`='mob_toc_warrior', `AIName` ='' WHERE `entry` IN (34475,34453);
UPDATE `creature_template` SET `scriptname`='mob_toc_mage', `AIName` ='' WHERE `entry` IN (34468,34449);
UPDATE `creature_template` SET `scriptname`='mob_toc_shaman', `AIName` ='' WHERE `entry` IN (34470,34444);
UPDATE `creature_template` SET `scriptname`='mob_toc_enh_shaman', `AIName` ='' WHERE `entry` IN (34463,34455);
UPDATE `creature_template` SET `scriptname`='mob_toc_hunter', `AIName` ='' WHERE `entry` IN (34467,34448);
UPDATE `creature_template` SET `scriptname`='mob_toc_rogue', `AIName` ='' WHERE `entry` IN (34472,34454);
UPDATE `creature_template` SET `scriptname`='mob_toc_priest', `AIName` ='' WHERE `entry` IN (34466,34447);
UPDATE `creature_template` SET `scriptname`='mob_toc_shadow_priest', `AIName` ='' WHERE `entry` IN (34473,34441);
UPDATE `creature_template` SET `scriptname`='mob_toc_dk', `AIName` ='' WHERE `entry` IN (34461,34458);
UPDATE `creature_template` SET `scriptname`='mob_toc_paladin', `AIName` ='' WHERE `entry` IN (34465,34445);
UPDATE `creature_template` SET `scriptname`='mob_toc_retro_paladin', `AIName` ='' WHERE `entry` IN (34471,34456);
UPDATE `creature_template` SET `scriptname`='mob_toc_druid', `AIName` ='' WHERE `entry` IN (34469,34459);
UPDATE `creature_template` SET `scriptname`='mob_toc_boomkin', `AIName` ='' WHERE `entry` IN (34460,34451);
UPDATE `creature_template` SET `scriptname`='mob_toc_warlock' WHERE `entry` IN (34474,34450);

-- Ulduar
UPDATE `creature_template` SET `ScriptName`= '' WHERE `entry` IN (33365,33370,33312,33367,33686,33579,34275,33214);
UPDATE `creature_template` SET `ScriptName`='boss_auriaya' WHERE `entry`=33515;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan' WHERE `entry`=33113;
UPDATE `creature_template` SET `AIName`='TurretAI',`ScriptName`='' WHERE `entry`=33139;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan_seat' WHERE `entry`=33114;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan_defense_turret' WHERE `entry`=33142;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan_overload_device' WHERE `entry`=33143;
UPDATE `creature_template` SET `ScriptName`='spell_pool_of_tar' WHERE `entry`=33090;
UPDATE `creature_template` SET `ScriptName`='boss_ignis' WHERE `entry`=33118;
UPDATE `creature_template` SET `ScriptName`='boss_razorscale' WHERE `entry`=33186;
UPDATE `creature_template` SET `ScriptName`='boss_xt002' WHERE `entry`=33293;
UPDATE `creature_template` SET `ScriptName`='mob_xt002_heart' WHERE `entry`=33329;
UPDATE `creature_template` SET `ScriptName`='mob_scrapbot' WHERE `entry`=33343;
UPDATE `creature_template` SET `ScriptName`='mob_pummeller' WHERE `entry`=33344;
UPDATE `creature_template` SET `ScriptName`='mob_boombot' WHERE `entry`=33346;
UPDATE `creature_template` SET `ScriptName`='mob_void_zone' WHERE `entry`=34001;
UPDATE `creature_template` SET `ScriptName`='mob_life_spark' WHERE `entry`=34004;
UPDATE `creature_template` SET `ScriptName`='mob_rune_of_summoning' WHERE `entry`=33051;
UPDATE `creature_template` SET `ScriptName`='boss_algalon' WHERE `entry`=32871;
UPDATE `creature_template` SET `ScriptName`='mob_collapsing_star' WHERE `entry`=32955;
UPDATE `creature_template` SET `ScriptName`= 'mob_iron_construct' WHERE `entry` = 33121;
UPDATE `creature_template` SET `ScriptName`= 'mob_darkrune_watcher' WHERE `entry` = 33453;
UPDATE `creature_template` SET `ScriptName`= 'mob_darkrune_sentinel' WHERE `entry` = 33846;
UPDATE `creature_template` SET `ScriptName`= 'mob_darkrune_guardian' WHERE `entry` = 33388;
UPDATE `creature_template` SET `ScriptName`= 'mob_devouring_flame' WHERE `entry` = 34188;
UPDATE `creature_template` SET `ScriptName`= 'npc_expedition_commander_ulduar' WHERE `entry` = 33210;
UPDATE `creature_template` SET `ScriptName`= 'mole_machine_trigger' WHERE `entry` = 33282;
UPDATE `creature_template` SET `ScriptName`= 'mob_focused_eyebeam' WHERE `entry` IN (33632, 33802);
UPDATE `creature_template` SET `ScriptName`= 'mob_left_arm' WHERE `entry` = 32933;
UPDATE `creature_template` SET `ScriptName`= 'mob_right_arm' WHERE `entry` = 32934;
UPDATE `creature_template` SET `ScriptName`= 'boss_steelbreaker' WHERE `entry` = 32867;
UPDATE `creature_template` SET `ScriptName`= 'boss_runemaster_molgeim' WHERE `entry` = 32927;
UPDATE `creature_template` SET `ScriptName`= 'boss_stormcaller_brundir' WHERE `entry` = 32857;
UPDATE `creature_template` SET `ScriptName`='mob_rune_of_power' WHERE entry = 33705;
UPDATE `creature_template` SET `ScriptName`='mob_lightning_elemental' WHERE entry = 32958;
UPDATE `creature_template` SET `ScriptName`= 'feral_defender_trigger' WHERE `entry` = 34096;
UPDATE `creature_template` SET `ScriptName`= 'mob_feral_defender' WHERE `entry` = 34035;
UPDATE `creature_template` SET `ScriptName`= 'mob_sanctum_sentry' WHERE `entry` = 34014;
UPDATE `creature_template` SET `ScriptName`= 'seeping_trigger' WHERE `entry` = 34098;
UPDATE `creature_template` SET `ScriptName`= 'npc_keeper_norgannon' WHERE `entry` = 33686;
UPDATE `creature_template` SET `ScriptName`= 'boss_hodir' WHERE `entry` = 32845;
UPDATE `creature_template` SET `ScriptName`= 'mob_flash_freeze' WHERE `entry` = 32938;
UPDATE `creature_template` SET `ScriptName`= 'mob_icicle' WHERE `entry` = 33169;
UPDATE `creature_template` SET `ScriptName`= 'mob_icicle_snowdrift' WHERE `entry` = 33173;
UPDATE `creature_template` SET `ScriptName`= 'mob_hodir_priest' WHERE `entry` IN (32897, 33326, 32948, 33330);
UPDATE `creature_template` SET `ScriptName`= 'mob_hodir_shaman' WHERE `entry` IN (33328, 32901, 33332, 32950);
UPDATE `creature_template` SET `ScriptName`= 'mob_hodir_druid' WHERE `entry` IN (33325, 32900, 32941, 33333);
UPDATE `creature_template` SET `ScriptName`= 'mob_hodir_mage' WHERE `entry` IN (32893, 33327, 33331, 32946);
UPDATE `creature_template` SET `ScriptName`= 'toasty_fire' WHERE `entry` = 33342;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_brightleaf' WHERE `entry` =32915;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_ironbranch' WHERE `entry` =32913;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_stonebark' WHERE `entry` =32914;
UPDATE `creature_template` SET `ScriptName` = 'creature_sun_beam'WHERE `entry` =33170;
UPDATE `creature_template` SET `ScriptName` = 'creature_iron_roots' WHERE `entry` = 33168;
UPDATE `creature_template` SET `ScriptName` = 'boss_freya' WHERE `entry` =32906;
UPDATE `creature_template` SET `ScriptName` = 'creature_eonars_gift' WHERE `entry` =33228;
UPDATE `creature_template` SET `ScriptName` = 'creature_nature_bomb' WHERE `entry` =34129;
UPDATE `creature_template` SET `ScriptName` = 'creature_detonating_lasher' WHERE `entry` =32918;
UPDATE `creature_template` SET `ScriptName` = 'creature_ancient_conservator' WHERE `entry` =33203;
UPDATE `creature_template` SET `ScriptName` = 'creature_storm_lasher' WHERE `entry` =32919;
UPDATE `creature_template` SET `ScriptName` = 'creature_snaplasher' WHERE `entry` =32916;
UPDATE `creature_template` SET `ScriptName` = 'creature_ancient_water_spirit' WHERE `entry` =33202;
UPDATE `creature_template` SET `ScriptName` = 'creature_healthy_spore' WHERE `entry` =33215;
UPDATE `creature_template` SET `ScriptName` = 'creature_unstable_sun_beam' WHERE `entry` = 33050;
UPDATE `creature_template` SET `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;
UPDATE `creature_template` SET `ScriptName` = 'mob_scorch_ground' WHERE `entry` = 33221;
UPDATE `creature_template` SET `ScriptName` = 'mob_pre_phase' WHERE `entry` IN (32882, 32908, 32885, 33110);
UPDATE `creature_template` SET `ScriptName` = 'mob_arena_phase' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875);
UPDATE `creature_template` SET `ScriptName` = 'mob_runic_colossus' WHERE `entry` = 32872;
UPDATE `creature_template` SET `ScriptName` = 'mob_rune_giant' WHERE `entry` = 32873;
UPDATE `creature_template` SET `ScriptName` = 'thorim_trap_bunny' WHERE `entry` IN (33725, 33282);
UPDATE `creature_template` SET `ScriptName` = 'thorim_energy_source' WHERE `entry` = 32892;
UPDATE `creature_template` SET `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 33725;
UPDATE `creature_template` SET `ScriptName` = 'thorim_phase_trigger' WHERE `entry` = 32892;
UPDATE `creature_template` SET `ScriptName` = 'mob_pre_phase' WHERE `entry` IN (32907, 32883);
UPDATE `creature_template` SET `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33282;
UPDATE `creature_template` SET `ScriptName` = 'go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
UPDATE `creature_template` SET `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33245;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 33282;
UPDATE `creature_template` SET `ScriptName` = 'boss_mimiron' WHERE entry = 33350;
UPDATE `creature_template` SET `ScriptName` = 'boss_leviathan_mk' WHERE entry = 33432;
UPDATE `creature_template` SET `ScriptName` = 'boss_leviathan_mk_turret' WHERE entry = 34071;
UPDATE `creature_template` SET `ScriptName` = 'mob_proximity_mine' WHERE entry = 34362;
UPDATE `creature_template` SET `ScriptName` = 'boss_vx_001'WHERE `entry` = 33651;
UPDATE `creature_template` SET `ScriptName` = 'boss_aerial_unit'WHERE `entry` = 33670;
UPDATE `creature_template` SET `ScriptName` = 'mob_boom_bot' WHERE `entry` = 33836;
UPDATE `creature_template` SET `ScriptName` = 'rocket_strike' WHERE `entry` = 34047;
UPDATE `creature_template` SET `ScriptName` = 'magnetic_core' WHERE `entry` = 34068;
UPDATE `creature_template` SET `ScriptName` = 'boss_general_vezax' WHERE `entry` = 33271;
UPDATE `creature_template` SET `ScriptName` = 'mob_saronite_vapors' WHERE `entry` = 33488;
UPDATE `creature_template` SET `ScriptName` = 'mob_saronite_animus' WHERE `entry` = 33524;
UPDATE `creature_template` SET `ScriptName` = 'mob_mimiron_flame' WHERE `entry` = 34363;
UPDATE `creature_template` SET `ScriptName` = 'mob_frost_bomb' WHERE `entry` = 34149;
UPDATE `creature_template` SET `ScriptName` = 'mob_junk_bot' WHERE `entry` = 33855;
UPDATE `creature_template` SET `ScriptName` = 'mob_assault_bot' WHERE `entry` = 34057;
UPDATE `creature_template` SET `ScriptName` = 'mob_boom_bot' WHERE `entry` = 33836;
UPDATE `creature_template` SET `ScriptName` = 'mob_emergency_bot' WHERE `entry` = 34147;
UPDATE `creature_template` SET `ScriptName` = 'npc_keeper_image' WHERE `entry` IN (33213, 33241, 33242, 33244);
UPDATE `creature_template` SET `ScriptName`='boss_thorim' WHERE (`entry`='32865');
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_freya' WHERE `entry` = 33410;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_hodir' WHERE `entry` = 33411;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_mimiron' WHERE `entry` = 33412;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_thorim' WHERE `entry` = 33413;
UPDATE `creature_template` SET `ScriptName` = 'npc_sanity_well' WHERE `entry` = 33991;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_ironbranch' WHERE `entry` =32913;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_stonebark' WHERE `entry` =32914;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_brightleaf' WHERE `entry` =32195;
UPDATE `creature_template` SET `ScriptName` = 'creature_iron_roots' WHERE `entry` =33088;
UPDATE `creature_template` SET `ScriptName` = 'creature_sun_beam' WHERE `entry` =33170;
UPDATE `creature_template` SET `ScriptName` = 'mob_colossus' WHERE `entry` = 33237;
UPDATE `creature_template` SET `ScriptName` = 'npc_sif' WHERE `entry` = 33196;
-- I set here this scriptname because I thi we are using a entrie script and them this is correct
-- When we use it we have another error thorim_phase_trigger because this scriptname is assigned to this NPC from TC
UPDATE `creature_template` SET `flags_extra` = 0, `ScriptName` = 'thorim_energy_source' WHERE `entry` = 32892;

-- Icecrown Citadel
-- First declaring scripts names
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry` IN (37813,38508,36626,36855,38222,36678,37697,36853,36597,38995,36633,36609,37695,38757,36701,36725,37011,36724,37012,37007,36811,36807,36829,36844,36808,38135,37949,36627,36897,36899,37973,37970,37972,36789,38429,38068,38369,38332,38454,38422,38451);

# Boss
UPDATE `creature_template` SET `ScriptName`='boss_blood_queen_lanathel' WHERE (`entry`='37955');
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_keleset_icc' WHERE `entry` = 37972;
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_taldaram_icc' WHERE `entry` = 37973;
UPDATE `creature_template` SET `ScriptName`='boss_blood_council' WHERE (`entry`='37970');
UPDATE `creature_template` SET `ScriptName`='boss_festergut' WHERE (`entry`='36626');
UPDATE `creature_template` SET `ScriptName`='boss_saurfang' WHERE (`entry`='37813');
UPDATE `creature_template` SET `ScriptName`='boss_professor_putricide' WHERE (`entry`='36678');
UPDATE `creature_template` SET `ScriptName`='boss_sindragosa' WHERE (`entry`='36853');
UPDATE `creature_template` SET `ScriptName`='boss_valithria' WHERE `entry` = 36789;
UPDATE `creature_template` SET `ScriptName`='boss_the_lich_king' WHERE (`entry`='36597');
UPDATE `creature_template` SET `ScriptName`='boss_rotface' WHERE `entry`= 36627;

-- Script_names segun TC
UPDATE `creature_template` SET `ScriptName`='boss_lord_marrowgar' WHERE `entry`=36612;
UPDATE `creature_template` SET `ScriptName`='boss_lady_deathwhisper' WHERE `entry`=36855;

# Mobs
UPDATE `creature_template` SET `ScriptName`='npc_tirion_icc' WHERE (`entry`='38995');
UPDATE `creature_template` SET `ScriptName`='npc_swarming_shadows' WHERE (`entry`='38163');
UPDATE `creature_template` SET `ScriptName`='npc_bloodbeast' WHERE (`entry`='38508');
UPDATE `creature_template` SET `ScriptName`='npc_volatile_ooze' WHERE (`entry`='37697');  
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
UPDATE `creature_template` SET `ScriptName`='npc_bomb_icc' WHERE `entry`=38454;
UPDATE `creature_template` SET `ScriptName`='npc_vortex_icc' WHERE `entry`=38422;
UPDATE `creature_template` SET `ScriptName`='npc_empfireball_icc' WHERE `entry`=38451;
UPDATE `creature_template` SET `ScriptName`='npc_precious' WHERE (`entry`='37217');
UPDATE `creature_template` SET `ScriptName`='npc_stinky' WHERE (`entry`='37025');
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
UPDATE `creature_template` SET `ScriptName`='npc_sister_svalna' WHERE `entry` = '37126';
UPDATE `creature_template` SET `ScriptName` = 'npc_impaling_spear' WHERE `entry` = '38248';
UPDATE `creature_template` SET `ScriptName` = 'npc_gas_cloud' WHERE `entry` = '37562';
UPDATE `creature_template` SET `ScriptName`='lanathel_intro' WHERE (`entry`='38004');
UPDATE `creature_template` SET `vehicleId`=533 WHERE `entry`=36619;
UPDATE `creature_template` SET `ScriptName`='npc_choke_bomb' WHERE (`entry`='38159');
UPDATE `creature_template` SET `ScriptName`='npc_sticky_ooze' WHERE (`entry`='37006');
UPDATE `creature_template` SET `ScriptName`='npc_flood_ooze' WHERE (`entry`='37013');
UPDATE `creature_template` SET `ScriptName`='npc_shambling_horror' WHERE (`entry`='37698');

-- Script_names segun TC
UPDATE `creature_template` SET `ScriptName`='npc_cold_flame' WHERE `entry`=36672;
UPDATE `creature_template` SET `ScriptName`='npc_bone_spike' WHERE `entry`=38711;
UPDATE `creature_template` SET `ScriptName`='npc_cult_fanatic' WHERE `entry` IN (37890,38009,38135);
UPDATE `creature_template` SET `ScriptName`='npc_cult_adherent' WHERE `entry` IN(37949,38010,38136);
UPDATE `creature_template` SET `ScriptName`='npc_vengeful_shade' WHERE `entry`=38222;

-- Halls of Reflection
-- Cleanup first
UPDATE `creature_template` SET `Scriptname`=' ' WHERE `entry` IN (38112,38113,37221,37223,38175,38172,38567,38177,38173,38176);

UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRintro' WHERE `entry` IN (37221, 37223);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_falric' WHERE `entry` IN (38112);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_marwyn' WHERE `entry` IN (38113);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_lich_king_hr' WHERE `entry` IN (36954);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_hor' WHERE `entry` IN (37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRextro' WHERE `entry` IN (36955, 37554);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='generic_creature' WHERE `entry` IN (36940,36941,37069);
UPDATE `creature_template` SET `ScriptName`='generic_creature' WHERE `entry` IN (38177,38176,38173,38172,38567,38175);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_frostworn_general' WHERE `entry`=36723;
update `creature_template` set `AIName`='', `Scriptname`='npc_raging_gnoul' where `entry` in (36940);
update `creature_template` set `AIName`='', `Scriptname`='npc_risen_witch_doctor' where `entry` in (36941);
update `creature_template` set `AIName`='', `Scriptname`='npc_abon' where `entry` in (37069);

-- Argent quest
-- Scriptname for training_dummy_argent
-- with this now you can ride the mount and use the skills on the dummies
UPDATE `creature_template` SET `ScriptName`='npc_training_dummy_argent' WHERE `entry` IN ('33172','33243');
-- Add Scripts to NPCs
UPDATE `creature_template` SET `ScriptName`='npc_quest_givers_argent_tournament' WHERE `entry` IN (33593, 33592, 33225, 33312, 33335, 33379, 33373, 33361, 33403, 33372);
UPDATE `creature_template` SET `ScriptName`='npc_quest_givers_for_crusaders' WHERE `entry` IN (34882, 35094);
UPDATE `creature_template` SET `ScriptName`='npc_crusader_rhydalla' WHERE `entry`=33417;
UPDATE `creature_template` SET `ScriptName`='npc_eadric_the_pure' WHERE `entry`=33759;
UPDATE `creature_template` SET `ScriptName`='npc_crok_scourgebane' WHERE `entry`=33762;
UPDATE `creature_template` SET `ScriptName`='npc_valis_windchaser' WHERE `entry`=33974;
UPDATE `creature_template` SET `ScriptName`='npc_rugan_steelbelly' WHERE `entry`=33972;
UPDATE `creature_template` SET `ScriptName`='npc_jeran_lockwood' WHERE `entry`=33973;
UPDATE `creature_template` SET `Scriptname`='npc_justicar_mariel_trueheart' WHERE `entry` = '33817';
UPDATE `creature_template` SET `Scriptname`='npc_vendor_argent_tournament' WHERE `entry` IN(33553,33554,33556,33555,33557,33307,33310,33653,33650,33657);
-- Quest 13666 & 13673:  Une lame digne d'un champion!
-- Lake Frog
-- Maiden Of Ahswood Lake
UPDATE `creature_template` SET `ScriptName` = 'npc_lake_frog' WHERE `creature_template`.`entry` =33211 LIMIT 1 ;
UPDATE `creature_template` SET `npcflag` = `npcflag` | 1, `ScriptName` = 'npc_maiden_of_ashwood_lake' WHERE `creature_template`.`entry` =33220;
UPDATE `creature_template` SET `InhabitType`=5, `ScriptName`='npc_maiden_of_drak_mar' WHERE `entry`=33273;

-- Quest Free your mind
-- Leaper
UPDATE `creature_template` SET `ScriptName`='npc_leaper' WHERE `entry`='29840';
-- Lady Nightswood
UPDATE `creature_template` SET `ScriptName`='npc_lady_nightswood' WHERE `entry`='29770';
-- The Vile
UPDATE `creature_template` SET `ScriptName`='npc_vile' WHERE `entry`='29769';

-- Declaring zones
UPDATE `instance_template` SET `script` = 'instance_eye_of_eternity' WHERE `map`= 616;
UPDATE `instance_template` SET `script` = 'instance_obsidian_sanctum' WHERE `map`= 615;
UPDATE `instance_template` SET `script` = 'instance_oculus' WHERE `map`= 578;
UPDATE `instance_template` SET `script` = 'instance_ruby_sanctum' WHERE `map`= 724;
UPDATE `instance_template` SET `script` = 'instance_trial_of_the_champion' WHERE `map`= 650;
UPDATE `instance_template` SET `script` = 'instance_ulduar' WHERE `map`= 603;
UPDATE `instance_template` SET `script`=  'instance_icecrown_citadel' WHERE `map`= 631;
UPDATE `instance_template` SET `script` = 'instance_halls_of_reflection' WHERE `map`= 668;

-- Segun TC
UPDATE `instance_template` SET `script`='instance_trial_of_the_crusader' WHERE `map`=649;

-- Is fix here if not "error" - Lo implemento aqui sino da error
DELETE FROM gameobject_template WHERE entry = '194438';
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');

-- Gameobject
UPDATE `gameobject_template` SET `ScriptName` = 'go_malygos_iris' WHERE `entry` IN (193960,193958); 
UPDATE `gameobject_template` SET `ScriptName` = 'go_firefield' WHERE `entry` = '203005';
UPDATE `gameobject_template` SET `ScriptName`= '' WHERE `entry` IN (194375,194371,194370,194377);
UPDATE `gameobject_template` SET `ScriptName`='ulduar_teleporter' WHERE `entry`=194569;
UPDATE `gameobject_template` SET `ScriptName` = 'icecrown_teleporter' WHERE `entry` IN (202223,202235,202242,202243,202244,202245,202246);
UPDATE `gameobject_template` SET `ScriptName` = 'go_call_tram' WHERE `entry` = 194438;
UPDATE `gameobject_template` SET `ScriptName` = 'not_push_button' WHERE `entry` = 194739;


-- WG
DELETE FROM `outdoorpvp_template` WHERE `TypeId` IN (7);
INSERT INTO `outdoorpvp_template` (`TypeId`, `ScriptName`, `Comment`) VALUES (7, 'outdoorpvp_wg', 'Wintergrasp');

-- Clean error from started
-- This delete was on Ulduar sql but i move here for start server with any error
DELETE FROM `script_waypoint` WHERE `entry`=33370;
