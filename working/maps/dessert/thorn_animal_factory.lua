local textures        = require('res.textures')
local anim_mt         = require('util.anim_mt')
local thorn_animal_mt = require('maps/dessert/thorn_animal_mt')

local function create(o)
	setmetatable(o, thorn_animal_mt)
	o:loop('idledown')
	return o
end

return {
	create = create
}

