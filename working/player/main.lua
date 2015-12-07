local textures  = require('res.textures')
local anim      = require('eng.anim')
local input     = require('eng.input')

local sprite = textures.image('player/kurock-wolf.png')

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

local player_mt = {
	x = 100, y = 100,
	w = 0, y = 0,
	x_speed = 6, y_speed = 6
}
player_mt.__index = player_mt

--function player_mt:intersects(o)
--	return 	o.x < self.x + self.w / 2 and self.x + self.w / 2 < o.x + o.w and 
--		o.y < self.y + self.h / 2 and self.y + self.h / 2 < o.y + o.h 
--end

function player_mt:update()
	local dx = 0
	local dy = 0
	if input.is_w_key_down() and not input.is_s_key_down() then dy = -self.y_speed end
	if input.is_s_key_down() and not input.is_w_key_down() then dy =  self.y_speed end
	if input.is_a_key_down() and not input.is_d_key_down() then dx = -self.x_speed end
	if input.is_d_key_down() and not input.is_a_key_down() then dx =  self.x_speed end
	if dx == 0 and dy == 0 then
		if     self.anim == self.walkleft  then self.anim = self.idleleft 
		elseif self.anim == self.walkright then self.anim = self.idleright
		elseif self.anim == self.walkback  then self.anim = self.idleback
		elseif self.anim == self.walkfront then self.anim = self.idlefront end
	end
	if     dx < 0                      then self.anim = self.walkleft
	elseif dx > 0                      then self.anim = self.walkright
	elseif dy < 0                      then self.anim = self.walkback
	elseif dy > 0                      then self.anim = self.walkfront
	elseif self.anim == self.walkleft  then self.anim = self.idleleft 
	elseif self.anim == self.walkright then self.anim = self.idleright
	elseif self.anim == self.walkback  then self.anim = self.idleback
	elseif self.anim == self.walkfront then self.anim = self.idlefront end
	self.y = self.y + dy
	self.x = self.x + dx
end

function player_mt:draw(camera)
	local x, y = camera:screen(self.x, self.y)
	self.anim(x, y)
end

local function create(o)
	local o = o or {}
	setmetatable(o, player_mt)
	o.h = 120
	o.w = 80
	o.idleleft  = idleleft:loop()
	o.idleright = idleright:loop()
	o.idlefront = idlefront:loop()
	o.idleback  = idleback:loop()
	o.walkleft  = walkleft:loop()
	o.walkright = walkright:loop()
	o.walkfront = walkfront:loop()
	o.walkback  = walkback:loop()
	o.anim      = o.idlefront
	return o
end

return {
	create = create
}

