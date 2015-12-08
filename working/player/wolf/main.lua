local textures       = require('res.textures')
local anim           = require('eng.anim')
local player_factory = require('player.factory')

local sprite = textures.image('player/wolf/kurock-wolf.png')

local idlefront = anim.create()
idlefront:addframe{ sprite = sprite, x = 0, y = 0, w = 80, h = 120, t = 8 }

local idleback = anim.create()
idleback:addframe{ sprite = sprite, x = 0, y = 120, w = 80, h = 120, t = 8 }

local idleleft = anim.create()
idleleft:addframe{ sprite = sprite, x = 0, y = 360, w = 80, h = 120, t = 8 }

local idleright = anim.create()
idleright:addframe{ sprite = sprite, x = 0, y = 240, w = 80, h = 120, t = 8 }

local walkleft = anim.create()
walkleft:addframe{ sprite = sprite, x =   0, y = 360, w = 80, h = 120, t = 8 }
walkleft:addframe{ sprite = sprite, x =  80, y = 360, w = 80, h = 120, t = 8 }
walkleft:addframe{ sprite = sprite, x = 160, y = 360, w = 80, h = 120, t = 8 }

local walkright = anim.create()
walkright:addframe{ sprite = sprite, x =   0, y = 240, w = 80, h = 120, t = 8 }
walkright:addframe{ sprite = sprite, x =  80, y = 240, w = 80, h = 120, t = 8 }
walkright:addframe{ sprite = sprite, x = 160, y = 240, w = 80, h = 120, t = 8 }

local walkfront = anim.create()
walkfront:addframe{ sprite = sprite, x =   0, y = 0, w = 80, h = 120, t = 8 }
walkfront:addframe{ sprite = sprite, x =  80, y = 0, w = 80, h = 120, t = 8 }
walkfront:addframe{ sprite = sprite, x = 160, y = 0, w = 80, h = 120, t = 8 }

local walkback = anim.create()
walkback:addframe{ sprite = sprite, x =   0, y = 120, w = 80, h = 120, t = 8 }
walkback:addframe{ sprite = sprite, x =  80, y = 120, w = 80, h = 120, t = 8 }
walkback:addframe{ sprite = sprite, x = 160, y = 120, w = 80, h = 120, t = 8 }

local player = player_factory.create({
	h         = 120,
	w         = 80,
	idleleft  = idleleft:loop(),
	idleright = idleright:loop(),
	idlefront = idlefront:loop(),
	idleback  = idleback:loop(),
	walkleft  = walkleft:loop(),
	walkright = walkright:loop(),
	walkfront = walkfront:loop(),
	walkback  = walkback:loop()
})

return player

