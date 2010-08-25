-- Argent Tournament
-- Seems a little hack to finished some quest, but ok, at least people can end the quest.
UPDATE gameobject SET state = 0 WHERE id = 194618; -- Lance Rack (I really dont kno why we rewirte this is working perfect on TCDB no sure on YTDB)

-- Why loot to a gameobject type 22?
/*
DELETE FROM `gameobject_loot_template` WHERE entry = 194618; -- http://www.wowhead.com/item=46070 why? I cant undestant why you put Horde Lance like drop? that's a spell just when you click on rack'
INSERT INTO `gameobject_loot_template` VALUES
(194618, 46070, 100, 1, 0, 1, 1);
*/

UPDATE quest_template SET QuestFlags = 0 WHERE entry = 13678; -- Up To The Challenge
UPDATE quest_template SET NextQuestId = 0 WHERE NextQuestId = 13678; -- Up To The Challenge
UPDATE quest_template SET ReqCreatureOrGOId1 = 24108 WHERE entry = 13679; -- The Aspirant's Challenge
UPDATE quest_template SET NextQuestId = 0 WHERE NextQuestId = 13672; -- Up To The Challenge
UPDATE creature_template SET mindmg = 500, maxdmg = 800 WHERE entry = 33448; -- Argent Valiant
UPDATE creature_template SET mindmg = 650, maxdmg = 1000 WHERE entry = 33707; -- Argent Champion
UPDATE quest_template SET PrevQuestId = 13680 WHERE PrevQuestId = 13687; -- Horde Tournament Eligibility Marker
UPDATE quest_template SET PrevQuestId = 13679 WHERE PrevQuestId = 13686; -- Alliance Tournament Eligibility Marker
UPDATE quest_template SET ReqSourceId2 = 0, ReqSourceCount2 = 0 WHERE ReqSourceId2 = 45000;
UPDATE item_template SET maxcount = 1 WHERE entry = 45005; -- Everburning Ember