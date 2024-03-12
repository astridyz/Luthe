local Discordia = require('discordia')
local Enum = Discordia.enums

local Client = Discordia.Client()

-- Getting configs
local parseEnv = require('Utils.parseEnv')
local Config = parseEnv:read('config.env')

-- First impressions

local function Logged()
    print('Connected as ' .. Client.user.username)
end

-- Client configs

Client:on('ready', Logged)
Client:run(Config.TOKEN)
Client:setActivity('Learning!')