local input     = require('eng.input')
local camera    = require('eng.camera')

local player_mt = {
	x = 0, 
	y = 0,
	w = 0, 
	h = 0,
	x_speed = 6, 
	y_speed = 6
}
player_mt.__index = player_mt

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

function player_mt:draw()
	local x, y = camera.screen(self.x, self.y)
	self.anim(x, y)
end

return player_mt

