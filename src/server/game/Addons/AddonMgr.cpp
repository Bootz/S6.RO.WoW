/*
 * Copyright (C) 2008-2010 Trinity <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
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

#include "DatabaseEnv.h"
#include "AddonMgr.h"
#include "ObjectAccessor.h"
#include "Player.h"
#include "Util.h"
#include "SHA1.h"
#include "ProgressBar.h"

AddonMgr::AddonMgr()
{
}

AddonMgr::~AddonMgr()
{
}

void AddonMgr::LoadFromDB()
{
    QueryResult result = CharacterDatabase.Query("SELECT name, crc FROM addons");
    if (!result)
    {
        sLog.outErrorDb("The table `addons` is empty");
        return;
    }

    barGoLink bar(result->GetRowCount());
    uint32 count = 0;
    Field *fields;

    do
    {
        fields = result->Fetch();
        bar.step();
        count++;

        std::string name = fields[0].GetString();
        uint32 crc = fields[1].GetUInt32();

        SavedAddon addon(name, crc);
        m_knownAddons.push_back(addon);
    } while (result->NextRow());

    sLog.outString();
    sLog.outString(">> Loaded %u known addons", count);
}

void AddonMgr::SaveAddon(AddonInfo const& addon)
{
    std::string name = addon.Name;
    CharacterDatabase.escape_string(name);
    CharacterDatabase.PExecute("INSERT INTO addons (name, crc) VALUES ('%s', %u)", name.c_str(), addon.CRC);

    SavedAddon newAddon(addon.Name, addon.CRC);
    m_knownAddons.push_back(newAddon);
}

SavedAddon const* AddonMgr::GetAddonInfo(const std::string& name) const
{
    for (SavedAddonsList::const_iterator it = m_knownAddons.begin(); it != m_knownAddons.end(); ++it)
    {
        SavedAddon const& addon = (*it);
        if (addon.Name == name)
            return &addon;
    }

    return NULL;
}
