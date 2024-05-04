local Discordia_slash = require('discordia-slash')
local Tools = Discordia_slash.util.tools()

local Command = require('astrid-commands')

--// Private

--- @param args table 'args.who' is the tools.user argument
--
local function Reply(interaction, args)
	if args == nil then 
		interaction:reply('Hmm.. were you going to say something, weren\'t you?')
		return
	end

	interaction:reply('Excuse me, ' .. args.who.name .. '! Could you move out, please?')
end

--// Public

local Test = Command('excuse', 'This is a test command.')
Test:setCallback(Reply)

--[=[
	* Test:setCategory('useful')
	* ^^^^^^^^^^^^^^^^^^^^^^^^^^
	* I'm doing this on my command handler
]=]

Test:addSlashOption(
	Tools.user('who', 'Sir or maam to excuse.')
)

Test:setPermissions('banMembers', 'manageGuild') --// Check enum.permissions for options

return Test