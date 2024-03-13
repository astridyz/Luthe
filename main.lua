local Discordia = require('discordia')
local Discordia_slash = require('discordia-slash')

local Client = Discordia.Client():useApplicationCommands()
local Constructors = Discordia_slash.util.tools()

-- Getting configs

local parseEnv = require('Utils.parseEnv')
local Config = parseEnv:read('config.env')

-- First impressions

local function loadCommands()
    --// Command handler testing
    local commands = {
        require('Commands.ping')
    }
    --[[
    for _, command in ipairs(commands) do
        local commandConfig = command.getConfigs()
        Client:createGlobalApplicationCommand(commandConfig)
    end
    ]]
end

local function Logged()
    print('Connected as ' .. Client.user.username)
    loadCommands()

--[[
        local Commands = Client:getGlobalApplicationCommands()
    for CommandId in pairs(Commands) do
        Client:deleteGlobalApplicationCommand(CommandId)
    end
    
]]
    Client:info('Ready!')
end

--[[
Client:on('slashCommand', function(interaction, command, args)
    if command.name == 'name' then
        interaction:reply('testing!')
    end
end)
]]

-- Client configs

Client:on('ready', Logged)
Client:run(Config.TOKEN)
Client:setActivity('Learning!')