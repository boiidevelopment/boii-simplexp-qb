----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Add or remove xp event to trigger from client
RegisterServerEvent('boii-simplexp:sv:XP', function(args, metadata, amount)
    local pData = Core.Functions.GetPlayer(source)
    local currentxp = pData.PlayerData.metadata[metadata]
    local args = tonumber(args)
    if args == 1 then
        pData.Functions.SetMetaData(metadata, (currentxp+amount))
    elseif args == 2 then
	if currentxp < 1 then
	    amount = 0		
            pData.Functions.SetMetaData(metadata, (currentxp-amount))
	end			
    end
end)

-- Edit xp; can only be used by ace allowed
RegisterCommand('editxp', function(source, args, rawCommand)
    local id = tonumber(args[1])
    local choice = tonumber(args[2])
    local metadata = args[3]
    local amount = tonumber(args[4])
    local pData = Core.Functions.GetPlayer(id)
    local currentxp = pData.PlayerData.metadata[metadata]
    local name = GetPlayerName(id)
    if not IsPlayerAceAllowed(source, 'boii.simplexp') then 
        TriggerClientEvent('chatMessage', source, "You do not have permission to use this command!")
        return
    end
    if id == nil then
        TriggerClientEvent('chatMessage', source, "Invalid command usage!") 
        return 
    end
    if choice == nil then
        TriggerClientEvent('chatMessage', source, "Invalid command usage!") 
        return 
    end
    if choice > 2 then
        TriggerClientEvent('chatMessage', source, "Invalid command usage!") 
        return 
    end
    if metadata == nil then
        TriggerClientEvent('chatMessage', source, "Invalid command usage!") 
        return 
    end
    if amount == nil then
        TriggerClientEvent('chatMessage', source, "Invalid command usage!") 
        return 
    end
    if choice == 1 then
        pData.Functions.SetMetaData(metadata, (currentxp + amount))
        TriggerClientEvent('chatMessage', source, "You have added "..amount.." "..metadata.." to "..name.."") 
        return
    end
    if choice == 2 then
        pData.Functions.SetMetaData(metadata, (currentxp - amount))
        TriggerClientEvent('chatMessage', source, "You have removed "..amount.." "..metadata.." from "..name.."") 
        return
    end
end)

-- Check xp; can be used by all
RegisterCommand('checkxp', function(source, args, rawCommand)
    local id = tonumber(args[1])
    local metadata = args[2]
    local amount = tonumber(args[3])
    local pData = Core.Functions.GetPlayer(id)
    local currentxp = pData.PlayerData.metadata[metadata]
    local name = GetPlayerName(id)
    if id == nil then
        TriggerClientEvent('chatMessage', source, "Invalid command usage!") 
        return 
    end
    if metadata == nil then
        TriggerClientEvent('chatMessage', source, "Invalid command usage!") 
        return 
    end
    if metadata then
        TriggerClientEvent('chatMessage', source, "Current "..metadata.." xp for "..name.." = "..currentxp.."") 
        return
    end
end)
