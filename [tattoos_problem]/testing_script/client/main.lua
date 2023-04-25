TATTOOS = {
    {
        collection = 'mpbeach_overlays',
        name = "MP_Bea_M_RArm_000" -- Should be invisible for second char
    },
    {
        collection = 'rcore_overlays_test3',
        name = "test3_2_M" -- flame
    },
    {
        collection = 'rcore_overlays_test2',
        name = "test2_10_M" -- chicken
    },
}

RegisterCommand('tat_apply', function(source, args)
    local ped = PlayerPedId()
    ClearPedDecorations(ped)
    for _, t in pairs(TATTOOS) do
        AddPedDecorationFromHashes(ped, GetHashKey(t.collection), GetHashKey(t.name))
    end
    print("Tattoos reapplied.")
end)

RegisterCommand('tat_naked', function(source, args)
    local ped = PlayerPedId()
    local character = {}

    for k, v in pairs(Config.NakedPartsIds) do
        character[k] = v
    end

    if character['ears_1'] == -1 then
        ClearPedProp(ped, 2)
    else
        SetPedPropIndex(ped, 2, character['ears_1'], character['ears_2'], 2) -- Ears Accessories
    end

    SetPedComponentVariation(ped, 8, character['tshirt_1'], character['tshirt_2'], 2)  -- Tshirt
    SetPedComponentVariation(ped, 11, character['torso_1'], character['torso_2'], 2)   -- torso parts
    SetPedComponentVariation(ped, 3, character['arms'], 0, 2)                          -- torso
    SetPedComponentVariation(ped, 10, character['decals_1'], character['decals_2'], 2) -- decals
    SetPedComponentVariation(ped, 4, character['pants_1'], character['pants_2'], 2)    -- pants
    SetPedComponentVariation(ped, 6, character['shoes_1'], character['shoes_2'], 2)    -- shoes
    SetPedComponentVariation(ped, 1, character['mask_1'], character['mask_2'], 2)      -- mask
    SetPedComponentVariation(ped, 9, character['bproof_1'], character['bproof_2'], 2)  -- bulletproof
    SetPedComponentVariation(ped, 7, character['chain_1'], character['chain_2'], 2)    -- chain
    SetPedComponentVariation(ped, 5, character['bags_1'], character['bags_2'], 2)      -- Bag

    if character['helmet_1'] == -1 then
        ClearPedProp(ped, 0)
    else
        SetPedPropIndex(ped, 0, character['helmet_1'], character['helmet_2'], 2) -- Helmet
    end

    SetPedPropIndex(ped, 1, character['glasses_1'], character['glasses_2'], 2) -- Glasses
    print("Character should now be in underwear.")
end)

RegisterCommand('tat_request', function(source, args)
    local name = 'mp_bea_tat_m_009'
    print('Is ' .. name .. ' streamed: ' .. tostring(HasStreamedTextureDictLoaded(name)))
    RequestStreamedTextureDict(name)

    while not HasStreamedTextureDictLoaded(name) do
        RequestStreamedTextureDict(name)
        print('Requesting: ' .. name)
        Wait(300)
    end
    print(name .. ' loaded sucessfully')
end)

RegisterCommand('tat_restart', function(source, args)
    ExecuteCommand('ensure rcore_addon_tattoos_test2')
end)
