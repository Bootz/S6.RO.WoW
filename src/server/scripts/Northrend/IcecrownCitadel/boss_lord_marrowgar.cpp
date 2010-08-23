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

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

enum Yells
{
	SAY_ENTER_ZONE       =    -1631000,
	SAY_AGGRO            =    -1631001,
	SAY_BONE_STORM       =    -1631002,
	SAY_BONESPIKE_1      =    -1631003,
	SAY_BONESPIKE_2      =    -1631004,
	SAY_BONESPIKE_3      =    -1631005,
	SAY_KILL_1           =    -1631006,
	SAY_KILL_2           =    -1631007,
	SAY_DEATH            =    -1631008,
	SAY_BERSERK          =    -1631009,
	SAY_BONE_STORM_EMOTE    = -1631010
};

enum Spells
{
	SPELL_SABER_SLASH_10_NORMAL          =  71021, //69055
	SPELL_SABER_SLASH_25_NORMAL          =  40816, //70814
	SPELL_SABER_SLASH_10_HEROIC          =  71021, //70814
	SPELL_SABER_SLASH_25_HEROIC          =  70814, //70814
	SPELL_COLD_FLAME_10_NORMAL           =  69145, //69146 - was the old spell - and it was the wrong one - or maybe not but lets try using this for the given situation
	SPELL_COLD_FLAME_25_NORMAL           =  69145, //
	SPELL_COLD_FLAME_10_HEROIC           =  69145,
	SPELL_COLD_FLAME_25_HEROIC           =  69145,
	SPELL_COLD_DESPAWN                   =  66346,
	SPELL_COLD_FLAME_SPAWN               =  69138,
	SPELL_BONE_SPIKE_GRAVEYARD_10_NORMAL =  69057,
	SPELL_BONE_SPIKE_GRAVEYARD_25_NORMAL =  70826,
	SPELL_BONE_SPIKE_IMPALING            =  69065,
	SPELL_BONE_STORM_CHANNEL             =  69076,
	SPELL_BONE_STORM_10_NORMAL           =  69075,
	SPELL_BONE_STORM_25_NORMAL           =  70834,
	SPELL_BONE_STORM_10_HEROIC           =  70835,
	SPELL_BONE_STORM_25_HEROIC           =  70836,
	SPELL_BONE_SHIELD                    =  70207,
	SPELL_BERSERK                        =  26662,
	SPELL_IMPALED                        =  69065,
};

enum eEvents
{
    EVENT_FAIL_BONED
};


enum NPC
{
	CREATURE_BONE_SPIKE    =    38711,
	CREATURE_COLD_FLAME    =    36672,
};


class npc_bone_spike : public CreatureScript
{
    public:
        npc_bone_spike() : CreatureScript("npc_bone_spike") { }

        struct npc_bone_spikeAI : public Scripted_NoMovementAI
        {
            npc_bone_spikeAI(Creature *pCreature) : Scripted_NoMovementAI(pCreature), vehicle(pCreature->GetVehicleKit())
            {
                ASSERT(vehicle);
                uiTrappedGUID = 0;
            }

            void Reset()
            {
                uiTrappedGUID = 0;
            }

            void JustDied(Unit *killer)
            {
                events.Reset();
                if (Unit* trapped = Unit::GetUnit((*me), uiTrappedGUID))
                    trapped->RemoveAurasDueToSpell(SPELL_IMPALED);
            }

            void KilledUnit(Unit *pVictim)
            {
                me->Kill(me);
            }

            void UpdateAI(const uint32 diff)
            {
                if (!uiTrappedGUID)
                    return;

                events.Update(diff);
                Unit* trapped = Unit::GetUnit(*me, uiTrappedGUID);
                if ((trapped && trapped->isAlive() && !trapped->HasAura(SPELL_IMPALED)) || !trapped)
                    me->Kill(me);

                if (events.ExecuteEvent() == EVENT_FAIL_BONED)
                    if (InstanceScript* instance = me->GetInstanceScript())
                        instance->SetData(COMMAND_FAIL_BONED, 0);
            }

            void SetTrappedUnit(Unit* unit)
            {
                unit->EnterVehicle(vehicle, 0);
                uiTrappedGUID = unit->GetGUID();
                }

            void PassengerBoarded(Unit * who, int8 /*seatId*/, bool apply)
            {
                if (!apply)
                    return;

                me->AddAura(SPELL_IMPALED, who);
                events.ScheduleEvent(EVENT_FAIL_BONED, 8000);
            }

        private:
            uint64 uiTrappedGUID;
            EventMap events;
            Vehicle* vehicle;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_bone_spikeAI(pCreature);
        }
};
class boss_lord_marrowgar : public CreatureScript
{
public:
	boss_lord_marrowgar() : CreatureScript("boss_lord_marrowgar") { }

	struct boss_lord_marrowgarAI : public ScriptedAI
	{
		boss_lord_marrowgarAI(Creature *pCreature) : ScriptedAI(pCreature)
		{
			pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* pInstance;

		uint32 m_uiSaberSlashTimer;
		uint32 m_uiBoneSpikeGraveyardTimer;
		uint32 m_uiBoneStormChanelTimer;
		uint32 m_uiBoneStormTimer;
		uint32 m_uiBoneStormRemoveTimer;
		uint32 m_uiColdFlameTimer;
		uint32 m_uiBerserkTimer;
		uint32 m_uiMove;

		bool Intro;

		void Reset()
		{
			m_uiSaberSlashTimer = 6000;
			m_uiBoneSpikeGraveyardTimer  = 15000;
			m_uiColdFlameTimer  = 15000;
			m_uiBoneStormChanelTimer = 45000;
			m_uiBoneStormTimer = 1500;
			m_uiBoneStormRemoveTimer = 20000;
			m_uiBerserkTimer = 600000;

			me->SetSpeed(MOVE_RUN, 2.5f, true);
			me->SetSpeed(MOVE_WALK, 1.8f, true);

			Intro = false;

			if (pInstance)
				pInstance->SetData(DATA_MARROWGAR_EVENT, NOT_STARTED);
		}

		void EnterCombat(Unit* who)
		{
			DoScriptText(SAY_AGGRO, me);

			if (pInstance)
				pInstance->SetData(DATA_MARROWGAR_EVENT, IN_PROGRESS);
		}

		void JustDied(Unit* killer)
		{
			DoScriptText(SAY_DEATH, me);

			if (pInstance)
				pInstance->SetData(DATA_MARROWGAR_EVENT, DONE);
		}

		void JustReachedHome()
		{
			if(pInstance)
				pInstance->SetData(DATA_MARROWGAR_EVENT, FAIL);
		}

		void KilledUnit(Unit *victim)
		{
			DoScriptText(RAND(SAY_KILL_1,SAY_KILL_2), me);
		}

		void MoveInLineOfSight(Unit *who)
		{
			if (!Intro && me->IsWithinDistInMap(who,60.0f))
			{
				DoScriptText(SAY_ENTER_ZONE, me);
				Intro = true;
			}

			ScriptedAI::MoveInLineOfSight(who);
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiBerserkTimer <= uiDiff)
			{
				DoScriptText(SAY_BERSERK, me);
				DoCast(SPELL_BERSERK);
				m_uiBerserkTimer = 600000;
			} else m_uiBerserkTimer -= uiDiff;

			if (getDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL || getDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL)
			{
				if (!me->HasAura(SPELL_BONE_STORM_CHANNEL))
				{
					if (m_uiBoneSpikeGraveyardTimer < uiDiff)
					{
						DoScriptText(RAND(SAY_BONESPIKE_1,SAY_BONESPIKE_2,SAY_BONESPIKE_3), me);
						uint32 count = RAID_MODE(1,3,1,3);
						for (uint8 i = 1; i <= count; i++)
						{
							Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 200, true);
							if (pTarget && !pTarget->HasAura(SPELL_BONE_SPIKE_IMPALING))
							{
								Creature* Bone = me->SummonCreature(CREATURE_BONE_SPIKE, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 999999);
								CAST_AI(npc_bone_spike::npc_bone_spikeAI, Bone->AI())->SetTrappedUnit(pTarget);
								Bone->CastSpell(pTarget, SPELL_BONE_SPIKE_IMPALING, true);
							}
						}
						m_uiBoneSpikeGraveyardTimer = 15000;
					} else m_uiBoneSpikeGraveyardTimer -= uiDiff;

					if (m_uiColdFlameTimer <= uiDiff)
					{
						me->SummonCreature(CREATURE_COLD_FLAME, me->GetPositionX()+20, me->GetPositionY()+20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
						me->SummonCreature(CREATURE_COLD_FLAME, me->GetPositionX()-20, me->GetPositionY()-20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
						me->SummonCreature(CREATURE_COLD_FLAME, me->GetPositionX()+20, me->GetPositionY()-20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
						me->SummonCreature(CREATURE_COLD_FLAME, me->GetPositionX()-20, me->GetPositionY()+20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
						m_uiColdFlameTimer = 15000;
					} else m_uiColdFlameTimer -= uiDiff;
				}
			}

			if (getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC || getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
			{
				if (m_uiBoneSpikeGraveyardTimer < uiDiff)
				{
					DoScriptText(RAND(SAY_BONESPIKE_1,SAY_BONESPIKE_2,SAY_BONESPIKE_3), me);
					uint32 count = RAID_MODE(1,3,1,3);
					for (uint8 i = 1; i <= count; i++)
					{
						Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 1, 200, true);
						if (pTarget && !pTarget->HasAura(SPELL_BONE_SPIKE_IMPALING))
						{
							Creature* Bone = me->SummonCreature(CREATURE_BONE_SPIKE, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 999999);
							CAST_AI(npc_bone_spike::npc_bone_spikeAI, Bone->AI())->SetTrappedUnit(pTarget);
							Bone->CastSpell(pTarget, SPELL_BONE_SPIKE_IMPALING, true);
						}
					}
					m_uiBoneSpikeGraveyardTimer = 15000;
				} else m_uiBoneSpikeGraveyardTimer -= uiDiff;
			}

			if (!me->HasAura(SPELL_BONE_STORM_CHANNEL))
			{
				if (m_uiBoneStormChanelTimer <= uiDiff)
				{
					me->SetSpeed(MOVE_WALK, 0.4f, true);
					me->SetSpeed(MOVE_RUN, 0.6f, true);
					DoCast(SPELL_BONE_STORM_CHANNEL);
					DoScriptText(SAY_BONE_STORM, me);
					m_uiBoneStormChanelTimer = 45000;
					m_uiMove = 4000;
				} else m_uiBoneStormChanelTimer -= uiDiff;

				if (m_uiSaberSlashTimer <= uiDiff)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_TOPAGGRO, 0);
					me->CastCustomSpell(RAID_MODE(SPELL_SABER_SLASH_10_NORMAL,SPELL_SABER_SLASH_25_NORMAL,SPELL_SABER_SLASH_10_HEROIC,SPELL_SABER_SLASH_10_HEROIC) , SPELLVALUE_RADIUS_MOD, 20);
					DoCast(pTarget, RAID_MODE(SPELL_SABER_SLASH_10_NORMAL,SPELL_SABER_SLASH_25_NORMAL,SPELL_SABER_SLASH_10_HEROIC,SPELL_SABER_SLASH_10_HEROIC));
					m_uiSaberSlashTimer = 9000;
				} else m_uiSaberSlashTimer -= uiDiff;

				if (me->HasAura(SPELL_BONE_STORM_CHANNEL))
				{
					if (m_uiMove <= uiDiff)
					{
						Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
						me->GetMotionMaster()->MovePoint(0, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ());
						m_uiMove = 9500;
					}
				} else m_uiMove -= uiDiff;

			}

			if (me->HasAura(SPELL_BONE_STORM_CHANNEL))
			{
				if (m_uiBoneStormTimer <= uiDiff)
				{
					DoScriptText(SAY_BONE_STORM_EMOTE, me);
					DoCastAOE(RAID_MODE(SPELL_BONE_STORM_10_NORMAL,SPELL_BONE_STORM_25_NORMAL,SPELL_BONE_STORM_10_HEROIC,SPELL_BONE_STORM_25_HEROIC));
					m_uiBoneStormTimer = 1500;
				} else m_uiBoneStormTimer -= uiDiff;

				if (m_uiBoneStormRemoveTimer <= uiDiff)
				{
					me->RemoveAurasDueToSpell(SPELL_BONE_STORM_CHANNEL);
					m_uiBoneStormRemoveTimer = 20000;
				} else m_uiBoneStormRemoveTimer -= uiDiff;
			}

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new boss_lord_marrowgarAI(pCreature);
	}

};

class npc_cold_flame : public CreatureScript
{
public:
	npc_cold_flame() : CreatureScript("npc_cold_flame") { }

	struct npc_cold_flameAI : public ScriptedAI
	{
		npc_cold_flameAI(Creature *pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}
		InstanceScript* m_pInstance;
		uint32 m_uiColdFlameTimer;
		uint32 m_uiColdDespawn;
		void Reset()
		{
			float x, y, z;
			me->GetNearPoint(me, x, y, z, 1, 50, M_PI*2*rand_norm());
			me->GetMotionMaster()->MovePoint(0, x, y, z);
			DoCast(me,RAID_MODE(SPELL_COLD_FLAME_10_NORMAL,SPELL_COLD_FLAME_25_NORMAL,SPELL_COLD_FLAME_10_HEROIC,SPELL_COLD_FLAME_25_HEROIC));
			me->SetReactState(REACT_PASSIVE);
			me->SetSpeed(MOVE_WALK, 0.7f, true);
			m_uiColdDespawn    = RAID_MODE(4000,9000,4000,9000);
			m_uiColdFlameTimer = 1000;
		}
		void UpdateAI(const uint32 uiDiff)
		{
			if(m_uiColdFlameTimer <= uiDiff)
			{
				DoCast(me,RAID_MODE(SPELL_COLD_FLAME_10_NORMAL,SPELL_COLD_FLAME_25_NORMAL,SPELL_COLD_FLAME_10_HEROIC,SPELL_COLD_FLAME_25_HEROIC));
				m_uiColdFlameTimer = 1000;
			} else m_uiColdFlameTimer -= uiDiff;

			if(m_uiColdDespawn <= uiDiff)
			{
				DoCast(me, SPELL_COLD_DESPAWN);
				me->ForcedDespawn();
			} m_uiColdDespawn -= uiDiff;
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_cold_flameAI(pCreature);
	}

};

class spell_marrowgar_bone_spike_graveyard : public SpellHandlerScript
{
    public:
        spell_marrowgar_bone_spike_graveyard() : SpellHandlerScript("spell_marrowgar_bone_spike_graveyard") { }

        class spell_marrowgar_bone_spike_graveyard_SpellScript : public SpellScript
        {
            void HandleApplyAura(SpellEffIndex effIndex)
            {
                CreatureAI* marrowgarAI = GetCaster()->ToCreature()->AI();
                bool yell = false;
                uint8 boneSpikeCount = GetCaster()->GetMap()->GetSpawnMode() & 1 ? 3 : 1;
                for (uint8 i = 0; i < boneSpikeCount; ++i)
                {
                    // select any unit but not the tank
                    Unit* target = marrowgarAI->SelectTarget(SELECT_TARGET_RANDOM, 1, 100.0f, true, -SPELL_IMPALED);
                    if (!target)
                        target = marrowgarAI->SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true, -SPELL_IMPALED);  // or the tank if its solo
                    if (!target)
                        break;
                    yell = true;
                    //marrowgarAI->DoCast(*itr, SPELL_IMPALE);    // this is the proper spell but if we use it we dont have any way to assign a victim to it
                    Creature* pBone = GetCaster()->SummonCreature(NPC_BONE_SPIKE, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN);
                    CAST_AI(npc_bone_spike::npc_bone_spikeAI, pBone->AI())->SetTrappedUnit(target);
                }

                if (yell)
                    DoScriptText(RAND(SAY_BONESPIKE_1, SAY_BONESPIKE_2, SAY_BONESPIKE_3), GetCaster());
            }

            void Register()
            {
                EffectHandlers += EffectHandlerFn(spell_marrowgar_bone_spike_graveyard_SpellScript::HandleApplyAura, EFFECT_1, SPELL_EFFECT_APPLY_AURA);
            }

            bool Load()
            {
                if (GetCaster()->GetEntry() != CREATURE_MARROWGAR)
                    return false;
                return true;
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_marrowgar_bone_spike_graveyard_SpellScript();
        }
};

class spell_marrowgar_bone_storm : public SpellHandlerScript
{
    public:
        spell_marrowgar_bone_storm() : SpellHandlerScript("spell_marrowgar_bone_storm") { }

        class spell_marrowgar_bone_storm_SpellScript : public SpellScript
        {
            void RecalculateDamage(SpellEffIndex effIndex)
            {
                int32 dmg = GetHitDamage();
                float distance = GetHitUnit()->GetExactDist2d(GetCaster());
                if (distance < 5.0f)
                    return;

                float distVar = distance >= 20.0f ? 4 : (10.0f/3.0f);
                dmg /= distance / distVar;
                SetHitDamage(dmg);
            }

            void Register()
            {
                EffectHandlers += EffectHandlerFn(spell_marrowgar_bone_storm_SpellScript::RecalculateDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }

            bool Load()
            {
                if (GetCaster()->GetEntry() != CREATURE_MARROWGAR)
                    return false;
                return true;
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_marrowgar_bone_storm_SpellScript();
        }
};

void AddSC_boss_lord_marrowgar()
{
	new boss_lord_marrowgar;
	new npc_cold_flame;
	new npc_bone_spike;
	new spell_marrowgar_bone_spike_graveyard;
	new spell_marrowgar_bone_storm;
// has to be done or else players threat will be wiped for impaled player and he will absorb all damage
    if (VehicleSeatEntry* vehSeat = const_cast<VehicleSeatEntry*>(sVehicleSeatStore.LookupEntry(6206)))
        vehSeat->m_flags |= 0x400;
}