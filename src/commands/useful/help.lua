local Discordia_slash = require('discordia-slash')
local Tools = Discordia_slash.util.tools()

local Command = require('astrid-commands')

--// Private

local function getAllCommands()
    local description = ''

    for _, command in pairs(Command.commands) do
        description = description .. '**' .. command:getName() .. ':** ' .. command:getDescription() .. '\n'
    end

    return description
end

--- @param args any 'args.command' is the tools.string argument
--
local function Reply(interaction, args)
    if args == nil then
        interaction:reply{
            embed = {
                author = { name = 'Help Command 🤓' },
                description = getAllCommands(),
                color = 0x874F9F
            }
        }
        
        return
    end

    local command = Command.get(args.command)

    if not command then
        interaction:reply('There is no command called ' .. args.command)
    end

    interaction:reply { --// If there's a command with this name
        embed = {
            author = { name = args.command:gsub("^%l", string.upper) },
            description = '**Name:** ' .. command:getName() .. '\n**Description:** ' .. command:getDescription(),
            color = 0x874F9F
        }
    }
end

--// Public

local Help = Command('help', 'This is a help command.')

Help:addSlashOption(
    Tools.string('command', 'what command do you need help with?')
)

Help:setCallback(Reply)

return Help