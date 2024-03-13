local Discordia_slash = require('discordia-slash')
local Contructors = Discordia_slash.utils.tools()

local Ping = {}

function Ping.getConfigs()

    local pingCommand = Contructors.slashCommand('ping', 'This command reply something to test!')

    local function Reply(interaction, args)
        interaction:reply('Testing!')
    end

    pingCommand:callback(Reply) --// When interaction is made this function is called
    return pingCommand
end

return Ping