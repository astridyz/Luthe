local Discordia_slash = require('discordia-slash')
local Tools = Discordia_slash.util.tools()

local Command = require('astrid-commands')

-- Private

local function getAllCommands()
    local description = ''

    for _, command in pairs(Command.commands) do
        description = description .. '**' .. command.name .. ':** ' .. command.description .. '\n'
    end

    return description
end

--- @param args table 'args.command' is the tools.string argument
--
local function Reply(interaction, args)
    if args then
        local command = Command.commands[args.command]
        if command then
            interaction:reply { -- If there's a command with this name
                embed = {
                    author = { name = args.command:gsub("^%l", string.upper) },
                    description = '**Name:** ' .. command.name .. '\n**Description:** ' .. command.description,
                    color = 0x874F9F
                }
            }
        else -- If there's *not* a command with this name
            interaction:reply('There is no command called ' .. args.command)
        end
    else -- if the command wasnt executed using an argument
	interaction:reply {
        embed = {
            author = {
                name = 'Help Command 🤓',
            },
            description = getAllCommands(),
            color = 0x874F9F
        }
    }
    end
end

-- Public

local Help = Command('help', 'This is a help command.')

Help:addSlashOption(
    Tools.string('command', 'what command do you need help with?')
)
Help:setCallback(Reply)

return Help