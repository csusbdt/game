local textures  = require('res.textures')
local anim_mt   = require('util.anim_mt')

local thorn_animal_mt = {}
thorn_animal_mt.__index = thorn_animal_mt
setmetatable(thorn_animal_mt, anim_mt)

local s = textures.image('maps/dessert/thorn_animal.png')

thorn_animal_mt.anims = {}

thorn_animal_mt.anims['idledown'] = {
	{ s = s, x =   0, y =   0, w = 64, h = 64, t = 8 }
}

thorn_animal_mt.anims['idleup'] = {
	{ s = s, x =   0, y =   0, w = 64, h = 64, t = 8 }
}

thorn_animal_mt.anims['idleleft'] = {
	{ s = s, x =   0, y =   0, w = 64, h = 64, t = 8 }
}

thorn_animal_mt.anims['idleright'] = {
	{ s = s, x =   0, y =   0, w = 64, h = 64, t = 8 }
}

thorn_animal_mt.anims['walkdown'] = {
	{ s = s, x =   0, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x =  64, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 128, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 192, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 128, y =   0, w = 64, h = 64, t = 8 }
}

thorn_animal_mt.anims['walkup'] = {
	{ s = s, x =   0, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x =  64, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 128, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 192, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 128, y =   0, w = 64, h = 64, t = 8 }
}

thorn_animal_mt.anims['walkleft'] = {
	{ s = s, x =   0, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x =  64, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 128, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 192, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 128, y =   0, w = 64, h = 64, t = 8 }
}

thorn_animal_mt.anims['walkright'] = {
	{ s = s, x =   0, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x =  64, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 128, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 192, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 128, y =   0, w = 64, h = 64, t = 8 }
}

return thorn_animal_mt

