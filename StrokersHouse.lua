StrokersHouse = {
    name = "StrokersHouse",
    version = "1.2",
}

local function onAddOnLoaded(event, addonName)
    if addonName ~= StrokersHouse.name then return end

    SLASH_COMMANDS["/stroker"] = StrokersHouse.PortToHouse

    EVENT_MANAGER:UnregisterForEvent(StrokersHouse.name, EVENT_ADD_ON_LOADED)
    EVENT_MANAGER:RegisterForEvent(StrokersHouse.name, EVENT_PLAYER_ACTIVATED, StrokersHouse.OnPlayerActivated)
end


function StrokersHouse.PortToHouse()
    local houseId = 90

    if GetDisplayName() == ("@Longstriker") then
        d("Porting to your house!")
        RequestJumpToHouse(houseId, false)
    else
        d("Porting to @Longstriker's house!")
        JumpToSpecificHouse("@Longstriker", houseId, false)
    end
end

EVENT_MANAGER:RegisterForEvent(StrokersHouse.name, EVENT_ADD_ON_LOADED, onAddOnLoaded)
