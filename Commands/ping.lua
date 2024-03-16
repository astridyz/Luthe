local Command = require('../packages/astrid_commands@0.0.1')
local Discordia_slash = require('discordia-slash')

-- Private

local function Reply(_, interaction, args)
    print(_, interaction, args)
    interaction:reply('Testing!')
end

-- Public

local Ping = Command('Ping', 'Useful for tests I think')
Ping:setCallback(Reply)
Ping:setCategory('Useful')

return Ping