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

#ifndef TRINITY_CHATLEXICSCUTTER_H
#define TRINITY_CHATLEXICSCUTTER_H

typedef std::vector <std::string> LC_AnalogVector;
typedef std::map <std::string, LC_AnalogVector> LC_AnalogMap;
typedef std::set <std::string> LC_LetterSet;
typedef std::vector <LC_LetterSet> LC_WordVector;
typedef std::vector <LC_WordVector> LC_WordList;
typedef std::multimap <std::string, uint32> LC_WordMap;

static int trailingBytesForUTF8[256] = {
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2, 3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5
};

class LexicsCutter
{
    protected:
        LC_AnalogMap m_AnalogMap;
        LC_WordList m_WordList;
        LC_WordMap m_WordMap;

        std::string m_sInvalidChars;

    public:
        LexicsCutter();

        static bool ReadUTF8(std::string& in, std::string& out, unsigned int& pos);

        std::string trim(std::string& s, const std::string& drop = " ");
        bool ReadLetterAnalogs(std::string& fileName);
        bool ReadInnormativeWords(std::string& fileName);
        void MapInnormativeWords();
        bool CompareWord(std::string& str, unsigned int pos, LC_WordVector word);
        bool CheckLexics(std::string& phrase);

        std::vector <std::pair <uint32, uint32> > m_Found;
        bool m_bIgnoreMiddleSpaces;
        bool m_bIgnoreLetterRepeat;
};

#endif

