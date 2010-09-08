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

#include "ScriptPCH.h"
#include "ruby_sanctum.h"

enum eTexts
{
        SAY_SPAWN       = -1752027,
        SAY_AGGRO       = -1752028,
        SAY_SLAY1       = -1752029,
        SAY_SLAY2       = -1752030,
        SAY_DEATH       = -1752031,
        SAY_BERSERK     = -1752032,
        SAY_SPECIAL1    = -1752033,
        SAY_SPECIAL2    = -1752034,
        SAY_PHASE2      = -1752035,
        SAY_PHASE3      = -1752036
};

enum eSpells
{
    SPELL_TAIL_LASH                 = 74531,
    SPELL_FLAME_BREATH_10_NORMAL    = 74525,
    SPELL_FLAME_BREATH_25_NORMAL    = 74526,
    SPELL_FLAME_BREATH_10_HEROIC    = 74527,
    SPELL_FLAME_BREATH_25_HEROIC    = 74528,
    SPELL_FIERY_COMBUSTION          = 74562,
    SPELL_BERSEK                    = 26662
};

enum eEvents
{
    EVENT_CAST_SPELL_FIERY_COMBUSTION   = 1,
    EVENT_CAST_TAIL_LASH                = 2,
    EVENT_CAST_FLAME_BREATH             = 3,
    EVENT_FLAME_WALL                    = 4
};

enum ePhases
{
    PHASE_1 = 0,
    PHASE_2 = 1,
    PHASE_3 = 2
};

class boss_halion : public CreatureScript
{
    public:
        boss_halion() : CreatureScript("boss_halion") { }

        struct boss_halionAI : public BossAI
        {
            boss_halionAI(Creature *pCreature) : BossAI(pCreature, DATA_HALION)
                {
                    ASSERT(instance);
                }

            void Reset()
    	    {
                instance->SetBossState(DATA_HALION, NOT_STARTED);
                events.Reset();
                events.SetPhase(PHASE_1);
                events.ScheduleEvent(EVENT_CAST_TAIL_LASH, urand(10000,15000),PHASE_1);
                events.ScheduleEvent(EVENT_CAST_FLAME_BREATH, urand(20000,25000),PHASE_1);
                events.ScheduleEvent(EVENT_CAST_SPELL_FIERY_COMBUSTION, 15000,PHASE_1);
                events.ScheduleEvent(SPELL_BERSEK, 9999999,PHASE_1);
    	    }

    	    void EnterCombat(Unit*)
    	    {
                instance->SetBossState(DATA_HALION, IN_PROGRESS);
                events.ScheduleEvent(EVENT_FLAME_WALL, 1000,PHASE_1);
                DoScriptText(SAY_AGGRO, me);
    	    }

    	    void UpdateAI(const uint32 diff)
    	    {
                if (!UpdateVictim() || !CheckInRoom())
                    return;

                if (me->hasUnitState(UNIT_STAT_CASTING))
                    return;

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_FLAME_WALL:
                            me->SummonGameObject(GO_FLAME_WALLS2, (float)3154.56, (float)535.418, (float)72.8889, (float)4.47206, 0, 0, (float)0.786772, (float)-0.617243, 300);
                            break;
                        case EVENT_CAST_TAIL_LASH:
                            DoCast(me, SPELL_TAIL_LASH);
                            events.ScheduleEvent(EVENT_CAST_TAIL_LASH, urand(10000,15000),PHASE_1);
                            break;
                        case EVENT_CAST_FLAME_BREATH:
                            DoCast(me, RAID_MODE(SPELL_FLAME_BREATH_10_NORMAL, SPELL_FLAME_BREATH_25_NORMAL, SPELL_FLAME_BREATH_10_HEROIC, SPELL_FLAME_BREATH_25_HEROIC));
                            events.ScheduleEvent(EVENT_CAST_FLAME_BREATH, urand(20000,25000),PHASE_1);break;
                        case EVENT_CAST_SPELL_FIERY_COMBUSTION:
                            Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
    				        if (pTarget && !pTarget->HasAura(SPELL_FIERY_COMBUSTION))
    					        DoCast(pTarget, EVENT_CAST_SPELL_FIERY_COMBUSTION);
                            events.ScheduleEvent(EVENT_CAST_SPELL_FIERY_COMBUSTION, 15000,PHASE_1);
                            break;
                    }
                }
                DoMeleeAttackIfReady();
    	    }

    	    void KilledUnit(Unit *victim)
    	    {
                DoScriptText(RAND(SAY_SLAY1,SAY_SLAY2), me);
    	    }

    	    void JustDied(Unit*)
    	    {
                _JustDied();
                DoScriptText(SAY_DEATH, me);
    	    }
        };

        CreatureAI* GetAI(Creature *pCreature) const
        {
                return new boss_halionAI(pCreature);
        }

};

void AddSC_boss_halion()
{
    new boss_halion;
}
