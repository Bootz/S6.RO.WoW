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

enum TeleportSpells
{
    HAMMER        = 70781,
    ORATORY       = 70856,
    RAMPART       = 70857,
    SAURFANG      = 70858,
    UPPER_SPIRE   = 70859,
    PLAGUEWORKS   = 9995,
    CRIMSONHALL   = 9996,
    FWHALLS       = 9997,
    QUEEN         = 70861,
    LICHKING      = 70860
};

class go_icecrown_teleporter : public GameObjectScript
{
    public:
        go_icecrown_teleporter() : GameObjectScript("go_icecrown_teleporter") { }

        bool OnGossipHello(Player *pPlayer, GameObject *pGO)
        {
            InstanceScript* pInstance = pGO->GetInstanceScript();
            if(!pInstance) return true;

            if(pInstance)
            {
                if (pInstance->GetData(DATA_MARROWGAR_EVENT) == DONE || pPlayer->isGameMaster())
                {
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport to Light's Hammer.", GOSSIP_SENDER_MAIN, HAMMER);
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport to the Oratory of the Damned.", GOSSIP_SENDER_MAIN, ORATORY);
                }
                if (pInstance->GetData(DATA_DEATHWHISPER_EVENT) == DONE || pPlayer->isGameMaster())
                  /*  pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport to the Rampart of Skulls.", GOSSIP_SENDER_MAIN, RAMPART);
                if (pInstance->GetData(DATA_GUNSHIP_BATTLE_EVENT) == DONE || pPlayer->isGameMaster())*/
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport to the Deathbringer's Rise.", GOSSIP_SENDER_MAIN, SAURFANG);
                if (pInstance->GetData(DATA_SAURFANG_EVENT) == DONE || pPlayer->isGameMaster())
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport to the Upper Spire.", GOSSIP_SENDER_MAIN, UPPER_SPIRE);
                if (pInstance->GetData(DATA_PROFESSOR_PUTRICIDE_EVENT) == DONE || pPlayer->isGameMaster())
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport to the Plagueworks.", GOSSIP_SENDER_MAIN, PLAGUEWORKS);
                if (pInstance->GetData(DATA_BLOOD_QUEEN_LANATHEL_EVENT) == DONE || pPlayer->isGameMaster())
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport to the Crimson Halls.", GOSSIP_SENDER_MAIN, CRIMSONHALL);
                if (pInstance->GetData(DATA_VALITHRIA_DREAMWALKER_EVENT) == DONE || pPlayer->isGameMaster())
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport to the Sindragosa's Lair.", GOSSIP_SENDER_MAIN, QUEEN);
                if (pInstance->GetData(DATA_SINDRAGOSA_EVENT) == DONE || pPlayer->isGameMaster())
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport to the Frostwing Halls.", GOSSIP_SENDER_MAIN, FWHALLS);
            }

            pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, pGO->GetGUID());
            return true;
        }

        bool OnGossipSelect(Player* pPlayer, GameObject* /*pGO*/, uint32 /*uiSender*/, uint32 uiAction)
        {
            if(!pPlayer->getAttackers().empty())
                return true;

            pPlayer->PlayerTalkClass->ClearMenus();
            switch(uiAction)
            {
                case HAMMER:
                    pPlayer->TeleportTo(631, -17.192f, 2211.440f, 30.1158f, 3.121f);
                    pPlayer->CLOSE_GOSSIP_MENU();
                    break;
                case ORATORY:
                    pPlayer->TeleportTo(631, -503.620f, 2211.470f, 62.8235f, 3.139f);
                    pPlayer->CLOSE_GOSSIP_MENU();
                    break;
                case RAMPART:
                    pPlayer->TeleportTo(631, -615.145f, 2211.470f, 199.972f, 6.268f);
                    pPlayer->CLOSE_GOSSIP_MENU();
                    break;
                case SAURFANG:
                    pPlayer->TeleportTo(631, -549.131f, 2211.290f, 539.291f, 6.275f);
                    pPlayer->CLOSE_GOSSIP_MENU();
                    break;
                case UPPER_SPIRE:
                    pPlayer->TeleportTo(631, 4199.407f, 2769.478f, 351.064f, 6.258f);
                    pPlayer->CLOSE_GOSSIP_MENU();
                    break;
                case PLAGUEWORKS:
                    pPlayer->TeleportTo(631, 4356.988f, 2867.540f, 349.332f, 1.558f);
                    pPlayer->CLOSE_GOSSIP_MENU();
                    break;
                case CRIMSONHALL:
                    pPlayer->TeleportTo(631, 4452.847f, 2769.345f, 349.348f, 6.234f);
                    pPlayer->CLOSE_GOSSIP_MENU();
                    break;
                case QUEEN:
                    pPlayer->TeleportTo(631, 4357.002f, 2674.207f, 349.342f, 4.683f);
                    pPlayer->CLOSE_GOSSIP_MENU();
                    break;
                case FWHALLS:
                    pPlayer->TeleportTo(631, 4356.580f, 2565.750f, 220.40f, 4.886f);
                    pPlayer->CLOSE_GOSSIP_MENU();
                    break;
            }

            return true;
            }
        };

void AddSC_icecrown_citadel()
{
    new go_icecrown_teleporter;
}
