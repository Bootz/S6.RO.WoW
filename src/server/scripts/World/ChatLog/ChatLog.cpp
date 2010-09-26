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

#include "Common.h"
#include "ChatLexicsCutter.h"
#include "ChatLog.h"
#include "Chat.h"
#include "Group.h"
#include "Guild.h"
#include "Channel.h"
#include "ObjectMgr.h"
#include "SpellAuras.h"
#include "Config.h"

void ChatLogInfo::Init(ChatLogType type, bool bChat, bool bLexics)
{
    this->type = type;
    std::string sType = ChatLog::GetChatNameByType(type);
    if (bChat)
    {
        name = sConfig.GetStringDefault(std::string("ChatLog." + sType + ".File").c_str(), "");
        screenFlag = sConfig.GetBoolDefault(std::string("ChatLog." + sType + ".Screen").c_str(), false);
    }

    if (bLexics)
        cutFlag = sConfig.GetBoolDefault(std::string("ChatLog.Lexics." + sType + ".Cut").c_str(), true);
}

void ChatLogInfo::OpenFile(bool bDateSplit, std::string sDate, bool bUTFHeader)
{
    if (!name.empty() && !file)
    {
        std::string tmp = name;
        if (bDateSplit)
        {
            // append date instead of $d if applicable
            int dpos = tmp.find("$d");
            if (dpos != tmp.npos)
                tmp.replace(dpos, 2, sDate.c_str(), sDate.size());
        }
        file = fopen(tmp.c_str(), "a+b");
        if (file)
        {
            if (bUTFHeader && (ftell(file) == 0))
                fputs("\xEF\xBB\xBF", file);

            std::string s("[SYSTEM] " + ChatLog::GetChatDescByType(type) + " Log Initialized\n");
            WriteFile(s);
        }
    }
}

void ChatLogInfo::WriteFile(const std::string& msg)
{
    if (file)
    {
        ChatLog::OutTimestamp(file);
        fprintf(file, "%s\n", msg.c_str());
        fflush(file);
    }
}

std::string ChatLog::GetChatNameByType(ChatLogType type)
{
    switch (type)
    {
        case CHAT_LOG_CHAT: return "Chat";
        case CHAT_LOG_PARTY: return "Party";
        case CHAT_LOG_GUILD: return "Guild";
        case CHAT_LOG_WHISPER: return "Whisper";
        case CHAT_LOG_CHANNEL: return "Channel";
        case CHAT_LOG_RAID: return "Raid";
        case CHAT_LOG_BATTLEGROUND: return "BattleGround";
        case CHAT_LOG_INNORMATIVE: return "Lexics.Innormative";
        default: return "Unknown";
    }
}

std::string ChatLog::GetChatDescByType(ChatLogType type)
{
    switch (type)
    {
        case CHAT_LOG_CHAT: return "Chat";
        case CHAT_LOG_PARTY: return "Party Chat";
        case CHAT_LOG_GUILD: return "Guild Chat";
        case CHAT_LOG_WHISPER: return "Whisper";
        case CHAT_LOG_CHANNEL: return "Channels";
        case CHAT_LOG_RAID: return "Raid Chat";
        case CHAT_LOG_BATTLEGROUND: return "Battleground Chat";
        case CHAT_LOG_INNORMATIVE: return "Lexics Innormative";
        default: return "Unknown";
    }
}

void ChatLog::OutTimestamp(FILE* file)
{
    time_t t = time(NULL);
    tm* aTm = localtime(&t);
    fprintf(file, "%-4d-%02d-%02d %02d:%02d:%02d ", aTm->tm_year + 1900, aTm->tm_mon + 1, aTm->tm_mday, aTm->tm_hour, aTm->tm_min, aTm->tm_sec);
}

ChatLog::ChatLog() : PlayerScript("LexicsChatLog"), m_pLexics(NULL)
{
    _Initialize();
}

ChatLog::~ChatLog()
{
    // close all files (avoiding double-close)
    _CloseAllFiles();

    if (m_pLexics)
    {
        delete m_pLexics;
        m_pLexics = NULL;
    }
}

void ChatLog::_Initialize()
{
    // determine, if the chat logs are enabled
    m_bChatLogEnable = sConfig.GetBoolDefault("ChatLog.Enable", true);
    m_bChatLogDateSplit = sConfig.GetBoolDefault("ChatLog.DateSplit", true);
    m_bChatLogUTFHeader = sConfig.GetBoolDefault("ChatLog.UTFHeader", true);
    m_bChatLogIgnoreUnprintable = sConfig.GetBoolDefault("ChatLog.Ignore.Unprintable", true);

    // lexics cutter
    m_bLexicsEnable = sConfig.GetBoolDefault("ChatLog.Lexics.Enable", true);

    for (uint32 i = CHAT_LOG_CHAT; i < CHAT_LOG_COUNT; i++)
        m_logs[i].Init(ChatLogType(i), m_bChatLogEnable, m_bLexicsEnable);

    if (m_bLexicsEnable)
    {
        // initialize lexics cutter parameters
        m_bLexicsInnormativeCut = sConfig.GetBoolDefault("ChatLog.Lexics.Cut.Enable", true);
        m_sLexicsCutReplacement = sConfig.GetStringDefault("ChatLog.Lexics.Cut.Replacement", "&!@^%!^&*!!!");
        m_LexicsAction = LexicsActions(sConfig.GetIntDefault("ChatLog.Lexics.Action", LEXICS_ACTION_LOG));
        m_unLexicsActionDuration = sConfig.GetIntDefault("ChatLog.Lexics.Action.Duration", 0);

        std::string sAnalogsFile = sConfig.GetStringDefault("ChatLog.Lexics.AnalogsFile", "");
        std::string sWordsFile = sConfig.GetStringDefault("ChatLog.Lexics.WordsFile", "");

        m_innormative.Init(CHAT_LOG_INNORMATIVE, true, false);
        if (sAnalogsFile.empty() || sWordsFile.empty())
            m_bLexicsEnable = false;
        else
        {
            // initialize lexics cutter
            m_pLexics = new LexicsCutter();
            if (m_pLexics) 
            {
                if (m_pLexics->ReadInnormativeWords(sWordsFile))
                    sLog.outError("CHAT LOG: Unable to open file with innormative words '%s'", sWordsFile);
                if (m_pLexics->ReadLetterAnalogs(sAnalogsFile))
                    sLog.outError("CHAT LOG: Unable to open file with letter analogs '%s'", sAnalogsFile);
                m_pLexics->MapInnormativeWords();
            }

            // read additional parameters
            m_bLexicsIgnoreGM = sConfig.GetBoolDefault("ChatLog.Lexics.Ignore.GM", true);
            m_pLexics->m_bIgnoreLetterRepeat = sConfig.GetBoolDefault("ChatLog.Lexics.Ignore.Repeats", true);
            m_pLexics->m_bIgnoreMiddleSpaces = sConfig.GetBoolDefault("ChatLog.Lexics.Ignore.Spaces", true);
        }
    }

    // open all files (with aliasing)
    _OpenAllFiles();
}

void ChatLog::_OpenAllFiles()
{
    std::string sDate;
    if (m_bChatLogDateSplit)
    {
        time_t t = time(NULL);
        tm* aTm = localtime(&t);
        char szDate[12];
        sprintf(szDate, "%-4d-%02d-%02d", aTm->tm_year + 1900, aTm->tm_mon + 1, aTm->tm_mday);
        sDate = szDate;

        m_nLastDay = aTm->tm_mday;
    }

    if (m_bChatLogEnable)
    {
        for (uint32 i = CHAT_LOG_CHAT; i <= CHAT_LOG_COUNT - 1; ++i)
        {
            for (uint32 j = i - 1; j >= CHAT_LOG_CHAT; --j)
            {
                if (m_logs[i].name == m_logs[j].name)
                {
                    m_logs[i].file = m_logs[j].file;
                    break;
                }
            }
            m_logs[i].OpenFile(m_bChatLogDateSplit, sDate, m_bChatLogUTFHeader);
        }
    }

    // initialize innormative log
    if (m_bLexicsEnable)
        m_innormative.OpenFile(m_bChatLogDateSplit, sDate, m_bChatLogUTFHeader);
}

void ChatLog::_CloseAllFiles()
{
    for (uint32 i = CHAT_LOG_CHAT; i <= CHAT_LOG_COUNT - 1; ++i)
    {
        if (m_logs[i].file)
        {
            for (uint32 j = i + 1; j <= CHAT_LOG_COUNT - 1; ++j)
                if (m_logs[i].file == m_logs[j].file)
                    m_logs[j].file = NULL;
            m_logs[i].CloseFile();
        }
    }

    m_innormative.CloseFile();
}

void ChatLog::_CheckDateSwitch()
{
    if (m_bChatLogDateSplit)
    {
        time_t t = time(NULL);
        tm* aTm = localtime(&t);
        if (m_nLastDay != aTm->tm_mday)
        {
            // date switched
            _CloseAllFiles();
            _OpenAllFiles();
        }
    }
}

bool ChatLog::_ChatCommon(ChatLogType type, Player *player, std::string &msg)
{
    if (m_bLexicsEnable && m_pLexics && m_logs[type].cutFlag && m_pLexics->CheckLexics(msg)) 
        _Punish(player, msg);

    if (!m_bChatLogEnable)
        return false;

    if (m_bChatLogIgnoreUnprintable)
    {
        // have to ignore unprintables, verify string by UTF8 here
        unsigned int pos = 0;
        std::string lchar;
        while (LexicsCutter::ReadUTF8(msg, lchar, pos))
            if (lchar.size() == 1)
                if (lchar[0] < ' ')
                    return false ; // unprintable detected
    }

    return true;
}

void ChatLog::_Punish(Player* player, std::string& msg)
{
    // logging
    std::string logStr = "";

    _AppendPlayerName(player, logStr);
    _WriteLog(m_innormative, logStr, msg, msg);

    // cutting innormative lexics
    if (m_bLexicsInnormativeCut)
        msg = m_sLexicsCutReplacement;

    if (!player || !player->GetSession())
        return;

    if (m_bLexicsIgnoreGM && (player->GetSession()->GetSecurity() > SEC_PLAYER))
        return;

    // special action
    switch (m_LexicsAction)
    {
        case LEXICS_ACTION_SHEEP:       _ApplySpell(player, 118);   break;
        case LEXICS_ACTION_STUN:        _ApplySpell(player, 13005); break;
        case LEXICS_ACTION_STUCK:       _ApplySpell(player, 23312); break;
        case LEXICS_ACTION_SICKNESS:    _ApplySpell(player, 15007); break;
        case LEXICS_ACTION_SHEAR:       _ApplySpell(player, 41032); break;

        case LEXICS_ACTION_DIE:
            // oops, kicked the bucket
            player->DealDamage(player, player->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            break;
        case LEXICS_ACTION_DRAIN:
            // living corpse :)
            player->DealDamage(player, player->GetHealth() - 5, NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            break;
        case LEXICS_ACTION_SILENCE:
            player->GetSession()->m_muteTime = time(NULL) + int64(m_unLexicsActionDuration / 1000);
            break;
        default:
            // no action except logging
            break;
    }
}

inline void ChatLog::_ApplySpell(Player *pPlayer, uint32 spellId)
{
    if (Aura *a = pPlayer->AddAura(spellId, pPlayer))
        a->SetDuration(m_unLexicsActionDuration);
}

inline void ChatLog::_WriteLog(ChatLogInfo log, std::string& logStr, const std::string& msg, const std::string& origMsg)
{
    if (log.screenFlag)
        printf("%s %s", logStr.c_str(), msg.c_str());

    _CheckDateSwitch();
    logStr.append(" ").append(origMsg);
    log.WriteFile(logStr);
}

inline void ChatLog::_AppendPlayerName(Player* player, std::string& s)
{
    s.append("[").append(player ? player->GetName() : "???").append("]");
}

inline void ChatLog::_AppendGroupMembers(Group* group, std::string& s)
{
    if (!group)
        s.append(" {unknown group}:");
    else
    {
        char sz[32];
        sprintf(sz, UI64FMTD, group->GetGUID());
        s.append(" {").append(sz).append("} [");
        uint64 leaderGUID = group->GetLeaderGUID();
        if (Player* pLeader = sObjectMgr.GetPlayer(leaderGUID))
            s.append(pLeader->GetName());

        Group::MemberSlotList members = group->GetMemberSlots();
        for (Group::member_citerator itr = members.begin(); itr != members.end(); ++itr)
        {
            if (itr->guid == leaderGUID)
                continue;

            if (Player* pMember = sObjectMgr.GetPlayer(itr->guid))
                s.append(",").append(pMember->GetName());
        }
        s.append("]:");
    }
}

void ChatLog::OnChat(Player* player, uint32 type, uint32 /*lang*/, std::string msg)
{
    std::string origMsg = msg;
    if (!_ChatCommon(CHAT_LOG_CHAT, player, msg))
        return;

    std::string logStr = "";
    switch (type)
    {
        case CHAT_MSG_SAY:
            logStr.append("{SAY}");
            break;
        case CHAT_MSG_EMOTE:
            logStr.append("{EMOTE}");
            break;
        case CHAT_MSG_YELL:
            logStr.append("{YELL}");
            break;
    }
    _AppendPlayerName(player, logStr);
    _WriteLog(m_logs[CHAT_LOG_CHAT], logStr, msg, origMsg);
}

void ChatLog::OnChat(Player *player, uint32 /*type*/, uint32 /*lang*/, std::string msg, Player *receiver)
{
    std::string origMsg = msg;
    if (!_ChatCommon(CHAT_LOG_WHISPER, player, msg))
        return;

    std::string logStr = "";
    _AppendPlayerName(player, logStr);
    logStr.append("->");
    _AppendPlayerName(receiver, logStr);

    _WriteLog(m_logs[CHAT_LOG_WHISPER], logStr, msg, origMsg);
}

void ChatLog::OnChat(Player *player, uint32 type, uint32 /*lang*/, std::string msg, Group *group)
{
    std::string origMsg = msg;
    std::string logStr = "";
    _AppendPlayerName(player, logStr);

    switch (type)
    {
    case CHAT_MSG_PARTY:
    case CHAT_MSG_PARTY_LEADER:
        if (!_ChatCommon(CHAT_LOG_PARTY, player, msg))
            return;

        switch (type)
        {
            case CHAT_MSG_PARTY:        logStr.append("->PARTY");         break;
            case CHAT_MSG_PARTY_LEADER: logStr.append("->PARTY_LEADER");  break;
        }
        _AppendGroupMembers(group, logStr);

        _WriteLog(m_logs[CHAT_LOG_PARTY], logStr, msg, origMsg);
        break;
    case CHAT_MSG_RAID_LEADER:
    case CHAT_MSG_RAID_WARNING:
    case CHAT_MSG_RAID:
        if (!_ChatCommon(CHAT_LOG_RAID, player, msg))
            return;
        switch (type)
        {
            case CHAT_MSG_RAID_LEADER:  logStr.append("->RAID_LEADER");
            case CHAT_MSG_RAID_WARNING: logStr.append("->RAID_WARN");
            case CHAT_MSG_RAID:         logStr.append("->RAID");
        }
        _AppendGroupMembers(group, logStr);
        _WriteLog(m_logs[CHAT_LOG_RAID], logStr, msg, origMsg);
        break;
    case CHAT_MSG_BATTLEGROUND:
    case CHAT_MSG_BATTLEGROUND_LEADER:
        if (!_ChatCommon(CHAT_LOG_BATTLEGROUND, player, msg))
            return;
        switch (type)
        {
            case CHAT_MSG_BATTLEGROUND:         logStr.append("->BG");         break;
            case CHAT_MSG_BATTLEGROUND_LEADER:  logStr.append("->BG_LEADER");  break;
        }
        _AppendGroupMembers(group, logStr);
        _WriteLog(m_logs[CHAT_LOG_BATTLEGROUND], logStr, msg, origMsg);
        break;
    }
}

void ChatLog::OnChat(Player *player, uint32 type, uint32 lang, std::string msg, Guild *guild)
{
    std::string origMsg = msg;
    if (!_ChatCommon(CHAT_LOG_GUILD, player, msg))
        return;

    std::string logStr = "";
    _AppendPlayerName(player, logStr);
    switch (type)
    {
        case CHAT_MSG_GUILD:    logStr.append("->GUILD");      break;
        case CHAT_MSG_OFFICER:  logStr.append("->GUILD_OFF");  break;
    }
    if (!guild)
        logStr.append(" {unknowng guild}:");
    else
        logStr.append(" (").append(guild->GetName()).append("):");

    _WriteLog(m_logs[CHAT_LOG_GUILD], logStr, msg, origMsg);
}

void ChatLog::OnChat(Player *player, uint32 /*type*/, uint32 /*lang*/, std::string msg, Channel *channel)
{
    std::string origMsg = msg;
    if (!_ChatCommon(CHAT_LOG_CHANNEL, player, msg))
        return;

    std::string logStr = "";
    _AppendPlayerName(player, logStr);

    if (!channel)
        logStr.append(" {unknown channel}");
    else
        logStr.append(" [").append(channel->GetName()).append("]");

    _WriteLog(m_logs[CHAT_LOG_CHANNEL], logStr, msg, origMsg);
}

void AddSC_lexics_chat_log()
{
    new ChatLog();
}
