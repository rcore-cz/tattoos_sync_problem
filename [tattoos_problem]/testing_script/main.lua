TATTOOS = {
    {
        collection = 'mpbeach_overlays',
        name = "MP_Bea_M_RArm_000" -- Should have a sync problem for second char (won't see it)
    },
    {
        collection = 'rc_overlays_test3',
        name = "test3_2_M" -- flame tattoo
    },
    {
        collection = 'rc_overlays_test2',
        name = "test2_10_M" -- chicken tattoo
    },
}

RegisterCommand('tat_clear', function()
    local ped = PlayerPedId()
    ClearPedDecorations(ped)
    print("Tattoos cleared.")
end, false)

-- command that removes all tattoos from player and applies all tattoos from the defined list
RegisterCommand('tat_apply', function(source, args)
    local ped = PlayerPedId()
    ClearPedDecorations(ped)
    for _, t in pairs(TATTOOS) do
        AddPedDecorationFromHashes(ped, GetHashKey(t.collection), GetHashKey(t.name))
    end
    print("Tattoos reapplied.")
end, false)

-- command that should leave player only with underwear (if not, change IDs in Config.NakedPartsIds) 
RegisterCommand('tat_naked', function(source, args)
    local ped = PlayerPedId()
    local character = {}

    for k, v in pairs(Config.NakedPartsIds) do
        character[k] = v
    end

    SetPedComponentVariation(ped, 8, character['tshirt_1'], character['tshirt_2'], 2)
    SetPedComponentVariation(ped, 11, character['torso_1'], character['torso_2'], 2)
    SetPedComponentVariation(ped, 3, character['arms'], 0, 2)
    SetPedComponentVariation(ped, 4, character['pants_1'], character['pants_2'], 2)
    SetPedComponentVariation(ped, 6, character['shoes_1'], character['shoes_2'], 2)

    SetPedComponentVariation(ped, 10, character['decals_1'], character['decals_2'], 2)
    SetPedComponentVariation(ped, 1, character['mask_1'], character['mask_2'], 2)
    SetPedComponentVariation(ped, 9, character['bproof_1'], character['bproof_2'], 2)
    SetPedComponentVariation(ped, 7, character['chain_1'], character['chain_2'], 2)
    SetPedComponentVariation(ped, 5, character['bags_1'], character['bags_2'], 2)
    
    if character['ears_1'] == -1 then
        ClearPedProp(ped, 2)
    else
        SetPedPropIndex(ped, 2, character['ears_1'], character['ears_2'], 2) -- Ears Accessories
    end

    if character['helmet_1'] == -1 then
        ClearPedProp(ped, 0)
    else
        SetPedPropIndex(ped, 0, character['helmet_1'], character['helmet_2'], 2) -- Helmet
    end

    SetPedPropIndex(ped, 1, character['glasses_1'], character['glasses_2'], 2) -- Glasses
    print("Character should now be in underwear.")
end, false)

-- This command manually requests the ytd for the faulty tattoo
RegisterCommand('tat_request', function(source, args)
    local name = 'mp_bea_tat_m_009' -- the tribal tattoo ytd
    print('Is ' .. name .. ' streamed: ' .. tostring(HasStreamedTextureDictLoaded(name)))
    RequestStreamedTextureDict(name)

    while not HasStreamedTextureDictLoaded(name) do
        RequestStreamedTextureDict(name)
        print('Requesting: ' .. name)
        Wait(300)
    end
    print(name .. ' loaded sucessfully')
end, false)

-- Restarts second addon pack
RegisterCommand('tat_restart', function(source, args)
    ExecuteCommand('ensure addon_tattoos_test2')
end, false)
