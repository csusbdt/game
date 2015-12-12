local textures  = require('res.textures')
local af        = require('util.anim_factory')
local pf        = require('player.factory')

local s = textures.image('player/wolf/kurock-wolf.png')

local idlefront = af.create({
	{ s = s, x =   0, y =   0, w = 80, h = 120, t = 8 }
})

local idleback = af.create({
	{ s = s, x =   0, y = 120, w = 80, h = 120, t = 8 }
})

local idleleft = af.create({
	{ s = s, x =   0, y = 360, w = 80, h = 120, t = 8 }
})

local idleright = af.create({
	{ s = s, x =   0, y = 240, w = 80, h = 120, t = 8 }
})

local walkleft = af.create({
	{ s = s, x =   0, y = 360, w = 80, h = 120, t = 8 },
	{ s = s, x =  80, y = 360, w = 80, h = 120, t = 8 },
	{ s = s, x = 160, y = 360, w = 80, h = 120, t = 8 }
})

local walkright = af.create({
	{ s = s, x =   0, y = 240, w = 80, h = 120, t = 8 },
	{ s = s, x =  80, y = 240, w = 80, h = 120, t = 8 },
	{ s = s, x = 160, y = 240, w = 80, h = 120, t = 8 }
})

local walkfront = af.create({
	{ s = s, x =   0, y =   0, w = 80, h = 120, t = 8 },
	{ s = s, x =  80, y =   0, w = 80, h = 120, t = 8 },
	{ s = s, x = 160, y =   0, w = 80, h = 120, t = 8 }
})

local walkback = af.create({
	{ s = s, x =   0, y = 120, w = 80, h = 120, t = 8 },
	{ s = s, x =  80, y = 120, w = 80, h = 120, t = 8 },
	{ s = s, x = 160, y = 120, w = 80, h = 120, t = 8 }
})

local player = pf.create({
	h         = 120              ,
	w         = 80               ,
	idleleft  = idleleft:loop()  ,
	idleright = idleright:loop() ,
	idlefront = idlefront:loop() ,
	idleback  = idleback:loop()  ,
	walkleft  = walkleft:loop()  ,
	walkright = walkright:loop() ,
	walkfront = walkfront:loop() ,
	walkback  = walkback:loop()
})

return player

