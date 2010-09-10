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

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

enum DeathwhisperSpells
{
	SPELL_DEATH_AND_DECAY_10_NORMAL    =    71001,
	SPELL_DEATH_AND_DECAY_25_NORMAL    =    72108,
	SPELL_DEATH_AND_DECAY_10_HEROIC    =    71001,
	SPELL_DEATH_AND_DECAY_25_HEROIC    =    72110,
	SPELL_DOMINATE_MIND                =    71289,
	SPELL_SHADOW_BOLT_10_NORMAL        =    71254,
	SPELL_SHADOW_BOLT_25_NORMAL        =    72008,
	SPELL_SHADOW_BOLT_10_HEROIC        =    72008,
	SPELL_SHADOW_BOLT_25_HEROIC        =    72504,
	SPELL_MANA_BARRIER                 =    70842,
	SPELL_DARK_EMPOWEREMENT            =    70901,
	SPELL_FROST_BOLT_10_NORMAL         =    71420,
	SPELL_FROST_BOLT_25_NORMAL         =    72007,
	SPELL_FROST_BOLT_10_HEROIC         =    72007,
	SPELL_FROST_BOLT_25_HEROIC         =    72502,
	SPELL_FROST_BOLT_VALLEY_10_NORMAL  =    72905,
	SPELL_FROST_BOLT_VALLEY_25_NORMAL  =    72906,
	SPELL_FROST_BOLT_VALLEY_10_HEROIC  =    72907,
	SPELL_FROST_BOLT_VALLEY_25_HEROIC  =    72908,
	SPELL_SUMMON_SHADE                 =    71363,
	SPELL_INSIGNIFICANCE               =    71204,
	SPELL_ROOT                         =    42716,
	SPELL_BLAST_10_NORMAL              =    72011,
	SPELL_BLAST_10_HEROIC              =    72010,
	SPELL_BLAST_25_NORMAL              =    72010,
	SPELL_BLAST_25_HEROIC              =    72012,
	SPELL_PORT_VISUAL                  =    41236,
	//SPELL_ANIMATED_DEAD                =    ?????,
};

enum Yells
{
	SAY_INTRO_1            =    -1631011,
	SAY_INTRO_2            =    -1631012,
	SAY_INTRO_3            =    -1631013,
	SAY_INTRO_4            =    -1631014,
	SAY_INTRO_5            =    -1631015,
	SAY_INTRO_6            =    -1631016,
	SAY_INTRO_7            =    -1631017,
	SAY_AGGRO              =    -1631018,
	SAY_PHASE_2            =    -1631019,
	SAY_PHASE_2_EMOTE      =    -1631020,
	SAY_DOMINATE_MIND      =    -1631021,
	SAY_EMPOWERMENT        =    -1631022,
	SAY_TRANSFORMATION     =    -1631023,
	SAY_ANIMATE_DEAD       =    -1631024,
	SAY_KILL_1             =    -1631025,
	SAY_KILL_2             =    -1631026,
	SAY_BERSERK            =    -1631027,
	SAY_DEATH              =    -1631028,
};

class boss_lady_deathwhisper : public CreatureScript
{
public:
	boss_lady_deathwhisper() : CreatureScript("boss_lady_deathwhisper") { }

	struct boss_lady_deathwhisperAI : public ScriptedAI
	{
		boss_lady_deathwhisperAI(Creature *pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* m_pInstance;

		uint32 m_uiPhase;
		uint32 m_uiDominateMindTimer;
		uint32 m_uiSummonWaveTimer;
		uint32 m_uiDeathandDecayTimer;
		uint8  m_uiIntroText;
		uint32 m_uiIntroTextTimer;
		uint32 m_uiFrostBoltTimer;
		uint32 m_uiFrostValleyTimer;
		uint32 m_uiShadowBoltTimer;
		uint32 m_uiBerserkTimer;
		uint32 m_uiInsignificanceTimer;
		uint32 m_uiShadeTimer;
		uint32 m_uiDarkEmpoweredTimer;
		uint32 m_uiResetTimer;

		void Reset()
		{
			m_uiPhase = 1;
			m_uiSummonWaveTimer = 60000;
			m_uiDeathandDecayTimer = 10000;
			m_uiIntroText = 0;
			m_uiIntroTextTimer = 15000;
			m_uiFrostBoltTimer = 5000;
			m_uiFrostValleyTimer = 15000;
			m_uiShadowBoltTimer = 5000;
			m_uiBerserkTimer = 600000;
			m_uiInsignificanceTimer = 30000;
			m_uiShadeTimer = 10000;
			m_uiDominateMindTimer = 12000;
			m_uiDarkEmpoweredTimer = 20000;

			if (m_pInstance)
				m_pInstance->SetData(DATA_DEATHWHISPER_EVENT, NOT_STARTED);

			if (!me->HasAura(SPELL_ROOT))
				DoCast(me, SPELL_ROOT);
		}

		void EnterCombat(Unit* who)
		{
			DoScriptText(SAY_AGGRO, me);

			if (m_pInstance)
				m_pInstance->SetData(DATA_DEATHWHISPER_EVENT, IN_PROGRESS);

			if (!me->HasAura(SPELL_MANA_BARRIER))
			{
				DoCast(me, SPELL_MANA_BARRIER);
			}
		}

		void JustDied(Unit* killer)
		{
			DoScriptText(SAY_DEATH, me);

			if (m_pInstance)
				m_pInstance->SetData(DATA_DEATHWHISPER_EVENT, DONE);
		}

		void JustReachedHome()
		{
			if(m_pInstance)
				m_pInstance->SetData(DATA_DEATHWHISPER_EVENT, FAIL);
		}

		void KilledUnit(Unit *victim)
		{
			switch (urand(0,1))
			{
			case 0:
				DoScriptText(SAY_KILL_1,me);
				break;
			case 1:
				DoScriptText(SAY_KILL_2,me);
				break;
			}
		}

		void MoveInLineOfSight(Unit* pWho)
		{
			if (me->IsWithinDistInMap(pWho, 90.0f) && m_uiIntroText == 0)
			{
				DoScriptText(SAY_INTRO_1, me);
				m_uiIntroText++;
			}
		}

		void JustSummoned(Creature* pSummoned)
		{
			DoCast(pSummoned, SPELL_PORT_VISUAL);

			Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
			pSummoned->AI()->AttackStart(pTarget);
		}

		void AdherentList(Unit* me)
		{
			me->FindNearestCreature(CREATURE_ADHERENT, 200.0f);

			std::list<Creature*> pAdherentList;
			Trinity::AllCreaturesOfEntryInRange checker(me, CREATURE_ADHERENT, 200.0f);
			Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher(me, pAdherentList, checker);
			me->VisitNearbyObject(200.0f, searcher);

			if(pAdherentList.empty())
				return;

			std::list<Creature*>::iterator itr = pAdherentList.begin();
			uint32 rnd = rand()%pAdherentList.size();

			for(uint32 i = 0; i < rnd; ++i)
				++itr;

			(*itr)->CastSpell(me, SPELL_DARK_EMPOWEREMENT, true);
		}

		void FanaticList(Unit* me)
		{
			me->FindNearestCreature(CREATURE_FANATIC, 200.0f);

			std::list<Creature*> pFanaticList;
			Trinity::AllCreaturesOfEntryInRange checker(me, CREATURE_FANATIC, 200.0f);
			Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher(me, pFanaticList, checker);
			me->VisitNearbyObject(200.0f, searcher);

			if(pFanaticList.empty())
				return;

			std::list<Creature*>::iterator itr = pFanaticList.begin();
			uint32 rnd = rand()%pFanaticList.size();

			for(uint32 i = 0; i < rnd; ++i)
				++itr;

			(*itr)->CastSpell(me, SPELL_DARK_EMPOWEREMENT, true);
		}

		void RandomSpawn()
		{
			Unit* pSummoned= NULL;
			switch(rand() % 2)
			{
			case 0:
				me->SummonCreature(CREATURE_FANATIC,-619.006,2158.104,50.848,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
				me->SummonCreature(CREATURE_ADHERENT,-598.697,2157.767,50.848,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
				me->SummonCreature(CREATURE_FANATIC,-577.992,2156.989,50.848,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
				break;
			case 1:
				me->SummonCreature(CREATURE_ADHERENT,-618.748,2266.648,50.849,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
				me->SummonCreature(CREATURE_FANATIC,-598.573,2266.870,50.849,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
				me->SummonCreature(CREATURE_ADHERENT,-578.360,2267.210,50.849,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
				break;
			}
		}


		void DamageTaken(Unit* done_by, uint32 &damage)
		{
			if (me->HasAura(SPELL_MANA_BARRIER))
			{
				me->SetHealth(me->GetHealth()+damage);
				me->SetPower(POWER_MANA, me->GetPower(POWER_MANA)>damage ? me->GetPower(POWER_MANA)-damage : 0);
			}
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;

			if (me->hasUnitState(UNIT_STAT_CASTING))
				return;

				if (m_uiIntroTextTimer < uiDiff)
				{
					switch(m_uiIntroText)
					{
					case 1: DoScriptText(SAY_INTRO_2, me); break;
					case 2: DoScriptText(SAY_INTRO_3, me); break;
					case 3: DoScriptText(SAY_INTRO_4, me); break;
					case 4: DoScriptText(SAY_INTRO_5, me); break;
					case 5: DoScriptText(SAY_INTRO_6, me); break;
					case 6: DoScriptText(SAY_INTRO_7, me); break;
					}
					m_uiIntroText++;
					m_uiIntroTextTimer = 10500;
				} else m_uiIntroTextTimer -= uiDiff;

			if (m_uiResetTimer <= uiDiff)
			{
				if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) > 100)
					EnterEvadeMode();
				m_uiResetTimer = 5000;
			} else m_uiResetTimer -= uiDiff;

			if (m_uiBerserkTimer < uiDiff)
			{
				DoCast(me, SPELL_BERSERK);
				DoScriptText(SAY_BERSERK, me);
				m_uiBerserkTimer = 600000;
			} else m_uiBerserkTimer -= uiDiff;

			if (m_uiDeathandDecayTimer < uiDiff)
			{
				Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
				      if (!pTarget)
					        pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				      if (pTarget)
				DoCast(pTarget, RAID_MODE(SPELL_DEATH_AND_DECAY_10_NORMAL,SPELL_DEATH_AND_DECAY_25_NORMAL,SPELL_DEATH_AND_DECAY_10_HEROIC,SPELL_DEATH_AND_DECAY_25_HEROIC));
				m_uiDeathandDecayTimer = 11000;
			} else m_uiDeathandDecayTimer -= uiDiff;

			if (m_uiDarkEmpoweredTimer < uiDiff)
			{
				DoScriptText(SAY_EMPOWERMENT, me);
				switch(rand() % 2)
				{
				case 0:
					AdherentList(me);
					break;
				case 1:
					FanaticList(me);
					break;
				}
				m_uiDarkEmpoweredTimer = 20000;
			} else m_uiDarkEmpoweredTimer -= uiDiff;

			if (getDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL || getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
			{
			if (m_uiDominateMindTimer < uiDiff)
			{
				uint32 count = RAID_MODE(0,1,1,3);
				for (uint8 i = 1; i <= count; i++)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
				          if (!pTarget)
					        pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
					if (pTarget && !pTarget->HasAura(71289))
					{
						DoCast(pTarget, SPELL_DOMINATE_MIND);
						DoScriptText(SAY_DOMINATE_MIND, me);
					}
				}
				m_uiDominateMindTimer = urand(18000, 22000);
			} else m_uiDominateMindTimer -= uiDiff;
			}

			if (m_uiPhase == 1)
			{
				if (me->GetPower(POWER_MANA) == 100000)
				{
					DoScriptText(SAY_PHASE_2_EMOTE, me);
				}

				if (m_uiShadowBoltTimer < uiDiff)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
				      if (!pTarget)
					        pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				      if (pTarget)
					DoCast(pTarget, RAID_MODE(SPELL_SHADOW_BOLT_10_NORMAL,SPELL_SHADOW_BOLT_25_NORMAL,SPELL_SHADOW_BOLT_10_HEROIC,SPELL_SHADOW_BOLT_25_HEROIC));
					m_uiShadowBoltTimer = 5000;
				} else m_uiShadowBoltTimer -= uiDiff;

				if (m_uiSummonWaveTimer < uiDiff)
				{
					if (getDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL || getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
					{
						RandomSpawn();
					}
					if (getDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL || getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
					{
						me->SummonCreature(CREATURE_FANATIC,-619.006,2158.104,50.848,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
						me->SummonCreature(CREATURE_ADHERENT,-598.697,2157.767,50.848,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
						me->SummonCreature(CREATURE_FANATIC,-577.992,2156.989,50.848,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
						me->SummonCreature(CREATURE_ADHERENT,-618.748,2266.648,50.849,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
						me->SummonCreature(CREATURE_FANATIC,-598.573,2266.870,50.849,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
						me->SummonCreature(CREATURE_ADHERENT,-578.360,2267.210,50.849,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
						me->SummonCreature(RAND(CREATURE_FANATIC, CREATURE_ADHERENT), -555.643,2211.281,49.476,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
					}
					m_uiSummonWaveTimer = 60000;
				} else m_uiSummonWaveTimer -= uiDiff;

				if ((me->GetPower(POWER_MANA)*100 / me->GetMaxPower(POWER_MANA)) < 1)
				{
					DoScriptText(SAY_PHASE_2_EMOTE, me);
					DoScriptText(SAY_PHASE_2, me);
					DoResetThreat();
					m_uiPhase = 2;
				}
			}

			if (m_uiPhase == 2)
			{
				if (me->HasAura(SPELL_MANA_BARRIER))
					me->RemoveAurasDueToSpell(SPELL_MANA_BARRIER);

				if (me->HasAura(SPELL_ROOT))
					me->RemoveAurasDueToSpell(SPELL_ROOT);

				if (m_uiFrostBoltTimer < uiDiff)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_TOPAGGRO,0);
					me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_INTERRUPT, false);
					DoCast(pTarget, RAID_MODE(SPELL_FROST_BOLT_10_NORMAL,SPELL_FROST_BOLT_25_NORMAL,SPELL_FROST_BOLT_10_HEROIC,SPELL_FROST_BOLT_25_HEROIC));
					m_uiFrostBoltTimer = 5000;
				} else m_uiFrostBoltTimer -= uiDiff;

				if (m_uiFrostValleyTimer < uiDiff)
				{
					me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_INTERRUPT, true);
					DoCastAOE(RAID_MODE(SPELL_FROST_BOLT_VALLEY_10_NORMAL,SPELL_FROST_BOLT_VALLEY_25_NORMAL,SPELL_FROST_BOLT_VALLEY_10_HEROIC,SPELL_FROST_BOLT_VALLEY_25_HEROIC));
					m_uiFrostValleyTimer = 15000;
				} else m_uiFrostValleyTimer -= uiDiff;

				if (m_uiInsignificanceTimer < uiDiff)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_TOPAGGRO,0);
					DoCast(pTarget, SPELL_INSIGNIFICANCE);
					m_uiInsignificanceTimer = 30000;
				} else m_uiInsignificanceTimer -= uiDiff;

				if (m_uiSummonWaveTimer < uiDiff)
				{
					if (getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
					{
						Unit* pSummoned= NULL;
						me->SummonCreature(RAND(CREATURE_FANATIC, CREATURE_ADHERENT), -555.643,2211.281,49.476,0,TEMPSUMMON_CORPSE_TIMED_DESPAWN,10000);
					}
					if (getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
					{
						RandomSpawn();
					}
					m_uiSummonWaveTimer = 60000;
				} else m_uiSummonWaveTimer -= uiDiff;

				if (m_uiShadeTimer < uiDiff)
				{
					uint32 count = RAID_MODE(0,1,1,1);
					for (uint8 i = 1; i <= count; i++)
					{
						Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
				      if (!pTarget)
					        pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				      if (pTarget)
						DoCast(pTarget, SPELL_SUMMON_SHADE);
						m_uiShadeTimer = 15000;
					}
				} else m_uiShadeTimer -= uiDiff;

				DoMeleeAttackIfReady();
			}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new boss_lady_deathwhisperAI(pCreature);
	}

};

class npc_vengeful_shade : public CreatureScript
{
public:
	npc_vengeful_shade() : CreatureScript("npc_vengeful_shade") { }

	struct npc_vengeful_shadeAI : public ScriptedAI
	{
		npc_vengeful_shadeAI(Creature *pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* m_pInstance;

		uint32 m_uiShade1Timer;

		void Reset()
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			me->SetSpeed(MOVE_WALK, 0.6f, true);
			me->SetReactState(REACT_AGGRESSIVE);
			m_uiShade1Timer = 15000;
		}

		void JustSummoned(Creature *pSummoned)
		{
			Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 1);
			pSummoned->AddThreat(pTarget, 500000.0f);
			pSummoned->GetMotionMaster()->MoveChase(pTarget);
		}


		void EnterCombat(Unit* who)
		{
		}

		void KilledUnit(Unit* victim)
		{
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;


			if (m_uiShade1Timer < uiDiff)
			{
				Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,1);
				DoCast(pTarget, RAID_MODE(SPELL_BLAST_10_NORMAL,SPELL_BLAST_25_NORMAL,SPELL_BLAST_10_HEROIC,SPELL_BLAST_25_HEROIC));
				me->ForcedDespawn();
			}else m_uiShade1Timer -= uiDiff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_vengeful_shadeAI(pCreature);
	}

};

class spell_deathwhisper_mana_barrier : public SpellScriptLoader
{
    public:
        spell_deathwhisper_mana_barrier() : SpellScriptLoader("spell_deathwhisper_mana_barrier") { }

        class spell_deathwhisper_mana_barrier_AuraScript : public AuraScript
        {
            void HandlePeriodicTick(AuraEffect const * /*aurEff*/, AuraApplication const * /*aurApp*/)
            {
                Unit* caster = GetCaster();
                int32 missingHealth = caster->GetMaxHealth() - caster->GetHealth();
                caster->ModifyHealth(missingHealth);
                caster->ModifyPower(POWER_MANA, -missingHealth);
            }

            void Register()
            {
                PreventDefaultEffect(EFFECT_0);
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_deathwhisper_mana_barrier_AuraScript::HandlePeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_deathwhisper_mana_barrier_AuraScript();
        }
};

void AddSC_boss_lady_deathwhisper()
{
    new boss_lady_deathwhisper;
    new npc_vengeful_shade;
    new spell_deathwhisper_mana_barrier();
}