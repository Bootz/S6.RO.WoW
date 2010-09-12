/*
 * Copyright (C) 2008-2010 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

enum Yells
{
    SAY_INTRO     = -1631000,
    SAY_AGGRO     = -1631001,
    SAY_STORM     = -1631002,
    SAY_SPIKE_1   = -1631003,
    SAY_SPIKE_2   = -1631004,
    SAY_SPIKE_3   = -1631005,
    SAY_KILL_1    = -1631006,
    SAY_KILL_2    = -1631007,
    SAY_DEATH     = -1631008,
    SAY_BERSERK   = -1631009,
    STORM_EMOTE   = -1631010
};

enum Spells
{
    SPELL_SABER_SLASH        = 69055,
    SPELL_COLD_FLAME         = 69146,
    SPELL_BONE_SPIKE         = 69057,
    SPELL_SPIKE_IMPALING     = 69065,
    SPELL_BONE_STORM         = 69076,
    SPELL_COLD_FLAME_SPAWN   = 69138,
    SPELL_COLD_FLAME_SPAWN_B = 72701
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
                BoneSpikeGUID = 0;
                pInstance = pCreature->GetInstanceScript();
            }

            void Reset()
            {
                BoneSpikeGUID = 0;
            }

            void JustDied(Unit* pKiller)
            {
                Unit* pBoned = Unit::GetUnit((*me), BoneSpikeGUID);
                if (pBoned)
                    pBoned->RemoveAurasDueToSpell(SPELL_SPIKE_IMPALING);
            }

            void KilledUnit(Unit* pVictim)
            {
                me->Kill(me);
            }

            void UpdateAI(const uint32 /*diff*/)
            {
                if (!BoneSpikeGUID)
                    return;

                Unit* pBoned = Unit::GetUnit((*me), BoneSpikeGUID);
                if ((pBoned && pBoned->isAlive() && !pBoned->HasAura(SPELL_SPIKE_IMPALING)) || !pBoned)
                    me->Kill(me);
            }

            void SetPrisoner(Unit* pPrisoner)
            {
                pPrisoner->EnterVehicle(vehicle, 0);
                BoneSpikeGUID = pPrisoner->GetGUID();
            }

            void PassengerBoarded(Unit * pPrisoner, int8 /*seatId*/, bool apply)
            {
                if (!apply)
                    return;

                me->AddAura(SPELL_SPIKE_IMPALING, pPrisoner);
            }

        private:
            InstanceScript* pInstance;

		uint64 BoneSpikeGUID;
            Vehicle* vehicle;
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_bone_spikeAI(pCreature);
	}
};

class npc_coldflame : public CreatureScript
{
    public:
        npc_coldflame() : CreatureScript("npc_coldflame") { }

        struct npc_coldflameAI : public ScriptedAI
        {
            npc_coldflameAI(Creature *pCreature) : ScriptedAI(pCreature)
            {
                pInstance = pCreature->GetInstanceScript();
            }

            void Reset()
            {
                m_uiColdFlameTimer = 900;

                DoCast(me, SPELL_COLD_FLAME);

                me->SetVisibility(VISIBILITY_OFF);
                DoStartNoMovement(me->getVictim());

                stage = 1;
                radius = 2;
                ownerEntry = 0;
            }

            void IsSummonedBy(Unit* owner)
            {
                if(owner)
                {
                    if(owner->HasAura(SPELL_BONE_STORM))
                        crossfire = true;
                    else
                        crossfire = false;

                    ownerEntry = owner->GetEntry();
                }
            }

            void UpdateAI(const uint32 uiDiff)
            {
                if(ownerEntry == CREATURE_MARROWGAR && m_uiColdFlameTimer <= uiDiff)
                {
                    if(crossfire)
                    {
                        float x, y;
                        me->GetNearPoint2D(x, y, radius*stage, 0);
                        me->SummonCreature(CREATURE_COLD_FLAME, x, y, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 4000);
                        me->GetNearPoint2D(x, y, radius*stage, M_PI/2);
                        me->SummonCreature(CREATURE_COLD_FLAME, x, y, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 4000);
                        me->GetNearPoint2D(x, y, radius*stage, M_PI*(M_PI/2));
                        me->SummonCreature(CREATURE_COLD_FLAME, x, y, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 4000);
                        me->GetNearPoint2D(x, y, radius*stage, M_PI);
                        me->SummonCreature(CREATURE_COLD_FLAME, x, y, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 4000);
                    }
                    else
                    {
                        float x, y;
                        float angle = pInstance->GetData(DATA_ANGLE);
                        me->GetNearPoint2D(x, y, radius*stage, angle);
                        me->SummonCreature(CREATURE_COLD_FLAME, x, y, me->GetPositionZ(), angle, TEMPSUMMON_TIMED_DESPAWN, 4000);
                    }
                    ++stage;
                    m_uiColdFlameTimer = urand(10000, 15000);
                } else m_uiColdFlameTimer -= uiDiff;
            }

        private:
            InstanceScript* pInstance;

            uint32 m_uiColdFlameTimer;
            uint8 radius;
            uint8 stage;
            uint32 ownerEntry;
            bool crossfire;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_coldflameAI(pCreature);
        }
};

class boss_lord_marrowgar : public CreatureScript
{
public:
	boss_lord_marrowgar() : CreatureScript("boss_lord_marrowgar") { }

        struct boss_lord_marrowgarAI : public BossAI
	{
            boss_lord_marrowgarAI(Creature* pCreature) : BossAI(pCreature, DATA_MARROWGAR), summons(me)
		{
			pInstance = pCreature->GetInstanceScript();
                m_uiBoneCount = RAID_MODE(1,3,1,3);
                fBaseSpeed = me->GetSpeedRate(MOVE_RUN);
                bIntro = false;
		}

		void Reset()
		{
			m_uiSaberSlashTimer = 6000;
			m_uiBoneSpikeGraveyardTimer  = 15000;
                m_uiColdFlameTimer = 8000;
                m_uiBoneStormTimer = 30000;
			m_uiBoneStormRemoveTimer = 20000;
			m_uiBerserkTimer = 600000;
                m_uiMoveTimer = 5000;
                angle = 0;

                me->SetSpeed(MOVE_RUN, fBaseSpeed, true);

                if (pInstance && me->isAlive())
				pInstance->SetData(DATA_MARROWGAR_EVENT, NOT_STARTED);
		}

            void EnterCombat(Unit* /*pWho*/)
		{
			DoScriptText(SAY_AGGRO, me);
                DoStartNoMovement(me->getVictim());

			if (pInstance)
				pInstance->SetData(DATA_MARROWGAR_EVENT, IN_PROGRESS);

                summons.DespawnAll();
            }

            void JustSummoned(Creature* summon)
            {
                summons.Summon(summon);
            }

            void JustDied(Unit* /*pKiller*/)
		{
			DoScriptText(SAY_DEATH, me);

			if (pInstance)
                {
				pInstance->SetData(DATA_MARROWGAR_EVENT, DONE);
                    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_SPIKE_IMPALING);
                }

                summons.DespawnAll();
		}

		void JustReachedHome()
		{
			if(pInstance)
                {
				pInstance->SetData(DATA_MARROWGAR_EVENT, FAIL);
                    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_SPIKE_IMPALING);
                }

                summons.DespawnAll();
            }

            void KilledUnit(Unit* pVictim)
            {
                if (pVictim->GetTypeId() == TYPEID_PLAYER)
                {
                    switch(rand()%1)
                    {
                        case 0: DoScriptText(SAY_KILL_1, me); break;
                        case 1: DoScriptText(SAY_KILL_2, me); break;
                    }
                }
            }

            void MoveInLineOfSight(Unit* pWho)
            {
                if (!bIntro && me->IsWithinDistInMap(pWho, 90.0f, true))
                {
                    DoScriptText(SAY_INTRO, me);
                    bIntro = true;
                }
            }

            void BoneSpike()
            {
                switch(rand()%2)
                {
                    case 0: DoScriptText(SAY_SPIKE_1, me); break;
                    case 1: DoScriptText(SAY_SPIKE_2, me); break;
                    case 2: DoScriptText(SAY_SPIKE_3, me); break;
                }

                for (uint8 i = 1; i <= m_uiBoneCount; i++)
                {
                    Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
                    if (pTarget && !pTarget->HasAura(SPELL_SPIKE_IMPALING))
                    {
                        Creature* pBone = me->SummonCreature(CREATURE_BONE_SPIKE, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 999999);
                        CAST_AI(npc_bone_spike::npc_bone_spikeAI, pBone->AI())->SetPrisoner(pTarget);
                        pBone->CastSpell(pTarget, SPELL_SPIKE_IMPALING, true);
                    }
                }
		}

		void UpdateAI(const uint32 uiDiff)
		{
                if (!UpdateVictim() || me->HasAura(SPELL_BONE_STORM))
				return;

			if (m_uiBerserkTimer <= uiDiff)
			{
				DoScriptText(SAY_BERSERK, me);
				DoCast(SPELL_BERSERK);
				m_uiBerserkTimer = 600000;
			} else m_uiBerserkTimer -= uiDiff;

                if (IsHeroic() || !me->HasAura(SPELL_BONE_STORM))
				{
					if (m_uiBoneSpikeGraveyardTimer < uiDiff)
					{
                        BoneSpike();
                        m_uiBoneSpikeGraveyardTimer = 15000;
					} else m_uiBoneSpikeGraveyardTimer -= uiDiff;
                }

                if (!me->HasAura(SPELL_BONE_STORM))
                {
				if (m_uiBoneStormTimer <= uiDiff)
				{
                        DoCast(SPELL_BONE_STORM);
                        DoScriptText(SAY_STORM, me);
                        DoScriptText(STORM_EMOTE, me);
                        me->SetSpeed(MOVE_RUN, fBaseSpeed*3.0f, true);
                        m_uiBoneStormTimer = 30000;
				} else m_uiBoneStormTimer -= uiDiff;

                    if (m_uiColdFlameTimer <= uiDiff)
                    {
                        if(Unit* pTarget = SelectUnit(SELECT_TARGET_NEAREST, 1))
                        {
                            angle = me->GetAngle(pTarget);
                            pInstance->SetData(DATA_ANGLE, angle);
                            DoCast(pTarget, SPELL_COLD_FLAME_SPAWN);
                        }
                        m_uiColdFlameTimer = urand(10000, 15000);
                    } else m_uiColdFlameTimer -= uiDiff;

                    if (m_uiSaberSlashTimer <= uiDiff)
                    {
                        DoCast(me->getVictim(), SPELL_SABER_SLASH);
                        m_uiSaberSlashTimer = 5000;
                    } else m_uiSaberSlashTimer -= uiDiff;
                }
                else
                {
				if (m_uiBoneStormRemoveTimer <= uiDiff)
				{
                        me->RemoveAurasDueToSpell(SPELL_BONE_STORM);
                        me->GetMotionMaster()->MovementExpired();
                        me->SetSpeed(MOVE_RUN, fBaseSpeed, true);
					m_uiBoneStormRemoveTimer = 20000;
				} else m_uiBoneStormRemoveTimer -= uiDiff;

                    if(m_uiMoveTimer <= uiDiff)
                    {
                        float x, y, z;
                        Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
                        if(pTarget && pTarget->GetTypeId() == TYPEID_PLAYER)
                            pTarget->GetPosition(x, y, z);
                            me->GetMotionMaster()->MovePoint(0, x, y, z);
                        DoCast(SPELL_COLD_FLAME_SPAWN_B);
                        m_uiMoveTimer = 5000;
                    } else m_uiMoveTimer -= uiDiff;
			}

			DoMeleeAttackIfReady();
		}

        private:
            InstanceScript* pInstance;

            uint32 m_uiSaberSlashTimer;
            uint32 m_uiBoneSpikeGraveyardTimer;
            uint32 m_uiBoneStormTimer;
            uint32 m_uiBoneStormRemoveTimer;
            uint32 m_uiColdFlameTimer;
            uint32 m_uiBerserkTimer;
            uint32 m_uiResetTimer;
            uint32 m_uiMoveTimer;
            uint8 m_uiBoneCount;
            float fBaseSpeed;
            float angle;
            bool bIntro;

            SummonList summons;
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new boss_lord_marrowgarAI(pCreature);
	}
};

class spell_marrowgar_bone_spike_graveyard : public SpellScriptLoader
{
    public:
        spell_marrowgar_bone_spike_graveyard() : SpellScriptLoader("spell_marrowgar_bone_spike_graveyard") { }

        class spell_marrowgar_bone_spike_graveyard_SpellScript : public SpellScript
        {
            void HandleApplyAura(SpellEffIndex /*effIndex*/)
            {
                CreatureAI* marrowgarAI = GetCaster()->ToCreature()->AI();
                uint8 boneSpikeCount = GetCaster()->GetMap()->GetSpawnMode() & 1 ? 3 : 1;
                for (uint8 i = 0; i < boneSpikeCount; ++i)
                {
                    // select any unit but not the tank
                    Unit* target = marrowgarAI->SelectTarget(SELECT_TARGET_RANDOM, 1, 100.0f, true, -SPELL_SPIKE_IMPALING);
                    if (!target && !i)
                        target = marrowgarAI->SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true, -SPELL_SPIKE_IMPALING);
                    if (!target)
                        break;
                    //marrowgarAI->DoCast(*itr, SPELL_IMPALE);    // this is the proper spell but if we use it we dont have any way to assign a victim to it
                    Creature* pBone = GetCaster()->SummonCreature(CREATURE_BONE_SPIKE, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN);
                    CAST_AI(npc_bone_spike::npc_bone_spikeAI, pBone->AI())->SetPrisoner(target);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_marrowgar_bone_spike_graveyard_SpellScript::HandleApplyAura, EFFECT_1, SPELL_EFFECT_APPLY_AURA);
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

void AddSC_boss_lord_marrowgar()
{
    new boss_lord_marrowgar;
    new npc_coldflame;
    new npc_bone_spike;
    new spell_marrowgar_bone_spike_graveyard;

    // has to be done or else players threat will be wiped for impaled player and he will absorb all damage
    if (VehicleSeatEntry* vehSeat = const_cast<VehicleSeatEntry*>(sVehicleSeatStore.LookupEntry(6206)))
        vehSeat->m_flags |= 0x400;
}