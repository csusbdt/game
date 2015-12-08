local player   = require('player.wolf.main')
local camera   = require('eng.camera')

local tiler_mt = {
}
tiler_mt.__index = tiler_mt;

function tiler_mt:draw()
	local tw = self.t.w
	local th = self.t.h

	-- Find the upper left point of the tile containing the camera.
	local left = math.modf(camera.x / tw) * tw
	local top  = math.modf(camera.y / th) * th
	local x, y = camera.screen(left, top)
	self.t:draw(x - tw, y - th)
	self.t:draw(x - tw, y)
	self.t:draw(x - tw, y + th)
	self.t:draw(x     , y - th)
	self.t:draw(x     , y)
	self.t:draw(x     , y + th)
	self.t:draw(x + tw, y - th)
	self.t:draw(x + tw, y)
	self.t:draw(x + tw, y + th)
end

local function create(texture) 
	local tiler = {
		t = texture
	}
	setmetatable(tiler, tiler_mt)
	return tiler
end

return {
	create = create
}

