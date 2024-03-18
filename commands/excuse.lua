local Discordia = require('discordia')
local Discordia_slash = require('discordia-slash')

local tools = Discordia_slash.util.tools()
local Command = require('../packages/astrid_commands@0.0.1')

-- Private

--- @param args table (who = member)
--
local function Reply(interaction, args)
	interaction:reply('Excuse me, ' .. args.who.name .. '! Can you move out?')
end

-- Public

local Test = Command('excuse', 'This is a test command.')
Test:setCallback(Reply)
Test:setCategory('useful')
Test:addSlashOption(tools.user('who', 'Sir or maam to excuse.'))
Test:setPermissions('banMembers', 'manageGuild')

return Test