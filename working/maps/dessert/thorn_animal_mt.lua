local textures  = require('res.textures')
local anim_mt   = require('util.anim_mt')

local thorn_animal_mt = {}
thorn_animal_mt.__index = thorn_animal_mt
setmetatable(thorn_animal_mt, anim_mt)

local s = textures.image('maps/dessert/thorn_animal.png')

thorn_animal_mt.anims = {}

thorn_animal_mt.anims['idledown'] = {
	{ s = s, x =   0, y = 360, w = 120, h = 120, t = 10 }
}

thorn_animal_mt.anims['idleup'] = {
	{ s = s, x =   0, y = 240, w = 120, h = 120, t = 10 }
}

thorn_animal_mt.anims['idleleft'] = {
	{ s = s, x =   0, y =   0, w = 120, h = 120, t = 10 }
}

thorn_animal_mt.anims['idleright'] = {
	{ s = s, x =   0, y = 120, w = 120, h = 120, t = 10 }
}

thorn_animal_mt.anims['walkdown'] = {
	{ s = s, x =   0, y = 360, w = 120, h = 120, t = 10 },
	{ s = s, x = 120, y = 360, w = 120, h = 120, t = 10 }
}

thorn_animal_mt.anims['walkup'] = {
	{ s = s, x =   0, y = 240, w = 120, h = 120, t = 10 },
	{ s = s, x = 120, y = 240, w = 120, h = 120, t = 10 }
}

thorn_animal_mt.anims['walkleft'] = {
	{ s = s, x =   0, y =   0, w = 120, h = 120, t = 10 },
	{ s = s, x = 120, y =   0, w = 120, h = 120, t = 10 }
}

thorn_animal_mt.anims['walkright'] = {
	{ s = s, x =   0, y = 120, w = 120, h = 120, t = 10 },
	{ s = s, x = 120, y = 120, w = 120, h = 120, t = 10 }
}

return thorn_animal_mt

