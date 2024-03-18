local Discordia = require('discordia')
local Discordia_slash = require('discordia-slash')
local fs = require('fs')

local Client = Discordia.Client():useApplicationCommands()

-- Configs

local parseEnv = require('utils.parseEnv')
local Config = parseEnv('config.env')
local commands = require('./packages/astrid_commands@0.0.1').commands

-- First impressions

local function loadCommands()
    -- Command handler
    for fileName, fileType in fs.scandirSync('./commands') do

        local command = require('./commands/' .. fileName)

        local commandConfigs = command:getSlash()
        assert(Client:createGlobalApplicationCommand(commandConfigs), 'Could not load this command')
    end

    print('Commands loaded.')
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
    print('Ready!')
end


-- Require the command using its name and call it as a function using the metamethod __call

local function commandsCallback(interaction, command, args)
    assert(commands[command.name], 'Didnt find this command')
    commands[command.name](interaction, args)
end

-- Client configs

Client:on('slashCommand', commandsCallback)
Client:on('ready', Logged)
Client:run(Config.TOKEN)
Client:setActivity('Learning!')