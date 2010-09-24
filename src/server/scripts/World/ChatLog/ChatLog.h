/*
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * Copyright (C) 2008-2010 Trinity <http://www.trinitycore.org/>
 *
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

#ifndef TRINITYCORE_CHATLOG_H
#define TRINITYCORE_CHATLOG_H

#include "ScriptPCH.h"
#include "ChatLexicsCutter.h"

enum ChatLogType
{
    CHAT_LOG_NONE,
    CHAT_LOG_CHAT,
    CHAT_LOG_PARTY,
    CHAT_LOG_GUILD,
    CHAT_LOG_WHISPER,
    CHAT_LOG_CHANNEL,
    CHAT_LOG_RAID,
    CHAT_LOG_BATTLEGROUND,

    CHAT_LOG_COUNT,
    CHAT_LOG_INNORMATIVE
};

enum LexicsActions
{
    LEXICS_ACTION_LOG,
    LEXICS_ACTION_SHEEP,
    LEXICS_ACTION_STUN,
    LEXICS_ACTION_DIE,
    LEXICS_ACTION_DRAIN,
    LEXICS_ACTION_SILENCE,
    LEXICS_ACTION_STUCK,
    LEXICS_ACTION_SICKNESS,
    LEXICS_ACTION_SHEAR,
};

struct ChatLogInfo
{
    FILE *file;
    std::string name;
    bool screenFlag;
    bool cutFlag;
    ChatLogType type;

    ChatLogInfo() : name(""), file(NULL), screenFlag(false), cutFlag(false), type(CHAT_LOG_NONE) { }

    void Init(ChatLogType type, bool bChat, bool bLexics);
    void OpenFile(bool bDateSplit, std::string sDate, bool bUTFHeader);
    void CloseFile()
    {
        if (file)
        {
            fclose(file);
            file = NULL;
        }
    }
    void WriteFile(const std::string& msg);
};

class ChatLog : public PlayerScript
{
public:
    ChatLog();
    ~ChatLog();
    static std::string GetChatNameByType(ChatLogType type);
    static std::string GetChatDescByType(ChatLogType type);
    static void OutTimestamp(FILE *file);

    void OnChat(Player* player, uint32 type, uint32 lang, std::string msg);
    void OnChat(Player *player, uint32 type, uint32 lang, std::string msg, Player *receiver);
    void OnChat(Player *player, uint32 type, uint32 lang, std::string msg, Group *group);
    void OnChat(Player *player, uint32 type, uint32 lang, std::string msg, Guild *guild);
    void OnChat(Player *player, uint32 type, uint32 lang, std::string msg, Channel *channel);

private:
    bool _ChatCommon(ChatLogType type, Player *player, std::string &msg);
    void _Punish(Player* player, std::string& msg);
    void _ApplySpell(Player *player, uint32 spellId);

    void _Initialize();
    void _OpenAllFiles();
    void _CloseAllFiles();
    void _CheckDateSwitch();
    void _AppendPlayerName(Player* player, std::string& s);
    void _AppendGroupMembers(Group* group, std::string& s);
    void _WriteLog(ChatLogInfo log, std::string& logStr, const std::string& msg, const std::string& origMsg);

    // Chats
    bool m_bChatLogEnable;
    bool m_bChatLogDateSplit;
    bool m_bChatLogUTFHeader;
    bool m_bChatLogIgnoreUnprintable;

    int32 m_nLastDay;

    ChatLogInfo m_logs[CHAT_LOG_COUNT];

    // Lexics
    LexicsCutter* m_pLexics;

    bool m_bLexicsEnable;
    bool m_bLexicsInnormativeCut;
    bool m_bLexicsIgnoreGM;

    std::string m_sLexicsCutReplacement;
    LexicsActions m_LexicsAction;
    uint32 m_unLexicsActionDuration;

    ChatLogInfo m_innormative;
};

#define sChatLog (*ACE_Singleton<ChatLog, ACE_Thread_Mutex>::instance())
#endif
