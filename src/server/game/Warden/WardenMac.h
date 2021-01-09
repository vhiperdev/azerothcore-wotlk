/*
 * Copyright (C) 2016+     AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-GPL2
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef _WARDEN_MAC_H
#define _WARDEN_MAC_H

#include "Cryptography/ARC4.h"
#include <map>
#include "Cryptography/BigNumber.h"
#include "ByteBuffer.h"
#include "Warden.h"

class WorldSession;
class Warden;

class WardenMac : public Warden
{
public:
    WardenMac();
    ~WardenMac() override;

    void Init(WorldSession* session, BigNumber* k) override;
    ClientWardenModule* GetModuleForClient() override;
    void InitializeModule() override;
    void RequestHash() override;
    void HandleHashResult(ByteBuffer& buff) override;
    void RequestData() override;
    void HandleData(ByteBuffer& buff) override;
};

#endif
