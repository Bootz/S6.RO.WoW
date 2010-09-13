/* Copyright (C) 2010 Easy for TrinityCore <http://trinity-core.ru/>
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#ifndef DEF_RUBY_SANCTUM_H
#define DEF_RUBY_SANCTUM_H

enum eData
{
    DATA_BALTHARUS       = 0,
    DATA_RAGEFIRE        = 1,
    DATA_ZARITHRIAN      = 2,
    DATA_HALION          = 3,
    MAX_ENCOUNTER        = 4,
    DATA_XERESTRASZA     = 5,
    DATA_TWILIGHT_HALION = 6,
    DATA_DAMAGE          = 7
};

enum eAchievementData
{
    TWILIGHT_DESTROYER_NORMAL_10    = 4817,
    TWILIGHT_DESTROYER_NORMAL_25    = 4815,
    TWILIGHT_DESTROYER_HEROIC_10    = 4818,
    TWILIGHT_DESTROYER_HEROIC_25    = 4816
};

enum eCreature
{
    NPC_BALTHARUS        = 39751,
    NPC_BALTHARUS_SUMMON = 39899,
    NPC_ZARITHRIAN       = 39746,
    NPC_RAGEFIRE         = 39747,
    NPC_HALION           = 39863,
    NPC_TWILIGHT_HALION  = 40142,
    NPC_XERESTRASZA      = 40429,
    NPC_ONYX_FLAMECALLER = 39814
};

enum eGameObject
{
    GO_FIRE_FIELD       = 203005,
    GO_FLAME_WALLS      = 203006,
    GO_FLAME_WALLS2     = 203007,
    GO_TWILIGHT_PORTAL1 = 202794,
    GO_TWILIGHT_PORTAL2 = 202796
};

#endif

