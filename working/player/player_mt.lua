local input    = require('util.input')
local camera   = require('util.camera')
local anim_mt  = require('util.anim_mt')

local player_mt = {
	x = 0, 
	y = 0,
	w = 0, 
	h = 0,
	x_speed = 6, 
	y_speed = 6
}
player_mt.__index = player_mt

setmetatable(player_mt, anim_mt)

function player_mt:update()
	local dx = 0
	local dy = 0
	if input.is_w_key_down() and not input.is_s_key_down() then dy = -self.y_speed end
	if input.is_s_key_down() and not input.is_w_key_down() then dy =  self.y_speed end
	if input.is_a_key_down() and not input.is_d_key_down() then dx = -self.x_speed end
	if input.is_d_key_down() and not input.is_a_key_down() then dx =  self.x_speed end
	if dx == 0 and dy == 0 then
		if     self.anim == 'walkleft'  then self:loop('idleleft')
		elseif self.anim == 'walkright' then self:loop('idleright')
		elseif self.anim == 'walkup'    then self:loop('idleup')
		elseif self.anim == 'walkdown'  then self:loop('idledown')  end
	end
	if     dx < 0                      then self:loop('walkleft')
	elseif dx > 0                      then self:loop('walkright')
	elseif dy < 0                      then self:loop('walkup')
	elseif dy > 0                      then self:loop('walkdown')
	elseif self.anim == 'walkleft'     then self:loop('idleleft')
	elseif self.anim == 'walkright'    then self:loop('idleright')
	elseif self.anim == 'walkback'     then self:loop('idleup')
	elseif self.anim == 'walkfront'    then self:loop('idledown')  end
	self.y = self.y + dy
	self.x = self.x + dx
end

return player_mt

