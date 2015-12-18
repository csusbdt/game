local textures  = require('res.textures')
local af        = require('util.anim_factory')
local player_mt = require('player.player_mt')

local kurock_player_mt = {}

local s = textures.image('player/kurock/kurock-wolf.png')

kurock_player_mt.anims = {}
kurock_player_mt.__index = kurock_player_mt

setmetatable(kurock_player_mt, player_mt)

kurock_player_mt.w = 80
kurock_player_mt.h = 120

kurock_player_mt.anims['idledown'] = {
	{ s = s, x =   0, y =   0, w = 80, h = 120, t = 8 }
}

kurock_player_mt.anims['idleup'] = {
	{ s = s, x =   0, y = 120, w = 80, h = 120, t = 8 }
}

kurock_player_mt.anims['idleleft'] = {
	{ s = s, x =   0, y = 360, w = 80, h = 120, t = 8 }
}

kurock_player_mt.anims['idleright'] = {
	{ s = s, x =   0, y = 240, w = 80, h = 120, t = 8 }
}

kurock_player_mt.anims['walkdown'] = {
	{ s = s, x =   0, y =   0, w = 80, h = 120, t = 8 },
	{ s = s, x =  80, y =   0, w = 80, h = 120, t = 8 },
	{ s = s, x = 160, y =   0, w = 80, h = 120, t = 8 }
}

kurock_player_mt.anims['walkup'] = {
	{ s = s, x =   0, y = 120, w = 80, h = 120, t = 8 },
	{ s = s, x =  80, y = 120, w = 80, h = 120, t = 8 },
	{ s = s, x = 160, y = 120, w = 80, h = 120, t = 8 }
}

kurock_player_mt.anims['walkleft'] = {
	{ s = s, x =   0, y = 360, w = 80, h = 120, t = 8 },
	{ s = s, x =  80, y = 360, w = 80, h = 120, t = 8 },
	{ s = s, x = 160, y = 360, w = 80, h = 120, t = 8 }
}

kurock_player_mt.anims['walkright'] = {
	{ s = s, x =   0, y = 240, w = 80, h = 120, t = 8 },
	{ s = s, x =  80, y = 240, w = 80, h = 120, t = 8 },
	{ s = s, x = 160, y = 240, w = 80, h = 120, t = 8 }
}

return kurock_player_mt

