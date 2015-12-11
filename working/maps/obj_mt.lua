local textures = require('res.textures')
local camera   = require('eng.camera')

local obj_mt = {}
obj_mt.__index = obj_mt

function obj_mt:draw()
	local x, y = camera.screen(self.x, self.y)
	--self.t:draw(self.tx, self.ty, self.tw, self.th, x - self.tw / 2, y - self.th / 2)
	self.t:draw(self.tx, self.ty, self.tw, self.th, x, y)
end

return obj_mt

