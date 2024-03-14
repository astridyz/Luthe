local Discordia_slash = require('discordia-slash')
local Contructors = Discordia_slash.util.tools()

local Ping = {}

function Ping.getConfigs()
    local pingCommand = Contructors.slashCommand('ping', 'This command reply something to test!')
    return pingCommand
end

function Ping:reply(interaction, args)
    interaction:reply('Testing!')
end

return Ping