local Discordia_slash = require('discordia-slash')
local Contructors = Discordia_slash.util.tools()

-- Private

local function reply(_, interaction, args)
    interaction:reply('Testing!')
end

local Meta = {__call = reply, __metatable = 'locked'}
local Ping = setmetatable({}, Meta)

-- Public

function Ping.getConfigs()
    return Contructors.slashCommand('ping', 'This command reply something to test!')
end

return Ping