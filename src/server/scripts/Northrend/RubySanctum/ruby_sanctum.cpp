/* Copyright (C) 2010 /dev/rsa for ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
/* ScriptData
SDName: ruby_sanctum mobs
SD%Complete: 10%
SDComment: by notagain, corrected by /dev/rsa
SDCategory: ruby_sanctum
EndScriptData */

#include "ScriptPCH.h"
#include "def_ruby_sanctum.h"

static Locations SpawnLoc[]=
{
    {3155.540039f, 342.391998f, 84.596802f},   // 0 - start point
    {3152.329834f, 359.41757f, 85.301605f},    // 1 - second say
    {3152.078369f, 383.939178f, 86.337875f},   // 2 - other says and staying
    {3154.99f, 535.637f, 72.8887f},            // 3 - Halion spawn point
};

struct mob_xerestraszaAI : public ScriptedAI
{
    mob_xerestraszaAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* pInstance;
    uint32 nextEvent;
    uint32 nextPoint;
    uint32 UpdateTimer;
    bool movementstarted;
    bool onSessionEvent;

    void Reset()
    {
        if(!pInstance) return;
        nextEvent = 0;
        nextPoint = 0;
        movementstarted = false;
        UpdateTimer = 2000;
        me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
        pInstance->SetData(TYPE_XERESTRASZA, NOT_STARTED);
        me->AddSplineFlag(SPLINEFLAG_WALKMODE);
        me->SetSpeedRate(MOVE_WALK, 0.8);
        me->SetRespawnDelay(7*DAY);
   }

    void MovementInform(uint32 type, uint32 id)
    {
        if (type != POINT_MOTION_TYPE || !movementstarted) return;
        if (id == nextPoint) 
        {
            movementstarted = false;
            pInstance->SetData(TYPE_EVENT,nextEvent);
            me->GetMotionMaster()->MovementExpired();
        }
    }

    void StartMovement(uint32 id, uint32 _nextEvent)
    {
        nextPoint = id;
        nextEvent = _nextEvent;
        me->GetMotionMaster()->Clear();
        me->GetMotionMaster()->MovePoint(id, SpawnLoc[id].x, SpawnLoc[id].y, SpawnLoc[id].z);
        pInstance->SetData(TYPE_EVENT,0);
        movementstarted = true;
    }

    void AttackStart(Unit *who)
    {
        //ignore all attackstart commands
        return;
    }

    void MoveInLineOfSight(Unit *who)
    {
        if(!pInstance || !who || who->GetTypeId() != TYPEID_PLAYER) 
            return;

        if (pInstance->GetData(TYPE_BALTHARUS) != DONE
            || pInstance->GetData(TYPE_XERESTRASZA) != NOT_STARTED) return;

        if(!who->IsWithinDistInMap(me, 60.0f)) return;

        pInstance->SetData(TYPE_XERESTRASZA, IN_PROGRESS);
        pInstance->SetData(TYPE_EVENT, 30);
        onSessionEvent = true;
    }

    void UpdateAI(const uint32 diff)
    {
        if(!pInstance) return;

        if (pInstance->GetData(TYPE_EVENT_NPC) == NPC_XERESTRASZA)
        {
            UpdateTimer = pInstance->GetData(TYPE_EVENT_TIMER);
            if (UpdateTimer <= diff)
            {
            debug_log("EventMGR: creature %u received signal %u ",me->GetEntry(),pInstance->GetData(TYPE_EVENT));
            switch (pInstance->GetData(TYPE_EVENT))
                {
// Xerestrasza intro
                    case 10:
                          UpdateTimer = 7000;
                          pInstance->SetData(TYPE_EVENT, 20);
                          break;
                    case 20:
                          DoScriptText(-1666000,me);
                          pInstance->SetData(TYPE_EVENT,0);
                          break;
// Xerestrasza event
                    case 30:
                          me->SetActiveObjectState(true);
                          DoScriptText(-1666001,me);
                          StartMovement(1,40);
                          break;
                    case 40:
                          DoScriptText(-1666002,me);
                          StartMovement(2,50);
                          break;
                    case 50:
                          DoScriptText(-1666003,me);
                          UpdateTimer = 12000;
                          pInstance->SetData(TYPE_EVENT,60);
                          break;
                    case 60:
                          DoScriptText(-1666004,me);
                          UpdateTimer = 12000;
                          pInstance->SetData(TYPE_EVENT,70);
                          break;
                    case 70:
                          DoScriptText(-1666005,me);
                          UpdateTimer = 10000;
                          pInstance->SetData(TYPE_EVENT,80);
                          break;
                    case 80:
                          DoScriptText(-1666006,me);
                          UpdateTimer = 10000;
                          pInstance->SetData(TYPE_EVENT,90);
                          break;
                    case 90:
                          DoScriptText(-1666007,me);
                          UpdateTimer = 10000;
                          pInstance->SetData(TYPE_EVENT,100);
                          break;
                    case 100:
                          DoScriptText(-1666008,me);
                          UpdateTimer = 4000;
                          pInstance->SetData(TYPE_EVENT,110);
                          break;
                    case 110:
                          UpdateTimer = 2000;
                          pInstance->SetData(TYPE_EVENT,0);
                          pInstance->SetData(TYPE_XERESTRASZA, DONE);
                          me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                          me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                          me->SetActiveObjectState(false);
                          break;
// Halion spawn
                    case 200:
                          me->SetActiveObjectState(true);
                    {
                          Unit* Halion = Unit::GetUnit((*me), pInstance->GetData64(NPC_HALION_REAL));
                          if (pInstance->GetData(TYPE_BALTHARUS) == DONE &&
                              pInstance->GetData(TYPE_RAGEFIRE) == DONE &&
                              pInstance->GetData(TYPE_XERESTRASZA) == DONE &&
                              pInstance->GetData(TYPE_ZARITHIAN) == DONE &&
                              pInstance->GetData(TYPE_HALION) != DONE
                              && !Halion)
                              Halion = me->SummonCreature(NPC_HALION_REAL, SpawnLoc[3].x, SpawnLoc[3].y, SpawnLoc[3].z, 6.23f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, HOUR*2*IN_MILLISECONDS);
                              Halion->SetCreatorGUID(0);
                    }
                          UpdateTimer = 4000;
                          pInstance->SetData(TYPE_EVENT,210);
                          break;
                    case 210:
                          me->SetActiveObjectState(false);
                          UpdateTimer = 2000;
                          pInstance->SetData(TYPE_EVENT,0);
                          break;

                    default:
                          break;
                }
             } else UpdateTimer -= diff;
             pInstance->SetData(TYPE_EVENT_TIMER, UpdateTimer);
        }

    }
};

CreatureAI* GetAI_mob_xerestrasza(Creature* pCreature)
{
    return new mob_xerestraszaAI(pCreature);
}

void AddSC_ruby_sanctum()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "mob_xerestrasza";
    newscript->GetAI = &GetAI_mob_xerestrasza;
    newscript->RegisterSelf();
}