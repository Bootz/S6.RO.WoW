UPDATE spell_proc_event SET procFlags = 20, procEx = 2 WHERE entry IN (53486, 53488);

DELETE FROM `spell_bonus_data` where entry=50444;
INSERT INTO `spell_bonus_data`(`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `comments`) VALUES (50444, 0, 0, 0.105, "Death Knight - Corpse Explosion Triggered");