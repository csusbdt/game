local camera    = require('util.camera')

local npc_mt = {
	x = 0, 
	y = 0
}
npc_mt.__index = npc_mt

function npc_mt:draw()
	local x, y = camera.screen(self.x, self.y)
	self.anim(x, y)
end

return npc_mt

