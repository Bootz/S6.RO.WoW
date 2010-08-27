/*
* Copyright (C) 2009 - 2010 TrinityCore <http://www.trinitycore.org/>
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/

// Scripted by Lavi & Andu - WoW-Romania Team http://www.wow-romania.ro (if you use this script, do not remove this seal, no matter what other modification you apply to script).

#ifndef DEF_ICECROWN_CITADEL_H
#define DEF_ICECROWN_CITADEL_H


enum eSharedSpells
{
    SPELL_BERSERK   = 26662
};

enum Data
{
    DATA_MARROWGAR_EVENT,
    DATA_LORD_MARROWGAR,
    DATA_DEATHWHISPER_EVENT,
    DATA_GUNSHIP_BATTLE_EVENT,
    DATA_SAURFANG_EVENT,
    DATA_DEATHBRINGER_SAURFANG,
    DATA_FESTERGURT_EVENT,
    DATA_ROTFACE_EVENT,
    DATA_PROFESSOR_PUTRICIDE_EVENT,
    DATA_BLOOD_PRINCE_COUNCIL_EVENT,
    DATA_BLOOD_QUEEN_LANATHEL_EVENT,
    DATA_VALITHRIA_DREAMWALKER_EVENT,
    DATA_SINDRAGOSA_EVENT,
    DATA_LICH_KING_EVENT,

    COMMAND_FAIL_BONED,
    DATA_SAURFANG_EVENT_NPC,
    DATA_SAURFANG_DOOR,
};

enum Data64
{
    DATA_MARROWGAR,
    DATA_DEATHWHISPER,
    DATA_SAURFANG,
    DATA_GUNSHIP_BATTLE,
    DATA_FESTERGURT,
    DATA_ROTFACE,
    DATA_PROFESSOR_PUTRICIDE,
    DATA_PRINCE_VALANAR_ICC,
    DATA_PRINCE_KELESETH_ICC,
    DATA_PRINCE_TALDARAM_ICC,
    DATA_BLOOD_QUEEN_LANATHEL,
    DATA_VALITHRIA_DREAMWALKER,
    DATA_SINDRAGOSA,
    DATA_LICH_KING,
};

enum mainCreatures
{
    NPC_LORD_MARROWGAR              = 36612,
    NPC_COLDFLAME                   = 36672,
    NPC_BONE_SPIKE                  = 36619,

    NPC_LADY_DEATHWHISPER   = 36855,
    NPC_CULT_FANATIC        = 37890,
    NPC_DEFORMED_FANATIC    = 38135,
    NPC_REANIMATED_FANATIC  = 38009,
    NPC_CULT_ADHERENT       = 37949,
    NPC_EMPOWERED_ADHERENT  = 38136,
    NPC_REANIMATED_ADHERENT = 38010,
    NPC_VENGEFUL_SHADE      = 38222,

    NPC_DEATHBRINGER_SAURFANG       = 37813,
    NPC_BLOOD_BEAST                 = 38508,
    NPC_SE_JAINA_PROUDMOORE         = 37188,    // SE means Saurfang Event
    NPC_SE_MURADIN_BRONZEBEARD      = 37200,
    NPC_SE_KING_VARIAN_WRYNN        = 37879,
    NPC_SE_HIGH_OVERLORD_SAURFANG   = 37187,
    NPC_SE_KOR_KRON_REAVER          = 37920,
    NPC_SE_SKYBREAKER_MARINE        = 37830,

    CREATURE_DEATHWHISPER            = 36855,
    CREATURE_GUNSHIP                 = 30343,
    CREATURE_SAURFANG                = 37813,
    CREATURE_FESTERGURT              = 36626,
    CREATURE_ROTFACE                 = 36627,
    CREATURE_PROFESSOR_PUTRICIDE     = 36678,
    CREATURE_PRINCE_VALANAR_ICC      = 37970,
    CREATURE_PRINCE_KELESETH_ICC     = 37972,
    CREATURE_PRINCE_TALDARAM_ICC     = 37973,
    CREATURE_BLOOD_QUEEN_LANATHEL    = 37955,
    CREATURE_VALITHRIA_DREAMWALKER   = 36789,
    CREATURE_SINDRAGOSA              = 36853,
    CREATURE_LICH_KING               = 36597,
};

enum GameObjects
{
    GO_PROFCOLLISIONDOOR            = 201612,
    GO_ORANGEPIPE                   = 201617,
    GO_GREENPIPE                    = 201618,
    GO_OOZEVALVE                    = 201615,
    GO_GASVALVE                     = 201616,
    GO_PROFDOORORANGE               = 201613,
    GO_PROFDOORGREEN                = 201614,
    DOODAD_ICECROWN_ICEWALL02       = 201910,
    ICEWALL                         = 201911,
    LORD_MARROWGAR_S_ENTRANCE       = 201857,
    ORATORY_OF_THE_DAMNED_ENTRANCE  = 201563,
    LADY_DEATHWHISPER_ELEVATOR      = 202220,
};

enum eAchievementCriteria
{
    CRITERIA_BONED_10N  = 12775,
    CRITERIA_BONED_25N  = 12962,
    CRITERIA_BONED_10H  = 13393,
    CRITERIA_BONED_25H  = 13394,
};
#endif