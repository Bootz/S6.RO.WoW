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

/* ScriptData
SDName: Sholazar_Basin
SD%Complete: 100
SDComment: Quest support: 11253, 11241.
SDCategory: howling_fjord
EndScriptData */

/* ContentData
npc_plaguehound_tracker
npc_apothecary_hanes
EndContentData */

#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"

/*######
## npc_apothecary_hanes
######*/
enum Entries
{
    NPC_APOTHECARY_HANES         = 23784,
    FACTION_ESCORTEE_A           = 774,
    FACTION_ESCORTEE_H           = 775,
    NPC_HANES_FIRE_TRIGGER       = 23968,
    QUEST_TRAIL_OF_FIRE          = 11241,
    SPELL_COSMETIC_LOW_POLY_FIRE = 56274
};

class npc_apothecary_hanes : public CreatureScript
{
public:
    npc_apothecary_hanes() : CreatureScript("npc_apothecary_hanes") { }

    bool OnQuestAccept(Player* pPlayer, Creature* pCreature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_TRAIL_OF_FIRE)
        {
            switch (pPlayer->GetTeam())
            {
                case ALLIANCE:
                    pCreature->setFaction(FACTION_ESCORTEE_A);
                    break;
                case HORDE:
                    pCreature->setFaction(FACTION_ESCORTEE_H);
                    break;
            }
            CAST_AI(npc_escortAI, (pCreature->AI()))->Start(true, false, pPlayer->GetGUID());
        }
        return true;
    }

    struct npc_Apothecary_HanesAI : public npc_escortAI
    {
        npc_Apothecary_HanesAI(Creature* pCreature) : npc_escortAI(pCreature){}

        uint32 PotTimer;

        void Reset ()
        {
            SetDespawnAtFar(false);
            PotTimer = 10000; //10 sec cooldown on potion
        }

        void JustDied(Unit* /*killer*/)
        {
            if (Player* pPlayer = GetPlayerForEscort())
                pPlayer->FailQuest(QUEST_TRAIL_OF_FIRE);
        }

        void UpdateEscortAI(const uint32 diff)
        {
            if (HealthBelowPct(75))
            {
                if (PotTimer <= diff)
                {
                    DoCast(me, 17534, true);
                    PotTimer = 10000;
                } else PotTimer -= diff;
                PotTimer -= diff;
            }
            if (GetAttack() && UpdateVictim())
                DoMeleeAttackIfReady();
        }

        void WaypointReached(uint32 i)
        {
            Player* pPlayer = GetPlayerForEscort();
            if (!pPlayer)
                return;
            switch(i)
            {
                case 1:
                    me->SetReactState(REACT_AGGRESSIVE);
                    SetRun(true);
                    break;
                case 23:
                    if (pPlayer)
                        pPlayer->GroupEventHappens(QUEST_TRAIL_OF_FIRE, me);
                    me->ForcedDespawn();
                    break;
                case 5:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER,10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(false);
                    break;
                case 6:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER,10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(true);
                    break;
                case 8:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER,10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(false);
                    break;
                case 9:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER,10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    break;
                case 10:
                    SetRun(true);
                    break;
                case 13:
                    SetRun(false);
                    break;
                case 14:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER,10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(true);
                    break;
            }
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_Apothecary_HanesAI(creature);
    }
};

/*######
## npc_plaguehound_tracker
######*/

enum ePlaguehound
{
    QUEST_SNIFF_OUT_ENEMY        = 11253
};

class npc_plaguehound_tracker : public CreatureScript
{
public:
    npc_plaguehound_tracker() : CreatureScript("npc_plaguehound_tracker") { }

    struct npc_plaguehound_trackerAI : public npc_escortAI
    {
        npc_plaguehound_trackerAI(Creature* pCreature) : npc_escortAI(pCreature) { }

        void Reset()
        {
            InitScriptData();
        }

        void InitScriptData()
        {
            Player* pPlayer = NULL;
            if (me->isSummon())
                if (Unit* summoner = CAST_SUM(me)->GetSummoner())
                    if (summoner->GetTypeId() == TYPEID_PLAYER)
                        pPlayer = CAST_PLR(summoner);

            if (!pPlayer)
                return;

            me->SetUnitMovementFlags(MOVEMENTFLAG_WALKING);
            Start(false, false, pPlayer->GetGUID());
        }

        void WaypointReached(uint32 i)
        {
            Player* pPlayer = NULL;
            if (me->isSummon())
                if (Unit* summoner = CAST_SUM(me)->GetSummoner())
                    if (summoner->GetTypeId() == TYPEID_PLAYER)
                        pPlayer = CAST_PLR(summoner);

            if (!pPlayer)
                return;

            switch(i)
            {
            case 26:
                me->ForcedDespawn();
                break;
            }
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_plaguehound_trackerAI(creature);
    }
};

/*######
## npc_razael_and_lyana
######*/

#define GOSSIP_RAZAEL_REPORT "High Executor Anselm wants a report on the situation."
#define GOSSIP_LYANA_REPORT "High Executor Anselm requests your report."

enum eRazael
{
    QUEST_REPORTS_FROM_THE_FIELD = 11221,
    NPC_RAZAEL = 23998,
    NPC_LYANA = 23778,
    GOSSIP_TEXTID_RAZAEL1 = 11562,
    GOSSIP_TEXTID_RAZAEL2 = 11564,
    GOSSIP_TEXTID_LYANA1 = 11586,
    GOSSIP_TEXTID_LYANA2 = 11588
};

class npc_razael_and_lyana : public CreatureScript
{
public:
    npc_razael_and_lyana() : CreatureScript("npc_razael_and_lyana") { }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pCreature->isQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        if (pPlayer->GetQuestStatus(QUEST_REPORTS_FROM_THE_FIELD) == QUEST_STATUS_INCOMPLETE)
    {
            switch (pCreature->GetEntry())
            {
                case NPC_RAZAEL:
                    if (!pPlayer->GetReqKillOrCastCurrentCount(QUEST_REPORTS_FROM_THE_FIELD, NPC_RAZAEL))
                    {
                        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_RAZAEL_REPORT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_RAZAEL1, pCreature->GetGUID());
                        return true;
                    }
                break;
                case NPC_LYANA:
                    if (!pPlayer->GetReqKillOrCastCurrentCount(QUEST_REPORTS_FROM_THE_FIELD, NPC_LYANA))
                    {
                        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LYANA_REPORT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_LYANA1, pCreature->GetGUID());
                        return true;
                    }
                break;
            }
    }
        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        switch (uiAction)
        {
            case GOSSIP_ACTION_INFO_DEF + 1:
                pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_RAZAEL2, pCreature->GetGUID());
                pPlayer->TalkedToCreature(NPC_RAZAEL, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF + 2:
                pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_LYANA2, pCreature->GetGUID());
                pPlayer->TalkedToCreature(NPC_LYANA, pCreature->GetGUID());
                break;
        }
        return true;
    }
};

/*######
## npc_mcgoyver
######*/

#define GOSSIP_ITEM_MG_I  "Walt sent me to pick up some dark iron ingots."
#define GOSSIP_ITEM_MG_II "Yarp."

enum eMcGoyver
{
    QUEST_WE_CAN_REBUILD_IT             = 11483,

    SPELL_CREATURE_DARK_IRON_INGOTS     = 44512,
    SPELL_TAXI_EXPLORERS_LEAGUE         = 44280,

    GOSSIP_TEXTID_MCGOYVER              = 12193
};

class npc_mcgoyver : public CreatureScript
{
public:
    npc_mcgoyver() : CreatureScript("npc_mcgoyver") { }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pPlayer->GetQuestStatus(QUEST_WE_CAN_REBUILD_IT) == QUEST_STATUS_INCOMPLETE)
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_MG_I, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        switch(uiAction)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_MG_II, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
                pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_MCGOYVER, pCreature->GetGUID());
                pPlayer->CastSpell(pPlayer, SPELL_CREATURE_DARK_IRON_INGOTS, true);
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                pPlayer->CastSpell(pPlayer, SPELL_TAXI_EXPLORERS_LEAGUE, true);
                pPlayer->CLOSE_GOSSIP_MENU();
                break;
        }
        return true;
    }

};

/*######
 ## mob_plague_dragonflayer
 ######*/

#define SPELL_PLAGUE_SPRAY                  43381
#define ENTRY_SPRAYED_TARGET_CREDIT         24281

class mob_plague_dragonflayer : public CreatureScript
{
public:
    mob_plague_dragonflayer() : CreatureScript("mob_plague_dragonflayer") { }

    struct mob_plague_dragonflayerAI: public ScriptedAI
    {
        mob_plague_dragonflayerAI(Creature *c) : ScriptedAI(c) {}

        bool isPlagued;
        uint32 check_Timer;

        void Reset() 
        {
            isPlagued = false;
            check_Timer = 5000;
        }

        void SpellHit(Unit* caster, const SpellEntry* spell)
        {
            if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
                return;

            if (isPlagued)
                return;

            if (spell->Id == SPELL_PLAGUE_SPRAY)
            {
                isPlagued = true;
                caster->ToPlayer()->KilledMonsterCredit(ENTRY_SPRAYED_TARGET_CREDIT, me->GetGUID());
                Creature *target = me->FindNearestCreature(RAND(23564, 24198, 24199), 50, true);
                if (target)
                    me->Attack(target, true);
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (check_Timer <= diff) 
            {
                if (!me->HasAuraEffect(SPELL_PLAGUE_SPRAY, 0))
                    isPlagued = false;
                check_Timer = 5000;

            } else
                check_Timer -= diff;

            DoMeleeAttackIfReady();
        }

        void EnterCombat(Unit *who) {}
    };

    CreatureAI* GetAI(Creature *_Creature) const
    {
        return new mob_plague_dragonflayerAI(_Creature);
    }

};

/*######
 ## npc_bjorn_halgurdsson
 ######*/

#define SPELL_CRUSH_ARMOR                   33661
#define SPELL_MORTAL_STRIKE                 32736
#define ENTRY_BJORN_KILL_CREDIT             24275

class npc_bjorn_halgurdsson : public CreatureScript
{
public:
    npc_bjorn_halgurdsson() : CreatureScript("npc_bjorn_halgurdsson") { }

    struct npc_bjorn_halgurdssonAI: public ScriptedAI
    {
        npc_bjorn_halgurdssonAI(Creature *c) : ScriptedAI(c) {}

        uint32 crush_Timer;
        uint32 strike_Timer;

        void Reset()
        {
            me->SetReactState(REACT_DEFENSIVE);

            strike_Timer = 15000;
            crush_Timer = 11000;
        }

        void EnterCombat(Unit *who) {}
        void SpellHit(Unit *caster, const SpellEntry *spell)
        {
            if (spell->Id == 43315)
                me->SetReactState(REACT_AGGRESSIVE);
        }
        void DamageTaken(Unit *attacker, uint32 &damage)
        {
            if (damage >= me->GetHealth()) 
            {
                std::list<HostileReference*>& threatList = me->getThreatManager().getThreatList();
                for (std::list<HostileReference*>::iterator i = threatList.begin(); i != threatList.end(); ++i)
                    if (Unit* Temp = Unit::GetUnit(*me,(*i)->getUnitGuid())) 
                    {
                        if (Temp->GetTypeId() == TYPEID_PLAYER)
                        {
                            Temp->ToPlayer()->KilledMonsterCredit(ENTRY_BJORN_KILL_CREDIT, me->GetGUID());
                        }
                    }
            }
        }

        void UpdateAI(const uint32 diff) 
        {
            if (!UpdateVictim())
                return;

            if (strike_Timer <= diff) 
            {
                DoCast(me->getVictim(), SPELL_MORTAL_STRIKE);
                strike_Timer = 10000 + rand() % 5000;
            } else
                strike_Timer -= diff;

            if (crush_Timer <= diff) 
            {
                DoCast(me->getVictim(), SPELL_CRUSH_ARMOR);
                crush_Timer = 10000 + rand() % 5000;
            } else
                crush_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature *_Creature) const
    {
        return new npc_bjorn_halgurdssonAI(_Creature);
    }

};

/*######
 ## mob_decomposing_ghoul
 ######*/

enum decomposing_ghoul
{
    QUEST_SHINING_LIGHT = 11288,
    SPELL_SHINING_LIGHT = 43202,
    SPELL_SHINING_LIGHT_HIT = 43203,
    SPELL_SELF_FEAR = 31365,
    FEAR_RESET_DIST = 50,
    FEAR_DISTANCE = 10
};

class mob_decomposing_ghoul : public CreatureScript
{
public:
    mob_decomposing_ghoul() : CreatureScript("mob_decomposing_ghoul") { }

    struct mob_decomposing_ghoulAI: public ScriptedAI
    {
        mob_decomposing_ghoulAI(Creature *c) : ScriptedAI(c) {}

        uint32 check_timer;
        bool Self_Feared;

        void Reset()
        {
            check_timer = 1000;
            Self_Feared = false;
            me->RemoveAura(SPELL_SELF_FEAR);
            me->CombatStop(true);
            me->SetReactState(REACT_AGGRESSIVE);
        }

        void EnterCombat(Unit *who) 
        {
        }

        void SpellHit(Unit *caster, const SpellEntry *spell)
        {
            if (spell->Id == SPELL_SHINING_LIGHT_HIT) 
            {
                DoCast(me, SPELL_SELF_FEAR);
                me->SetReactState(REACT_PASSIVE);
                Self_Feared = true;
                check_timer = 8000;
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (check_timer <= diff)
            {
                if (Self_Feared && me->getVictim() && !me->IsWithinDistInMap(me->getVictim(), me->GetAttackDistance(me->getVictim()), true))
                    EnterEvadeMode();

                check_timer = 1000;
            } else
                check_timer -= diff;

            if (me->getVictim() && ((me->getVictim()->ToPlayer() && !me->getVictim()->ToPlayer()->HasAura(SPELL_SHINING_LIGHT)) || me->getVictim()->ToCreature()))
                DoMeleeAttackIfReady();

            if (!UpdateVictim())
                return;
        }
    };

    CreatureAI* GetAI(Creature *_Creature) const
    {
        return new mob_decomposing_ghoulAI(_Creature);
    }

};

/*######
 ## npc_alliance_banner
 ######*/

enum alliance_banner
{
    ENTRY_WINTERSCORN_DEFENDER = 24015,
    DROP_IT_THEN_ROCK_IT = 11429,
    WINTERSCRON_DESPAWN_TIME = 60000,
    SPELL_BANNER_DEFENDED = 44124,
};

const Position WINTERSCORN_DEFENDER1 = { 1526.36f, -5305.72f, 198.158f, 3.592f };
const Position WINTERSCORN_DEFENDER2 = { 1508.58f, -5331.28f, 197.336f, 1.488f };
const Position WINTERSCORN_DEFENDER3 = { 1493.72f, -5316.14f, 195.236f, 0.392f };

class npc_alliance_banner : public CreatureScript
{
public:
    npc_alliance_banner() : CreatureScript("npc_alliance_banner") { }

    struct npc_alliance_bannerAI: public Scripted_NoMovementAI
    {
        npc_alliance_bannerAI(Creature *c) : Scripted_NoMovementAI(c)
        {
            part = 1;
            part_Timer = 5000;
        }

        uint32 part_Timer;
        uint32 part;

        void Reset() {
            me->SetReactState(REACT_PASSIVE);
        }

        void UpdateAI(const uint32 diff) 
        {
            if (part > 4 || me->isDead())
                return;

            if (part_Timer <= diff)
            {
                Unit* tmp;
                switch (part)
                {
                    case 1:
                        tmp = me->SummonCreature(ENTRY_WINTERSCORN_DEFENDER, WINTERSCORN_DEFENDER1, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, WINTERSCRON_DESPAWN_TIME);
                        if (tmp)
                            tmp->Attack(me, false);
                        break;
                    case 2:
                        tmp = me->SummonCreature(ENTRY_WINTERSCORN_DEFENDER, WINTERSCORN_DEFENDER2, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, WINTERSCRON_DESPAWN_TIME);
                        if (tmp)
                            tmp->Attack(me, false);
                        break;
                    case 3:
                        tmp = me->SummonCreature(ENTRY_WINTERSCORN_DEFENDER, WINTERSCORN_DEFENDER3, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, WINTERSCRON_DESPAWN_TIME);
                        if (tmp)
                            tmp->Attack(me, false);
                        break;
                    case 4:
                        Unit* owner = me->GetCharmerOrOwnerOrSelf();
                        if (owner && owner->GetTypeId() == TYPEID_PLAYER)
                        {
                            me->CastSpell(me, SPELL_BANNER_DEFENDED, true);
                        }
                        break;
                }

                part++;
                part_Timer = 55000;
            } else
                part_Timer -= diff;
        }
    };

    CreatureAI* GetAI(Creature *_Creature) const
    {
        return new npc_alliance_bannerAI(_Creature);
    }

};

void AddSC_howling_fjord()
{
    new npc_apothecary_hanes();
    new npc_plaguehound_tracker();
    new npc_razael_and_lyana();
    new npc_mcgoyver();
    new mob_plague_dragonflayer();
    new npc_bjorn_halgurdsson();
    new mob_decomposing_ghoul();
    new npc_alliance_banner();
 }
