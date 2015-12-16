local kurock_player_mt = require('player.kurock.kurock_player_mt')

local function create(o)
	setmetatable(o, kurock_player_mt)
	o:loop('idledown')
	return o
end

return {
	create = create
}

