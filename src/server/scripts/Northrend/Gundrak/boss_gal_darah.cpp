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
#include "gundrak.h"

//Spells
enum Spells
{
    SPELL_ENRAGE                                  = 55285,
    H_SPELL_ENRAGE                                = 59828,
    SPELL_IMPALING_CHARGE                         = 54956,
    H_SPELL_IMPALING_CHARGE                       = 59827,
    SPELL_STOMP                                   = 55292,
    H_SPELL_STOMP                                 = 59829,
    SPELL_PUNCTURE                                = 55276,
    H_SPELL_PUNCTURE                              = 59826,
    SPELL_STAMPEDE                                = 55218,
    SPELL_WHIRLING_SLASH                          = 55250,
    H_SPELL_WHIRLING_SLASH                        = 59824,
    SPELL_IMPALING_CHARGE_VEHICLE                 = 54958,
    SPELL_ECK_RESIDUE                             = 55817,
    //rhino spirit spells
    SPELL_STAMPEDE_DMG                            = 55220,
    H_SPELL_STAMPEDE_DMG                          = 59823
};

//Yells
enum Yells
{
    SAY_AGGRO                                     = -1604019,
    SAY_TRANSFORM_1                               = -1604020,
    SAY_TRANSFORM_2                               = -1604021,
    SAY_SUMMON_1                                  = -1604022,
    SAY_SUMMON_2                                  = -1604023,
    SAY_SUMMON_3                                  = -1604024,
    SAY_SLAY_1                                    = -1604025,
    SAY_SLAY_2                                    = -1604026,
    SAY_SLAY_3                                    = -1604027,
    SAY_DEATH                                     = -1604028

};

enum Achievements
{
    ACHIEV_WHAT_THE_ECK                           = 1864,
    ACHIEV_SHARE_THE_LOVE                         = 2152
};

enum Displays
{
    DISPLAY_RHINO                                 = 26265,
    DISPLAY_TROLL                                 = 27061
};

enum CombatPhase
{
    TROLL,
    RHINO
};

class boss_gal_darah : public CreatureScript
{
public:
    boss_gal_darah() : CreatureScript("boss_gal_darah") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_gal_darahAI (pCreature);
    }

    struct boss_gal_darahAI : public ScriptedAI
    {
        boss_gal_darahAI(Creature *c) : ScriptedAI(c)
        {
            pInstance = c->GetInstanceScript();
        }

        uint32 uiStampedeTimer;
        uint32 uiWhirlingSlashTimer;
        uint32 uiPunctureTimer;
        uint32 uiEnrageTimer;
        uint32 uiImpalingChargeTimer;
        uint32 uiStompTimer;
        uint32 uiTransformationTimer;
        std::set<uint64> lImpaledPlayers;

        CombatPhase Phase;

        uint8 uiPhaseCounter;

        bool bStartOfTransformation;
        bool bTransformated;

        InstanceScript* pInstance;

        void Reset()
        {
            uiStampedeTimer = 10*IN_MILLISECONDS;
            uiWhirlingSlashTimer = 20*IN_MILLISECONDS;
            uiPunctureTimer = 5*IN_MILLISECONDS;
            uiEnrageTimer = 15*IN_MILLISECONDS;
            uiImpalingChargeTimer = 20*IN_MILLISECONDS;
            uiStompTimer = 10*IN_MILLISECONDS;
            uiTransformationTimer = 6*IN_MILLISECONDS;
            uiPhaseCounter = 0;

            lImpaledPlayers.clear();

            bStartOfTransformation = true;
            bTransformated = false;

            Phase = TROLL;

            me->SetDisplayId(DISPLAY_TROLL);

            if (pInstance)
                pInstance->SetData(DATA_GAL_DARAH_EVENT, NOT_STARTED);
        }

        void EnterCombat(Unit* /*who*/)
        {
            DoScriptText(SAY_AGGRO, me);

            if (pInstance)
                pInstance->SetData(DATA_GAL_DARAH_EVENT, IN_PROGRESS);
        }

        void UpdateAI(const uint32 diff)
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            if (!bTransformated && HealthBelowPct(50)) //transform at least once at 50% health
            {
                bTransformated = true;
                uiPhaseCounter = 2;
            }

            switch (Phase)
            {
                case TROLL:
                    if (uiPhaseCounter >= 2)
                    {
                        if (uiTransformationTimer <= diff)
                        {
                            me->SetDisplayId(DISPLAY_RHINO);
                            Phase = RHINO;
                            uiPhaseCounter = 0;
                            DoScriptText(SAY_TRANSFORM_1, me);
                            uiTransformationTimer = 5*IN_MILLISECONDS;
                            bStartOfTransformation = true;
                            bTransformated = true;
                            me->clearUnitState(UNIT_STAT_STUNNED|UNIT_STAT_ROOT);
                            me->SetReactState(REACT_AGGRESSIVE);
                        }
                        else
                        {
                            uiTransformationTimer -= diff;

                            if (bStartOfTransformation)
                            {
                                bStartOfTransformation = false;
                                me->addUnitState(UNIT_STAT_STUNNED|UNIT_STAT_ROOT);
                                me->SetReactState(REACT_PASSIVE);
                            }
                        }
                    }
                    else
                    {
                        if (uiStampedeTimer <= diff)
                        {
                            DoCast(me, SPELL_STAMPEDE);
                            DoScriptText(RAND(SAY_SUMMON_1,SAY_SUMMON_2,SAY_SUMMON_3),me);
                            uiStampedeTimer = urand(10*IN_MILLISECONDS,15*IN_MILLISECONDS);
                        } else uiStampedeTimer -= diff;

                        if (uiWhirlingSlashTimer <= diff)
                        {
                            DoCast(me->getVictim(), DUNGEON_MODE(SPELL_WHIRLING_SLASH, H_SPELL_WHIRLING_SLASH));
                            uiWhirlingSlashTimer = urand(18*IN_MILLISECONDS,22*IN_MILLISECONDS);;
                            ++uiPhaseCounter;
                        } else uiWhirlingSlashTimer -= diff;
                    }
                break;
                case RHINO:
                    if (uiPhaseCounter >= 2)
                    {
                        if (uiTransformationTimer <= diff)
                        {
                            me->SetDisplayId(DISPLAY_TROLL);
                            Phase = TROLL;
                            uiPhaseCounter = 0;
                            DoScriptText(SAY_TRANSFORM_2, me);
                            uiTransformationTimer = 6*IN_MILLISECONDS;
                            bStartOfTransformation = true;
                            me->clearUnitState(UNIT_STAT_STUNNED|UNIT_STAT_ROOT);
                            me->SetReactState(REACT_AGGRESSIVE);
                        }
                        else
                        {
                            uiTransformationTimer -= diff;

                            if (bStartOfTransformation)
                            {
                                bStartOfTransformation = false;
                                me->addUnitState(UNIT_STAT_STUNNED|UNIT_STAT_ROOT);
                                me->SetReactState(REACT_PASSIVE);
                            }
                        }
                    }
                    else
                    {
                        if (uiPunctureTimer <= diff)
                        {
                            DoCast(me->getVictim(), DUNGEON_MODE(SPELL_PUNCTURE, H_SPELL_PUNCTURE));
                            uiPunctureTimer = 15*IN_MILLISECONDS;
                        } else uiPunctureTimer -= diff;

                        if (uiEnrageTimer <= diff)
                        {
                            DoCast(me->getVictim(), DUNGEON_MODE(SPELL_ENRAGE, H_SPELL_ENRAGE));
                            uiEnrageTimer = 20*IN_MILLISECONDS;
                        } else uiEnrageTimer -= diff;

                        if (uiStompTimer <= diff)
                        {
                            DoCast(me->getVictim(), DUNGEON_MODE(SPELL_STOMP, H_SPELL_STOMP));
                            uiStompTimer = urand(10*IN_MILLISECONDS,15*IN_MILLISECONDS);
                        } else uiStompTimer -= diff;

                        if (uiImpalingChargeTimer <= diff)
                        {
                            if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 1, 100, true))
                            {
                                DoCast(pTarget, DUNGEON_MODE(SPELL_IMPALING_CHARGE, H_SPELL_IMPALING_CHARGE));
                                pTarget->CastSpell(me, SPELL_IMPALING_CHARGE_VEHICLE, true);  // needs vehicle id and take dmg while seated
                                lImpaledPlayers.insert(pTarget->GetGUID());
                            }
                            uiImpalingChargeTimer = 20*IN_MILLISECONDS;
                            ++uiPhaseCounter;
                        } else uiImpalingChargeTimer -= diff;
                    }
                break;
            }

            DoMeleeAttackIfReady();
        }

        void JustDied(Unit* /*killer*/)
        {
            DoScriptText(SAY_DEATH, me);

            if (pInstance)
            {
                if (IsHeroic())
                {
                    if (lImpaledPlayers.size() == 5)
                        pInstance->DoCompleteAchievement(ACHIEV_SHARE_THE_LOVE);

                    AchievementEntry const *achievWhatTheEck = GetAchievementStore()->LookupEntry(ACHIEV_WHAT_THE_ECK);
                    if (achievWhatTheEck)
                    {
                        Map::PlayerList const &players = pInstance->instance->GetPlayers();
                        for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                            if (itr->getSource()->HasAura(SPELL_ECK_RESIDUE))
                                itr->getSource()->CompletedAchievement(achievWhatTheEck);
                    }
                }

                pInstance->SetData(DATA_GAL_DARAH_EVENT, DONE);
            }
        }
 
        void JustSummoned(Creature* pSummon)
        {
            if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                pSummon->CastSpell(pTarget, DUNGEON_MODE(SPELL_STAMPEDE_DMG, H_SPELL_STAMPEDE_DMG),true);
        }

        void KilledUnit(Unit * victim)
        {
            if (victim == me)
                return;

            DoScriptText(RAND(SAY_SLAY_1,SAY_SLAY_2,SAY_SLAY_3), me);
        }
    };

};

class mob_rhino_spirit : public CreatureScript
{
public:
    mob_rhino_spirit() : CreatureScript("mob_rhino_spirit") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_rhino_spiritAI (pCreature);
    }

    struct mob_rhino_spiritAI : public ScriptedAI
    {
        mob_rhino_spiritAI(Creature *c) : ScriptedAI(c) {}

        uint32 uiDespawnTimer;

        void Reset()
        {
            uiDespawnTimer = 1500;
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
               return;

            if (uiDespawnTimer <= diff)
            {
                me->DisappearAndDie();
            } else uiDespawnTimer -= diff;
        }   
    };

};


void AddSC_boss_gal_darah()
{
    new boss_gal_darah();
    new mob_rhino_spirit();
}
