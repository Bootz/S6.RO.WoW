/*
 * Copyright (C) 2009-2010 TrinityCore <http://www.trinitycore.org/>
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
#include "trial_of_the_crusader.h"

enum DeathKnightSpells
{
        SPELL_FROST_STRIKE          = 67937,
    SPELL_CHAINS_OF_ICE         = 66020,
    SPELL_DEATH_COIL            = 67930,
    SPELL_ICEBOUND_FORTITUDE    = 66023,
    SPELL_STRANGULATE           = 66018,
    SPELL_DEATH_GRIP            = 68755,
};

enum WarriorSpells
{
        SPELL_MORTAL_STRIKE                     = 68783,
    SPELL_MORTAL_STRIKE_H               = 68784,
    SPELL_BLADESTORM                    = 63784,
    SPELL_INTERCEPT                             = 67540,
    SPELL_ROLLING_THROW                 = 67546,
};

enum MageSpells
{
        SPELL_FIREBALL                          = 66042,
    SPELL_FIREBALL_H                    = 68310,
    SPELL_BLAST_WAVE                    = 66044,
    SPELL_BLAST_WAVE_H                  = 68312,
    SPELL_HASTE                                 = 66045,
        SPELL_POLYMORPH                         = 66043,
    SPELL_POLYMORPH_H                   = 68311,
};

enum HealShamanenSpells
{
        SPELL_CHAIN_LIGHTNING           = 67529,
    SPELL_CHAIN_LIGHTNING_H         = 68319,
    SPELL_EARTH_SHIELD              = 67530,
    SPELL_HEALING_WAVE              = 67528,
    SPELL_HEALING_WAVE_H            = 68318,
    SPELL_HEX_OF_MENDING            = 67534,
};

enum HunterSpells
{
        SPELL_DISENGAGE                 = 68340,
    SPELL_LIGHTNING_ARROWS          = 66083,
    SPELL_MULTI_SHOT                = 66081,
    SPELL_SHOOT                     = 66079,
};

enum RogueSpells
{
        //SPELL_EVISCERATE                              = 7709,
    SPELL_EVISCERATE_H                          = 68317,
        SPELL_FAN_OF_KNIVES                             = 67706,
        SPELL_POISON_BOTTLE                             = 67701,
};

enum RetroPaladinSpells
{
        SPELL_AVENGING_WRATH                    = 66011,
        SPELL_CRUSUADER_STRIKE                  = 66003,
        SPELL_DIVINE_SHIELD                             = 66010,
        SPELL_DIVINE_STORM                              = 66006,
        SPELL_HUMMER_OF_JUSTICE                 = 66007,
        SPELL_HAND_OF_PROTECTION                = 66009,
        SPELL_JUNDGEMENT_OF_COMMAND             = 68019,
        SPELL_REPENTANCE                                = 66008,
        SPELL_SEAL_OF_COMMAND                   = 68021,
};

enum HolyPaladinSpells
{
        SPELL_CLEANCE                = 68623,
    SPELL_FLASH_OF_LIGHT         = 68010,
    SPELL_HAND_OF_FREEDOM        = 68758,
    SPELL_HOLY_LIGHT             = 68012,
    SPELL_HOLY_SHOCK             = 68016,
};

enum BalanceDruidSpells
{
        SPELL_BARKSKIN              = 65860,
    SPELL_CYCLONE               = 65859,
    SPELL_ENTANGLING_ROOTS      = 65857,
        SPELL_FAERIE_FIRE           = 65863,
        SPELL_FORCE_OF_NATURE       = 65861,
        SPELL_INSECT_SWARM          = 67943,
        SPELL_MOONFIRE              = 67946,
        SPELL_STARFIRE              = 67949,
        SPELL_WRATH                 = 67952,
};

enum RestorDruidSpells
{
        SPELL_LIFEBLOOM             = 67959,
    SPELL_NATURE_GRASP          = 66071,
    SPELL_NOURISH               = 67967,
    SPELL_REGROWTH              = 67970,
    SPELL_REJUVENATION          = 67973,
    SPELL_THORNS                = 66068,
    SPELL_TRANQUILITY           = 67976,
};

enum RestorShamanenSpells
{
        SPELL_CLEANSE_SPIRIT            = 68629,
    SPELL_EARTH_SHIRLD                  = 66063,
    SPELL_EARTH_SHOCK                   = 68102,
    SPELL_HEROISM                               = 65983,
    SPELL_HEX                                   = 66054,
    SPELL_LESSER_HEALING_WAVE   = 68116,
    SPELL_RIPTIDE                               = 68120,
};

enum DisziPriestSpells
{
        SPELL_DISPELL_MAGIC                     = 68626,
    SPELL_FLASH_HEAL                    = 68024,
    SPELL_MANA_BURN                             = 68028,
    SPELL_PENANCE                               = 68030,
    SPELL_POWER_WORLD_SHIELD    = 68034,
    SPELL_RSYCHIC_SCREAM                = 65543,
    SPELL_RENEW                                 = 68037,
};

enum ShadowPriestSpells
{
        SPELL_DISPERSION                        = 65544,
    SPELL_MIND_BLAST                    = 68040,
    SPELL_MIND_FLAY                             = 68044,
    SPELL_PSYCHIC_HORROR                = 65545,
    SPELL_SHADOW_WORLD_PAIN             = 68089,
    SPELL_SILENCE                               = 65542,
    SPELL_VAMPIRIC_TOUCH                = 68092,
};

enum WarlockSpells
{
        SPELL_CORRUPTION                        = 68135,
        SPELL_CURSE_OF_AGONY            = 68138,
        SPELL_CURSE_OF_EXHAUSTION       = 65815,
        SPELL_DEATH_COIL_W          = 68139,
        SPELL_FEAR                                      = 65809,
        SPELL_HELLFIRE                          = 68147,
        SPELL_SEARING_PAIN                      = 68150,
        SPELL_SHADOW_BOLT                       = 68152,
        SPELL_UNSTABLE_AFFLICTION       = 68155
};

enum HardmodeSpells
{
        SPELL_PVP_TRINKET                       = 65547,
};


/********************************/
/* Tyrius Duskblade - 34461     */
/* Death Knight                 */
/********************************/
class boss_tyrius_duskblade : public CreatureScript
{
public:
    boss_tyrius_duskblade() : CreatureScript("boss_tyrius_duskblade") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_tyrius_duskbladeAI(pCreature);
    }

    struct boss_tyrius_duskbladeAI : public ScriptedAI
    {
        boss_tyrius_duskbladeAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};

/********************************/
/* Kavina Grovesong - 34460     */
/* Druid                        */
/********************************/
class boss_kavina_grovesong : public CreatureScript
{
public:
    boss_kavina_grovesong() : CreatureScript("boss_kavina_grovesong") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_kavina_grovesongAI(pCreature);
    }

    struct boss_kavina_grovesongAI : public ScriptedAI
    {
        boss_kavina_grovesongAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};
/********************************/
/* Melador Valestrider - 34469  */
/* Druid                        */
/********************************/
class boss_melador_valestrider : public CreatureScript
{
public:
    boss_melador_valestrider() : CreatureScript("boss_melador_valestrider") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_melador_valestriderAI(pCreature);
    }

    struct boss_melador_valestriderAI : public ScriptedAI
    {
        boss_melador_valestriderAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};
/********************************/
/* Alyssia Moonstalker - 34467  */
/* Hunter                       */
/********************************/
class boss_alyssia_moonstalker : public CreatureScript
{
public:
    boss_alyssia_moonstalker() : CreatureScript("boss_alyssia_moonstalker") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_alyssia_moonstalkerAI(pCreature);
    }

    struct boss_alyssia_moonstalkerAI : public ScriptedAI
    {
        boss_alyssia_moonstalkerAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

                    if(m_pInstance)
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};
/********************************/
/* Noozle Whizzlestick - 34468  */
/* Mage                         */
/********************************/
class boss_noozle_whizzlestick : public CreatureScript
{
public:
    boss_noozle_whizzlestick() : CreatureScript("boss_noozle_whizzlestick") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_noozle_whizzlestickAI(pCreature);
    }

    struct boss_noozle_whizzlestickAI : public ScriptedAI
    {
        boss_noozle_whizzlestickAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};
/********************************/
/* Velanaa - 34465              */
/* Paladin                      */
/********************************/
class boss_velanaa : public CreatureScript
{
public:
    boss_velanaa() : CreatureScript("boss_velanaa") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_velanaaAI(pCreature);
    }

    struct boss_velanaaAI : public ScriptedAI
    {
        boss_velanaaAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};
/********************************/
/* Baelnor Lightbearer - 34471  */
/* Paladin                      */
/********************************/
class boss_baelnor_lightbearer : public CreatureScript
{
public:
    boss_baelnor_lightbearer() : CreatureScript("boss_baelnor_lightbearer") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_baelnor_lightbearerAI(pCreature);
    }

    struct boss_baelnor_lightbearerAI : public ScriptedAI
    {
        boss_baelnor_lightbearerAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};
/********************************/
/* Anthar Forgemender - 34466   */
/* Priest                       */
/********************************/
class boss_anthar_forgemender : public CreatureScript
{
public:
    boss_anthar_forgemender() : CreatureScript("boss_anthar_forgemender") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_anthar_forgemenderAI(pCreature);
    }

    struct boss_anthar_forgemenderAI : public ScriptedAI
    {
        boss_anthar_forgemenderAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};
/********************************/
/* Brienna Nightfell - 34473    */
/* Priest                       */
/********************************/
class boss_brienna_nightfell : public CreatureScript
{
public:
    boss_brienna_nightfell() : CreatureScript("boss_brienna_nightfell") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_brienna_nightfellAI(pCreature);
    }

    struct boss_brienna_nightfellAI : public ScriptedAI
    {
        boss_brienna_nightfellAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};
/********************************/
/* Irieth Shadowstep - 34472    */
/* Rogue                        */
/********************************/
class boss_irieth_shadowstepe : public CreatureScript
{
public:
    boss_irieth_shadowstepe() : CreatureScript("boss_irieth_shadowstepe") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_irieth_shadowstepeAI(pCreature);
    }

    struct boss_irieth_shadowstepeAI : public ScriptedAI
    {
        boss_irieth_shadowstepeAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};
/********************************/
/* Shaabad - 34463              */
/* Shaman                       */
/********************************/
class boss_shaabad : public CreatureScript
{
public:
    boss_shaabad() : CreatureScript("boss_shaabad") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_shaabadAI(pCreature);
    }

    struct boss_shaabadAI : public ScriptedAI
    {
        boss_shaabadAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};
/********************************/
/* Saamul - 34470               */
/* Shaman                       */
/********************************/
class boss_saamul : public CreatureScript
{
public:
    boss_saamul() : CreatureScript("boss_saamul") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_saamulAI(pCreature);
    }

    struct boss_saamulAI : public ScriptedAI
    {
        boss_saamulAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};
/********************************/
/* Serissa Grimdabbler - 34474  */
/* Warlock                      */
/********************************/
class boss_serissa_grimdabbler : public CreatureScript
{
public:
    boss_serissa_grimdabbler() : CreatureScript("boss_serissa_grimdabbler") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_serissa_grimdabblerAI(pCreature);
    }

    struct boss_serissa_grimdabblerAI : public ScriptedAI
    {
        boss_serissa_grimdabblerAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};
/********************************/
/* Shocuul - 34475              */
/* Warrior                      */
/********************************/
class boss_shocuul : public CreatureScript
{
public:
    boss_shocuul() : CreatureScript("boss_shocuul") { }

    CreatureAI* GetAI(Creature* pCreature)
    {
        return new boss_shocuulAI(pCreature);
    }

    struct boss_shocuulAI : public ScriptedAI
    {
        boss_shocuulAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                    Reset();
                    m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
            }

            ScriptedInstance* m_pInstance;
        bool m_bIsRegularMode;

        void Reset()
        {
        }

            void KilledUnit(Unit* who)
            {
                    if(!m_pInstance)
                            return;

    /*      if(m_pInstance->OnRaidWipe())
                    {
                            uint32 count = m_pInstance->GetData(DATA_UPDATE_STATE_UI_COUNT);
                            count--;
                            m_pInstance->SetData(DATA_UPDATE_STATE_UI_COUNT, count);
                    }*/
            }

            void Aggro(Unit* pWho)
        {
        }

            void JustDied(Unit* pKiller)
        {
                    if(!m_pInstance)
                            return;

            if(!me->FindNearestCreature(34461, 200, true)
                    && !me->FindNearestCreature(34460, 200, true)
                    && !me->FindNearestCreature(34469, 200, true)
                    && !me->FindNearestCreature(34467, 200, true)
                    && !me->FindNearestCreature(34468, 200, true)
                    && !me->FindNearestCreature(34465, 200, true)
                    && !me->FindNearestCreature(34471, 200, true)
                    && !me->FindNearestCreature(34466, 200, true)
                    && !me->FindNearestCreature(34473, 200, true)
                    && !me->FindNearestCreature(34472, 200, true)
                    && !me->FindNearestCreature(34463, 200, true)
                    && !me->FindNearestCreature(34470, 200, true)
                    && !me->FindNearestCreature(34474, 200, true)
                    && !me->FindNearestCreature(34475, 200, true))
                    {
                    m_pInstance->SetData(PHASE_5, DONE);
                    }
            }

            void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

                    DoMeleeAttackIfReady();
            }
    };

};















void AddSC_boss_tc_alliance_champions()
{
    new boss_tyrius_duskblade();
    new boss_kavina_grovesong();
    new boss_melador_valestrider();
    new boss_alyssia_moonstalker();
    new boss_noozle_whizzlestick();
    new boss_velanaa();
    new boss_baelnor_lightbearer();
    new boss_anthar_forgemender();
    new boss_brienna_nightfell();
    new boss_irieth_shadowstepe();
    new boss_shaabad();
    new boss_saamul();
    new boss_serissa_grimdabbler();
    new boss_shocuul();
}
