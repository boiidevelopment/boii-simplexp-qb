----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Chat suggestions 
CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/editxp', 'edit a players xp!', {
        { name="id", help="Players ID!" },
        { name="choice", help="1 = Add XP, 2 = Remove XP!" },
        { name="meta", help="Meta data name of experience to edit!" },
        { name="amount", help="Amount of XP to add/remove!" }
    })
    TriggerEvent('chat:addSuggestion', '/checkxp', 'edit a players xp!', {
        { name="id", help="Players ID!" },
        { name="meta", help="Meta data name of experience to check!" },
    })
end)

-- Add xp function
function XP(args, metadata, amount)
    TriggerServerEvent('boii-simplexp:sv:XP', args, metadata, amount)
end

-- Event trigger 
RegisterNetEvent('boii-simplexp:cl:XP', function(args, metadata, amount)
    TriggerServerEvent('boii-simplexp:sv:XP', args, metadata, amount)
end)

exports('XP', XP)