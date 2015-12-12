local textures = require('res.textures')
local camera   = require('eng.camera')

local obj_mt = {}
obj_mt.__index = obj_mt

function obj_mt:draw()
	local x, y = camera.screen(self.x, self.y)
	self.t:draw(self.tx, self.ty, self.tw, self.th, x, y)
end

function obj_mt:gpos()
	local gx = math.modf(self.x / 32)
	local gy = math.modf(self.y / 32)
	return gx, gy
end

return obj_mt

