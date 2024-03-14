local Discordia = require('discordia')
local Discordia_slash = require('discordia-slash')

local Client = Discordia.Client():useApplicationCommands()
local Constructors = Discordia_slash.util.tools()

-- Getting configs

local parseEnv = require('Utils.parseEnv')
local Config = parseEnv:read('config.env')

local commands = {
    ping = require('./commands/ping.lua')
}

-- First impressions

local function loadCommands()

    for _, command in pairs(commands) do
        local commandConfig = command.getConfigs()
        Client:createGlobalApplicationCommand(commandConfig)
    end
    
    print('Commands loaded')
end

-- We need to delete all the previous registered commands and register the new ones
local function deletePreviousCommands()
    local Commands = Client:getGlobalApplicationCommands()
    for CommandId in pairs(Commands) do
        Client:deleteGlobalApplicationCommand(CommandId)
    end

    print('Deleted all old commands.')
end

local function Logged()
    print('Connected as ' .. Client.user.username)

    deletePreviousCommands()
    loadCommands()
    Client:info('Ready!')
end

local function commandsCallback(interaction, command, args)
    commands[command.name]:reply(interaction, args)
end

-- Client configs

Client:on('slashCommand', commandsCallback)
Client:on('ready', Logged)
Client:run(Config.TOKEN)
Client:setActivity('Learning!')